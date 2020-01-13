Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 270FE139BFA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 22:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgAMVzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 16:55:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52412 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgAMVzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 16:55:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 477BB291319
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v4 5/6] media: mc-devnode.c: set devnode->media_dev to NULL upon release instead of unregister
Date:   Mon, 13 Jan 2020 23:55:05 +0200
Message-Id: <20200113215506.13329-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
References: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media_devnode_release calls a release callback. Currently none of
the drivers implement that callback but in the future the vimc
driver and maybe others might add implementation for it.
The release callback will want to access the driver's private data
by using 'container_of(devnode->media_dev' therefore media_dev
should be set to NULL only when the release callback returns.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/mc/mc-devnode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index f11382afe23b..388c9051152a 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -58,7 +58,7 @@ static void media_devnode_release(struct device *cd)
 	/* Release media_devnode and perform other cleanups as needed. */
 	if (devnode->release)
 		devnode->release(devnode);
-
+	devnode->media_dev = NULL;
 	kfree(devnode);
 	pr_debug("%s: Media Devnode Deallocated\n", __func__);
 }
@@ -283,7 +283,6 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	mutex_lock(&media_devnode_lock);
 	/* Delete the cdev on this minor as well */
 	cdev_device_del(&devnode->cdev, &devnode->dev);
-	devnode->media_dev = NULL;
 	mutex_unlock(&media_devnode_lock);
 
 	put_device(&devnode->dev);
-- 
2.17.1

