Return-Path: <linux-media+bounces-34902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D9ADB001
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97EAD16BB2E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB14292B51;
	Mon, 16 Jun 2025 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JM2yFd0X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D9F292B3C;
	Mon, 16 Jun 2025 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076096; cv=none; b=MnaP6DY5sBoxnWCVZZKujddzIw7/6Y0CkKENp2CN5k1sHjzJ1cdIBffRGrSmyzLyrBl8gif3LXK2QYEwtkum7Hdc3gPxKNdKdxUw+4iTrjLZp+pMcRom7+KAFdRvCaUTNKMNGjrFBp6Ur8gTCko52hhkmHEaMXCweuY+Z0fjHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076096; c=relaxed/simple;
	bh=gVw/OKVgytey09K87/+5x7WBm97ScRhjXSwCZK25GSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRUV92AOy+1K1NgcQX3bu7Yp9Bb2GrXjBUyyiTiJluYVOzW4uEqfNHmbPt9JpHA7FzdClAbDhM8OfaxqHJeYPOrTCMWVXXIh9kI/lCJMY7edmp1rKMztltSQ8Pt3iXP8rHl7sQIRan8MfSm5YTbcdUkwSDhbKRiOkh7+GyiyYtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JM2yFd0X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46AAF22A;
	Mon, 16 Jun 2025 14:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750076082;
	bh=gVw/OKVgytey09K87/+5x7WBm97ScRhjXSwCZK25GSM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JM2yFd0XydEOkzQdnyHlGlqmgnxCunH92vphpWhprJPzrUd1Gzh6DY0NT4j1E27xv
	 CXKI0F52wJJkBXFG2YxurdM+s5bZ+nUVlsSp1jnM87/HK/D+z4V/B8RMoYbwhbg5dH
	 RKwl1REqxHAMm6ivj1MvJ+VxCrzYdCiJpY+IPJcc=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 16 Jun 2025 14:14:25 +0200
Subject: [PATCH v2 2/2] media: vsp1: Reset FCP after VSPD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-vspx-reset-v2-2-6cc12ed7e9bb@ideasonboard.com>
References: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
In-Reply-To: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
 LUU HOAI <hoai.luu.ub@renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=4EcQzf/0s5fg3bP9dmICaSxK9KXrMChHKISEHqB60NE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUAqs7OMq4+2K38LhtzWStbdk9GjeWV6Q92f1S
 0P7e64ZqzOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFAKrAAKCRByNAaPFqFW
 PGcXEACxwGJ9jfDC95Nm4hphGqJbtYvvMhefvMwKRnlC/BTSjnlJ4ZE1KKS+Qnc7a++iTBUfjj9
 UHF2U7W1mUcljgghFVn34qA4Vwz+U2gVVG8Juxe/9IhGnk4ufz20VUv4lLbaa7DKLidQDa/6VlY
 oVu2E4xV8bRiI7gz/xDvaVhZcsfCQ6dUYPYJg3ZdZq5DICs5Z3A/aQi9wrN6FKPvx3WJSPVr1Hm
 iymdzE11o0/pjHIy1mptzcfye+Pu04RcG4+XHBqZtjyZh6TVl/AO7wkocupiY9EHTntWmtHw0Ua
 dXMui0lPimSjEaZ722mL6pRw8ueJt75PbjPusvrQJgJ3w69Fpf22vbRsTM4esyl6TffhLdtntVy
 L4zEVjTLi4qG8hX4JNZfuHWe0SuSrbKOApKZxtKNg8qc8RGGkk1yPuDsrFP7B7bW6QKqSXKC7Rp
 ZKYjwu4+2KuTLSerS04wfV7mR1rcnBRjwwb14aTdb5806ribRQlGbCRWarlhdmEZCpqR/62aXAu
 4xJIBEftTvD2t4fgU97pEkyxIGQZ5FjADwpWg7xSJ5bRWVMuCAljJiyq1RLYY1ZpYt1VGOiee0L
 pzd/BOGfH8cjMiWE9bu70e30sYx2ejfEdqZTl7TqERD1Zl8B9u7Fi3MTPjVX8a9ifpkf3NHgu0/
 EP2IS/HUBW9GtwA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to the R-Car Gen3 H/W manual v2.40, and R-Car Gen4 H/W manual
v1.20, the FCP must be reset after resetting the VSPD, except for the
VSPDL. Do so.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 8270a9d207cb19c3a08911a408f5039d7d2924b6..49ac3104291a63ca0a47947baaff78ac7ecce3ea 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -33,6 +33,7 @@
 #include "vsp1_lif.h"
 #include "vsp1_lut.h"
 #include "vsp1_pipe.h"
+#include "vsp1_regs.h"
 #include "vsp1_rwpf.h"
 #include "vsp1_sru.h"
 #include "vsp1_uds.h"
@@ -502,7 +503,9 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 
 int vsp1_reset_wpf(struct vsp1_device *vsp1, unsigned int index)
 {
+	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
 	unsigned int timeout;
+	int ret = 0;
 	u32 status;
 
 	status = vsp1_read(vsp1, VI6_STATUS);
@@ -523,7 +526,11 @@ int vsp1_reset_wpf(struct vsp1_device *vsp1, unsigned int index)
 		return -ETIMEDOUT;
 	}
 
-	return 0;
+	if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3 ||
+	    version == VI6_IP_VERSION_MODEL_VSPD_GEN4)
+		ret = rcar_fcp_soft_reset(vsp1->fcp);
+
+	return ret;
 }
 
 static int vsp1_device_init(struct vsp1_device *vsp1)

-- 
2.49.0


