Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDBE28CEFB
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 15:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbgJMNNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 09:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387620AbgJMNND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 09:13:03 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE920C0613D0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:13:01 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id x7so18072051eje.8
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUTR1na3Qa05gyhmhDFmvq03v/zx4fi0gFtqH+OKyWU=;
        b=YMkUEMOXtUWNimXqzoY70gOvJhuH3owo6E/8URbjAoCRURFQLe1HRvPGm9LzkClgNh
         hqKd4OCtyy1fzhGhpa5ca7+hduaG64OKkvaOPuB2adHMgN+8xX7nbVN9iy1rnlH1GE3u
         w/Xw1YYWYPXiIDPI3gmpRA/ituQIIUSJ3IapM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUTR1na3Qa05gyhmhDFmvq03v/zx4fi0gFtqH+OKyWU=;
        b=WCaxZE+S8l3pHkUGqqckfO4uAbAvzc1W4Kgk0VrHm7DUTq03Yu3wSidcM3l+HvCTL/
         5RMsxao/J2JAsfS/7b/jC6PhCAPKbDfsvk/GqGQclYkZnsDsv4/eBlIOUTyUmHi+PotO
         CDVCPapz1RmjSaAFlEYSCa7oIsHuYiJXzr+ZWWtr519CrmDYJBY72YHiJYstuEHwFS8V
         Nqg8M3NaYRyn5NJzpOc2oXpWG4fAKkx8KiBxbhefP7lxCpvhj7S7tL4u1wRSKsxfZ/bT
         CP97SnFb6cMtx1auIHU7eu4XZiXdGiNgmj4L13vd+Ol6B0dFaOQvjqrnp+WDtB7lqJog
         bOXA==
X-Gm-Message-State: AOAM533DA6Gqxm74fgJX/CA5MXfhc1n2EPCZ4xeYgQtVfYC8M35JQb5S
        Z100YU3qfNmQafw+7lFciJvjnJ2mOcI2B32t
X-Google-Smtp-Source: ABdhPJwiSvpVsbDD5qRAtH8aGsS8HkVtfebbWm/mMPsBE8wdiyuLXzOrss5/wAaLjvSjC/qMlgysQA==
X-Received: by 2002:a17:906:f14b:: with SMTP id gw11mr33681148ejb.41.1602594779599;
        Tue, 13 Oct 2020 06:12:59 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id mc4sm12247630ejb.61.2020.10.13.06.12.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 06:12:58 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id n6so23684433wrm.13
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:12:57 -0700 (PDT)
X-Received: by 2002:adf:ab05:: with SMTP id q5mr9380716wrc.32.1602594777300;
 Tue, 13 Oct 2020 06:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
 <65ac9697-a43f-7025-e6fe-69c4a44c6d9a@xs4all.nl> <ce28a840-a763-6700-16dd-d708e570d55c@linaro.org>
 <d02c6cd0-a502-dc52-519e-54b6328d5373@linaro.org> <544b19dd-4883-bae0-b488-46c856eb207d@xs4all.nl>
 <6f71931a-9060-a399-835c-a1cf1f05dc79@linaro.org> <1bc10e88-8cbe-3da9-daeb-d015f42d7acc@xs4all.nl>
 <CAAFQd5Aorm-O7OMcHsnRUEGQq2qoPDRtAuukiLHgC9g54oAW9Q@mail.gmail.com> <de40cdf1-0b84-a252-0137-a550f078d28b@linaro.org>
