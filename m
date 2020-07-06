Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC6A215EBA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgGFSil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729973AbgGFSik (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:40 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41B8A2182;
        Mon,  6 Jul 2020 20:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060696;
        bh=RCAq18Jag6k9hyjNJhrq2KV8slWbZ6fJOEk3DhVHSDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kRnEJhgPE2xc4+qwSF8urhDGnJf9M2rTvH3uouX/h+nlMNyPYF3/cvnZ8vnsCtk3t
         x030198zlrvEaGNV4kgYnbWXG7mybAVFRHdkz6rjwHGRpwt8m/VDBc54xZ9GMjcrBi
         4G7e9v8wsj1CIxhAEm9nXC8gDYoHkU9KnN6wIGBE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 075/108] media: ti-vpe: cal: Allocate cal_ctx active_fmt array dynamically
Date:   Mon,  6 Jul 2020 21:36:36 +0300
Message-Id: <20200706183709.12238-76-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 26747e6da358..31878a32f6a1 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -325,7 +325,7 @@ struct cal_ctx {
 	struct v4l2_mbus_framefmt	m_fmt;
 
 	/* Current subdev enumerated format */
-	const struct cal_fmt	*active_fmt[ARRAY_SIZE(cal_formats)];
+	const struct cal_fmt	**active_fmt;
 	unsigned int		num_active_fmt;
 
 	unsigned int		sequence;
@@ -1957,7 +1957,13 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
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

