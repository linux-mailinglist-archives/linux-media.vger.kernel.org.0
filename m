Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C87828CFD5
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388373AbgJMOHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388361AbgJMOHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:07:23 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583D5C0613D2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:07:23 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a3so28417615ejy.11
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIX8UwVd6i1Ks++H9pMW7uUhFrKEYQPcpPoIUC4HcAM=;
        b=nVgdy1nmy0T2zzsNhl0z+N717Ybshh5QAq5ClUShuZFu69Z7Zg4XRpdNH9p9tjxE2v
         /J5m1J493d+7a5D0/ATiWvOT001h/H3o7O1TWCxnJ2LORB8kWDZKWLI0Zbr8X6YPCYjw
         uLybBHYvln9rQEs7qxhFa25fAALx6fy0Vm+8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIX8UwVd6i1Ks++H9pMW7uUhFrKEYQPcpPoIUC4HcAM=;
        b=DRLLio/2lf2xk/Al6hwqPkFuhalusnDVgoqbxfY9tbV4D33K02YLgaOQXss9valIMk
         nzTfvqv7A2JfMgj78qiSqfhrw8gJPiw6GUotFx1Ws/JmJTl2kjQzO+F0gweUMD71wDpo
         Gc9P8x/lcQj3WwTG6pOkfiLyI2UHaMwRR9Zy/9UKPMCzYdB+OMsm7ZI6xzglxtxKX9C1
         pAbfmtjViNtqX07BL7uufD+yxsEZmwDr8ZLtKfwVY7Ft0mW0GYy0l8bwcza7QYadYkaZ
         mid5uCQYfgOcmkJiyWgNAfJeB0C/veXCfBGPiK0tZmAlUm59qIw0gJEBWiHosjrNw24M
         l6zA==
X-Gm-Message-State: AOAM5332SoCzsMxTPVhCE2rzNJDV64EUH9il77r2crpq23aYALGxZcXt
        AWz+d8OGN2kUyjqME7Z542Mf/kTs5dLa4lSr
X-Google-Smtp-Source: ABdhPJzzFpYzXr1IIpI2m4Qi2pzS1/BMkOTwKFAkTCXwGH06ho1qCw9rmVgWRM3SbIOUU3qXZG5VUA==
X-Received: by 2002:a17:906:82d5:: with SMTP id a21mr32949400ejy.548.1602598041670;
        Tue, 13 Oct 2020 07:07:21 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id b6sm13245312edu.21.2020.10.13.07.07.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 07:07:20 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id e18so24205346wrw.9
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:07:20 -0700 (PDT)
X-Received: by 2002:adf:82e5:: with SMTP id 92mr1153384wrc.192.1602598039641;
 Tue, 13 Oct 2020 07:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200702100017.24700-1-stanimir.varbanov@linaro.org>
 <8dafbb4b-4626-5191-c57a-f3ef19c14618@linaro.org> <d11da037-92e5-2ee7-8723-10162d16eba9@linaro.org>
 <CAAFQd5AYvMrZQtZ2UBOEG6Nar06bZrRZdE57Y6N7+6dZxJ0m_A@mail.gmail.com> <7db412a2-8fd3-6657-4fcd-1fbfde4b2c0e@linaro.org>
In-Reply-To: <7db412a2-8fd3-6657-4fcd-1fbfde4b2c0e@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 13 Oct 2020 16:07:08 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Cw-23aE09+Gj35JN5ue_HHZQ8nyE+Bwfg5=GKA7WXTnw@mail.gmail.com>
Message-ID: <CAAFQd5Cw-23aE09+Gj35JN5ue_HHZQ8nyE+Bwfg5=GKA7WXTnw@mail.gmail.com>
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

