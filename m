Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D338B9AF5F
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbfHWM0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:26:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbfHWM0h (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:26:37 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B74CC21848;
        Fri, 23 Aug 2019 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566563196;
        bh=ypX1o2hsCuFhuHU1jRTYCJPB+2mmYAusUPZwUYutOEU=;
        h=From:To:Cc:Subject:Date:From;
        b=N//QOvIGXpermGaHXdkc+saq9orHM12iIj1Oi8bs3n86Nf4QJ8dt7eGg1zswdtcwO
         yJKIVRyFYIx5j2dT07NE/kDUo88ce4U6lWJn3u/xJfso2b9RFC2KvqQYvw7xAeywis
         KMbW6gT1AHZUxvxtm1kemzr14n0dWuA8iH/uRCFM=
From:   Maxime Ripard <mripard@kernel.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: sun4i: Make sun4i_csi_formats static
Date:   Fri, 23 Aug 2019 14:26:32 +0200
Message-Id: <20190823122632.30610-1-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The sun4i_csi_formats array is only used in sun4i_v4l2.c, so it doesn't
make any sense to have it !static.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 772b0fc5920f..967bdb99221c 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -18,7 +18,7 @@
 #define CSI_DEFAULT_WIDTH	640
 #define CSI_DEFAULT_HEIGHT	480
 
-const struct sun4i_csi_format sun4i_csi_formats[] = {
+const static struct sun4i_csi_format sun4i_csi_formats[] = {
 	/* YUV422 inputs */
 	{
 		.mbus		= MEDIA_BUS_FMT_YUYV8_2X8,
-- 
2.21.0

