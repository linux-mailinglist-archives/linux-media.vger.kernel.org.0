Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B1A7A872E
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 16:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbjITOiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 10:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236828AbjITOhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 10:37:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E3310E5;
        Wed, 20 Sep 2023 07:37:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633C8C433B9;
        Wed, 20 Sep 2023 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695220621;
        bh=a4BpgPVlN4us8i8ZAKm55WYfRM8D4UzuiG9jC3POA78=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=Xp+u+U23wcC1j0R0R0CgHMqWOB8I/CjrW/dfgbC4SMrxatx40K6DWlsnu8OtvQilE
         aAAuSe3M7gsyyQSAO5fMes44xaqdmWtMvVBSsqgq7VSO0Be+PjfRSRtJ0+ABaS5IQ0
         2YDjfiChJ0rT0vAyC+NEajKtF3HIYbOmvkqJxonef2P3VEyazchjnpeNr8hVxoEVuE
         StIL2e5AapeocXN5iNDaiuuAN20S4JJbneRwCt2yc/YBCzI0k6OF2kdJi0SIIx8t2c
         55b//lHAtnnO7k4R+V5Cb/uqth3BYpYEKlHv3wmMXjmDH+x3jFO5TR0kcPhQ/BSMe8
         Q7ffJapvKs90w==
From:   Maxime Ripard <mripard@kernel.org>
Date:   Wed, 20 Sep 2023 16:35:43 +0200
Subject: [PATCH RFC v2 28/37] drm/rockchip: inno_hdmi: Move infoframe
 disable to separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-28-17932daddd7d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=mripard@kernel.org;
 h=from:subject:message-id; bh=a4BpgPVlN4us8i8ZAKm55WYfRM8D4UzuiG9jC3POA78=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFZWXLVuG4wPiyjYmX7fJOn3N7Sh8khyX6/oqpqnW
 b6GttwdpSwMYlwMsmKKLDHC5kviTs163cnGNw9mDisTyBAGLk4BmEjPAkaGT698WDZ45G/s+/tN
 eMXXDUndMQ/lDp4XMeHU6/4zd4t7ASPDStN8mwerQsL/2dxJYfly4eGa5jVdcVrL//6zcObN4i9
 mBgA=
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

The code to upload infoframes to the controller uses a weird construct
which, based on the previous function call return code, will either
disable or enable that infoframe.

In order to get rid of that argument, let's split the function to
disable the infoframe into a separate function and make it obvious what
we are doing in the error path.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 53 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 59b2b676b7b8..e3a421d98dd4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,33 +156,38 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
-				  union hdmi_infoframe *frame, u32 frame_index,
-				  u32 mask, u32 disable, u32 enable)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    u32 frame_index,
+				    u32 mask, u32 disable)
 {
 	if (mask)
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+}
 
-	if (setup_rc >= 0) {
-		u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-		ssize_t rc, i;
+static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
+				  union hdmi_infoframe *frame, u32 frame_index,
+				  u32 mask, u32 disable, u32 enable)
+{
+	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
+	ssize_t rc, i;
 
-		rc = hdmi_infoframe_pack(frame, packed_frame,
-					 sizeof(packed_frame));
-		if (rc < 0)
-			return rc;
+	inno_hdmi_disable_frame(hdmi, frame_index, mask, disable);
 
-		for (i = 0; i < rc; i++)
-			hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
-				    packed_frame[i]);
+	rc = hdmi_infoframe_pack(frame, packed_frame,
+				 sizeof(packed_frame));
+	if (rc < 0)
+		return rc;
 
-		if (mask)
-			hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
-	}
+	for (i = 0; i < rc; i++)
+		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
+			    packed_frame[i]);
 
-	return setup_rc;
+	if (mask)
+		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
+
+	return 0;
 }
 
 static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
@@ -194,8 +199,13 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_vendor_infoframe_from_display_mode(&frame.vendor.hdmi,
 							 &hdmi->connector,
 							 mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI,
+					m_PACKET_VSI_EN, v_PACKET_VSI_EN(0));
+		return rc;
+	}
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_VSI,
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI,
 		m_PACKET_VSI_EN, v_PACKET_VSI_EN(0), v_PACKET_VSI_EN(1));
 }
 
@@ -208,9 +218,14 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						      &hdmi->connector,
 						      mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI, 0, 0);
+		return rc;
+	}
+
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI, 0, 0, 0);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.41.0

