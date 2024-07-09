Return-Path: <linux-media+bounces-14794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E792C1FE
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 19:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298521F2273D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 17:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E791418785F;
	Tue,  9 Jul 2024 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvGIhPGH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E618784D
	for <linux-media@vger.kernel.org>; Tue,  9 Jul 2024 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720544033; cv=none; b=gQSm5t22e9UUQGGKl4yS/pYe7za5Ehqlrnce9Jhgn7gx7rZe8qt/P+Dvu7nqV1BNVjkbkVHZYhOx44RyUqIdM0CjoIRfOdzOU7YIWM/JJroF8VbYkFUClAgfuqWhpSKCczxTYjPeq3PYJvf6LNT4AxHxXXpVrxkkXWiJFrY52s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720544033; c=relaxed/simple;
	bh=wR+C36OB9iAOeSQMgR9p8NDIylKarIm4/IB+rPYXx0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQjKoQjwXBBhsUht1W0d9Z+QKkG1VEareTtvyMvBmZrIr1asOn8ByKJO9T6vB0jg9Cvh3OPFf1rl1fAEd6kuZYRH9gU1P+f3oOee50/+bONzcemXATo8jVUJYadVbyG6sVo6ET3hJftVDCSmJ7zFdFTnlVXcEucMu7eOqOLN634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvGIhPGH; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c5362c7c0bso3176687a91.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jul 2024 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720544031; x=1721148831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHII0RsSLF1JUF/OVR8jZ9q4RDXTkpBc5Lp9NhAeQ/Y=;
        b=CvGIhPGHbsdcnpDuYq1BzAYS98wFV9cByy1mVESGmuU+3VJp0e+rd80ZhRB7LSoC3q
         SMNBp+Ad3XRu+TDpm9BKvab7D00PowcACx+4MHacQnl5thee+bREKxvoJB3xnvLSYeoj
         HZ0s3NC2V6/rq+WDPCZ6joM0ki3d18yixGNlhkDCU9yLUjg3/a59rmu8fuMbtuobuPeF
         R3v3yWWIVur0LYVC/YF68i8BIAe/F94amEDjPgJOsPfeddKtpJCzjfmvu5gW0KbVcGu3
         IPTO2/3R5hdzy9t5uriXmZs3O6hP9B9aeMp821ndPkUrmFkautusVkARZr/q6GmVoci+
         zhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720544031; x=1721148831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHII0RsSLF1JUF/OVR8jZ9q4RDXTkpBc5Lp9NhAeQ/Y=;
        b=HClm0L4/vlnCpgwep77Xiwmtu9ORPIH7YHnOLrN5+6F0Z7oh5J/OK56NZxkvh94SoE
         c/aywBrwYKdiKEQmtuhX2pEui75OtHGQx6mvGH+DBRHejqRoF/ByZoEcbENhjNYCsysU
         0s16ZvO0c0bXmuR8KUFJYLR+s5CaTMLlEM9j+jIgnJVq8PTDxH2lTifCG7shIWGoIZVl
         njPO/VBuxsjAfgUsb0oZWlye8DE43J3E22ZcMzuSlwoYAa+T2T2CHLjZ7GdAAzBevTxe
         0FvR6PP5eBRSHb5hA+/Mni6L+scgd3t9C9O21A7Sedma/QMGLBHB/FECsJAoW5VHQkL7
         w+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6OyiZhWB16gidDFB5STM5dxolJs5+12RH0DNJ2Rf1+26ZL6Mda7tDGplzBQujjB454veLeHJBdZmDPxPpJyWzvEZ4oEEDjjt0Esk=
X-Gm-Message-State: AOJu0YzSSS5hQXdSGl891Y9ytzHN1wzSppY+0i+VXYWaa19RZmjpi/at
	9jU7N9qsDz6tsAz8I5RCA3waZnieEmbygVy0OpCBsM4iBwycgdjQR0CFadiMw4psvoIFAX4A0ZG
	5BJCd9wK7+s+0bUTO7PZ26dRAMRddTQ==
