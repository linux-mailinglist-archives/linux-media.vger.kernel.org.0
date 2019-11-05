Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADBF6F046C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 18:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390385AbfKERx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 12:53:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50860 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389356AbfKERx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 12:53:29 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D073B28F76D
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH] media: vimc: sen: remove unused kthread_sen field
Date:   Tue,  5 Nov 2019 18:53:17 +0100
Message-Id: <20191105175317.14751-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The field kthread_sen in the vimc_sen_device is
not set and used. So remove the field and
the code that check if it is non NULL

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-sensor.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 25ee89a067f7..32380f504591 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -18,7 +18,6 @@ struct vimc_sen_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
 	struct tpg_data tpg;
-	struct task_struct *kthread_sen;
 	u8 *frame;
 	/* The active format */
 	struct v4l2_mbus_framefmt mbus_format;
@@ -202,10 +201,6 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
-		if (vsen->kthread_sen)
-			/* tpg is already executing */
-			return 0;
-
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
 		frame_size = vsen->mbus_format.width * vpix->bpp *
-- 
2.20.1

