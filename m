Return-Path: <linux-media+bounces-19494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FB99B49F
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 13:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE4121F21A29
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 11:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241AF1552FD;
	Sat, 12 Oct 2024 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W5+PJfi6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA139178388
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728733974; cv=none; b=TIsWfKYRr0hRtKawjWRwNsyVVi+THOBbEyFyriVYN+tSSxBjXSiSYowCu3ZuXczwpfc0r4QRj7e7OS35V+Kit3gOa3ISlXPZcWQ3EFuZ1f6THJjpCMgNF/bmbMVH+U4CWXlAoEbwJ3uHuP1nj5H8NYHQSI85zSa84HaB5Pw1Aug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728733974; c=relaxed/simple;
	bh=E9GHF8skJhDSzVIw8MDMojtqp/74CK7Us+19GRWs3Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMyDQ6oscYUMCKbXX6l3zjNzD1T/Gg/sKRLJd13XCbJYz3n7+v3iB1vQPUqGuaYSPaRS7p4pXZAlHyBsCEt1HyftU+BhNfdEJBUnz9ie35e+VdB3wAoWq3gBewPERxMaxL/C624BsGcQtTmcSGcguTTZa4BIMalBG4CU/fg5dAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W5+PJfi6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728733971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCeOdxd8p3JwCN0jTa0n/W0qp9/usxWI2i/lvrI+VAw=;
	b=W5+PJfi6VPWlvDC1ym3P1PXWewl+BXPVp3FQHptL8m9etPE26bhm7KB7d1ARkAGojua+/Q
	vzi5KGq2ZRScSmOBOjgJ9Vjh4CwabgZ6gupnShCNB5LWWY/BA95Jw8UVnoYg7qleYUeIQi
	pG4FF8k4qW1gOGNeMl+WH9jKul1O0eU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-WB7HK5ckOxWyiyrxYP6-KA-1; Sat,
 12 Oct 2024 07:52:47 -0400
X-MC-Unique: WB7HK5ckOxWyiyrxYP6-KA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DBBF19560B4;
	Sat, 12 Oct 2024 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B00F1956052;
	Sat, 12 Oct 2024 11:52:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error messages
Date: Sat, 12 Oct 2024 13:52:36 +0200
Message-ID: <20241012115236.53998-2-hdegoede@redhat.com>
In-Reply-To: <20241012115236.53998-1-hdegoede@redhat.com>
References: <20241012115236.53998-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add '\n' to the dev_err() error messages printed on ov08x40_check_hwcfg()
errors.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index c0dc918edc3c..610fb3ef46c4 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2087,14 +2087,14 @@ static int ov08x40_check_hwcfg(struct device *dev)
 	}
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
-		dev_err(dev, "number of CSI2 data lanes %d is not supported",
+		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto out_err;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "no link frequencies defined");
+		dev_err(dev, "no link frequencies defined\n");
 		ret = -EINVAL;
 		goto out_err;
 	}
@@ -2107,7 +2107,7 @@ static int ov08x40_check_hwcfg(struct device *dev)
 		}
 
 		if (j == bus_cfg.nr_of_link_frequencies) {
-			dev_err(dev, "no link frequency %lld supported",
+			dev_err(dev, "no link frequency %lld supported\n",
 				link_freq_menu_items[i]);
 			ret = -EINVAL;
 			goto out_err;
@@ -2129,7 +2129,7 @@ static int ov08x40_probe(struct i2c_client *client)
 	/* Check HW config */
 	ret = ov08x40_check_hwcfg(&client->dev);
 	if (ret) {
-		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
+		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.0


