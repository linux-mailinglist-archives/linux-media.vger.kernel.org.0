Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC70C1F59B3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgFJRIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgFJRIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:08:38 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8996BC03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:08:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id m21so1914168eds.13
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CPHTRKjoBXL00GIqtlnXPTK9HEWid5C/nfO25utv9/4=;
        b=HbtztV/lXv0WYy93/e6d2BVAQQmesdiw0YWZH42QwugMA0n+Qtih8qLYe1nevmm/TQ
         pIbX1td4FVa492PhVE55QmAo29nKcjw0ZJ6rDRzgpLcKSYULK4fyPqtvwqldsJPGNhWt
         7yklU4R3km3q5k77xMFqhkRxwOwPybptUvnj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CPHTRKjoBXL00GIqtlnXPTK9HEWid5C/nfO25utv9/4=;
        b=ONEo8e9OuCrI1tXfYeKe9mJUnHocQm2RhcUZdfMrkPK252jh6dYHqdk15BW3sgNCco
         NVMRV1adm7IrFRHbmDQP87OzKK3E1zcx872A3lSzlPrDmfOH8/rfOQSZTh3ZGq3dhXOa
         aqwf1H76Wl1/doQznS8NIuBDznCmwzlBzIpmhRcf5JEhtKdZy9wnTpHMWrT5B+MY0zdc
         TKcfIUoU7/Jt5gAIIxOdUYYLdKFjLSh+2asRqS3qFH8IOB8HxZuJ1hnDzMr1b0f/mkLN
         O9nbcBHBuxgx00yUqhgsviysVvTBy1brsIIF3ke4nZpJ4tE1M1LqSTYQ7STP2NLRwXka
         aKoA==
X-Gm-Message-State: AOAM530NaxUKXLwnVtwedWU09mBTc5yx4zFXmc8Snvrb//oNzbM7kmyp
        zJWgeMJ9909tM4GPl9RvZsBHQ/dS6Um+rg==
X-Google-Smtp-Source: ABdhPJyf/nmiFbAoZjJh0XaelbBP1Es0fPTQluQs8gwNp5PTnNyhb31TNQc15d42trh45heYZhpgFQ==
X-Received: by 2002:aa7:d7cc:: with SMTP id e12mr3250685eds.70.1591808915445;
        Wed, 10 Jun 2020 10:08:35 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id b15sm144803edj.37.2020.06.10.10.08.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 10:08:34 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id l11so3159560wru.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:08:34 -0700 (PDT)
X-Received: by 2002:adf:9c12:: with SMTP id f18mr5159319wrc.105.1591808913803;
 Wed, 10 Jun 2020 10:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-3-dafna.hirschfeld@collabora.com> <CAAFQd5CKhgMJJUTCn3cmPmgVORbH7-cxq2p0wmaN14MJJSC5iA@mail.gmail.com>
 <6b3a1844-a1e5-dc38-28ef-1645a78babed@collabora.com>
