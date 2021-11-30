Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AEB46366B
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242160AbhK3OU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242100AbhK3OUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:13 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56E0118FC;
        Tue, 30 Nov 2021 15:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281811;
        bh=z0mlEN1C6Eoa6dvCqKceIdOWnPiqv/CjGeXXNJUWe+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V8uMSEP4ZtjbYAp3NvuurrlU+xJqNfvZbE2Cs5fQn45VEYfeEZoNKUPXED6lZcydG
         ua0egfig8suFdL3RFJ6tfR5SwXIEniSx6c4RgAmc12wCZz+acQgUhc//5AWSJI8mB8
         pW9wXGFESa7ScH7kRnTARUpQ8uqxgz9XvNGXbOBo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 24/38] media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
Date:   Tue, 30 Nov 2021 16:15:22 +0200
Message-Id: <20211130141536.891878-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/v4l2-subdev.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2921885eb390..a82fc74f4646 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -360,7 +360,11 @@ struct v4l2_mbus_frame_desc_entry {
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

