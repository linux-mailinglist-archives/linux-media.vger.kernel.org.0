Return-Path: <linux-media+bounces-5745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C042A860D1F
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1132866D3
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 08:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8573918E2A;
	Fri, 23 Feb 2024 08:46:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E112E5E
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677980; cv=none; b=I4ofig32+rgOD0UKkQahcbgipQr0wdgZNpwohWJmc/MdkmxEM9S9GO0DlevlqlH/n/VtQkPQshzW0HLXTb0bIQu0hKLaoT2jCobOBqOKldsZEEK1ph/BoZ2gx2d2y4Se+Z6QZxmLMDE+rIBRBFNXBqKIT3nCse4MHeUjpTgyTcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677980; c=relaxed/simple;
	bh=+tecb2uIztWTL9hVxhFEv1SVlGIs3l+RJPoqi46FZeI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HegZZHwmbntDQ9JyMYFaD//SmLnIPiC6xp3l8Cok/ewHy+cBeeRjkvI8loubJoQ5nqCPWx43BNNhdYVHcG+gJuY+wjie0jEFXAPJkjz3hmmokBSbsTgqItLfXNI88IYZiy9bv+5kG/0D6LLgFEZg5A0RmP9k9moOaL/2fugqrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E06AC433C7;
	Fri, 23 Feb 2024 08:46:19 +0000 (UTC)
Message-ID: <b28a6f75-eb46-4d71-a919-b4c9c8e35124@xs4all.nl>
Date: Fri, 23 Feb 2024 09:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: mc: mark the media devnode as registered from the,
 start
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

First the media device node was created, and if successful it was
marked as 'registered'. This leaves a small race condition where
an application can open the device node and get an error back
because the 'registered' flag was not yet set.

Change the order: first set the 'registered' flag, then actually
register the media device node. If that fails, then clear the flag.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-devnode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 7f67825c8757..318e267e798e 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -245,15 +245,14 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);

 	/* Part 3: Add the media and char device */
+	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
 	if (ret < 0) {
+		clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 		pr_err("%s: cdev_device_add failed\n", __func__);
 		goto cdev_add_error;
 	}

-	/* Part 4: Activate this minor. The char device can now be used. */
-	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
-
 	return 0;

 cdev_add_error:
-- 
2.40.1


