Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50574B885E
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 14:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbiBPNBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 08:01:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233604AbiBPNBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 08:01:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64ED5AE57
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 05:01:25 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C6E51849;
        Wed, 16 Feb 2022 14:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645016479;
        bh=ccJu2MvJe6gkleJXFhVgOC0CNmfKau7ARGHRNXXJzq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vzoZLTGO6gVOVTX43Z7JOxfqozvvxOVnA08eWqveS1L1c+3jfDpAkkDWezSupziVG
         l6cWB7q2lXI+7mAwUcHPWjA1w/AYrdNJ3mYyIh55H8npebZm/D5Xl+CSqyUySKabo3
         ZjpIFsYobXp8WHwj9CwmDQ1hAFdAkNdGrUjlM4K8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Date:   Wed, 16 Feb 2022 15:00:48 +0200
Message-Id: <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2_subdev_call_state_active() macro to help calling subdev ops
that take a subdev state as a parameter.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 84c02488d53f..0db61203c8d9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1359,6 +1359,37 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		__result;						\
 	})
 
+/**
+ * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
+ *				   takes state as a parameter, passing the
+ *				   subdev its active state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call(), except that this version can only be
+ * used for ops that take a subdev state as a parameter. The macro will get the
+ * active state and lock it before calling the op, and unlock it after the
+ * call.
+ */
+#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
+	({								\
+		int __result;						\
+		struct v4l2_subdev_state *state;			\
+		state = v4l2_subdev_get_active_state(sd);		\
+		if (state)						\
+			v4l2_subdev_lock_state(state);			\
+		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
+		if (state)						\
+			v4l2_subdev_unlock_state(state);		\
+		__result;						\
+	})
+
 /**
  * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
  *
-- 
2.25.1

