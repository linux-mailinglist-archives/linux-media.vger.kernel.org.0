Return-Path: <linux-media+bounces-1546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177A80332E
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17E81F210BA
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B249944E;
	Mon,  4 Dec 2023 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IXzE5ltb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F9510C1
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZeBMct8EZB21G3QoPVaP8jikFy84Nw+wzha9SNLGjg=;
	b=IXzE5ltb6eo7LP2Wh4s2sym9/4kb00ZcbfIYnBdb2pftueArXsQCL7tSPqzzyxB9QCAWTp
	AIqOoMwqrP997mMKtAyzsgdOCWnZrXVflg8JB/IttmH/siRlR/1Z1qH0PA74PUeo1sxV6N
	pmkPArsAPETev+nzn9kEsU+6CKhXk1I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-yuHo2JCnOC-NLTACiOjcBw-1; Mon, 04 Dec 2023 07:39:55 -0500
X-MC-Unique: yuHo2JCnOC-NLTACiOjcBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FDE85A58B;
	Mon,  4 Dec 2023 12:39:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2747A40C6EBA;
	Mon,  4 Dec 2023 12:39:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 4/9] media: ov2740: Improve ov2740_check_hwcfg() error reporting
Date: Mon,  4 Dec 2023 13:39:41 +0100
Message-ID: <20231204123947.5754-5-hdegoede@redhat.com>
In-Reply-To: <20231204123947.5754-1-hdegoede@redhat.com>
References: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Make ov2740_check_hwcfg() report an error on failure in all error paths,
so that it is always clear why the probe() failed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 06427e886d15..1cbe0ac16995 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -940,7 +940,8 @@ static int ov2740_check_hwcfg(struct device *dev)
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
 		fwnode_handle_put(ep);
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "reading clock-frequency property\n");
 	}
 
 	if (mclk != OV2740_MCLK) {
@@ -953,7 +954,7 @@ static int ov2740_check_hwcfg(struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV2740_DATA_LANES) {
 		ret = dev_err_probe(dev, -EINVAL,
-- 
2.43.0


