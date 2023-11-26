Return-Path: <linux-media+bounces-1044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 357147F92FC
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 678B11C20C4D
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EFDD52B;
	Sun, 26 Nov 2023 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lr+hNGZ3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3D4FD
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtVI7RxWr8cKqPIQteNPkL1i5Vg7eWyjEHR0Xt5NBLs=;
	b=Lr+hNGZ3g3adsbVazYfNfAnihrFSUJR9Z7vKu9HP/vJ62uZGcL9g8Rqf0LeUbIAMCTzVCX
	FKT0VO6pKv1Aca6918Kf3i8CpRJD68dj/D14V8+pjlihMdUfzKuqNlmrj9YJ2U6vgsWcJE
	W4V/rscRhLL9BNH6Du1+QzzXEcLa6Xo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-L6mT30PgOYCxR26JbR1L7A-1; Sun, 26 Nov 2023 09:15:29 -0500
X-MC-Unique: L6mT30PgOYCxR26JbR1L7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1559F811E7B;
	Sun, 26 Nov 2023 14:15:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A67C2026D33;
	Sun, 26 Nov 2023 14:15:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 4/9] media: ov2740: Improve ov2740_check_hwcfg() error reporting
Date: Sun, 26 Nov 2023 15:15:12 +0100
Message-ID: <20231126141517.7534-5-hdegoede@redhat.com>
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

Make ov2740_check_hwcfg() report an error on failure in all error paths,
so that it is always clear why the probe() failed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 832f24721dca..7e31aa2decd0 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -936,7 +936,8 @@ static int ov2740_check_hwcfg(struct device *dev)
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "reading clock-frequency property\n");
 
 	if (mclk != OV2740_MCLK)
 		return dev_err_probe(dev, -EINVAL,
@@ -946,7 +947,7 @@ static int ov2740_check_hwcfg(struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV2740_DATA_LANES) {
 		ret = dev_err_probe(dev, -EINVAL,
-- 
2.41.0


