Return-Path: <linux-media+bounces-1779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF202807B7E
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 23:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BECE1C20EA8
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064A0563B6;
	Wed,  6 Dec 2023 22:39:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de [80.67.31.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D4510C3;
	Wed,  6 Dec 2023 14:39:04 -0800 (PST)
Received: from [92.206.191.209] (helo=note-book.lan)
	by smtprelay03.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <git@apitzsch.eu>)
	id 1rB0TI-0007Ur-12;
	Wed, 06 Dec 2023 23:34:24 +0100
From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date: Wed, 06 Dec 2023 23:33:57 +0100
Subject: [PATCH v4 3/4] media: i2c: imx214: Read orientation and rotation
 from system firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231206-imx214-v4-3-7ef604b01dcb@apitzsch.eu>
References: <20231206-imx214-v4-0-7ef604b01dcb@apitzsch.eu>
In-Reply-To: <20231206-imx214-v4-0-7ef604b01dcb@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Level: *

Obtain rotation and orientation information from system firmware and
register the appropriate controls. While at it, update number of
pre-allocated control slots.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index e460030a601b..132267e3a8f5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -704,11 +704,16 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		.width = 1120,
 		.height = 1120,
 	};
+	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	int ret;
 
+	ret = v4l2_fwnode_device_parse(imx214->dev, &props);
+	if (ret < 0)
+		return ret;
+
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 3);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 6);
 	if (ret)
 		return ret;
 
@@ -746,6 +751,8 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 				V4L2_CID_UNIT_CELL_SIZE,
 				v4l2_ctrl_ptr_create((void *)&unit_size));
 
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
+
 	ret = ctrl_hdlr->error;
 	if (ret) {
 		v4l2_ctrl_handler_free(ctrl_hdlr);

-- 
2.43.0


