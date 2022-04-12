Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10A14FDCD8
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiDLKrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356952AbiDLKpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABC55C849
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:43:21 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19351494;
        Tue, 12 Apr 2022 11:43:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649756599;
        bh=1I/lb2foFvhgtcFvLkOH7c5wTPWxLZSvgXE5f+z3D5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eusrSKDdqsnzf5TuOpSMHFyYYGttk7sr8YYj0Iw3YZR3kb0B/PgJ82XkeMjSWVmvf
         WQHuQFfS4jRYHRjw1etq3CMfcO+dDgIFFT+L/riRSSnerni1IXy6svFKurE+/ZKkyN
         vHpoDyMKwfPGL0YqcTw/Xnoc1bTiw4YUhm/KpGyA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 01/10] media: v4l2-subdev: fix #endif comments
Date:   Tue, 12 Apr 2022 12:42:40 +0300
Message-Id: <20220412094249.695754-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
References: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
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

Add comments after #endifs to clarify their scope.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6c153b33bb04..a986fdd652e6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1023,7 +1023,7 @@ v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
 	return &state->pads[pad].try_compose;
 }
 
-#endif
+#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 extern const struct v4l2_file_operations v4l2_subdev_fops;
 
@@ -1204,4 +1204,4 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 			      const struct v4l2_event *ev);
 
-#endif
+#endif /* _V4L2_SUBDEV_H */
-- 
2.25.1

