Return-Path: <linux-media+bounces-13783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDA91016F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06B1C1F229E7
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 10:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58C41AAE02;
	Thu, 20 Jun 2024 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O6hLk7Ps"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF1502A9;
	Thu, 20 Jun 2024 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718879191; cv=none; b=jKx9b+H5FZQjAw9emhKzX3nnnQS4NDjXqTegw5A+eCqTW3oYUSiORylu3FA+E0mWa1rEnf3aeevzB+6lbfQ5JlEOFsA89NCvMl/OPnRou4xnXmAIDkHr7IBCJlBZJ6tQ6Gl3urHqoKTN9UG9QRfINzW6eJLvhBDV1vRQ0W0TxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718879191; c=relaxed/simple;
	bh=bI6RxBYgqbqur15/eUPu5fZyxNndJgAurFbfl+c709M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fJzDj1Hgbm6UhJQRwzZmVe0X30VD38g3tQrsWaVv/Pd449cxywTIQUi7sKD5bpd9gknJ4+8rAOn99t5vxjtQ2YQ4H3WBDwK3/rujHT46P+qkThKR2LEg1t2gEk5J5utkpVhIhUewPcXaNjVfrRDGbLhDM5/+l47dxQZOPArRL0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O6hLk7Ps; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A477D60006;
	Thu, 20 Jun 2024 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718879187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hpJEQKRGF9WspM0ypchRT8Sbf2pKb1stUkZNjvHSRTI=;
	b=O6hLk7Pswp6Ok2aWI95cBozJzEyjjai+FL8cy88bKZOcYE1uBYAzfV1iyoXzAaCb02Hugs
	YB+CCC5nH1HRSzsaZLNImTRIej2rrHlMLqqji3X/qngHCcQ7kH6C+pRkHqe0BjJFUB5m3c
	byWqzely11tw76g7vFMy6cN+/eBvASDj9VYd57IefKYq6SakIZ2Jg+XpB9ciOZ5mq65aVH
	vIMC+jsAeQkfNGts8hwPTREnUmtBlZwKgwKflxMhOqmMGSQ+gAGNLmQv91nbDRS45Et82H
	hcxM+9HmrO3RKKft29gIj48fRtcsJgFk5xgy0SVbJ+/Pr9AZPPPQ9uuRLSd2rg==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: i2c: Kconfig: Fix missing firmware upload config select
Date: Thu, 20 Jun 2024 12:25:43 +0200
Message-Id: <20240620102544.1918105-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kory.maincent@bootlin.com

FW_LOADER config only selects the firmware loader API, but we also need
the sysfs_upload symbols for firmware_upload_unregister() and
firmware_upload_register() to function properly.

Fixes: 7a52ab415b43 ("media: i2c: Add driver for THine THP7312")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c6d3ee472d81..742bc665602e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -679,6 +679,7 @@ config VIDEO_THP7312
 	tristate "THine THP7312 support"
 	depends on I2C
 	select FW_LOADER
+	select FW_UPLOAD
 	select MEDIA_CONTROLLER
 	select V4L2_CCI_I2C
 	select V4L2_FWNODE
-- 
2.34.1


