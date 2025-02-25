Return-Path: <linux-media+bounces-26927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E7A43A23
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 597404403D2
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D30267F44;
	Tue, 25 Feb 2025 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="J2HBSLG9"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E4D26158C;
	Tue, 25 Feb 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476574; cv=pass; b=Knz1YFOfhDbdzX/qfsY9TY5pWhYREuH5WTgjHOmyj+xP4Cn9R5mHjR3/aioItyUVaP4c49plgC2mNXNKW9KSHqF3MBU1JBmNUygjRkGUYvNmNMvnLXQ/SG/e53ch3K4K9uNGEhPzoeXx6D3N/pZ+v9B93xn4YkMrpeD99WvZugQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476574; c=relaxed/simple;
	bh=Ja1ASVEnylkVDPrnaxfL7Gu8Auz2+lAQasPZ0WLJwiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhrY9QfRYD3PeHPHUiaWbTJeaV6c4sEFHAM1eQqQ+Hu6aKWqFy5bbpaw0MyPAUil9oKPZXXbKR1wBMfbHpu4csLVQ/VfpVc+rG/cJn1Ti1EYiDeh+4YrGDXvFs65+c+rNlHJLl/BI/lIdLWjSt7Z3A2brLLpOxTs+uOJd5v/l2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=J2HBSLG9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XcKkwdx9WAj/+w3pEg9D1riD9Ej2y49bwpT5CVEQOJRLWnd9j2xE7/epKX1Fd9E525SzUdH1zZy1+FsdVLbGw88lRkfEWxr74wRkDveXzl2pDHLiLiWP+hLYPvKPzPVe4rppkw50D/7yiAjQhlOiNUNDN6XSmMGCoYUlveewJyc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476551; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=98NKcVOP3m83E8hgMre8aUN2HOMmw9MEKVvfDL7Tcc8=; 
	b=DlD+jrIoHeXj3b1Rwemq2gusKxNVIUQ4VyVHrQM0a6rs7LRPLYzU8hSmuKRZ9Aq72aOXLT2f0IO+YFVsrbe/qS9IFil0AD/HTt9RIN1DGBz8e+uGAxsjAC8L3yEKWWvnaS2gT2LiGgml8bGUwgax8B4ZXcmOvKjmlMxAXYEFCHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476551;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=98NKcVOP3m83E8hgMre8aUN2HOMmw9MEKVvfDL7Tcc8=;
	b=J2HBSLG9tEeaR5etzB/5j2NnH+69/VFx1w27JFQKpKfN2dJJ5q3TOpGEW0CHpCQC
	2FBrh6nYYaYeAbhnzqU1mJYi/ebCtOQswTF2x90jkJvzfkxjTYnEL2ay8G+N1K2aScW
	zHP+wa0FhISfT8dBJRLHf6QYiqOGWn8fybovzRx0=
Received: by mx.zohomail.com with SMTPS id 1740476550430177.37442835818695;
	Tue, 25 Feb 2025 01:42:30 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:32 +0100
Subject: [PATCH v7 11/12] media: rkvdec: h264: Limit minimum profile to
 constrained baseline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-11-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=1122;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=Ja1ASVEnylkVDPrnaxfL7Gu8Auz2+lAQasPZ0WLJwiQ=;
 b=4vOCbtcqOkYByVo62A8sEoTu4EZtDldVj+O7DdsEOGtQgEmOM1EC0Zx+6aLDY/FGgAPmZmrp7hxs
 u7G3NTenB+Oto3zQbZdnya5Y+xgoAiN1tsdce1NRp4GPFMZS5Twg
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

Neither the hardware nor the kernel API support FMO/ASO features
required by the full baseline profile. Therefore limit the minimum
profile to the constrained baseline profile explicitly.

Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 351444d569316cf52850a1831710fb5c1aceaa70..2859041bcc932bd638b4288bb8eba6b1443a08e3 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -195,7 +195,7 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	},
 	{
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,
 		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
 		.cfg.menu_skip_mask =
 			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |

-- 
2.25.1


