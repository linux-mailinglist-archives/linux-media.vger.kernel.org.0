Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 639CCDA66E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387545AbfJQH2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:28:50 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43271 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730715AbfJQH2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:28:49 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L0DCiNIhkPduvL0DGitUVv; Thu, 17 Oct 2019 09:28:46 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 1/2] drm: tda998x: use cec_notifier_conn_(un)register
Date:   Thu, 17 Oct 2019 09:28:41 +0200
Message-Id: <20191017072842.16793-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
References: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGFAX9zU26r6wlHNsYbLI+OSAqNLGbGKkUn9xVdyWxOVKD4TD5psA+QsWHW2HCyNizsE4ILeAgH+Y4I5r7hgR9GYDZk7ZrgQoAgTHN+rxRqAilBBB2cJ
 EUHnL9WnsYDfBQgTsVuPB5CWz5wgByOXOl/Zv9wDADavWaMMTh5YuHxHOBGVmyAlIKBHulPs5v1uUjC9lDXau7B7vsO0r/kzOu9+yHPQl6bSa8JCLKEpfVAw
 zNxbxzWCUAS7Db/0cQKbboZqTvkn4EgffAC/oHxtZPwHZ00H2baENo1/ZWCxS3fbrSl1ciS1hL0i/PDN7j08Hk2zzYhKDDfx8NSc3DIo2Oa1Ol6SLUji7rJv
 ek3zhsJ9kMjfX2VzJJZortT1g2qbXVPD1cR51HrWd7YoZBIEvu8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 84c6d4c91c65..dde8decb52a6 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -805,8 +805,8 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
 				tda998x_edid_delay_start(priv);
 			} else {
 				schedule_work(&priv->detect_work);
-				cec_notifier_set_phys_addr(priv->cec_notify,
-						   CEC_PHYS_ADDR_INVALID);
+				cec_notifier_phys_addr_invalidate(
+						priv->cec_notify);
 			}
 
 			handled = true;
@@ -1790,8 +1790,7 @@ static void tda998x_destroy(struct device *dev)
 
 	i2c_unregister_device(priv->cec);
 
-	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+	cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1916,7 +1915,7 @@ static int tda998x_create(struct device *dev)
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
 	}
 
-	priv->cec_notify = cec_notifier_get(dev);
+	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
 	if (!priv->cec_notify) {
 		ret = -ENOMEM;
 		goto fail;
-- 
2.23.0

