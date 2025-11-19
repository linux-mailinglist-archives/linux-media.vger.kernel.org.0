Return-Path: <linux-media+bounces-47356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0707C6D514
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 09:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C81A72D48C
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 08:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764F3320A02;
	Wed, 19 Nov 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qwie+VBY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7F2F5321
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 08:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539803; cv=none; b=pTZtOyZT6v37KCVZD0h7I6i+LrpPmjWvxO8CqOgc96/VnLbwiuRrbCndFAdPKKoJVv/52Q5xXsdnUz1EPNeDdBHX5kl70EJzjtA8g0rJj+9AeUlr8CNDXa5JH1FkNGXWsIqukxLVIpkvQRuz1hyG8uUIPnScZGClDoCgLQWAAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539803; c=relaxed/simple;
	bh=Yut0WA+8SDFNziooZRQDH571zlB6+TkPVIIMdys54mA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBtbPkAf0txbBo1dYtLeya+v2WY+XWGTWqAlbdtcnkiTdRsefCeVXskBi0imYyaZYe9tH/eVutrp9Fx9g0SDB3oFcIYZpHE/3MsrejU1YHR0bDJNv5tv3ZVI5fBr/eIN+e5/aBGZJXR6m1LuBqy/kIX6TKE5v2ajeptfUS0wXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qwie+VBY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3761951f8f.1
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763539798; x=1764144598; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=;
        b=qwie+VBYVnit58cr33wDwSb0UtHxPpvJua6ZfibbsqhWxHley4kl++LlnXRnzXmHAW
         SScx65XfAydUfNQAGf+R1oH851gLQx88h/qyRRaKtKl42P2OOphSkuKTgH8kxoGCrSpo
         C0taVxK9D22K1WYTyBpe/affBidYcBzWP0KXLX7vfq/v++lBBpkuz0JVpCgWCxTC5sxs
         QRKNagCXUWBcUKZDnr1jbYFCwdm0W9rmMiKFYWFu+693iLYehmw+vtN/7hdqntAPn+h8
         QOT7QKfY7QY2N0H/Srp+vUOMW02PyFeq23KKYrsxdTLle8XGQSVuuHz7RSgWf6dxQWJ7
         Wtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539798; x=1764144598;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiIFVMX2MR+XXmvXnG9d1/8nmYiayzPl3ENasC1cOTY=;
        b=wflHhQMKOZ+nv4bIBQ7uYHks/olUEGanIbx29YN3l07gF1bKo80++wz2OGxZijGxMv
         GvwkgFOD7nfJltZZvKRj3UxHrQeLjRCabkWda36XMzOmLDldP1lolRDoOrnHIF6sscvD
         6LeFtzTObvvXAQ+M820RHuZhbmIpprjm62Bj+JWNJwyzVlyPaArfbV7sCG2CxvObCisv
         62hwLtN3v1DkqbQ0C5th3vylp2f06sRX/x6YnDaeoR2h/+FphUopMxvvEFVv2L4ROI1M
         jHoNVmhUjjMaOA+depVo3umBKZJxK2U6+0bAn2CqyvK+76I2BBotZbvIPN30um1h3qGg
         HlaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCnB6yEl6h9iy7JSj5cUUAh/2P50TFDmGqj7rDNYHcR/DJcy1RKzzXiymZQ3e4fWtX4FyDQz9wvg0png==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEpTtGDxfsSQkmck8uTRprR8shp/B0hvIRj5d6yZwjf5woqLd
	bBMQxOZ7rY4dpF4a3DOLyf5NgYALHd5n1ZJs6vW3WGUosvphelUS31uxp+17ceiAIho=
X-Gm-Gg: ASbGncv4niBWdgVl1FbQSJoNHmKCMuAvAHGOAqWX+YyduqXys/ELipJC+x7XxFWagov
	gpQWE/0vUQSLCp8xz5O5j+7n9x8OOBgJGI3xcPwdzo82aBZDt6lsaH8c+LeYAmhU8cRjhJGuCpT
	E3oA2pmYfmmKdi5xhty+VOTTRxgwVtFIkgNH+CJ2cQvk34t5NzB6a8igqJ+cuXgdde7cQBIcfqf
	51cc7wa3AQvmUqBH8tFQSetvumErV5kVuaS/Ol07T6pk/N4/If23KtgRnRLH5xICuAuEAr8xoeu
	jH8smialG0U90+yScohGOe9rAgNP/K5gfnxmL9eJO3OXllqQ5JwrFDImx+4R9l3dz/BfTUU7Czu
	eGs0T2r1BYSqnSysAcGgj9/70mGGJ2vZy1Vj6hvj3NtnA7co0AVopPFJ8H8hJV7kncPw33tihYk
	zAkTn8T4+WQzyae/xrK4uP0pBKqEI=
X-Google-Smtp-Source: AGHT+IE1q82L18y3VRPhHfEId7f170t/V5fSl9Cnt7w8NWmAat0eSm35Q1/LPz22OoVfb8I/7QAR9w==
X-Received: by 2002:a05:6000:4383:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42b59345301mr16798960f8f.23.1763539798470;
        Wed, 19 Nov 2025 00:09:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f0b60csm35501317f8f.22.2025.11.19.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:09:58 -0800 (PST)
Date: Wed, 19 Nov 2025 11:09:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: rockchip: rkcif: fix off by one bugs
Message-ID: <aR17UkYsfAxCZ4fe@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Change these comparisons from > vs >= to avoid accessing one element
beyond the end of the arrays.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 1b81bcc067ef..a933df682acc 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
 
 	block = interface->index - RKCIF_MIPI_BASE;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
@@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
 	block = stream->interface->index - RKCIF_MIPI_BASE;
 	id = stream->id;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(id >= RKCIF_ID_MAX) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_ID_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
-- 
2.51.0


