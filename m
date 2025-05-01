Return-Path: <linux-media+bounces-31537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8DAA647E
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D143B1558
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69510238D54;
	Thu,  1 May 2025 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ga8zr9RB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015B236421;
	Thu,  1 May 2025 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129373; cv=none; b=haFsAAZtyplkPcQzfNZiWQzoy1oAyyku3cDM5RDEV8OdDVOPSZolCUxXYP25aK9LiKiLxyXS6FQWJq+TH8zq0cZ7blaRpdE5VKlrwj+i2gn3TWz+gqj5o8ANINLCLyTTX1XhsLxPq382VA9+QApn4iVGrhlgc876o4I02EN9cOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129373; c=relaxed/simple;
	bh=mznnJHuLbKpYgm+SG5uyUsVWXj7gHH37CxevZHUxBVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9faY1DRu2Q8wrlxt7/ic7DnP6losVEh5708On6loZt6J50AjQG9N26xi+3cWs8g4KZJyeoZ1vyg1YI/AxU2LVgwR4Aq+vYbu/P9UpZmmEmSrp7VGYcQrZJ0iHnRdlqDupDKqLm2uTa7R4k5Sf0NwTBrzki2quWlC2EKzprhIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ga8zr9RB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746129370;
	bh=mznnJHuLbKpYgm+SG5uyUsVWXj7gHH37CxevZHUxBVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ga8zr9RBEQIyf6R40Aq8GvMyPwBilJndqvio72z2GNMPjLu1QNeJV17UjpTM9Bk2E
	 O4Sfb3MwllDCATa7SFRDWW7crfQSdR8YcehO7Rkh1xzn4y8OIdqPT22uR5wn3IB1zJ
	 SRBA7kVJlLupZHuM5QGHBaphA/orETX+v5X07i7/dtNV4PvfHh5SdJ+Rp1NDkVedRs
	 xvJY8Na55kGb3b3PO3OzP4nUEp/Gr/FtWtqFU4/wJSq6yc0XALLMfMBEgu08fYB2uQ
	 asskki3NcA/aQ2q0SSPW++po2VDBEcqnhGJV4EmTFInnPzNedZRlfSSUgPIGV8Fodl
	 bvApNx+eSnFzg==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:8242::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 000D617E03BF;
	Thu,  1 May 2025 21:56:08 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 01 May 2025 15:55:47 -0400
Subject: [PATCH v10 1/4] media: rkvdec: h264: Limit minimum profile to
 constrained baseline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-1-c380ba452108@collabora.com>
References: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-0-c380ba452108@collabora.com>
In-Reply-To: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-0-c380ba452108@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, kernel@collabora.com, 
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.14.2

From: Sebastian Fricke <sebastian.fricke@collabora.com>

Neither the hardware nor the kernel API support FMO/ASO features
required by the full baseline profile. Therefore limit the minimum
profile to the constrained baseline profile explicitly.

Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index dd7e57a902640d363d26be887cb535c2668d5b15..65c6f1d07a493e017ae941780b823d41314a49b8 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -150,7 +150,7 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	},
 	{
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,
 		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 		.cfg.menu_skip_mask =
 			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),

-- 
2.49.0


