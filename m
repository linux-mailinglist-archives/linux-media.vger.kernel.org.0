Return-Path: <linux-media+bounces-30544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B5A93773
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 14:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE361B66897
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A5A27602F;
	Fri, 18 Apr 2025 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="DX6jvYr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83017275874
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980558; cv=none; b=O6YRcC25Tj/kit6amlJosc3Cv6RGnciDfqYB1f2KZZAVPTJz2TRE9k49SiMSBE+GNYaeFlDFt4dNv7fGS4Dwetk8wRF4y7Bi6q8Ru7EEeuVOYH6bfCchjvkwxfujr6ElXcEXoWa5wez+RMnmCAIrszVvmqU0b1iJoaucj/FJwJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980558; c=relaxed/simple;
	bh=gQlOxlO8930yO5ibgAmuqXeO4pmpPbtEVExTdD/GYtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FzW4nN2TNISpBC9dBFaCoTrYV6XTa5SaytpCHu/7g6l7lVuQQ2/ZgwrUv7G20V+7+CZccEvSnX3+7jL58iD79UDJPcadH/wflPZv4fR9rRZQbz1bq40QJq2AAZ5BDVk6HlubLy1595VAzoO+R/L124yTEJPeJ2WB3qzCCGwnMjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=DX6jvYr3; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c554d7dc2aso271931885a.3
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980555; x=1745585355; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=DX6jvYr3Aq7A3l4jD6mZYKEyKdMlXheX46wb7a5Qk/2Ok3HacWgdjowG1zVNierTVm
         CDQyM45fDLsmfQlmZqfY28oJDi5W1poCaOl5qrAQPRjaq+wGCrB7C6IRsVC/NEFDSf+O
         J5AInOzKNJojJglcA5ro1c0mtfhHAIkgQNlusw3SOMDZRLuGIins027SF7ZpVr6Qah5m
         GM6GYkSrZ8BTZbIzDNrf7l0LlCIewx9SSzxrn3I6t8fGksXC2vaOl/j5Y0PFuLCA8Afq
         aP8ABY0QEubWiZJtTWNWlidmp7YdbPzsuUQ7zX8hAKrlJAGie7ktvNey88DBboXNYcmJ
         Uphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980555; x=1745585355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=j9NP9fL5qcqBlxmGt4p+I2/qv3v6SdweocgO0nzEgFElaIxZQNI/1y0vkaw1KQwIDB
         Hzz+eEMxNf6bdHtN2GBSZUOOnw70QkuauCn6fGYQgYfIwus/+g0ICZnH2oB0trQRGrHF
         6I7yB1Ks5i4jOuwA/aSiKtLKHZxYyi63ooQJGIvgazQUf25EhZIkqUcc7XxlY6pEQexr
         CUkwlcoeaFE13t5M951X/OhySMckU2snFuVgMpcTu2iQ/aVqDYDYTI0qTW7eMprX0pkm
         WsGukFoJhH79C9i30oc1I3XpkWsCuxsMOHaY4PAFpWV+1azID+MgI0oY3r5Hj6pMn6SD
         s/tA==
X-Forwarded-Encrypted: i=1; AJvYcCUfbat3BkKDco7oSVupNUTc+E0M8PdgrNHp09l0jBXHOZ/46Ikn7sV755B3zuYNj0uVUvqYgpca9R8elA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSpVSxebQVGNg5lP0d4Zvfc0x5FTLCVeqsTzjbScl9H8/40I4R
	752puNKb8g9MLSQx7haEONSmYMZ9N4VbDICliUeS7oau07leZYzOUxiNJGZB8Xw=
X-Gm-Gg: ASbGnctr7ox+kNlqkSxp98QiiJc8hvmY65GnxCrFQLVEWm2x/1lUliRM4DNG2yvOaWp
	XG7/ClGesif1Us5Xu7JKQxLzQAjcWRCahWrlQkEbhP/MVSG1RTDfpcqaIMdcCeAgiaVvUQL20RI
	wP5b2PgYIapW2bfVyJPhSOhydRCrCSekgq65QexXp3lVLmbdJkbvymToQMcPqsJjJ3ZZRk5dNW9
	DVx22qt7C8j6C3gZ+/fv6SZH/3PTwhOzYGSBvJa4MGFh+s6eqEfXcRPQhsNzNyS21ROZxCryzc3
	tBGICCGoJAMvtXxOJoU3xdaJZh8F+D6kmAI4jfwfXDjLfA==
X-Google-Smtp-Source: AGHT+IGynna9oqlUfCvK4A2bAh3MndEe6O6J5Dk7XbTAN7GvFRmVsTQUL/cmbo1DTdHEkCI6hkR5wg==
X-Received: by 2002:a05:620a:bc8:b0:7c7:b59d:a6f2 with SMTP id af79cd13be357-7c927f59337mr381802985a.10.1744980555401;
        Fri, 18 Apr 2025 05:49:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f3c5sm103702685a.37.2025.04.18.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:49:14 -0700 (PDT)
Message-ID: <22e43e927514ebfc20e97f2bfd5fd52899820627.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when
 free data
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:49:13 -0400
In-Reply-To: <20250418070826.141-3-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> To make the function mxc_jpeg_alloc_slot_data() and
> mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
> the slot data pointers are reset to NULL and handles are set to 0 after
> freeing the coherent memory.

Perhaps:

   media: imx-jpeg: Reset slot data pointers when freed


   Ensure that the slot data pointers are reset to NULL and handles are
   set to 0 after freeing the coherent memory. This makes he function
   mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
   called multiple times.

>=20
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Enc=
oder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v5
> - Make a single patch to reset the slot data pointers when free data
>=20
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 2f7ee5dfa93d..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.desc,
> =C2=A0			=C2=A0 jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc =3D NULL;
> +	jpeg->slot_data.desc_handle =3D 0;
> =C2=A0
> =C2=A0	/* free descriptor for encoder configuration phase / decoder DHT *=
/
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle =3D 0;
> +	jpeg->slot_data.cfg_desc =3D NULL;
> =C2=A0
> =C2=A0	/* free configuration stream */
> =C2=A0	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> +	jpeg->slot_data.cfg_stream_handle =3D 0;
> =C2=A0
> =C2=A0	jpeg->slot_data.used =3D false;
> =C2=A0}

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

