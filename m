Return-Path: <linux-media+bounces-15289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C98CB939E85
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 12:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699531F21E95
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DB214EC40;
	Tue, 23 Jul 2024 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GYsDgD7z"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EAD14E2EA;
	Tue, 23 Jul 2024 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721729018; cv=none; b=J7tB0gmxZLEOZYWAu1jdKmJKDQ82mgddugp/VbsaY4IJ/IQe2/oocCg4sCIeCyNb6p1o465C1x9dahp6NaHsX+00qwY8rZOJ0CG1HZah+5c+BgZnrD12yvEJL2+zzxyNOcClqyiDP46hoxNRkVjRpZIkmp6LH3X3kWpZpQi1aLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721729018; c=relaxed/simple;
	bh=nStvir8hkCrV3IUTf7FjED2i3x9SkrQAgyKbZdsWLB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgdisYhZq3cNIeGjy5N2whk+GzJfsV8x9IX0C0c6cNI+2k3AoPMcDexu+8FxGY3wqWxNBCiF+6dOIo1F9kmiuDEJ4yLEHlLxwWIdOBsmaOivI1qhJqMLxTB0Nf+dkg6Zbxh3as7yLin3yNHBwSy076NBDMV7kt+lLPRAIhWr1eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GYsDgD7z; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721729014;
	bh=nStvir8hkCrV3IUTf7FjED2i3x9SkrQAgyKbZdsWLB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYsDgD7zhTQZ+wzraKbfv6YKBeZyLb467Dt+kQCK7N36MumCxN30Npvxr8uladhc3
	 PZnnVTIVlhoyGAB8uAug/Yhi1uh0KpJcwDT5JVCl7+L3G+VZGBXph4rcyfoX1jn2cA
	 G0mvzrk9UAzZq6b0CQIMxSpou5LRxNphoTY28/PtzbZQ5HM3eiVs/ViZHWAwejiFV7
	 iHmdsxLdHUnrazDXNB1llVvgdxBOMGuPQ7q0LIjqSP1xGMqBa3ECh5Brjd5WYkLLwv
	 43s0UtLbMDh/pdT4H9aMFPc/zqjMBGeEkYMyaPuTCH+g8GciS4Lk6rY0CMw6Vvq2MU
	 Ei7SXYq4mYT9Q==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B3AA3781167;
	Tue, 23 Jul 2024 10:03:34 +0000 (UTC)
Date: Tue, 23 Jul 2024 12:03:33 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v5 3/3] media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL
 flag
Message-ID: <20240723100333.gf2ih3kbjllq7xmb@basti-XPS-13-9310>
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240722150523.149667-4-benjamin.gaignard@collabora.com>

Hey Benjamin,

On 22.07.2024 17:05, Benjamin Gaignard wrote:
>By adding support of V4L2_FMT_FLAG_ENUM_ALL flag into the driver

s/support of/support for the/

>we allowing userspce applications to discover all possible

Either:
s/we allowing/we allow/
or
s/we allowing/we are allowing/
are correct.

s/userspce/userspace/

>pixel formats of the hardware block. This way userspace can decide
>of which decoder to use given the support pixel formats.

s/of which/which/

s/support/supported/

>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> .../media/platform/verisilicon/hantro_v4l2.c    | 17 ++++++++++++-----
> 1 file changed, 12 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
>index df6f2536263b..77f024aaa22d 100644
>--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
>+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
>@@ -201,7 +201,14 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
> 	struct hantro_ctx *ctx = fh_to_ctx(priv);
> 	const struct hantro_fmt *fmt, *formats;
> 	unsigned int num_fmts, i, j = 0;
>-	bool skip_mode_none;
>+	bool skip_mode_none, enum_all_formats;
>+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;

As described in the previous patch, I think this operation will turn out
to be very common, so maybe we can add a macro for that.

>+
>+	/*
>+	 * If V4L2_FMT_FLAG_ENUM_ALL flag is set, we want to enumerate all

s/If/If the/

>+	 * hardware supported pixels formats

s/pixels/pixel/

Greetings,
Sebastian

>+	 */
>+	enum_all_formats = !!(f->index & V4L2_FMT_FLAG_ENUM_ALL);
>
> 	/*
> 	 * When dealing with an encoder:
>@@ -222,9 +229,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
>
> 		if (skip_mode_none == mode_none)
> 			continue;
>-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
>+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !enum_all_formats)
> 			continue;
>-		if (j == f->index) {
>+		if (j == index) {
> 			f->pixelformat = fmt->fourcc;
> 			return 0;
> 		}
>@@ -242,9 +249,9 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
> 	for (i = 0; i < num_fmts; i++) {
> 		fmt = &formats[i];
>
>-		if (!hantro_check_depth_match(fmt, ctx->bit_depth))
>+		if (!hantro_check_depth_match(fmt, ctx->bit_depth) && !enum_all_formats)
> 			continue;
>-		if (j == f->index) {
>+		if (j == index) {
> 			f->pixelformat = fmt->fourcc;
> 			return 0;
> 		}
>-- 
>2.43.0
>
>_______________________________________________
>Kernel mailing list -- kernel@mailman.collabora.com
>To unsubscribe send an email to kernel-leave@mailman.collabora.com
>This list is managed by https://mailman.collabora.com

