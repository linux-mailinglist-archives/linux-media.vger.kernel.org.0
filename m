Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEFF46BA8B
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 12:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbhLGMDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:03:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33184 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235764AbhLGMDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:03:20 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1230:3700:b039:4e10:9830:879f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 190F81F44ED0;
        Tue,  7 Dec 2021 11:59:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638878389; bh=OEV1vNluaXw8fSoHvFxjYXqnPMZ5PL4/MPMZK6u4Rb8=;
        h=From:To:Cc:Subject:Date:From;
        b=khsvb647YPUnQdCeXr6rIL+UGEksYoC100dOeF82um0aXTIH+X75aLMuNwqVyIO12
         Vk2F9UWNgbjs6Qc6ILyaw3THhlRD8QXVjctoXTpGX4r/b2gxq8EIdTmWdN1fGHt1YG
         MAy+jTz3wTmxqkG7p6NF9Fyie6VJanOLvvp9rmmnowqNsYBxAm5lju2a+AlUxYuq1a
         rDAKJaODu6UqS9e0OHWeotP/7UtA3iRBUt5PUmbfK6cvP+A7S6Q38+FPkewoR7lJgY
         +FXdHTa7QxDlG+V1Kd6PErz6j9UVWbxte71S/SFBUkhmeU4gzRQ86bxh9Vomt63ICp
         4o+Bpxz1lEm+A==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     nicolas.dufresne@collabora.com, kieran.bingham@ideasonboard.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v2] media: rkisp1: fix grey format iommu page faults
Date:   Tue,  7 Dec 2021 13:59:23 +0200
Message-Id: <20211207115923.13639-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently capturing grey format produces page faults
on both selfpath and mainpath. To support greyscale
we can capture YUV422 planar format and configure the U, V
buffers to the dummy buffer.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
This is v2 of the patch "media: rkisp1: remove support for V4L2_PIX_FMT_GREY"
In v1 I removed the grey format. In this version it is 'fixed'

 .../platform/rockchip/rkisp1/rkisp1-capture.c | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 768987d5f2dd..8e982dd0c740 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -249,7 +249,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_GREY,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 	/* rgb */
@@ -631,12 +631,26 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 		rkisp1_write(cap->rkisp1,
 			     buff_addr[RKISP1_PLANE_Y],
 			     cap->config->mi.y_base_ad_init);
-		rkisp1_write(cap->rkisp1,
-			     buff_addr[RKISP1_PLANE_CB],
-			     cap->config->mi.cb_base_ad_init);
-		rkisp1_write(cap->rkisp1,
-			     buff_addr[RKISP1_PLANE_CR],
-			     cap->config->mi.cr_base_ad_init);
+		/*
+		 * In order to support grey format we capture
+		 * YUV422 planar format from the camera and
+		 * set the U and V planes to the dummy buffer
+		 */
+		if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
+			rkisp1_write(cap->rkisp1,
+				     cap->buf.dummy.dma_addr,
+				     cap->config->mi.cb_base_ad_init);
+			rkisp1_write(cap->rkisp1,
+				     cap->buf.dummy.dma_addr,
+				     cap->config->mi.cr_base_ad_init);
+		} else {
+			rkisp1_write(cap->rkisp1,
+				     buff_addr[RKISP1_PLANE_CB],
+				     cap->config->mi.cb_base_ad_init);
+			rkisp1_write(cap->rkisp1,
+				     buff_addr[RKISP1_PLANE_CR],
+				     cap->config->mi.cr_base_ad_init);
+		}
 	} else {
 		/*
 		 * Use the dummy space allocated by dma_alloc_coherent to
-- 
2.17.1

