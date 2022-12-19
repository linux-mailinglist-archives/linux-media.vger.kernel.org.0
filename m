Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6DC56514E8
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 22:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbiLSV3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 16:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbiLSV3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 16:29:36 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C5913F4C
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 13:29:33 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y25so15654640lfa.9
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 13:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUcJbVxMOaJY/dHHh8xvsq+/igbf7VEloWZtT9T4IzU=;
        b=rzxTEULuNPC0Sk1BptH9+AxtBNYpQ4FvyVS+RZXbKY2D7sBHJ+hvBHwrVH0tDi7Rvz
         h4OqVfIgl0PXf8Ovl/2qSyZ/KoyDOz9b003uMNhVpm1J9JtBDCAKWeuWE15pPZW2gIIv
         h2chuLEfXiovnqiNG9l6ZAuMR5mFNmzXxnQB4SVLDVxbGW409nYMSJQ8Jmpb0JuRijyo
         okvz2kocRJ8wM8Iz2aai0aQ9EMHjWfEAQzNAt/EigCOd9aZW5+sIKW1ofP+jf5VWzLqc
         ANlZC/28G3mnTqMXI1dTNeDbeSi+5h4yy7kRA41V1CQcQkqDfSx4HNK+10KuUXPbxWgi
         7jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUcJbVxMOaJY/dHHh8xvsq+/igbf7VEloWZtT9T4IzU=;
        b=sN658x1D3JIxwddZs1yot82Gr9ThocJxbukwT2hAE0XiAS7KQbXeMJ+W6PLQlF40Xa
         iOmBYpNHTaWDxtYZN3+oAzdMdwpcuFkR/gV81je+Q/+JxVg4Z+wqWLzg/Oq+y6Tt0B+q
         GGGzyEXEWzv8mLGKR1WINUambQNdw+gIWGhndTezhbqXjl/Xs7duSckgj1kdLlabxAve
         e8Sxvw0bRNQeLZEZfChCQnJnEspGIQXWomTSoF0crlfRIFPDu/O5d/QHK163qonAvbDK
         cgJqBbCYLbGMTJxSVayKZ3MFflMFV5qdKgEe3MY0lIq2rJXhNIMkje/gJO5jtL6lSYRJ
         GQPw==
X-Gm-Message-State: AFqh2krYndKV5b5Bd/4k9XJMtNWEcFgHemvRp+vFA0glDLjN06B1s5fL
        3/kr1MDFhihM9f30UbyXvOx9Mw/lhRwMEaxPoXudXgPqGrDoBab5
X-Google-Smtp-Source: AMrXdXuizsuNjhFyKkOnbtLJwUqaBbpBBlxoGkLKHoZC+MtkShGjXM8bjGIdWmzqC9sIRApRvAJrUe+gsXpQ2zhJRfc=
X-Received: by 2002:a05:6512:3f1e:b0:4c8:a047:8833 with SMTP id
 y30-20020a0565123f1e00b004c8a0478833mr206178lfa.653.1671485371730; Mon, 19
 Dec 2022 13:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20221219155616.848690-1-benjamin.gaignard@collabora.com>
 <20221219155616.848690-4-benjamin.gaignard@collabora.com> <07747babe7f83a496f9cd82849c6c2386550ac28.camel@ndufresne.ca>
In-Reply-To: <07747babe7f83a496f9cd82849c6c2386550ac28.camel@ndufresne.ca>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 19 Dec 2022 18:29:20 -0300
Message-ID: <CAAEAJfDoX_aSTg1TO8F21iSriYeTXtRbHPo8wxx5br2v6eCt7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] media: verisilicon: Save bit depth for AV1 decoder
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        daniel.almeida@collabora.com, nicolas.dufresne@collabora.co.uk,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bonjour Nicolas,

On Mon, Dec 19, 2022 at 5:37 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le lundi 19 d=C3=A9cembre 2022 =C3=A0 16:56 +0100, Benjamin Gaignard a =
=C3=A9crit :
> > Store bit depth information from AV1 sequence control.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> >  .../media/platform/verisilicon/hantro_drv.c   | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/=
media/platform/verisilicon/hantro_drv.c
> > index 4500e1fc0f2c..8e93710dcfed 100644
> > --- a/drivers/media/platform/verisilicon/hantro_drv.c
> > +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> > @@ -324,6 +324,25 @@ static int hantro_vp9_s_ctrl(struct v4l2_ctrl *ctr=
l)
> >       return 0;
> >  }
> >
> > +static int hantro_av1_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct hantro_ctx *ctx;
> > +
> > +     ctx =3D container_of(ctrl->handler,
> > +                        struct hantro_ctx, ctrl_handler);
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_STATELESS_AV1_SEQUENCE:
> > +             ctx->bit_depth =3D ctrl->p_new.p_av1_sequence->bit_depth;
>
> That seems a little be weak, what happens if you change the bit_depth wit=
h a
> non-request s_ctrl while its decoding ? To be this deserve a little bit o=
f
> protection, a something that validate and copy it at the start of the dec=
oding.
>

Oh, nice catch. We need to return EBUSY, see
https://www.kernel.org/doc/html/v5.0/media/uapi/v4l/buffer.html#interaction=
s-between-formats-controls-and-buffers.

There's already an API in the V4L2 control framework for drivers to use,
see v4l2_ctrl_grab in
https://www.kernel.org/doc/html/v5.0/media/kapi/v4l2-controls.html#active-a=
nd-grabbed-controls.

> p.s. I know, VP9 seems similar, though arguably that was copied from jpeg=
, for
> which it seems totally save to change the quality at run-time.
>

No, wasn't copied from JPEG :-) I just didn't realize this was an
issue, but it is
given the bit_depth affects the buffers so you are correct, it needs
to be fixed for VP9 too.

Thanks!
Ezequiel

> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +
> >  static const struct v4l2_ctrl_ops hantro_ctrl_ops =3D {
> >       .try_ctrl =3D hantro_try_ctrl,
> >  };
> > @@ -336,6 +355,12 @@ static const struct v4l2_ctrl_ops hantro_vp9_ctrl_=
ops =3D {
> >       .s_ctrl =3D hantro_vp9_s_ctrl,
> >  };
> >
> > +static const struct v4l2_ctrl_ops hantro_av1_ctrl_ops =3D {
> > +     .try_ctrl =3D hantro_try_ctrl,
> > +     .s_ctrl =3D hantro_av1_s_ctrl,
> > +};
> > +
> > +
> >  #define HANTRO_JPEG_ACTIVE_MARKERS   (V4L2_JPEG_ACTIVE_MARKER_APP0 | \
> >                                        V4L2_JPEG_ACTIVE_MARKER_COM | \
> >                                        V4L2_JPEG_ACTIVE_MARKER_DQT | \
> > @@ -513,6 +538,7 @@ static const struct hantro_ctrl controls[] =3D {
> >               .codec =3D HANTRO_AV1_DECODER,
> >               .cfg =3D {
> >                       .id =3D V4L2_CID_STATELESS_AV1_SEQUENCE,
> > +                     .ops =3D &hantro_av1_ctrl_ops,
> >               },
> >       }, {
> >               .codec =3D HANTRO_AV1_DECODER,
>
