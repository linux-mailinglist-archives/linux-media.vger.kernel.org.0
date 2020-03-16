Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F8218655E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 08:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729836AbgCPHBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 03:01:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44802 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbgCPHBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 03:01:46 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:ad1c:bc0f:a2f4:ae8d:5d99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4644828D80F;
        Mon, 16 Mar 2020 07:01:44 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: v4l2-common: Add BGR666 to v4l2_format_info
Date:   Mon, 16 Mar 2020 08:01:23 +0100
Message-Id: <20200316070123.2434-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_PIX_FMT_BGR666 to the format table.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
Hi,
BGR66 is needed for the rkisp1 driver.
Currently it crashes since the call to
v4l2_format_info returns NULL.

 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index d0e5ebc736f9..d7f82b2aa22f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -253,6 +253,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 
 		/* YUV packed formats */
 		{ .format = V4L2_PIX_FMT_YUYV,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
-- 
2.17.1

