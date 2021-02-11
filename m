Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C5131885F
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 11:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBKKlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 05:41:03 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49981 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230242AbhBKKik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 05:38:40 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A9LMlXsw2Zvk6A9LQlud1p; Thu, 11 Feb 2021 11:37:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613039828; bh=x8JlAVrn67xNpnzpy5vZ00tzTAjgy0qYQsD6Sh3UeoY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=CLF44D2knSpMTOM5CFFDNJVJfbhGpoX2TwA9elpcpAr55XMNnySM0qrVPpQy/3SDg
         Gz4nOgrEM7Asu/Rrlac5LtzOmRU1KfQ5VlChhz73D9X+w5iMYTPCOSSGZTTFzyM+Ph
         Ie7KyUZ9QyAtTtQmsPtlN6gwVp1G5jsOXound5+NmD2VMb4/X4xxOjOlbgi/y2LjOE
         NVeNj1NBjhJ2gjIZJ13+gad5VtYrLQ7Y9pJnVUrjeZxx3jJ3zTveasRYyWRyNIV4jV
         09QimY0RuZJpB4AjgeWOFYJ7gDKhJ8gXF6JaOzyjo2v0DAfebfCiWw/WPLhtdbntdT
         8Y5YPOudD9KxQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/5] drm: drm_bridge: add cec_init/exit bridge ops
Date:   Thu, 11 Feb 2021 11:36:59 +0100
Message-Id: <20210211103703.444625-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEpPuZfHrv3ScUk8i5acH1/+xpv+JQkYulPlSP9klHaiTLJnvoGeqywczB9nhmp8NrXq89BNNgFFzgEWAY1NcrXoyx9ColwZ/pzFSOk7VMXGprxvTFo+
 wZRrhBLye8ylSK5j5RqtmzqVCsL83Kbsq8EUNRh2D4zm8VxdCIKJWsoI2mth5FrfY0V6ewUxwErJfkJTHJ8XhV/nxcX1Ri7QDchpEVyEZ/Nn7+6h8cZ/l9z4
 7osf3nfUcY8gmKFinG0v6SKIPTCQ53wQtdiijoXrt7p8wqVUJoO0NPIyayDQ8rAXGip8MCB4yDMaiJAxCsVtLCn4X6HmnRtFMTRUGFFee0/LR8D0nMCJvH2i
 L9us7GCFH6XaEZVhcj/8YogMVCxxuh68963Smdwn9aauaCCNAesdV6apOCb4ZU6yVaBdraCoVtwRVlckFMv5FyC+sV1m++A1WmMyseBvIwlGj/1CxTw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bridge cec_init/exit ops. These ops will be responsible for
creating and destroying the CEC adapter for the bridge that supports
CEC.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/drm_bridge_connector.c | 23 +++++++++++++++++++
 include/drm/drm_bridge.h               | 31 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 791379816837..2ff90f5e468c 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -84,6 +84,13 @@ struct drm_bridge_connector {
 	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
 	 */
 	struct drm_bridge *bridge_modes;
+	/**
+	 * @bridge_cec:
+	 *
+	 * The last bridge in the chain (closest to the connector) that provides
+	 * cec adapter support, if any (see &DRM_BRIDGE_OP_CEC).
+	 */
+	struct drm_bridge *bridge_cec;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -204,6 +211,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
+	if (bridge_connector->bridge_cec) {
+		struct drm_bridge *cec = bridge_connector->bridge_cec;
+
+		cec->funcs->cec_exit(cec);
+	}
 	if (bridge_connector->bridge_hpd) {
 		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
 
@@ -352,6 +364,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_detect = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_CEC)
+			bridge_connector->bridge_cec = bridge;
 
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
@@ -374,6 +388,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	else if (bridge_connector->bridge_detect)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
+	if (bridge_connector->bridge_cec) {
+		struct drm_bridge *bridge = bridge_connector->bridge_cec;
+		int ret = bridge->funcs->cec_init(bridge, connector);
+
+		if (ret) {
+			drm_bridge_connector_destroy(connector);
+			return ERR_PTR(ret);
+		}
+	}
 
 	return connector;
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..4c83c2657e87 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -629,6 +629,30 @@ struct drm_bridge_funcs {
 	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
+
+	/**
+	 * @cec_init:
+	 *
+	 * Initialize the CEC adapter.
+	 *
+	 * This callback is optional and shall only be implemented by bridges
+	 * that support a CEC adapter. Bridges that implement it shall also
+	 * implement the @cec_exit callback and set the DRM_BRIDGE_OP_CEC flag
+	 * in their &drm_bridge->ops.
+	 */
+	int (*cec_init)(struct drm_bridge *bridge, struct drm_connector *conn);
+
+	/**
+	 * @cec_exit:
+	 *
+	 * Terminate the CEC adapter.
+	 *
+	 * This callback is optional and shall only be implemented by bridges
+	 * that support a CEC adapter. Bridges that implement it shall also
+	 * implement the @cec_init callback and set the DRM_BRIDGE_OP_CEC flag
+	 * in their &drm_bridge->ops.
+	 */
+	void (*cec_exit)(struct drm_bridge *bridge);
 };
 
 /**
@@ -698,6 +722,13 @@ enum drm_bridge_ops {
 	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
 	 */
 	DRM_BRIDGE_OP_MODES = BIT(3),
+	/**
+	 * @DRM_BRIDGE_OP_CEC: The bridge supports a CEC adapter.
+	 * Bridges that set this flag shall implement the
+	 * &drm_bridge_funcs->cec_init and &drm_bridge_funcs->cec_exit
+	 * callbacks.
+	 */
+	DRM_BRIDGE_OP_CEC = BIT(4),
 };
 
 /**
-- 
2.30.0

