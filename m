Return-Path: <linux-media+bounces-19838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0789A34C3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6995F1F24DC7
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3984318D63F;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdu9pKx4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E323187FE7;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=tcc2ouyc0Z6S2joNVRF1LRxu/uq20IxGcukbHTSY3uBYhsdm9LVcqp/ad78GyxKYuAukMoPnkT+8+v1VkE+1aaUsur2PTjiG+lERFNwoHsQ4Mgy80HEZpvaPeoi7SDTKq+dxSKA3z5vnrNNEqK3D6No7ii4s1ovxV+2mGbyJAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=7VY8GlY/l5T5jEHgBbjy0pf1hM8mOLn8XMfWYVIqYHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efgBJv7Z+HpegZQLGfWPBvfm3i9jPV5taHbOe5Ayg5IDwz8uDCk+sLLB9PUN4GeHHtUbVMbXfWUYWrgD71tTwWQnqu45AQS/aEprx90pD2nAXvFUAg0VV2xnTaL4jxWcwUDerL9750zYwYHtVjXXH2lZWV43fRcLcaRojDBdWoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdu9pKx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9739C4CEDA;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=7VY8GlY/l5T5jEHgBbjy0pf1hM8mOLn8XMfWYVIqYHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sdu9pKx4pBfpb2BCmX4XRHpr0ne0We1ZiOjjGDcnJz0q/TY0lXLP8QNniSKfY7fbf
	 ct5NW0c67lyUjcGizX87/xi5CxEwbbQx4IJZgBXgUyicMCDvgjCHewkMKWnU8v7orU
	 5qRZWVfhniHji9Dah9pmNIHu5b742nzczdWZXoEpx9FLY4F/FaOhTUN8n4buP/x+H9
	 0sgfOulBYttY/tZu+Muq3O3eBio7ddAoEJpi2A07pwrZlQ68WYQm/OF5AFbCmzPTsm
	 oL5WDMLlqSJx326SktIcCtneL/tEZ406+ryIoRk0ougm/9Y2gUR704Eei9Jcn5FZpO
	 MHDh6yceXHw5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Me3-1TQd;
	Fri, 18 Oct 2024 07:53:24 +0200
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
	linux-media@vger.kernel.org
Subject: [PATCH v2 03/13] media: dvbdev: prevent the risk of out of memory access
Date: Fri, 18 Oct 2024 07:53:05 +0200
Message-ID: <9e1b9363b98f322307459ffde548ad9948a1541b.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
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
calls. This also generate warnings on static check analysers
like Coverity.

So, add explicit guards to prevent potential risk of OOM issues.

Fixes: 5dd3f3071070 ("V4L/DVB (9361): Dynamic DVB minor allocation")
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


