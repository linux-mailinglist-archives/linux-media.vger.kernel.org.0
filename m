Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D81B224C1D
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 16:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgGRO72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 10:59:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38052 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgGRO72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 10:59:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 196C72A5278
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/9] media: staging: rkisp1: remove unused field ctrl_handler from struct rkisp1_device
Date:   Sat, 18 Jul 2020 16:59:10 +0200
Message-Id: <20200718145918.17752-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The field ctrl_handler in struct rkisp1_device is not used.
This patch removes it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 2603a5aa5210..3f0621814696 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -255,7 +255,6 @@ struct rkisp1_device {
 	unsigned int clk_size;
 	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
 	struct v4l2_device v4l2_dev;
-	struct v4l2_ctrl_handler ctrl_handler;
 	struct media_device media_dev;
 	struct v4l2_async_notifier notifier;
 	struct rkisp1_sensor_async *active_sensor;
-- 
2.17.1

