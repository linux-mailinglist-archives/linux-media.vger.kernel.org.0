Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D814369272
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhDWMwg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 23 Apr 2021 08:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbhDWMwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 08:52:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A15C061574
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 05:51:59 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lZvHp-0005Fm-U2; Fri, 23 Apr 2021 14:51:57 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lZvHp-00053a-ET; Fri, 23 Apr 2021 14:51:57 +0200
Message-ID: <9298701d11e591e23b7438d9ed027a56f129a0f1.camel@pengutronix.de>
Subject: Re: [bug report] media: coda: jpeg: add CODA960 JPEG encoder support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
Date:   Fri, 23 Apr 2021 14:51:57 +0200
In-Reply-To: <YIKzER9cE+h0kI2l@mwanda>
References: <YIKzER9cE+h0kI2l@mwanda>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Fri, 2021-04-23 at 14:44 +0300, Dan Carpenter wrote:
> Hello Philipp Zabel,
> 
> The patch 96f6f62c4656: "media: coda: jpeg: add CODA960 JPEG encoder
> support" from Dec 12, 2019, leads to the following static checker
> warning:
> 
> 	drivers/media/platform/coda/coda-jpeg.c:621 coda9_jpeg_gen_enc_huff_tab()
> 	warn: check that incremented offset 'k' is capped

Thank you for the report!

> drivers/media/platform/coda/coda-jpeg.c
>    582  static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
>    583                                         int *ehufsi, int *ehufco)
>    584  {
>    585          int i, j, k, lastk, si, code, maxsymbol;
>    586          const u8 *bits, *huffval;
>    587          struct {
>    588                  int size[256];
>    589                  int code[256];
>    590          } *huff;
>    591          static const unsigned char *huff_tabs[4] = {
>    592                  luma_dc, luma_ac, chroma_dc, chroma_ac,
>    593          };
>    594          int ret = -EINVAL;
>    595  
>    596          huff = kzalloc(sizeof(*huff), GFP_KERNEL);
> 
> huff->size[] is a 256 byte array of zero.

int, not byte. It's does contain all zeros though, as does the following
huff->code[].

>    597          if (!huff)
>    598                  return -ENOMEM;
>    599  
>    600          bits = huff_tabs[tab_num];
>    601          huffval = huff_tabs[tab_num] + 16;
>    602  
>    603          maxsymbol = tab_num & 1 ? 256 : 16;
>    604  
>    605          /* Figure C.1 - Generation of table of Huffman code sizes */
>    606          k = 0;
>    607          for (i = 1; i <= 16; i++) {
>    608                  j = bits[i - 1];
>    609                  if (k + j > maxsymbol)
>    610                          goto out;
>    611                  while (j--)
>    612                          huff->size[k++] = i;
>                                 ^^^^^^^^^^^^^^^^^^^
> We're filling potentially up to to maxsymbol (256) with i.

That is correct. Assuming the sum of bits[0..15] is exactly 256, this
code will fill all 256 size[] entries.

In practice the four bits tables from huff_tabs only sum up to 162 at
most, but this may change if we added support for setting the encoder
Huffman tables from userspace.

>    613          }
>    614          lastk = k;
>    615  
>    616          /* Figure C.2 - Generation of table of Huffman codes */
>    617          k = 0;
>    618          code = 0;
>    619          si = huff->size[0];
>    620          while (k < lastk) {
>    621                  while (huff->size[k] == si) {
>                                ^^^^^^^^^^^^^^^^^^^
> I'm not sure I have understood this code, but I think maybe we do need
> to if (k < lastk && huff->size[k] == si) {

So this could indeed overflow size[] in theory.
It would still terminate at &size[256] or &code[0], as code[0] happens
to always contain 0, but your suggestion is correct.

>    622                          huff->code[k++] = code;
>    623                          code++;
>    624                  }
>    625                  if (code >= (1 << si))
>    626                          goto out;
>    627                  code <<= 1;
>    628                  si++;
>    629          }

regards
Philipp
