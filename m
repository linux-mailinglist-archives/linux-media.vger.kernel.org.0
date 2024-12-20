Return-Path: <linux-media+bounces-23939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F29FD9F94B4
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 831957A48D3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A441218AB8;
	Fri, 20 Dec 2024 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JiruN/9A"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609C218AAC
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705728; cv=none; b=S82xDvu0v24XtD9WOU+P9x9qpkIQTV4k2uZCPLm6qTwl8qgAfsfkDF274H+j1zJHVWxdYztgQrM5jLqcH0Wbtl2vvXVjx1GFYyqX993CkpbbpSTotOtlHPVXAmDaW0se4hLiNBpKk3arBrs7f3gfMEiCq2ZMd9XJduzKmNVRBk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705728; c=relaxed/simple;
	bh=uxAfP/1RtgtsmUbDu5FYc1B0aASBSXjQZc9QJFY2la0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=komByLXARYhP61wTEQjOIaBima+Iy6PSRQjKXo1H4CJ6QcQTfMxm3wz1sXF/RspxpvUJhil8EbWp8BcuwfBv0MZCd8XZGw9UZgbxSQ6TiTbs4RC37XJNxQrt18yhUcVYGgNKXJAwGBi4mzh/tJSmvTvNCrk6oH/vRtVwgnM5KAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JiruN/9A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3pPFsRtyHVVJaH3gZJDZFE+VKyiWXMO9b5dy1x2y3E=;
	b=JiruN/9AUQS3M5rQk8m47liZ8vMpro6VMCEFC0TvcZM9V21kmUb19riGX744uWf+2wGiW8
	nlM/MVsxzS4nFCWA6swKMv/mbwGbZc8SoGef/ED+bu/IKl77I0WNY8cAKITiWYmBLx6mME
	uh0o2asx0qWt1L9lgxhSBhMU33wcxO0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-pALpkoyaNz-HI-nSPQWWGA-1; Fri,
 20 Dec 2024 09:42:04 -0500
X-MC-Unique: pALpkoyaNz-HI-nSPQWWGA-1
X-Mimecast-MFC-AGG-ID: pALpkoyaNz-HI-nSPQWWGA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F1FE195609D;
	Fri, 20 Dec 2024 14:42:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8A29E19560AD;
	Fri, 20 Dec 2024 14:42:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 10/10] media: ov08x40: Don't log ov08x40_check_hwcfg() errors twice
Date: Fri, 20 Dec 2024 15:41:30 +0100
Message-ID: <20241220144130.66765-11-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

All ov08x40_check_hwcfg() error-exit paths already log a detailed reason,
logging a second generic "failed to check hwcfg" error is not useful, and
in case of the fwnode check failing with -EPROBE_DEFER this is outright
problematic flooding the log with:

[    4.557059] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.559636] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
etc.

messages.

The one exception to all ov08x40_check_hwcfg() error-exit paths already
logging an error is on v4l2_fwnode_endpoint_alloc_parse() errors.

Make ov08x40_check_hwcfg() log an error in that case too and drop
the duplicate "failed to check hwcfg: %d\n" error logging.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index e7012ee84822..c2a399e3bb41 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2164,7 +2164,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						    GPIOD_OUT_LOW);
@@ -2251,10 +2251,8 @@ static int ov08x40_probe(struct i2c_client *client)
 
 	/* Check HW config */
 	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
-- 
2.47.1


