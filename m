Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A3B33EAF3
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 08:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCQH7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 03:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbhCQH6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 03:58:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493F0C06174A;
        Wed, 17 Mar 2021 00:58:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 20so1533782lfj.13;
        Wed, 17 Mar 2021 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2LgKjTDGsyu/sA3V9tv6SweCwbT0eEY8NFDEvhoTJIw=;
        b=bbq8FSR1oR15UcJu3OGSlMQzNZQ5xiZUcjDe9Ue3QbuznpKpzvSEF7hhqCxTzlb2lI
         3mY1YDUC06S687d/m+DSdmcNnfyTeEQoiBBaBb5asRW8lvhgm8ne6fdmP1ig8vcZetSO
         eurwyglORglnHAvfDGsjfG1e/PWE3LZ7EssFbgzO/BszWj8ZQlkTjuf1G7ChZPFJlC8e
         e9TmzRF8KkW3o2ZdaH+V+5GQwRhtjXQ7KnTteoLH0iPdgQvCvtsUwUlmMFWUCOf35ESr
         ZSb4N20Z+N52wFObW7hV3qdN4zAmlYaE1e0Ci4b4rN0KTsfKKSMAAR1VX5PN7z0vcTDn
         oihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2LgKjTDGsyu/sA3V9tv6SweCwbT0eEY8NFDEvhoTJIw=;
        b=A1aEu/pPXBtpMozpPzn1H2iePcJgjUDrQCa7aSYnydb/IwVEdNMSLybO7g06/G6Y1j
         iCHfN7vszlPa5aMUqhnNcJzlm2XrG3UXvoR/3sWPiqXTAqfsLYUoK4L7RFs1kf1vSrdO
         Vg80KhEpsX6zticfGPn86HKjd/Au0NcVeSB8vOUW7xDAKWq177I7vG3lzUfYfDxDu5nM
         Qhhpk+elvaHJjD7rdbBSs0b740V/dNOkcLs6wrbPerfiSi7l2XnMoZR+2msi56PM89R0
         Vq72hTLl4Biq0jvfJNepORTWWgfrfwV9OV132Mbw9OV4tn6gUImWKmPvquuU99IxcLi2
         XMHw==
X-Gm-Message-State: AOAM531OGuBkWu+UIRIW+B7O6ecCy+dKmdgTvDVLYmAJDfq1tRp7fFI4
        eHzEXQyPuU4vQsHIeqnp6WMuZu19SULj84yK1DdnG1aLWYQ=
X-Google-Smtp-Source: ABdhPJwxtUCPA0FJFug59UGVl4/99ti5a0oEAcrWjcnf82tw3sL4FMyMotz1gydIQqdQrYBYsbrIDZaYweGCXNjorZY=
X-Received: by 2002:a05:6512:131c:: with SMTP id x28mr1607871lfu.387.1615967930786;
 Wed, 17 Mar 2021 00:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-4-sergey.senozhatsky@gmail.com> <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
 <YFFiizDjNBMG3uI+@google.com>
