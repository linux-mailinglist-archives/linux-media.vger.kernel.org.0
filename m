Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2CC33E67F
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 03:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCQCAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 22:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhCQB7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 21:59:44 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97DBC06174A;
        Tue, 16 Mar 2021 18:59:44 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d23so21796plq.2;
        Tue, 16 Mar 2021 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YpcD4sQoTSyU9tD2LNi0KlsdEhl9zYFyAwEsyPsvSTE=;
        b=D73T3mInGWZH+XuSHVjwSrfs0RdAHsojomS5AFwkweHttXqgPzvFJqv1Qr6a4wWCTF
         wvdgfg1IjVKz2CC0PozQ9vvn7VCeidxlDdREq4P6lTxMODmJNuV7BxsABsdP5NJwyDYJ
         75NsAo6xKmizTrX4ztYz0zVAcLuE83k70Z94QfF5cxuyeqAd6bvfXOsYTAo3B/bVf3R2
         EhvV2rXmaVkQM4g3KKeorOvRNnTw0N9H8wRCKl82lmFd5Ou9kGqyyP0qOLRZyZr7y23R
         UJKrjj+DWlvnIaLEgUW8Y5kdQVHX4CEoR6IDypPuoEuKgpzthgYQk6YN/FWAwVv2leSa
         6eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YpcD4sQoTSyU9tD2LNi0KlsdEhl9zYFyAwEsyPsvSTE=;
        b=GIim6IEk2duQNRV7D+iYI4cJcZtZrEGwy5koqEK6LcS58Hx7m72tqQJxBW2clHs05T
         o3TStffS3K2ec3JwfbD+QFjvlbJsDo/35XEitzv25wN2Ud+AzsrCysIqyryce+BFko7o
         LPIzBkeGQOoK9UlFQkkozQMyFNjfGp9MPUOTagIq52DQQRZH6Ijx1Zy3XBvzPBcGDd0L
         F2yqGYK7C0vsvr3OS2Tz+0+zwMI0M2wckoYuQzT6mi8t0YQMmNdxFmmC82zEBj3qUrf+
         8vANKgSI4w+kP1Sdssyf5ySJakAOKl7j8e3bXDoKetWt9mpnmSvmcUEsX6gwILYsgJuc
         HV3Q==
X-Gm-Message-State: AOAM5321xETebXuVlou7MzP1v+Vs/ydvhr13qImNSyL7NB/uYeDTHJMo
        ADvE/rO4iQf6x+Yb2chwgos9/dmvUmyZxA==
X-Google-Smtp-Source: ABdhPJy8GVFPcWaNAh76zA4JGz5KmC0erNmDrlL7olmC0DXbfpcYaGdfMcuIat1TFku8lL57dviysg==
X-Received: by 2002:a17:902:7609:b029:e6:9f29:625f with SMTP id k9-20020a1709027609b02900e69f29625fmr2283733pll.80.1615946384334;
        Tue, 16 Mar 2021 18:59:44 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id mr5sm577996pjb.53.2021.03.16.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 18:59:43 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:59:39 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
Message-ID: <YFFiizDjNBMG3uI+@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-4-sergey.senozhatsky@gmail.com>
 <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/16 19:46), Ricardo Ribalda Delgado wrote:
> > -static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > -                                struct v4l2_selection *sel)
> > +/* UVC 1.5 ROI rectangle is half the size of v4l2_rect */
> > +struct uvc_roi_rect {
> > +       __u16                   top;
> > +       __u16                   left;
> > +       __u16                   bottom;
> > +       __u16                   right;
> > +};
> 
> Perhaps __packed; ?

Perhaps.

> > +static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > +                                struct v4l2_selection *sel)
> > +{
> > +       struct uvc_fh *handle = fh;
> > +       struct uvc_streaming *stream = handle->stream;
> > +
> > +       if (sel->type != stream->type)
> > +               return -EINVAL;
> > +
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +       case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > +       case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > +               return uvc_ioctl_g_sel_target(file, fh, sel);
> > +       case V4L2_SEL_TGT_ROI_CURRENT:
> > +       case V4L2_SEL_TGT_ROI_DEFAULT:
> > +       case V4L2_SEL_TGT_ROI_BOUNDS:
> > +               return uvc_ioctl_g_roi_target(file, fh, sel);
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> 
> Are you sure that there is no lock needed between the control and the
> selection API?

Between V4L2_CID_REGION_OF_INTEREST_AUTO and this path?
Hmm. They write to different offsets and don't seem to be overlapping.

> > +static bool validate_roi_bounds(struct uvc_streaming *stream,
> > +                               struct v4l2_selection *sel)
> > +{
> > +       bool ok = true;
> > +
> > +       if (sel->r.left > USHRT_MAX || sel->r.top > USHRT_MAX ||
> > +           sel->r.width > USHRT_MAX || sel->r.height > USHRT_MAX)
> > +               return false;
> > +
> > +       /* perhaps also can test against ROI GET_MAX */
> > +
> > +       mutex_lock(&stream->mutex);
[...]
> > +       if ((u16)sel->r.width > stream->cur_frame->wWidth)
> > +               ok = false;
> > +       if ((u16)sel->r.height > stream->cur_frame->wHeight)
> > +               ok = false;

> Maybe you should not release this mutex until query_ctrl is done?

Maybe... These two tests are somewhat made up. Not sure if we need them.
On one hand it's reasonable to keep ROI within the frames. On the other
hand - such relation is not spelled out in the spec. If the stream change
its frame dimensions ROI is not getting invalidated or re-calculated by
the firmware. UVC spec says that ROI should be bounded only by the
CT_DIGITAL_WINDOW_CONTROL (GET_MIN / GET_MAX), ut we don't implement
WINDOW_CONTROL.

So maybe I can remove stream->cuf_frame boundaries check instead.

> > +       mutex_unlock(&stream->mutex);
> > +
> > +       return ok;
> > +}
> > +
> > +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> > +                          struct v4l2_selection *sel)
> > +{
> > +       struct uvc_fh *handle = fh;
> > +       struct uvc_streaming *stream = handle->stream;
> > +       struct uvc_roi_rect *roi;
> > +       int ret;
> > +
> > +       if (!validate_roi_bounds(stream, sel))
> > +               return -E2BIG;
> > +
> > +       roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> > +       if (!roi)
> > +               return -ENOMEM;
> > +
> > +       roi->left       = sel->r.left;
> > +       roi->top        = sel->r.top;
> > +       roi->right      = sel->r.width;
> > +       roi->bottom     = sel->r.height;
> > +
> > +       ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
> > +                            UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> > +                            sizeof(struct uvc_roi_rect));
> 
> I think you need to read back from the device the actual value

GET_CUR?

> https://www.kernel.org/doc/html/v4.13/media/uapi/v4l/vidioc-g-selection.html?highlight=vidioc_s_selection
> On success the struct v4l2_rect r field contains the adjusted
> rectangle.

What is the adjusted rectangle here? Does this mean that firmware can
successfully apply SET_CUR and return 0, but in reality it was not happy
with the rectangle dimensions so it modified it behind the scenes?

I can add GET_CUR I guess, but do we want to double the traffic, given
that ROI SET_CUR can be executed relatively often?
