Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1C21F8BB3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgFOABe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgFOABd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23C8F2128;
        Mon, 15 Jun 2020 02:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179244;
        bh=pFa1pYVJDztBBCgqEqtlnEqPLNEUz1pCLvCJCWGsgYc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eZOelXXtJcMHWtU2//T6+LeVcYaH4is6qzFgzBJ+ioL25YZM2TTtCZBtMdnxYuuyZ
         QK4PURb40b95GUI4Ojn/Ljk1f/6Ds+JH9OeEbzvR3fgDu6alBFH97OPd1XSz2LN+KQ
         be/LRQyRrziP7Z8vak4EAlPUXOkZCBr75LHiUa90=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 074/107] media: ti-vpe: cal: Allocate cal_ctx active_fmt array dynamically
Date:   Mon, 15 Jun 2020 02:59:11 +0300
Message-Id: <20200614235944.17716-75-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To avoid making the cal_ctx structure layoug depend on the size of the
cal_formats array, allocate the active_fmt array dynamically. This
prepares for splitting the driver in multiple files.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d81195006026..3c24a7f7f1d9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -325,7 +325,7 @@ struct cal_ctx {
 	struct v4l2_mbus_framefmt	m_fmt;
 
 	/* Current subdev enumerated format */
-	const struct cal_fmt	*active_fmt[ARRAY_SIZE(cal_formats)];
+	const struct cal_fmt	**active_fmt;
 	unsigned int		num_active_fmt;
 
 	unsigned int		sequence;
@@ -1947,7 +1947,13 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	int ret = 0;
 
 	/* Enumerate sub device formats and enable all matching local formats */
+	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, ARRAY_SIZE(cal_formats),
+				       sizeof(*ctx->active_fmt), GFP_KERNEL);
+	if (!ctx->active_fmt)
+		return -ENOMEM;
+
 	ctx->num_active_fmt = 0;
+
 	for (j = 0, i = 0; ret != -EINVAL; ++j) {
 
 		memset(&mbus_code, 0, sizeof(mbus_code));
-- 
Regards,

Laurent Pinchart

