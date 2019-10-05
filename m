Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 739F3CC8BD
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 10:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfJEIXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 04:23:05 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42292 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEIXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 04:23:04 -0400
Received: by mail-ed1-f65.google.com with SMTP id y91so8028982ede.9
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdnBqyfiv6esed4i9+J42I2rqQSTjBsLbWy552EZbpw=;
        b=hZNbXX4ATQCRh+CmfA4/nqSE01XGfCh1srifOcIshm630sF21R8rA70sJwD96OTcPK
         ijq/W5lpgFm+b793BJvuT04undgMxDpvntrSuH0i8tOoLSluDbeIju6P4PSyvvO/QgDk
         DKpsj5undze4F6qdlnr72ueIX3nhI0JDCcpVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdnBqyfiv6esed4i9+J42I2rqQSTjBsLbWy552EZbpw=;
        b=RZJuW3RQp691Vrl7OSFIu7hYG40fmIVK1dWCGVgJVi6ENZDN6eqCYvGSYfhFFawyCM
         MBYJ0uRvUGWcNtjFBeDzqV/RoWqJSgQF9676m46xgaGTORmy2i7lMMd/E2VYG2O1GxAH
         4PyEMvETOSPYh76VtK8VQGZWKHbgVPFHc3Lq9UGIO1CrHuR1nRGDt9dEes0Jn5s/B7hO
         ZaF4X+G1JMREnHA5k0YnkxkOcpSDLiQCHM6/MlryPmhkBmhbg/8Rp8xWfAKYoMjvHaKI
         xtzP2I8lDnK4CA/VkSnzPTNFmzrmbDFSNMSSqNN1XeviVaR/J3LmfwpHinJNP/Tp8lAJ
         bmAA==
X-Gm-Message-State: APjAAAXCqrVeJ7/X9eGm3HSf0UrPHhGlp+7ucq34gu7FjdDaz+N/X5kr
        yWu3+KF71zW2axBFOvzbuMzxoM7uWkCdrg==
X-Google-Smtp-Source: APXvYqw8itNp/ZuKG7B1+d+jFRfKNZvMaObVH09IKgrXIz/UtLMFKHZBpbwyoDQm8mSVEgTn5mNfJQ==
X-Received: by 2002:a17:906:6994:: with SMTP id i20mr15672483ejr.239.1570263782621;
        Sat, 05 Oct 2019 01:23:02 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a8sm933499ejp.58.2019.10.05.01.23.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 01:23:01 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id r5so9630905wrm.12
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 01:23:01 -0700 (PDT)
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr15726386wrt.100.1570263781012;
 Sat, 05 Oct 2019 01:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190905114210.9232-1-p.zabel@pengutronix.de> <20191003211247.GC3927@aptenodytes>
In-Reply-To: <20191003211247.GC3927@aptenodytes>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 5 Oct 2019 17:22:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
Message-ID: <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
Subject: Re: [PATCH] media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active
 fields
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 4, 2019 at 6:12 AM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> > To explain why num_ref_idx_active_override_flag is not part of the API,
> > describe how the num_ref_idx_l[01]_active_minus1 fields and the
> > num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> > whether the decoder parses slice headers itself or not.
>
> Is there any particular reason why this is preferable to exposing the flag?
> It feels like having the flag around sticks closer to the bitstream,
> so it's more straightforward for everyone.
>
> In case there's only one set of fields exposed by the hardware (and it doesn't
> do slice parsing itself), we could always check the flag in the driver and use
> either the default PPS values or the slice-specific values there.
>
> What do you think?

IMHO it would only add further logic to the drivers, because they
would need to have a conditional block that selects default or
per-slice value based on the flag. The goal was to be able for the
driver to just passively write num_ref_idx_l[01]_active_minus1 (or the
default one for slice-parsing hardware) to corresponding hardware
registers.

We're talking about kernel drivers here and for security reasons any
logic should be reduced to the strictly necessary minimum.

Best regards,
Tomasz

>
> Cheers,
>
> Paul
>
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index bc5dd8e76567..b9834625a939 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        -
> >      * - __u8
> >        - ``num_ref_idx_l0_default_active_minus1``
> > -      -
> > +      - This field is only used by decoders that parse slices themselves.
> >      * - __u8
> >        - ``num_ref_idx_l1_default_active_minus1``
> > -      -
> > +      - This field is only used by decoders that parse slices themselves.
> >      * - __u8
> >        - ``weighted_bipred_idc``
> >        -
> > @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        -
> >      * - __u8
> >        - ``num_ref_idx_l0_active_minus1``
> > -      -
> > +      - This field is used by decoders that do not parse slices themselves.
> > +        If num_ref_idx_active_override_flag is not set, this field must be
> > +        set to the value of num_ref_idx_l0_default_active_minus1.
> >      * - __u8
> >        - ``num_ref_idx_l1_active_minus1``
> > -      -
> > +      - This field is used by decoders that do not parse slices themselves.
> > +        If num_ref_idx_active_override_flag is not set, this field must be
> > +        set to the value of num_ref_idx_l1_default_active_minus1.
> >      * - __u32
> >        - ``slice_group_change_cycle``
> >        -
> > --
> > 2.20.1
> >
>
> --
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