X-Google-Smtp-Source: AGHT+IEo1dQhIAZnE2VHUejd64VEaiPa4ctlB2tHNgsKv2jDKWmWEbv0jQC47eE92vjXiNOCHRe2y5y7FmgMEhytyF0=
X-Received: by 2002:a05:6a20:2d12:b0:1c2:9095:7382 with SMTP id
 adf61e73a8af0-1c2984e1086mr3344241637.52.1720544030612; Tue, 09 Jul 2024
 09:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
 <20240704154932.6686-6-laurent.pinchart@ideasonboard.com> <ZofcaNNO7wTndvNu@pyrite.rasen.tech>
In-Reply-To: <ZofcaNNO7wTndvNu@pyrite.rasen.tech>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 9 Jul 2024 11:53:38 -0500
Message-ID: <CAHCN7xKgYx8NYq9EBMS7Yt1hjNCnuraNtm6sErrnDFK5QWOiHg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: rkisp1: Add support for the companding block
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Dafna Hirschfeld <dafna@fastmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 6:43=E2=80=AFAM Paul Elder <paul.elder@ideasonboard.=
com> wrote:
>
> On Thu, Jul 04, 2024 at 06:49:32PM +0300, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> >
> > Add support to the rkisp1 driver for the companding block that exists o=
n
> > the i.MX8MP version of the ISP. This requires usage of the new
> > extensible parameters format, and showcases how the format allows for
> > extensions without breaking backward compatibility.
> >
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

If you guys send me instructions on how to use these new features, I
can test this on an 8MP w/ a Sony imx219 sensor configured in 4-lane
mode.

adam

