Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180A84E5FD2
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 09:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348766AbiCXIDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 04:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348780AbiCXICx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 04:02:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651C799ED5
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 01:01:22 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D87714CD;
        Thu, 24 Mar 2022 09:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648108879;
        bh=rsVji2hD+87e+gDSymMZyQMGnzaMwO7BqmYRfTVlu5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g8xlOJ9Ga8NHejdWZOOQdKoWw9wUm45zuGjmqyxnRtrQ9fSUMJ29ij8FZRT42waod
         n/CxJIcc/YX5PzywfPIkzxTzzggwKcjgLgkzYzcNf3fCal2qqTvhYZ0VEeR0940Izx
         zKrN+j4pxb1RUC6R4DbxbN7SZsAOFIOmjRFzHYTw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 3/8] media: subdev: add v4l2_subdev_get_pad_* helpers
Date:   Thu, 24 Mar 2022 10:00:25 +0200
Message-Id: <20220324080030.216716-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
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

The subdev state is now used for both try and active cases. We should
rename v4l2_subdev_get_try_* helpers to v4l2_subdev_get_pad_*, but due
to the size of that change lets add temporary wrapper helpers which can
be used in drivers that support active state.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1bbe4383966c..b9587a265b32 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1042,6 +1042,16 @@ v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
 	return &state->pads[pad].try_compose;
 }
 
+/* Temprary helpers until v4l2_subdev_get_try_* functions have been renamed */
+#define v4l2_subdev_get_pad_format(sd, state, pad) \
+	v4l2_subdev_get_try_format(sd, state, pad)
+
+#define v4l2_subdev_get_pad_crop(sd, state, pad) \
+	v4l2_subdev_get_try_crop(sd, state, pad)
+
+#define v4l2_subdev_get_pad_compose(sd, state, pad) \
+	v4l2_subdev_get_try_compose(sd, state, pad)
+
 #endif
 
 extern const struct v4l2_file_operations v4l2_subdev_fops;
-- 
2.25.1

