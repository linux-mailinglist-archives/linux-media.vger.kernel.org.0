Return-Path: <linux-media+bounces-43069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEBFB9A4C5
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 16:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FAC3A693C
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 14:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C07B3093DB;
	Wed, 24 Sep 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7HITxtp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE636307AFB;
	Wed, 24 Sep 2025 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724819; cv=none; b=FFOElc8h4/831LIfyHwpDrEgxNYE7YFbejsWrnPs97mOp5zZwCsF4u+Zu2E5bvPAsKnOmXvEgVLLQOcBiVAFmXyc3uaGO1Ycw921fVw1czu3Zc5oltexPDktFKnwSYfv9rlHOAFnEe5DD8724LMKZYB70lOxCEvFkTG7n1yyVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724819; c=relaxed/simple;
	bh=4T26JdYYsM1e+t3tkUnI/PC5m7zquhrZvJn75mxBUl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRhntqeFm1IdG4WCaYswJfaaCOgudpZ6DjRFtQuptkEvR841TKqgIpebwgrRyLmQoZguTcZGgoAzmb/i/x7v6QGS8lxAh/yQ+cdv+YYArxuk6yTJeVDvqjyEQWCrAB4lme3IEQGq6bfqCREy+bP36LVajpFuqWVuwfx48Iyy2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7HITxtp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4305FC4CEF4;
	Wed, 24 Sep 2025 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758724818;
	bh=4T26JdYYsM1e+t3tkUnI/PC5m7zquhrZvJn75mxBUl0=;
	h=From:To:Cc:Subject:Date:From;
	b=l7HITxtpfw5v7AfGaQb2F4B2jNmtn0RMw5nDMlYyZh5CyjHb2YeLlgXAeHLhL6A1/
	 pCa06CyLgHxfv1Q5OCSyjeI7cyBVwYunS6Y7OQ5eCv1vfqoo0/+TwDreRuNvxlNtc6
	 JRMn+7PhugLkWlyK8dSlC93FrLVLwlCyInGq2IWS3V9lQ37ulUyuvJuE6X7IDS+1cO
	 8W0zWgbA6cpW7Non7OA+oc68DJtF0U0S4j7dKuBWIcF/XEE/DfBNwd0A1CaTwmPpAN
	 K2/7StV3wfKP8Tamry23SHIdYVjkWvelRkNbgZD6w4P1V9dLAD8ednLAprAV/UbP5b
	 yFYtrMfPTveMA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1QfD-000000002vR-2p10;
	Wed, 24 Sep 2025 16:40:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH] media: platform: mtk-mdp3: fix device leaks at probe
Date: Wed, 24 Sep 2025 16:39:19 +0200
Message-ID: <20250924143919.11183-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the references taken when looking up the subsys
devices during probe on probe failure (e.g. probe deferral) and on
driver unbind.

Similarly, drop the SCP device reference after retrieving its platform
data during probe to avoid leaking it.

Note that holding a reference to a device does not prevent its driver
data from going away.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Cc: stable@vger.kernel.org	# 6.1
Cc: Moudy Ho <moudy.ho@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8de2c8e4d333..fc117a6a822c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -157,10 +157,18 @@ void mdp_video_device_release(struct video_device *vdev)
 	kfree(mdp);
 }
 
+static void mdp_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int mdp_mm_subsys_deploy(struct mdp_dev *mdp, enum mdp_infra_id id)
 {
 	struct platform_device *mm_pdev = NULL;
 	struct device **dev;
+	int ret;
 	int i;
 
 	if (!mdp)
@@ -194,6 +202,11 @@ static int mdp_mm_subsys_deploy(struct mdp_dev *mdp, enum mdp_infra_id id)
 		if (WARN_ON(!mm_pdev))
 			return -ENODEV;
 
+		ret = devm_add_action_or_reset(&mdp->pdev->dev, mdp_put_device,
+					       &mm_pdev->dev);
+		if (ret)
+			return ret;
+
 		*dev = &mm_pdev->dev;
 	}
 
@@ -279,6 +292,7 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
+		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.49.1