>
> > ---
> > Changes since v1:
> >
> > - Refactor rkisp1_compand_write_px_curve()
> > - Use unsigned int instead of size_t for loop indices
> > - Hardcode RKISP1_CIF_ISP_COMPAND_NUM_POINTS points
> > - Rename RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES to
> >   RKISP1_CIF_ISP_COMPAND_NUM_POINTS
> > - Add comment to explain why rkisp1_ext_params_compand_curve_config is
> >   counted twice in RKISP1_EXT_PARAMS_MAX_SIZE
> > - Fix typo
> >
> > Changes since v0:
> >
> > - Drop RKISP1_EXT_PARAM_BUFFER_V2
> > - Use common structure for compression and expansion curves
> > - Rename config fields in rkisp1_ext_params_*_config to just config
> > - Mention block type in structures documentation
> > - Constify arguments
> > - Replace __uxx types with uxx
> > - Use rkisp1_bls_swap_regs() helper in rkisp1_compand_bls_config()
> > - Use generic feature handling mechanism
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 168 ++++++++++++++++++
> >  include/uapi/linux/rkisp1-config.h            |  89 +++++++++-
> >  2 files changed, 256 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 20bc6d582527..430d36aedd76 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> >   */
> >
> > +#include <linux/math.h>
> >  #include <linux/string.h>
> >
> >  #include <media/v4l2-common.h>
> > @@ -57,6 +58,8 @@ union rkisp1_ext_params_config {
> >       struct rkisp1_ext_params_hst_config hst;
> >       struct rkisp1_ext_params_aec_config aec;
> >       struct rkisp1_ext_params_afc_config afc;
> > +     struct rkisp1_ext_params_compand_bls_config compand_bls;
> > +     struct rkisp1_ext_params_compand_curve_config compand_curve;
> >  };
> >
> >  enum rkisp1_params_formats {
> > @@ -1258,6 +1261,93 @@ rkisp1_dpf_strength_config(struct rkisp1_params =
*params,
> >       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_R, arg->=
r);
> >  }
> >
> > +static void rkisp1_compand_write_px_curve(struct rkisp1_params *params=
,
> > +                                       unsigned int addr, const u8 *cu=
rve)
> > +{
> > +     const unsigned int points_per_reg =3D 6;
> > +     const unsigned int num_regs =3D
> > +             DIV_ROUND_UP(RKISP1_CIF_ISP_COMPAND_NUM_POINTS,
> > +                          points_per_reg);
> > +
> > +     /*
> > +      * The compand curve is specified as a piecewise linear function =
with
> > +      * 64 points. X coordinates are stored as a log2 of the displacem=
ent
> > +      * from the previous point, in 5 bits, with 6 values per register=
. The
> > +      * last register stores 4 values.
> > +      */
> > +     for (unsigned int reg =3D 0; reg < num_regs; ++reg) {
> > +             unsigned int num_points =3D
> > +                     min(RKISP1_CIF_ISP_COMPAND_NUM_POINTS -
> > +                         reg * points_per_reg, points_per_reg);
> > +             u32 val =3D 0;
> > +
> > +             for (unsigned int i =3D 0; i < num_points; i++)
> > +                     val |=3D (*curve++ & 0x1f) << (i * 5);
> > +
> > +             rkisp1_write(params->rkisp1, addr, val);
> > +             addr +=3D 4;
> > +     }
> > +}
> > +
> > +static void
> > +rkisp1_compand_write_curve_mem(struct rkisp1_params *params,
> > +                            unsigned int reg_addr, unsigned int reg_da=
ta,
> > +                            const u32 curve[RKISP1_CIF_ISP_COMPAND_NUM=
_POINTS])
> > +{
> > +     for (unsigned int i =3D 0; i < RKISP1_CIF_ISP_COMPAND_NUM_POINTS;=
 i++) {
> > +             rkisp1_write(params->rkisp1, reg_addr, i);
> > +             rkisp1_write(params->rkisp1, reg_data, curve[i]);
> > +     }
> > +}
> > +
> > +static void
> > +rkisp1_compand_bls_config(struct rkisp1_params *params,
> > +                       const struct rkisp1_cif_isp_compand_bls_config =
*arg)
> > +{
> > +     static const u32 regs[] =3D {
> > +             RKISP1_CIF_ISP_COMPAND_BLS_A_FIXED,
> > +             RKISP1_CIF_ISP_COMPAND_BLS_B_FIXED,
> > +             RKISP1_CIF_ISP_COMPAND_BLS_C_FIXED,
> > +             RKISP1_CIF_ISP_COMPAND_BLS_D_FIXED,
> > +     };
> > +     u32 swapped[4];
> > +
> > +     rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
> > +
> > +     rkisp1_write(params->rkisp1, swapped[0], arg->r);
> > +     rkisp1_write(params->rkisp1, swapped[1], arg->gr);
> > +     rkisp1_write(params->rkisp1, swapped[2], arg->gb);
> > +     rkisp1_write(params->rkisp1, swapped[3], arg->b);
> > +}
> > +
> > +static void
> > +rkisp1_compand_expand_config(struct rkisp1_params *params,
> > +                          const struct rkisp1_cif_isp_compand_curve_co=
nfig *arg)
> > +{
> > +     rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_EXPA=
ND_PX_N(0),
> > +                                   arg->px);
> > +     rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXP=
AND_Y_ADDR,
> > +                                    RKISP1_CIF_ISP_COMPAND_EXPAND_Y_WR=
ITE_DATA,
> > +                                    arg->y);
> > +     rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXP=
AND_X_ADDR,
> > +                                    RKISP1_CIF_ISP_COMPAND_EXPAND_X_WR=
ITE_DATA,
> > +                                    arg->x);
> > +}
> > +
> > +static void
> > +rkisp1_compand_compress_config(struct rkisp1_params *params,
> > +                            const struct rkisp1_cif_isp_compand_curve_=
config *arg)
> > +{
> > +     rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_COMP=
RESS_PX_N(0),
> > +                                   arg->px);
> > +     rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COM=
PRESS_Y_ADDR,
> > +                                    RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_=
WRITE_DATA,
> > +                                    arg->y);
> > +     rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COM=
PRESS_X_ADDR,
> > +                                    RKISP1_CIF_ISP_COMPAND_COMPRESS_X_=
WRITE_DATA,
> > +                                    arg->x);
> > +}
> > +
> >  static void
> >  rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> >                           const struct rkisp1_params_cfg *new_params)
> > @@ -1844,6 +1934,66 @@ rkisp1_ext_params_afcm(struct rkisp1_params *par=
ams,
> >                                     RKISP1_CIF_ISP_AFM_ENA);
> >  }
> >
> > +static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params=
,
> > +                                       const union rkisp1_ext_params_c=
onfig *block)
> > +{
> > +     const struct rkisp1_ext_params_compand_bls_config *bls =3D
> > +             &block->compand_bls;
> > +
> > +     if (bls->header.enable =3D=3D RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > +             rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CT=
RL,
> > +                                     RKISP1_CIF_ISP_COMPAND_CTRL_BLS_E=
NABLE);
> > +             return;
> > +     }
> > +
> > +     rkisp1_compand_bls_config(params, &bls->config);
> > +
> > +     if (!(params->enabled_blocks &
> > +           BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS)))
> > +             rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL=
,
> > +                                   RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENA=
BLE);
> > +}
> > +
> > +static void rkisp1_ext_params_compand_expand(struct rkisp1_params *par=
ams,
> > +                                          const union rkisp1_ext_param=
s_config *block)
> > +{
> > +     const struct rkisp1_ext_params_compand_curve_config *curve =3D
> > +             &block->compand_curve;
> > +
> > +     if (curve->header.enable =3D=3D RKISP1_EXT_PARAMS_BLOCK_DISABLE) =
{
> > +             rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CT=
RL,
> > +                                     RKISP1_CIF_ISP_COMPAND_CTRL_EXPAN=
D_ENABLE);
> > +             return;
> > +     }
> > +
> > +     rkisp1_compand_expand_config(params, &curve->config);
> > +
> > +     if (!(params->enabled_blocks &
> > +           BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND)))
> > +             rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL=
,
> > +                                   RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_=
ENABLE);
> > +}
> > +
> > +static void rkisp1_ext_params_compand_compress(struct rkisp1_params *p=
arams,
> > +                                            const union rkisp1_ext_par=
ams_config *block)
> > +{
> > +     const struct rkisp1_ext_params_compand_curve_config *curve =3D
> > +             &block->compand_curve;
> > +
> > +     if (curve->header.enable =3D=3D RKISP1_EXT_PARAMS_BLOCK_DISABLE) =
{
> > +             rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CT=
RL,
> > +                                     RKISP1_CIF_ISP_COMPAND_CTRL_COMPR=
ESS_ENABLE);
> > +             return;
> > +     }
> > +
> > +     rkisp1_compand_compress_config(params, &curve->config);
> > +
> > +     if (!(params->enabled_blocks &
> > +           BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS)))
> > +             rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL=
,
> > +                                   RKISP1_CIF_ISP_COMPAND_CTRL_COMPRES=
S_ENABLE);
> > +}
> > +
> >  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> >                            const union rkisp1_ext_params_config *config=
);
> >
> > @@ -1939,6 +2089,24 @@ static const struct rkisp1_ext_params_handler {
> >               .handler        =3D rkisp1_ext_params_afcm,
> >               .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >       },
> > +     [RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] =3D {
> > +             .size           =3D sizeof(struct rkisp1_ext_params_compa=
nd_bls_config),
> > +             .handler        =3D rkisp1_ext_params_compand_bls,
> > +             .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +             .features       =3D RKISP1_FEATURE_COMPAND,
> > +     },
> > +     [RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] =3D {
> > +             .size           =3D sizeof(struct rkisp1_ext_params_compa=
nd_curve_config),
> > +             .handler        =3D rkisp1_ext_params_compand_expand,
> > +             .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +             .features       =3D RKISP1_FEATURE_COMPAND,
> > +     },
> > +     [RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] =3D {
> > +             .size           =3D sizeof(struct rkisp1_ext_params_compa=
nd_curve_config),
> > +             .handler        =3D rkisp1_ext_params_compand_compress,
> > +             .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +             .features       =3D RKISP1_FEATURE_COMPAND,
> > +     },
> >  };
> >
> >  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rk=
isp1-config.h
> > index 00b09c92cca7..c645db36f2f6 100644
> > --- a/include/uapi/linux/rkisp1-config.h
> > +++ b/include/uapi/linux/rkisp1-config.h
> > @@ -164,6 +164,11 @@
> >  #define RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS      17
> >  #define RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS  6
> >
> > +/*
> > + * Compand
> > + */
> > +#define RKISP1_CIF_ISP_COMPAND_NUM_POINTS    64
> > +
> >  /*
> >   * Measurement types
> >   */
> > @@ -851,6 +856,39 @@ struct rkisp1_params_cfg {
> >       struct rkisp1_cif_isp_isp_other_cfg others;
> >  };
> >
> > +/**
> > + * struct rkisp1_cif_isp_compand_bls_config - Rockchip ISP1 Companding=
 parameters (BLS)
> > + * @r: Fixed subtraction value for Bayer pattern R
> > + * @gr: Fixed subtraction value for Bayer pattern Gr
> > + * @gb: Fixed subtraction value for Bayer pattern Gb
> > + * @b: Fixed subtraction value for Bayer pattern B
> > + *
> > + * The values will be subtracted from the sensor values. Note that unl=
ike the
> > + * dedicated BLS block, the BLS values in the compander are 20-bit uns=
igned.
> > + */
> > +struct rkisp1_cif_isp_compand_bls_config {
> > +     __u32 r;
> > +     __u32 gr;
> > +     __u32 gb;
> > +     __u32 b;
> > +};
> > +
> > +/**
> > + * struct rkisp1_cif_isp_compand_curve_config - Rockchip ISP1 Compandi=
ng
> > + * parameters (expand and compression curves)
> > + * @px: Compand curve x-values. Each value stores the distance from th=
e
> > + *      previous x-value, expressed as log2 of the distance on 5 bits.
> > + * @x: Compand curve x-values. The functionality of these parameters a=
re
> > + *     unknown due to do a lack of hardware documentation, but these a=
re left
> > + *     here for future compatibility purposes.
> > + * @y: Compand curve y-values
> > + */
> > +struct rkisp1_cif_isp_compand_curve_config {
> > +     __u8 px[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
> > +     __u32 x[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
> > +     __u32 y[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
> > +};
> > +
> >  /*---------- PART2: Measurement Statistics ------------*/
> >
> >  /**
> > @@ -1018,6 +1056,9 @@ struct rkisp1_stat_buffer {
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand cur=
ve
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress=
 curve
> >   */
> >  enum rkisp1_ext_params_block_type {
> >       RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > @@ -1037,6 +1078,9 @@ enum rkisp1_ext_params_block_type {
> >       RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> >       RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> >       RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> > +     RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
> > +     RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
> > +     RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
> >  };
> >
> >  /**
> > @@ -1384,6 +1428,46 @@ struct rkisp1_ext_params_afc_config {
> >       struct rkisp1_cif_isp_afc_config config;
> >  } __attribute__((aligned(8)));
> >
> > +/**
> > + * struct rkisp1_ext_params_compand_bls_config - RkISP1 extensible par=
ams
> > + * Compand BLS config
> > + *
> > + * RkISP1 extensible parameters Companding configuration block (black =
level
> > + * subtraction). Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_C=
OMPAND_BLS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *       :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Companding BLS configuration, see
> > + *       :c:type:`rkisp1_cif_isp_compand_bls_config`
> > + */
> > +struct rkisp1_ext_params_compand_bls_config {
> > +     struct rkisp1_ext_params_block_header header;
> > +     struct rkisp1_cif_isp_compand_bls_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_compand_curve_config - RkISP1 extensible p=
arams
> > + * Compand curve config
> > + *
> > + * RkISP1 extensible parameters Companding configuration block (expand=
 and
> > + * compression curves). Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND`or
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *       :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Companding curve configuration, see
> > + *       :c:type:`rkisp1_cif_isp_compand_curve_config`
> > + */
> > +struct rkisp1_ext_params_compand_curve_config {
> > +     struct rkisp1_ext_params_block_header header;
> > +     struct rkisp1_cif_isp_compand_curve_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/*
> > + * The rkisp1_ext_params_compand_curve_config structure is counted twi=
ce as it
> > + * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block type=
s.
> > + */
> >  #define RKISP1_EXT_PARAMS_MAX_SIZE                                   \
> >       (sizeof(struct rkisp1_ext_params_bls_config)                    +=
\
> >       sizeof(struct rkisp1_ext_params_dpcc_config)                    +=
\
> > @@ -1401,7 +1485,10 @@ struct rkisp1_ext_params_afc_config {
> >       sizeof(struct rkisp1_ext_params_awb_meas_config)                +=
\
> >       sizeof(struct rkisp1_ext_params_hst_config)                     +=
\
> >       sizeof(struct rkisp1_ext_params_aec_config)                     +=
\
> > -     sizeof(struct rkisp1_ext_params_afc_config))
> > +     sizeof(struct rkisp1_ext_params_afc_config)                     +=
\
> > +     sizeof(struct rkisp1_ext_params_compand_bls_config)             +=
\
> > +     sizeof(struct rkisp1_ext_params_compand_curve_config)           +=
\
> > +     sizeof(struct rkisp1_ext_params_compand_curve_config))
> >
> >  /**
> >   * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters=
 version
>

