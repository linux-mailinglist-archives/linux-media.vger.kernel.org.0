Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5887030C5
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 17:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239748AbjEOPAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 11:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239675AbjEOO77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 10:59:59 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F39173E
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 07:59:57 -0700 (PDT)
Received: from localhost (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7729066031C5;
        Mon, 15 May 2023 15:59:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684162796;
        bh=zcuP5Ib39UdYaG+lgGcUGf2SeO8EWSAkOOkKsg9SaPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aPuZ83rKGFJtsMdldm0fT4K4WW7toI1Wqdw2p3Rid5rMB2TVKuWlWPEzlltGB5wLF
         Y5oMcDUWpqhQwBiByukmb5dQXhbyXjeALhNCJWjmPiwAd6Q/6nFy0IXwPRfqxjFOJA
         nJZ+jZYKwpRWhl0h6QXXfzKsCxvUYpLwtJW7Mf143nzKCpZlO2rvCWu6GKrsCaEXHv
         NCaxXXCLxf3FSfSBbNNVL1CNVgJFYlMTCFmi3T/OWIhy/U04okds+a2K4pzz184TV+
         AiZ1Xc4WivwCKMZ/bzUK5uChnlU9MFESOQoykcjssZi2RRjDBalAUNPHr17eSFk96W
         2SXmHpDQPrxGw==
Date:   Mon, 15 May 2023 07:59:50 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 13/13] media: bttv: convert to vb2
Message-ID: <ZGJAa/0Y1u9gAuoV@db550>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
 <b9c14229f95f8100a2fb17f4991163b513ad8691.1682995256.git.deborah.brouwer@collabora.com>
 <3286f56e-012b-44bd-b3dd-9b91a24d1a8c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3286f56e-012b-44bd-b3dd-9b91a24d1a8c@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 11, 2023 at 05:29:14PM +0200, Hans Verkuil wrote:
> Hi Deb,
> 
> When testing this I was wondering why the sequence counter didn't detect dropped
> frames (which happens when you start/stop a vbi stream while streaming video).
> 
> On 02/05/2023 05:27, Deborah Brouwer wrote:
> > -static void bttv_field_count(struct bttv *btv)
> > -{
> > -	int need_count = 0;
> > -
> > -	if (btv->users)
> > -		need_count++;
> > -
> > -	if (need_count) {
> > -		/* start field counter */
> > -		btor(BT848_INT_VSYNC,BT848_INT_MASK);
> > -	} else {
> > -		/* stop field counter */
> > -		btand(~BT848_INT_VSYNC,BT848_INT_MASK);
> > -		btv->field_count = 0;
> > -	}
> > -}
> 
> This is the root cause: this function is used to turn on VSYNC interrupts
> and in the interrupt handler the field_count is incremented.
> 
> In the vb1 version of this driver this field_count is passed on to vb1, which
> uses it to set the sequence counter to field_count / 2.
> 
> By removing this function the VSYNC irq is never enabled and so field_count is
> always 0. So I think in bttv the seqnr field should be dropped and the field_count
> mechanism re-instated.
> 
> Comparing the number of dropped frames when starting/stopping vbi it looks like
> in both cases (vb1 and vb2) one frame is dropped when starting vbi. But when
> stopping vbi no frames are dropped in the vb1 case, but 3 in the vb2 case.

Ok, I used btv->field_count >> 1 to set the sequence numbers and I added VSYNC to
the interrupt mask when start_streaming() is called. I can see the dropped video frames
in v4l2-ctl when vbi starts and stops (or vice versa), but I am not sure if this means
that we are actually dropping any valid, captured pixels.

The internal FIELD change signal (even/odd) that is picked up by VSYNC seems to run
independently from capturing. For example, out of curiosity, I added VSYNC to the
interrupt mask at probe, and it starts to increment field_count (and so the sequence
numbers) immediately and continuously even though capture isn't enabled.

So I am wondering if field_count is a totally reliable way to assign sequence numbers
to the buffers. For example, using field_count, the buffer sequence numbers start with
3 instead of 0 in both vb1 and vb2 (sometimes it starts at 2 in vb2).
Maybe the reason for this is that the field signal (even/odd) continues to be sent while
the captured pixels are being input into the chip's FIFO buffer. The FIFO buffer is
preparing the pixels for output by adding the timing/control
information but hasn't yet made them available to be picked up by the DMA controller for
output to memory. So, there is a disconnect, when streaming starts, between field_count
(which keeps incrementing) and the actual availability of pixels.

Maybe there is a similar disconnect happening when vbi starts or stops. Instead of actually
dropping pixels what we really have is just a delay in the RISC program that has to cycle
through its instructions. vb2 has made this a bit worse when streaming stops because we wait
for all the buffers to finish. I will investigate more if there is an easy way to fix this in vb2
without changing the RISC program.

> 
> Another thing I discovered is that for PAL the vcr_hack control has to be enabled,
> otherwise the video is full of glitches. This was present before your series, and
> happens even with a video signal from a proper PAL video generator, so this is really
> strange. I can't remember that I needed this in the past, but it has been years
> since I last tested it.
> 
> PAL capture is fine for Top/Bottom/Alternate settings, it only fails for Interlaced
> and Sequential Top/Bottom capture modes.

Interesting to know that this happened in your tests also.
Obviously the easy solution would be just to enable the vcr_hack by default.
It removes the last four scan lines and so prevents the risc program
counter from getting stuck at a buffer memory address (which definitely
causes dropped frames) instead of returning to the main risc program address.

> 
> When I have more time I will dig into this a bit more.
> 
> Regards,
> 
> 	Hans
