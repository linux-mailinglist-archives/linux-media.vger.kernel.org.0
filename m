Return-Path: <linux-media+bounces-1202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 169957FB687
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C535E2827FC
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94404D59F;
	Tue, 28 Nov 2023 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+mrCl0E"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A4F135
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDrBB2pTA7x4T3SoaKJuqnC5E5qAuO3yiZgLBi/jsPU=;
	b=L+mrCl0EPYtH3QL6vP9MkSosp75kwDS/e6bSL3Z6Ydv/KYj5ksSOKLXR035eeB0IvEHgAE
	ft+14+3lhVvSvlOLPZixc/pDaxkibZn/dTcS4rOIPKCckA439X428TtW+xIj7RcUlQrbdM
	QWWjvltXMcSgUr7ToZnONKl/Z00Ntk4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-670-AxxHdAljPTC-6trVSC5zWQ-1; Tue,
 28 Nov 2023 05:01:00 -0500
X-MC-Unique: AxxHdAljPTC-6trVSC5zWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E74B91C0314B;
	Tue, 28 Nov 2023 10:00:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B008620268D8;
	Tue, 28 Nov 2023 10:00:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/9] media: ov2740: Improve ov2740_check_hwcfg() error reporting
Date: Tue, 28 Nov 2023 11:00:42 +0100
Message-ID: <20231128100047.17529-5-hdegoede@redhat.com>
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

Make ov2740_check_hwcfg() report an error on failure in all error paths,
so that it is always clear why the probe() failed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 35b2f43bd3e5..87176948f766 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -937,7 +937,8 @@ static int ov2740_check_hwcfg(struct device *dev)
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
 		fwnode_handle_put(ep);
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "reading clock-frequency property\n");
 	}
 
 	if (mclk != OV2740_MCLK) {
@@ -950,7 +951,7 @@ static int ov2740_check_hwcfg(struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV2740_DATA_LANES) {
 		ret = dev_err_probe(dev, -EINVAL,
-- 
2.41.0


