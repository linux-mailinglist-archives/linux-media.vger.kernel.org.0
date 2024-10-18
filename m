Return-Path: <linux-media+bounces-19856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D19A3D7C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 239ADB252DD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940E9EEDE;
	Fri, 18 Oct 2024 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M59FOIaN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A49476;
	Fri, 18 Oct 2024 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729251966; cv=none; b=ho6zA7c4BoDs/KO0V9R7gI3AR7NPp0hQ3TxrYOhcD31WyiZ9tzGYjH3PEIBsWuwsqPYgjcLhDvj2VuBNOFd21QmORKx6s/pyrpwhRCp3P7XZipIDSMHixnL6OL1uUK/GTSSCyN3UFLP9v99U41jVIIFjVUTdxVQkLmlrryvzK8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729251966; c=relaxed/simple;
	bh=W0srQg2wqI85CNHH0gsvNkb6VWnma1Bw0s1E3KVJNgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdTFRdiyGc179Ftff2nUGkldsfp6mIvlVfu+f97483L0yHtNpR2Xs6cTjm57A9nx7jz3qfglqVQKOvo4Vv4hFYAjgz7bRWYmQF38E7FIBSmMyUkPA9YoZU9cEMo+TvWMk9MJs8R221NxrOfuJdOXyDjrNCTplpVLFwarVSs3Bpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M59FOIaN; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-50d3365c29cso1610190e0c.0;
        Fri, 18 Oct 2024 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729251963; x=1729856763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+05Uobe0HKnShTKGIax79/dC/4ByIKxrjDbK/LdwyzQ=;
        b=M59FOIaNwecCwkNftos45eEaEZ236azNPiTQiouyERnRwBumc0t6J3SbW3+Efo7/D8
         kXsfnKIf7IDro16IkKci95HJeGTe6Tk8JHxgJvIGxaUk5EnodaSTmpsV+4QaqeWyi6Bf
         zgdpGZJ4B9/nFoZ/SaF8exvKjqS2UW+0eSf4UVij8C63FPfIinODAvTfceAr6OSiXoig
         HAqgXdhXHpBrdIt2fLuxAQOcaOKkVvlKYvTNPcYESVy5KvmJxdHBabT7Fq76DisgGGaW
         1lyUM+nywVqyJnrKNE+opsXUYi4wbxpJVkIHQqo9DFFcfpgTTV6edp5JfGVJGw+if4zh
         K7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729251963; x=1729856763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+05Uobe0HKnShTKGIax79/dC/4ByIKxrjDbK/LdwyzQ=;
        b=spU4NlKHqxAOSl9orwGSm2n0rMPDnvQMmV8okjpnhReXrZYjbqOsvaoIkx5tjMnHYz
         jHVWw7M7yx+lvYyhzlcWAdl/wPW17j3qx+bXO8nxfjnNNrsdI0DNXjTxoOQTxsDucoP4
         dmjqLkzdpuvAhjxZLNnYiHbnHT9JbZMvpeEIQgD6N3tohUkkQyx/LeKC3v/qjh8JLeYI
         mlCSwPkzWP2aFPyvd6gGJqFK5sHTNen2pfbDvwJJYkclGMT7F1idQzI+hoVmbz2fcdAc
         NqhNMKVot5ycCKPqcXOgp5pOtZHmxy3F9gP4zJqsvsxYWYFPtRLOjGiy5EJZPzGe6Gj/
         5a6g==
X-Forwarded-Encrypted: i=1; AJvYcCVTzcWmo8XJYcg/P6bHZaSFG1Cvz36wHXq6ak5sV9JsCsXqzfintXBFDV82RXuOgSmoVEsgS50oWa73O2w=@vger.kernel.org, AJvYcCVY+QivjmKEoKNMq9ROcMWXfTsALboqMbBJvMn2kTQRsLHveyH2Mb/tcfRLLJvq8glZKJgZpiIOaEijjhrr7BX66Ag=@vger.kernel.org, AJvYcCWa/IxkIVfcKHqK2uBbLi+hN5g21AFAv1bDbTVeBhC5f8WKQOZvbCThvEi7dN+T28YxucfelCrDcDu6uG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw1ySA4kfKOARKsbzGHfecgEjOJ0aMw+ncjIslu+b0NxJDBRvd
	nzcqgn5RXl1W1CntxZFiK2nN41oVB0Dy7gGyb9ega5nrMhjgwU+D7e8z2I9ZzWhCv2dvLIEbe4S
	dUpsYmUmZUxpipRxa3oBc0AJpWWA=
