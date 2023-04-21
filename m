Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BCF6EAABF
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 14:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbjDUMqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 08:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjDUMqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 08:46:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D315F9031
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 05:46:22 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 121A44C5A;
        Fri, 21 Apr 2023 14:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682081081;
        bh=jf04JugfyOzDyGBA0B2oyjcujsuE/Oms/62VNIVFa3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Aczi91xMJHTTFexRZfFLGWkkUUNQoDtqZxzVTZajCZtY8o6EoQHRU3BgyexUA18kT
         mN74k40Blwhi+w1JkEHfvaXRG0Mjf5XnQtUlCr5bxdQuQewiDI97vRKiUeBnKuMCSp
         lMJhhu2HMD60phrmDcfyUmZaUnntz/27E5pdUBP4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 5/8] HACK: include/linux: Add client capabilities
Date:   Fri, 21 Apr 2023 15:44:25 +0300
Message-Id: <20230421124428.393261-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add client capabilities related hanges to include/linux/v4l2-subdev.h.
This should be dropped when the v4l-utils kernel headers are updated to
the version which contains client capabilities.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/linux/v4l2-subdev.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
index 654d659d..4a195b68 100644
--- a/include/linux/v4l2-subdev.h
+++ b/include/linux/v4l2-subdev.h
@@ -233,6 +233,24 @@ struct v4l2_subdev_routing {
 	__u32 reserved[6];
 };
 
+/*
+ * The client is aware of streams. Setting this flag enables the use of 'stream'
+ * fields (referring to the stream number) with various ioctls. If this is not
+ * set (which is the default), the 'stream' fields will be forced to 0 by the
+ * kernel.
+ */
+ #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
+
+/**
+ * struct v4l2_subdev_client_capability - Capabilities of the client accessing
+ *					  the subdev
+ *
+ * @capabilities: A bitmask of V4L2_SUBDEV_CLIENT_CAP_* flags.
+ */
+struct v4l2_subdev_client_capability {
+	__u64 capabilities;
+};
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
@@ -250,6 +268,9 @@ struct v4l2_subdev_routing {
 #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
 #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
 #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
+#define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
+#define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
+
 /* The following ioctls are identical to the ioctls in videodev2.h */
 #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)
 #define VIDIOC_SUBDEV_S_STD			_IOW('V', 24, v4l2_std_id)
-- 
2.34.1

