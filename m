Return-Path: <linux-media+bounces-50758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D3D238E2
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BF683026555
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 09:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7A635EDCA;
	Thu, 15 Jan 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wfFyUtTb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B435E53D;
	Thu, 15 Jan 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468977; cv=none; b=STwusleqJYnkNpe61EjYur2glhm+kkb7qoWZj2cxDjGMNq9KPzEwyqNX/fd617yeg5pd9kIgsFYME/AVf1naS/XsK/UleNR6aQF27rGwoV1YGPs+XSj1E1ru4iLT66JVUzTW14tkE9kRSSSQsa3uOkKvwiuZ7Ljeim4j31SCuQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468977; c=relaxed/simple;
	bh=Kb6MvdpTQMwqChm7sjFl5Wmq+d2+V+W0i8ETbwbopBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V1ThDqJjcCEjVf9wX2byJSIzEYE2CLLDAM0QE6pY9aMNdObHJVH7jUXsxUojzX5FZb+YmKWA9NOmpCZ5Ci35x97njwRNz6tbU7Zt68P5A5Z6sXLVGBeTPgwX04tpWMf1EnM+n2Tx+PknVdhs/LFm2QF0yQ7q7yxNFNLjQXJR+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wfFyUtTb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE32F4D3;
	Thu, 15 Jan 2026 10:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768468946;
	bh=Kb6MvdpTQMwqChm7sjFl5Wmq+d2+V+W0i8ETbwbopBg=;
	h=From:Date:Subject:To:Cc:From;
	b=wfFyUtTbje8rHyr0Sd+EUSInIXU/xK+h2lnCFHIdfSJIPuZ5gjXWCYFADGqtcU8th
	 NhKHE+yVNKaZ8SEibCvevb0ZI4Cl0CA5NAwiZisEEEj8PhP2u6VEN80Pt3ENwKkyWO
	 HFsi899PJUwKHPurEdTnXQqaontbC8x/gWrYNiU0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Jan 2026 11:22:35 +0200
Subject: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIANqxaGkC/x2MSQqAMAwAvyI5G2jd9SviodTU5lIlARGKf7d4n
 IGZDErCpLBUGYRuVj5TAVtX4KNLByHvhaExzWCs7VG8E7z1Qi9OIwZ+cNq7abTBhHYmKOElVPQ
 /Xbf3/QBF3nnWZAAAAA==
X-Change-ID: 20260115-rcar-vsp-crash-fix-8d4871f0f39e
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=EmWMaYoiY+Z68hrnNgn30lsDib3rsY8BgXCYwbfPChU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLHpL6xPNm6+thdITf9bLyFVm1ib3MAOKbA61
 7t03Ll+bOuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWix6QAKCRD6PaqMvJYe
 9XHDD/9bPg62MoGMYuz+K1s2u25nThlBtpb29XqTykCfno/euRgAmK9k+t2Amuik2gfh0RGmyfk
 4Rxg+SPc207Hk56Q0a9iHdSn9+c6VOCZe+aNfEdxEpQVSpXv67dhBHYPAQnLMYNDhz11lW/8gm5
 uU5nK3c9K8Uztd0FkSg5e2vkgnbjqd69oS4AlJwt2sZaPC3fO5foRGXc/tYsm22O39sB9MVOwcn
 gqqNvOIPCLIL0CceF1y5JY2OdocpxNs1f/vvdXKQLNf02G6ys2N4lzhuEcVRVnPM+rdDVEc+BIn
 +Fq5LAXfz9o9APYTArNnAiLsAN/wDEdRMELqCpLKmLFs4xuhKlNr52ux272rTDOwZEJookiGQ1J
 55L8VO6Ju8eZo56Cl+euUFYegHSVsJZjP7Euw12Rn2ibYyxvu+69/VcVsrDhEG6Fn8lDDs5cgfo
 ZLg87P4VLRSJm1IXx0BCU/Lt7xxhsfYSYfrr9uG+KZ1zci9ek9lTl/re0pOcSI/+LfNUAzKt/JR
 UmoTkWWxaebW+Lv6OpT6ps3tGKu7iKlVx+pDE7Te0AtT/2b523DH7WgghZ0JsDdikkt3oEANCEM
 Q202vHrweHesmOEEDJjJPLU8FOb7A/89bh+UefzXtbeAqETGbdIfp9CDV3M3j++mGe4F2NCYwKd
 sQpHSUUZhmYbPxQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

When unloading the module on gen 4, we hit a NULL pointer dereference.
This is caused by the cleanup code calling vsp1_drm_cleanup() where it
should be calling vsp1_vspx_cleanup().

Fix this by checking the IP version and calling the drm or vspx function
accordingly, the same way as the init code does.

Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 6c64657fc4f3..30df9b36642d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device *vsp1)
 		media_device_unregister(&vsp1->media_dev);
 	media_device_cleanup(&vsp1->media_dev);
 
-	if (!vsp1->info->uapi)
-		vsp1_drm_cleanup(vsp1);
+	if (!vsp1->info->uapi) {
+		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
+			vsp1_vspx_cleanup(vsp1);
+		else
+			vsp1_drm_cleanup(vsp1);
+	}
 }
 
 static int vsp1_create_entities(struct vsp1_device *vsp1)

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


