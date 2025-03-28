Return-Path: <linux-media+bounces-28959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D93A7524D
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 23:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4840918916A6
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 22:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7E61EF374;
	Fri, 28 Mar 2025 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="V/6He8An"
X-Original-To: linux-media@vger.kernel.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE0126C02;
	Fri, 28 Mar 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743199673; cv=none; b=i+r9cjZHfwKNsjjHqgBwXei98X1uOKLgvzsbbJY/Ps8U+aOcdWojvFJU6x4SRMWlbyNlQOZv//VKI/ly+kQX/n3mnVS+G56rwDkyXqNC6i6k1bUCLou69Fh17J4Njclzbqj89JUAwv3uOpPzhSextIvCK1te7m/n5u/8bfP9Bf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743199673; c=relaxed/simple;
	bh=ZG84OrSOZHV60b5oSIh0kKYmXD7baMyrmQ9z9pnQH5k=;
	h=Date:Message-Id:Subject:MIME-Version:Content-Type:From:To:Cc; b=ix6/OBG+5qsbvhagq+oyd8DTvaeW/WgS4IRsbIBMD89s1l+EOEiIygvb37NcwDm7N5zemmYfRP+OCs4J5P4RvOI9b8Y8r9YVQRJ9CQ9n1XQMsLRi0iNtgHm77BeIFXjohqE2xP5A77f3F9yurlOaD+yHqCSulGqHAHneCGpN6h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=V/6He8An; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1743199669; bh=ZG84OrSOZHV60b5oSIh0kKYmXD7baMyrmQ9z9pnQH5k=;
	h=Date:Subject:From:To:Cc:From;
	b=V/6He8AnXwEm0TVut/cRp1KWi5vNAyN7y9Y69CFxnSm53rCARTdR3f0K83/murQrC
	 5wJkV0Zt26LjeLbJyb3VnSse7WU6nZI0vBzJcDxpdMNibutdZawPEsKsTx4EzkfeFv
	 /9C+/jRQkXp7AvvVd904h6FTnrN41yBrUVQO4Ge2pIMgIlQBBei4O9koEqaVbmshv3
	 D1JChhQ4Hx0ZRDNRLyM7UobMVtfkLYvFK9PM7tR/Xkx0X4XRToVk7CFR7tZrSLjNw0
	 XIky3rwTfgyrSCzWQC3nRTBnJ7eM8nyX/UzSdZHBeAvu3IuDI1a7CG5uRc74uscGDm
	 gl4wwN+7Fsz+g==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4ZPZQY1XfczGC;
	Fri, 28 Mar 2025 23:07:49 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.7 at mail
Date: Fri, 28 Mar 2025 23:07:48 +0100
Message-Id: <13860e023a920cd472cf5acecee88794c815b9c4.1743199603.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH] media: v4l: get_device() when no errors are possible anymore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org

Avoid leaking reference from get_device() in the error path.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/media/v4l2-core/v4l2-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 5e537454f5cd..277ea2c241b8 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -23,7 +23,6 @@ int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 	spin_lock_init(&v4l2_dev->lock);
 	v4l2_prio_init(&v4l2_dev->prio);
 	kref_init(&v4l2_dev->ref);
-	get_device(dev);
 	v4l2_dev->dev = dev;
 	if (dev == NULL) {
 		/* If dev == NULL, then name must be filled in by the caller */
@@ -32,6 +31,8 @@ int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 		return 0;
 	}
 
+	get_device(dev);
+
 	/* Set name to driver name + device name if it is empty. */
 	if (!v4l2_dev->name[0])
 		snprintf(v4l2_dev->name, sizeof(v4l2_dev->name), "%s %s",
-- 
2.39.5