In-Reply-To: <6b3a1844-a1e5-dc38-28ef-1645a78babed@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 19:08:20 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CkL14sw+5o+n-m7-nAPQt1xu7_gvgNyKfpxJKWuhrmYA@mail.gmail.com>
Message-ID: <CAAFQd5CkL14sw+5o+n-m7-nAPQt1xu7_gvgNyKfpxJKWuhrmYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: staging: rkisp1: rsz: use hdiv, vdiv of
 yuv422 instead of macros
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 7:01 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 27.05.20 00:44, Tomasz Figa wrote:
> > Hi Dafna,
> >
> > On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> >>
> >> The resize block of rkisp1 always get the input as yuv422.
> >> Instead of defining the default hdiv, vdiv as macros, the
> >> code is more clear if it takes the (hv)div from the YUV422P
> >> info. This makes it clear where those values come from.
> >> The patch also adds documentation to explain that.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 25 +++++++++----------
> >>   1 file changed, 12 insertions(+), 13 deletions(-)
> >>
> >
> > Thank you for the effort on improving this driver! Please see my comments below.
> >
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> index d049374413dc..04a29af8cc92 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> @@ -16,9 +16,6 @@
> >>   #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
> >>   #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
> >>
> >> -#define RKISP1_MBUS_FMT_HDIV 2
> >> -#define RKISP1_MBUS_FMT_VDIV 1
> >> -
> >>   enum rkisp1_shadow_regs_when {
> >>          RKISP1_SHADOW_REGS_SYNC,
> >>          RKISP1_SHADOW_REGS_ASYNC,
> >> @@ -361,11 +358,12 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
> >>   static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> >>                                enum rkisp1_shadow_regs_when when)
> >>   {
> >> -       u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
> >>          struct v4l2_rect sink_y, sink_c, src_y, src_c;
> >>          struct v4l2_mbus_framefmt *src_fmt;
> >>          struct v4l2_rect *sink_crop;
> >>          struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
> >> +       const struct v4l2_format_info *yuv422_info =
> >> +               v4l2_format_info(V4L2_PIX_FMT_YUV422P);
> >
> > As I mentioned in another reply, this is a memory format, but we're
> > using it to configure a local (i.e. non-DMA) input.
> >
> >>
> >>          sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
> >>                                              V4L2_SUBDEV_FORMAT_ACTIVE);
> >> @@ -386,8 +384,9 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> >>          src_y.width = src_fmt->width;
> >>          src_y.height = src_fmt->height;
> >>
> >> -       sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
> >> -       sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
> >> +       /* The input format of the resizer is always yuv422 */
> >> +       sink_c.width = sink_y.width / yuv422_info->hdiv;
> >> +       sink_c.height = sink_y.height / yuv422_info->vdiv;
> >
> > I'd honestly go the opposite way and just make it:
> >
> > /* The resizer input is always YUV 4:2:2 and so horizontally subsampled by 2. */
> > sink_c.width = sink_y.width / 2;
> > sink_c.height = sink_y.height;
> >
> >>
> >>          /*
> >>           * The resizer is used not only to change the dimensions of the frame
> >> @@ -395,17 +394,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> >>           * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
> >>           * streams should be set according to the pixel format in the capture.
> >>           * The resizer always gets the input as YUV422. If the capture format
> >> -        * is RGB then the memory input should be YUV422 so we don't change the
> >> -        * default hdiv, vdiv in that case.
> >> +        * is RGB then the memory input (the resizer output) should be YUV422
> >
> > It could be just me, but "memory input" sounds like there was an input
> > DMA involved, which is not the case. How about "Memory Interface
> > input"?
> >
> > Also, if already amending this, I would also fix the overuse of
> > "should". How about the following?
> >
> > "According to the hardware pipeline, the resizer input is always YUV
> > 4:2:2. For YUV formats, the Memory Interface requires its input to be
> > already properly subsampled. We can achieve subsampling factors other
> > than YUV 4:2:2 by scaling the planes appropriately. For RGB formats,
> > the Memory Interface requires YUV 4:2:2 input, so no additional
> > scaling is needed."
> >
> >> +        * so we use the hdiv, vdiv of the YUV422 info in this case.
> >>           */
> >>          if (v4l2_is_format_yuv(cap->pix.info)) {
> >> -               hdiv = cap->pix.info->hdiv;
> >> -               vdiv = cap->pix.info->vdiv;
> >> +               src_c.width = cap->pix.info->hdiv;
> >> +               src_c.height = cap->pix.info->vdiv;
> >> +       } else {
> >
> > How about making it an explicit else if (v4l2_is_format_rgb(...))?
> Actually the right way to deal with YUV downscaling is to support
> MEDIA_BUS_FMT_YUYV8_1_5X8 (which is YUV420) on the src format
> and not to look on what is configured on the capture.

Good point. Since we're dealing with the resizer configuration, it
should be contained within the resizer subdev. My mind was still stuck
with our downstream topology.

Best regards,
Tomasz
