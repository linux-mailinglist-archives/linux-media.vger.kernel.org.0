Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C726A2D3F31
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 10:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgLIJwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 04:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgLIJwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 04:52:15 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E84C0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 01:51:35 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id jx16so1175459ejb.10
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mWaPsYTDL00+uiOyWpsc7v6fuctjoTRPvVHzTexun2Q=;
        b=mcItWiyR/eA+Z7NMPS7PUzcWhsAkmsp/T9Q+MqcjBKQsK3RYWYJjPDH9Lu1JxLmxLk
         zZ9VKd5PD2Zy3DYQN15ti3IAJA8RZ7yRsndRAXFHPZ/jqSpB6cU8HZQ/l4IFZXx4ct6l
         WwlEnEQuxyRGvmWItS7aVtT4adJolkFFg4XaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mWaPsYTDL00+uiOyWpsc7v6fuctjoTRPvVHzTexun2Q=;
        b=ufmVJ8JhdKCh1EInVNX1RfiTpMZPC/pVBjOSpn57BjNXRQpkm+gDaPfimhz+NoV4Xz
         rConvWn5tiUahT6UDL5lFIZzteN1ecgCfoC/uVCYmqamEtBA5vqx/LNE26v5+7i/A0yM
         GmKixJtgAEoYHhK+wjf75AatSDTlqY5f7KO6PA5d24dlAn46s1STNnSJmq8uBNwH46mI
         g/4FnXpe7M80b0o9xB6//ts0ElKdeEcd7dwAKPBiaqqmwfLushvlpEqAWp56y0I0FUpI
         rpVcvb3IE2kmY0YIhYl9CglN509CPsf0J3zCjsmzO256fwdwljOWNsaZ3b7kTVvqiisP
         aPCw==
X-Gm-Message-State: AOAM531MJalprVeVNVJAqV7voln0LMrjBVv5AnUL+3y9swWIXGIFYEk9
        zz2JCvq0bj3VIfQdHxgc6zu/ZRwKjjweqA==
X-Google-Smtp-Source: ABdhPJwkfWRHDchJHwXzRzg8Ow6CgoZDAM7yspdMCsB7QaEjg2+vKCkydMha3uYdizmR8LLpwkKY8w==
X-Received: by 2002:a17:906:b745:: with SMTP id fx5mr1304875ejb.103.1607507493532;
        Wed, 09 Dec 2020 01:51:33 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id z10sm977137ejl.30.2020.12.09.01.51.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 01:51:32 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id r3so1028467wrt.2
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 01:51:32 -0800 (PST)
X-Received: by 2002:adf:bb0e:: with SMTP id r14mr1745547wrg.159.1607507492288;
 Wed, 09 Dec 2020 01:51:32 -0800 (PST)
MIME-Version: 1.0
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
 <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
 <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com> <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
In-Reply-To: <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 9 Dec 2020 18:51:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
Message-ID: <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
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

On Wed, Dec 9, 2020 at 1:43 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le vendredi 27 novembre 2020 =C3=A0 03:13 +0900, Hirokazu Honda a =C3=A9c=
rit :
> > HI Alexandre,
> >
> > On Tue, Nov 24, 2020 at 7:17 PM Alexandre Courbot <acourbot@chromium.or=
g>
> > wrote:
> > >
> > > Hi Hiro,
> > >
> > > On Fri, Nov 13, 2020 at 6:04 PM Hirokazu Honda <hiroh@chromium.org> w=
rote:
> > > >
> > > > Hi,
> > > >
> > > > According to the official v4l2 encoder driver usage description [1]=
,
> > > > v4l2 steatful encoder driver doesn't have a guarantee when frames f=
ed
> > > > to a driver will be returned.
> > > > To make sure all pending frames are output by the driver, an app mu=
st
> > > > call VIDIOC_ENCODER_CMD with cmd=3DV4L2_ENC_CMD_STOP.
> > > > However, it is not mandatory to support the command in the current
> > > > v4l2 stateful encoder API specification.
> > > > An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
> > > > My question is when an app has to get all the frames of an encoder
> > > > sequence, how we can achieve this without V4L2_ENC_CMD_STOP support=
.
> > > > This demand is natural and in fact WebCodecs [2] requires this.
> > > >
> > > > I think there are two options,
> > > > 1.) Ensure that a driver will eventually output frames if it doesn'=
t
> > > > support V4L2_ENC_CMD_STOP.
> > > > 2.) Change V4L2_ENC_CMD_STOP support to be mandatory
> > >
> > > Unless I am missing the part of the spec that says the contrary,
> > > V4L2_ENC_CMD_STOP is part of the encoder specification, and thus is
> > > mandatory. Some older drivers might not have support for it, in such
> > > cases the correct course of action would be to fix them.
> > >
> >
> > I researched the API documents.
> > The statement that the support is mandatory to stateful encoders is
> > added from the latest document v5.9 [1],
> > It states optional in the API document of v4.19 and v5.8.
> > Hence my question is obsolete.
> >
> > [1]
> > https://www.kernel.org/doc/html/v5.9/userspace-api/media/v4l/vidioc-enc=
oder-cmd.html
> > [2]
> > https://www.kernel.org/doc/html/v4.19/media/uapi/v4l/vidioc-encoder-cmd=
.html
> > [3]
> > https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/vidioc-enc=
oder-cmd.html?highlight=3Dv4l2_enc_cmd_stop
>
> In historical drivers (Samsung MFC and perhaps Venus ?) an empty payload =
buffer
> was used to signal draining. This approach was never documented and had i=
ssues.
> It is still supported by MFC driver so that older Chromium / Android code=
 don't
> fail on it (even though I doubt it has ever been retested since).
>

FWIW, Chromium has not been relying on this for a long time already.

That said, I think the question here is about a different class of
devices. I can imagine some encoders just simply always consuming the
input buffers as they come and produce corresponding bitstream buffers
as soon as possible, in a 1:1 relationship. In that case, there would
be no need for any explicit drain, because one can track which buffers
came already and infer whether the encoding completed for the source
buffer of interest.

Best regards,
Tomasz

> >
> > Best Regards,
> > -Hiro
> > > >
> > > > Any comments are appreciated.
> > > > Thanks so much in advance.
> > > >
> > > > [1]
> > > > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-=
encoder.html#drain
> > > > [2] https://web.dev/webcodecs/
> > > >
> > > > Sincerely,
> > > > -Hiro
>
>
