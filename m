Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5410FE26B
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 17:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfKOQNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 11:13:17 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36838 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfKOQNR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 11:13:17 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D6D89291EAC
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        ezequiel@collabora.com
Subject: [PATCH] media: v4l2-core: set sd->devnode = NULL if v4l2_device_register_subdev_nodes fails
Date:   Fri, 15 Nov 2019 17:11:16 +0100
Message-Id: <20191115161116.16304-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case v4l2_device_register_subdev_nodes fails, sd->devnode is
unregistered and then released. Therefore the field is set to
NULL so that the subdev won't hold a pointer to a released object.
This fixes a reference after free bug in function
v4l2_device_unregister_subdev

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 63d6b147b21e..468705c85e97 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -250,6 +250,7 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
 		if (!sd->devnode)
 			break;
 		video_unregister_device(sd->devnode);
+		sd->devnode = NULL;
 	}
 
 	return err;
-- 
2.20.1

