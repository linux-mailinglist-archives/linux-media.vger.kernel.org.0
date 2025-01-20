Return-Path: <linux-media+bounces-24961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1631A16D0B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C5323A2808
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19A31E1A18;
	Mon, 20 Jan 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="voAUOhDo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C31BEF87;
	Mon, 20 Jan 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378695; cv=none; b=lHBGmy5aYkpjMQkdSQaCBfvxvE+UEWMiqXVpuAG71wRQSBHDot86ZzBxu20n6iaSYNdPiSYKijO30XB2W7eQq5NlJNQ5piSWWu9dSetCT/Q/Ob9lN80DLSRkegauXrD0OZBspH2iQgOa/csx86Hfuxn/1GBmTcJd5H0pGi8tHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378695; c=relaxed/simple;
	bh=rS3t3u+oSZ/MP7QaYQqmyDuShbf4qPxbxmv6v/KRmXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWzHlmPcQV9oKhlp2aVHT8uCnoQcnO1T8b7B0FSmKXZNg6cDXciUB8qpFGBVgCWfsdKmnVNWjYQcOwoV3NvPo0hzerNqif5580ahCzvo40t/JKf9DEuYRCUlTeisYbSpBqXnXc/SdpYGb6Cj85bgA5RjVIj6O5B8TmnRQ2ZJOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=voAUOhDo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29CFECDB;
	Mon, 20 Jan 2025 14:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378623;
	bh=rS3t3u+oSZ/MP7QaYQqmyDuShbf4qPxbxmv6v/KRmXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=voAUOhDoTq2rJcSeOuqGaeuuCdotqzKm8B7NE3DnKJlqeRppEpLSikxv9K8tIE4X6
	 eGNGVlKXCY0CQRsFZIY+U+QF3sx59H61pu/5QY2GatiztgFw798qcZsZxgAY189//y
	 YO6ljNSAuuC3UtI9yTttxxTShSqI3Ree/C8G0QIw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:34 +0200
Subject: [PATCH 01/10] media: rcar-csi2: Move Y8 entry to a better place
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-1-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=rS3t3u+oSZ/MP7QaYQqmyDuShbf4qPxbxmv6v/KRmXs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt3ME1QGfCLjsPGSrcSz5B5KmAljsY5ly9lf
 nrD1z4+BuOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LdwAKCRD6PaqMvJYe
 9QyhD/oCxgITXFlv2vrxfeu5xMdU054jg4mIlq3TOgqrJm8lazK8gzq7Ivbshs92ImdgxnVA8nD
 6914lI0vh3GIbrva+5nwzs3prhvN+3a+6WWqQOKWhH1sPzuJOaCn2FDLt4IdXx73dDTzqKgN/tu
 9biRB0MC/BHIp6w0y8+Aucw3qH/VQd7+JRsPG+fzAh5SQsCn/fhkKRkYQt1aWAyMeNW/gQd2UVl
 tXHYi2oYrQbPlSsKenwG73bg/oOW1PyccGAYjwgBs2eBfhuyQy3YrKoqhp7jic1jkUo8hxwsAMa
 ir6VLmh/es5i3xUwXvBUETm/0/k6EuJ16mB7b4J/5TjnMInsQOwI5OxhrvCmkHV1qYrJJWznNFy
 JFh82eJdtXuy2WDgGe6o3yv6dc9j5mcfcQI6lRNVa0fm8ZC5Qo7wRFqqTwD5on0neCGokMu5e3I
 zdVxrPq4sKAzNedzrjQvj4fWosZl9Vjtw1Aw0A4UG28oWhL66VX/z5yIl4UTArJLvlmVrLDOtxU
 yfLWXMPQCiR/tMNirPMt2HmPiM0AmK8u5+ZL3/1S5H0CozbnuSPMuEJXWvaInCUWGAv6ux8rKRt
 IJ4dVsWlZ1SMuwZPp7TQKzwnD7dMWYuBduLkQIJqygHNZ3YoGox81MCfrKF2aBzItISXTuiD+Ke
 eHrzNvFCKvHKCoQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the Y8 entry before Y10, so that the entries are in a bit more
logical order.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 0a53dd47d7bf..be930ebca3f5 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -636,6 +636,10 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 		.code = MEDIA_BUS_FMT_YUYV10_2X10,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.bpp = 20,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
 		.datatype = MIPI_CSI2_DT_RAW10,
@@ -656,10 +660,6 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.bpp = 8,
-	}, {
-		.code = MEDIA_BUS_FMT_Y8_1X8,
-		.datatype = MIPI_CSI2_DT_RAW8,
-		.bpp = 8,
 	},
 };
 

-- 
2.43.0


