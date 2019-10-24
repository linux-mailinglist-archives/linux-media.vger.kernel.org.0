Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8010E345E
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 15:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502576AbfJXNfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 09:35:48 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33873 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502516AbfJXNfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 09:35:48 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iNdHG-0003MK-FJ; Thu, 24 Oct 2019 15:35:46 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        kernel@pengutronix.de
Subject: [PATCH] media: s5p-jpeg: drop unused components from s5p_jpeg_q_data
Date:   Thu, 24 Oct 2019 15:35:44 +0200
Message-Id: <20191024133544.3364-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The number of components are only set, and never used.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 1 -
 drivers/media/platform/s5p-jpeg/jpeg-core.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 8dbbd5f2a40a..ac2162235cef 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -1236,7 +1236,6 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 	}
 	result->sof = sof;
 	result->sof_len = sof_len;
-	result->components = components;
 
 	return true;
 }
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.h b/drivers/media/platform/s5p-jpeg/jpeg-core.h
index 3bc52f83f5bc..4407fe775afa 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.h
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.h
@@ -190,7 +190,6 @@ struct s5p_jpeg_marker {
  * @dqt:	DQT markers' positions relative to the buffer beginning
  * @sof:	SOF0 marker's position relative to the buffer beginning
  * @sof_len:	SOF0 marker's payload length (without length field itself)
- * @components:	number of image components
  * @size:	image buffer size in bytes
  */
 struct s5p_jpeg_q_data {
@@ -202,7 +201,6 @@ struct s5p_jpeg_q_data {
 	struct s5p_jpeg_marker	dqt;
 	u32			sof;
 	u32			sof_len;
-	u32			components;
 	u32			size;
 };
 
-- 
2.20.1

