Return-Path: <linux-media+bounces-1206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633D7FB68D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAD69B21D07
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056AF4D5BB;
	Tue, 28 Nov 2023 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gq7+LjB7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DC510E
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+KzVok29+gT/sfI2f3JfGGTnms6NAUS034WjzbcP3s=;
	b=Gq7+LjB7itciWFbwscJxpA1KkTvVn0lnrbjkTuqjHFTDDhwpFz8Dx7RlcR9+M/D+WZoMKT
	v96bvBUQCMQ9/G/Koe/BMzqucKu96hB7Y+6ijZPaIlk3kATDQ821EnvzJNuI9SNW56a9AS
	nSE/rNNzGxe5y7fke5gYJAQo2XLxR/E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-hFRIFDXrOKGDiVhlEh2Ikg-1; Tue,
 28 Nov 2023 05:01:05 -0500
X-MC-Unique: hFRIFDXrOKGDiVhlEh2Ikg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 555783C0DF75;
	Tue, 28 Nov 2023 10:01:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B74E20268D7;
	Tue, 28 Nov 2023 10:01:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 8/9] media: ov2740: Add a sleep after resetting the sensor
Date: Tue, 28 Nov 2023 11:00:46 +0100
Message-ID: <20231128100047.17529-9-hdegoede@redhat.com>
In-Reply-To: <20231128100047.17529-1-hdegoede@redhat.com>
References: <20231128100047.17529-1-hdegoede@redhat.com>
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
index 28230a73ff75..ef83807f216b 100644
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


