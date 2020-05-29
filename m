Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D1F1E7D0F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 14:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgE2MVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 08:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgE2MVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 08:21:39 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CF1C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 05:21:38 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id c35so1573277edf.5
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WB1duW01Zo9au19Tu6rSA7f02gS0cxMAUbfSPg0NV4c=;
        b=gx5zxQWV+Y6eG8F4uEEW6Td6z1HzHaPpgBMd1b2MIahe9XO7+JpRSRbUyxQZ6Zj6B3
         NlkRliuLWtqMeyPF01Xb8XaVT84LsAqZVsG6J/NXtDZ6EnZ6YN7MAnRdEqqAqgT8EYte
         Mzn5u/D57I82pyCqCQ1qgmQLvdc9fsoZeYz0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WB1duW01Zo9au19Tu6rSA7f02gS0cxMAUbfSPg0NV4c=;
        b=YIB+iv2psMp/vCbnS/tj+wy7xYBOuOv1HXksCvr1ufgPnJg+8fF/75ES9BSPLlmFpv
         0i/4ypdW2ZvFsoUpk0OTFATgZ4Tz2DnRp8VOGwrypeYkYXYBp/qHEqXPfRExOIuXipIP
         COlejGVJzcTSDnvkjxDQwTVGk1WjvZ/lbgEj3xycS2gP/jIrRDP+7ASkTyaPYTRq1/Iv
         LEZ69JeVUUxBF5fJS9DrWIqblGUXCT6AvGQfomJ2S3moqvKEZI2TY/WlbnIz8rY5m0yy
         g3gmrc85ftnVenGcie1s0jchbl8etXtRglaE37hEtJxGVrWbCBYw/7jfy9DGpPqRMbhz
         /ZnQ==
X-Gm-Message-State: AOAM531ufnhARvC4FBhDBFlwcirB6CSEYDQ/ZLhco/8Mr1nhfrjw1qje
        isalvmAsYNXn698jCvOm853XlxdD7QdVNQ==
X-Google-Smtp-Source: ABdhPJx97QU6nNChUH9ZsLM1KYFjlBuuByTHnVgexOmFQQ8WRy52586mXSd/5l6TWJsmhGlPkTYc8g==
X-Received: by 2002:a50:bf04:: with SMTP id f4mr7632955edk.91.1590754897045;
        Fri, 29 May 2020 05:21:37 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id dt7sm7148145ejb.33.2020.05.29.05.21.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 05:21:36 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id h4so3016209wmb.4
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 05:21:35 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr8347882wmk.55.1590754895353;
 Fri, 29 May 2020 05:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl> <15e979fa-f782-a8af-5bf3-d39e6c245b36@linaro.org>
In-Reply-To: <15e979fa-f782-a8af-5bf3-d39e6c245b36@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 May 2020 14:21:23 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DW_DNkQqoYhWDHp2bdzCcNg-eDFkXLeSmwrhOGhbs_2g@mail.gmail.com>
Message-ID: <CAAFQd5DW_DNkQqoYhWDHp2bdzCcNg-eDFkXLeSmwrhOGhbs_2g@mail.gmail.com>
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 11:57 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
>
>
> On 5/26/20 1:09 PM, Hans Verkuil wrote:
> > From: Tomasz Figa <tfiga@chromium.org>
> >
> > Due to complexity of the video encoding process, the V4L2 drivers of
> > stateful encoder hardware require specific sequences of V4L2 API calls
> > to be followed. These include capability enumeration, initialization,
> > encoding, encode parameters change, drain and reset.
> >
> > Specifics of the above have been discussed during Media Workshops at
> > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> > originated at those events was later implemented by the drivers we alre=
ady
> > have merged in mainline, such as s5p-mfc or coda.
> >
> > The only thing missing was the real specification included as a part of
> > Linux Media documentation. Fix it now and document the encoder part of
> > the Codec API.
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++++
> >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> >  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> >  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> >  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> >  5 files changed, 767 insertions(+), 20 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.r=
st
> >
>
> <cut>
>
> > +
> > +Reset
> > +=3D=3D=3D=3D=3D
> > +
> > +The client may want to request the encoder to reinitialize the encodin=
g, so
> > +that the following stream data becomes independent from the stream dat=
a
> > +generated before. Depending on the coded format, that may imply that:
> > +
> > +* encoded frames produced after the restart must not reference any fra=
mes
> > +  produced before the stop, e.g. no long term references for H.264/HEV=
C,
> > +
> > +* any headers that must be included in a standalone stream must be pro=
duced
> > +  again, e.g. SPS and PPS for H.264/HEVC.
> > +
> > +This can be achieved by performing the reset sequence.
> > +
> > +1. Perform the `Drain` sequence to ensure all the in-flight encoding f=
inishes
> > +   and respective buffers are dequeued.
> > +
> > +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAMO=
FF`. This
> > +   will return all currently queued ``CAPTURE`` buffers to the client,=
 without
> > +   valid frame data.
> > +
> > +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREAM=
ON` and
> > +   continue with regular encoding sequence. The encoded frames produce=
d into
> > +   ``CAPTURE`` buffers from now on will contain a standalone stream th=
at can be
> > +   decoded without the need for frames encoded before the reset sequen=
ce,
> > +   starting at the first ``OUTPUT`` buffer queued after issuing the
> > +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
> > +
> > +This sequence may be also used to change encoding parameters for encod=
ers
> > +without the ability to change the parameters on the fly.
>
> How the v4l2 client knows which parameters could be changed on the fly
> and which cannot? Controls should return -EBUSY?

Yes, but I guess you found the answer already. :) I guess we could add
a reference to the "Encoding Parameter Changes" section.

>
> Also could that Reset be used to change the pixel format and probably
> colorspace?

I guess it would indeed have to be used for any changes that would
affect the parameters of the encoded stream, e.g. coded resolution or
coded colorspace.

For any changes which wouldn't affect the encoded stream, e.g. a
source format change with the same crop size or a source colorspace
change while keeping the coded colorspace the same (i.e. hardware
doing the conversion), the OUTPUT queue could be reconfigured on its
own without the need to do anything to the CAPTURE queue.

Best regards,
Tomasz
