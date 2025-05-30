Return-Path: <linux-media+bounces-33669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58A0AC9099
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C6EA265C7
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7587C22D790;
	Fri, 30 May 2025 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="labkmWrC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290622B8AA;
	Fri, 30 May 2025 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613096; cv=none; b=ahMbFL4UcRYO82kJ+l3dSUainLbi7O447DnYm/hCMXvuxdyewNJmzQj3iWgi7j0YUIfLn0Mkom9udGmmqMKV6i/XLtTAGf8uXWDwNZ/uSy/8a9FZuSULteK02HVeYQZVqx+Myj7kCWt0e6YZr+UxZAqbd9i4dzyhtxOp3wc2ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613096; c=relaxed/simple;
	bh=W5HRHl4jSUWe8tPRd6X0mi3ShE7jUg4uJtCo0gCxDmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZXzpIva4ltUuvayS1CljP/bbsKjm+5VhJj4qYnIDMfPsCW8BFaLn25JTWhS4wBcHxSiEa/sA4hQnXjH1qok2PGLAfh0ONS1hmqyP3UBTjnB5wP6gHc58fyREINbjnhp6yfFPz3AQItMuAybE130UIbWk4IID1IzrBBxSUl72LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=labkmWrC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87A32AD0;
	Fri, 30 May 2025 15:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613063;
	bh=W5HRHl4jSUWe8tPRd6X0mi3ShE7jUg4uJtCo0gCxDmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=labkmWrCbC8EIuMdKsi4zJvfOLfxqVwZYxMiOJmCJZ69RFJvieTUd7y4mTdIZCcWe
	 ARSH11i1iTKfThhdtxAuMcXfc86yc0b3ULas5geBprm4htHDodyiNjEt1E3dHRBAbf
	 OCI45XMF+MB4VGSeu7cHXryfNQEEv2inewWuaeUI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:31 +0300
Subject: [PATCH v3 02/15] media: rcar-isp: Improve
 ISPPROCMODE_DT_PROC_MODE_VC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-2-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=W5HRHl4jSUWe8tPRd6X0mi3ShE7jUg4uJtCo0gCxDmM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfbhDpZvOOgIV3faV8KoVitZn7qXkq97nbdz
 QGWqirlshyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm32wAKCRD6PaqMvJYe
 9fg+EACRRuRH7RLaeYlzuqhSYqpTlit94XbM5lEuYo9FtUbAO+qemaFA53T2GtN3uQXSK/IzsE9
 xS608WZV17M6sYpsZO7suIINI00rrljmnBVMkj1M/zftbYiH2BN/l/yjuwu/20SmJl9paOk8GKF
 bzptnwlLFuRIAKkE9C7ASeuGIwi1G/uZn45DEhlb9BLUfQ53kaDheEruDSRw7Ib+E5/GKtvpB3l
 ZcEHE/dDK9gvvhqDe7qVKYEOpZn5bv1rsqEHt/Q59Ho3HdS+Y14SBldoggSPHyCHiZ44A6lHyC5
 bjjnqUmbGFm3WRt5oRRdSI1MxOLJnXT/rZS7xSg+11vGE+g547zGXA2//B9Pt310qdijCJ9QqJh
 VKmpWpUR2jjmwEZ9poiIk7JhLj9MuDwE7h3HS2LPSmDIEDBHAHs01POyoCkZiO6MK/HDfFMpWWx
 vL0K0NpuatFhn4TSNeZCaSar+lF0Nn9ScEJpqHUkkUTy8rE6cSVBl5LyZnWKgnhgGvamCI4nlyP
 oTmkJIxQpslU/Phc0HPM9GOULtmVmyDicaOoOnG6hgfwxIM/+uCFf4Ds8LKrosiqnYzzmhQHEn/
 9znbbeWOCndxFW5DEedYHPXgknOwICe3e6IynQEq5M/cecn5qKqGq5m1yyTg9pr68CKgCOJZ/1c
 UfFTL5hPFMeW1MA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of having four macros for ISPPROCMODE_DT_PROC_MODE_VC[0123](pm),
have just one ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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


