Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD548297418
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 18:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751869AbgJWQdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 12:33:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751825AbgJWQdu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9593124686;
        Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=qY5J8CKsR7hJzgoIMXtZvFiRRLuQIJmaZwG2d1FRTN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XGhlM2NOdkKRwM3GxhJqieMMIgsaHaj7rRyyGV99V6zk92HCkw/D0qbFcOt0kiyyy
         obphRs5gGRwY2ln4MCNJx3u9+c8diVvC/HfUzfZVGJcUbH1TRVIhHiBM1nE4IARguL
         sG9fJ9t0P3QpUwbBkvMUYC+pNYTXCinJt/JObEno=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00f-002Avz-9T; Fri, 23 Oct 2020 18:33:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, Abylay Ospan <aospan@netup.ru>,
        Antti Palosaari <crope@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rahul Gottipati <rahul.blr97@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sergey Kozlov <serjk@netup.ru>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Tomasz Figa <tfiga@chromium.org>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 15/56] media: fix kernel-doc markups
Date:   Fri, 23 Oct 2020 18:33:02 +0200
Message-Id: <8eb0e3f5a47cfa412c1004f850ef092011d1a45f.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some identifiers have different names between their prototypes
and the kernel-doc markup. Seome seems to be due to cut-and-paste
related issues.

Others need to be fixed, as kernel-doc markups should use this format:
        identifier - description

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/ascot2e.h           | 2 +-
 drivers/media/dvb-frontends/cxd2820r.h          | 2 +-
 drivers/media/dvb-frontends/drxk.h              | 2 +-
 drivers/media/dvb-frontends/dvb-pll.h           | 2 +-
 drivers/media/dvb-frontends/helene.h            | 4 ++--
 drivers/media/dvb-frontends/horus3a.h           | 2 +-
 drivers/media/dvb-frontends/ix2505v.h           | 4 ++--
 drivers/media/dvb-frontends/m88ds3103.h         | 2 +-
 drivers/media/dvb-frontends/mb86a20s.h          | 2 +-
 drivers/media/dvb-frontends/stb6000.h           | 2 +-
 drivers/media/dvb-frontends/tda826x.h           | 2 +-
 drivers/media/dvb-frontends/zl10036.h           | 4 ++--
 drivers/staging/media/ipu3/include/intel-ipu3.h | 8 ++++----
 include/media/dvbdev.h                          | 2 +-
 include/media/v4l2-ctrls.h                      | 2 +-
 include/media/v4l2-dev.h                        | 4 ++--
 include/media/v4l2-device.h                     | 2 +-
 include/media/v4l2-dv-timings.h                 | 2 +-
 include/media/v4l2-fwnode.h                     | 2 +-
 include/media/v4l2-mediabus.h                   | 6 +++---
 include/media/v4l2-subdev.h                     | 2 +-
 include/media/videobuf2-core.h                  | 2 +-
 22 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.h b/drivers/media/dvb-frontends/ascot2e.h
