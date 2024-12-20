Return-Path: <linux-media+bounces-23868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061C9F9187
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B24AC7A3672
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291E31C3F39;
	Fri, 20 Dec 2024 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOwqMwdd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC91C07CD
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695018; cv=none; b=Hmzp6QgnTd0VmaVZxN0S9CYSY4E5QS5GQnF/tYB3emzXTrPeHWuNQOhWNjmBsp81GQQZO0r+nWDL67g+dyWNxU4m0+mhRxgjTmTD+l5k9RahSAg1GDd6jeIKUrG/GpRx6OZLWhMYiz5lMnqaeTdfP2tHpqnddLcovHgmC+TNmYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695018; c=relaxed/simple;
	bh=ldfR3xb/ut09rqX6lTdfeOyz8/A5w+uOLKEWgSXGrSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogn/TQOsWJAIQ7cnASd3BUjL/4VrL0NKsrJ8EWW4z8DGxPpgKPmY/Ae/MjQOvljgdoIyuyFVhESCktfmhwSP7XerDi46xMChHpYKSoVCLj/xlvF3sLt6RQeBxivJvgJGAH1ssjW2IV3jgmH4N5AjN5N+ryBrtARljbSvDkpbu0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOwqMwdd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734695014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ze+ZgzfkRj3DNrpGfsdmyoEAPQoL1RY7NC2bvvVgYu4=;
	b=QOwqMwddmtaRDMMFm1pKDskKZNNQugSUOMoZmoIvEMovAEauePMbpOmdPOieXLxbQnoFPF
	qML2M3kfIRjRuhBjLK3AY3UIz7gIeihSFJQNNpEVvkW6KvS1x2W9jQilnZAKUHHg0X2S0h
	zGEO6g5zIPXD2xreiRGlTWGzwkOkyMo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-kIAT7G1GPBaWggb8N2BRtg-1; Fri,
 20 Dec 2024 06:43:31 -0500
X-MC-Unique: kIAT7G1GPBaWggb8N2BRtg-1
X-Mimecast-MFC-AGG-ID: kIAT7G1GPBaWggb8N2BRtg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D877719560A2;
	Fri, 20 Dec 2024 11:43:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4ECDE195608A;
	Fri, 20 Dec 2024 11:43:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v2 2/4] media: ov2740: Add camera orientation and sensor rotation controls
Date: Fri, 20 Dec 2024 12:43:15 +0100
Message-ID: <20241220114317.21219-2-hdegoede@redhat.com>
In-Reply-To: <20241220114317.21219-1-hdegoede@redhat.com>
References: <20241220114317.21219-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add camera orientation and sensor rotation controls using
the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
helpers.

Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Call v4l2_ctrl_handler_free() on v4l2_fwnode_device_parse() errors
---
 drivers/media/i2c/ov2740.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index a79e478342dd..bd7475c337e2 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -755,15 +755,17 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
 
 static int ov2740_init_controls(struct ov2740 *ov2740)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const struct ov2740_mode *cur_mode;
 	s64 exposure_max, h_blank, pixel_rate;
 	u32 vblank_min, vblank_max, vblank_default;
+	struct v4l2_fwnode_device_properties props;
 	int size;
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -813,6 +815,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
 				     0, 0, ov2740_test_pattern_menu);
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
+		return ret;
+	}
+
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
+
 	if (ctrl_hdlr->error) {
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
-- 
2.47.1


