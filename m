Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1106A19653C
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 11:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgC1K4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 06:56:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42010 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgC1K4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 06:56:20 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7044329458D;
        Sat, 28 Mar 2020 10:56:18 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/3] media: staging: rkisp1: rsz: get the capture format info from the capture struct
Date:   Sat, 28 Mar 2020 11:56:04 +0100
Message-Id: <20200328105606.13660-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the format info of the capture is retrieved by calling
the function  v4l2_format_info. This is not needed since it is
already save in the capture object.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 87799fbf0363..8704267a066f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -387,8 +387,7 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	if (rsz->fmt_type == RKISP1_FMT_YUV) {
 		struct rkisp1_capture *cap =
 			&rsz->rkisp1->capture_devs[rsz->id];
-		const struct v4l2_format_info *pixfmt_info =
-			v4l2_format_info(cap->pix.fmt.pixelformat);
+		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
 
 		hdiv = pixfmt_info->hdiv;
 		vdiv = pixfmt_info->vdiv;
-- 
2.17.1