index f886fab1283f..d86b3de85c6a 100644
--- a/drivers/media/dvb-frontends/ascot2e.h
+++ b/drivers/media/dvb-frontends/ascot2e.h
@@ -33,7 +33,7 @@ struct ascot2e_config {
 
 #if IS_REACHABLE(CONFIG_DVB_ASCOT2E)
 /**
- * Attach an ascot2e tuner
+ * ascot2e_attach - Attach an ascot2e tuner
  *
  * @fe: frontend to be attached
  * @config: pointer to &struct ascot2e_config with tuner configuration.
diff --git a/drivers/media/dvb-frontends/cxd2820r.h b/drivers/media/dvb-frontends/cxd2820r.h
index a28b8754932b..4aa6cf4fb913 100644
--- a/drivers/media/dvb-frontends/cxd2820r.h
+++ b/drivers/media/dvb-frontends/cxd2820r.h
@@ -96,7 +96,7 @@ struct cxd2820r_config {
 
 #if IS_REACHABLE(CONFIG_DVB_CXD2820R)
 /**
- * Attach a cxd2820r demod
+ * cxd2820r_attach - Attach a cxd2820r demod
  *
  * @config: pointer to &struct cxd2820r_config with demod configuration.
  * @i2c: i2c adapter to use.
diff --git a/drivers/media/dvb-frontends/drxk.h b/drivers/media/dvb-frontends/drxk.h
index ee06e89187e4..69fdca00f364 100644
--- a/drivers/media/dvb-frontends/drxk.h
+++ b/drivers/media/dvb-frontends/drxk.h
@@ -54,7 +54,7 @@ struct drxk_config {
 
 #if IS_REACHABLE(CONFIG_DVB_DRXK)
 /**
- * Attach a drxk demod
+ * drxk_attach - Attach a drxk demod
  *
  * @config: pointer to &struct drxk_config with demod configuration.
  * @i2c: i2c adapter to use.
diff --git a/drivers/media/dvb-frontends/dvb-pll.h b/drivers/media/dvb-frontends/dvb-pll.h
index 973a66a82e27..71838888743b 100644
--- a/drivers/media/dvb-frontends/dvb-pll.h
+++ b/drivers/media/dvb-frontends/dvb-pll.h
@@ -38,7 +38,7 @@ struct dvb_pll_config {
 
 #if IS_REACHABLE(CONFIG_DVB_PLL)
 /**
- * Attach a dvb-pll to the supplied frontend structure.
+ * dvb_pll_attach - Attach a dvb-pll to the supplied frontend structure.
  *
  * @fe: Frontend to attach to.
  * @pll_addr: i2c address of the PLL (if used).
diff --git a/drivers/media/dvb-frontends/helene.h b/drivers/media/dvb-frontends/helene.h
index c026bdcf548d..32e0b1fb268c 100644
--- a/drivers/media/dvb-frontends/helene.h
+++ b/drivers/media/dvb-frontends/helene.h
@@ -44,7 +44,7 @@ struct helene_config {
 
 #if IS_REACHABLE(CONFIG_DVB_HELENE)
 /**
- * Attach a helene tuner (terrestrial and cable standards)
+ * helene_attach - Attach a helene tuner (terrestrial and cable standards)
  *
  * @fe: frontend to be attached
  * @config: pointer to &struct helene_config with tuner configuration.
@@ -57,7 +57,7 @@ extern struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 					struct i2c_adapter *i2c);
 
 /**
- * Attach a helene tuner (satellite standards)
+ * helene_attach_s - Attach a helene tuner (satellite standards)
  *
  * @fe: frontend to be attached
  * @config: pointer to &struct helene_config with tuner configuration.
diff --git a/drivers/media/dvb-frontends/horus3a.h b/drivers/media/dvb-frontends/horus3a.h
index 366c399e3329..91dbe20169cd 100644
--- a/drivers/media/dvb-frontends/horus3a.h
+++ b/drivers/media/dvb-frontends/horus3a.h
@@ -33,7 +33,7 @@ struct horus3a_config {
 
 #if IS_REACHABLE(CONFIG_DVB_HORUS3A)
 /**
- * Attach a horus3a tuner
+ * horus3a_attach - Attach a horus3a tuner
  *
  * @fe: frontend to be attached
  * @config: pointer to &struct helene_config with tuner configuration.
diff --git a/drivers/media/dvb-frontends/ix2505v.h b/drivers/media/dvb-frontends/ix2505v.h
index 671c0e0959f7..175569131365 100644
--- a/drivers/media/dvb-frontends/ix2505v.h
+++ b/drivers/media/dvb-frontends/ix2505v.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Driver for Sharp IX2505V (marked B0017) DVB-S silicon tuner
  *
  * Copyright (C) 2010 Malcolm Priestley
@@ -31,7 +31,7 @@ struct ix2505v_config {
 
 #if IS_REACHABLE(CONFIG_DVB_IX2505V)
 /**
- * Attach a ix2505v tuner to the supplied frontend structure.
+ * ix2505v_attach - Attach a ix2505v tuner to the supplied frontend structure.
  *
  * @fe: Frontend to attach to.
  * @config: pointer to &struct ix2505v_config
diff --git a/drivers/media/dvb-frontends/m88ds3103.h b/drivers/media/dvb-frontends/m88ds3103.h
index 46b722495e4c..e32b68c0df70 100644
--- a/drivers/media/dvb-frontends/m88ds3103.h
+++ b/drivers/media/dvb-frontends/m88ds3103.h
@@ -128,7 +128,7 @@ struct m88ds3103_config {
 #if defined(CONFIG_DVB_M88DS3103) || \
 		(defined(CONFIG_DVB_M88DS3103_MODULE) && defined(MODULE))
 /**
- * Attach a m88ds3103 demod
+ * m88ds3103_attach - Attach a m88ds3103 demod
  *
  * @config: pointer to &struct m88ds3103_config with demod configuration.
  * @i2c: i2c adapter to use.
diff --git a/drivers/media/dvb-frontends/mb86a20s.h b/drivers/media/dvb-frontends/mb86a20s.h
index 00a6b6e9b5e4..d20d22bf7580 100644
--- a/drivers/media/dvb-frontends/mb86a20s.h
+++ b/drivers/media/dvb-frontends/mb86a20s.h
@@ -26,7 +26,7 @@ struct mb86a20s_config {
 
 #if IS_REACHABLE(CONFIG_DVB_MB86A20S)
 /**
- * Attach a mb86a20s demod
+ * mb86a20s_attach - Attach a mb86a20s demod
  *
  * @config: pointer to &struct mb86a20s_config with demod configuration.
  * @i2c: i2c adapter to use.
diff --git a/drivers/media/dvb-frontends/stb6000.h b/drivers/media/dvb-frontends/stb6000.h
index 570a4b1d07d6..38da55af7ea9 100644
--- a/drivers/media/dvb-frontends/stb6000.h
+++ b/drivers/media/dvb-frontends/stb6000.h
@@ -15,7 +15,7 @@
 
 #if IS_REACHABLE(CONFIG_DVB_STB6000)
 /**
- * Attach a stb6000 tuner to the supplied frontend structure.
+ * stb6000_attach - Attach a stb6000 tuner to the supplied frontend structure.
  *
  * @fe: Frontend to attach to.
  * @addr: i2c address of the tuner.
diff --git a/drivers/media/dvb-frontends/tda826x.h b/drivers/media/dvb-frontends/tda826x.h
index bb575a251b04..e1d33edbb8ec 100644
--- a/drivers/media/dvb-frontends/tda826x.h
+++ b/drivers/media/dvb-frontends/tda826x.h
@@ -14,7 +14,7 @@
 #include <media/dvb_frontend.h>
 
 /**
- * Attach a tda826x tuner to the supplied frontend structure.
+ * tda826x_attach - Attach a tda826x tuner to the supplied frontend structure.
  *
  * @fe: Frontend to attach to.
  * @addr: i2c address of the tuner.
diff --git a/drivers/media/dvb-frontends/zl10036.h b/drivers/media/dvb-frontends/zl10036.h
index 91eea777eaf1..ad83e6344e7f 100644
--- a/drivers/media/dvb-frontends/zl10036.h
+++ b/drivers/media/dvb-frontends/zl10036.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * Driver for Zarlink ZL10036 DVB-S silicon tuner
  *
  * Copyright (C) 2006 Tino Reichardt
@@ -19,7 +19,7 @@ struct zl10036_config {
 
 #if IS_REACHABLE(CONFIG_DVB_ZL10036)
 /**
- * Attach a zl10036 tuner to the supplied frontend structure.
+ * zl10036_attach - Attach a zl10036 tuner to the supplied frontend structure.
  *
  * @fe: Frontend to attach to.
  * @config: zl10036_config structure.
diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 3a45c1fe4957..edd8edda0647 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -418,7 +418,7 @@ struct ipu3_uapi_af_config_s {
 	 IPU3_UAPI_AWB_FR_SPARE_FOR_BUBBLES) * IPU3_UAPI_MAX_STRIPES)
 
 /**
- * struct ipu3_uapi_awb_fr_meta_data - AWB filter response meta data
+ * struct ipu3_uapi_awb_fr_raw_buffer - AWB filter response meta data
  *
  * @meta_data: Statistics output on the grid after convolving with 1D filter.
  */
@@ -1506,7 +1506,7 @@ struct ipu3_uapi_sharp_cfg {
 } __packed;
 
 /**
- * struct struct ipu3_uapi_far_w - Sharpening config for far sub-group
+ * struct ipu3_uapi_far_w - Sharpening config for far sub-group
  *
  * @dir_shrp:	Weight of wide direct sharpening, u1.6, range [0, 64], default 64.
  * @reserved0:	reserved
@@ -1526,7 +1526,7 @@ struct ipu3_uapi_far_w {
 } __packed;
 
 /**
- * struct struct ipu3_uapi_unsharp_cfg - Unsharp config
+ * struct ipu3_uapi_unsharp_cfg - Unsharp config
  *
  * @unsharp_weight: Unsharp mask blending weight.
  *		    u1.6, range [0, 64], default 16.
@@ -1772,7 +1772,7 @@ struct ipu3_uapi_vss_lut_y {
 } __packed;
 
 /**
- * struct ipu3_uapi_yuvp1_iefd_vssnlm_cf - IEFd Vssnlm Lookup table
+ * struct ipu3_uapi_yuvp1_iefd_vssnlm_cfg - IEFd Vssnlm Lookup table
  *
  * @vss_lut_x: vss lookup table. See &ipu3_uapi_vss_lut_x description
  * @vss_lut_y: vss lookup table. See &ipu3_uapi_vss_lut_y description
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index e547cbeee431..b04a38be5183 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -321,7 +321,7 @@ int dvb_create_media_graph(struct dvb_adapter *adap,
 int dvb_generic_open(struct inode *inode, struct file *file);
 
 /**
- * dvb_generic_close - Digital TV close function, used by DVB devices
+ * dvb_generic_release - Digital TV close function, used by DVB devices
  *
  * @inode: pointer to &struct inode.
  * @file: pointer to &struct file.
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cb25f345e9ad..4fbace0fc7e5 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1292,7 +1292,7 @@ static inline void v4l2_ctrl_request_hdl_put(struct v4l2_ctrl_handler *hdl)
 }
 
 /**
- * v4l2_ctrl_request_ctrl_find() - Find a control with the given ID.
+ * v4l2_ctrl_request_hdl_ctrl_find() - Find a control with the given ID.
  *
  * @hdl: The control handler from the request.
  * @id: The ID of the control to find.
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index ad2d41952442..6a4afd4a7df2 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -43,8 +43,8 @@ enum vfl_devnode_type {
 };
 
 /**
- * enum  vfl_direction - Identifies if a &struct video_device corresponds
- *	to a receiver, a transmitter or a mem-to-mem device.
+ * enum  vfl_devnode_direction - Identifies if a &struct video_device
+ * 	corresponds to a receiver, a transmitter or a mem-to-mem device.
  *
  * @VFL_DIR_RX:		device is a receiver.
  * @VFL_DIR_TX:		device is a transmitter.
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 64ec4de948e9..8a8977a33ec1 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -174,7 +174,7 @@ int __must_check v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
 
 /**
- * __v4l2_device_register_ro_subdev_nodes - Registers device nodes for
+ * __v4l2_device_register_subdev_nodes - Registers device nodes for
  *      all subdevs of the v4l2 device that are marked with the
  *      %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
  *
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index 2cc0cabc124f..8fa963326bf6 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -224,7 +224,7 @@ static inline  bool can_reduce_fps(struct v4l2_bt_timings *bt)
 }
 
 /**
- * struct v4l2_hdmi_rx_colorimetry - describes the HDMI colorimetry information
+ * struct v4l2_hdmi_colorimetry - describes the HDMI colorimetry information
  * @colorspace:		enum v4l2_colorspace, the colorspace
  * @ycbcr_enc:		enum v4l2_ycbcr_encoding, Y'CbCr encoding
  * @quantization:	enum v4l2_quantization, colorspace quantization
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index c09074276543..4c1f213180dc 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -514,7 +514,7 @@ v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
 						   parse_endpoint_func parse_endpoint);
 
 /**
- * v4l2_fwnode_reference_parse_sensor_common - parse common references on
+ * v4l2_async_notifier_parse_fwnode_sensor_common - parse common references on
  *					       sensors for async sub-devices
  * @dev: the device node the properties of which are parsed for references
  * @notifier: the async notifier where the async subdevs will be added
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 59b1de197114..2014c5911aac 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -145,7 +145,7 @@ v4l2_fill_pix_format(struct v4l2_pix_format *pix_fmt,
 }
 
 /**
- * v4l2_fill_pix_format - Ancillary routine that fills a &struct
+ * v4l2_fill_mbus_format - Ancillary routine that fills a &struct
  *	v4l2_mbus_framefmt from a &struct v4l2_pix_format and a
  *	data format code.
  *
@@ -168,7 +168,7 @@ static inline void v4l2_fill_mbus_format(struct v4l2_mbus_framefmt *mbus_fmt,
 }
 
 /**
- * v4l2_fill_pix_format - Ancillary routine that fills a &struct
+ * v4l2_fill_pix_format_mplane - Ancillary routine that fills a &struct
  *	v4l2_pix_format_mplane fields from a media bus structure.
  *
  * @pix_mp_fmt:	pointer to &struct v4l2_pix_format_mplane to be filled
@@ -188,7 +188,7 @@ v4l2_fill_pix_format_mplane(struct v4l2_pix_format_mplane *pix_mp_fmt,
 }
 
 /**
- * v4l2_fill_pix_format - Ancillary routine that fills a &struct
+ * v4l2_fill_mbus_format_mplane - Ancillary routine that fills a &struct
  *	v4l2_mbus_framefmt from a &struct v4l2_pix_format_mplane.
  *
  * @mbus_fmt:	pointer to &struct v4l2_mbus_framefmt to be filled
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1de960bfcab9..d0e9a5bdb08b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -309,7 +309,7 @@ struct v4l2_subdev_audio_ops {
 };
 
 /**
- * enum v4l2_mbus_frame_desc_entry - media bus frame description flags
+ * enum v4l2_mbus_frame_desc_flags - media bus frame description flags
  *
  * @V4L2_MBUS_FRAME_DESC_FL_LEN_MAX:
  *	Indicates that &struct v4l2_mbus_frame_desc_entry->length field
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index bbb3f26fbde9..61969402a0e3 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1043,7 +1043,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
 size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
 		loff_t *ppos, int nonblock);
 /**
- * vb2_read() - implements write() syscall logic.
+ * vb2_write() - implements write() syscall logic.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @data:	pointed to target userspace buffer
  * @count:	number of bytes to write
-- 
2.26.2

