Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB583A65F6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235981AbhFNLqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:46:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237054AbhFNLpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:45:01 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C7675EC1;
        Mon, 14 Jun 2021 13:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669856;
        bh=y84b+LRdm/LCvWpKAIepH75EfD6DF4WVo+AFVeD1RhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fg2zPxvn8W6to0vmxuhNSBPm7xW+3St2ln9loCsoa/Yz8qYwpfttMUOjuTv0huBpc
         Z6TFF6Md9n6dAWeN/cpJyO716dXZROUTg4eB9GIQDndiV+hCu9PVwjX0AVg+JsdJen
         Osii7JPB60wxxxCRGyKHhA9hF7KqNL+C0/e9+ckw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 33/35] media: ti-vpe: cal: add camerarx enable/disable refcounting
Date:   Mon, 14 Jun 2021 14:23:43 +0300
Message-Id: <20210614112345.2032435-34-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following patches add multistream support and we will have multiple
video devices using the same camerarx instances. Thus we need
enable/disable refcounting for the camerarx.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 10 ++++++++++
 drivers/media/platform/ti-vpe/cal.h          |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index f799047c70f7..79ebad139289 100644
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
index cf0b8f5d4378..006374be3f9f 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -167,8 +167,11 @@ struct cal_camerarx {
 	/*
 	 * Lock for camerarx ops. Protects:
 	 * - formats
+	 * - enable_count
 	 */
 	struct mutex		mutex;
+
+	unsigned int		enable_count;
 };
 
 struct cal_dev {
-- 
2.25.1

