Return-Path: <linux-media+bounces-48895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFACC3F21
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C99D308C49F
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555B432D0FE;
	Tue, 16 Dec 2025 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c/9CocAz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52C724679C;
	Tue, 16 Dec 2025 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898352; cv=none; b=fj1XpqXrTpe2nz+4a1xYZj+tvgBFmTshVpongquTr49zlG7i7VLguDKwV7llixoRkAGSBHnPkw/IAvbA2eNzI9whnX90+pimsps8UuBky5qxROqcVw4RcGXGevV0g/Hjb8JKG1Sg0gnIVoQ4/gH9kpp9Y+NpFJ8E0iiJBucvMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898352; c=relaxed/simple;
	bh=boadNYZb3yTQIm8omxMbxPhFmxl7jhq903UbqxYtuoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7bTZ4LPDmCMMTc1JnWPBklRSOwWyf67gFtWDtHnGLglxVGDY+ha3pKAgFHv/C/Z9fCJwGbRIDoqRtu8YYDLdhddQB/Y8LoplZPZ81T9/L4IVrUUCgSZrF9XRoKkrR56QSEBgPeO8VzgeqFEL3nPl/l9ms6Mche2N+mf6plOoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c/9CocAz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65EA4594;
	Tue, 16 Dec 2025 16:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898341;
	bh=boadNYZb3yTQIm8omxMbxPhFmxl7jhq903UbqxYtuoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c/9CocAzzAAlvE1Pq5YYuI+MDQ/ga0qYhTN7u+qyDkv9EwrhUc49W4AaefvBujOI1
	 +u1LTyL6Fl5vjmz8fo8OPyuAQwsVTP70Sbf5gfsN834Zs87HTDxWZlVqtrKbW8OUQs
	 u0LMOTsaQTOvcGrxWz5XFwJNyNVbQnTIVD1Dnm/E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:18 +0200
Subject: [PATCH v4 01/15] media: rcar-isp: Improve
 ISPPROCMODE_DT_PROC_MODE_VC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251216-rcar-streams-v4-1-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=boadNYZb3yTQIm8omxMbxPhFmxl7jhq903UbqxYtuoE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhjuzEgoV2Ps4Qi8qd0Yhq3503I8oqVaXDX6
 NAUjVjEzJqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4YwAKCRD6PaqMvJYe
 9V9vEACsQBgz2bH6zEw4jufSxcpRLWz78y7YiizORlamjAGJi4qk5F/7xzj4Tpl9ngr1buIIrAM
 eqNsoyj5myTrwpKqQVCdFcTsE4wFzKcaSbf/0Nx3xR8RD1YpMxvmvrIcsSuaSbIYXtnvPAdB5q1
 WWht2/DPEImirlBkgDUpNlKrcl0e4x+R5MZDFq7uV33ieGZH+8DoG0MwxpuuEWAvrOpTBOdE9Y4
 EHMBed2erpNlT2sdG6y9c5eFu2/aDQpdRLfb4mjYwi/BJLxQQVimCR1CqmkfYqF9UNvYDXClqWp
 qVbtfS4ZEfAVj7F5p75k5oGL/Q06lHprqCW8SokjfL6pypJqUqfvLkH/T4SUDrzyicxFkeC+GgS
 3RyyDiV9o85Tzow1QRMroC8PYlB5O+NlZ2fTlinodjubWQEuqND1zi+HSK+kf7fUg53XNiCTlv4
 NNpDcWw2+SUeHKkoi18Q1k/koP8V+ZwcerxIXg7Jo5X85r4ic8ewy2Zd67j6tfCsHzmdtwGriwo
 0xeV8j11P3lPZQUNBqBfrwhiMIWHPlMjujHYdutI5W9DcbeGenl7N6lu9Q1gZEOSf8a6HbYsAyv
 7KDhtBDV39GmEvuMkVkLbegQkMSKEG9SUH/JYnBLd4F0N7734cj4+e+KYN7fZLZdfq8mxrnq7I1
 J3umECIblKEQ3qw==
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


