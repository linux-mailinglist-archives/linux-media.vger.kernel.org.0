Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894E2365881
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhDTMGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbhDTMGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:06:07 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20E471936;
        Tue, 20 Apr 2021 14:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920335;
        bh=ZRnFcyznewzTYa2G76kxRYpPz0zu1LU5m/yJTK03JMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pfe0IsTr+RbeBDxvUQyKz6tIc7S8pYoE77KObb7vu3MI3s+fWggGnlURYSfD1DtXX
         4NYG48DJ9ODQo19HrTQmW4mjw+v73neTd0GxCNiy9FGl/xtwJjb5jg7Otl4+wVnOY7
         SK5Fqz7SU6YSkD8LIIehED7vjxSGYDMuyjJ9vKrQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 34/35] media: ti-vpe: cal: add camerarx enable/disable refcounting
Date:   Tue, 20 Apr 2021 15:04:32 +0300
Message-Id: <20210420120433.902394-35-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following patches add multistream support and we will have multiple
video devices using the same camerarx instances. Thus we need
enable/disable refcounting for the camerarx.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 10 ++++++++++
 drivers/media/platform/ti-vpe/cal.h          |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 6f3d44d529b0..885946ae1140 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -285,6 +285,11 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	u32 val;
 	int ret;
 
+	if (phy->enable_count > 0) {
+		phy->enable_count++;
+		return 0;
+	}
+
 	link_freq = cal_camerarx_get_ext_link_freq(phy);
 	if (link_freq < 0)
 		return link_freq;
@@ -409,6 +414,8 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	/* Finally, enable the PHY Protocol Interface (PPI). */
 	cal_camerarx_ppi_enable(phy);
 
+	phy->enable_count++;
+
 	return 0;
 }
 
@@ -416,6 +423,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 {
 	int ret;
 
+	if (--phy->enable_count > 0)
+		return;
+
 	cal_camerarx_ppi_disable(phy);
 
 	cal_camerarx_disable_irqs(phy);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 78bd2e041d9a..8608a2c6c01a 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -166,6 +166,8 @@ struct cal_camerarx {
 
 	/* mutex for camerarx ops */
 	struct mutex		mutex;
+
+	unsigned int enable_count;
 };
 
 struct cal_dev {
-- 
2.25.1

