Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37AE140364D
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350809AbhIHItJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 04:49:09 -0400
Received: from comms.puri.sm ([159.203.221.185]:46312 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348368AbhIHItJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Sep 2021 04:49:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 448DBDFA96;
        Wed,  8 Sep 2021 01:48:01 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sB-BIN-zWjwi; Wed,  8 Sep 2021 01:48:00 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] media: imx: set a media_device bus_info string
Date:   Wed,  8 Sep 2021 10:47:46 +0200
Message-Id: <20210908084746.243359-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

some tools like v4l2-compliance let users select a media device based
on the bus_info string which can be quite convenient. Use a unique
string for that.

This also fixes the following v4l2-compliance warning:
warn: v4l2-test-media.cpp(52): empty bus_info

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/imx/imx-media-dev-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index d006e961d8f4..80b69a9a752c 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -367,6 +367,8 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
 	imxmd->v4l2_dev.notify = imx_media_notify;
 	strscpy(imxmd->v4l2_dev.name, "imx-media",
 		sizeof(imxmd->v4l2_dev.name));
+	snprintf(imxmd->md.bus_info, sizeof(imxmd->md.bus_info),
+		 "platform:%s", dev_name(imxmd->md.dev));
 
 	media_device_init(&imxmd->md);
 
-- 
2.30.2

