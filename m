Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A0D200850
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 14:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732855AbgFSMEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 08:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732853AbgFSME3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 08:04:29 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509DCC06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 05:04:28 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so8219944wmj.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KS+xgGiu4reqWu9ZkdrM3YZnT7jWjFWO57RJ5OWuTSI=;
        b=DtJiEmCqkXekdqQSbNAj09lmMdfRM5aSbLXOPM2Qhj23YzlfDX1jrsXN8GbdBvLKRA
         OKtlHGGRRKKFtXfMmfThXyNogdrzW4eQ2gfU2gvClCCkACasjco4P5OkXkZMnEqo4I6m
         FPIA6gNwNsQzYFEKtd1OhG+MJfOIkfooW89QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KS+xgGiu4reqWu9ZkdrM3YZnT7jWjFWO57RJ5OWuTSI=;
        b=Z/ts6jZvE+2zFl7u00+aL79rkK51O5NDmTnSwzjAFx3OQ7dPXjHF5US4HpdvL/AwRF
         35xC0fZIuLg7Jaxcnsc31s3XuQX1xfWtGoTWHTpkx4A6i/AYx7uXtNAAl6aYmf7K7Ha2
         IMEmePmAOUEOSm7n5VN2NBjyAlbQfIMVTm4m8qlM+M5N7080wWtJfgQzYP04dpCSja4W
         ERNcxfkrEyea3qcgiyuULu7VpoJcyiR/5t+jcdb+VNkmMF4wrYkCNkMqLOvuKbdpR7y9
         8Whloo78E4FFBWDUd4nSv/H1uHGiAsUFXyaeRL64cyR5FLR2tGzAFeOqMTctc10aQybi
         6zrA==
X-Gm-Message-State: AOAM530pObQaNHA2vX0MmPhqpyynFOe+iBM3aj/prKo1p9cMXx6U651k
        UKSA2gG4iijwOHZgnPHPBgiuEg==
X-Google-Smtp-Source: ABdhPJzaTGL7AWLQpE5OqyHn4N1qE+gUsyQ9Tbeg8ks9m7xsEMBCzoXPk951voCPcvnOWVXDGg/GbA==
X-Received: by 2002:a1c:1b13:: with SMTP id b19mr3343058wmb.84.1592568266908;
        Fri, 19 Jun 2020 05:04:26 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id l17sm4951658wmh.14.2020.06.19.05.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 05:04:26 -0700 (PDT)
Date:   Fri, 19 Jun 2020 12:04:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
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
Subject: Re: [PATCH v2 3/4] media: staging: rkisp1: rsz: set output format to
 YUV422 if cap format is YUV444
Message-ID: <20200619120425.GA241696@chromium.org>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
 <CAHD77HkjjWMOcX3oLnzdMuzZM-_NSydStnzLLcHEFRenL23d-A@mail.gmail.com>
 <aa52f9f8-d9e9-06b2-22df-bbab2d26b516@collabora.com>
 <20200618174752.GA10831@chromium.org>
 <9ee01443-985d-751c-fff9-fa90337de68d@collabora.com>
 <20200618181220.GC10831@chromium.org>
 <f1660285-f6cb-6157-1e56-2974bc549fef@collabora.com>
 <20200618191857.GC73379@chromium.org>
 <09b87404-b106-f58b-b773-cf4c344648df@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09b87404-b106-f58b-b773-cf4c344648df@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 09:30:50AM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 18.06.20 21:18, Tomasz Figa wrote:
