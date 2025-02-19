Return-Path: <linux-media+bounces-26376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0359AA3C0A9
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EEA3177B31
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F413F1F3D56;
	Wed, 19 Feb 2025 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xdi1nL/R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71971F3B97;
	Wed, 19 Feb 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972994; cv=none; b=SE/oPdT+LzfrCX/zYx/xdRf7ErltZhzBgXoI5xHVi5gonl++4KGb9TcF9I87bumggoxiBuHyJHWkRWsrJPvDDHUg6ID/Kik4vIDzk9JWqjWCfji6LaZTjzTNFsgn61TO4VZjw44zaRSLll6chd5zDhA9tb7iNy185D1gV88Ew4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972994; c=relaxed/simple;
	bh=AZEcPeUrIUmHg/tQUpkh5f/1BH5qdAk4lHVIl65W08U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTDq3ohO0Dz4oHC3B6cNYAVW9vNgkwGBXNDQgrMCWxhmmGyB1T1kmQT4Q6xyJLjAgR+hnQ9U/WablLoaf2J82zYtrXLarmIqR/zK2xThck7WNLjS22a99BFL1txK2sC8LHxXzcHZ0RjchiN04/Pf2v0Nh+h9n/voKtGOwUb58C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xdi1nL/R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4001ABEB;
	Wed, 19 Feb 2025 14:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972903;
	bh=AZEcPeUrIUmHg/tQUpkh5f/1BH5qdAk4lHVIl65W08U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xdi1nL/RKSEk/nqqim4wRzrgugPadkCJ+Mcbn4tOVDIrvMQvUW2o2KiFKnN/zRbmn
	 mRzoTfpyOWgU5QFtKC8Ed+njbLkzlisCdD2GyO4Wejjt/svfGT3zzbdm1zTswgbdCP
	 GSPHuvWctcJTT7y028lbH2+pFpU2Z4C89Tt2BKrU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:48:58 +0200
Subject: [PATCH 04/18] media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-4-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=AZEcPeUrIUmHg/tQUpkh5f/1BH5qdAk4lHVIl65W08U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFxAFlpn2XnBz6BFA1jJX6MMP+JSvTLFATK8
 hbkY9D0X2iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcQAKCRD6PaqMvJYe
 9RgqEACmisnqpyHDD1GuGBYkPApeLbk4xuVfsQRA3kMj5HtSjw/7LywTOWqiXFhlYngiCKbrnSx
 LH4YelT+XCJMRl5jytMRKgDTC1jgeyM2IvleEeCLJt3p0ebNMX8pBwl+Ae8XnlQfurLZ6TXm86K
 TYI0XQsoscVtvEkl4NtIvNgy2HwxoAbUACJIKxUesEgQtHCXUDMAFqkXW8qPcKihC8YkJADXEZg
 bKci2oQwzI0svlSkXI07VJ1cBLulRDLddbHWX+CbHkxCuwvIhedQnDhn/cywTmUng0ym0U6Z5DR
 oMqeGj+50aD07huaKI7o4t8WyLCayp62roiP6v2ADTmlpFwXvywOD4Ql/4v/850IsEPSRIA3MEf
 OPvAyS6bnRuY/TghJHZ/VIGleZcuE6Vw5p8X4jOprA6EtrbsedFeoFHjbQmQZEkC+csXIY/q0Qu
 BPn+PsdV17uMJNGuV+NkqStsIiTRd2FoLiNEBpmW2iEtVRTP+XwEDqBeLt3gUBNZ6+pCVSHA2u6
 jezS1FXEaWNr2gOKjmz0XmZ+Yx9NQu8rFHj8ZQszCEAJGAAbDza5s6beeF6Fa3Dw2rjswM0KyZl
 PsUSVQQdMWB47aMq1anTbXjCQ172pE7usp5WexQl9qr3Fy/zBHgZ5fPvMYkKvxiIBbb1CV63NMr
 EaBm2nxfrp0TOBg==
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