X-Google-Smtp-Source: AGHT+IEo8YLnFXl+Uzg93E4p7I2M2mVyh0u6fqbv186EzXZpaSYlDXpLn49v7VVQsi5krgfiW3cIa/eRya9AdiHk+jo=
X-Received: by 2002:a05:6122:250f:b0:50d:4b8d:6750 with SMTP id
 71dfb90a1353d-50dd9bf705fmr823403e0c.1.1729251963130; Fri, 18 Oct 2024
 04:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241015103317.GJ5682@pendragon.ideasonboard.com>
In-Reply-To: <20241015103317.GJ5682@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Oct 2024 12:45:36 +0100
Message-ID: <CA+V-a8tRDhDBFZsMEyxPTbW0juZMpAcJ=bj4rA3Nbsku8y4PxA@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] media: rzg2l-cru: Make use of v4l2_format_info() helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Oct 15, 2024 at 11:33=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Oct 11, 2024 at 06:30:45PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Make use of v4l2_format_info() helpers to determine the input and
> > output formats.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 22 ++++++-------------
> >  1 file changed, 7 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 8932fab7c656..0cc69a7440bf 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -300,21 +300,12 @@ static void rzg2l_cru_initialize_axi(struct rzg2l=
_cru_dev *cru)
> >       rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> >  }
> >
> > -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *inpu=
t_is_yuv,
> > +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> >                                const struct rzg2l_cru_ip_format *ip_fmt=
,
> >                                u8 csi_vc)
> >  {
> >       u32 icnmc =3D ICnMC_INF(ip_fmt->datatype);
> >
> > -     switch (ip_fmt->code) {
> > -     case MEDIA_BUS_FMT_UYVY8_1X16:
> > -             *input_is_yuv =3D true;
> > -             break;
> > -     default:
> > -             *input_is_yuv =3D false;
> > -             break;
> > -     }
> > -
> >       icnmc |=3D (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
> >
> >       /* Set virtual channel CSI2 */
> > @@ -327,19 +318,17 @@ static int rzg2l_cru_initialize_image_conv(struct=
 rzg2l_cru_dev *cru,
> >                                          struct v4l2_mbus_framefmt *ip_=
sd_fmt,
> >                                          u8 csi_vc)
> >  {
> > +     const struct v4l2_format_info *src_finfo, *dst_finfo;
> >       const struct rzg2l_cru_ip_format *cru_ip_fmt;
> > -     bool output_is_yuv =3D false;
> > -     bool input_is_yuv =3D false;
> >       u32 icndmr;
> >
> >       cru_ip_fmt =3D rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> > -     rzg2l_cru_csi2_setup(cru, &input_is_yuv, cru_ip_fmt, csi_vc);
> > +     rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
> >
> >       /* Output format */
> >       switch (cru->format.pixelformat) {
> >       case V4L2_PIX_FMT_UYVY:
> >               icndmr =3D ICnDMR_YCMODE_UYVY;
> > -             output_is_yuv =3D true;
> >               break;
> >       default:
> >               dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> > @@ -347,8 +336,11 @@ static int rzg2l_cru_initialize_image_conv(struct =
rzg2l_cru_dev *cru,
> >               return -EINVAL;
> >       }
> >
> > +     src_finfo =3D v4l2_format_info(cru_ip_fmt->format);
> > +     dst_finfo =3D v4l2_format_info(cru->format.pixelformat);
>
> It would be a bit more efficient to add a yuv boolean field to the
> rzg2l_cru_ip_format structure, as you already have looked up cru_ip_fmt
> for the IP subdev format.
>
I will consider this change, when adding support for the RZ/V2H SoC,
hope that's OK for you.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +
> >       /* If input and output use same colorspace, do bypass mode */
> > -     if (output_is_yuv =3D=3D input_is_yuv)
> > +     if (v4l2_is_format_yuv(src_finfo) =3D=3D v4l2_is_format_yuv(dst_f=
info))
> >               rzg2l_cru_write(cru, ICnMC,
> >                               rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR=
);
> >       else
>
> --
> Regards,
>
> Laurent Pinchart

