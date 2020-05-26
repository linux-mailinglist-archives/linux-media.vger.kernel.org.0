Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15FF1E2646
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 18:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728732AbgEZQBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 12:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbgEZQBu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 12:01:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D8CC03E96D
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:01:50 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id se13so24361760ejb.9
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6EBJqLb4nUSpP4/NkdEYKNqLNPLFDW7Y16x0SRtaQZo=;
        b=LopSxOJC6FnKSRnl6xciNSY+TAP/7c2XjTg6CLfK/HUKHwqzEDlSRKt0TyBFAPehcY
         iHF6Q/7aXz4KZKR5+0fq7/QFxQYKAQUIJyr6UkV0MFUSQ0s5r5e1UWWwK65AsYgIrHXl
         0WtHvO9tOoVmiRqMuR8WUEojucFeylp+Ak+n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6EBJqLb4nUSpP4/NkdEYKNqLNPLFDW7Y16x0SRtaQZo=;
        b=G+RFy5r0opJQXEPwdkM8rR2Ce8aKZeickCTv/KoGOHgnH4TVk8wgPWdxGF70Y4eyZ8
         lFE6VCHGaaa/AD857e8CYuEl5XwQTQHYZ9Dnfe1YnBo6OLhhNMARYOBpmQdj/H1NlSLj
         aRzgqHa1ow7VncseMDfQv1duM+Muk6zpY8hGBYobjd4FRfUocSr1icS8vkeFjqx+3q8r
         mUUYfhfpMbbUQkzJS1BOMZRGueM3ljegbf6hQ0YQUaPXP4O+UYANZywu3MN+lQk8ZPJI
         B43a2imys+7hyAeqVB6WBcftbMd8feDFYDaODFSEBRtN9MVFgaXVJCMdgT6cZrU0CPTS
         hmEg==
X-Gm-Message-State: AOAM530SnLE1Ul8xg04I+PE48FzPXAzfB0UcmMA6O+EI9iMLI4mWgHca
        CIASUAzAFjF4iPPX65WqttF76dbSBqLapA==
X-Google-Smtp-Source: ABdhPJzqd+GYIpOlCsjAjS+KupRqmtnHvaQM/wYznu3ET2uF3SL2JtssFS4Ca7kL4oBF42H0vZ9spw==
X-Received: by 2002:a17:906:868f:: with SMTP id g15mr1709093ejx.208.1590508908623;
        Tue, 26 May 2020 09:01:48 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id c4sm231021ejz.104.2020.05.26.09.01.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 09:01:48 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id e1so20935361wrt.5
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 09:01:47 -0700 (PDT)
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr3138666wrx.17.1590508907398;
 Tue, 26 May 2020 09:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl> <a14b50176ae678904f9dd39c1bb8edbc5801a030.camel@ndufresne.ca>
 <6caf4e56-2cb3-b193-3760-3a9b3c31bfb0@xs4all.nl>
In-Reply-To: <6caf4e56-2cb3-b193-3760-3a9b3c31bfb0@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 26 May 2020 18:01:35 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AveRXvi6GO42qeLXMRLAHiE43tiNvjCKNi2WTZHkVbzQ@mail.gmail.com>
Message-ID: <CAAFQd5AveRXvi6GO42qeLXMRLAHiE43tiNvjCKNi2WTZHkVbzQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 10:32 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wr=
ote:
>
> On 20/05/2020 22:32, Nicolas Dufresne wrote:
> > Le mercredi 20 mai 2020 =C3=A0 12:01 +0200, Hans Verkuil a =C3=A9crit :
> >> From: Tomasz Figa <tfiga@chromium.org>
> >>
> >> Due to complexity of the video encoding process, the V4L2 drivers of
> >> stateful encoder hardware require specific sequences of V4L2 API calls
> >> to be followed. These include capability enumeration, initialization,
> >> encoding, encode parameters change, drain and reset.
> >>
> >> Specifics of the above have been discussed during Media Workshops at
> >> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> >> Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> >> originated at those events was later implemented by the drivers we alr=
eady
> >> have merged in mainline, such as s5p-mfc or coda.
> >>
> >> The only thing missing was the real specification included as a part o=
f
> >> Linux Media documentation. Fix it now and document the encoder part of
> >> the Codec API.
> >>
> >> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 +++++++++++++++++=
+
> >>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> >>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> >>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> >>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> >>  5 files changed, 766 insertions(+), 20 deletions(-)
> >>  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.=
rst
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/D=
ocumentation/userspace-api/media/v4l/dev-encoder.rst
>
> <snip>
>
> >> +5. **Optional** Set the coded frame interval on the ``CAPTURE`` queue=
 via
