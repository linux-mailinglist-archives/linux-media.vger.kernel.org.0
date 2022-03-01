Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAC24C8FCE
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbiCAQN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236032AbiCAQN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5253BA79
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:46 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 081DC1AD5;
        Tue,  1 Mar 2022 17:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151154;
        bh=TkRs61F7WgYG0QhTkQTWgO0PvAqBwta7u7B1aGUf9Lg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=odIGQMyx09PeYXQniWMrARMhZ+MQSbbDPUXlbFvuSTqN8Qf+ssJvarBpQcml9htB3
         hDOqvkLWAxqJdPZFjgwcOE4451nIUtImrHrdSOvgkGB5eRJoXjQUFRBG4m0odeNjQk
         vNTKfnBfaFIEpyPQqekdojHkCcAqpxg36poW405I=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 16/36] media: Add CSI-2 bus configuration to frame descriptors
Date:   Tue,  1 Mar 2022 18:11:36 +0200
Message-Id: <20220301161156.1119557-17-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Add CSI-2 bus specific configuration to the frame descriptors. This allows
obtaining the virtual channel and data type information for each stream
the transmitter is sending.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 3e3d8cfa7df4..4758dea60cfb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -312,6 +312,17 @@ struct v4l2_subdev_audio_ops {
 	int (*s_stream)(struct v4l2_subdev *sd, int enable);
 };
 
+/**
+ * struct v4l2_mbus_frame_desc_entry_csi2
+ *
+ * @vc: CSI-2 virtual channel
+ * @dt: CSI-2 data type ID
+ */
+struct v4l2_mbus_frame_desc_entry_csi2 {
+	u8 vc;
+	u8 dt;
+};
+
 /**
  * enum v4l2_mbus_frame_desc_flags - media bus frame description flags
  *
@@ -335,11 +346,16 @@ enum v4l2_mbus_frame_desc_flags {
  *		%FRAME_DESC_FL_BLOB is not set.
  * @length:	number of octets per frame, valid if @flags
  *		%V4L2_MBUS_FRAME_DESC_FL_LEN_MAX is set.
+ * @bus:	Bus-specific frame descriptor parameters
+ * @bus.csi2:	CSI-2-specific bus configuration
  */
 struct v4l2_mbus_frame_desc_entry {
 	enum v4l2_mbus_frame_desc_flags flags;
 	u32 pixelcode;
 	u32 length;
+	union {
+		struct v4l2_mbus_frame_desc_entry_csi2 csi2;
+	} bus;
 };
 
 #define V4L2_FRAME_DESC_ENTRY_MAX	4
-- 
2.25.1

