Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C87C1EE4E0
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 14:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgFDM6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 08:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgFDM6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 08:58:06 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5509BC08C5C0
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 05:58:06 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id q19so5973209eja.7
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i1sD5nsjWErhoOPpiUlLQ4uHWzuhyGOs7H0JtQng1CY=;
        b=WWpNoL+SNH1Hw9+Gwm1Ak+QjVz0IerRxIEeJDL3Lo5aTpzOB1DL2eQ2MZLUGDzYkXt
         wB9UNSZ8QVmYpoqQIdEXahA+f0XxOM9aPJneNVy704qnLz8JLpN4nSuN4q6XrrW8JvRP
         +Q8qPzkuVW95yhPofoknBa491KN5X0pIUi240=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1sD5nsjWErhoOPpiUlLQ4uHWzuhyGOs7H0JtQng1CY=;
        b=f5Kym9RLBGx7gqTecyxdi/cqdzAyoq0jDsLDdz7fozbGwTRTjgp7Vnr0ldz3HAge2I
         +FTX+dBXqcuHeJDLDxM0PmjtubrApSx2xdgBeBJMAGIVj0KmCzP29rUAAOMcVv1Nulm1
         4s2RzRJrPd+O7q1xHDgoInOS0zMuD74d26A9ISVZfFqvT7DL/fH8WdgUZXot1xG9EGnX
         Ca3QrXQRSAQX27f2JIm9W9RI4yP6xnp4chOPKTnptI1y7Lx4HyibQi0ddnE/+TDvTZN+
         CODwntvwfIwdh3Y0ahU2T3NTWwRc8MeOUd4L+OgM/qRlh6wC+p8W/u0uf5H/c/RPQmo9
         bsTg==
X-Gm-Message-State: AOAM531Tk+zqit34/BjS7YHb9Zwe5mM1M3pPKNbjUengTsIOGHWYrJtl
        85LY8ZJyRD6JGX53NdJQ1WOpu2M/AmY=
X-Google-Smtp-Source: ABdhPJwN9Xyfj8qZxc1dwp9w6iMhsiE5tOzHKN6MBQx5ZyMGj4yMPG6d16SUTe5m/kXf83rv5Wwh5w==
X-Received: by 2002:a17:906:1804:: with SMTP id v4mr3669191eje.104.1591275484716;
        Thu, 04 Jun 2020 05:58:04 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id r1sm2098552eja.57.2020.06.04.05.58.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 05:58:04 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id d128so5519816wmc.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 05:58:03 -0700 (PDT)
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr4134715wmh.134.1591275483243;
 Thu, 04 Jun 2020 05:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
 <65ac9697-a43f-7025-e6fe-69c4a44c6d9a@xs4all.nl> <ce28a840-a763-6700-16dd-d708e570d55c@linaro.org>
 <d02c6cd0-a502-dc52-519e-54b6328d5373@linaro.org> <544b19dd-4883-bae0-b488-46c856eb207d@xs4all.nl>
 <6f71931a-9060-a399-835c-a1cf1f05dc79@linaro.org> <1bc10e88-8cbe-3da9-daeb-d015f42d7acc@xs4all.nl>
In-Reply-To: <1bc10e88-8cbe-3da9-daeb-d015f42d7acc@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 4 Jun 2020 14:57:51 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Aorm-O7OMcHsnRUEGQq2qoPDRtAuukiLHgC9g54oAW9Q@mail.gmail.com>
Message-ID: <CAAFQd5Aorm-O7OMcHsnRUEGQq2qoPDRtAuukiLHgC9g54oAW9Q@mail.gmail.com>
Subject: Re: [PATCH] v4l2-ctrl: add control for thumnails
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 4, 2020 at 2:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 04/06/2020 14:34, Stanimir Varbanov wrote:
> > Hi Hans,
> >
> > On 6/4/20 12:08 PM, Hans Verkuil wrote:
> >> On 04/06/2020 11:02, Stanimir Varbanov wrote:
> >>> Hi Hans,
> >>>
> >>> On 5/27/20 12:53 AM, Stanimir Varbanov wrote:
> >>>> Hi Hans,
> >>>>
> >>>> On 5/26/20 3:04 PM, Hans Verkuil wrote:
> >>>>> On 26/05/2020 10:54, Stanimir Varbanov wrote:
> >>>>>> Add v4l2 control for decoder thumbnail.
> >>>>>>
> >>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>>>> ---
> >>>>>>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
> >>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
> >>>>>>  include/uapi/linux/v4l2-controls.h                        | 2 ++
> >>>>>>  3 files changed, 11 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> >>>>>> index d0d506a444b1..e838e410651b 100644
> >>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> >>>>>> @@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> >>>>>>      disables generating SPS and PPS at every IDR. Setting it to one enables
> >>>>>>      generating SPS and PPS at every IDR.
> >>>>>>
> >>>>>> +``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
> >>>>>> +    Instructs the decoder to produce immediate output. The decoder should
> >>>>>> +    consume first input buffer for progressive stream (or first two buffers
> >>>>>> +    for interlace). Decoder should not allocate more output buffers that it
> >>>>>> +    is required to consume one input frame. Usually the decoder input
> >>>>>> +    buffers will contain only I/IDR frames but it is not mandatory.
> >>>>>
> >>>>> This is very vague. It doesn't explain why the control is called 'THUMBNAIL',
> >>>>> but more importantly it doesn't explain how this relates to normal decoding.
> >>>>
> >>>> If in the normal decode the capture queue buffers are 5, in the
> >>>> thumbnail mode the number of buffers will be only 1 (if the bitstream is
> >>>> progressive) and this will guarantee low memory usage. The other
> >>>> difference is that the decoder will produce decoded frames (without
> >>>> errors) only for I/IDR (sync frames).
> >>
> >> Isn't this really a "DECODE_SYNC_FRAMES_ONLY" control? That's what it does,
> >> right? Skip any B/P frames and only decode sync frames.
> >
> > Yes, it is.
> > To me V4L2_CID_MPEG_VIDEO_DECODE_SYNC_FRAMES sounds better. If you are
> > fine I can send a new patch.
> >
> > The definition of "sync frames" is a bit difficult for codec-agnostic
> > controls. Is it sound better "INTRA", DECODE_INTRA_FRAMES (ONLY)?
>
> INTRA is better. DECODE_INTRA_FRAMES_ONLY is a good name, I think.
>
> Thumbnail creation can be given as an example in the description of the
> control, but that's just a use-case.

How about the other aspect of the behavior?

"Decoder should not allocate more output buffers that it
is required to consume one input frame."

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >
> >>
> >> That this is useful for creating thumbnails is just a specific use-case.
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >>>>
> >>>>>
> >>>>> I.e. if you are decoding and 'press' this control, what happens then?
> >>>>
> >>>> Might be the button type wasn't great idea. In fact the control should
> >>>> be set before streamon so that the driver returns min_capture_bufs 1.
> >>>>
> >>>>>
> >>>>> What exactly is the use-case?
> >>>>
> >>>> It could be used to generate thumbnails of all video clips in a folder
> >>>> or when you open a Gallery application on your phone.
> >>>>
> >>>
> >>> What is your opinion on that control? I could consider to make it Venus
> >>> custom control but from the use-case it looks other drivers also can
> >>> benefit of it.
> >>>
> >>> I tried to make more generic one [1] but it looks it will be too difficult.
> >>>
> >>
> >
>
