Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D7155255
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfFYOpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:19 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57777 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730925AbfFYOpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:18 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmhAhHozt; Tue, 25 Jun 2019 16:45:16 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 07/13] drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
Date:   Tue, 25 Jun 2019 16:45:04 +0200
Message-Id: <20190625144510.122214-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAkTWwsUHmfEelg/SEvUpZY9/CZ8hb8g62P3xU16qZ5ShLynhD2V0cuz9N+D/rWAcb7hKH3JmQAxiMe+WxbBdFXRGKypDOCgy+QgEzh1PEuwL4CP/yzY
 4bO33Rc1H3jlSLvijgDmV6ndF8I5T23pcjqrtNcJ08UtDOuFid/R7cG9sAYGa2Z2gef1bKviVtyoXVpZ/lZjhTh9rSagKKTpNraewI3jI4xr8Kw6NZ5WAKkc
 G6uzBcsao34AgkNYf9KFDXubk1FCdIx9VwcQo5zDsIBrK+2r5YZSk2+JuCZsBVxb7cUyFoBA7FuNnU3W9aZugv+NEoHRDSmMlRcQSKOhxzVYob3RSjmqnzVA
 lIHj2nzVCXFzTWRuygWaI3B7E5yafN8PPnBQsg2oXg+AxRxvP06311gT2XeCqrLjntonCOXk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i915/intel_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
index 34be2cfd0ec8..05a5ccc1517e 100644
--- a/drivers/gpu/drm/i915/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/intel_hdmi.c
@@ -2670,8 +2670,9 @@ intel_hdmi_connector_register(struct drm_connector *connector)
 
 static void intel_hdmi_destroy(struct drm_connector *connector)
 {
-	if (intel_attached_hdmi(connector)->cec_notifier)
-		cec_notifier_put(intel_attached_hdmi(connector)->cec_notifier);
+	struct cec_notifier *n = intel_attached_hdmi(connector)->cec_notifier;
+
+	cec_notifier_conn_unregister(n);
 
 	intel_connector_destroy(connector);
 }
@@ -2968,6 +2969,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 	struct drm_device *dev = intel_encoder->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_encoder->port;
+	struct cec_connector_info conn_info;
 
 	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
 		      port_name(port));
@@ -3020,8 +3022,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 		I915_WRITE(PEG_BAND_GAP_DATA, (temp & ~0xf) | 0xd);
 	}
 
-	intel_hdmi->cec_notifier = cec_notifier_get_conn(dev->dev,
-							 port_identifier(port));
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	intel_hdmi->cec_notifier =
+		cec_notifier_conn_register(dev->dev, port_identifier(port),
+					   &conn_info);
 	if (!intel_hdmi->cec_notifier)
 		DRM_DEBUG_KMS("CEC notifier get failed\n");
 }
-- 
2.20.1

