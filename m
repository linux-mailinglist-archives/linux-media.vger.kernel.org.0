Return-Path: <linux-media+bounces-30486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E192A923A7
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 19:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB153B08DB
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 17:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D497E25525A;
	Thu, 17 Apr 2025 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AD08Bybc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C1255223;
	Thu, 17 Apr 2025 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910077; cv=none; b=l3Mp0yEo/zq9WsfQiU83mwgsZIpdxBZ/28uImbjPKPre9hDrjW7sxxSStDIDoDNrdRuOuKMLhC8J5og9VNe+dHMHms/eTj70mB/n1TAXdw4h9b6IeL/2EUirz53+rMBmzJWEM1jz/xbKiz4ZtwTpei0GYRq6+Kw5Z6OSfTyw3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910077; c=relaxed/simple;
	bh=mznnJHuLbKpYgm+SG5uyUsVWXj7gHH37CxevZHUxBVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlK9Tm+mn+L32cKB1Xu07fxDwJLDSCNDgEYncsJ2gGW228qv/Y0mlgGkNxoWAK8QkMNfwRdGcQgqMbUWaqnShCqxhOGhHn+Bd3zE44gyC7TYtrfC801Cl7dd2DRJMNhwbuLNJAubsnQq9NzBgZxt7GqG1C9SUc3BReup6PzqvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AD08Bybc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744910073;
	bh=mznnJHuLbKpYgm+SG5uyUsVWXj7gHH37CxevZHUxBVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AD08BybcgLy+pTShD49cTezcxU3iPdwqN2KO2qpUIiKpMSBEDSUgE/KN8zL2VqEF5
	 7+6huuAMb0k1amJE1oCspJW7DTf5qXDWX8hfe//S2yMrihc4P8jsXoQCA1shRIx2Mk
	 Plab3FEkBoI1HIAADg5+7nY8JddV9uHmzEZir4qOi4JXhoFXcc7/hVrSgrTKU8rD0g
	 JPfcR7NX447uQsJphOXs5dD6zDoK80/5qCbjm397oukx5ETKuEX9xMxQ44hAXN8l9I
	 GWdfbyh6bj74MuvuTI0AYwUnI7uD1IOhXxU/9IFmj3MzQx6OPxyXgUloQlFEA148bF
	 0HKACGbqVKspQ==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:15:9913::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E13B17E0702;
	Thu, 17 Apr 2025 19:14:32 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 17 Apr 2025 13:14:23 -0400
Subject: [PATCH v8 1/3] media: rkvdec: h264: Limit minimum profile to
 constrained baseline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-rkvdec_h264_high10_and_422_support-v8-1-423fe0a2ee7e@collabora.com>
References: <20250417-b4-rkvdec_h264_high10_and_422_support-v8-0-423fe0a2ee7e@collabora.com>
In-Reply-To: <20250417-b4-rkvdec_h264_high10_and_422_support-v8-0-423fe0a2ee7e@collabora.com>
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


