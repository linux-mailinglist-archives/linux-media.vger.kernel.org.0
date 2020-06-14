Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAF91F8B76
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgFOAAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbgFOAAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:30 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8AEA1AB5;
        Mon, 15 Jun 2020 02:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179218;
        bh=wCoqy/S86EfxyZQFTi+Cvlw9AumocEkD1iSzF1CXE2U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tSoBl+yGJwBiXTB/MvbnPqCYJO4dU8I02f9dPVxnCXKRL1jxR7FEK2lEQ+rhAtYmm
         qnl2im1xoWjtAnZ6MlpJFqnoPmHIYgrU02ATuVIop/i4UJbEUa4mZXm0MvueV3DhnZ
         Un4WDXIJWglNrQl1cAhhTyfPMFOHkh+jRE+a+mZ4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 018/107] media: ti-vpe: cal: Make structure fields unsigned where applicable
Date:   Mon, 15 Jun 2020 02:58:15 +0300
Message-Id: <20200614235944.17716-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several structure fields declared as int store positive values only.
Make them unsigned.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 19cd795b71b9..d8bf24029d54 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -240,11 +240,11 @@ struct cal_csi2_phy {
 		unsigned int lsb;
 		unsigned int msb;
 	} fields[F_MAX_FIELDS];
-	const int num_lanes;
+	const unsigned int num_lanes;
 };
 
 struct cal_data {
-	const int num_csi2_phy;
+	const unsigned int num_csi2_phy;
 	struct cal_csi2_phy *csi2_phy_core;
 
 	const unsigned int flags;
@@ -388,7 +388,7 @@ struct cal_ctx {
 
 	/* Current subdev enumerated format */
 	const struct cal_fmt	*active_fmt[ARRAY_SIZE(cal_formats)];
-	int			num_active_fmt;
+	unsigned int		num_active_fmt;
 
 	struct v4l2_fract	timeperframe;
 	unsigned int		sequence;
-- 
Regards,

Laurent Pinchart

