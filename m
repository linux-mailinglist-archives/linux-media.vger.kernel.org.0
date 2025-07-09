Return-Path: <linux-media+bounces-37233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D0AFF4AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 00:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C461F7B31F9
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 22:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395E824501B;
	Wed,  9 Jul 2025 22:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b="Vz6drXgd";
	dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b="vvXkv8Y5"
X-Original-To: linux-media@vger.kernel.org
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141282192EE;
	Wed,  9 Jul 2025 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.207.88.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752100090; cv=none; b=fsGOAqFA2Qwtt39zPQTWmJDTN3ZgKvNx7hiVHlWeU2/70JmWUUqVMnhpdyhInLC3b1IXWp9iM5TdLa61KrwQxzgc6VNqIvbmTllJ2kgV/Ra2NsmnfHNUn3N7sF0EPUwT/HBmysHBsl82bQ7Z2X/aq02rMjjY89cyphVEqEtGzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752100090; c=relaxed/simple;
	bh=PtpZsizklED06co7YfHQ+OVkoHRqI3ym9yV6CKrvhKQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jymVojE3eeF5FCP1FGjAB5H9MYO8yZjHro55orB8oCqxSof88lsGvC0IigdWfaZ8UA/OYALzQ8TTIv5wiYPOcGU7PabCSooJwCCJdEuJxdDDtlprIBnY/50ShaSJ3XwmkdurBO1hk0IP8AVX/quTCepOUKeGhYw922qT/rNymiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yadro.com; spf=pass smtp.mailfrom=yadro.com; dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b=Vz6drXgd; dkim=pass (2048-bit key) header.d=yadro.com header.i=@yadro.com header.b=vvXkv8Y5; arc=none smtp.client-ip=89.207.88.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yadro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yadro.com
Received: from mta-03.yadro.com (localhost [127.0.0.1])
	by mta-03.yadro.com (Postfix) with ESMTP id 0461CE0004;
	Thu, 10 Jul 2025 01:27:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 0461CE0004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1752100074; bh=rAKlh1L268GEHchFU4anWhGlMOF4p6LMzRAfCwc/atk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Vz6drXgdPajAyFtMcDE6Z25hZctkedg/rUqd9f6S7S+1sPcfnA4SCu+3h4dOCnWRg
	 7OiR6UBXRhVEPnV/IREJAuPeYpvrrOWWDTylnvq83ZNzBSGj6XFuO+vFn0ypb6p/xE
	 7Volf4glXk7mM8OMRWcgvVlQBzvj781CVvU/HP38fdWI1iyMcYfMB+/xlx9hEf1kIX
	 ee/sSa5CEvT98XlAv9LBGzHi48/gfWwnBXe/iqgjQfCJiTLMqFqMYZbaX5dz/FfA92
	 GJ4dr8JcS9QLJoqdd/MhSDYjlOjGthR8mHeDs8wWMqgfJh3knpze9o3iIFt9y5bm7m
	 8pkNzwwRf7UJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1752100074; bh=rAKlh1L268GEHchFU4anWhGlMOF4p6LMzRAfCwc/atk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vvXkv8Y5Pt8cfT8QWT139Su4Ms+POJgow1T00yoI6T3kPtoA0d3BXCikJIjpo6cey
	 P0RJgLKROwG/C68+vZkwNzG6wTiKHTRkIzktZt2A18XsXunloZEtry+z91JQus7u2i
	 BMzUcgs+E0YVedAxkwV5AjQXfi3gv106lCXTTI2VxadYar45Zm2ihYrBqRnkjfF6li
	 kuRdRoHq20nKIAPsoBHHxiKr+9e1cv2chP0aiIzXo0PRLKfYO4kpFqbEOnIJM+6irI
	 fdsNIdJ4ectikz8xwN80jQ//iwCI1pVP7FRMkUTMB2QpoxfeU3uLOgd2gBFiJUrnxP
	 FhnKRAGJRHy/Q==
Received: from T-EXCH-10.corp.yadro.com (T-EXCH-10.corp.yadro.com [172.17.11.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-03.yadro.com (Postfix) with ESMTPS;
	Thu, 10 Jul 2025 01:27:51 +0300 (MSK)
Received: from t14gen1.corp.yadro.com (172.17.34.54) by
 T-EXCH-10.corp.yadro.com (172.17.11.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 10 Jul 2025 01:27:50 +0300
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux@yadro.com>, Evgenii Shatokhin
	<e.shatokhin@yadro.com>
Subject: [PATCH] media: v4l: async: Set correct owner for sensor subdevices
Date: Thu, 10 Jul 2025 01:27:08 +0300
Message-ID: <20250709222708.1509409-1-e.shatokhin@yadro.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTM-EXCH-04.corp.yadro.com (10.34.9.204) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/07/09 20:39:00 #27631947
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

Commit 8a718752f5c3 ("media: v4l: async: Set owner for async sub-devices")
turned v4l2_async_register_subdev() into a macro that used THIS_MODULE to
obtain the owner module for the subdevice.

v4l2_async_register_subdev_sensor(sd) calls v4l2_async_register_subdev(),
and that will reset sd->owner to NULL for the sensor device, if V4L2 core
is built-in while the sensor driver is built as a module.

sd->owner is reset this way even if the sensor driver has set it properly
earlier.

This patch makes v4l2_async_register_subdev_sensor() a macro similar to
v4l2_async_register_subdev() to pass the owner module to the latter.

Fixes: 8a718752f5c3 ("media: v4l: async: Set owner for async sub-devices")
Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 7 ++++---
 include/media/v4l2-async.h            | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45..c86daef2fd3f 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1246,7 +1246,8 @@ v4l2_async_nf_parse_fwnode_sensor(struct device *dev,
 	return 0;
 }
 
-int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
+int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd,
+					struct module *module)
 {
 	struct v4l2_async_notifier *notifier;
 	int ret;
@@ -1272,7 +1273,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	if (ret < 0)
 		goto out_cleanup;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = __v4l2_async_register_subdev(sd, module);
 	if (ret < 0)
 		goto out_unregister;
 
@@ -1290,7 +1291,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
+EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
 
 MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
 MODULE_LICENSE("GPL");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f26c323e9c96..54a2d9620ed5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -333,8 +333,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
  * An error is returned if the module is no longer loaded on any attempts
  * to register it.
  */
+#define v4l2_async_register_subdev_sensor(sd) \
+	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
 int __must_check
-v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
+__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module);
 
 /**
  * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
-- 
2.34.1


