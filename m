Return-Path: <linux-media+bounces-32674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9CBABA9D5
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1B9F9E8223
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201B21F8725;
	Sat, 17 May 2025 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ze9nE0G0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4381F5834
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482168; cv=none; b=sIZPuCF9jTsQ8ZPj/vPC7USJMuD8fth/jCO5d6jR8mPBfXCCNonmFIbjhJyoziwAutNzIZp9OiDNfqZExXibYoZDmVmd5TBZcNAtvo3M9MBWP5ijweRyCJHp1mul2jf+3wDls1uWVGubauSaT9yowwR49HfoDs4c2YiPX6VFjmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482168; c=relaxed/simple;
	bh=508EGaAvB11N4t4PsVZC+5owYfB0k8uW87NL5dzensU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajbE2iCZEvLv4C0jd8alSo446kJ0RSO17iH2tiLiSN8fIYwTW+L5U0XdX07DaXJjboRStH6a3DIP4v6/MqhinJxOuNrbCB65qxieAeQNvZoe/R1QCg7dSdoCPjD0oYePRYdAvZBfPEUQS9mKIPxnfIsoHkVpVjBU18XFEyABXwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ze9nE0G0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GZp1vWRwSDXj8k+nhgYyFqLkGkBzybW3ihY1SIt+dk=;
	b=Ze9nE0G0Ot1Cv2M1Dxekb63msgY09kc9OScUqTlz7+rjB605w9qBhN141qRkh0XDBUvsmT
	hYbTRvG+y1cwkMuEQTlnGsZJQj8vMTlkMHTu6nLPi+W8JRXUUiaPXaJUb1kKKMLnl3ULCo
	25rvZbOJB5lyCbBKbOU1iC9uRdqaucs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-1gcrbh0pM9aDEebCN2gFBg-1; Sat,
 17 May 2025 07:42:42 -0400
X-MC-Unique: 1gcrbh0pM9aDEebCN2gFBg-1
X-Mimecast-MFC-AGG-ID: 1gcrbh0pM9aDEebCN2gFBg_1747482161
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E9DD1956088;
	Sat, 17 May 2025 11:42:41 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2107E18003FC;
	Sat, 17 May 2025 11:42:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 16/23] media: atomisp: gc0310: Implement internal_ops.init_state
Date: Sat, 17 May 2025 13:40:59 +0200
Message-ID: <20250517114106.43494-17-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Implement internal_ops.init_state to fill in the v4l2_mbus_framefmt
struct in newly allocated sd-state structs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index a099f0975e1d..7f655285bf62 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -611,6 +611,17 @@ static const struct v4l2_subdev_ops gc0310_ops = {
 	.sensor = &gc0310_sensor_ops,
 };
 
+static int gc0310_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	gc0310_fill_format(v4l2_subdev_state_get_format(sd_state, 0));
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops gc0310_internal_ops = {
+	.init_state = gc0310_init_state,
+};
+
 static int gc0310_init_controls(struct gc0310_device *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
@@ -777,6 +788,7 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	sensor->sd.internal_ops = &gc0310_internal_ops;
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.49.0


