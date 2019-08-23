Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACCCA9AE0C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733238AbfHWLYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:24:35 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57621 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732503AbfHWLYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:24:35 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 17gBikVExThuu17gGiolr1; Fri, 23 Aug 2019 13:24:32 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] drm/bridge/adv7511: enable CEC connector info
Date:   Fri, 23 Aug 2019 13:24:27 +0200
Message-Id: <20190823112427.42394-4-hverkuil-cisco@xs4all.nl>
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

Set the connector info to help userspace associate the CEC adapter
with the HDMI connector.

This required that the cec initialization and unregistering the
CEC adapter takes place in the bridge attach and detach ops.

Tested on an R-Car Koelsch board.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c |  7 ++++++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++----------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index a20a45c0b353..accf5e232396 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -302,6 +302,7 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 
 int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
+	struct cec_connector_info conn_info;
 	unsigned int offset = adv7511->type == ADV7533 ?
 						ADV7533_REG_CEC_OFFSET : 0;
 	int ret = adv7511_cec_parse_dt(dev, adv7511);
@@ -310,7 +311,8 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 		goto err_cec_parse_dt;
 
 	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
-		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
+		adv7511, dev_name(dev),
+		CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO, ADV7511_MAX_ADDRS);
 	if (IS_ERR(adv7511->cec_adap)) {
 		ret = PTR_ERR(adv7511->cec_adap);
 		goto err_cec_alloc;
@@ -331,6 +333,9 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 		     ADV7511_REG_CEC_CLK_DIV + offset,
 		     ((adv7511->cec_clk_freq / 750000) - 1) << 2);
 
+	cec_fill_conn_info_from_drm(&conn_info, &adv7511->connector);
+	cec_s_conn_info(adv7511->cec_adap, &conn_info);
+
 	ret = cec_register_adapter(adv7511->cec_adap, dev);
 	if (ret)
 		goto err_cec_register;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f6d2681f6927..bbcb996c4d4f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -881,14 +881,24 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
 		regmap_write(adv->regmap, ADV7511_REG_INT_ENABLE(0),
 			     ADV7511_INT0_HPD);
 
+	if (!ret)
+		ret = adv7511_cec_init(&adv->i2c_main->dev, adv);
 	return ret;
 }
 
+static void adv7511_bridge_detach(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	cec_unregister_adapter(adv->cec_adap);
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.enable = adv7511_bridge_enable,
 	.disable = adv7511_bridge_disable,
 	.mode_set = adv7511_bridge_mode_set,
 	.attach = adv7511_bridge_attach,
+	.detach = adv7511_bridge_detach,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1202,7 +1212,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 						IRQF_ONESHOT, dev_name(dev),
 						adv7511);
 		if (ret)
-			goto err_unregister_cec;
+			goto err_i2c_unregister_packet;
 	}
 
 	adv7511_power_off(adv7511);
@@ -1212,10 +1222,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (adv7511->type == ADV7511)
 		adv7511_set_link_config(adv7511, &link_config);
 
-	ret = adv7511_cec_init(dev, adv7511);
-	if (ret)
-		goto err_unregister_cec;
-
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
 	adv7511->bridge.of_node = dev->of_node;
 
@@ -1224,10 +1230,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	adv7511_audio_init(dev, adv7511);
 	return 0;
 
-err_unregister_cec:
-	i2c_unregister_device(adv7511->i2c_cec);
-	if (adv7511->cec_clk)
-		clk_disable_unprepare(adv7511->cec_clk);
 err_i2c_unregister_packet:
 	i2c_unregister_device(adv7511->i2c_packet);
 err_i2c_unregister_edid:
@@ -1254,8 +1256,6 @@ static int adv7511_remove(struct i2c_client *i2c)
 
 	adv7511_audio_exit(adv7511);
 
-	cec_unregister_adapter(adv7511->cec_adap);
-
 	i2c_unregister_device(adv7511->i2c_packet);
 	i2c_unregister_device(adv7511->i2c_edid);
 
-- 
2.20.1

