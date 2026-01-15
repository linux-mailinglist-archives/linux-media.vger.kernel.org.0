Return-Path: <linux-media+bounces-50761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB8D23D31
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0C51301FD9A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA14E35FF66;
	Thu, 15 Jan 2026 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B9hySAMt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F6E324B19;
	Thu, 15 Jan 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471729; cv=none; b=UoLQK1XFDwszhYfqX6jK2innnVgfRlxdY6Leew+p1DI8Q7s0tGd77ec2VQX7fktuizBIUYnRlIK5NAgAOZYPQwwr/ndw5R6zeCmetz01+XQcWV23oGrPPd8sfMQ+/fsG+l3Yu0Nv6DFXLHN+2fz/YpZyq5PvyZED5BYO7cpaEKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471729; c=relaxed/simple;
	bh=boadNYZb3yTQIm8omxMbxPhFmxl7jhq903UbqxYtuoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZBMl0xZFjknsCfxyOUTuGgU65QqVpUwVSPzsGb2Kg/2bo4rwcnQG7R4j3zxNkYUW+4jJVPoiofofLphVGXxH/4LVHEbMHLbMKFsx7ED+FVxPXTv3LVHaGhdmsLqJbxkHkjl7OVBIOIJz6UkmCdGdJFFl382geBzXy2d4yw9XTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B9hySAMt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7805B766;
	Thu, 15 Jan 2026 11:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768471698;
	bh=boadNYZb3yTQIm8omxMbxPhFmxl7jhq903UbqxYtuoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B9hySAMtIv4KKxTdaoxOLOfEBR0O6Z7CtM2lKbyhZsK76v1EILj/vVP4MaXy3R9ty
	 VDWPnLlmi95sLW638yK1LD/RDI8NZJS4liAIW8zYdhEkwni5JKwpDvzuGsCqTuxcsa
	 Qm2/K5+yfq6cLHxfPNbunNW7k0hdCSrSo7OgGhZc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 15 Jan 2026 12:06:57 +0200
Subject: [PATCH 1/5] media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260115-rcar-streams-prep-1-v1-1-f87700926c11@ideasonboard.com>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
In-Reply-To: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=boadNYZb3yTQIm8omxMbxPhFmxl7jhq903UbqxYtuoE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLyphbIBCKgAZTX3Atluvoq3hRCuDCc+LWijH
 aODCqPW35+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWi8qQAKCRD6PaqMvJYe
 9QQBD/4p6xbNc+mV5aBjbZlUXiriw/ohMFVrXNGVnYqNpfgHEmQ6PpF7x2Dj3HpYHuF+oG9KMH+
 MOD4Snztm1YtEZCYGo3d5rjqijrixCEG28kXWsOX7DR4HPKEKh60w/MU0YN+L2pC+6iq2fwpEpt
 B1d0eVIx2SzxeBqex6Y1Aqa2J1fR0jEUoLyhOxQ4Tic/VLTG453/a+P/IH+l5iC3freMthBscvZ
 hEZ3mUexJ7OgEkrVCzu+hOO115eriGsr9TDKhcqqnZV7lJruXz2O+1cJEbjEiBIvEvBun8e0Fmc
 eKISneWgp2JTN+FwMYL1/3DGPbCexkLeFeOV4Paf1cWqW7QcvgPNCIdxTd64J8+W/aaxTXPd+kN
 RZ3nFyyuDi2rx9eq92I2pfCv7F1npFflV8BqzIFH8vSUrvAKJb2EhRgj4GmOdFSBHYZvcS0FeyK
 Lk/llT7RvNNMgLesLfSBnjk/0nnJz8DFHOxjDTy6xc1npn6dJw9h7K4GZ8v74T0AVx4AUNdrMO5
 jfSB8hBEoLwPU4A0auOOrHCbTHB9vAgSOpRoiffrmG//dUVyjK5dujU2o4aWyRrXqeDeDRCQ05R
 wbezqtDWLM9LOtU0BDyqTrPr+CgCb/ZEL04oVttC3oloCe/zVq8asR9FFhSARQy33lnrzZBIgEu
 NjlGMrKvMcMuhPg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of having four macros for ISPPROCMODE_DT_PROC_MODE_VC[0123](pm),
have just one ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 1eb29a0b774a..8fb2cc3b5650 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -28,10 +28,7 @@
 #define ISPSTART_STOP					0x0000
 
 #define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * (n)))
-#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
-#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
-#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
-#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
+#define ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm)		(((pm) & 0x3f) << (8 * (vc)))
 
 #define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * (n)))
 
@@ -263,10 +260,10 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 
 	/* Setup processing method. */
 	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
-		      ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
+		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
+		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
+		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
+		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
 
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0


