Return-Path: <linux-media+bounces-30543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35982A93758
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 14:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D47E8E0D12
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C7F2A1CF;
	Fri, 18 Apr 2025 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AfIQwtkh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38600273F9
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980313; cv=none; b=cn90KUsGjE6ODMlME/hMK12PAPj7o9jJ2h498ok9iGJ2xVvU977KKczZbwvpdfNMI6qJGbfQGr2Zj78JqxifwTOe0iJXWWijCF0ZROtrQ0B4eFh2E1Zysk/xK4zxakpb/K01XDA4aSH/AdNN4IqKI4gBWHcs+P93OWZJt9Mw7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980313; c=relaxed/simple;
	bh=18Osn+o9xTHzDTfvt5jq/dH9+/i3xRIFr76Wqmc58IA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u9c7iDDDWZUNPufPyZjw8j1KnbAonZMwJgPoKKLgwNJG2MYOaCgMSIivgP2xFdeE3EhsuTedEblt2JjbtRRk0i5OdQYUCWgedQ9Hay7jHoNbRSQ9CPoH6DZLNTYZDmGKl8ZSO7cKHeWMWXBqpBroy/NIHq0hmQ/zEjUbGUNWUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=AfIQwtkh; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecf0e07954so26812576d6.1
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980311; x=1745585111; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=AfIQwtkhfAYxtxx8nG3kUXkguxixomrSCD7auKtELjBajOU2JoIz+CAIvSo2h5e1dO
         S/47zYYSIxuxqPW7AyDpK7czq2f0dr1UyJpQOApSalIt6a+U9hXU8RVDSNORgBSJIwiT
         Jt2Y3Rg3YNKqwvBmrkc8ID608S/kONqDg3rBxLRAip+xhbZ/8ckQw+i2ba+ffWylaTc4
         rTW9b1uKojvzlfwJC68qRGxS9kxgtkVeNbqm0vd6OS1yZur7IrwLHOb0eeFwP8gQ0kB8
         H3vuDt9xWVHB4ehuvJHFsFOtb82rinrbHndG9dqgOcZxhAaUt99scp2iZrDnE79cl4+n
         DfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980311; x=1745585111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=NetyEXqI0lxl+yyt5cuDXVH0Zzo0AkNZxPeBf5FpOoyLvqTFEmD8ITbGUdGjayVn0w
         meDHQRMlL/Q4u6pXAAMoMRuIOCqCTww5tm1n7fmjEDfomBfUN9II2A7pqHl6cpGKspRW
         iv8Drtit7PgCmQ69ci6n1AIs+mf3Yj00z+q2z213Rxw2WZbi1JNfsFAnM7Svcx0T1Bzt
         N5tB5qc//SZr7GPHZMZ54Fc5/leYTiBlFLorGMDEakZQLperdOJKIRzt7qBiYTcmEA8G
         TnQ/5iIL7gnfSUKn1N007FWBb7wsyZwhitxN4V7XlHZyh7X47p59eyurJhMr+VvEvsuI
         jZjw==
X-Forwarded-Encrypted: i=1; AJvYcCXvr0Cf9P51AiXwbLgZCqVn5G9FoRZnxy2XoJBR/MXooRoINNFTFvHHKAL06AYxyKsuUm2hbKmccYTt8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEYrPM0l1wjyoOAF1QsjKVcxs+tO4DvvjdOAqEZsvUbyA4MjF
	6TtHY9wNd1UZRR+ALB9D/7FVjDA01FksrKDxgcVItJfHZIHRlzAXKY3ngJY1N8U=
X-Gm-Gg: ASbGncuAjwmaqachNIvB0sjqPY+PixEkdswoBTf55v9OmaDWQStiETA2nPideyTZdtv
	y9uXtlq4Y6V5zo4/oNgouL4Z5L6WlT82SXLWY+gSUfo6Hdqh1z90/gxp/x0Dhe6lUeefNLxM4pB
	5iChWcj/oUbLAFEkDfF1op6MI1VKAVI5njVAy2eps52obHzT4Lop7EvnbY/hnrM/B/Be3jmG5Jt
	1qbyh7NLRHqx3OAypfq+N5A+zqJlzlfaH6Vp9809ZCWTm2XDstUBSCQMrqfvjmyQ66IKivsji73
	tLhr6w9r2bvrhlT4caiWy6wBWhnTrsFtUmUDT/jFamNqHg==
X-Google-Smtp-Source: AGHT+IEZdyYA51jGvbZkm/yOrNHbFvp9m23H3RTW5HtgAkzz9w0U+ZAEqEnXFIW9TtqYnKH54EJ3Ug==
X-Received: by 2002:a05:6214:daa:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6f2c4577f11mr35766706d6.24.1744980311082;
        Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f939sm10224416d6.48.2025.04.18.05.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:10 -0700 (PDT)
Message-ID: <275992627ec612d0a82f5a63bcdae47efdfe16ef.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:45:09 -0400
In-Reply-To: <20250418070826.141-2-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-2-ming.qian@oss.nxp.com>
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
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.

Since the following patch is a "Fixes" and depends on this one, you
must also add the tags here.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encod=
er/Decoder")

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Ack.

> ---
> v5
> - Split the resetting pointer in free to a separate patch
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 40 +=
++++++++----------
> =C2=A01 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..2f7ee5dfa93d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_da=
ta *slot_data)
> =C2=A0	return -1;
> =C2=A0}
> =C2=A0
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.desc,
> +			=C2=A0 jpeg->slot_data.desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.cfg_desc,
> +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +
> +	jpeg->slot_data.used =3D false;
> +}
> +
> =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> =C2=A0{
> =C2=A0	struct mxc_jpeg_desc *desc;
> @@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.desc,
> -			=C2=A0 jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.cfg_desc,
> -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used =3D false;
> -}
> -
> =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx =
*ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *s=
rc_buf,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *d=
st_buf)

