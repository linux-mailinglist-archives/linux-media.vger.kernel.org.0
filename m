Return-Path: <linux-media+bounces-24962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B7A16D0E
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D7C18863E7
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90D11E25FC;
	Mon, 20 Jan 2025 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jm9TUkG2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555A1E1C3B;
	Mon, 20 Jan 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378698; cv=none; b=rIjCCDDVhuV+iYq1mKPN+Ro5hzTAMjJd6noL3Vx227xaFWXHTlhj85iAJC2Zy+GOG5q6wYAmnPG/UVbOnneSkYUgKlqxx25z6phAq+fab+JiJJJGPTU4iOSTCtrQ3JqFcRNzsTRuyRJeyhLrfwXX5b2b8D4y94RP0+Ze/EF7c4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378698; c=relaxed/simple;
	bh=Z8jlw8ElRA4Rtp59zIGgryH8jHparWgwOJ0ZRvrMmOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAB962tiyCmdfneuYKH6QDQSmgKdk69+MpZpK3T+0LN26qqVGfTg1bpJrhdR6sRp484o3hx+AHDB1CHqBUUUwI5qBZCJLt+7m+u9jwW5Xq7CDpdNjrerBQAU7EgqwoktCka5fEOnkCMhTCO3dOOji4+hb2SFRIFVJS3uipMjYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jm9TUkG2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 275E61193;
	Mon, 20 Jan 2025 14:10:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378624;
	bh=Z8jlw8ElRA4Rtp59zIGgryH8jHparWgwOJ0ZRvrMmOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jm9TUkG27OvnDvZLRMCmsbK56QD+MNpqVb3A+ypU6dmoLOKwF699dHG/BhWKhqkUM
	 et6QjzRNxBZ8vHdbe24HXYwy5gDFiTKQ0Gvjz7hXjkWaOOa6nuu/pRHvMWHFWYuMVs
	 bgj/AyD1gR62We6DtINOQwjELmRturGG5cqbJBT8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:36 +0200
Subject: [PATCH 03/10] media: rcar-isp: Add RAW8, RAW10 and RAW12 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-3-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Z8jlw8ElRA4Rtp59zIGgryH8jHparWgwOJ0ZRvrMmOU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt4QE/p03oaJhdkpmJRZJzrYp4WQUP5QYKT+
 IwVdta5YYyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LeAAKCRD6PaqMvJYe
 9RPpEACmQBIpe2mu15JfULnnkTEdVO9zEYxcs35k9xLs/z2YR6h6tX5tWbJ5VobUfmzzU0vq2r9
 U0GRfYlviYWI1POI/Zqe/rSHPjakp8XUr1lxDQJHwLX/XChiqPfVaO/fXV5HX3aqm841vVpkyJq
 +Oi1VwwE+jxzijzSb7xsc1RvG/2TT6/7z4uFl5oy+4vPFZU+rhqZKiJsVljtUsTo8dCbxnw292+
 XU+D7RNafh7CT+P11NJnzn4gyM4neGRUQ0xgXk8DmIQeMSmTFhzRclZrjkXdpPu5i/0WM+rOw5I
 /rWJ8hRjBGy4UNpPlxazje4ZZsIsfwRMlAQE0tbWk9BadyeJKmYZqNSICby6YWFwbXrQ7KpdYZq
 0YdacNW7yFrEGsRXi5i5NusU7LcTnwNW+PJN8OrFcL/0NDiMgVEQsLBizwaJRCvN2GcGfs+vCkb
 lJa4j9u38YoiOwpvxthj0JpnoFeiYaq7hvCQk9nyqRoUA62e8BKZ4Z5uEm0m8JG1M54bG93GtmI
 OdsOkCHXYIEVBpEHWku03WgBfd4HRHT7ZgO5VjVWjIZWNZ7J4VYWTZaQAG7fFk89TvOuARwdXQ2
 Kqp1mB9mk9dUqPeR7Hji1Grbb79UT0ymmwfPGFmmgkX38F0Y1//OI6uxbYRDn5LqLImXAvC15h0
 iZUDCBcsA9xpLzQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add RAW8, RAW10 and RAW12 formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index c515278e3be5..121fa7524ee1 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -76,6 +76,54 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
 		.code = MEDIA_BUS_FMT_YUYV10_2X10,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.procmode = 0x0c,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.procmode = 0x00,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.procmode = 0x00,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.procmode = 0x00,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.procmode = 0x00,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.procmode = 0x01,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.procmode = 0x01,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.procmode = 0x01,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.procmode = 0x01,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.procmode = 0x02,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.procmode = 0x02,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.procmode = 0x02,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.procmode = 0x02,
 	},
 };
 

-- 
2.43.0


