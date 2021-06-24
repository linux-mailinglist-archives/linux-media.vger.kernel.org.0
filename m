Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58F93B36D2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 21:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbhFXTYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 15:24:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47922 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbhFXTYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 15:24:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJMLQ4089342;
        Thu, 24 Jun 2021 14:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624562541;
        bh=VtxPq8UzsBfJ86/fQHgJhSQQ2BKfLbG0iHoXljBKAx8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bVRL3orSFg2fbsrSzaDo73qs4nngQroLtodTjN4an7TPJ79P1oshAQ3HaW3Z6i5OO
         oRFUQIHclEWq7zmC5oquLMmEQW/e/gLezpnNXRmiG3P1DL+op1Vro6k+aPmRU8Mn7e
         U290VKLUeqpAkax4H/GYvJoxXASFzwg5LQ0PyKwM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJMLld029317
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jun 2021 14:22:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:22:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:22:22 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJM14I120548;
        Thu, 24 Jun 2021 14:22:18 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 02/11] media: cadence: csi2rx: Unregister v4l2 async notifier
Date:   Fri, 25 Jun 2021 00:51:51 +0530
Message-ID: <20210624192200.22559-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624192200.22559-1-p.yadav@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The notifier is added to the global notifier list when registered. When
the module is removed, the struct csi2rx_priv in which the notifier is
embedded, is destroyed. As a result the notifier list has a reference to
a notifier that no longer exists. This causes invalid memory accesses
when the list is iterated over. Similar for when the probe fails.

Unregister and clean up the notifier to avoid this.

Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v3:
- New in v3.

 drivers/media/platform/cadence/cdns-csi2rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index f2b4ddd31177..bf2e024d73c5 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -471,6 +471,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_notifier_unregister(&csi2rx->notifier);
 	v4l2_async_notifier_cleanup(&csi2rx->notifier);
 err_free_priv:
 	kfree(csi2rx);
@@ -481,6 +482,8 @@ static int csi2rx_remove(struct platform_device *pdev)
 {
 	struct csi2rx_priv *csi2rx = platform_get_drvdata(pdev);
 
+	v4l2_async_notifier_unregister(&csi2rx->notifier);
+	v4l2_async_notifier_cleanup(&csi2rx->notifier);
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	kfree(csi2rx);
 
-- 
2.30.0

