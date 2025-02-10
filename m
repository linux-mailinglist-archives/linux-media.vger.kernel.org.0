Return-Path: <linux-media+bounces-25923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DEAA2EF1A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19143A1A7D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0523722F393;
	Mon, 10 Feb 2025 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="KYQPe4yX"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC0156F53;
	Mon, 10 Feb 2025 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196037; cv=pass; b=SRhyzX5m9dM8rwmVZSpk+cZmdXdFMvt5o0DpwzxaEgTYt2OKqX8z8/CpzWGB+yAyLYaWNLgXGJi6LnHKWUBh6q8VLcVC3B6Cv9xYfkzG7cbXztCBAQa4ujrG51/S5Bm8zurCqvgnd0LCWFskCpofjnCELxvIhG1tW9XLLZvJejE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196037; c=relaxed/simple;
	bh=UBdQFvlpLHtwOucQADqpJpV39YDCQhywTCC06cdU/NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQmQTA/v3abRV8veCi+CjE1rkLdOSbDM7pWiugmWP0CeAuy8tanVfmz9TImIXR+c2b11CvH+PoIpSyVpOHtBCUFM1SFk9HKNA8DxwuTDX4jYAc824WlqDx6DgtHKa6cMAsMkmf4sMdQk9rx0Sdmc8S2fC8BcsxD834ykXTb8OEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=KYQPe4yX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739196014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n94BGAh9My2h/aIZWWxJTF7Xf8ZAygB0BAhnATh5n/eiYCUlnUDVfueAT8aiHTfiUBhOCK/6EENwBQg6xkow0doOMQ5A3lzU3pKDNfYyyIosv2mrQpVPi+xHT+8AREo4UDL19/fKM66UDx7f0WpwgKgeDEFm+inR/KwR5Ed+Qug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739196014; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8bMwBf8DI2ybdmv+zq4GM7AQDZt1piNTaqNHdDDz1ME=; 
	b=hW8bsrmGxTwraNzvJNWIAYYddF7FyCL8cGsCf+xdSvB+muN8KkTOUvPKLrMG/DViAnrqCHEz84ztxVam1YCNwPiORCng3puwZsVgJ7zUVSFDyXI1PQ7PLfBuEo2ii4v9CBRJIS0vn8Dv2HRcT6NJWDKmv76JtkRLvN/ASPzFu+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739196014;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8bMwBf8DI2ybdmv+zq4GM7AQDZt1piNTaqNHdDDz1ME=;
	b=KYQPe4yXqLt1VWy5tKYKQ/dqp8k84LFPN5v6PYewWKV7qLEGIHlZ/dMoTW6YMTfc
	dQ+zrqyouDNPiqBlOGh68qgMFJkKi20pwP5dLOPYoIuYVCLNE1jgUyXQSWQx9bldi5b
	y/LpU+ssyLEOWHymUjwT6YS1jE6/slPJ1Ej9v48A=
Received: by mx.zohomail.com with SMTPS id 1739196012032335.813176114179;
	Mon, 10 Feb 2025 06:00:12 -0800 (PST)
Date: Mon, 10 Feb 2025 15:00:02 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH 2/8] media: v4l2-common: Add YUV24 format info
Message-ID: <20250210140002.rhhxn3z4l3dbyege@basti-TUXEDO-Book-XA1510>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-3-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-3-nas.chung@chipsnmedia.com>
X-ZohoMailClient: External

Hey Nas,

On 10.02.2025 18:07, Nas Chung wrote:
>The YUV24 format is missing an entry in the v4l2_format_info().
>The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
>per component.
>

That means that 0376a51fbe5e1 was incomplete, I think you should add a
fixes tag to this commit, to highlight that you basically complete the
previous commit.

Regards,
Sebastian

>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>---
> drivers/media/v4l2-core/v4l2-common.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>index 0a2f4f0d0a07..de3636f1cdf1 100644
>--- a/drivers/media/v4l2-core/v4l2-common.c
>+++ b/drivers/media/v4l2-core/v4l2-common.c
>@@ -269,6 +269,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
> 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
> 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
>-- 
>2.31.1
>

