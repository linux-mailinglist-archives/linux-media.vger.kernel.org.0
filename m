Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF3C5A7FC3
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbiHaOPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbiHaOPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07522D9D40
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:14:31 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69F31749;
        Wed, 31 Aug 2022 16:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955258;
        bh=bxT/xqWUXKuMItMBRPe7APOWqyVLMlQyX/40UB025IQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vk3hcfAfluhYUtLZDidm/mKZZ+oySjQvsKMOMhD+Mv0Cwy5dApwbOYVAv1uF59FPS
         b0fDNkzmIuJPGgtoTI0if0eDBuyoc9yasK+l1n4mSzD2SumZGn/494cAlgaMAMeLST
         sLGjXfvrg/cfyTwilOjn5iZJqj+oMqJNzMBIK8SY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 03/34] media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
Date:   Wed, 31 Aug 2022 17:13:26 +0300
Message-Id: <20220831141357.1396081-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
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

V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
to have an arbitrary amount of streams in a single pad, so preferably
there should be no hardcoded maximum number.

However, I believe a reasonable max is 8, which would cover a CSI-2 pad
with 4 streams of pixel data and 4 streams of metadata.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9689f38a0af1..3797b99bb408 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -358,7 +358,11 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
-#define V4L2_FRAME_DESC_ENTRY_MAX	4
+ /*
+  * If this number is too small, it should be dropped altogether and the
+  * API switched to a dynamic number of frame descriptor entries.
+  */
+#define V4L2_FRAME_DESC_ENTRY_MAX	8
 
 /**
  * enum v4l2_mbus_frame_desc_type - media bus frame description type
-- 
2.34.1

