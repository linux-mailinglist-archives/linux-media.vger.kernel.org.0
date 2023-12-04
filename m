Return-Path: <linux-media+bounces-1549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CC2803331
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF3A31F21090
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D4F224EC;
	Mon,  4 Dec 2023 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8BrvX0D"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF90AB
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAQRi7TX3DV1K0iwG2BZe1rMTh1DYqLJFpIzboUodBk=;
	b=B8BrvX0DI0F9XvDJwK1aPCb3Y2slPkPg8F0ujzyvI5nM2CRZKhp8CCGS5kx3N65GC+fwvA
	CkNR5gLTKNo2IYucaSdOQJhHyF2KLPxk1lhN40v0M9rq1Hzmi1wRfT/PpZofQoA+2rZkOg
	1VXIfjlHaFy2B6Ib4gjGTpOzpgkXQks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-GqnKb7ANNCO13Ix0ffaxiw-1; Mon, 04 Dec 2023 07:40:02 -0500
X-MC-Unique: GqnKb7ANNCO13Ix0ffaxiw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B84C982A633;
	Mon,  4 Dec 2023 12:40:01 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63F8D40C6EB9;
	Mon,  4 Dec 2023 12:40:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 8/9] media: ov2740: Add a sleep after resetting the sensor
Date: Mon,  4 Dec 2023 13:39:45 +0100
Message-ID: <20231204123947.5754-9-hdegoede@redhat.com>
In-Reply-To: <20231204123947.5754-1-hdegoede@redhat.com>
References: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Split the resetting of the sensor out of the link_freq_config reg_list
and add a delay after this.

This hopefully fixes the stream sometimes not starting, this was
taken from the ov2740 sensor driver in the out of tree IPU6 driver:

https://github.com/intel/ipu6-drivers/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 3c58a6e0d7a0..552935ccb4a9 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -128,7 +128,6 @@ struct ov2740_mode {
 };
 
 static const struct ov2740_reg mipi_data_rate_720mbps[] = {
-	{0x0103, 0x01},
 	{0x0302, 0x4b},
 	{0x030d, 0x4b},
 	{0x030e, 0x02},
@@ -137,7 +136,6 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 };
 
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
-	{0x0103, 0x01},
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
 	{0x030d, 0x4b},
@@ -935,6 +933,15 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	if (ov2740->nvm)
 		ov2740_load_otp_data(ov2740->nvm);
 
+	/* Reset the sensor */
+	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
+	if (ret) {
+		dev_err(&client->dev, "failed to reset\n");
+		return ret;
+	}
+
+	usleep_range(10000, 15000);
+
 	link_freq_index = ov2740->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
-- 
2.43.0


