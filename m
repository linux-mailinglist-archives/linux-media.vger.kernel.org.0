Return-Path: <linux-media+bounces-1047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A58807F9300
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7DF51C20A4E
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCC3DDC2;
	Sun, 26 Nov 2023 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eal7+5U/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DD410F
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u305bXb7/Pe+KIe1xHscT/pjlkbHUw3eN875aO4vCl0=;
	b=Eal7+5U/E2jxr2AN7ynLQ+7t5VooeuRUj3Dx/V9QSFmkHJEjqJjPjFLmGbre7O6jWxryTf
	5GU00AbSnRGiaw4lm53ZY5500Q4xJiWFM1/hTiIn7/OXdSCemijTI38qQDH2fnId6MxUgG
	9feK94FD9ghEcoPqfgNGPmU549kRIq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Df3R6fB5MY2yRTq_BYN1Wg-1; Sun, 26 Nov 2023 09:15:34 -0500
X-MC-Unique: Df3R6fB5MY2yRTq_BYN1Wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD3DB85A59D;
	Sun, 26 Nov 2023 14:15:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4CAB2026D33;
	Sun, 26 Nov 2023 14:15:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 8/9] media: ov2740: Add a sleep after resetting the sensor
Date: Sun, 26 Nov 2023 15:15:16 +0100
Message-ID: <20231126141517.7534-9-hdegoede@redhat.com>
In-Reply-To: <20231126141517.7534-1-hdegoede@redhat.com>
References: <20231126141517.7534-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

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
index 8f5c33f68d42..a49c065c6cf4 100644
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
2.41.0


