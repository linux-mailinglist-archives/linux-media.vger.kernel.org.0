Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83439AE0A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733167AbfHWLYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:24:34 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44635 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733010AbfHWLYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:24:34 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 17gBikVExThuu17gFiolqX; Fri, 23 Aug 2019 13:24:32 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] drm/vc4/vc4_hdmi: fill in connector info
Date:   Fri, 23 Aug 2019 13:24:25 +0200
Message-Id: <20190823112427.42394-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGFE4NH+mS+hq0jRHj36UTNmU2gUS9qgz/Zv1ssR/aVMa28g+KX37hJzsioRxyHt8cEQkJqR3qQh1lNbVV9tOxb2Au9FsG2kPqdWTym8oD4X8g+dh8ts
 ln5rZ72YV6saavbgYlGUQvtHyTUJkflvXjT3BmHR65XXlIxXbPtedf3YN7sLBUEfuz8CC6FTUSevvNvexNhjQ15wxxBiw47W5QUeRMf7zD4VgezlydfMAOaF
 yXBp5bw2wHsjSAhYaSlGFr+MCR2UmmGb0bfxEp1M8DicDLB4gTN04uUC8t25zOhRJxuhbb527b3/IHvmI2qXjlCRCK3s5oIRV0pr9Lq8ZODN6HtuMyasXp9m
 n80GWpkI8Ou5lZcutrZitM9wRMuco2aH4eXXvN5AvGnJS4z3/QYQuuuZAhuRb/mwLpInhTwIHOkhvJFLIQwDC9t6bKjuFg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Fill in the connector info, allowing userspace to associate
the CEC device with the drm connector.

Tested on a Raspberry Pi 3B.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ee7d4e7b0ee3..0853b980bcb3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1285,6 +1285,9 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+	struct cec_connector_info conn_info;
+#endif
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
@@ -1403,13 +1406,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
-					      CEC_CAP_TRANSMIT |
-					      CEC_CAP_LOG_ADDRS |
-					      CEC_CAP_PASSTHROUGH |
-					      CEC_CAP_RC, 1);
+					      CEC_CAP_DEFAULTS |
+					      CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(hdmi->cec_adap);
 	if (ret < 0)
 		goto err_destroy_conn;
+
+	cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
+	cec_s_conn_info(hdmi->cec_adap, &conn_info);
+
 	HDMI_WRITE(VC4_HDMI_CPU_MASK_SET, 0xffffffff);
 	value = HDMI_READ(VC4_HDMI_CEC_CNTRL_1);
 	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
-- 
2.20.1

