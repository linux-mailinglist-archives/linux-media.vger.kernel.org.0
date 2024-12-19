Return-Path: <linux-media+bounces-23839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D29F843B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B6DD7A07F4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF94E1B4220;
	Thu, 19 Dec 2024 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dd/XOevT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703E1AAA0D
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636468; cv=none; b=caKJDu1IhaM/S0Anfrb/aqxVIq3AhowHoHHHFv5W70d/wVFuxdRvDrNuUWGxlbi8koKtQXRq9epfkOXaq1dIhtcJ5oiQ3Eyp882qcvAo4rRcUvan1QyHsUj0+tP5Etsq/emCaSBLnqFDt+I4hia+81fdLhol8G67k+oVxF/YTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636468; c=relaxed/simple;
	bh=PBG14hg0sWDIRS+jtzh3sHSuXsS4dCOf11Hlwm+zvxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9eTChD4bixOU/lQ6xOlKiwTT6ckFVIC2/P1rBuMapHudS27jqFeNO8xVLGPuwSPuFftUBzKSKjV9tpl739l7lJ8ihr81NxnyJPgpdorBc+lgNjrTrX8NMSBpwrG98obWP2Dox7SSWWHYbdKyS7eT0+QlgedHHfjd6zTUKTQqPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dd/XOevT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=heDsUvY2themo17pphCDVW4owjAYMa0e97gtkFz1I5I=;
	b=Dd/XOevTccm9WR2dZyGTxnAd+PFsgry7BK3IzbgPRxpz/ruU3SHVxwxbdUR6bdNNEmeWQ2
	xWPYuHL61RjYuHYyuSVAgJE6C5ZQUMl24qIo/tDqqGeOcznWiNwYFc45HN5n0+G3lqZ3Bs
	PEToRXpAE2CAXsAvirlt5p9j2pesZ+0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-v7CvWrBAMsOOQO2nvXpNaw-1; Thu,
 19 Dec 2024 14:27:42 -0500
X-MC-Unique: v7CvWrBAMsOOQO2nvXpNaw-1
X-Mimecast-MFC-AGG-ID: v7CvWrBAMsOOQO2nvXpNaw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B3AA1955F41;
	Thu, 19 Dec 2024 19:27:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 09EA4195608A;
	Thu, 19 Dec 2024 19:27:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: hi556: Don't log hi556_check_hwcfg() errors twice
Date: Thu, 19 Dec 2024 20:27:33 +0100
Message-ID: <20241219192733.45659-4-hdegoede@redhat.com>
In-Reply-To: <20241219192733.45659-1-hdegoede@redhat.com>
References: <20241219192733.45659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

All hi556_check_hwcfg() error-exit paths already log a detailed reason,
logging a second generic "failed to check HW configuration" error is not
useful, and in case of the fwnode check failing with -EPROBE_DEFER this
is outright problematic flooding the log with:

[    6.336318] hi556 i2c-INT3537:00: failed to check HW configuration: -517
[    6.339006] hi556 i2c-INT3537:00: failed to check HW configuration: -517
[    6.346293] hi556 i2c-INT3537:00: failed to check HW configuration: -517
[    6.356129] hi556 i2c-INT3537:00: failed to check HW configuration: -517
[    6.380316] hi556 i2c-INT3537:00: failed to check HW configuration: -517
etc.

The one exception to all hi556_check_hwcfg() error-exit paths already
logging an error is on v4l2_fwnode_endpoint_alloc_parse() errors.

Make hi556_check_hwcfg() log an error in that case too and drop
the duplicate "failed to check HW configuration" error logging.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2307279
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 57c51d0e9c4e..9b5b657f75f9 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1226,7 +1226,7 @@ static int hi556_check_hwcfg(struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
@@ -1334,11 +1334,8 @@ static int hi556_probe(struct i2c_client *client)
 	int ret;
 
 	ret = hi556_check_hwcfg(&client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d\n",
-			ret);
+	if (ret)
 		return ret;
-	}
 
 	hi556 = devm_kzalloc(&client->dev, sizeof(*hi556), GFP_KERNEL);
 	if (!hi556)
-- 
2.47.1


