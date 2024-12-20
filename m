Return-Path: <linux-media+bounces-23867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30379F9186
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E206165468
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1501C3F06;
	Fri, 20 Dec 2024 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IzaD4k96"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2901C07FE
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695016; cv=none; b=HsCfRE0DFuDwjVYARJ+JKb4ed8ghoD+Og9Wwz+Q8yg9q7pjADFtGTD8BwEbZQ8BfF5RGZDtv8YQznKnHGI84wYwQFtBsKMSeO3aGnAoUq5GQtqIc0FBMUo8lYaFeiD/NIRPG4uNq1Y7maxa93uR5OggWOtiWwe92ABM4GUv0bXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695016; c=relaxed/simple;
	bh=aao10dzqt96yU5beZA4/KFree79dGQBrHsMADMFYh50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHHU3bncHvNtdYSeDUKDhqK6+38gXB5wb3SOxGpN5bb6he+uIA+jL8YtufVw3Vu29mrcgfKztdneI6LpQAxG2esHJO/m76L7Fr8xu3i7R7REZozk8WrvMHT+yST34ZEaMmgH3e1wqClyF51WyBUhWryZIgSpcADr/ns2DM1SfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IzaD4k96; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734695013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fyr4JezP/PHWB46kPYzXFpV8G10d/iivBgujoHfVZEs=;
	b=IzaD4k96rNNitTxAyk1iEet4Yutbaj+fwg8Uu7KwjcVylOE9wQFm9nfAiQ/BD9Cs+SnCVA
	2/7zxim2O7F6ygtJZRcsTZd6lDBkpSdCB3mi4wrbjIdJy04irFBHa2NqSFjHoYbqZCjGRL
	e2Yn0RdY0Y42VAZ9FSPzHgM9MdueEA4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-VJd3mi5mMp2y0-E8umO3mA-1; Fri,
 20 Dec 2024 06:43:28 -0500
X-MC-Unique: VJd3mi5mMp2y0-E8umO3mA-1
X-Mimecast-MFC-AGG-ID: VJd3mi5mMp2y0-E8umO3mA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0675719560AA;
	Fri, 20 Dec 2024 11:43:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1DAE7195609D;
	Fri, 20 Dec 2024 11:43:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v2 1/4] media: ov2740: Debug log chip ID
Date: Fri, 20 Dec 2024 12:43:14 +0100
Message-ID: <20241220114317.21219-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Calling the identify function may get delayed till the first stream-on,
add a dev_dbg() to it so that we know when it has run. This is useful
to debug bring-up problems related to regulators / clks / GPIOs.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Prefix chip-id with "0x" when logging it as it is logged in hex
---
 drivers/media/i2c/ov2740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c484b753a718..a79e478342dd 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -644,6 +644,8 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 		return -ENXIO;
 	}
 
+	dev_dbg(&client->dev, "chip id: 0x%x\n", val);
+
 	ov2740->identified = true;
 
 	return 0;
-- 
2.47.1


