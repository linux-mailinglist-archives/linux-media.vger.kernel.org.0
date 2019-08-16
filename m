Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970538FBF4
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 09:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfHPHRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 03:17:37 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43717 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfHPHRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 03:17:37 -0400
Received: by mail-ot1-f65.google.com with SMTP id e12so8713744otp.10
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgULKTScZsxuNaa/6JFBFrQpq0BxxbCyAReSYa+M8O4=;
        b=jqycWntVCgUuk4YiTLoZ538tGBbVifFjQ2yyd+9toJpuYGHCFypPFc8EpVuHQANxRi
         Mkw8fB7PdEWXz4UOjkJXPwfZjV7htqo5D0nYeiPvsgX3FguMXFeOUOFj/Ly3E3Nf+wW4
         PX5W+rml0J42FmFo9CT/sk1dRJpzzraVWSCuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgULKTScZsxuNaa/6JFBFrQpq0BxxbCyAReSYa+M8O4=;
        b=tktXs2QuehcigMH0I66V1NLYCDRn7v9CPz+1SH77SfFovJWf4VrpKfys/EmSpCQWL/
         xiWIiNoYMV9zH080Oss/kowD64kUK30DbUlULz0cO5Yytue/2jyIhZDesKPErNdP8M1L
         i6arB94/yODxiW7XxwlFghuO8hsMqlu6JKC+x9AVDEPjHpNF+HGIpKLU09CKM5wzSaAH
         6qncFV+6oMkUmTqT3XBsILt+jTnEG82Y/RejXG4tgSOaDYJ4Gm05RhQPrwn0e9hC5Ioy
         /hXymljCRKICYTwEuz6mqaTLILfg6XOVYBXVo3bIgy8oE99GiN2tPXJQZK/j1CGO9jr1
         JB2Q==
X-Gm-Message-State: APjAAAWn0cTrW60immaGAsnj9WII5iCdAeEdv4aj380bS6/ClgV9pzch
        0OFrK/NIkSfoEUsYcqJlApVtXk98i18=
X-Google-Smtp-Source: APXvYqz2FEJzyRvxUDs7CB/BNWlvZCmOwjv7Wj1n7GnThKJ1ntD/V/qTFnx+C3UWktW5B9Es5NGYaA==
X-Received: by 2002:a9d:32d:: with SMTP id 42mr5919520otv.147.1565939856032;
        Fri, 16 Aug 2019 00:17:36 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id z26sm2103643ote.40.2019.08.16.00.17.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 00:17:35 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id o6so4120609oic.9
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 00:17:34 -0700 (PDT)
X-Received: by 2002:aca:d885:: with SMTP id p127mr3801275oig.153.1565939854426;
 Fri, 16 Aug 2019 00:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-12-hverkuil-cisco@xs4all.nl> <CAPBb6MWMeepMw=f=4DL5Qgx-H+cpsyCehyNuV5PVimEAN6nJZg@mail.gmail.com>
 <0b947ac2-6d2e-cdc9-4c0b-6eb3d5a45fbe@xs4all.nl>
In-Reply-To: <0b947ac2-6d2e-cdc9-4c0b-6eb3d5a45fbe@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 16 Aug 2019 16:17:23 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXex7F6AG6t7_VMuKD+=VGmNvJRZQB1JMbpt+Juz44MvQ@mail.gmail.com>
Message-ID: <CAPBb6MXex7F6AG6t7_VMuKD+=VGmNvJRZQB1JMbpt+Juz44MvQ@mail.gmail.com>
Subject: Re: [PATCHv2 11/12] media: docs-rst: Document m2m stateless video
 decoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Francois Buergisser <fbuergisser@google.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 16, 2019 at 3:59 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 8/16/19 7:49 AM, Alexandre Courbot wrote:
> > On Mon, Aug 12, 2019 at 8:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> From: Alexandre Courbot <acourbot@chromium.org>
> >>
> >> Documents the protocol that user-space should follow when
> >> communicating with stateless video decoders.
> >>
> >> The stateless video decoding API makes use of the new request and tags
> >> APIs. While it has been implemented with the Cedrus driver so far, it
> >> should probably still be considered staging for a short while.
> >>
> >> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >> ---
> >>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
> >>  .../media/uapi/v4l/dev-stateless-decoder.rst  | 424 ++++++++++++++++++
> >>  2 files changed, 425 insertions(+)
> >>  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst
> >>
>
> <snip>
>
> >> +Dynamic resolution change
> >> +=========================
> >> +
> >> +If the client detects a resolution change in the stream, it will need to perform
> >> +the initialization sequence again with the new resolution:
> >> +
> >> +1. If the last submitted request resulted in a ``CAPTURE`` buffer being
> >> +   held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, then the
> >> +   last frame is not available on the ``CAPTURE`` queue. In this case, a
> >> +   ``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the driver
> >> +   dequeue the held ``CAPTURE`` buffer.
> >> +
> >> +2. Wait until all submitted requests have completed and dequeue the
> >> +   corresponding output buffers.
> >> +
> >> +3. Call :c:func:`VIDIOC_STREAMOFF` on both the ``OUTPUT`` and ``CAPTURE``
> >> +   queues.
> >> +
> >> +4. Free all ``CAPTURE`` buffers by calling :c:func:`VIDIOC_REQBUFS` on the
> >> +   ``CAPTURE`` queue with a buffer count of zero.
> >> +
> >> +5. Perform the initialization sequence again (minus the allocation of
> >> +   ``OUTPUT`` buffers),
> >
> > We have just hit an issue on the Hantro driver related to this. At the
> > moment, Hantro will reject calls to VIDIOC_S_FMT on the OUTPUT queue
> > if buffers are allocated. And indeed, the documentation for
> > VIDIOC_S_FMT mentions this behavior:
> >
> >     EBUSY
> >       The device is busy and cannot change the format. This could be
> > because or the device is streaming or buffers are allocated or queued
> > to the driver.
> >
> > However in our case it does not make much sense to force reallocating
> > the OUTPUT buffers if user-space knows that the current ones are still
> > large enough for the new resolution. Should Hantro be adapted to allow
> > this, or shall we reword the specification?
> >
> > Note that if we allow this, we may also allow OUTPUT buffers to be
> > allocated before the CAPTURE format is set during the initialization
> > sequence (i.e. move step 6. somewhere after step 2.).
> >
> > Thoughts?
>
> Drivers can allow S_FMT while buffers are allocated. But it needs to be
> done carefully: for MMAP streaming mode the driver will have to check
> that the allocated buffers are large enough for the new format (you
> probably want to make a helper function for this check), for USERPTR and
> DMABUF this needs to be checked in the buf_prepare vb2 callback. This
> probably happens already.
>
> Calling S_FMT while streaming is probably not a good idea and should
> still result in a EBUSY. Mostly because it is not clear whether a S_FMT
> should take immediate effect (thus affecting all already queued buffers)
> or only with newly queued buffers. Let's just avoid this situation for
> now.

Yes, to be clear the scenario I have in mind is allowing S_FMT while
streaming is off, but OUTPUT buffers still allocated. Doing S_FMT when
streaming is on should remain prohibited.

>
> It was always the intention to relax the rules of when you can call S_FMT,
> but in most cases it is easier to just prohibit calling S_FMT when buffers
> are allocated.
>
> Regards,
>
>         Hans
