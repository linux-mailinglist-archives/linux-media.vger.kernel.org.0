Return-Path: <linux-media+bounces-3443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2541829591
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 10:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B110E1C21A19
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 09:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025BB39FC8;
	Wed, 10 Jan 2024 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="jOYxZUXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972DD3B187
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704877274; x=1736413274;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OTwM04JNhZpDLI/6jmKioey9GT6AnrM9HoEj5GThl4k=;
  b=jOYxZUXOWOtFs3h4D3RAaVfEj1f5FpPa6eFHX0DhkU7oVOV/+tPo3W9a
   pG2qb4WF9WAv6HwYc399pFDW0GnNo/dwQy5wb0TdcBiqhd7VFb72BO9a9
   l8SFNXB/jLrptaUBED9gJhgOkspKiSjU9Jyen0zHKpgfCr2mQcR2PoYYH
   PkbGXujB6NQJYRZKGc+MTWwCHRR+jTzsMAdWiL5BoXTphwUZ/vd0bV23F
   kCc9FRIXV07shyY6Fvff0Aj+DycE2mdf9tXjvlk2rK4rC8plldR197xG5
   J0Vjc4lb7EMP7iIpqbQnPg2W8GQZ31QBFc3/n0NUtJX7eRFt0NO9chm5s
   g==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34822947"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 10:01:12 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4B870280075;
	Wed, 10 Jan 2024 10:01:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org,
	Robert Foss <rfoss@kernel.org>
Subject: [PATCH v3 1/1] media: tc358743: register v4l2 async device only after successful setup
Date: Wed, 10 Jan 2024 10:01:11 +0100
Message-Id: <20240110090111.458115-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the device has been setup correctly before registering the v4l2
async device, thus allowing userspace to access.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
Changes in v3:
* Added Robert's S-o-b

Change in v2:
* New approach: Register async device as last step

This superseeds the patch at [1], but has a different subject due to new
solution.

[1] https://lore.kernel.org/linux-media/20230502140612.2256850-1-alexander.stein@ew.tq-group.com/

 drivers/media/i2c/tc358743.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 2785935da497b..558152575d102 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2091,9 +2091,6 @@ static int tc358743_probe(struct i2c_client *client)
 	state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
 
 	sd->dev = &client->dev;
-	err = v4l2_async_register_subdev(sd);
-	if (err < 0)
-		goto err_hdl;
 
 	mutex_init(&state->confctl_mutex);
 
@@ -2151,6 +2148,10 @@ static int tc358743_probe(struct i2c_client *client)
 	if (err)
 		goto err_work_queues;
 
+	err = v4l2_async_register_subdev(sd);
+	if (err < 0)
+		goto err_work_queues;
+
 	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
 		  client->addr << 1, client->adapter->name);
 
-- 
2.34.1


