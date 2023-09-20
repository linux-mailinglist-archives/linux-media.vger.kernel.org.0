Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62B87A86BF
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 16:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236548AbjITOgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 10:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235275AbjITOgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 10:36:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4A8123;
        Wed, 20 Sep 2023 07:35:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810F9C433C8;
        Wed, 20 Sep 2023 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695220556;
        bh=E6JGNAX7Dm1dZPTxMfTze5N4hdn9v4Ok+92Pn7dcfMQ=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=NjA8hzP37bZ9OgQ+qCMy7qQimoGyTkuKlFakxC328wTyCV6qFVUZsK3vxeORn6b+l
         meRMjgQKeXshySWCPZn4xHR5z7H6Q7Iw+DlbqDdYmtpC0+jH4GtSVvT4bKN8zemDgp
         WnUcajc3a5G6x/AWXDMZ67xN3YalAEcqpdBNYrBSgKE5WUfmSxIQsa7ezR3b9V3wNV
         64DXx8tncZ/Oh4cIcgLJua8rKwJID2FrM0Npqedh4bU/4G+1woHAjts3fH2NLcXtKY
         ATWe7IpJaX9VjsCFvL9WlS+IHoXAsddh+QzNsoCXCMZ+PBQNymmTTs9Paj/jJtsiet
         nVgHTjDMmeSpg==
From:   Maxime Ripard <mripard@kernel.org>
Date:   Wed, 20 Sep 2023 16:35:20 +0200
Subject: [PATCH RFC v2 05/37] drm/connector: hdmi: Add output BPC to the
 connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-5-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5181; i=mripard@kernel.org;
 h=from:subject:message-id; bh=E6JGNAX7Dm1dZPTxMfTze5N4hdn9v4Ok+92Pn7dcfMQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczJY5l6PTdbwMrrUtEfiUGxlyZoY3R9vsZZ/Ov0yTm
 fB2Q+KOjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkXA0jw8+ZU/RszD+31fke
 T/t+h2OCyf/NJhYiBfbnL0foMZzde5uRYdWW8Phr51wu9uknPxYJvia7SupbjlPd6TcpAW8SxDI
 Z+AA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We'll add automatic selection of the output BPC in a following patch,
but let's add it to the HDMI connector state already.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c              |  4 +++-
 drivers/gpu/drm/drm_atomic_state_helper.c |  6 +++++-
 drivers/gpu/drm/drm_connector.c           | 13 ++++++++++++-
 include/drm/drm_connector.h               | 13 ++++++++++++-
 4 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b1b56dcaa76b..8dce0a2f2ac3 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1143,9 +1143,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
+	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 0f7e5ba555b8..2c9b52ae1b56 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -569,6 +569,9 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	new_state->max_bpc = 8;
+	new_state->max_requested_bpc = 8;
+	new_state->hdmi.output_bpc = 8;
 	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
@@ -651,7 +654,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
-	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b45471d540ac..f55f5918411c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
@@ -475,7 +476,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc)
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc)
 {
 	int ret;
 
@@ -487,6 +489,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	if (max_bpc) {
+		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+			return -EINVAL;
+
+		drm_connector_attach_hdr_output_metadata_property(connector);
+		drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+		connector->max_bpc = max_bpc;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fdcf64ab91a9..d0bcb835c857 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1056,6 +1056,11 @@ struct drm_connector_state {
 		 * Broadcast RGB selection value.
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
+
+		/**
+		 * @output_bpc: Bits per character to output.
+		 */
+		unsigned int output_bpc;
 	} hdmi;
 };
 
@@ -1700,6 +1705,11 @@ struct drm_connector {
 	 */
 	struct drm_property_blob *path_blob_ptr;
 
+	/**
+	 * @max_bpc: Maximum bits per character the connector supports.
+	 */
+	unsigned int max_bpc;
+
 	/**
 	 * @max_bpc_property: Default connector property for the max bpc to be
 	 * driven out of the connector.
@@ -1939,7 +1949,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc);
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);

-- 
2.41.0

