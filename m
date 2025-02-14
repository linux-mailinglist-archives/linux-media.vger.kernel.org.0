Return-Path: <linux-media+bounces-26161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62503A360B8
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 15:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AC8188DB10
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 14:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BAE266592;
	Fri, 14 Feb 2025 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="DyahSG8c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D60266579
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739544250; cv=none; b=uBasTgCmqulArcEDyMDnE7U1RwvWkefAcjWT5JIMFwTnlLFlFcXWk5cHKP2xthQQWVVxgGTCzh0upmYagWXMI3BzpWmYpe9lJEniI4u9zWvezd+Gmp1XAjFAiI2M59ve0FJdWYE6Exf0k5MiGVxFjVQHCDD2opMPBcAUD5jNQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739544250; c=relaxed/simple;
	bh=8f5lrx62gvWJsh/0RZ7tW7S9t8HtzyILj67RPVtwncA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCWuF3KY/Us/VkJt/idj9vXzv0nG7AxyAPUNeMO8l5hB81YlfnXZiqSuzfuZxl38HzU0ilKq+gvWXAyuKkUbhu0HbxpuhbfMWSfEjcz9VlC1/KkjfIGPJ2nzfd73CXv7JeAsE8Rp61WzpJ2VRcrQz7XcD7VNUD2LY5K6FxDOiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=DyahSG8c; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-471bef62e12so17944481cf.0
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739544247; x=1740149047; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nm64wAClFiNYBGaeXW+Jy+0YKStQf2pFqHFb57LVGyg=;
        b=DyahSG8c167q3JiIMjNst5He36olai7P7QQUVjjUP/qjZ/qkw6o/3IV6Hg+AYkHbuB
         HHYJJGvJChGI6EpNhRKf0h4nnFXyAn+1AV+hBswMJxaXCZQnIRig+QZZtaM0YlU0iNwG
         ZCBEhPC4lPG8YjdBmoZOy7WHWoeQFEmZa3ZXPR2R0/XygqUlsKKtZJ7p1aU8vtTvQGGR
         oaE1xEilYRT8hOYdMytqREgYGYPQCVmIpqcTB1Qp5HojDAgvlaRTdAlHNPlfn975RBit
         8Q6sRchjYGApbqcKxGJrklTGWdVKW6v7Jso9e4ICBPZ9XO620lB4MqZGfu5IhM0D7tmD
         774Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739544247; x=1740149047;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nm64wAClFiNYBGaeXW+Jy+0YKStQf2pFqHFb57LVGyg=;
        b=JWi9xsYQdiDT16p/MdKPBzvya2z/LWMXL/eTfTDwHseop2zSZmjZ0i36dxRvo4GZLm
         BcXtXuWhn0ESbsHlFOp7lKK3sxHeooARAkDUgXYA9ULIrQiqLzDVg/zNcF0K8Pl3dQjr
         7LCjPtks87ii+wAlYF9oqs247ZXattyEBlTmjty5KMOZhjNGW3lLY52cOrDoTCzzA6LK
         ZTH+pJ/OPbIbWLhbYDUyOOyGosRCPVa2HjHZg1VrG7ARlDkkY/GXG65zFAVAsQqpx/jn
         DhsG1BlcP7ICoJEnkPwiSusK/0qIzR7/l3xIJIAgevVerUOvnqaKSHLoYRYOTq7n2D9G
         MofQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMKcEL159tfN+0FnCpzCLxfHBpeclD3c8P27XSkRwtjn0DJkJRizzx0LQi4ujXHztQA/TmmelphbaLIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWlARUwbX+J721sgPXM9evDFUauM+oAqvvFLoorQ/SmAmx4CZ
	7CzWp3+MV5hc4IMNFLDKQrzCF949HbMZaArBi9zq3jUN2eDGyEaomHYciFNoHQg=
X-Gm-Gg: ASbGnct85vAuK62LpADOv5Ka7GbagM/piKqIBq3Wxaspw6+qnIHAb3G2lWddg55NDCY
	XN8mgkKUqiNNQif3nyJ6B3NRi/32haY9LwOt1N3hW6ppgFmU922/ohXY0qrpgtWHGPkUg/UcNcK
	JCHwrhedem6Hv6f7WYFZrz2kmnq5Bxa74LPDOL/YR5J7CVy2/VYvW6W7a1BIDYABiEM8K0du3lG
	Il2dlbrepHukeKC9R/mdw5sqwiXrPHAuBnIZ3p0Em+A03EGd3RLcCohXcMw+KDNyqseZ5cB3Ijd
	AsZXIzpOxKCAd4dLwF0M
X-Google-Smtp-Source: AGHT+IGzD4tmaFdbKPAgw8y2G/S9CPB1VEBNfWCQGlYkIlxfwiitQKsGVA2pbWLHph9B27cyYKMs8Q==
X-Received: by 2002:ac8:7fcd:0:b0:471:a7cc:8106 with SMTP id d75a77b69052e-471afe31a4bmr179507901cf.20.1739544246639;
        Fri, 14 Feb 2025 06:44:06 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2b06002sm18172461cf.77.2025.02.14.06.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:44:06 -0800 (PST)
Message-ID: <aae670db21a1de622cc89ac637c407bf6452c44f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx335: Set vblank immediately
From: nicolas@ndufresne.ca
To: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 14 Feb 2025 09:44:05 -0500
In-Reply-To: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
References: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 f=C3=A9vrier 2025 =C3=A0 22:37 +0900, Paul Elder a =C3=A9cri=
t=C2=A0:
> When the vblank v4l2 control is set, it does not get written to the
> hardware immediately. It only gets updated when exposure is set.
> Change
> the behavior such that the vblank is written immediately when the
> control is set.

Not my field of competence, but won't this cause a flicker ?

Nicolas

>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
> =C2=A0drivers/media/i2c/imx335.c | 19 +++++++++++++------
> =C2=A01 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index fcfd1d851bd4..e73a23bbbc89 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl
> *ctrl)
> =C2=A0			imx335->vblank,
> =C2=A0			imx335->vblank + imx335->cur_mode->height);
> =C2=A0
> -		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> -						IMX335_EXPOSURE_MIN,
> -						imx335->vblank +
> -						imx335->cur_mode-
> >height -
> -
> 						IMX335_EXPOSURE_OFFSET,
> -						1,
> IMX335_EXPOSURE_DEFAULT);
> +		 __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> +					=C2=A0 IMX335_EXPOSURE_MIN,
> +					=C2=A0 imx335->vblank +
> +					=C2=A0 imx335->cur_mode->height -
> +					=C2=A0 IMX335_EXPOSURE_OFFSET,
> +					=C2=A0 1,
> IMX335_EXPOSURE_DEFAULT);
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> @@ -575,6 +575,13 @@ static int imx335_set_ctrl(struct v4l2_ctrl
> *ctrl)
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		exposure =3D imx335->exp_ctrl->val;
> +		analog_gain =3D imx335->again_ctrl->val;
> +
> +		ret =3D imx335_update_exp_gain(imx335, exposure,
> analog_gain);
> +
> +		break;
> =C2=A0	case V4L2_CID_EXPOSURE:
> =C2=A0		exposure =3D ctrl->val;
> =C2=A0		analog_gain =3D imx335->again_ctrl->val;


