Return-Path: <linux-media+bounces-23793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE49F7CAF
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E1616C3A1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D14522541D;
	Thu, 19 Dec 2024 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GM4RooXf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D11A224894
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616201; cv=none; b=rcjVTLbnZDIQmxGqZPHRvLKs+jRAbLNYFCiM0xjdkrlJr72LyTU7hx+x9pBnpI4gNk1MwkQHimktHy8EuQ6j5hzQjJovk+5uztLbc93OwVx9GV/JrT/+oHyfJcXZYXGtBBo2njHFWfkg31yx/W/kykLgr8kjTaWh50AfCCg3KF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616201; c=relaxed/simple;
	bh=uVIfIubwkNgqYcKl/EDxb/O4CFOk0Xj8MMumzIGqpC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCuVFzJ1K95EoBTmG0Aae5PxeprGepvwiOvTkkfyRefNEtmJPkqaiT63DKVeWcme5b36P222jRuQ7SYuqqfprXwynF+YrayCUUHhLmli4SI6zOnPcEbfgwDdyuWppSjeW8Ulb88APe9PVxIenr2VYYsDm8wmgXyDaC6HhDwyyRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GM4RooXf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwOhFmuEJa4E1H2W1LJCuIH6zWMQjyleFWA7Drhp6WI=;
	b=GM4RooXfcKO6ABaRvi/J3EaaufaLb90upW3kfbos9oYJZr87VvlKZW1HnujbZxiKCQg8Sp
	fR52R3SJFxzpVtk4VRwmyJfWx8MDtmVUxXSn+HRo3mIs27XGFln+it6z7mGe+XbHiKQl6f
	FeQjmUP5MouvPXRJw9Qr/puNH9vLy2E=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-Fh8dN66hNc2Dfrx3MQbfcA-1; Thu,
 19 Dec 2024 08:49:58 -0500
X-MC-Unique: Fh8dN66hNc2Dfrx3MQbfcA-1
X-Mimecast-MFC-AGG-ID: Fh8dN66hNc2Dfrx3MQbfcA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAB5E19560AD;
	Thu, 19 Dec 2024 13:49:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 299831955F77;
	Thu, 19 Dec 2024 13:49:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 6/8] media: ov08x40: Improve ov08x40_identify_module() error logging
Date: Thu, 19 Dec 2024 14:49:38 +0100
Message-ID: <20241219134940.15472-7-hdegoede@redhat.com>
In-Reply-To: <20241219134940.15472-1-hdegoede@redhat.com>
References: <20241219134940.15472-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

ov08x40_identify_module() already logs an error if the read ID mismatches,
so having its caller also log an error results in 2 errors in this case.

Add error logging to the ID register read in ov08x40_identify_module() and
drop the error logging in the caller.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 44989a37c2f3..ca004343a9d8 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1943,8 +1943,10 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 
 	ret = ov08x40_read_reg(ov08x, OV08X40_REG_CHIP_ID,
 			       OV08X40_REG_VALUE_24BIT, &val);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "error reading chip-id register: %d\n", ret);
 		return ret;
+	}
 
 	if (val != OV08X40_CHIP_ID) {
 		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
@@ -2262,10 +2264,8 @@ static int ov08x40_probe(struct i2c_client *client)
 
 		/* Check module identity */
 		ret = ov08x40_identify_module(ov08x);
-		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+		if (ret)
 			goto probe_power_off;
-		}
 	}
 
 	/* Set default mode to max resolution */
-- 
2.47.1


