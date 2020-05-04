Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA921C35A1
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbgEDJ0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgEDJ0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:47 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89C9011F9;
        Mon,  4 May 2020 11:26:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584404;
        bh=HiWSCz2oAiDjpfm5bLqBamBEm9oEEJGcTPzVplhtRb8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=caTj2A15H/IlIeusnwoIwpnAchkMh6a4wYCw0dCN3tBberBUdfLzzEWAzMiWGDZnn
         rSHnw6cd2Q+SaohOswW3CqEweNbiFdQo/R2UjztEqeJzcl9CHdZwPDWU9XwCG6Wdjm
         +GczpdrXofxC2wjFuq7KjeBvBPEvn0UWO+WCrZyg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 24/34] staging: mmal-vchiq: Fix formatting errors in mmal_parameters.h
Date:   Mon,  4 May 2020 12:26:01 +0300
Message-Id: <20200504092611.9798-25-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Naushir Patuck <naush@raspberrypi.com>

No functional changes in this commit.

- Remove erroneous whitespace.
- Remove _t postfix label on structs and enums.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../bcm2835-camera/bcm2835-camera.c           |  2 +-
 .../vchiq-mmal/mmal-parameters.h              | 46 +++++++++----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 68a2260d88f5..613b04683dca 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1497,7 +1497,7 @@ static int get_num_cameras(struct vchiq_mmal_instance *instance,
 {
 	int ret;
 	struct vchiq_mmal_component  *cam_info_component;
-	struct mmal_parameter_camera_info_t cam_info = {0};
+	struct mmal_parameter_camera_info cam_info = {0};
 	u32 param_size = sizeof(cam_info);
 	int i;
 
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index 926392d754c7..1793103b18fd 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -23,21 +23,21 @@
 #define MMAL_PARAMETERS_H
 
 /** Common parameter ID group, used with many types of component. */
-#define MMAL_PARAMETER_GROUP_COMMON            (0 << 16)
+#define MMAL_PARAMETER_GROUP_COMMON		(0 << 16)
 /** Camera-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_CAMERA            (1 << 16)
+#define MMAL_PARAMETER_GROUP_CAMERA		(1 << 16)
 /** Video-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_VIDEO             (2 << 16)
+#define MMAL_PARAMETER_GROUP_VIDEO		(2 << 16)
 /** Audio-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_AUDIO             (3 << 16)
+#define MMAL_PARAMETER_GROUP_AUDIO		(3 << 16)
 /** Clock-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_CLOCK             (4 << 16)
+#define MMAL_PARAMETER_GROUP_CLOCK		(4 << 16)
 /** Miracast-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_MIRACAST       (5 << 16)
+#define MMAL_PARAMETER_GROUP_MIRACAST		(5 << 16)
 
 /* Common parameters */
 enum mmal_parameter_common_type {
-		/**< Never a valid parameter ID */
+	/**< Never a valid parameter ID */
 	MMAL_PARAMETER_UNUSED = MMAL_PARAMETER_GROUP_COMMON,
 
 		/**< MMAL_PARAMETER_ENCODING_T */
@@ -341,7 +341,7 @@ enum mmal_parameter_imagefx {
 	MMAL_PARAM_IMAGEFX_CARTOON,
 };
 
-enum MMAL_PARAM_FLICKERAVOID_T {
+enum MMAL_PARAM_FLICKERAVOID {
 	MMAL_PARAM_FLICKERAVOID_OFF,
 	MMAL_PARAM_FLICKERAVOID_AUTO,
 	MMAL_PARAM_FLICKERAVOID_50HZ,
@@ -753,15 +753,15 @@ struct mmal_parameter_imagefx_parameters {
 #define MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES 2
 #define MMAL_PARAMETER_CAMERA_INFO_MAX_STR_LEN 16
 
-struct mmal_parameter_camera_info_camera_t {
-	u32    port_id;
-	u32    max_width;
-	u32    max_height;
-	u32    lens_present;
-	u8     camera_name[MMAL_PARAMETER_CAMERA_INFO_MAX_STR_LEN];
+struct mmal_parameter_camera_info_camera {
+	u32 port_id;
+	u32 max_width;
+	u32 max_height;
+	u32 lens_present;
+	u8 camera_name[MMAL_PARAMETER_CAMERA_INFO_MAX_STR_LEN];
 };
 
-enum mmal_parameter_camera_info_flash_type_t {
+enum mmal_parameter_camera_info_flash_type {
 	/* Make values explicit to ensure they match values in config ini */
 	MMAL_PARAMETER_CAMERA_INFO_FLASH_TYPE_XENON = 0,
 	MMAL_PARAMETER_CAMERA_INFO_FLASH_TYPE_LED   = 1,
@@ -769,16 +769,16 @@ enum mmal_parameter_camera_info_flash_type_t {
 	MMAL_PARAMETER_CAMERA_INFO_FLASH_TYPE_MAX = 0x7FFFFFFF
 };
 
-struct mmal_parameter_camera_info_flash_t {
-	enum mmal_parameter_camera_info_flash_type_t flash_type;
+struct mmal_parameter_camera_info_flash {
+	enum mmal_parameter_camera_info_flash_type flash_type;
 };
 
-struct mmal_parameter_camera_info_t {
-	u32                            num_cameras;
-	u32                            num_flashes;
-	struct mmal_parameter_camera_info_camera_t
-				cameras[MMAL_PARAMETER_CAMERA_INFO_MAX_CAMERAS];
-	struct mmal_parameter_camera_info_flash_t
+struct mmal_parameter_camera_info {
+	u32 num_cameras;
+	u32 num_flashes;
+	struct mmal_parameter_camera_info_camera
+		cameras[MMAL_PARAMETER_CAMERA_INFO_MAX_CAMERAS];
+	struct mmal_parameter_camera_info_flash
 				flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
 };
 
-- 
Regards,

Laurent Pinchart

