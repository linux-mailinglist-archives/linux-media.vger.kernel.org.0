Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9040563432
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 15:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiGANQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 09:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiGANQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 09:16:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9AD57248
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 06:16:22 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3460E25C;
        Fri,  1 Jul 2022 15:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656681379;
        bh=BTAsJ88TkOoNMvV7flDaA1+vqyaiHi9S7sUfqiTFoVg=;
        h=From:To:Cc:Subject:Date:From;
        b=YRPEK0dhk8L08X7kFcH/IwAJm2rfzyL+2V5xXRp5lE1RThW4c+PpGYjEj60uL66Kc
         C3L+Sbr4gvoZah7iU1RKMwX/LLHZDUcLbOeEn1NiKlmKSWeDy4Da2Owrm6FfCxuApL
         tYsKdtmeVFXBnHVwO5CJbA+raYiygWZ1WyFF45fU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 1/2] media: subdev: Add v4l2_subdev_call_state_try() macro
Date:   Fri,  1 Jul 2022 16:15:58 +0300
Message-Id: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Add a helper macro for the situations where a non-MC driver needs to
call a state-operation (operation which takes a subdev state as a
parameter) in try-context in another subdev.

The macro allocates a new subdev state for the called subdev and frees
the state afterwards.

An example use case is a media platform driver testing if a
v4l2_subdev_format would be accepted by a source subdev.

This should not be used in MC drivers.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b661e1817470..9689f38a0af1 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1433,6 +1433,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		__result;						\
 	})
 
+/**
+ * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
+ *				takes state as a parameter, passing the
+ *				subdev a newly allocated try state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call_state_active(), except that as this
+ * version allocates a new state, this is only usable for
+ * V4L2_SUBDEV_FORMAT_TRY use cases.
+ *
+ * Note: only legacy non-MC drivers may need this macro.
+ */
+#define v4l2_subdev_call_state_try(sd, o, f, args...)                 \
+	({                                                            \
+		int __result;                                         \
+		static struct lock_class_key __key;                   \
+		const char *name = KBUILD_BASENAME                    \
+			":" __stringify(__LINE__) ":state->lock";     \
+		struct v4l2_subdev_state *state =                     \
+			__v4l2_subdev_state_alloc(sd, name, &__key);  \
+		v4l2_subdev_lock_state(state);                        \
+		__result = v4l2_subdev_call(sd, o, f, state, ##args); \
+		v4l2_subdev_unlock_state(state);                      \
+		__v4l2_subdev_state_free(state);                      \
+		__result;                                             \
+	})
+
 /**
  * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
  *
-- 
2.34.1

