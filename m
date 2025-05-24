Return-Path: <linux-media+bounces-33299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD5AC2C95
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 02:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825D14A42E5
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 00:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6450C8FE;
	Sat, 24 May 2025 00:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vZ1PjET3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12464690
	for <linux-media@vger.kernel.org>; Sat, 24 May 2025 00:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044993; cv=none; b=MT/Uv6bMWosiyqVPKM2S6vDAQfs1xzE2p2WTskaXTMMrIXmVudE4gDkfncQuu3m8LZRB17XVugYyKLsa8PIsIgf4I3JWXyXSqygwrXWrzdCMh3uxMcAYNBDlyKCMzliq9xP/TLWfPhyC4uWSvJRM4M8bLXZ6SjpzZksBFOKcics=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044993; c=relaxed/simple;
	bh=D1rHEs9Rnrh2fo3+SBcBY9k/RBpmLkbdd9w+WxaWi+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JnnaOK+eAzlXdgay+kUGvEnFWTWEWYGHleQS927ynN163DegTa0pbPxSrrupz2/VlsyQkqGSGBDHpRl8xwChOPkoEYWdskqlGnQiVKohhvbnw+tEuuQW0zn0vMRb3q/BCfuQTJT8LVq42yr2p+ufhW1xWNIHp8nvRFJVt1fiz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vZ1PjET3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c542ffec37so36224985a.2
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 17:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748044991; x=1748649791; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4opPIOSOsz08wDjPNXDe/THEcgYZeP29JFFlP6TG8U=;
        b=vZ1PjET3KCe/yTcFb2smdpHmj3bNQT3h/Uf8e5oNFzzBZFvM8U8r3vNVnBXltKKnZO
         Um9vpwsh/dly3h5NWyshT0EA6/3uFnLj5e3JAnREqXBOepihnw6qX33nNr4C/sp13b/f
         TNRBU57jASh7alt+ZKHELoj41HbacWF0a1g8be92t+kDtzoGxzc22W2PBsjLk2NuuuT2
         0Uj89uxrXPmJ3wmFnq5my1rgkJHZbKde1c1M9VzfMuHg/NZ91KKtIWv6rU/rilqHOgnP
         8eN24zi/xEvWnpveeK3W0d2ZawKGuXQ6sNyaedxubCxbRjJdpRzHAxlhqxsuSkYROY35
         AF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044991; x=1748649791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4opPIOSOsz08wDjPNXDe/THEcgYZeP29JFFlP6TG8U=;
        b=hluPojVoCTlWSFHoB3hwZm/YOrP/nps2rLrJdunOSy8q7X/OJCBij+GE4Ohl8kGAY2
         Jj3yyYMlyAYiKIfm2H1iz807nTDJC/qntE4fn226aS97BfISYD5bdFNYayhUMmBI67wT
         uqE/f1n7Ks3qP25zr8kvY3o90jL1NqimAqBenW0n6oanhg2jDiQi2ZQHHmxZKvobmdn4
         R9Hr0hnD0vYWpAS2fGO1XmCG0ljasx52Y+9ztSvyV7RT7ltHmGkAgRHPDv4BYkAloS8l
         qM/21IIMdA+jzI0lAux9b4S2G2phCIZlvmHmPcVnyAcdSbMhnbDYPklFg+ewvDqpP9h7
         69HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO41mtZNlvaC3VbgFbX85KQkRCmkYtPbrNf3EOKNauyv9DFOI441B+IvGwrJXIwhMWkyZYZ7vz8JkOmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMHrpjKP97R0h4IAG580KuIJkN7Ubntjl/P1JOeZwfq3sZbOaG
	gziVtqEmOBjV/uZUPvvPYC0tTaSoW7jvMSJTddfSRIa5rGNkMwmgAJd8cEUbdMqZpSY=
X-Gm-Gg: ASbGncuc/7KZuoeNyGrNgVp2l8vpjRod1OxQZmVUVQ7oLxouzm/43/yGtJGEczJz1J4
	lUV3+D3drjseODfC4QWS59CpHVy5eICaUJZFSOZLIE+Ofm2te+BZWIsJR7FfyohSQ6SsQlETmsN
	m7IAInhjvQiT+l8+xwbjh2o9jvEgTUY25pBVcUrdRn1KG5cvWHoDgMABITuU4UECVOmTeEGrOu/
	yftKY/rcB1HhcAInfgwWFJzsg3n+82nje6Fj8KqLqAtK5tXuD3bxQUGqaTcWxHo7Z5OXAzbRNx7
	iTy7IxnTovP7OhUdyihAb8LHD+bSNDdecLAL5m5UQ/iTTm5RkFRmV/Ou
X-Google-Smtp-Source: AGHT+IGBwAQoWstxEDbk7EcqjEnHqu91vhi+vANL+tSMX7buO7G75pqfgQLBAaGT9HN1knmW2LmwKA==
X-Received: by 2002:a05:620a:19a7:b0:7ce:b9ed:24dc with SMTP id af79cd13be357-7ceecbd2f51mr179211185a.23.1748044990812;
        Fri, 23 May 2025 17:03:10 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef019sm1253414085a.63.2025.05.23.17.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:03:10 -0700 (PDT)
Message-ID: <a40986e970f049aa1448bee662b024e50404e04d.camel@ndufresne.ca>
Subject: Re: [PATCH 08/18] media: coda: Add log to finish_encode if buffer
 is too small
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 20:03:09 -0400
In-Reply-To: <20250314152939.2759573-9-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-9-serghox@gmail.com>
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
> CODA_RET_ENC_PIC_FLAG flag means that bitstream buffer size
> is not enough to save one frame data when buffer reset mode is used.
> If this flag is set, currently encoded bitstream is corrupted.
>=20
> Co-developed-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-bit.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers=
/media/platform/chips-media/coda/coda-bit.c
> index 3e3bb3d64ec9..515eb8be4b86 100644
> --- a/drivers/media/platform/chips-media/coda/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda/coda-bit.c
> @@ -1641,6 +1641,7 @@ static void coda_finish_encode(struct coda_ctx *ctx=
)
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> =C2=A0	struct coda_dev *dev =3D ctx->dev;
> =C2=A0	u32 wr_ptr, start_ptr;
> +	int val;
> =C2=A0
> =C2=A0	if (ctx->aborting)
> =C2=A0		return;
> @@ -1674,7 +1675,12 @@ static void coda_finish_encode(struct coda_ctx *ct=
x)
> =C2=A0	coda_dbg(1, ctx, "frame size =3D %u\n", wr_ptr - start_ptr);
> =C2=A0
> =C2=A0	coda_read(dev, CODA_RET_ENC_PIC_SLICE_NUM);
> -	coda_read(dev, CODA_RET_ENC_PIC_FLAG);
> +	val =3D coda_read(dev, CODA_RET_ENC_PIC_FLAG);
> +	if (val > 0) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "Encode fail. Encode buffer is too small\n");
> +		// TODO what to do next?

Lower in the same function, you should still copy the metadata but replace
VB2_BUF_STATE_DONE with VB2_BUF_STATE_ERROR. Perhaps introduce a state
variable and set it accordingly.

Nicolas

> +	}
> =C2=A0
> =C2=A0	dst_buf->flags &=3D ~(V4L2_BUF_FLAG_KEYFRAME |
> =C2=A0			=C2=A0=C2=A0=C2=A0 V4L2_BUF_FLAG_PFRAME |