> >> +   :c:func:`VIDIOC_S_PARM`. This is only necessary if the coded frame
> >> +   interval is different from the raw frame interval, which is typica=
lly
> >> +   the case for off-line encoding.
> >> +
> >> +   * ** Required fields:**
> >> +
> >> +     ``type``
> >> +     a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> >> +
> >> +     ``parm.capture``
> >> +     set all fields except ``parm.capture.timeperframe`` to 0.
> >> +
> >> +     ``parm.capture.timeperframe``
> >> +     the desired coded frame interval; the encoder may adjust it to
> >> +     match hardware requirements.
> >> +
> >> +   * **Return fields:**
> >> +
> >> +     ``parm.capture.timeperframe``
> >> +     the adjusted frame interval.
> >> +
> >> +   .. important::
> >> +
> >> +      Changing the ``CAPTURE`` frame interval sets the framerate for =
the
> >> +      coded video. It does *not* set the rate at which buffers arrive=
 on the
> >> +      ``CAPTURE`` queue, that depends on how fast the encoder is and =
how
> >> +      fast raw frames are queued on the ``OUTPUT`` queue.
> >> +
> >> +   .. important::
> >> +
> >> +      ``timeperframe`` deals with *frames*, not fields. So for interl=
aced
> >> +      formats this is the time per two fields, since a frame consists=
 of
> >> +      a top and a bottom field.
> >> +
> >> +   .. note::
> >> +
> >> +      Not all drivers support this functionality, in that case just s=
et
> >> +      the desired coded frame interval for the ``OUTPUT`` queue.
> >
> > There is a slight contorsion in the resulting user-space API. When I
> > read this, the logical thing to do for live streams would be to just
> > set the OUTPUT and the driver will take care of CAPTURE for me.
> >
> > While if I want to do offline, I don't know if this is supported or
> > not. So the flow would be a bit special:
> >
> >   S_PARM(OUTPUT) with coded video frame rate
> >   S_PARM(CAPTURE) width coded video
> >   if ^ worked:
> >      S_PARM(OUTPUT) with fastest rate possible
> >
> > Ideally I would have preferred if there was a more straight forward way
> > to configure offline encoding for fastest performance with specific
> > coded framerate. I don't think it's a blocker though, performance is
> > not critical at all here. Maybe I'm missing something that allow to
> > check if this is supported or not without trying it ?
>
> Good point. I considered adding a flag for the v4l2_fmtdesc struct that
> reports whether you can set the capture framerate independently from the
> OUTPUT framerate. Perhaps V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL?
>
> I actually think it would be best if that's added. It is not enough to
> rely on whether S_PARM(CAPTURE) works to determine this feature since
> at least one encoder drivers supports both OUTPUT and CAPTURE with S_PARM=
,
> but CAPTURE does the same as OUTPUT, so that would be a red herring.
>
> I'll add this flag for v3.

Now if I think of it again, this behavior might be problematic for
existing userspace, which I believe assumes encoding as fast as
possible, because of how mem2mem devices were expected to behave.
Could we define this to always default to as fast as possible?
Otherwise we could end up regressing the encoding latency on latency
sensitive applications, such as video conferencing.

For example, we could define the rates of both queues the other way
around. The OUTPUT queue, which seems to be where the existing user
space currently sets the desired stream frame rate, could be
interpreted as the frame rate of the video to be encoded, while the
CAPTURE queue would control the desired output rate of the encoded
video, which would kind of match the V4L2 definition of CAPTURE frame
interval.

Best regards,
Tomasz
