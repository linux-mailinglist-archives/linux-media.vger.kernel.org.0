Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2A938E45E
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhEXKqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbhEXKqL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:11 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31F3929E7;
        Mon, 24 May 2021 12:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853081;
        bh=KGVWNJkLK0WTSWwGu5GLwvPEjSqrBhPVJT9eydufCZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qJ1D6ZiLJIpxTaljfd5lsvhQT0MyhwqLzUIm8J4tXj7inWKvta/XFIlNFRSJYUyeN
         lWmiyPvpbG/iY6TbU+zKg1VTt0+aNs9FW3NFcpJkUo3kpZKJeokC6z0849+ylINAaV
         qfyFbbWryELo65F9nXgwtOECbAhov0pwKyeM/HmU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 17/27] v4l: Add stream to frame descriptor
Date:   Mon, 24 May 2021 13:43:58 +0300
Message-Id: <20210524104408.599645-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
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
index 59effa111150..b0e7a0e53276 100644
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

