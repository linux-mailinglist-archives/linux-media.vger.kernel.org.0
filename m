Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A61AD19FEB
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 17:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfEJPPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 11:15:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43249 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727353AbfEJPPH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 11:15:07 -0400
Received: from [IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215] ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P7Emhfnq8sDWyP7Enhd5Tu; Fri, 10 May 2019 17:15:05 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec: mark devnode as registered before actually registering
 it
Message-ID: <b1c054d1-e041-b518-96bd-d53003d02804@xs4all.nl>
Date:   Fri, 10 May 2019 17:15:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOVfW5MX4+GW418G03/6jqsRtnsp1A+VuqNKpbKcanhUyBxFJc5n7Te+MHxJ9QR7ebWN6BwEJVTAixO6QwpRxIW6gfDawzYOSkUto3HmJ7QDwCwtXC9a
 hC+j0+/wgm42mcy2oO6RujfeOEA4EtbqVJj+d4Tgraetzjm9ZwyBDWNaST91LPKKNKFp3XEi2hdDUbl4sL0MpMPOOFUKSaabB8Oej+xCcX9zHjfnE7KEnkzM
 ozO8YRcWMYuF+S2lB/BlJHABYNfDrvxl7xelxsPsxPQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec device node can be used right after it was created, but that
leaves a race condition where the device was created, but devnode->registered
was still false. So an ioctl() would result in an error.

So set it to true before calling cdev_device_add() and to false again if
cdev_device_add returned an error.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index f5d1578e256a..db7adffcdc76 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -128,13 +128,14 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);

+	devnode->registered = true;
 	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
 	if (ret) {
+		devnode->registered = false;
 		pr_err("%s: cdev_device_add failed\n", __func__);
 		goto clr_bit;
 	}

-	devnode->registered = true;
 	return 0;

 clr_bit:
