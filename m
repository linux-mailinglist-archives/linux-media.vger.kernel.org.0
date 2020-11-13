Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7FB2B278A
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 22:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgKMVwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 16:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgKMVvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 16:51:53 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807E2C0613D1;
        Fri, 13 Nov 2020 13:51:53 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 846771F46BB5
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 4/9] media: Clean stateless control includes
Date:   Fri, 13 Nov 2020 18:51:16 -0300
Message-Id: <20201113215121.505173-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113215121.505173-1-ezequiel@collabora.com>
References: <20201113215121.505173-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid including h264-ctrls.h, vp8-ctrls.h, etc,
and instead just include v4l2-ctrls.h which does the right
thing.

This is in preparation for moving the stateless controls
out of staging, which will mean removing some of these headers.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_hw.h | 4 +---
 include/media/v4l2-h264.h                | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 219283a06f52..34c9e4649a25 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -11,9 +11,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/v4l2-controls.h>
-#include <media/h264-ctrls.h>
-#include <media/mpeg2-ctrls.h>
-#include <media/vp8-ctrls.h>
+#include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
 
 #define DEC_8190_ALIGN_MASK	0x07U
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index f08ba181263d..d2314f4d4490 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -10,7 +10,7 @@
 #ifndef _MEDIA_V4L2_H264_H
 #define _MEDIA_V4L2_H264_H
 
-#include <media/h264-ctrls.h>
+#include <media/v4l2-ctrls.h>
 
 /**
  * struct v4l2_h264_reflist_builder - Reference list builder object
-- 
2.27.0

