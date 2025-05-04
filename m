Return-Path: <linux-media+bounces-31672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB90AA85DD
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14F39189AD73
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529B41A23AD;
	Sun,  4 May 2025 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h9qHH7V1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BE1A0B0E
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353663; cv=none; b=rErTCM99OnoiFVs8KqK3mUepd57CJeDtGbm72U9/BQcJ7UjIBblfxsqzCHcDAAfd+IKqxSIl0GRahTTvZTd8/ixPo+fPwcbP80YzvtvYPv0//26yihhgF2n5yzIYCSA7G3a2RiJ2miiaOQ//4FM6vmaCxbpRrkAV429/kYqrVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353663; c=relaxed/simple;
	bh=qd5/g/AJYIODv9irBFsMwq0+F/SINibZrn8bfBcLZXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/QZZVxF1KUetTlaOZ96aEeNQJWrkN8Du+CjSmYgHDsMGh5+P3AgsKVeYeFydxxLkPJrLLaQOQxRIWf+WZN1AX92ZHeJ1dh+hj6vMOoZ9MdPLU6LEHaIvA8KHfxqE6qDLA7kU8hLW0J5fKmh4yuDTROZIwUiMPx7IHEVOJ2Wz4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h9qHH7V1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLCdMVtARY4bPj489vmIhB6NUFFAUV6TVgaq2tIKtxM=;
	b=h9qHH7V1XazjuVJUl4KwmIK96nxscctYdnIAwLubbULI1yTVsrsY3qjyZGHfzMsorz10tA
	h3OsZ7iUYI5driVZ7zeyhzBgF0SoKqBzs24gNNagtHwef+WCw7bcz5Ex0dfBSW8dSfmWfa
	APGKHLCS1yw01v9WW54JniOGmyehO3c=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-r8hW-Jz8NkiUquhHwAA8NQ-1; Sun,
 04 May 2025 06:14:12 -0400
X-MC-Unique: r8hW-Jz8NkiUquhHwAA8NQ-1
X-Mimecast-MFC-AGG-ID: r8hW-Jz8NkiUquhHwAA8NQ_1746353651
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1256E1956089;
	Sun,  4 May 2025 10:14:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D13261800352;
	Sun,  4 May 2025 10:14:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 11/13] media: mt9m114: Drop start-, stop-streaming sequence from initialize
Date: Sun,  4 May 2025 12:13:32 +0200
Message-ID: <20250504101336.18748-12-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Drop the start-, stop-streaming sequence from initialize.

When streaming is started with a runtime-suspended sensor,
mt9m114_start_streaming() will runtime-resume the sensor which calls
mt9m114_initialize() immediately followed by calling
mt9m114_set_state(ENTER_CONFIG_CHANGE).

This results in the following state changes in quick succession:

mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING

these quick state changes confuses the CSI receiver on atomisp devices
causing streaming to not work.

Drop the state changes from mt9m114_initialize() so that only
a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call is made
when streaming is started with a runtime-suspend sensor.

This means that the sensor may have config changes pending when
mt9m114_runtime_suspend() gets called the first time after mt9m114_probe(),
when streaming was not started within the 1 second runtime-pm timeout.
Keep track of this and do the ENTER_CONFIG_CHANGE + ENTER suspend from
mt9m114_runtime_suspend() if necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 2ebd115b2ddf..28c5a5752621 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -391,6 +391,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	bool config_change_pending;
 
 	/* Pixel Array */
 	struct {
@@ -776,14 +777,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
-	if (ret < 0)
-		return ret;
-
+	sensor->config_change_pending = true;
 	return 0;
 }
 
@@ -958,6 +952,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		goto error;
 
+	sensor->config_change_pending = false;
 	sensor->streaming = true;
 
 	return 0;
@@ -2251,6 +2246,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 
+	if (sensor->config_change_pending) {
+		/* mt9m114_set_state() prints errors itself, no need to check */
+		mt9m114_set_state(sensor,
+				  MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		mt9m114_set_state(sensor,
+				  MT9M114_SYS_STATE_ENTER_SUSPEND);
+	}
+
 	mt9m114_power_off(sensor);
 
 	return 0;
-- 
2.49.0


