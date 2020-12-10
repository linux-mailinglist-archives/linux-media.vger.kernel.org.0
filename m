Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61622D52BF
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 05:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgLJEVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 23:21:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgLJEVv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 23:21:51 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8C9C0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 20:21:11 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id r5so4025600eda.12
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 20:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3DiuihfBLyMU9apibQdt1KFcin0OovCF82UIujNUAC0=;
        b=F8u9kTc+QVQLiQPwOxTFAJPf0zP0VhBB3rZ5u+bCUpJDcwO+LsT8mBJNqF3PREHkUO
         LPQr9PIbd9RGpl7IhQe9QPnO2/p2Lkc2vHsgKCpzMIICv5CoMvKGyt1+Q+ivhcG6sp0b
         zq2YgI1xuU9i83GEZNTIIOwEMaHmnxoBJ5/yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3DiuihfBLyMU9apibQdt1KFcin0OovCF82UIujNUAC0=;
        b=ZTxYowp6FyisQCsFgeEbA1UHeh/6rtmJgrgzer5ef9i/qdpK7/hiv9majP5r2GEXKI
         m4KYpEDhOeKNO6F5DXHddAwvx57kk74cdZ/l/zcQrUnWOMjBqYN7VPTtuMQ8iVpdvMhz
         YV/k2rtua0R9r/1UMSFFVBMt3UFIrl279ArpUnPdAOUw3JvOL30ciTE84yzIGjCy6X4k
         BLeX70hkrgC8k8l2cfbWgFvOdBMIX+xjvThzsTOIr+PJmL3eVw7Pqx3Tw2dBNhJna67h
         9KC3axSyxzZhGN0OppkWcKjzAFWqMZluV0G+0EgZNO8nMOWZQlfnfjQvW4gLFvrCAh+d
         LKyg==
X-Gm-Message-State: AOAM531GHcz1kaYSYvObfX1CIEqEZn9+9+1FeuWBe6s8jlHqMBwH9GtH
        qI2b5IvzD0KwCq2FOch2cfWF9jG6XHDQxw==
X-Google-Smtp-Source: ABdhPJyt6jEvLkY3kAnQsVMZ9IMQGjUCutKHTWQK6N+1IfPEpuzgpJ/CI3g6hbZB/Jo4jpp+nRYlog==
X-Received: by 2002:aa7:c547:: with SMTP id s7mr4908391edr.240.1607574069497;
        Wed, 09 Dec 2020 20:21:09 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id qn4sm3332422ejb.50.2020.12.09.20.21.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 20:21:08 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id a6so3383558wmc.2
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 20:21:08 -0800 (PST)
X-Received: by 2002:a1c:5605:: with SMTP id k5mr5917328wmb.99.1607574067875;
 Wed, 09 Dec 2020 20:21:07 -0800 (PST)
MIME-Version: 1.0
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
 <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
 <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
 <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
 <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com> <210906667a4f582c81ec8375a586a5ba47b93881.camel@ndufresne.ca>
In-Reply-To: <210906667a4f582c81ec8375a586a5ba47b93881.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Dec 2020 13:20:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AraF6sf79=q848VO1tWTWj6VaeG5sa38u_k4avkTPBGA@mail.gmail.com>
Message-ID: <CAAFQd5AraF6sf79=q848VO1tWTWj6VaeG5sa38u_k4avkTPBGA@mail.gmail.com>
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

On Thu, Dec 10, 2020 at 1:59 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mercredi 09 d=C3=A9cembre 2020 =C3=A0 18:51 +0900, Tomasz Figa a =C3=
=A9crit :
> > On Wed, Dec 9, 2020 at 1:43 AM Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
> > >
> > > Le vendredi 27 novembre 2020 =C3=A0 03:13 +0900, Hirokazu Honda a =C3=
=A9crit :
> > > > HI Alexandre,
> > > >
> > > > On Tue, Nov 24, 2020 at 7:17 PM Alexandre Courbot <acourbot@chromiu=
m.org>
> > > > wrote:
> > > > >
> > > > > Hi Hiro,
> > > > >
> > > > > On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromium.or=
g>
> > > > > wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > According to the official v4l2 encoder driver usage description=
 [1],
