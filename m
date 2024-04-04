Return-Path: <linux-media+bounces-8671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418E898DA7
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 20:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95CA21C27CFD
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 18:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F98130AD6;
	Thu,  4 Apr 2024 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0akluLFR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8D130A7C
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 18:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253659; cv=none; b=fIhogQusD4Ko977WVUli5v+iyY3/BjONgf9ynW4L5GBR3Rlj3XN0rb06U+Ux0sM3x79eOM1iRGPifuHJH6Q97dspn35fnTvnbsKJ6zWR75GDDnu9l61jUwB/gqBB7Qi58qE7q7p4ySa8XAQdlj4pIV4jRBjg8/J8uD2IoY5tSHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253659; c=relaxed/simple;
	bh=DvqrM66m1fpor+G8I8exyC7QkvyQw53E6bWYdgNkJlk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SqWDh+cYvR3arUcVCEIYlsiImqRuiLOIfo3QMueGYfnJClcmXH3+ctSD4eaMc0FQ1Qnt3bBimpWzToCEKN356nFTnb8pmBsWOdT/k9uQ1ZviubVrsinMgIGfW+LUZ9uBv5/u5n6SHk5sAviI1wdT3NzO1+gGXeK11vZ1gefptww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0akluLFR; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-696609f5cf2so6686686d6.3
        for <linux-media@vger.kernel.org>; Thu, 04 Apr 2024 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1712253657; x=1712858457; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vkxFEmPPLSP0VfvXbMRLD3bWGs6AEqwLVGDVK0uQkn0=;
        b=0akluLFRVvk8wLWVyjAFMbDCNXq0LwSFvYsN15PcwZfpkvJeM4cv7ij0aodzqVyksc
         acoWM0d4MVdNLDVU+21AGqkxbxp9FC9BSXlOo/BDwIBZdkBdMAQMTQTdwDTOv35oTn3d
         +LKUIwECN2EdVe3aX0S+wweYAZAeR5qUYMjgr1AWvFnECSq1O6yBK4PxprvId0wO91ZB
         jDfJAP9BKL5FcOWZSAZh78fT8uiLG1Yhaisua9UsJQJa04rAROEwVBRgNHg+I/qf8hB2
         wPpJi8iXOBJCFQnPw7D0xYnOyfzoFmiDIWZ1J+F4MMp5GkMQUawnGstHJ3+8GS4yCK8D
         zO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712253657; x=1712858457;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkxFEmPPLSP0VfvXbMRLD3bWGs6AEqwLVGDVK0uQkn0=;
        b=mEMvvJeQ5mLwOW/abUewxbqO+X0PiyCwCUNj9fOaLwBVSRmh196F0Olq/yyT0GH1Ms
         pscxxz0S7N9yjaNS3tkOtHB41t9eM3C5TLA/KFi1t6qnTBitvYX8/yaf7GuOHKaNBdAz
         4hTLht96Lz0j47kPGNYlp/e/iIBCF4Vm0to8eV0QF4sfz+w1L6XFqmvdIgpHWHHRwMvE
         8tYlj/y3Y9BICZG2DHlzNsm6kjkJ8NRMifKcJ3CSQQds1Ig+I+B99IFuLtD4cgCpvgBk
         AKEU8bngKzcMc9Q3lyOhbPxxhDJDPXkzmOrgfIawEt0L7PkXmzRuv1ipn6zdGwly3Ywm
         W54w==
X-Gm-Message-State: AOJu0YzkPmtdAQ78A1Hx3wNPGaGKJYab9I554VNGdiU6Fq7nnD/SwAKZ
	yGjsAc4HnlAyYDNCF5buhBJ9mFi7MiYAb7e3Lv6AwojGLlqGrSNmNiYElLROH9Y=
X-Google-Smtp-Source: AGHT+IH5WeZ2YgQGDHZQ6kTSNkiS96RsVtVNAM1zKjHTx5GxORjHkJqWQS2v09JhoN1YdgLCXq40tw==
X-Received: by 2002:a05:6214:1c87:b0:699:2c7d:407b with SMTP id ib7-20020a0562141c8700b006992c7d407bmr3325785qvb.23.1712253656947;
        Thu, 04 Apr 2024 11:00:56 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448:fa75:a4ff:fe45:b56])
        by smtp.gmail.com with ESMTPSA id gw4-20020a0562140f0400b00698fd28cad3sm5421334qvb.80.2024.04.04.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 11:00:56 -0700 (PDT)
Message-ID: <c8de69fc6cb6029e96f3e6b6c1eeb1de9304ccff.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: Fix auxiliary buffers allocation
 size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Thu, 04 Apr 2024 14:00:55 -0400
In-Reply-To: <20240328093439.18712-2-benjamin.gaignard@collabora.com>
References: <20240328093439.18712-1-benjamin.gaignard@collabora.com>
	 <20240328093439.18712-2-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 28 mars 2024 =C3=A0 10:34 +0100, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> Use v4l2_av1_tile_info->tile_cols to know the number of colons
> in the frame. This made auxiliary buffers meory size computation
> more accurate.

Seems like this is potentially going to impact some conformance tests. Anyt=
hing
to report from fluster results ?

Nicolas

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> ---
>  .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index cc4483857489..65e8f2d07400 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -257,7 +257,8 @@ static int rockchip_vpu981_av1_dec_tiles_reallocate(s=
truct hantro_ctx *ctx)
>  	struct hantro_dev *vpu =3D ctx->dev;
>  	struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
>  	struct hantro_av1_dec_ctrls *ctrls =3D &av1_dec->ctrls;
> -	unsigned int num_tile_cols =3D 1 << ctrls->tile_group_entry->tile_col;
> +	const struct v4l2_av1_tile_info *tile_info =3D &ctrls->frame->tile_info=
;
> +	unsigned int num_tile_cols =3D tile_info->tile_cols;
>  	unsigned int height =3D ALIGN(ctrls->frame->frame_height_minus_1 + 1, 6=
4);
>  	unsigned int height_in_sb =3D height / 64;
>  	unsigned int stripe_num =3D ((height + 8) + 63) / 64;


