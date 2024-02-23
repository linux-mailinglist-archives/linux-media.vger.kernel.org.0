Return-Path: <linux-media+bounces-5744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB385860D1E
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C2B1C22EF6
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 08:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACC718E20;
	Fri, 23 Feb 2024 08:45:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684A134B7
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677939; cv=none; b=bJTbvO62CBqsjZMrlXtuBVzGCaZp89/Bm9+7i6R4c+kpQGNr8ZRcSefnQUBw1Tx3YTcKrsD1/yYY9Vr3Jv4xfxmKnN9HE+wBhV+pHYaNL9FESdr7fGTjPly5JUHru7qlIzxkhRS94clLSXnaXcepSqnPCWWolz7OkvFRlwNxd9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677939; c=relaxed/simple;
	bh=AhKVSJr7f7GwzoW25mRJ1tF+k4CW9qLExycglRYAyTg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=W+BCn3RqbC0dPL9puh836IInELxDUW8XcU1WQGlb8btbHxOChsBFAVkuF6BTl6Dw+mWj1uJdqIOVBHUTKVp63RPWsOGSRv7YMyS0ynnwNBh1EzgGpBcy8+7za4OO8Vo/DjuZWxdyhYgJkX8E0iqLpQtLgSfUZBtIdWqHadUYc+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BD3C43390
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 08:45:38 +0000 (UTC)
Message-ID: <50f691d3-f49b-4279-9048-48319afd86f9@xs4all.nl>
Date: Fri, 23 Feb 2024 09:45:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-core: hold videodev_lock until dev reg, finishes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

After the new V4L2 device node was registered, some additional
initialization was done before the device node was marked as
'registered'. During the time between creating the device node
and marking it as 'registered' it was possible to open the
device node, which would return -ENODEV since the 'registered'
flag was not yet set.

Hold the videodev_lock mutex from just before the device node
is registered until the 'registered' flag is set. Since v4l2_open
will take the same lock, it will wait until this registration
process is finished. This resolves this race condition.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d13954bd31fd..bae73b8c52ff 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1036,8 +1036,10 @@ int __video_register_device(struct video_device *vdev,
 	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
 	vdev->dev.parent = vdev->dev_parent;
 	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
+	mutex_lock(&videodev_lock);
 	ret = device_register(&vdev->dev);
 	if (ret < 0) {
+		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
 		goto cleanup;
 	}
@@ -1057,6 +1059,7 @@ int __video_register_device(struct video_device *vdev,

 	/* Part 6: Activate this minor. The char device can now be used. */
 	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
+	mutex_unlock(&videodev_lock);

 	return 0;

-- 
2.40.1



