Return-Path: <linux-media+bounces-26303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C019AA3A55A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A693017556B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D461F582A;
	Tue, 18 Feb 2025 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4id9Flg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7C2356C6;
	Tue, 18 Feb 2025 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739902949; cv=none; b=fqdTwbD+TsFi/IcGa05oToNoLx8g+yVZXx/K2Rsfpjfz4IOkbwNXunlJhJCJ3VmVoPTt/tx/6ADtIwP4ljTH5+Kx9GOpFruuHN30kPtDmDqdfigl+orbyicxxjsZFT6atizj8i8uxMZ3WTFGMfqDzCzSBz1thzJhJdL+f44IoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739902949; c=relaxed/simple;
	bh=PYfmno9r0cFvO6COc8Y3koQoiCUCURDSYJOh3Ty2T4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7pW+8kTUEvk0qxx6u3qL7szIgVfS3HQDBqB17tyn+F4EG82rpQFgGjH81XyW2sGzi6ByxgBr57wjO8fVZ8TbbCD30cK0SMl3dDoHRrxXXH2Kc0+Sbbn0/rVK1vDzmbgvAw9eUZTpZ/aj7CGX0EoVDsm/lEzpzDknYb85Y1I41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4id9Flg; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47200236004so11209421cf.3;
        Tue, 18 Feb 2025 10:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739902946; x=1740507746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzjPJByPMPi1+tDKNkZmLEEa2KEFBG7ARwPPLuUbuME=;
        b=M4id9FlgS4xI/4n1Y/F55Kfz2buLNvbhY6ZzcAn1xH5V21VtXxTCaJKVncmOSJIslI
         YOrtUcMqaUFRvESm7GwXfDIgR9/e7+nkC2YmSdZ3Z3xSKPFsZTxeLl5ha2HRZULUj5Ts
         nf9cXmZIYej/mZw6LILEKmvIGWmwWJOXz/08Qm4c8pZzB35BpivQUaePRQe30Xg2X9xP
         bh5TL2Aq+INYB3oJcQtN8HNrVySQdsAHzLBUd9K7vscGfcicaJlYpddDbrEuHzrZr/r6
         bj6orM/+z/gMOi9VV1ZuGEwPQUQ93LPVGPgGO97Gk+f8YfNngn/oVHWV7XXnseE08J4w
         nObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739902946; x=1740507746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzjPJByPMPi1+tDKNkZmLEEa2KEFBG7ARwPPLuUbuME=;
        b=dy7VkXjOJXSVlMEQYP/UbFdGIS71QFTug59ajQFnWATv4Gg221lYjaPC9KJpA9evjk
         8ZIvoHIW7w/2DTLzkOcJ7/pSQ6PPcUWygwmEt47PTXodZJNPZqVTg4x1DK8erwdPM5H1
         FZ6O5zsiVUHrQidzR5wT7GT8wtUVcupt330oNZX2QmhOFOSFwD6kP8PfmCSMBpL24wU4
         ENGCTjswbSHg2j3q14m+x26NHN7SNSGolWH3lIkR4BHRr8/jLOy0KdDML2cYirORxnqF
         GFB+LdkZpnG4KxkTKf0zpwa4Dh4cHcnBVnIiFgobvpuWEWe30qhfGrpipQmd3lhtR0nJ
         8DpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuafLMGmaerfO/05v/6XgQ1+8evg/OcVWmRw9/VufbxksEKzzG2JL8F4ump8DFcYFROWI8OGwin073fC8=@vger.kernel.org, AJvYcCVuW77VNvOR6eb516a7ngDrny9afRaXGmi9JHrBzDB/P7zx4M2D1amxbpoZSOgS20v3/tmAn9UVA1XRGHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1Ld+IYVmdO5Bo4mlD4QLoV7rU6pXbAvzaBX4e3g11y4GP938
	2JMHhBY1NBV7pVEiol+ZO3jfgb5slfv9u9tdb261tth09zhkmzy6/IQvkNvKRhE70+Ox+h4+sxs
	25HHoZ6MEg5UQ2gZNjijayIa9qm/t3w==