On Tue, Oct 13, 2020 at 3:53 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
>
>
> On 10/13/20 4:40 PM, Tomasz Figa wrote:
> > On Tue, Oct 13, 2020 at 11:03 AM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> On 7/2/20 2:52 PM, Stanimir Varbanov wrote:
> >>> Hi,
> >>>
> >>> Once we have this event there is still open question how the client will
> >>> know the data buffer on which the new colorspace is valid/applied.
> >>>
> >>> The options could be:
> >>>  * a new buffer flag and
> >>>  * some information in the v4l2_event structure.
> >>>
> >>> Thoughts?
> >>
> >> Kindly ping.
> >>
> >
> > The event itself sounds good to me, but how do we know which buffer is
> > the first to have the new colorimetry?
>
> I think Hans have a very good idea to have width/height and colorspace
> specifiers in v4l2_ext_buffer [1].
>
> [1] https://lkml.org/lkml/2020/9/9/531
>

Hmm, I think that would basically make the event obsolete and without
solving that problem I suspect the event is not very useful, because
one could already receive and display (incorrectly) some buffers
before realizing that they have different colorimetry.

I believe for now we would have to handle this like a resolution
change - flush the CAPTURE queue and the next buffer after the flush
would have the new colorimetry. With the new API we could optimize the
decoding by getting rid of the flushes and relying on the in-bound
information.

Best regards,
Tomasz

> >
> > Best regards,
> > Tomasz
> >
> >>>
> >>> On 7/2/20 1:00 PM, Stanimir Varbanov wrote:
> >>>> This event indicate that the source colorspace is changed
> >>>> during run-time. The client has to retrieve the new colorspace
> >>>> identifiers by getting the format (G_FMT).
> >>>>
> >>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>> ---
> >>>>  .../userspace-api/media/v4l/vidioc-dqevent.rst        | 11 ++++++++++-
> >>>>  .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
> >>>>  include/uapi/linux/videodev2.h                        |  1 +
> >>>>  3 files changed, 12 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> >>>> index a9a176d5256d..3f69c753db58 100644
> >>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> >>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> >>>> @@ -381,7 +381,16 @@ call.
> >>>>      that many Video Capture devices are not able to recover from a temporary
> >>>>      loss of signal and so restarting streaming I/O is required in order for
> >>>>      the hardware to synchronize to the video signal.
> >>>> -
> >>>> +    * - ``V4L2_EVENT_SRC_CH_COLORIMETRY``
> >>>> +      - 0x0002
> >>>> +      - This event gets triggered when a colorspace change is detected at
> >>>> +    an input. By colorspace change here we include also changes in the
> >>>> +    colorspace specifiers (transfer function, Y'CbCr encoding and
> >>>> +    quantization). This event can come from an input or from video decoder.
> >>>> +    Once the event has been send to the client the driver has to update
> >>>> +    the colorspace specifiers internally so that they could be retrieved by
> >>>> +    client. In that case queue re-negotiation is not needed as this change
> >>>> +    only reflects on the interpretation of the data.
> >>>>
> >>>>  Return Value
> >>>>  ============
> >>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>> index ca05e4e126b2..54fc21af852d 100644
> >>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>> @@ -492,6 +492,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
> >>>>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
> >>>>
> >>>>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
> >>>> +replace define V4L2_EVENT_SRC_CH_COLORIMETRY src-changes-flags
> >>>>
> >>>>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
> >>>>
> >>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >>>> index 303805438814..b5838bc4e3a3 100644
> >>>> --- a/include/uapi/linux/videodev2.h
> >>>> +++ b/include/uapi/linux/videodev2.h
> >>>> @@ -2351,6 +2351,7 @@ struct v4l2_event_frame_sync {
> >>>>  };
> >>>>
> >>>>  #define V4L2_EVENT_SRC_CH_RESOLUTION                (1 << 0)
> >>>> +#define V4L2_EVENT_SRC_CH_COLORIMETRY               (1 << 1)
> >>>>
> >>>>  struct v4l2_event_src_change {
> >>>>      __u32 changes;
> >>>>
> >>>
> >>
> >> --
> >> regards,
> >> Stan
>
> --
> regards,
> Stan
