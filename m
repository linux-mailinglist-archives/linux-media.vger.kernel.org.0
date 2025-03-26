Return-Path: <linux-media+bounces-28769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5FA71555
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C29E3BA76A
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034D71DE3B5;
	Wed, 26 Mar 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gKQWig5v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09671DB34C;
	Wed, 26 Mar 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987426; cv=none; b=p8kSuB/V8XIaPHC5TZzfA86WWHdwcaq2bpSqR6YZrCtF+vgrTP8uxd+Jft72+CbnGQEjJYVm4MMb89Sl+4oabeEb5QFxx9qo1KfY8skPNGqIQvuOjmul3oQN7AHhyKlX1L1SGrOoXoUBeCb8dcHbQCKKYygEMfvPt3GU0bJe/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987426; c=relaxed/simple;
	bh=AZEcPeUrIUmHg/tQUpkh5f/1BH5qdAk4lHVIl65W08U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fybR6gFq65JD1GnpJBYJIXIbkMwm+iMI89zRh+ymrA/s1WFey50dpbhv4wewTzFwndQ1kAenYvGjZxBXhBC/kmgOr09UkthkceBE8C/xaIrjNmU+Mw59CQinhVRcTa4xUZ/WJEPnSD0X1ubOONMtHxfzPoL+Zv9wY4yxCg233u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gKQWig5v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 572CDA57;
	Wed, 26 Mar 2025 12:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987307;
	bh=AZEcPeUrIUmHg/tQUpkh5f/1BH5qdAk4lHVIl65W08U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gKQWig5vupRxJAmrOdQxtbDu4Qbv2GIGOJXFoZWMib+la4UGoGbhkSxt4eCEoOU+j
	 Y1rgMr9Qh8RBLd8yM23Ak/9avHxx+suaPJqQ5S9YCw9In9Hid45l4Yc6vWvnM1NEio
	 TRMPOF4BqeqHXWJBgd9mPPu94gFN+qx+qZHNVDv4=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:24 +0200
Subject: [PATCH v2 02/15] media: rcar-isp: Improve
 ISPPROCMODE_DT_PROC_MODE_VC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-2-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=AZEcPeUrIUmHg/tQUpkh5f/1BH5qdAk4lHVIl65W08U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CQtYt9waA/hIz2WDYUD2DU1N3Lzm8gXnq2U
 MaP4rsscGOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkAAKCRD6PaqMvJYe
 9Xx/D/9LGpo0IctYLv/8rrz5/qbnGhl20EJSwumV4ME0LLsyA6VgDrTBVLcG1LXmIRsZXvqEdma
 HGSxRsz55Kko2OntqKL7/AjejJu6RgqN4poteW4dlQEvlTLoCrzPcFRc6osTG59nu84LDQp38cI
 wvsygS0BKnGkKAVOn/BGAnEmigOzWvyukILtLKBaW06sifBwsAWm58nANR9atK8psOY2R0qNmsC
 EQSIx9lp+1BB47dxBKcsRYFQM472kNV0BWhDLpfOvfeUdz9iGqCx9BOlmcvrgf0jsF3UCTCEOcp
 YsoBhBPhhZdUoxV9GfAiI8t+APYMaHtv5Swbf9LyWk0i4AT/Oi4XoEVKhefl/DjkaetEnv5LfPe
 UVU4SV5UdIe5LCZ4Cpdu6MPFjyKJHFB4314BUL9iBbjO8xYJoxdednIx/z6QOREFNHS1Fg+/phq
 SpxsTNKZ7VtHP5XVKWg8LaH1mnhggglLEW0myVLr6747FIdOOkgY/8VwXprXI3r3udTeJfhzjgr
 QdiiFS94EJuleHBAT2eOwvQfYOyQnkC1GyoeCH2Etlnd4HHfcSnw8Mb8G4v/h6kRYPCgq4amWF/
 2dF1WSsZf5w7aNrv/nDPBgQ6ZrSx/a9vwmsm8YZnM8nGLEARZKB/82qeHsg6zz71ILtUFI0HwZu
 H7kTCWYS62OhuEw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of having four macros for ISPPROCMODE_DT_PROC_MODE_VC[0123](pm),
have just one ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 4bc89d4757fa..46534a479201 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
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
 	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
-		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
+		   ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
+		   ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
+		   ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
+		   ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
 
 	/* Start ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0


