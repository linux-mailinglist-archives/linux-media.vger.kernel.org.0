Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6731D9AE0B
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733231AbfHWLYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:24:34 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39767 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733062AbfHWLYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:24:34 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 17gBikVExThuu17gGiolqn; Fri, 23 Aug 2019 13:24:32 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] drm/sun4i/sun4i_hdmi_enc: call cec_s_conn_info()
Date:   Fri, 23 Aug 2019 13:24:26 +0200
Message-Id: <20190823112427.42394-3-hverkuil-cisco@xs4all.nl>
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

Set the connector info for the CEC adapter. This helps
userspace to associate the CEC device with the HDMI connector.

Tested on a Cubieboard.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 9c3f99339b82..22f082c32e1f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -489,6 +489,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = data;
+	struct cec_connector_info conn_info;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun4i_hdmi *hdmi;
 	struct resource *res;
@@ -628,8 +629,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 #ifdef CONFIG_DRM_SUN4I_HDMI_CEC
 	hdmi->cec_adap = cec_pin_allocate_adapter(&sun4i_hdmi_cec_pin_ops,
-		hdmi, "sun4i", CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
-		CEC_CAP_PASSTHROUGH | CEC_CAP_RC);
+		hdmi, "sun4i", CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO);
 	ret = PTR_ERR_OR_ZERO(hdmi->cec_adap);
 	if (ret < 0)
 		goto err_cleanup_connector;
@@ -647,6 +647,8 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 			"Couldn't initialise the HDMI connector\n");
 		goto err_cleanup_connector;
 	}
+	cec_fill_conn_info_from_drm(&conn_info, &hdmi->connector);
+	cec_s_conn_info(hdmi->cec_adap, &conn_info);
 
 	/* There is no HPD interrupt, so we need to poll the controller */
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
-- 
2.20.1

