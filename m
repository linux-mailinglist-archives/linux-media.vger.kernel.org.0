Return-Path: <linux-media+bounces-22229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F609DBA6F
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C4FC28179B
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370D01B6CE1;
	Thu, 28 Nov 2024 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PtZQLiOI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B93199253
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807439; cv=none; b=rnaf29+tZ4eJgL2QRQ+Vhv+2RzSQu0ZFibZ4PvwzaEUsWpAUyae5bUlzgnEyPzKSDccLRn7qcUaQgEa8MTC+g9xw3PnS3MDHX7yDhzNd5kJOseASEAACkhf5+bthqfNFW0LFnN3Kh2IN6tegJHR/IZzdy/2izVQmRasQhwXBy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807439; c=relaxed/simple;
	bh=fsmNA5zn091LnVslxdBPWwKHwDzJf5S4jEX1B1cFVrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCwPh3/WywYnVXo1t+Fd44j4MfijvOEN1n0AHuj6hVV2/9b9FW1VXHVbrrCL6TbRB9RcIexKnekXuBUC8m8cDjkXoSZcjYsG/7PlAk0J8ibJneBCt6OTxfb6PxvJiQIb+BQ+TQdr7th0txVKXgVGGFQug3WVZ11yJGYzC9KROGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PtZQLiOI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732807435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNVIZ6mq27cS4rItESewJ3EUgT5RCW9F0JluKeyqQFE=;
	b=PtZQLiOINJLd9dyZ+sFPYvIqBdrKmBwVZauxUXKA8UqL4CQ/HEG7VM7xRXV+rMWmCLCHXE
	/05YlMaEHjJMhbfbl7vZ7mUix8xPLSvrDS7/pg3/q7JnC4ddzre50PMIjs2/GfQ1GwlzRU
	7/W8NLo4qT4ZieK0cbz6PoBv95axrps=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-wNhiZlpzPtyZAjrJManvqA-1; Thu,
 28 Nov 2024 10:23:50 -0500
X-MC-Unique: wNhiZlpzPtyZAjrJManvqA-1
X-Mimecast-MFC-AGG-ID: wNhiZlpzPtyZAjrJManvqA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71D951955F33;
	Thu, 28 Nov 2024 15:23:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 48AA0195608A;
	Thu, 28 Nov 2024 15:23:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/4] media: ov2740: Add camera orientation and sensor rotation controls
Date: Thu, 28 Nov 2024 16:23:36 +0100
Message-ID: <20241128152338.4583-3-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-1-hdegoede@redhat.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index e7a611967b40..998e1977978d 100644
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
 
@@ -813,6 +815,13 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
 				     0, 0, ov2740_test_pattern_menu);
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
+
 	if (ctrl_hdlr->error) {
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
-- 
2.47.0