In-Reply-To: <YFFiizDjNBMG3uI+@google.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Wed, 17 Mar 2021 08:58:34 +0100
Message-ID: <CAPybu_0ruoc-w3402j-vVNs2-xq8=-_XzVKSxiG+iuyB=eNimA@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Wed, Mar 17, 2021 at 2:59 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (21/03/16 19:46), Ricardo Ribalda Delgado wrote:
> > > -static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > > -                                struct v4l2_selection *sel)
> > > +/* UVC 1.5 ROI rectangle is half the size of v4l2_rect */
> > > +struct uvc_roi_rect {
> > > +       __u16                   top;
> > > +       __u16                   left;
> > > +       __u16                   bottom;
> > > +       __u16                   right;
> > > +};
> >
> > Perhaps __packed; ?
>
> Perhaps.
>
> > > +static int uvc_ioctl_g_selection(struct file *file, void *fh,
> > > +                                struct v4l2_selection *sel)
> > > +{
> > > +       struct uvc_fh *handle = fh;
> > > +       struct uvc_streaming *stream = handle->stream;
> > > +
> > > +       if (sel->type != stream->type)
> > > +               return -EINVAL;
> > > +
> > > +       switch (sel->target) {
> > > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +       case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > > +       case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > > +               return uvc_ioctl_g_sel_target(file, fh, sel);
> > > +       case V4L2_SEL_TGT_ROI_CURRENT:
> > > +       case V4L2_SEL_TGT_ROI_DEFAULT:
> > > +       case V4L2_SEL_TGT_ROI_BOUNDS:
> > > +               return uvc_ioctl_g_roi_target(file, fh, sel);
> > > +       }
> > > +
> > > +       return -EINVAL;
> > > +}
> >
> > Are you sure that there is no lock needed between the control and the
> > selection API?
>
> Between V4L2_CID_REGION_OF_INTEREST_AUTO and this path?
> Hmm. They write to different offsets and don't seem to be overlapping.
>
> > > +static bool validate_roi_bounds(struct uvc_streaming *stream,
> > > +                               struct v4l2_selection *sel)
> > > +{
> > > +       bool ok = true;
> > > +
> > > +       if (sel->r.left > USHRT_MAX || sel->r.top > USHRT_MAX ||
> > > +           sel->r.width > USHRT_MAX || sel->r.height > USHRT_MAX)
> > > +               return false;
> > > +
> > > +       /* perhaps also can test against ROI GET_MAX */
> > > +
> > > +       mutex_lock(&stream->mutex);
> [...]
> > > +       if ((u16)sel->r.width > stream->cur_frame->wWidth)
> > > +               ok = false;
> > > +       if ((u16)sel->r.height > stream->cur_frame->wHeight)
> > > +               ok = false;
>
> > Maybe you should not release this mutex until query_ctrl is done?
>
> Maybe... These two tests are somewhat made up. Not sure if we need them.
> On one hand it's reasonable to keep ROI within the frames. On the other
> hand - such relation is not spelled out in the spec. If the stream change
> its frame dimensions ROI is not getting invalidated or re-calculated by
> the firmware. UVC spec says that ROI should be bounded only by the
> CT_DIGITAL_WINDOW_CONTROL (GET_MIN / GET_MAX), ut we don't implement
> WINDOW_CONTROL.

I would remove this check completely then, and rely on set_cur,
get_cur. Leave only the < 0x10000 check

>
> So maybe I can remove stream->cuf_frame boundaries check instead.
>
> > > +       mutex_unlock(&stream->mutex);
> > > +
> > > +       return ok;
> > > +}
> > > +
> > > +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> > > +                          struct v4l2_selection *sel)
> > > +{
> > > +       struct uvc_fh *handle = fh;
> > > +       struct uvc_streaming *stream = handle->stream;
> > > +       struct uvc_roi_rect *roi;
> > > +       int ret;
> > > +
> > > +       if (!validate_roi_bounds(stream, sel))
> > > +               return -E2BIG;
> > > +
> > > +       roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> > > +       if (!roi)
> > > +               return -ENOMEM;
> > > +
> > > +       roi->left       = sel->r.left;
> > > +       roi->top        = sel->r.top;
> > > +       roi->right      = sel->r.width;
> > > +       roi->bottom     = sel->r.height;
> > > +
> > > +       ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
> > > +                            UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> > > +                            sizeof(struct uvc_roi_rect));
> >
> > I think you need to read back from the device the actual value
>
> GET_CUR?
yep

>
> > https://www.kernel.org/doc/html/v4.13/media/uapi/v4l/vidioc-g-selection.html?highlight=vidioc_s_selection
> > On success the struct v4l2_rect r field contains the adjusted
> > rectangle.
>
> What is the adjusted rectangle here? Does this mean that firmware can
> successfully apply SET_CUR and return 0, but in reality it was not happy
> with the rectangle dimensions so it modified it behind the scenes?

I can imagine that some hw might have spooky requirements for the roi
rectangle (multiple of 4, not crossing the bayer filter, odd/even
line...) so they might be able to go the closest valid config.


>
> I can add GET_CUR I guess, but do we want to double the traffic, given
> that ROI SET_CUR can be executed relatively often?



--
Ricardo Ribalda
