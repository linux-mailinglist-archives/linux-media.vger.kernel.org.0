Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC1C28CF58
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 15:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgJMNlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 09:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgJMNlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 09:41:11 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B532BC0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:41:10 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dt13so28346261ejb.12
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2V2YTRVuSVOcGPhuuh1GlQcD4dmudUyuY+buEnTGJbM=;
        b=K7WctOIrky5wpsEU/mhzhXk48ILrN6QzRpAF8OFAR9mN1lByK2/acaz6Hmaxql36YG
         ug6a/B7r6IMHN/+3a8rwT+s6ARMi2wAvxWOmYYWRyubb7ZtNf2d+q6G1gb8yTF5P0LQI
         y42bqFItBMpEXnUTvBad1QOKkN8aRH6RYU90I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2V2YTRVuSVOcGPhuuh1GlQcD4dmudUyuY+buEnTGJbM=;
        b=STUzdivP5Rxo7kmOmNjWmQQTwkpdPWKgldXZWgOKEqW8qk4WirO/KPoiEiUFgz5o4E
         AYahLd5u7CNMsWJoIYeMpxcsTRtCzbj9FH07lAO2FcVN5jC9ZpZ5O8tt2/ElcH6WvDbx
         to5mS0hLmH5MGlkGtEeo1UN+e6cuhPyic39/fBp0VPfWvuX1rbSXcZcpcBlkIqspgzAF
         pFh/7e48+xJChVaF9gdiVeStDCYxEnTAvwhDNM84ccZVnqq5wSly7rz6y0UwEfKh7clE
         0pb5erauhWcVAguWhkPUG0NjrWyQZZrdz8E6SaEWgzymdXOpj04y29dUmQSsb0u4Eeik
         R0Fw==
X-Gm-Message-State: AOAM533LYI2I7P8xLRBcVbdKCxWZrzAlI7hJPZMMHwJ46cnBmHFkUI+2
        cc5Y7VrjWSrN+nivGWLdmTP+nofkivsFZsV6
X-Google-Smtp-Source: ABdhPJx0u1gEdkIpMKnRMi6FhwUDg0KD8LH2LC0Ho2LOYnRMSwM9uSZICkhcTx8SWyFPJt7W7mOz5Q==
X-Received: by 2002:a17:906:e949:: with SMTP id jw9mr33044354ejb.109.1602596468970;
        Tue, 13 Oct 2020 06:41:08 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id n22sm12105964eji.106.2020.10.13.06.41.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 06:41:08 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id y12so18737327wrp.6
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:41:07 -0700 (PDT)
X-Received: by 2002:adf:8290:: with SMTP id 16mr38164627wrc.103.1602596467217;
 Tue, 13 Oct 2020 06:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200702100017.24700-1-stanimir.varbanov@linaro.org>
 <8dafbb4b-4626-5191-c57a-f3ef19c14618@linaro.org> <d11da037-92e5-2ee7-8723-10162d16eba9@linaro.org>
In-Reply-To: <d11da037-92e5-2ee7-8723-10162d16eba9@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 13 Oct 2020 15:40:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AYvMrZQtZ2UBOEG6Nar06bZrRZdE57Y6N7+6dZxJ0m_A@mail.gmail.com>
Message-ID: <CAAFQd5AYvMrZQtZ2UBOEG6Nar06bZrRZdE57Y6N7+6dZxJ0m_A@mail.gmail.com>
Subject: Re: [PATCH] v4l: Add source change event for colorimetry
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 11:03 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi,
>
> On 7/2/20 2:52 PM, Stanimir Varbanov wrote:
> > Hi,
> >
> > Once we have this event there is still open question how the client will
> > know the data buffer on which the new colorspace is valid/applied.
> >
> > The options could be:
> >  * a new buffer flag and
> >  * some information in the v4l2_event structure.
> >
> > Thoughts?
>
> Kindly ping.
>

The event itself sounds good to me, but how do we know which buffer is
the first to have the new colorimetry?

Best regards,
Tomasz

> >
> > On 7/2/20 1:00 PM, Stanimir Varbanov wrote:
> >> This event indicate that the source colorspace is changed
> >> during run-time. The client has to retrieve the new colorspace
> >> identifiers by getting the format (G_FMT).
> >>
> >> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> ---
> >>  .../userspace-api/media/v4l/vidioc-dqevent.rst        | 11 ++++++++++-
> >>  .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
> >>  include/uapi/linux/videodev2.h                        |  1 +
> >>  3 files changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> >> index a9a176d5256d..3f69c753db58 100644
> >> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> >> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> >> @@ -381,7 +381,16 @@ call.
> >>      that many Video Capture devices are not able to recover from a temporary
> >>      loss of signal and so restarting streaming I/O is required in order for
> >>      the hardware to synchronize to the video signal.
> >> -
> >> +    * - ``V4L2_EVENT_SRC_CH_COLORIMETRY``
> >> +      - 0x0002
> >> +      - This event gets triggered when a colorspace change is detected at
> >> +    an input. By colorspace change here we include also changes in the
> >> +    colorspace specifiers (transfer function, Y'CbCr encoding and
> >> +    quantization). This event can come from an input or from video decoder.
> >> +    Once the event has been send to the client the driver has to update
> >> +    the colorspace specifiers internally so that they could be retrieved by
> >> +    client. In that case queue re-negotiation is not needed as this change
> >> +    only reflects on the interpretation of the data.
> >>
> >>  Return Value
> >>  ============
> >> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >> index ca05e4e126b2..54fc21af852d 100644
> >> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >> @@ -492,6 +492,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
> >>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
> >>
> >>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
> >> +replace define V4L2_EVENT_SRC_CH_COLORIMETRY src-changes-flags
> >>
> >>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
> >>
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >> index 303805438814..b5838bc4e3a3 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -2351,6 +2351,7 @@ struct v4l2_event_frame_sync {
> >>  };
> >>
> >>  #define V4L2_EVENT_SRC_CH_RESOLUTION                (1 << 0)
> >> +#define V4L2_EVENT_SRC_CH_COLORIMETRY               (1 << 1)
> >>
> >>  struct v4l2_event_src_change {
> >>      __u32 changes;
> >>
> >
>
> --
> regards,
> Stan
