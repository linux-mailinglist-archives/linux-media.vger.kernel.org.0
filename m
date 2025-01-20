Return-Path: <linux-media+bounces-24963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFAA16D14
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEAF17A4281
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D109B1E25FF;
	Mon, 20 Jan 2025 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JmHr6NGG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55BB1E2007;
	Mon, 20 Jan 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378698; cv=none; b=IjwmsJoZH/nhwO0WqYHZQ9vz+DNzjCo30GarLy/1/YiSKPPrX19AdxcKUtWL5u5241ujCKtc37XrLIMsvMWzenKVGmARiOTh4jOMFAGjYFBMyYnujL/KYW1g+RnyAnFIcWDygWIoJ3BU5Grwr0S1yepYSnmPBh/Ma/M1yKomNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378698; c=relaxed/simple;
	bh=6NA5qbjrGQlNxg6LJ+6qAnM81wKg/Bz2pui0ogtvTu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMEKebydZsYK1CMrRDM+hoXKnHPL+3CIlQYgVpkJsg+UB9vu4x1SyqZJ8TnSzoLY0akepz33iO+4DLT/eMvPn48wv7CAadMVQjXJTB8lar9YKG9VaudRmZ3hHbeLjefj7GG9zJmTJB9PT2s2i8U5ONc9CknvWL5OHtXhUylVV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JmHr6NGG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3E2FF0C;
	Mon, 20 Jan 2025 14:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378624;
	bh=6NA5qbjrGQlNxg6LJ+6qAnM81wKg/Bz2pui0ogtvTu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JmHr6NGGcn9tSgENgkYpob69Gh10cfVJGUsjrzEiG0c00uuAOGxfwy1MPZ5deC+R8
	 CrVHXByF4FAu7tnB2X7etq8aAdnoFVp95mVIWhPzbCaGYmUdFCkxCbELpbgRgw60kM
	 0tCkj0CTOD8d/lZD7exllJDYdMHejsRcyeIb5m0A=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:35 +0200
Subject: [PATCH 02/10] media: rcar-csi2: Add RAW10 and RAW12 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-2-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=6NA5qbjrGQlNxg6LJ+6qAnM81wKg/Bz2pui0ogtvTu0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt43IltdF5yH2qnv4mSX2TERQVOeITuxWQTS
 WZF/K0OEsiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LeAAKCRD6PaqMvJYe
 9WQbD/9uRZrKIxe/2Lwnkx20eWAi29KELCZ47Bm3NRa7y0MDd21mbO1NFXC1x8DmGItMdBfzSw2
 hKM55zkxzoSKiio4sqx3Zk3JzyPkqCOc7QjjbtNkDkvWbhzBkYNHn6u3AxePH9NHjRfnJVMrnjV
 P+64+gGyW3ywjF3zBgPtXwWMuJzzLVD1GRFZVPE+VJe3izAKZaqcQAcQ0BY+ZzQ+cLt/d8gfXAy
 ClXQjOH+cbt0ZaSIQ0N2/GIQf7LJ6X5BVgQRcSdl3RPgQOfwl29I8XOOQ4ZgCH6L709hgGTF+w9
 7YjZ+MLG9S9MkJVOMdt0pN6e1bYaHAadGfoGCyzqZ5IG6RiySBERhLqGWWSNsJAK4RKovGxB/0k
 x4x6Ojw4BsBhDItJwqKB0OPVBFTBHenVDM92rSPsPHnba6tolVyKg08mfgFGfoqLugUBCSMsrIp
 01YdQxqAq2mHok7t2/AwfkVWQcQMKTIZth2AVj6W87Vuy1vRJqt1yRw5XrGZ6uDBboMa492SNRW
 N/d8OC20XyTufy6pba0DAYQoiXabcJxymjdTqFx5SWz0rEbJ9gTiHSw8K4tsPkQVQwTvlShebL4
 U3PU30Cc3f08hu5J/nhBKdhvv4+ulUH2Gx7Lx8JClJxMktDSc0f63EJPZWMYgRVmpvMkz1608ey
 iVfiEnW0ZHq1Oow==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add RAW10 and RAW12 formats. We only need to add the entries to the
rcar_csi2_format list.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index be930ebca3f5..52d4e333c735 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -660,6 +660,38 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.bpp = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.bpp = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.bpp = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.bpp = 10,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.bpp = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.bpp = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.bpp = 12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.bpp = 12,
 	},
 };
 

-- 
2.43.0


