Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC7E50A282
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389293AbiDUOdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389503AbiDUOcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:32:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0B5403F8
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:29:37 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BF76501;
        Thu, 21 Apr 2022 16:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551373;
        bh=yA2Tz0nLoqGWfk6Llss6oy1f/zOKDDTOFHM3Rm8CEmc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EMZDPeuuPjSJr1IUPBr3lJNs73nn6Bl4o3EylzRYwPOQuaowNblzaGB3I5ABhPJBj
         56rUwtQ4Opj3MlbzOLlGeTeFdwBQkujMjMeSgfJq0+bIqNowJFrS3K9I4CQjM88nOA
         R1lzTLollogilzrm2HZ00gnPJZawv/+00iGOZqHk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 2/3] media: Add CSI-2 bus configuration to frame descriptors
Date:   Thu, 21 Apr 2022 17:29:05 +0300
Message-Id: <20220421142906.527918-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421142906.527918-1-tomi.valkeinen@ideasonboard.com>
References: <20220421142906.527918-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index 16d6559f81ed..e6b24bbdd6b6 100644
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

