Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E2736C65E
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237872AbhD0MrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237845AbhD0MrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:47:11 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 862C5E78;
        Tue, 27 Apr 2021 14:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527586;
        bh=BLhC60nvmx+cCkc+a3Q1VWzu71eRPXk4Gzpe9uLQ0GY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gzax9qHY8c3kZRkuZGffCytrj1gmLv3EOAdohx97PVG9KhAjKdSqOpcfVzucYL/9Q
         fr0jfPPjDdfHKkveqOZ3cQrDd/J7p0Bsm2FRD3AhvMJxB5PT+Se6NubViEdTfN+Nxe
         AUr1YdgPL/+mKUSgjc2/k80baOtO+FXT7OASj4JY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 24/24] v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
Date:   Tue, 27 Apr 2021 15:45:23 +0300
Message-Id: <20210427124523.990938-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
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
index 9025ef3a67f5..8e2b990b06ff 100644
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

