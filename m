Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214812D6E71
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 04:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405164AbgLKDTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 22:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392652AbgLKDSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 22:18:55 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1661FC0613CF
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 19:18:15 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id ga15so10395183ejb.4
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 19:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BT27SP90SVK2t4HUhPblhcaWtORFYnUJqYyz8d2YECM=;
        b=bHMJ8iiDNdSmZbJojU9MQQH6brz+3etX5w/zc+IQocioMklvAycDYPxQXsmZXfWc9K
         5A6yHPKhDU1mtXwES9OyQ7YQMRf69Aaih5PeTQObOu2BE4CHHnz8HvPDKKe85DcKFlGJ
         nNKRxrb+rCV3PJA96CD21AC1K90ihV6s6Jz1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BT27SP90SVK2t4HUhPblhcaWtORFYnUJqYyz8d2YECM=;
        b=Sdb10f/llocL+3SDKFsTryKX9Wc5Y/XjqRw70e1AsRdMqhUbfChuYPvQ2+BWoTPpjs
         chSPp+Vxrf1GuDf7gYGyrayd3Eu8YuwyElTQXThLrL4bURxUzWi5pfuMESwega4IHoxt
         oLFtzFpMYcmZumODZvGUeLROEdtsU2xWuK4DJzryJ1aghjWk4lKvpkoHh8fbIdZYFHI9
         MT5F0ljMwN6EQ/45IaqvJrGbbV7CSwDOSJeK6fRBGr9N/DdEstHy4e+4Dm+jT2b3CJhF
         Afhb01sfJv4JNNc/KjH9g6rY9QzUL3ftA4PgTfUNYz1rOzL4zWm2ZEEBiRnA9Jzflerc
         XRvg==
X-Gm-Message-State: AOAM530LdS/E6sDMEBOYokyAn84iWPRK77n418LxSJgHnhG6S9fJuNDu
        s8r9WFjW3F978WZrNgzPOs5E2eF9G/MO8X2b
X-Google-Smtp-Source: ABdhPJwD7GKx9i2AFwcS64hCdG3880aSpexI0nMaIKnIccjPfr2ir26puL9ifMppsj6pxbTjpeY4zQ==
X-Received: by 2002:a17:906:4a47:: with SMTP id a7mr9382002ejv.345.1607656693344;
        Thu, 10 Dec 2020 19:18:13 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id ca4sm6245795edb.80.2020.12.10.19.18.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 19:18:12 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id t16so7552888wra.3
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 19:18:12 -0800 (PST)
X-Received: by 2002:adf:93e6:: with SMTP id 93mr11327139wrp.197.1607656691682;
 Thu, 10 Dec 2020 19:18:11 -0800 (PST)
MIME-Version: 1.0
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
 <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
 <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
 <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
 <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
 <210906667a4f582c81ec8375a586a5ba47b93881.camel@ndufresne.ca>
 <CAAFQd5AraF6sf79=q848VO1tWTWj6VaeG5sa38u_k4avkTPBGA@mail.gmail.com> <366ab6d001fd2f2db41e011d7348b0b54d4a8be1.camel@ndufresne.ca>
In-Reply-To: <366ab6d001fd2f2db41e011d7348b0b54d4a8be1.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 11 Dec 2020 12:18:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BzLXnv7FY8BRi+45KrJ1Ph3PZeDS0SQe4Wkg0OYVbsxg@mail.gmail.com>
Message-ID: <CAAFQd5BzLXnv7FY8BRi+45KrJ1Ph3PZeDS0SQe4Wkg0OYVbsxg@mail.gmail.com>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 11, 2020 at 5:27 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le jeudi 10 d=C3=A9cembre 2020 =C3=A0 13:20 +0900, Tomasz Figa a =C3=A9cr=
it :
> > On Thu, Dec 10, 2020 at 1:59 AM Nicolas Dufresne <nicolas@ndufresne.ca>=
 wrote:
> > >
> > > Le mercredi 09 d=C3=A9cembre 2020 =C3=A0 18:51 +0900, Tomasz Figa a =
=C3=A9crit :
> > > > On Wed, Dec 9, 2020 at 1:43 AM Nicolas Dufresne <nicolas@ndufresne.=
ca>
> > > > wrote:
> > > > >
> > > > > Le vendredi 27 novembre 2020 =C3=A0 03:13 +0900, Hirokazu Honda a=
 =C3=A9crit :
