Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2F354C866
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 14:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348678AbiFOMYG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 15 Jun 2022 08:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345559AbiFOMYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 08:24:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C2439175
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 05:24:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o1S43-00017T-BX; Wed, 15 Jun 2022 14:24:03 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o1S40-000g5N-Hl; Wed, 15 Jun 2022 14:24:01 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o1S40-0006eq-5u; Wed, 15 Jun 2022 14:24:00 +0200
Message-ID: <40e67aa5f4ae19bb0227acdfbd2992943acb6638.camel@pengutronix.de>
Subject: Re: [bug report] media: coda: jpeg: add CODA960 JPEG encoder support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
Date:   Wed, 15 Jun 2022 14:24:00 +0200
In-Reply-To: <YqmWY0MmKWTsAL4D@kili>
References: <YqmWY0MmKWTsAL4D@kili>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Mi, 2022-06-15 at 11:20 +0300, Dan Carpenter wrote:
> Hello Philipp Zabel,
> 
> The patch 96f6f62c4656: "media: coda: jpeg: add CODA960 JPEG encoder
> support" from Dec 12, 2019, leads to the following Smatch static
> checker warning:
> 
> 	drivers/media/platform/chips-media/coda-jpeg.c:622 coda9_jpeg_gen_enc_huff_tab()
> 	warn: check that incremented offset 'k' is capped

Thank you for the report. I think k is currently guaranteed to be
capped, but this depends on the data stored in the luma/chroma_dc/ac
tables.

Which smatch version is this? I didn't get this warning with commit
1a0af070bd4d ("select_type: new check for propagating negatives to u32
to s64").

> drivers/media/platform/chips-media/coda-jpeg.c
>     583 static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
>     584                                        int *ehufsi, int *ehufco)
>     585 {
>     586         int i, j, k, lastk, si, code, maxsymbol;
>     587         const u8 *bits, *huffval;
>     588         struct {
>     589                 int size[256];
>     590                 int code[256];
>     591         } *huff;
>     592         static const unsigned char *huff_tabs[4] = {
>     593                 luma_dc, luma_ac, chroma_dc, chroma_ac,

We use the hardcoded Huffman bit/value tables from from JPEG ITU-T.81,
for example luma_ac:

        0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
        0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d,
	...

The sum of the first 16 values in these tables is either 12 for the _dc
tables or 162 for the _ac tables.

>     594         };
>     595         int ret = -EINVAL;
>     596 
>     597         huff = kzalloc(sizeof(*huff), GFP_KERNEL);
>     598         if (!huff)
>     599                 return -ENOMEM;
>     600 
>     601         bits = huff_tabs[tab_num];

The sum of all 16 values in the bits table is at most 162.


>     602         huffval = huff_tabs[tab_num] + 16;
>     603 
>     604         maxsymbol = tab_num & 1 ? 256 : 16;
>     605 
>     606         /* Figure C.1 - Generation of table of Huffman code sizes */
>     607         k = 0;
>     608         for (i = 1; i <= 16; i++) {
>     609                 j = bits[i - 1];
>     610                 if (k + j > maxsymbol)
>     611                         goto out;
>     612                 while (j--)
>     613                         huff->size[k++] = i;

Here we can increment k only to the sum of bits[0..16], 162 at most.
This leaves huff->size[162..255] set to 0.

huff->size[0] is set to 1.

>     614         }
>     615         lastk = k;
>     616 
>     617         /* Figure C.2 - Generation of table of Huffman codes */
>     618         k = 0;
>     619         code = 0;
>     620         si = huff->size[0];
>     621         while (k < lastk) {
>                        ^^^^^^^^^
> Here we know that k is valid.
> 
> --> 622                 while (huff->size[k] == si) {

This iteration stops at k == 162 at the latest, since si is at least 1
and huff->size[162] == 0.

>     623                         huff->code[k++] = code;
> 
> But this loop iterates through k without checking if k is still valid.
> How do we know that the huff->size[k] check won't read beyond the end
> of the loop?

See above.


regards
Philipp
