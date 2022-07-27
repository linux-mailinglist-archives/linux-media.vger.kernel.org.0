Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBAF582491
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiG0Khw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiG0Khn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6760446DBB
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:41 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 937F11BDB;
        Wed, 27 Jul 2022 12:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918239;
        bh=E/VaKR5rgwwGxhr6JP3rtVHNZW0A41gM75YrOLo/4do=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BQf+Ph0/Y4KmVNUuRbuUcjCfMj0EHHEmh7Kqr4OlvJsG0bOdbB7qr2YTeUaQrRBcb
         2EOhECxj7UTdQ110s6X0a/UkU1kb0lL0mgHM35YFdULuuoo8KFcq4+DzbNGqM7n9wJ
         YNLa6ugK/xyEp1mxbxYNh7pzRISJvXt2xmKxZPaE=
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
Subject: [PATCH v12 29/30] media: Add stream to frame descriptor
Date:   Wed, 27 Jul 2022 13:36:38 +0300
Message-Id: <20220727103639.581567-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

The stream field identifies the stream this frame descriptor applies to in
routing configuration across a multiplexed link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e39e61d8f431..631e6784fb76 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -342,6 +342,7 @@ enum v4l2_mbus_frame_desc_flags {
  * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
  *
  * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
+ * @stream:	stream in routing configuration
  * @pixelcode:	media bus pixel code, valid if @flags
  *		%FRAME_DESC_FL_BLOB is not set.
  * @length:	number of octets per frame, valid if @flags
@@ -351,6 +352,7 @@ enum v4l2_mbus_frame_desc_flags {
  */
 struct v4l2_mbus_frame_desc_entry {
 	enum v4l2_mbus_frame_desc_flags flags;
+	u32 stream;
 	u32 pixelcode;
 	u32 length;
 	union {
-- 
2.34.1

