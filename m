Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637AC102AFD
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 18:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfKSRvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 12:51:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54024 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfKSRvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 12:51:23 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 9FCA528FBF4
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com, ezequiel@collabora.com
Subject: [PATCH v2] media: v4l2-core: set sd->devnode = NULL in v4l2_subdev_release
Date:   Tue, 19 Nov 2019 18:51:15 +0100
Message-Id: <20191119175115.12385-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sd->devnode is release after calling this
function. Therefore it should be set to NULL so that the
subdev won't hold a pointer to a released object.
This fixes a reference after free bug in function
v4l2_device_unregister_subdev

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
changes since v1: move the line to the funtion v4l2_subdev_release
from the funtion v4l2_subdev_release

 drivers/media/v4l2-core/v4l2-device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 63d6b147b21e..2b3595671d62 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -177,6 +177,7 @@ static void v4l2_subdev_release(struct v4l2_subdev *sd)
 {
 	struct module *owner = !sd->owner_v4l2_dev ? sd->owner : NULL;
 
+	sd->devnode = NULL;
 	if (sd->internal_ops && sd->internal_ops->release)
 		sd->internal_ops->release(sd);
 	module_put(owner);
-- 
2.20.1

