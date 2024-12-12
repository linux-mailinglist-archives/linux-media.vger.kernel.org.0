Return-Path: <linux-media+bounces-23329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38519EE929
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F9E168744
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 14:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB43215F48;
	Thu, 12 Dec 2024 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nE3YEqk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB621571D
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734014383; cv=none; b=mUuoJrm4EWHRAF89RWfHAWPokv5TIFiDmZMgsjRaT4y51dXCLhQPByjxB9mmxoi5heoNqhEdRnBTijjyo9YJfw0IaMo+dKxWldaIxbkd62lCzbg4a1lpT4bESScI2mJ1O6eGbucrD5ReJ9sfMOUYPXeNU9O1gepJZxcDV5B+ak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734014383; c=relaxed/simple;
	bh=V4H+RkOOPoNNuIkUPtageq9keE9J9/rHZNDzDW/fPS0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XX/hfv1hootBT8XTr+Xe6sjABOAPV2l6LdzIm2dqQ/OXLvh2L29YISii6BFOeeRS5rBUFqAMwxyBvDO8A6szJ+SZVeNRInDF6CSLqA5vsCxmKlR2rpNeuP+c9ok7dpBcWmRPgPugf3vOIZEGSaosaIR1VSHp4EIT0c9DvGMF3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nE3YEqk1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4679fc9b5f1so2595921cf.1
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1734014381; x=1734619181; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LIeJWDB2e3v6s0K160v2H6XjXslzfSsSGvjLFvy0AhQ=;
        b=nE3YEqk1jr3ss4rvOKYWLjGLxUP3Qtq/0CdNa4KdKDw6relbTszWSKvoFr8ZJmFmxz
         D7izbJyodun90Y0Z4OyRt0fqq8SCJR9PkByENqwfrN7/fdYS/c12WAoI+cFeqElHNJnn
         G7CRxUUip9g7JwyWnkVholLGZ9mjxbNGgt1zpFoboMNnikmndVjJEiv/+5/UXkRSV6LG
         CAfTUCaspl1yxbfoZLxHxkoEZpDVMC2SY/7wcVdC/zIv7zT0vg9p10fDaK1OpIg51AI1
         rGon+EyCeTkTMsGq23f8OyN2Z4Jtis05nS+w2/ixy8bRWdNaXCcM0gV+pdpO9GcxgTsf
         vKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734014381; x=1734619181;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIeJWDB2e3v6s0K160v2H6XjXslzfSsSGvjLFvy0AhQ=;
        b=QVvAZjJEPbaPA3t/YYNgfanI//PF/me5dUlzfDK9v3JbbVbhpEKyJIiJQfEwqN5CVD
         9xisCKZulVA9yOSl77mQYev8MMNZgfq97rcyPGSGcd6trFODX0P0W5YzOiSSVGZi8/Lt
         7hIwP2iIz6ud2YdvUnjGYe5kBEgT2yrDVZfMN4A/7WO9g5XeUdbeuB+9JOZ+H3tHgpZA
         MjSSmlIB7IX4rYezxLh93YrOz0V7I6AplkgQnH0CvjKxsOhbHFfL82gy5+yM4zX9H/Vk
         uBa05iVk1H1hiQIgx1BTOUbGp8UzYIp9OTbHdaM7Mbw6zTGfk6j1i0rxB9Xz4SDBFk9L
         uClg==
X-Gm-Message-State: AOJu0YzF9QAu88Ly53YoACIjBTzoCHkE4xv/ODoYFbSzYwn2HQMC3nBA
	RshtAZLH1RSzW5ZeScCJbWTRrtKMOW1uGCr1L4G3l60Fj08sK6/PjRuHOqJOwoc=
X-Gm-Gg: ASbGncuv+kYQN8wldAKXQYcAy49FTBIt63CtnMM4e+LMrLfeD1DuorhoLlDE4pSkCzW
	S7VQ8xvKZGD7D+VIm8KuIk0HCmWhClxlUE5ANjrXDpAZ1HthwuSTeqqW92dUpp89BIXLZbWwvhR
	gGU3qqHiGu5Hbstd4tttLHbxl6cRvKTRH2J8sH1vwaaINi+g77j5m9pb78rwKuucqT9LwPDNJHZ
	ByfitABeumozlYW/upfY3tCvqK7WnS8+zCinE0fz2ZeOnt5du0AEOikWg==
X-Google-Smtp-Source: AGHT+IGe6BR/nJYecL4uvVJeolPMjPs95fnRbDMbA7nYERaQwE6R6C8dpsFTy9fb3t3Pc0QRB2bHtA==
X-Received: by 2002:ac8:5f83:0:b0:467:59a3:b44a with SMTP id d75a77b69052e-467a170e8a3mr8393441cf.56.1734014380603;
        Thu, 12 Dec 2024 06:39:40 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467a115b939sm1298231cf.44.2024.12.12.06.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:39:40 -0800 (PST)
Message-ID: <6d322d25bef972851b323e795ef35bb8a8ef556d.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: verisilicon: Fix IMX8 native pixels format
 steps values
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Thu, 12 Dec 2024 09:39:39 -0500
In-Reply-To: <01020192f83fdef5-358ea072-9630-473f-9407-53be13d85864-000000@eu-west-1.amazonses.com>
References: <20241104173623.1058335-1-benjamin.gaignard@collabora.com>
	 <01020192f83fdef5-358ea072-9630-473f-9407-53be13d85864-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 04 novembre 2024 =C3=A0 17:36 +0000, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> Hantro decoder non post-processed pixels formats steps are different
> from post-processed ones.
> Fix the steps according to hardware limitation.
> Since reference frame pixels format issue has been fix, it is possible
> to use V4L2_PIX_FMT_NV15_4L4 rather V4L2_PIX_FMT_P010_4L4 for 10bits
> streams.
>=20
> Fluster VP9 score goes up to 207/305.
> HEVC score is still 141/147.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index f850d8bddef6..35799da534ed 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -187,23 +187,23 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmt=
s[] =3D {
>  		.frmsize =3D {
>  			.min_width =3D FMT_MIN_WIDTH,
>  			.max_width =3D FMT_UHD_WIDTH,
> -			.step_width =3D TILE_MB_DIM,
> +			.step_width =3D 8,
>  			.min_height =3D FMT_MIN_HEIGHT,
>  			.max_height =3D FMT_UHD_HEIGHT,
> -			.step_height =3D TILE_MB_DIM,
> +			.step_height =3D 32,
>  		},
>  	},
>  	{
> -		.fourcc =3D V4L2_PIX_FMT_P010_4L4,
> +		.fourcc =3D V4L2_PIX_FMT_NV15_4L4,
>  		.codec_mode =3D HANTRO_MODE_NONE,
>  		.match_depth =3D true,
>  		.frmsize =3D {
>  			.min_width =3D FMT_MIN_WIDTH,
>  			.max_width =3D FMT_UHD_WIDTH,
> -			.step_width =3D TILE_MB_DIM,
> +			.step_width =3D 8,
>  			.min_height =3D FMT_MIN_HEIGHT,
>  			.max_height =3D FMT_UHD_HEIGHT,
> -			.step_height =3D TILE_MB_DIM,
> +			.step_height =3D 32,
>  		},
>  	},
>  	{