In-Reply-To: <de40cdf1-0b84-a252-0137-a550f078d28b@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 13 Oct 2020 15:12:46 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A7MdFXsYWVx+3DY-dt=HZTg_Kt1uhntoEzzjp+e02R=Q@mail.gmail.com>
Message-ID: <CAAFQd5A7MdFXsYWVx+3DY-dt=HZTg_Kt1uhntoEzzjp+e02R=Q@mail.gmail.com>
Subject: Re: [PATCH] v4l2-ctrl: add control for thumnails
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 2:52 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi,
>
> On 6/4/20 3:57 PM, Tomasz Figa wrote:
> > On Thu, Jun 4, 2020 at 2:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 04/06/2020 14:34, Stanimir Varbanov wrote:
> >>> Hi Hans,
> >>>
> >>> On 6/4/20 12:08 PM, Hans Verkuil wrote:
> >>>> On 04/06/2020 11:02, Stanimir Varbanov wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On 5/27/20 12:53 AM, Stanimir Varbanov wrote:
> >>>>>> Hi Hans,
> >>>>>>
> >>>>>> On 5/26/20 3:04 PM, Hans Verkuil wrote:
> >>>>>>> On 26/05/2020 10:54, Stanimir Varbanov wrote:
> >>>>>>>> Add v4l2 control for decoder thumbnail.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>>>>>> ---
> >>>>>>>>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
> >>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
> >>>>>>>>  include/uapi/linux/v4l2-controls.h                        | 2 ++
> >>>>>>>>  3 files changed, 11 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> >>>>>>>> index d0d506a444b1..e838e410651b 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> >>>>>>>> @@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> >>>>>>>>      disables generating SPS and PPS at every IDR. Setting it to one enables
> >>>>>>>>      generating SPS and PPS at every IDR.
> >>>>>>>>
> >>>>>>>> +``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
> >>>>>>>> +    Instructs the decoder to produce immediate output. The decoder should
> >>>>>>>> +    consume first input buffer for progressive stream (or first two buffers
> >>>>>>>> +    for interlace). Decoder should not allocate more output buffers that it
> >>>>>>>> +    is required to consume one input frame. Usually the decoder input
> >>>>>>>> +    buffers will contain only I/IDR frames but it is not mandatory.
> >>>>>>>
> >>>>>>> This is very vague. It doesn't explain why the control is called 'THUMBNAIL',
> >>>>>>> but more importantly it doesn't explain how this relates to normal decoding.
> >>>>>>
> >>>>>> If in the normal decode the capture queue buffers are 5, in the
> >>>>>> thumbnail mode the number of buffers will be only 1 (if the bitstream is
> >>>>>> progressive) and this will guarantee low memory usage. The other
> >>>>>> difference is that the decoder will produce decoded frames (without
> >>>>>> errors) only for I/IDR (sync frames).
> >>>>
> >>>> Isn't this really a "DECODE_SYNC_FRAMES_ONLY" control? That's what it does,
> >>>> right? Skip any B/P frames and only decode sync frames.
> >>>
> >>> Yes, it is.
> >>> To me V4L2_CID_MPEG_VIDEO_DECODE_SYNC_FRAMES sounds better. If you are
> >>> fine I can send a new patch.
> >>>
> >>> The definition of "sync frames" is a bit difficult for codec-agnostic
> >>> controls. Is it sound better "INTRA", DECODE_INTRA_FRAMES (ONLY)?
> >>
> >> INTRA is better. DECODE_INTRA_FRAMES_ONLY is a good name, I think.
> >>
> >> Thumbnail creation can be given as an example in the description of the
> >> control, but that's just a use-case.
> >
> > How about the other aspect of the behavior?
> >
> > "Decoder should not allocate more output buffers that it
> > is required to consume one input frame."
> >
>
> In fact I have to refine this; It looks like that picture type decode vs
> thumbnail are two different modes.
>
> Thumbnail mode - first frame decode without additional memory (one input
> buffer and one output buffer). The first frame can be even non-intra
> frame as well.

How comes it can be decoded without additional memory to store the
reference frames then?

> Also no matter frame parser is sending, the decoder will
> try to produce output for thumbnail generation.

Well, thinking of it now, actually DECODE_INTRA_FRAMES_ONLY makes
sense here - if it is set, only 1 CAPTURE buffer could be allowed
indeed, because no reference frames are needed for decoding.

If inter frames are needed, I believe full DPB needs to be allocated,
because it all depends on the stream how the references are set, so
this is equivalent to normal decoding.

best regards,
Tomasz

>
> > Best regards,
> > Tomasz
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>>>
> >>>> That this is useful for creating thumbnails is just a specific use-case.
> >>>>
> >>>> Regards,
> >>>>
> >>>>      Hans
> >>>>
> >>>>>>
> >>>>>>>
> >>>>>>> I.e. if you are decoding and 'press' this control, what happens then?
> >>>>>>
> >>>>>> Might be the button type wasn't great idea. In fact the control should
> >>>>>> be set before streamon so that the driver returns min_capture_bufs 1.
> >>>>>>
> >>>>>>>
> >>>>>>> What exactly is the use-case?
> >>>>>>
> >>>>>> It could be used to generate thumbnails of all video clips in a folder
> >>>>>> or when you open a Gallery application on your phone.
> >>>>>>
> >>>>>
> >>>>> What is your opinion on that control? I could consider to make it Venus
> >>>>> custom control but from the use-case it looks other drivers also can
> >>>>> benefit of it.
> >>>>>
> >>>>> I tried to make more generic one [1] but it looks it will be too difficult.
> >>>>>
> >>>>
> >>>
> >>
>
> --
> regards,
> Stan
