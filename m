Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39851815D4
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 11:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfHEJsf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 05:48:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51522 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfHEJse (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 05:48:34 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 04E5428A2CC;
        Mon,  5 Aug 2019 10:48:31 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH 2/5] media: v4l2: Prepare things for addition of m2m codec helpers
Date:   Mon,  5 Aug 2019 11:48:24 +0200
Message-Id: <20190805094827.11205-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805094827.11205-1-boris.brezillon@collabora.com>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, all m2m helper are in v4l2-mem2mem.c, but we are about to
had new helpers for codec devices and we want to make them optional
while still having all m2m helpers embedded in a single module
(v4l2-mem2mem.ko).

Move the existing code base in v4l2-mem2mem-core.c so we can easily
add new .o objects to the v4l2-mem2mem.o object.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/media/v4l2-core/Makefile                                | 1 +
 drivers/media/v4l2-core/{v4l2-mem2mem.c => v4l2-mem2mem-core.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/media/v4l2-core/{v4l2-mem2mem.c => v4l2-mem2mem-core.c} (100%)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 4d42418e603e..a8f8117a788f 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
 
 obj-$(CONFIG_VIDEO_TUNER) += tuner.o
 
+v4l2-mem2mem-y = v4l2-mem2mem-core.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem-core.c
similarity index 100%
rename from drivers/media/v4l2-core/v4l2-mem2mem.c
rename to drivers/media/v4l2-core/v4l2-mem2mem-core.c
-- 
2.21.0

