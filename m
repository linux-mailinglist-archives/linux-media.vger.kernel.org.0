Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F08CF58247D
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbiG0KhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbiG0KhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0916474D1
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:10 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9144811C7;
        Wed, 27 Jul 2022 12:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918224;
        bh=gmGSh5DlClE7ANTxVhSvjXsLMIfEFXhaeMrPpQMsgto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uWDofgjc2kbqlX8P3HEkT3CFRFzAE8bcInmfiIobpR1eXZK7tnvjJh8j56duUl6B1
         SjQsNP+D6zsjudDhmLaxPZUwqgCYukvL355Ait15tP0d+go+YhMO+rs/Shp8e4vCmq
         hfNP8qSreQMDvNRK+bU/FSXrTxSXaX5NfcI7f74o=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 10/30] media: add V4L2_SUBDEV_FL_STREAMS
Date:   Wed, 27 Jul 2022 13:36:19 +0300
Message-Id: <20220727103639.581567-11-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add subdev flag V4L2_SUBDEV_FL_STREAMS. It is used to indicate that the
subdev supports the new API with multiplexed streams (routing, stream
configs).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b661e1817470..56735dfbb6b5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -875,6 +875,17 @@ struct v4l2_subdev_internal_ops {
  * should set this flag.
  */
 #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
+/*
+ * Set this flag if this subdev supports multiplexed streams. This means
+ * that the driver supports routing and handles the stream parameter in its
+ * v4l2_subdev_pad_ops handlers. More specifically, this means:
+ *
+ * - Centrally managed subdev active state is enabled
+ * - Legacy pad config is _not_ supported (state->pads is NULL)
+ * - Routing ioctls are available
+ * - Multiple streams per pad are supported
+ */
+#define V4L2_SUBDEV_FL_STREAMS			(1U << 4)
 
 struct regulator_bulk_data;
 
-- 
2.34.1

