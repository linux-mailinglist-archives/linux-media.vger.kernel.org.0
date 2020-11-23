Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7C52C0DE2
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbgKWOki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:40:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34888 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729573AbgKWOkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:40:37 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 24CD71F449A7
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
Subject: [PATCH v4 05/13] media: Clean stateless control includes
Date:   Mon, 23 Nov 2020 11:39:52 -0300
Message-Id: <20201123144000.81310-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201123144000.81310-1-ezequiel@collabora.com>
References: <20201123144000.81310-1-ezequiel@collabora.com>
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

