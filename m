Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F20F38E50E
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhEXLLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232721AbhEXLLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:17 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B695A29ED;
        Mon, 24 May 2021 13:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854576;
        bh=i5eci26Qsvln+6L3qb0ZHnm2A6f9i92rM5ZUbaIuGck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oUUIdhS1UXrEHP8VVj1Tmcn5w+ndfiMkek6lc2ACgiKtn/gCxnznkjuR6hnYAFY8r
         9c1kPB2sa9VyMHE+k8FeE/Pnwp45cjsaqyJ0y+PP6goXDC8pQ/DwmngSfvTj86llj8
         ox2o+d2dbg+pHdoeadvf9zfWri9O/zCmTPuL/KDo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 34/38] media: ti-vpe: cal: add camerarx enable/disable refcounting
Date:   Mon, 24 May 2021 14:09:05 +0300
Message-Id: <20210524110909.672432-35-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
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
index b87ffc52feb6..803d53753e87 100644
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

