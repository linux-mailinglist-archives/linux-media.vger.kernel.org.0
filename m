Return-Path: <linux-media+bounces-10874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8E8BCEE4
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FD4FB2604E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBAC7640D;
	Mon,  6 May 2024 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9l3B8S5"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67365FBF0
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001886; cv=none; b=NXgibQVFRK58ONjJfl6X1aT7kTtRpi6ktaR2dbKEXgtISMXVCGV/5JQjqKZ/hIqJbsGqLu3vooX4whGQS8W86EY0Q6YeEVIkFS8jyASArjtlFcDXS08bJmsSo5TBPKUpzhkIjwoNT+GA63rU6+IrsnkRTkH5iSelc3IhftW5GVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001886; c=relaxed/simple;
	bh=wBXIQh8JxI2Qoff7jjHr3mB2opuQCagrVYee0cBvRkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwoPBwfrfengDvbucq1F9KaHplB59wee4uX4NOPFvyM0Apu9mK6/s47HDW5eIdsMGvvmiBedgz0GlSdClMgvQFEwm3Ndj28XnhHc5QTJBFz8vObP/1V/TjRtigwVEv9CYURow5mkg1bCLfVs3m8KqyFFHgybyez4iqyM6spDHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9l3B8S5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715001884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rc5Kn55HjDU/gZmXaMC3fz6jBero5yHEEf4aTOkRClM=;
	b=E9l3B8S5PDixG5yqr4NFSsI7eL7cPDmnaV2D4VvhS3zuRH+Fb+Q5F+2Ea7IMp3fg7unvNV
	Q3pNksVJpdrqKPyVLoqbkJfpQwH2ZK261dZ03y0F6qxe2EX+kdTQXmYC77SI/DwMgW7Drz
	5YLBTovoNAJWubY2eH+g8XpmIEFcdzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-avHw5Fz1PW-7-PAb9tfyzw-1; Mon, 06 May 2024 09:24:40 -0400
X-MC-Unique: avHw5Fz1PW-7-PAb9tfyzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37687800C8A;
	Mon,  6 May 2024 13:24:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62838C13FA1;
	Mon,  6 May 2024 13:24:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ov2740: Ensure proper reset sequence on probe()
Date: Mon,  6 May 2024 15:24:38 +0200
Message-ID: <20240506132438.278920-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Before this commit on probe() the driver would do:

reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
reset=0                // from resume()
msleep(20)             // from resume()

So if reset was 0 before getting the GPIO the reset line would only be
driven high for a very short time and sometimes there would be errors
reading the id register afterwards.

Add a msleep(20) after getting the reset line to ensure the sensor is
properly reset:

reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
msleep(20)             // from probe()
reset=0                // from resume()
msleep(20)             // from resume()

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 57906df7be4e..c48dbcde9877 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1333,9 +1333,16 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
 
 	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ov2740->reset_gpio))
+	if (IS_ERR(ov2740->reset_gpio)) {
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
 				     "failed to get reset GPIO\n");
+	} else if (ov2740->reset_gpio) {
+		/*
+		 * Ensure reset is asserted for at least 20 ms before
+		 * ov2740_resume() deasserts it.
+		 */
+		msleep(20);
+	}
 
 	ov2740->clk = devm_clk_get_optional(dev, "clk");
 	if (IS_ERR(ov2740->clk))
-- 
2.44.0


