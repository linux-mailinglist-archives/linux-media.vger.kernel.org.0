Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151FD45DDF0
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356254AbhKYPwr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348011AbhKYPuk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:50:40 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D85C06175F
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:41:09 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id m25so6423855qtq.13
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FuDCLMnZBcG4FXTRkAszIGwlmrXUvRfGWOLMCeO71r4=;
        b=bXR88lw6LhPPgAj95Af7RQ3lMoQa/7QnY5KgsSf2wLn5Ddu9/ssuMn2l/td39RVEIb
         4v7Oi/qiWyJJZDGAg6wzKKJrOyB8i7GE2EjN9Oun8j7+piRbo+bUZXoY3rn0cF0esrSI
         gxYh/FDRYGyCFu3CjIY1jI2rMzqQa1wi4thijh0d4JhwwcC1otAA4pdzvVdtzgCWSB5h
         bC1pEynddVfYbKyWU/9F7iSEPK3q0F9MT/gDy3k/dCc0UdUDfNTJyaUF9oP1XXHhR9iH
         /RoQRNek3++ONIY6C2j0NRb/LnMwTItrAKbeZcIYBLofV/RFm4ZznjWbnW0b9/LvxkHE
         exKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FuDCLMnZBcG4FXTRkAszIGwlmrXUvRfGWOLMCeO71r4=;
        b=oRF+GQkiDSUCjoEJrtIsASEkpqYc6vQ0fCSJ88YpU/fsCX3ieNzGpBZYdoK5z1wNun
         jdCr/lkCcj1jVO2VtUa2D10O90JShncpLk0PJThEW74FrwBbF8pWDMvgBMtptlDdG0TA
         WJmoqUhZYXAR9/+690ebOvLJGiAtxhfau3ZXF/rrFuteH2jko5CdDOM1SODUki0ls+5T
         AVVUTBK9guBGDqUhkTIqOGozkR6jwNMKJ6KSBjcALlNefCPGV3y+HUzBQGiJL6wi70gY
         aiAy5rg1B0m30kqPJzgQGqLPA06KeUMvgjNjnqkBcuRSlRtFzo6znd+gv8Mvk/72UlC9
         FzcQ==
X-Gm-Message-State: AOAM530fmTQpy93iFzFeV1IoQi0uZNPrpQsKsVX1ZN2jXqGYRFgHB+L3
        vJmj2GAbgLFs4GpIvHm1IELfGg==
X-Google-Smtp-Source: ABdhPJwtFMy/514J4UaQ0/ybTKHlbOITeEKfMCQ7UenTYDSOaJPjLAG9D4Wac2FvXHGB65/bJM8mVQ==
X-Received: by 2002:a05:622a:1045:: with SMTP id f5mr18225139qte.319.1637854868860;
        Thu, 25 Nov 2021 07:41:08 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y18sm1666411qkp.120.2021.11.25.07.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:41:08 -0800 (PST)
Message-ID: <ae2fa5b455fce8f159e02b3156800b162e424a21.camel@ndufresne.ca>
Subject: Re: [PATCH] media: hantro: Hook up RK3399 JPEG encoder output
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Thu, 25 Nov 2021 10:41:07 -0500
In-Reply-To: <41d75ec1-b3b6-b991-33f0-7188869eb59c@xs4all.nl>
References: <20211119074654.470729-1-wenst@chromium.org>
         <5d23258a954eb0076cacf89d6c88b5e6ef13695f.camel@ndufresne.ca>
         <CAGXv+5Gf-gsB7JXnLiZF_R=0RdxXS7CDZaFftyZ+aESXLXy1Ew@mail.gmail.com>
         <85e9830ff0c2ed5eb77ce52ec7fde82a08368a2a.camel@ndufresne.ca>
         <41d75ec1-b3b6-b991-33f0-7188869eb59c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 25 novembre 2021 à 09:44 +0100, Hans Verkuil a écrit :
> On 23/11/2021 20:39, Nicolas Dufresne wrote:
> > Le lundi 22 novembre 2021 à 11:57 +0800, Chen-Yu Tsai a écrit :
> > > On Sat, Nov 20, 2021 at 12:00 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > > 
> > > > Le vendredi 19 novembre 2021 à 15:46 +0800, Chen-Yu Tsai a écrit :
> > > > > The JPEG encoder found in the Hantro H1 encoder block only produces a
> > > > > raw entropy-encoded scan. The driver is responsible for building a JPEG
> > > > > compliant bitstream and placing the entropy-encoded scan in it. Right
> > > > > now the driver uses a bounce buffer for the hardware to output the raw
> > > > > scan to.
> > > > > 
> > > > > In commit e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG
> > > > > codec_ops.done"), the code that copies the raw scan from the bounce
> > > > > buffer to the capture buffer was moved, but was only hooked up for the
> > > > > Hantro H1 (then RK3288) variant. The RK3399 variant was broken,
> > > > > producing a JPEG bitstream without the scan, and the capture buffer's
> > > > > .bytesused field unset.
> > > > > 
> > > > > Fix this by duplicating the code that is executed when the JPEG encoder
> > > > > finishes encoding a frame. As the encoded length is read back from
> > > > > hardware, and the variants having different register layouts, the
> > > > > code is duplicated rather than shared.
> > > > > 
> > > > > Fixes: e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done")
> > > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > ---
> > > > > This was developed on the downstream ChromeOS 5.10 kernel (with a hack
> > > > > for .data_offset) and tested with ChromeOS's jpeg_encode_accelerator_unittest
> > > > > patched to accept non-JFIF JPEG streams (https://crrev.com/c/3291480).
> > > > > 
> > > > > This was then forward-ported to mainline (name and filename changes) and
> > > > > compile tested only.
> > > > 
> > > > Tested with GStreamer on top of 5.16-rc1 from media_stage.git. Not perfect but
> > > > at least the the output it valid. Test command was:
> > > > 
> > > >   gst-launch-1.0 videotestsrc num-buffers=2 ! v4l2jpegenc ! filesink
> > > > location=test.jpg
> > > > 
> > > > Notice that I encode two frames, it seems like the draining flow is broken in
> > > > this driver. GStreamer will queue the frame and issue CMD_START immediately, the
> > > > driver will skip the encode, leaving me with an empty file.
> > > 
> > > The hantro driver doesn't implement ENC_CMD, which IIRC is used for the
> > > draining flow. I guess that's something to fix, since the mem2mem stateful
> > > encoder spec seems to require it. Or does that spec not apply to the JPEG
> > > encoders?
> > 
> > I'm pretty sure its required. But this isn't a regression from this patch.
> 
> I don't think it is required for JPEG encoders today. Each frame is independent of
> any other, so it behaves just like a m2m scaler for example.
> 
> It doesn't hurt to support it, but it shouldn't be necessary for jpeg codecs.

I believe the requirement in the spec is deliberate to avoid making userland
work a night mare. If draining a filled queue requires counting frames on top of
using CMD_STOP, you are duplicating the effort.

I have a strong opinion about this, I believe consistency is key, the frame work
should provide this feature for JPEG decoder/encoder trivially imho and until
then, driver should all support the same draining flow. I'm not going to relax
this in GStreamer.

Nicolas

> 
> If there is a reason why this is needed, then it would likely also be needed for
> m2m devices like scalers.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > > 
> > > > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > 
> > > Thanks!
> > > 
> > > ChenYu
> > 
> 

