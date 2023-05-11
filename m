Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED3F6FF5F6
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 17:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbjEKP3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 11:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjEKP3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 11:29:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F367BDC
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 08:29:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 874A864F01
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 15:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F06C433D2;
        Thu, 11 May 2023 15:29:15 +0000 (UTC)
Message-ID: <3286f56e-012b-44bd-b3dd-9b91a24d1a8c@xs4all.nl>
Date:   Thu, 11 May 2023 17:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/13] media: bttv: convert to vb2
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
 <b9c14229f95f8100a2fb17f4991163b513ad8691.1682995256.git.deborah.brouwer@collabora.com>
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <b9c14229f95f8100a2fb17f4991163b513ad8691.1682995256.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

When testing this I was wondering why the sequence counter didn't detect dropped
frames (which happens when you start/stop a vbi stream while streaming video).

On 02/05/2023 05:27, Deborah Brouwer wrote:
> -static void bttv_field_count(struct bttv *btv)
> -{
> -	int need_count = 0;
> -
> -	if (btv->users)
> -		need_count++;
> -
> -	if (need_count) {
> -		/* start field counter */
> -		btor(BT848_INT_VSYNC,BT848_INT_MASK);
> -	} else {
> -		/* stop field counter */
> -		btand(~BT848_INT_VSYNC,BT848_INT_MASK);
> -		btv->field_count = 0;
> -	}
> -}

This is the root cause: this function is used to turn on VSYNC interrupts
and in the interrupt handler the field_count is incremented.

In the vb1 version of this driver this field_count is passed on to vb1, which
uses it to set the sequence counter to field_count / 2.

By removing this function the VSYNC irq is never enabled and so field_count is
always 0. So I think in bttv the seqnr field should be dropped and the field_count
mechanism re-instated.

Comparing the number of dropped frames when starting/stopping vbi it looks like
in both cases (vb1 and vb2) one frame is dropped when starting vbi. But when
stopping vbi no frames are dropped in the vb1 case, but 3 in the vb2 case.

Another thing I discovered is that for PAL the vcr_hack control has to be enabled,
otherwise the video is full of glitches. This was present before your series, and
happens even with a video signal from a proper PAL video generator, so this is really
strange. I can't remember that I needed this in the past, but it has been years
since I last tested it.

PAL capture is fine for Top/Bottom/Alternate settings, it only fails for Interlaced
and Sequential Top/Bottom capture modes.

When I have more time I will dig into this a bit more.

Regards,

	Hans
