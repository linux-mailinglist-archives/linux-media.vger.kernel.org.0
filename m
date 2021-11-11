Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4C644D2DD
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 09:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhKKIJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 03:09:05 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:55339 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhKKIJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 03:09:03 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id l565mStOmBazol565mZRSP; Thu, 11 Nov 2021 09:06:14 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 09:06:14 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        ribalda@chromium.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: uvcvideo: Fix a memory leak in an error handling path of 'uvc_ioctl_ctrl_map()'
Date:   Thu, 11 Nov 2021 09:06:11 +0100
Message-Id: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If 'map->name' can't be allocated, 'map' must be released before returning.

Fixes: 70fa906d6fce ("media: uvcvideo: Use control names from framework")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4e4aff8ddf7..5aa76a9a6080 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	if (v4l2_ctrl_get_name(map->id) == NULL) {
 		map->name = kmemdup(xmap->name, sizeof(xmap->name),
 				    GFP_KERNEL);
-		if (!map->name)
+		if (!map->name) {
+			kfree(map);
 			return -ENOMEM;
+		}
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
-- 
2.30.2

