Return-Path: <linux-media+bounces-19747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E94299A072D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C681C2249D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8332187850;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM2f2/GW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165220720D;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=fk31wpdW/jwWS7h5UbgFwZYDAzDOELt0ZVyyvQ/s0unEGO6+sF09KXVkrFdvD81yPL7R+24Dj5/M0jO3gfCClC4TGp3z1LIbXbYiXMdqBGExCtPycNM6Bo84gay8TMNftToqcshn7PX7lESYUck/JHxsab6N/OveIcGjvVdNg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=TkxiQZ67z39iRcOBi+pEl9tz3Z92UapKNSmknM4EeH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mvjflv+O18knZWUyw09pN38B7N+0oRSFvag2mQ42uktLiFgrwJI2Asg7Seat6VpavZaqCglODwBHkJUu6AHuFzB4BRi02PWgNAxmGQ9IRuqIwWE5HyqJGRwoiiBcDkwUGWcWtXaj1OSvc04gyrwlNGN/WVS7+H1wqhlbF4WdHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM2f2/GW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8910C4CED4;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=TkxiQZ67z39iRcOBi+pEl9tz3Z92UapKNSmknM4EeH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZM2f2/GWuDRz9BkxagiAlhdizIGgSDskUyVBVsMevCTnXqVP446Fmm7lwsYA/QvJm
	 u3FyQhd7FcY/xQ01XbOzcCoSwHhEcC2c6SwU+xWrx9qgxdfqNh3s8H1ZD7FKvMsH/P
	 0beKGDIfFm8lc/68ex0e59VfSds0Zldp1p5W+Uu/Q9JR/isKlQOlYFppe0yJMtLdRI
	 aIWqPdsi2vBZeSZS6lUDXuSgWDY0ngE9o76ZpXsMNwLPfGy8b1EVRTgHAhXQkqIs0Z
	 d5SZdEQKFyTQdsKx2P9myej7HgzTpPmTcTtX00jeG1q1L1qva9sjkW/KuYAtMMzbYu
	 SIQEjTzLnDUdA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004YmZ-21f1;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andreas Oberritter <obi@linuxtv.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Zhipeng Lu <alexious@zju.edu.cn>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 03/13] media: dvbdev: prevent the risk of out of memory access
Date: Wed, 16 Oct 2024 12:22:19 +0200
Message-ID: <3df78d0131f8f6730043df28a9e03ee955fdeb96.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The dvbdev contains a static variable used to store dvb minors.

The behavior of it depends if CONFIG_DVB_DYNAMIC_MINORS is set
or not. When not set, dvb_register_device() won't check for
boundaries, as it will rely that a previous call to
dvb_register_adapter() would already be enforcing it.

On a similar way, dvb_device_open() uses the assumption
that the register functions already did the needed checks.

This can be fragile if some device ends using different
calls. This also generate warnings on static check analysers.

So, add explicit guards to prevent potential risk of OOM issues.

Fixes: 5dd3f3071070 ("V4L/DVB (9361): Dynamic DVB minor allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvbdev.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index b43695bc51e7..14f323fbada7 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -86,10 +86,15 @@ static DECLARE_RWSEM(minor_rwsem);
 static int dvb_device_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev;
+	unsigned int minor = iminor(inode);
+
+	if (minor >= MAX_DVB_MINORS)
+		return -ENODEV;
 
 	mutex_lock(&dvbdev_mutex);
 	down_read(&minor_rwsem);
-	dvbdev = dvb_minors[iminor(inode)];
+
+	dvbdev = dvb_minors[minor];
 
 	if (dvbdev && dvbdev->fops) {
 		int err = 0;
@@ -525,7 +530,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	for (minor = 0; minor < MAX_DVB_MINORS; minor++)
 		if (!dvb_minors[minor])
 			break;
-	if (minor == MAX_DVB_MINORS) {
+	if (minor >= MAX_DVB_MINORS) {
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -540,6 +545,14 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	}
 #else
 	minor = nums2minor(adap->num, type, id);
+	if (minor >= MAX_DVB_MINORS) {
+		dvb_media_device_free(dvbdev);
+		list_del(&dvbdev->list_head);
+		kfree(dvbdev);
+		*pdvbdev = NULL;
+		mutex_unlock(&dvbdev_register_lock);
+		return ret;
+	}
 #endif
 	dvbdev->minor = minor;
 	dvb_minors[minor] = dvb_device_get(dvbdev);
-- 
2.47.0


