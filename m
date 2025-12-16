Return-Path: <linux-media+bounces-48896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5615CC3F0C
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C91E3039903
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A1033D516;
	Tue, 16 Dec 2025 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tGDs0Huj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157C33A9E4;
	Tue, 16 Dec 2025 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898355; cv=none; b=Yj3JIunQbYvQu8OHXygyZCx2cGV5E9r+5JiWCHBby5RPYIdyjC2Pg8jJZ9JkQvuX9CIAX688adLs8MjMeUQ8i+5QVXs8vvyLeuPfC8hcrG4cNs4DYqN5a0eHo4uYaP3xHNvBeqBiZ4IqvSHp5i4DczZzhkXPrYPtyNpxVMFarWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898355; c=relaxed/simple;
	bh=utOQf1vMGqA6bTOF25Nkik7nQcx6ZmtvMsBSPMxIR6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFqa3LX52copqjQpWhyMMewWkfea0BiL2TjB/OjPUK/kkLzo8dkwVAiDyiODPFipZ44GnbXv4eL/x/KlE13FGLUtjalERSNin/0Dek2qznrujNrwqElLhS6duGgw5ltEqI1r1FJm2jyunaSSALQv92vFBmBbll1c5/dRJMkgX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tGDs0Huj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C7101039;
	Tue, 16 Dec 2025 16:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898341;
	bh=utOQf1vMGqA6bTOF25Nkik7nQcx6ZmtvMsBSPMxIR6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tGDs0HujKWNO3IRNDcXYzEuPGxTTkDPK45rHMjDYVIDK3CbyABJGuG2V97OAeTT+0
	 MHrqJR4AZ7vHSGxGmMlljtLA0/+sSQv7a9aIXrHHvN13yi6ZSbzagGa7Pm0tYRM5PB
	 XyiPAYUTMJva45XAy77s1kJj6yY7IXs/CKlgmm2I=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:19 +0200
Subject: [PATCH v4 02/15] media: rcar-csi2: Improve FLD_FLD_EN macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-2-f28b4831cc67@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=utOQf1vMGqA6bTOF25Nkik7nQcx6ZmtvMsBSPMxIR6s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhjuSn6yP6K6eKhvJ6TVFaKeH1erabaEWyro
 Av9IeFblEuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4YwAKCRD6PaqMvJYe
 9XdzD/9LBDD8jvQtkKnNitUoh8UbDUF2b9IR7W7KpnED+tyUlVLIZ99n8lmkV2gBI+fNSecb2TD
 u9J4feYLnuJ2tFO9bVe1nUX7R1o55TA2d5pMLW6ogW2Rv6cJeGK2n+O8Z7vyMJAXBESkBz2Ip35
 1Ai+6Q3z8434ZVM+9dqfAT+kbHnLUcotlUktGQygWpnZBxY8vTDhWTisWFI+igJdpZplZoTs8Qg
 wvDfj2blQdUvPEaseA08ZXWdWetVtF0DKHwnjPitFLmLUt1HlwQZdS8MWk0/lvoTeb4poH9l2Aw
 w/pMwf8D9YmovxVRjuabVulA9zSuu+Xn1PPz+Zr5BTwog2sePfPhmllz+XNx5vFwk367Rv1aqhB
 OIeJvkmeIQ6M1c3zL7NpqnB5jEh+nML+UAHt/UxK0J1fG4Izuj09MxDpg6EzRxylcsEKlNz3a9i
 xZqg06GbNgM3SlFbP9UsnjQmlmTUD+MD0wcdlFyicE/S76WH7T1AZKmQhzSbi58ew/DqnI1aWSI
 gKDrQPZIGj23zNwHfUC1jlqFsRcIx3NlvQVw7VMSfKbrDNehAHY2EBx8WDQqbSVtcfH0NOAaErv
 jZBcmxsSUwK3dDQQ/YV/mUpxMFdGgbPRxNaoJQEG2BDtaQmdro9q1aWIGOWWrn1HCuMtRBrk1DS
 n4yl2hQ1HJcipsw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of having four macros for FLD_FLD_EN for different channels,
have just one FLD_FLD_EN(ch).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index d1b31ab8b8c4..3cd35adb6803 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -71,10 +71,7 @@ struct rcar_csi2;
 #define FLD_REG				0x1c
 #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
 #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
-#define FLD_FLD_EN4			BIT(3)
-#define FLD_FLD_EN3			BIT(2)
-#define FLD_FLD_EN2			BIT(1)
-#define FLD_FLD_EN			BIT(0)
+#define FLD_FLD_EN(ch)			BIT(ch)
 
 /* Automatic Standby Control */
 #define ASTBY_REG			0x20
@@ -1082,8 +1079,8 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	}
 
 	if (fmt->field == V4L2_FIELD_ALTERNATE)
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
-			| FLD_FLD_EN;
+		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
+		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus

-- 
2.43.0