> > > > > > v4l2 steatful encoder driver doesn't have a guarantee when fram=
es fed
> > > > > > to a driver will be returned.
> > > > > > To make sure all pending frames are output by the driver, an ap=
p must
> > > > > > call VIDIOC_ENCODER_CMD with cmd=3DV4L2_ENC_CMD_STOP.
> > > > > > However, it is not mandatory to support the command in the curr=
ent
> > > > > > v4l2 stateful encoder API specification.
> > > > > > An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> > > > > > My question is when an app has to get all the frames of an enco=
der
> > > > > > sequence, how we can achieve this without V4L2_ENC_CMD_STOP sup=
port.
> > > > > > This demand is natural and in fact WebCodecs [2] requires this.
> > > > > >
> > > > > > I think there are two options,
> > > > > > 1.) Ensure that a driver will eventually output frames if it do=
esn't
> > > > > > support V4L2_ENC_CMD_STOP.
> > > > > > 2.) Change V4L2_ENC_CMD_STOP support to be mandatory
> > > > >
> > > > > Unless I am missing the part of the spec that says the contrary,
> > > > > V4L2_ENC_CMD_STOP is part of the encoder specification, and thus =
is
> > > > > mandatory. Some older drivers might not have support for it, in s=
uch
> > > > > cases the correct course of action would be to fix them.
> > > > >
> > > >
> > > > I researched the API documents.
> > > > The statement that the support is mandatory to stateful encoders is
> > > > added from the latest document v5.9 [1],
> > > > It states optional in the API document of v4.19 and v5.8.
> > > > Hence my question is obsolete.
> > > >
> > > > [1]
> > > > https://www.kernel.org/doc/html/v5.9/userspace-api/media/v4l/vidioc=
-encoder-cmd.html
> > > > [2]
> > > > https://www.kernel.org/doc/html/v4.19/media/uapi/v4l/vidioc-encoder=
-cmd.html
> > > > [3]
> > > > https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/vidioc=
-encoder-cmd.html?highlight=3Dv4l2_enc_cmd_stop
> > >
> > > In historical drivers (Samsung MFC and perhaps Venus ?) an empty payl=
oad
> > > buffer
> > > was used to signal draining. This approach was never documented and h=
ad
> > > issues.
> > > It is still supported by MFC driver so that older Chromium / Android =
code
> > > don't
> > > fail on it (even though I doubt it has ever been retested since).
> > >
> >
> > FWIW, Chromium has not been relying on this for a long time already.
> >
> > That said, I think the question here is about a different class of
> > devices. I can imagine some encoders just simply always consuming the
> > input buffers as they come and produce corresponding bitstream buffers
> > as soon as possible, in a 1:1 relationship. In that case, there would
> > be no need for any explicit drain, because one can track which buffers
> > came already and infer whether the encoding completed for the source
> > buffer of interest.
>
> I believe we decided to make this mantory to all stateless decoder (it ma=
kes
> userspace life easier). But JPEG decoders predates the spec, so I suspect=
 a JPEG
> decoding userspace should behave as you describe to actually work with ex=
isting
> drivers. I would rather encourage having CMD_STOP in all stateless decode=
r, even
> JPEG.
>

Note that this thread is about encoders.

> >
> > Best regards,
> > Tomasz
> >
> > > >
> > > > Best Regards,
> > > > -Hiro
> > > > > >
> > > > > > Any comments are appreciated.
> > > > > > Thanks so much in advance.
> > > > > >
> > > > > > [1]
> > > > > > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/=
dev-encoder.html#drain
> > > > > > [2] https://web.dev/webcodecs/
> > > > > >
> > > > > > Sincerely,
> > > > > > -Hiro
> > >
> > >
>
>
