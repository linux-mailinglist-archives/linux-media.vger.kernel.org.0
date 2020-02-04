Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196E115220A
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 22:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgBDVp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 16:45:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44040 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgBDVp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 16:45:26 -0500
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:ad1c:28d4:5c9b:1c04:c661])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 68001294288;
        Tue,  4 Feb 2020 21:45:24 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH] media: staging: rkisp1: improve inner documentation in rkisp1-isp.c
Date:   Tue,  4 Feb 2020 22:44:46 +0100
Message-Id: <20200204214446.20381-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
References: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the documentation in the beginning of the file
rkisp1-isp1.c

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-isp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 2b0513e826fe..844556389b0b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -28,9 +28,9 @@
 #define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
 
 /*
- * NOTE: MIPI controller and input MUX are also configured in this file,
- * because ISP Subdev is not only describe ISP submodule(input size,format,
- * output size, format), but also a virtual route device.
+ * NOTE: MIPI controller and input MUX are also configured in this file.
+ * This is because ISP Subdev describes not only ISP submodule (input size,
+ * format, output size, format), but also a virtual route device.
  */
 
 /*
-- 
2.17.1

