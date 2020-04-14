Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC981A783A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 12:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438197AbgDNKPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 06:15:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438130AbgDNKP0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 06:15:26 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F277020644;
        Tue, 14 Apr 2020 10:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586859325;
        bh=5KDkhy+ZFpsYBqxAfXHYUf4re4Ft9YebFkjFM9QeaSk=;
        h=From:To:Cc:Subject:Date:From;
        b=COnAscHvzBx1NOAVnVJ6OqdJ25Qz6mcwwAViHJyth5hu/wVA5ThLZijOHLrCom8Xm
         zqyFq2nOfIWqZeC74GL0IY/89lpSms6AreKYzp5vEtD3sRJZ81uVM40qCPLHO1mcOG
         vHw2EGVj01FpdsxeMXQiy0dqb42qZ2R8IlPvskkU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOIbC-004QuY-Cb; Tue, 14 Apr 2020 12:15:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        "Lucas A. M. Magalhaes" <lucmaga@gmail.com>
Subject: [PATCH] media: vimc: fix kernel-doc markups
Date:   Tue, 14 Apr 2020 12:15:21 +0200
Message-Id: <e671ed99f843e0c783c63d731a03c52f7073ae51.1586859314.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several markups there that doesn't follow the
specs. Fields should be like:

	@foo:

with a collon at the end. Also, continuation lines should
be aligned.

Failing to do that would cause kernel-doc to parse it wrong.
Some of the troubles will even cause warnings:

	$ ./scripts/kernel-doc -none drivers/media/test_drivers/vimc/vimc-common.h
	drivers/media/test_drivers/vimc/vimc-common.h:59: error: Cannot parse struct or union!
	drivers/media/test_drivers/vimc/vimc-common.h:77: warning: Function parameter or member 'bpp' not described in 'vimc_pix_map'
	drivers/media/test_drivers/vimc/vimc-common.h:120: warning: Function parameter or member 'pipe_cfg' not described in 'vimc_device'
	drivers/media/test_drivers/vimc/vimc-common.h:120: warning: Function parameter or member 'ent_devs' not described in 'vimc_device'
	drivers/media/test_drivers/vimc/vimc-common.h:120: warning: Function parameter or member 'mdev' not described in 'vimc_device'
	drivers/media/test_drivers/vimc/vimc-common.h:120: warning: Function parameter or member 'v4l2_dev' not described in 'vimc_device'
	drivers/media/test_drivers/vimc/vimc-common.h:137: warning: Function parameter or member 'add' not described in 'vimc_ent_type'
	drivers/media/test_drivers/vimc/vimc-common.h:137: warning: Function parameter or member 'unregister' not described in 'vimc_ent_type'
	drivers/media/test_drivers/vimc/vimc-common.h:137: warning: Function parameter or member 'release' not described in 'vimc_ent_type'
	drivers/media/test_drivers/vimc/vimc-common.h:150: warning: Function parameter or member 'name' not described in 'vimc_ent_config'
	drivers/media/test_drivers/vimc/vimc-common.h:150: warning: Function parameter or member 'type' not described in 'vimc_ent_config'
	drivers/media/test_drivers/vimc/vimc-common.h:197: warning: bad line:                 flags of the pads

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test_drivers/vimc/vimc-common.h | 28 +++++++++----------
 .../media/test_drivers/vimc/vimc-streamer.h   |  7 +++--
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/media/test_drivers/vimc/vimc-common.h b/drivers/media/test_drivers/vimc/vimc-common.h
index 1155eba36b6a..487bd020f85c 100644
--- a/drivers/media/test_drivers/vimc/vimc-common.h
+++ b/drivers/media/test_drivers/vimc/vimc-common.h
@@ -33,7 +33,7 @@
 #define VIMC_IS_SINK(pad)	(!(pad))
 
 /**
- * struct vimc_colorimetry_clamp - Adjust colorimetry parameters
+ * vimc_colorimetry_clamp - Adjust colorimetry parameters
  *
  * @fmt:		the pointer to struct v4l2_pix_format or
  *			struct v4l2_mbus_framefmt
@@ -62,7 +62,7 @@ do {									\
  * struct vimc_pix_map - maps media bus code with v4l2 pixel format
  *
  * @code:		media bus format code defined by MEDIA_BUS_FMT_* macros
- * @bbp:		number of bytes each pixel occupies
+ * @bpp:		number of bytes each pixel occupies
  * @pixelformat:	pixel format defined by V4L2_PIX_FMT_* macros
  * @bayer:		true if this is a bayer format
  *
@@ -107,10 +107,10 @@ struct vimc_ent_device {
 /**
  * struct vimc_device - main device for vimc driver
  *
- * @pipe_cfg	pointer to the vimc pipeline configuration structure
- * @ent_devs	array of vimc_ent_device pointers
- * @mdev	the associated media_device parent
- * @v4l2_dev	Internal v4l2 parent device
+ * @pipe_cfg:	pointer to the vimc pipeline configuration structure
+ * @ent_devs:	array of vimc_ent_device pointers
+ * @mdev:	the associated media_device parent
+ * @v4l2_dev:	Internal v4l2 parent device
  */
 struct vimc_device {
 	const struct vimc_pipeline_config *pipe_cfg;
@@ -123,11 +123,11 @@ struct vimc_device {
  * struct vimc_ent_type		Structure for the callbacks of the entity types
  *
  *
- * @add				initializes and registers
- *					vimc entity - called from vimc-core
- * @unregister			unregisters vimc entity - called from vimc-core
- * @release			releases vimc entity - called from the v4l2_dev
- *					release callback
+ * @add:			initializes and registers
+ *				vimc entity - called from vimc-core
+ * @unregister:			unregisters vimc entity - called from vimc-core
+ * @release:			releases vimc entity - called from the v4l2_dev
+ *				release callback
  */
 struct vimc_ent_type {
 	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
@@ -140,8 +140,8 @@ struct vimc_ent_type {
  * struct vimc_ent_config	Structure which describes individual
  *				configuration for each entity
  *
- * @name			entity name
- * @type			contain the callbacks of this entity type
+ * @name:			entity name
+ * @type:			contain the callbacks of this entity type
  *
  */
 struct vimc_ent_config {
@@ -194,7 +194,7 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
  * @function:	media entity function defined by MEDIA_ENT_F_* macros
  * @num_pads:	number of pads to initialize
  * @pads:	the array of pads of the entity, the caller should set the
-		flags of the pads
+ *		flags of the pads
  * @sd_ops:	pointer to &struct v4l2_subdev_ops.
  *
  * Helper function initialize and register the struct vimc_ent_device and struct
diff --git a/drivers/media/test_drivers/vimc/vimc-streamer.h b/drivers/media/test_drivers/vimc/vimc-streamer.h
index fe3c51f15fad..3bb6731b8d4d 100644
--- a/drivers/media/test_drivers/vimc/vimc-streamer.h
+++ b/drivers/media/test_drivers/vimc/vimc-streamer.h
@@ -20,9 +20,10 @@
  *
  * @pipe:		the media pipeline object associated with this stream
  * @ved_pipeline:	array containing all the entities participating in the
- * stream. The order is from a video device (usually a capture device) where
- * stream_on was called, to the entity generating the first base image to be
- * processed in the pipeline.
+ * 			stream. The order is from a video device (usually a
+ *			capture device) where stream_on was called, to the
+ *			entity generating the first base image to be
+ *			processed in the pipeline.
  * @pipe_size:		size of @ved_pipeline
  * @kthread:		thread that generates the frames of the stream.
  *
-- 
2.25.2

