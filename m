Return-Path: <linux-media+bounces-26411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BBA3C8FF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36163A8D98
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E06122B8D4;
	Wed, 19 Feb 2025 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="znhrNoNg"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D1184F;
	Wed, 19 Feb 2025 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739994048; cv=none; b=FgNLmo069tdvD8646EMzIxE3ma1/qUpSQMfDzVbkUEo64ys5hAg04zML3WY15P4h1c8Xp7KQf852oxlgobz740Wi5DY5DwTFCBbSEYPEFRw2oPUQqB+y/Vw+4DDpr6FKB+8rNrm7OPVfXGxBgzxntCt5sTfiwkRSieHs4Qh4mUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739994048; c=relaxed/simple;
	bh=IZvZQ+Z2ANgypM5Ai42o0D3/NeLsJT0qXFUyLp8/kH4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pgv8KC8VucHzqIr5RU3VmxC9LVMX8DTLpeVwENd7DUslcqSMCntA779RV/N4mZD7JrNLB05ma+Z9sXuqIsg442YOt6YN5+Jw5hW/wDjmADdOifIjh32r2LKpMlkF+d5+IZOO47KmhdmOKgAFoaNiXNnsMUokbRpsKJ0bcezBdgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=znhrNoNg; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uE1hvjxXsUUC1et/VMLf8EeRBWH8/5FEEmjbMg7Vyu0=; b=znhrNoNg1jDWT+rZCye1OrEbRx
	0pK4ORsezD6ZZI0kEsrUVLnU6Nx0x8S2UJ1UbY6pnDID5AlvQe1b8CG6EwezIt/o3eEXl0jl/IfYL
	cy/U8xZrKX6LqsFnPRE2/jtOZluTSUT8AAVceZq74UIt14nOJlvlCNZ7unA+pQwZAzB6ojwewx5CY
	PqnALiqnk25KM0q0xudc6bxFSUwLVuBnAdFM60aFGc4TCaPnNMb73oUD/TFkK5PaPNs6eHmGN3Wl0
	jF8oWQ78Dgl877QN45H4KhVuaPCxNxsHXaLuXXBhn6uuktsd4Ya7Wh5+CKTBOct8rRmtbBvAsrBtv
	BjblUO8Q==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tkpVW-000Geo-2e;
	Wed, 19 Feb 2025 20:13:18 +0100
Received: from [92.206.120.88] (helo=framework.lan)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tkpVV-000N4n-0Z;
	Wed, 19 Feb 2025 20:13:17 +0100
Message-ID: <426de13199c560301ed0a148d9ecd0155dfcff0f.camel@apitzsch.eu>
Subject: Re: [PATCH next] media: i2c: imx214: Fix uninitialized variable in
 imx214_set_ctrl()
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	kernel-janitors@vger.kernel.org
Date: Wed, 19 Feb 2025 20:13:15 +0100
In-Reply-To: <1e4da85e-b975-4638-bd14-09ba0675d9d6@stanley.mountain>
References: <1e4da85e-b975-4638-bd14-09ba0675d9d6@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27554/Wed Feb 19 10:50:24 2025)

Am Dienstag, dem 18.02.2025 um 16:05 +0300 schrieb Dan Carpenter:
> You can't pass uninitialized "ret" variables to cci_write().=C2=A0 It has
> to start as zero.
>=20
> Fixes: 4f0aeba4f155 ("media: i2c: imx214: Convert to CCI register
> access helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> =C2=A0drivers/media/i2c/imx214.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 6c3f6f3c8b1f..68775ee8256e 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -795,7 +795,7 @@ static int imx214_set_ctrl(struct v4l2_ctrl
> *ctrl)
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct imx214, ctrls);
> =C2=A0	const struct v4l2_mbus_framefmt *format =3D NULL;
> =C2=A0	struct v4l2_subdev_state *state;
> -	int ret;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> =C2=A0		int exposure_max, exposure_def;

Thanks.

Reviewed-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

