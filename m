Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F3B38E468
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhEXKq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhEXKqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:20 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ADF7182C;
        Mon, 24 May 2021 12:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853092;
        bh=18K5a+47ju4e8LPOcazolgEo2Raed/rDQyj5qzhlN7o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LUMXJS9aGueaOunV49JttQEJXA2R5O9aLmtLUPDG3DPDOzbBkITUbM1QkfJhMh4sg
         85zt0UXE/EGY2qDen46m1i+VqanrGH58FjZ0EH/EFTEWm0lZFzpcWHT+yxj/z0tdpU
         ZdRhhsXRlaNVJQSHj5tsrz7enOVk0zVQJmZrP8R8=
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
Subject: [PATCH v7 27/27] v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
Date:   Mon, 24 May 2021 13:44:08 +0300
Message-Id: <20210524104408.599645-28-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
 include/media/v4l2-subdev.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f448e7447ff5..3bbc927cedb2 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -356,7 +356,11 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
-#define V4L2_FRAME_DESC_ENTRY_MAX	4
+ /*
+  * FIXME: If this number is too small, it should be dropped altogether and the
+  * API switched to a dynamic number of frame descriptor entries.
+  */
+#define V4L2_FRAME_DESC_ENTRY_MAX	8
 
 /**
  * enum v4l2_mbus_frame_desc_type - media bus frame description type
-- 
2.25.1