X-Gm-Gg: ASbGncswlwSgBioaHccQdQICL3mnL6I8SrGqtW6uAxw3ycT7SSfZSZHC7Bi4TtBOwiq
	YhjZbSrEhLZ+IrT71aW9sR6GgR9zAih64DmAvXeStm6lhymSRANyB1QoQkYo9kY2VuLD3SEQP5g
	==
X-Google-Smtp-Source: AGHT+IFvTzf/pQHM1jlaSiSziUnZTXPg31KgeAid7qaMz8VLGP3h7h8UvBSajmKY8qqFANiz5VWrRvfUIUlMXw+xeQ4=
X-Received: by 2002:a05:622a:14f:b0:471:fecd:103 with SMTP id
 d75a77b69052e-47208299ec9mr9120631cf.37.1739902945548; Tue, 18 Feb 2025
 10:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131012830.22394-1-jiashengjiangcool@gmail.com> <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
In-Reply-To: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 18 Feb 2025 13:22:14 -0500
X-Gm-Features: AWEUYZn99Dl5M0kMGSPw5mLsYJhT6mWJQUJVNXXhgTF798gaCxq6q20urJwFd14
Message-ID: <CANeGvZUhFV362NztbvicehGzTDWJP7uu45hT0ebmbgLTx_v-3w@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Add scp_put() to free the scp
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: "tiffany.lin" <tiffany.lin@mediatek.com>, 
	"andrew-ct.chen" <andrew-ct.chen@mediatek.com>, "yunfei.dong" <yunfei.dong@mediatek.com>, 
	mchehab <mchehab@kernel.org>, "matthias.bgg" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno" <angelogioacchino.delregno@collabora.com>, 
	fullwaywang <fullwaywang@outlook.com>, linux-media <linux-media@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Fri, Feb 14, 2025 at 3:20=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Hey Jiasheng,
>
>  ---- On Fri, 31 Jan 2025 02:28:30 +0100  Jiasheng Jiang <jiashengjiangco=
ol@gmail.com> wrote ---
>  > Add scp_put() to free the scp if devm_kzalloc() fails to avoid memory
>  > leak.
>
> Your commit message sounds a bit like you copy-pasted your code into the =
commit message.
> What kind of memory is leaking here? Are we talking about SRAM memory?
> I'd reword the commit message to something like this to give a bit more c=
ontext:
>
> On Mediatek devices with a system companion processor (SCP) the mtk_scp s=
tructure has to be removed explicitly to avoid a memory leak.
> Free the structure in case the allocation of the firmware structure fails=
 during the firmware initialization.
>
> ---
>
> Additionally, the commit title says close to nothing to the reader as wel=
l.
> How about: Fix memory leak in FW initialization
>
> But as I stated above you should clarify what kind of memory we are talki=
ng about here.
>
> Also just out of interest have you ever actually experienced issues with =
this?
> It seems to me that the situation where you run out of Kernel memory shou=
ld be quite rare.

Yes, I just detected such a bug with a static analysis tool and I have
no idea how to trigger it.
I will submit a v2 to reword the commit message.

Thanks,
Jiasheng

>
> Regards,
> Sebastian
>
>  >
>  > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer defere=
nce in SCP")
>  > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>  > ---
>  >  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++=
-
>  >  1 file changed, 4 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_=
fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.=
c
>  > index ff23b225db70..1b0bc47355c0 100644
>  > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.=
c
>  > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.=
c
>  > @@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *=
priv, enum mtk_vcodec_fw_use
>  >      }
>  >
>  >      fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
>  > -    if (!fw)
>  > +    if (!fw) {
>  > +        scp_put(scp);
>  >          return ERR_PTR(-ENOMEM);
>  > +    }
>  > +
>  >      fw->type =3D SCP;
>  >      fw->ops =3D &mtk_vcodec_rproc_msg;
>  >      fw->scp =3D scp;
>  > --
>  > 2.25.1
>  >
>  >
>  >
>

