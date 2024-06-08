Return-Path: <linux-media+bounces-12773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF3901218
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 16:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D83D1C20ACA
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 14:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102C515D5CB;
	Sat,  8 Jun 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWlsk+io"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE21383BD
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717857510; cv=none; b=WX+IzgJg8OAliezH292Dw+OlMDYuDFdq0Bqz4CyM5JERe1n0HU0yvgZ2hYiLq+Ls4cU6XV4ALqws/7pXyAj/GzUlLexmAqowaUBhrCWlxJxfwHKvM7Da5FOdmqLaiC+rJhzyDsA+ARK9mKXA2FH5qzuS7g/tUVjve+7i6Pn5+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717857510; c=relaxed/simple;
	bh=H0HZErXCSvm+xHLOrEsJDhL2s3kkTkVhSfy6wImZT7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c3BIvuw0owQ0eW0yUPGLdBU/bXJ36PMIX8bMypBDHjoHHJkOwVN8uWfQwJ8qJ0QQWFmDvab3DMYHR6cpdycCTG43OgbEvb6XjQ9cv3W+gl050hBGEFGCwrvAlQE6ET+Qg8ZiLSjee5iB8UuJzD2Reg2djuVYfCsY2Af13mgs5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWlsk+io; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717857507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aiSu/o+Vl2BMDdaP7Ooe46zuYfZhy9NSRTPm5klE1oQ=;
	b=TWlsk+io/9Q2eLUr9Xt35hQorlMLZGRQkq/vxckfsfxQJIKhghhQwrKXAycCo4DTrlPMZD
	NJEgp30vtThe8QrPKeT3q8me7Ew+7y1EMUR5iLGF0KIY/gGXKIKa81gz2OqoGU6qXPqeIO
	RV/kXXZR91Vzm4sTLXwJrHifrjy3qnY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-FBWHiUvcOYaJns0xpQ6Bmw-1; Sat,
 08 Jun 2024 10:38:24 -0400
X-MC-Unique: FBWHiUvcOYaJns0xpQ6Bmw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 262BA19560AB;
	Sat,  8 Jun 2024 14:38:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.6])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6967630000C4;
	Sat,  8 Jun 2024 14:38:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ov2680: Pass correct number of controls to v4l2_ctrl_handler_init()
Date: Sat,  8 Jun 2024 16:38:15 +0200
Message-ID: <20240608143815.192079-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The ov2680 driver has 9 controls now and the call to
v4l2_ctrl_new_fwnode_properties() adds 2 more.

Tell v4l2_ctrl_handler_init() to pre-allocate space for 11
controls to match this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 3ae0ea58668d..7237fb27ecd0 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -971,7 +971,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_handler_init(hdl, 5);
+	v4l2_ctrl_handler_init(hdl, 11);
 
 	hdl->lock = &sensor->lock;
 
-- 
2.45.1


