Return-Path: <linux-media+bounces-30954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF8A9B2BA
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 17:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA1116B85C
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230FA27C15E;
	Thu, 24 Apr 2025 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="t+p7faQV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F7622CBE9
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509440; cv=none; b=VoZVZgvTnHnqFRCOA9BSql8CBPYAVDEmUWhxAbQWjyLgBBYZ7oe2FTU7VCaoikExiD2ku2/14vMGefo5ujwHKaunPXCR3fKXI8qNaMNgyuo1ejoozZi5dU+hV47/w3XRIPGn5rk3LPhCsnLFDoyTdj4cFfxuSqtjcfvYUMlvSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509440; c=relaxed/simple;
	bh=PrIt9cti1YTt57yyhwhu+yoL+H0Pauq0wEpWZElruNg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PLp9Y7dZPrut6Y0uTTCpsUEpZEpzDr5PGtAEmxlpOW7+1TTfR3cbjhNjBhbmc72xx/O7X4fhtwiVKObs8VLS63dgLRD7nzQBF13gSUspWRBAnAefFoQxzkgsOI4h8fOCly9d6BpynrstBPYHF0iGKLhnXsM1o47ByGpZfW+E22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=t+p7faQV; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47692b9d059so18884441cf.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745509438; x=1746114238; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PxG91MvO3mEZmIhtAaDJXqnva49Kcev69TBhblsIWrY=;
        b=t+p7faQVjB+XtCOkcmZXBFDP3t3+pPIiPbFUCVPjTnTU8FQA8gTcLxKVD0nrwQGSp4
         oVgM865DLG7XB4fV0U3+82gwY9p5fHIw6si6KftvrZyH2psdwC3u1a0veYN8PjobmaH1
         BCDuJmaYrG2g8XoQ2WzyUErbJQ0aefE/Mr5xrfuKs4Kx3zcemNlYHJUglxmqrO0ZfKWY
         lsLyyzopjF6esf5XfXLJBcwSHemXrLlXqCnciNpBivIWO770U+0sL9+9mkudfs9MdIYV
         SQtmci8SZwjUf9rBHWPpt8voxqbhrT6//UIa5FGc4Y+i0dkGNXQZ5rfIMEaLvz0lbAgZ
         sBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509438; x=1746114238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxG91MvO3mEZmIhtAaDJXqnva49Kcev69TBhblsIWrY=;
        b=uPM6RCXLtlUEy20cVnu6j9wgdscYubEOZsM6fjplLQETHc780GrpJ4h591yB0avJj7
         QE8YyE5v7lu2Xg/ULCYX1QONzVTjSmsH1k3MZfa440T7HHgTULmkkee0ew59TSGz7ajr
         i3jQLoyzuB7bBWriLUeGfWiE3JLexEDcfY5nhEDhrtstqMqG1Z+p4ICLgbRmxD8sC5zk
         gt3UHC46xKa8GF53yvYvbRYUmWAo+WGoba21guxbTjT+cNbVjSmnthXZ0aDjPgQdVEJ2
         gJsvOxZfwPaGO95Hw06T7whbeKLa1/jEHDgqhI2GrIQOE4AGCzcqPbRCqnbgVtj4RpKl
         CiTQ==
X-Gm-Message-State: AOJu0Yz+yQrZEZlBLKANTnBow1HcmCHmqIdxZcroVqJLvmRoao56L8EZ
	+CgUo/HcrolOiEBloqkLm+DFRLLWd8uFjUfD3/P7IJOZOJY5XHFn65mJWeCM2X8=
X-Gm-Gg: ASbGnctLbJdrMfPxPjULkzfRt0UhJrIbV5NhBYaf5cJ4ZtAN8QsF/f0M+xiGSHuWnnX
	hr33w7kkkdyRPnuQlhxerKhVhAGskJ82lzHWNDLP9VWvpEa3xZxbYs/sjFsblZFMHvmNMnNubm6
	2FdAkKxuRUDHuZtiP6fyrfACzN9Ky/OYzxxLWP5KByb4YTVslCC+sgbAvzDJXtEqpdTBtwkkooC
	f0whvK3bislgws4/oVooY2wEEwmq9lsEGv6uhoyzEZJKTR0FXsITx33iCG87GPqxN782tQ8R8jY
	08sAPUIV+djmLGOXshA8FqWxco7xyPm66s+qKgoQBM5hxw==
X-Google-Smtp-Source: AGHT+IGA+IIOug/obYsp2byfQYiQAcdnJn27C+FPUJJIN+Z+DBmj+uagyzwdTCFBqechz7yf+kP/FA==
X-Received: by 2002:a05:622a:153:b0:476:b7cf:4d42 with SMTP id d75a77b69052e-47fba39b562mr2788641cf.27.1745509437827;
        Thu, 24 Apr 2025 08:43:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9eaf2086sm12964521cf.8.2025.04.24.08.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:43:57 -0700 (PDT)
Message-ID: <6148110c513d2177d886469c2276c6810eb93c34.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/8] media: v4l2-common: Add YUV24 format info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, marex@denx.de, 
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com
Date: Thu, 24 Apr 2025 11:43:56 -0400
In-Reply-To: <20250422093119.595-2-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <20250422093119.595-2-nas.chung@chipsnmedia.com>
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

Le mardi 22 avril 2025 =C3=A0 18:31 +0900, Nas Chung a =C3=A9crit=C2=A0:
> The YUV24 format is missing an entry in the v4l2_format_info().
> The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
> per component.
>=20
> Fixes: 0376a51fbe5e ("media: v4l: Add packed YUV444 24bpp pixel format")
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 0a2f4f0d0a07..de3636f1cdf1 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -269,6 +269,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_Y212,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_Y216,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV48_12, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_YUV24,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_MT2110T, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp=
_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> =C2=A0		=C2=A0 .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 =
}},
> =C2=A0		{ .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp=
_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,

