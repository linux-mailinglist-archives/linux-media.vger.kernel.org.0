Return-Path: <linux-media+bounces-33300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F48AC2C9B
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 02:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0CC1C0388F
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 00:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BED31A288;
	Sat, 24 May 2025 00:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="SbgaL1Kd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED9819
	for <linux-media@vger.kernel.org>; Sat, 24 May 2025 00:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748045228; cv=none; b=i0tG5uGTaK1G+N/LXi4npA14PEgbkSArYbGvBew4jAYTIcC2zkWjA37Vn5vEIxPK2881pOxmcqwLWfMR9pBA3kiTClHW8CCWQRzg9rSbb88Ahzh8e1QBLxMRWCRYTN+axjVPOU/fwpE5RkE+XoAmkxY4nnmN5bwDxwQgAUwWWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748045228; c=relaxed/simple;
	bh=gkfs6iShkZzxqmST28I6UZJPTMoF/O+kKXk2E97Xgdg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AzMo1cxiJB/flDjhDCtwZhvON9G+UfRtEtXJrFbHLRNWXMMqhwkNrjAWgzWps4OahP/6/da12Xs9XZOXT9m/KH/+hohe23RpJHIBEYo2dviK7pXUiH2ImlKL6kNmNTTtPFmvlx4/T8vsQ+Z+eLvFOhrlkpE73FdM2PM2TUeEcqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=SbgaL1Kd; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8c3db8709so5140896d6.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 17:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748045226; x=1748650026; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w2v6oPiR0TpWgcv0Ui7wcKxLp1yAUHwVBhhO5ks6C7M=;
        b=SbgaL1Kdxnp/P8fLg6n8my4dRzKlD3fr3eW4r5MAF4M1+Sn4MIZOHflVL9qa4sEBv/
         h+6h123xUs0W6bf6RnUk42CyT+J0pCZhi4wVTGdvdg/NIQYASz7JQB0cOMJ9WIbGRNOl
         tsSVA2RqyTtxKzVH6wTV5JWlMIS7QGkJxXIEFc/Nqp+cn728MAS7aaa/2Nb0RsKvjMsX
         2LpSVrSd1VXt9tpD9UVsdenq12EDK89KiKXEeFwqZDoztjhLWF1i6D89D1iU6hPWw0WS
         KBCAV3XDDommQAdY6nXBMrozdakrRQ6vmlBTSFZJlFmYdiIbi0KGGt7ClEt5/3AXuK5T
         z8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748045226; x=1748650026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2v6oPiR0TpWgcv0Ui7wcKxLp1yAUHwVBhhO5ks6C7M=;
        b=AHEOSkH8KxRFElgfULtXWHs/O7O4HQSAdTUV6bNSihNs6nR8q4O9+FH5DUmezOMUve
         ZNChyCSugcFDt3vuSjj+s51fB6rluJnV7eXzhUvnhT8Lmg+cWlR2jTsWvflI0ciqxiiY
         utU3z9IoirpQxyC8dFLFZmcMJDniRJgPx1UhpMbujQwm9BR3S8MAys8ZHDSzNzo6vFIx
         0Y4U/fo40g5gL0a0k+KPgJ0OzFKnqq+j651a/pAhlN+wy6MwlLtvnDFhuDsgYkWcH7kk
         8pZ32E6n4DZ78kbwmiFUon6K/7qDIyxg/kkDNCSEmNFeljHU5CyuvC0MU9xIJx3Asx/o
         dgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0yVgaJs6K0frf2Mb0gLVWn/+lYn+e5csumNR+Nh0ObXK8X0lCjORKtWyVYYoFXmvfX/jX5TEIIwDVIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Mhepgfm5N3q0xTBanJDwHSIRSs2nzRSPiYsqqhN79Hu8+anx
	bj9NC5izTbv2hrUWuUuXfQfC+pdsejeFMQR0oNK5rV7Lp8kmZ0W3RNUp/0F1qjU6sE0=
X-Gm-Gg: ASbGncuO51SUgQBcz3W0L+JqEPuIFI1QVzXryVHjFEDRhi9Ms+Z4ddkdCEeiFM6NpK8
	q+8fLUB3ubBjL8ZxbuAqFfLm6g8ZfMu6vxFGHarji9NKp/6/mFT06Kr2Z8AgiPGo3zVCGTkJBMH
	PKOYBbf0hX2gYKFDNJqeUiRi7pP5lvM24Zs+f6jqYGS5snlhqVbc8A9fBR3EKQFRMd1PZPTqVoY
	Iuqr8OiRQEe5gmi0F8Ca4iemvIXFdmoF74aDMGRrMTIfp/pe91bwYdPVr3OCx6K8bLy4E50PKMP
	5WfVdRP1OfYKy4qTLdBw9QSc6jBF9aNE7PYIt6NXtt9vz1v3mAjqcaZW
X-Google-Smtp-Source: AGHT+IGD9e17824qKyd+B1gosd9Ns80AmHmBePi9Z8UI0Xsqhm4+eWfNjMArpT/NS6/AeerCmI7lBw==
X-Received: by 2002:a05:6214:d6b:b0:6f8:d50a:aea7 with SMTP id 6a1803df08f44-6fa935b5183mr76231986d6.10.1748045226169;
        Fri, 23 May 2025 17:07:06 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0884038sm121929706d6.15.2025.05.23.17.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:07:05 -0700 (PDT)
Message-ID: <f4ced91cbc1e52347189a91351fcde17f021bc09.camel@ndufresne.ca>
Subject: Re: [PATCH 09/18] media: coda: Fix max h.264 level for CODA_DX6
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 20:07:04 -0400
In-Reply-To: <20250314152939.2759573-10-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-10-serghox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=C2=
=A0:
> From: Vladimir Yakovlev <vovchkir@gmail.com>
>=20
> CODA_DX6 has h.264 decoder but v4l2_ctrls of level wasn't setting

Perhaps:
CODA_DX6 supports H.264 decoder, though the maximum level wasn't set
properly.

regards,
Nicolas

> for this device.

>=20
> Co-developed-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-common.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-
> common.c
> index 33c7e8398f31..555b73816952 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -2440,8 +2440,8 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
> =C2=A0		max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
> =C2=A0	else if (ctx->dev->devtype->product =3D=3D CODA_960)
> =C2=A0		max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
> -	else
> -		return;
> +	else /* CODA_DX6 */
> +		max =3D V4L2_MPEG_VIDEO_H264_LEVEL_3_0;
> =C2=A0	ctx->h264_level_ctrl =3D v4l2_ctrl_new_std_menu(&ctx->ctrls,
> =C2=A0		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL, max, 0, max);
> =C2=A0	if (ctx->h264_level_ctrl)

