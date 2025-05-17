Return-Path: <linux-media+bounces-32670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7FEABA9D1
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0EBD9E1DCD
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C271F8BCB;
	Sat, 17 May 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8TRy6Gw"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300461F7904
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482152; cv=none; b=WEGP+Sar20UBJFIb/e7jFfYGm87t8JqLBHAcimZazoIKNLO8jNfJw6zvZSkLlnbwlsVFLWtSL0x0/bZb7BtW659GJCtTtIzGkkQX3v+w4Irkg9WRrtSRve+vRZX0W0+I3IyTrGIR86O5mXgpSkNoxFP3F9pbP1SH6Rlj1LxenpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482152; c=relaxed/simple;
	bh=E4SsROb/BrrP9i51wFxWn5IezFZ+W8pm5O6uT95Gk+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pALU/iL8PVCiJM0XzoPuKvN6wTDTP6BHKWPj/wL/qNLqtGR85Ju5fyFJ02S/qr1ZtcSe+rHfzwfqKv/nwSutExoDbSALWXH1rBBJFTv9FMcZHCBrmcX6+3InB++7E8pBwAeF6Li8axslika5RgF4EO4WSXcDTISDWgK6EBMuCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8TRy6Gw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86R3eBRhvB23eNT+Fg5eGQAvzt+q63KG+8iCbobnrLE=;
	b=F8TRy6GwasEtiCAFSzHFjAfgkw19YL2P+ts2syd/BWJ/3n5494/ExJZiRcdLf2SYNzlmDJ
	g6FpVb92GUrDTapDSHMI58QLhRSzdA0Wn/QW2EJC+dLVa6RWr/4dYaSBJ/Mv+x4xq3JmHZ
	wLg0KEIvATqvu1E287iWMh/O6fICILI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-uytHxSS6PlusV44QMSVxdQ-1; Sat,
 17 May 2025 07:42:26 -0400
X-MC-Unique: uytHxSS6PlusV44QMSVxdQ-1
X-Mimecast-MFC-AGG-ID: uytHxSS6PlusV44QMSVxdQ_1747482144
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD0B8180048E;
	Sat, 17 May 2025 11:42:24 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C7E618003FC;
	Sat, 17 May 2025 11:42:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/23] media: atomisp: gc0310: Fix power on/off sleep times
Date: Sat, 17 May 2025 13:40:55 +0200
Message-ID: <20250517114106.43494-13-hdegoede@redhat.com>
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

Reduce the unnecessary long msleep(100) done on stream start to 10 ms and
move this to gc0310_resume() so that it is also done on the initial
power-up done by gc0310_detect(), which should fix gc0310_detect()
sometimes failing.

While at it switch the sleeps from msleep() / usleep_range() to fsleep().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 8acb4517c67b..162b81789eca 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -488,8 +488,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 		if (ret < 0)
 			goto error_power_down;
 
-		msleep(100);
-
 		ret = regmap_multi_reg_write(sensor->regmap,
 					     gc0310_reset_register,
 					     ARRAY_SIZE(gc0310_reset_register));
@@ -818,10 +816,11 @@ static int gc0310_resume(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 
-	usleep_range(10000, 15000);
+	fsleep(10000);
 	gpiod_set_value_cansleep(sensor->reset, 0);
-	usleep_range(10000, 15000);
+	fsleep(10000);
 	gpiod_set_value_cansleep(sensor->powerdown, 0);
+	fsleep(10000);
 
 	return 0;
 }
-- 
2.49.0


