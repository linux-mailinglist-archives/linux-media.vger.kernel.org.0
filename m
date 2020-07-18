Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51803224C24
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 16:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGRO7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 10:59:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgGRO7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 10:59:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 176012A2789
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 8/9] media: staging: rkisp1: group declaration of similar functions together
Date:   Sat, 18 Jul 2020 16:59:17 +0200
Message-Id: <20200718145918.17752-9-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In file rkisp1-common.h, group declaration of register/unregister
functions together and group other functions together to make
the code easier to read.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index d18f901de70c..67419cf1a739 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -304,11 +304,13 @@ void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
 void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
 			   const struct v4l2_mbus_framefmt *bounds);
 
-int rkisp1_isp_register(struct rkisp1_device *rkisp1);
-void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
-
 const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
 
+void rkisp1_params_configure(struct rkisp1_params *params,
+			     enum rkisp1_fmt_raw_pat_type bayer_pat,
+			     enum v4l2_quantization quantization);
+void rkisp1_params_disable(struct rkisp1_params *params);
+
 void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
 void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
 void rkisp1_capture_isr(struct rkisp1_device *rkisp1);
@@ -318,16 +320,15 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis);
 int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1);
 void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
 
+int rkisp1_isp_register(struct rkisp1_device *rkisp1);
+void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
+
 int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1);
 void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1);
 
 int rkisp1_stats_register(struct rkisp1_device *rkisp1);
 void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
 
-void rkisp1_params_configure(struct rkisp1_params *params,
-			     enum rkisp1_fmt_raw_pat_type bayer_pat,
-			     enum v4l2_quantization quantization);
-void rkisp1_params_disable(struct rkisp1_params *params);
 int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
-- 
2.17.1