> > On Thu, Jun 18, 2020 at 08:50:23PM +0200, Dafna Hirschfeld wrote:
> > > 
> > > 
> > > On 18.06.20 20:12, Tomasz Figa wrote:
> > > > On Thu, Jun 18, 2020 at 08:00:37PM +0200, Dafna Hirschfeld wrote:
> > > > > 
> > > > > 
> > > > > On 18.06.20 19:47, Tomasz Figa wrote:
> > > > > > On Fri, Jun 12, 2020 at 02:45:00PM +0200, Dafna Hirschfeld wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 27.05.20 01:09, Tomasz Figa wrote:
> > > > > > > > On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> > > > > > > > <dafna.hirschfeld@collabora.com> wrote:
> > > > > > > > > 
> > > > > > > > > If the capture format is YUV444M then the memory input format
> > > > > > > > > should be YUV422, so the resizer should not change the default
> > > > > > > > > hdiv, vdiv in that case.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
> > > > > > > > >      1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > > > index 04a29af8cc92..5f9740ddd558 100644
> > > > > > > > > --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > > > +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > > > @@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> > > > > > > > >              * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
> > > > > > > > >              * streams should be set according to the pixel format in the capture.
> > > > > > > > >              * The resizer always gets the input as YUV422. If the capture format
> > > > > > > > > -        * is RGB then the memory input (the resizer output) should be YUV422
> > > > > > > > > -        * so we use the hdiv, vdiv of the YUV422 info in this case.
> > > > > > > > > +        * is RGB or YUV444 then the memory input (the resizer output) should
> > > > > > > > > +        * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
> > > > > > > > >              */
> > > > > > > > > -       if (v4l2_is_format_yuv(cap->pix.info)) {
> > > > > > > > > +       if (v4l2_is_format_yuv(cap->pix.info) &&
> > > > > > > > > +           cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
> > > > > > > > >                     src_c.width = cap->pix.info->hdiv;
> > > > > > > > >                     src_c.height = cap->pix.info->vdiv;
> > > > > > > > 
> > > > > > > > As pointed out in another thread, this should have been the original
> > > > > > > > size divided by the divisor and not just the latter alone.
> > > > > > > > 
> > > > > > > > It seems a bit suspicious to me that we don't need to upscale the
> > > > > > > > chroma planes here, because it would mean that the MI itself would be
> > > > > > > > doing some horizontal pixel doubling. The hardware documentation
> > > > > > > > doesn't really explain this, though.
> > > > > > > > 
> > > > > > > > Have you been able to validate that the setting without upscaling
> > > > > > > > indeed produces correct output?
> > > > > > > 
> > > > > > > Hi,
> > > > > > > I investigated it again, without this patch, the frames on mainpath for YUV444 look good: https://imgur.com/a/NtazWhY
> > > > > > > but there is a problem on selfpath: https://imgur.com/a/vQJPqAn
> > > > > > > 
> > > > > > > This patch somehow solves the problem on selfpath but ruins the frames on mainpath.
> > > > > > > 
> > > > > > > I think the bug is actually in another place in the code. The function 'rkisp1_sp_config'
> > > > > > > sets a constant value RKISP1_MI_CTRL_SP_INPUT_YUV422 as the input format on the RKISP1_CIF_MI_CTRL register.
> > > > > > > But the value should be set according to the configuration. For some reason the problem arises only
> > > > > > > when trying to capture yuv444. When I capture yuv420 on the selfpath the frame looks good although the
> > > > > > > value RKISP1_MI_CTRL_SP_INPUT_YUV422 is set.
> > > > > > > Setting the the SP_INPUT_* according to the configuration seems to solve the problem.
> > > > > > 
> > > > > > Looking at the datasheet, SP seems to have some internal format
> > > > > > conversion capability - one can set SP_OUTPUT_FORMAT and SP_INPUT_FORMAT
> > > > > > to different YUV subsampling modes or even some RGB formats. MP doesn't
> > > > > > have this capability - it can only write whatever it receives.
> > > > > > 
> > > > > > I think this needs to be reflected in the driver, if it isn't yet.
> > > > > > Depending on the resizer source format, the MP video node must allow
> > > > > > only formats with matching subsampling mode.
> > > > > 
> > > > > Hi,
> > > > > I work on v3 now that does that, it supports several yuv mbus codes on the source pads of the resizers
> > > > > and then in the link_validation callback of the capture it checks that the subsampling matches.
> > > > 
> > > > Is it enough? I believe the principle is that within the same entity the
> > > > state needs to stay consistent, i.e. if the sink pad changes, the source
> > > > pad or video node must be updated to expose only correct formats,
> > > > including resetting the current format.
> > > Yes, but video devices have only a sink pad. Also, the sink pad of
> > > a video device is not associated with an mbus code. The video format configuration
> > > is not related to the media controller API.
> > 
> > The video device interface and the entity it is linked to belong to the
> > same driver. The V4L2 video device interface requires that the state is
> > always valid and the implementation of the video device needs to take
> > into account its links to external entities.
> 
> But if the pad on the other side of the link is configured after the video device
> then the state might become invalid.

The pad on the other side of the link is already outside of the scope.
Basically, the entity that interfaces with the video node must have
state consistent with the video node.

To make sure we're on the same page, let me give some examples below:

Initial state:
ISP source pad: YUV 4:2:2
Resizer sink pad: YUV 4:2:2
Resizer source pad: YUV 4:2:0
Video CAPTURE format: NV12

Scenario 1:
- Userspace changes ISP source pad to RAW.
- Userspace starts streaming and link validation fails.
- Still, the state is consistent between the resizer and the video node.

Scenario 2:
- Userspace changes ISP source pad to RAW.
- Userspace changes Resizer sink pad to RAW.
- Kernel updates Resizer source pad to RAW.
- Kernel updates video CAPTURE format to a supported RAW pixelformat.
- All the state is consistent and streaming can start.
- If the userspace calls ENUM_FMT on video CAPTURE, it only gets RAW
  pixelformats.

Scenario 3:
- Userspace changes Resizer source pad to YUV 4:2:2.
- Kernel updates video CAPTURE to a supported YUV 4:2:2 pixelformat
  (e.g. YUYV).
- All the state is consistent and streaming can start.
- If the userspace calls ENUM_FMT on video CAPTURE, it only gets YUV
  4:2:2 pixelformats.

Scenario 4:
- Userspace calls ENUM_FMT on video CAPTURE and only gets YUV 4:2:0
  pixelformats.
- It's not possible to make the state inconsistent between the resizer
  and the video node by using V4L2 video ioctls.

Am I missing something?

Best regards,
Tomasz
