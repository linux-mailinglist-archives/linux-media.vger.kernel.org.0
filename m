Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBC77A871A
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 16:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236744AbjITOhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 10:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236683AbjITOhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 10:37:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2938CE5;
        Wed, 20 Sep 2023 07:36:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF4AC433C7;
        Wed, 20 Sep 2023 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695220605;
        bh=vxR+qUPDNITjlXpsuvoNcEUlFJrjEuDeYp+w/DlrP3Y=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=eGIikLMLKipYM2ljRuFicxNhmEhzlnjlAJJBnjzlsqt5+/csI34LQ2ZzHMOuXhL+y
         aTtTT5AnbLhRjfM5Dk3uZyRSbUQPK2pyQFS5lS48VoLc2wQLMDXfNAHZOFSGShF3iL
         Rm2v2SbH4DnlVU+7b/AE1R4hwMbvi+wcv8qBGfl5WT9zrJM7CInHnwPYYRAcbL2Zlz
         2pf6bkQFdY2zewI83PGgsRU9mBej6OGjpKrUQTedtSl1uOnGrTiJmFlzZnqbxScfpC
         ERJbntYpeDBZSWfdfUGiiHHD8PQfS+5mgwQovJYbctPCJZ2wirRIyGlc4IGbHYZJKf
         G4jAuQibmJAsQ==
From:   Maxime Ripard <mripard@kernel.org>
Date:   Wed, 20 Sep 2023 16:35:37 +0200
Subject: [PATCH RFC v2 22/37] drm/rockchip: inno_hdmi: Remove useless
 output format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-22-17932daddd7d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3790; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vxR+qUPDNITjlXpsuvoNcEUlFJrjEuDeYp+w/DlrP3Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFY7pQ47VDTd05xisUajezm7gl5ugmHw7p/aR/fyR
 Fht3jy7o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABO5cI6RYd6ifRf+lRxOjHhs
 9fa8/Z24J73Zec1Tbh5NvhX3myVQYzHDP/30ywkf11l9UrKfPDM4TTvnx44Ga4acmlPm08NYmxW
 6WAE=
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

Similarly to the input format, the driver has a lot of code to deal with
various output format, but the driver hardcodes it to RGB always.

Let's get rid of the dead code.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 57 ++++--------------------------------
 1 file changed, 6 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e0696ab16da3..0c6c550e0ce7 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -28,7 +28,6 @@
 #include "inno_hdmi.h"
 
 struct hdmi_data_info {
-	unsigned int enc_out_format;
 	unsigned int colorimetry;
 };
 
@@ -296,26 +295,14 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						      &hdmi->connector,
 						      mode);
-
-	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
-	else if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV422)
-		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
-	else
-		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
+	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
 	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 {
-	struct hdmi_data_info *data = &hdmi->hdmi_data;
-	int c0_c2_change = 0;
-	int csc_enable = 0;
-	int csc_mode = 0;
-	int auto_csc = 0;
 	int value;
-	int i;
 
 	/* Input video mode is SDR RGB24bit, data enable signal from external */
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
@@ -327,43 +314,13 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 		v_VIDEO_INPUT_CSP(0);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
 
-	if (HDMI_COLORSPACE_RGB == data->enc_out_format) {
-		value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
-		hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
-
-		hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
-			  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
-			  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
-			  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
-		return 0;
-	}
-
-	if (data->colorimetry == HDMI_COLORIMETRY_ITU_601) {
-		if (data->enc_out_format == HDMI_COLORSPACE_YUV444) {
-			csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
-			auto_csc = AUTO_CSC_DISABLE;
-			c0_c2_change = C0_C2_CHANGE_DISABLE;
-			csc_enable = v_CSC_ENABLE;
-		}
-	} else {
-		if (data->enc_out_format == HDMI_COLORSPACE_YUV444) {
-			csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
-			auto_csc = AUTO_CSC_DISABLE;
-			c0_c2_change = C0_C2_CHANGE_DISABLE;
-			csc_enable = v_CSC_ENABLE;
-		}
-	}
-
-	for (i = 0; i < 24; i++)
-		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
-			    coeff_csc[csc_mode][i]);
-
-	value = v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
+	value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
-	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL, m_VIDEO_AUTO_CSC |
-		  m_VIDEO_C0_C2_SWAP, v_VIDEO_AUTO_CSC(auto_csc) |
-		  v_VIDEO_C0_C2_SWAP(c0_c2_change));
 
+	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
+		  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
+		  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
+		  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
 	return 0;
 }
 
@@ -425,8 +382,6 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	struct drm_display_info *display = &hdmi->connector.display_info;
 	u8 vic = drm_match_cea_mode(mode);
 
-	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
-
 	if ((vic == 6) || (vic == 7) ||
 	    (vic == 21) || (vic == 22) ||
 	    (vic == 2) || (vic == 3) ||

-- 
2.41.0