> > > > > > HI Alexandre,
> > > > > >
> > > > > > On Tue, Nov 24, 2020 at 7:17 PM Alexandre Courbot <
> > > > > > acourbot@chromium.org>
> > > > > > wrote:
> > > > > > >
> > > > > > > Hi Hiro,
> > > > > > >
> > > > > > > On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromiu=
m.org>
> > > > > > > wrote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > According to the official v4l2 encoder driver usage descrip=
tion
> > > > > > > > [1],
> > > > > > > > v4l2 steatful encoder driver doesn't have a guarantee when =
frames
> > > > > > > > fed
> > > > > > > > to a driver will be returned.
> > > > > > > > To make sure all pending frames are output by the driver, a=
n app
> > > > > > > > must
> > > > > > > > call VIDIOC_ENCODER_CMD with cmd=3DV4L2_ENC_CMD_STOP.
> > > > > > > > However, it is not mandatory to support the command in the =
current
> > > > > > > > v4l2 stateful encoder API specification.
> > > > > > > > An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> > > > > > > > My question is when an app has to get all the frames of an =
encoder
> > > > > > > > sequence, how we can achieve this without V4L2_ENC_CMD_STOP
> > > > > > > > support.
> > > > > > > > This demand is natural and in fact WebCodecs [2] requires t=
his.
> > > > > > > >
> > > > > > > > I think there are two options,
> > > > > > > > 1.) Ensure that a driver will eventually output frames if i=
t
> > > > > > > > doesn't
> > > > > > > > support V4L2_ENC_CMD_STOP.
> > > > > > > > 2.) Change V4L2_ENC_CMD_STOP support to be mandatory
> > > > > > >
> > > > > > > Unless I am missing the part of the spec that says the contra=
ry,
> > > > > > > V4L2_ENC_CMD_STOP is part of the encoder specification, and t=
hus is
> > > > > > > mandatory. Some older drivers might not have support for it, =
in such
> > > > > > > cases the correct course of action would be to fix them.
> > > > > > >
> > > > > >
> > > > > > I researched the API documents.
> > > > > > The statement that the support is mandatory to stateful encoder=
s is
> > > > > > added from the latest document v5.9 [1],
> > > > > > It states optional in the API document of v4.19 and v5.8.
> > > > > > Hence my question is obsolete.
> > > > > >
> > > > > > [1]
> > > > > > https://www.kernel.org/doc/html/v5.9/userspace-api/media/v4l/vi=
dioc-encoder-cmd.html
> > > > > > [2]
> > > > > > https://www.kernel.org/doc/html/v4.19/media/uapi/v4l/vidioc-enc=
oder-cmd.html
> > > > > > [3]
> > > > > > https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/vi=
dioc-encoder-cmd.html?highlight=3Dv4l2_enc_cmd_stop
> > > > >
> > > > > In historical drivers (Samsung MFC and perhaps Venus ?) an empty =
payload
> > > > > buffer
> > > > > was used to signal draining. This approach was never documented a=
nd had
> > > > > issues.
> > > > > It is still supported by MFC driver so that older Chromium / Andr=
oid
> > > > > code
> > > > > don't
> > > > > fail on it (even though I doubt it has ever been retested since).
> > > > >
> > > >
> > > > FWIW, Chromium has not been relying on this for a long time already=
.
> > > >
> > > > That said, I think the question here is about a different class of
> > > > devices. I can imagine some encoders just simply always consuming t=
he
> > > > input buffers as they come and produce corresponding bitstream buff=
ers
> > > > as soon as possible, in a 1:1 relationship. In that case, there wou=
ld
> > > > be no need for any explicit drain, because one can track which buff=
ers
> > > > came already and infer whether the encoding completed for the sourc=
e
> > > > buffer of interest.
> > >
> > > I believe we decided to make this mantory to all stateless decoder (i=
t makes
> > > userspace life easier). But JPEG decoders predates the spec, so I sus=
pect a
> > > JPEG
> > > decoding userspace should behave as you describe to actually work wit=
h
> > > existing
> > > drivers. I would rather encourage having CMD_STOP in all stateless de=
coder,
> > > even
> > > JPEG.
> > >
> >
> > Note that this thread is about encoders.
>
> Sorry about that, but does it makes any difference ? The encoders for H.2=
64 and
> HEVC needs to reorder from display to encoded order. That means it will h=
old on
> bitstream buffers. Also, it's an M2M V4L2 device, so it has queues, and y=
ou'd
> have to do more work in userspace if you had two code path to drain the
> asynchronous queues.
>

A lot of the hardware encoders implement only the basic codec
features, e.g. they would only encode in-order (no B-frames), have at
most 2 reference frames, etc. In that case, it's as simple as waiting
for dequeuing a CAPTURE buffer with a timestamp matching the OUTPUT
buffer being waited on.

> >
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > > > >
> > > > > > Best Regards,
> > > > > > -Hiro
> > > > > > > >
> > > > > > > > Any comments are appreciated.
> > > > > > > > Thanks so much in advance.
> > > > > > > >
> > > > > > > > [1]
> > > > > > > > https://www.kernel.org/doc/html/latest/userspace-api/media/=
v4l/dev-encoder.html#drain
> > > > > > > > [2] https://web.dev/webcodecs/
> > > > > > > >
> > > > > > > > Sincerely,
> > > > > > > > -Hiro
> > > > >
> > > > >
> > >
> > >
>
>
