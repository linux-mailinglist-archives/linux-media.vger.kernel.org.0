Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E996438A5
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387590AbfFMPHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:07:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54480 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733077AbfFMPHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:07:07 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:d9b5:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D218D28389F;
        Thu, 13 Jun 2019 16:07:03 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 1/4] media: vimc: debayer: Fix typos
Date:   Thu, 13 Jun 2019 12:06:13 -0300
Message-Id: <20190613150616.19336-2-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613150616.19336-1-andrealmeid@collabora.com>
References: <20190613150616.19336-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo on "tranforming". Add a line break so it keeps under 80 columns.
Fix typo on "[it] need".

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 drivers/media/platform/vimc/vimc-debayer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 310c0d0eefa2..00598fbf3cba 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -16,14 +16,16 @@
 #include "vimc-common.h"
 
 #define VIMC_DEB_DRV_NAME "vimc-debayer"
-/* This module only supports tranforming a bayer format to V4L2_PIX_FMT_RGB24 */
+/* This module only supports transforming a bayer format
+ * to V4L2_PIX_FMT_RGB24
+ */
 #define VIMC_DEB_SRC_PIXFMT V4L2_PIX_FMT_RGB24
 #define VIMC_DEB_SRC_MBUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
 
 static unsigned int deb_mean_win_size = 3;
 module_param(deb_mean_win_size, uint, 0000);
 MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
-	"NOTE: the window size need to be an odd number, as the main pixel "
+	"NOTE: the window size needs to be an odd number, as the main pixel "
 	"stays in the center of the window, otherwise the next odd number "
 	"is considered");
 
-- 
2.22.0

