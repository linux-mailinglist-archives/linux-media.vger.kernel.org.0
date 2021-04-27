Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFF136C655
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237801AbhD0MrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbhD0MrD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:47:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93924C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:46:20 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64DFAB75;
        Tue, 27 Apr 2021 14:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527579;
        bh=kszchnyskFxCoPxl7A28LuAVhce3Be/pobf5YCMyRXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N2zmjUg4q6cmvqJUqXPC+DDRiYADMmeW/0v+u0hhQvu7lsyudNR8CivhaArz6omVs
         XvaO1FFdQ+8a2BihjPesJ0PyyX+CU/BjE5UdatyeQNnjepkGuD+dIfKjSA889zBqyl
         gnyXRMduCYvOK9zfNCNw4PlZVPAuTTY1OHAIx3tk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 17/24] v4l: Add stream to frame descriptor
Date:   Tue, 27 Apr 2021 15:45:16 +0300
Message-Id: <20210427124523.990938-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
index 695e97b6eb13..70a21298020b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -338,6 +338,7 @@ enum v4l2_mbus_frame_desc_flags {
  * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
  *
  * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
+ * @stream:	stream in routing configuration
  * @pixelcode:	media bus pixel code, valid if @flags
  *		%FRAME_DESC_FL_BLOB is not set.
  * @length:	number of octets per frame, valid if @flags
@@ -347,6 +348,7 @@ enum v4l2_mbus_frame_desc_flags {
  */
 struct v4l2_mbus_frame_desc_entry {
 	enum v4l2_mbus_frame_desc_flags flags;
+	u32 stream;
 	u32 pixelcode;
 	u32 length;
 	union {
-- 
2.25.1

