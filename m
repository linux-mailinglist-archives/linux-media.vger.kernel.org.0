Return-Path: <linux-media+bounces-19502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9E99B608
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 18:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D4941F21EBF
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 16:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FFF3C488;
	Sat, 12 Oct 2024 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IfpJ6GCb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63103FE55
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728749300; cv=none; b=oyWEx0ZNbAtxQcv67Q9Oi7gGrhOmOeNYDhz3JBhPUftfDUJjeRLwWeH/7yi4Y0YEpw4ml/xwtbH5kDAvJij6947skaH3sn2GeY+GpfsCxZaZxwADJgGJQbJxOGBfV1nSmHEN/mpC6CrWRQ5R/+USRP54Uz15BeuEgVDqcFbkb04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728749300; c=relaxed/simple;
	bh=jVL9NDyAZosG+TJtEtuhrsMzeQvdojMyWds1vh4eqOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKYYQ6RrpYd3gK6kun/aYfRRnUw1k4+Cm//hm5qW1F8ekD7GAo6YXDNCGydzcNYyJuC8+J/4zRPsdWlcqulnVbujfJiruAIlxOuG1PpQ8rIhiZZvRQ72ldb7Lnn2VzqVig3u1v6Q/bYVGUO24J5QuPUromWpFmJ1nhl/KAYl4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IfpJ6GCb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728749297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5YO9qp6s86ZmgZj+SdmgoRJkqh7tgp5aeNN+KID1+WA=;
	b=IfpJ6GCbmRlKNT5VsnSHecrKQ87Glih/p5GNeS57saGp61BqQMmwDzO7SXCIKMvxOb5ZV6
	WOtWOR+p4GjcZ6HPUc38AFQr4PXmMuu/bH2E4kriQB7lT1vQLBclyKq4SoTc/E6u0JV8Dk
	iKbiXuPp6pqQ+teQZQLKWCPPKmb7Zo8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-QQKZjbFPOy6bWV-kvHzNHQ-1; Sat,
 12 Oct 2024 12:08:15 -0400
X-MC-Unique: QQKZjbFPOy6bWV-kvHzNHQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0969D195608A;
	Sat, 12 Oct 2024 16:08:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0DF4F3000198;
	Sat, 12 Oct 2024 16:08:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ov2740: Don't log ov2740_check_hwcfg() errors twice
Date: Sat, 12 Oct 2024 18:08:03 +0200
Message-ID: <20241012160803.75939-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

All ov2740_check_hwcfg() error-exit paths already log a detailed reason,
logging a second generic "failed to check HW configuration" error is
not useful, drop this.

The one exception is the -EPROBE_DEFER exit on
fwnode_graph_get_next_endpoint() returning NULL.

Call dev_err_probe() there to register the reason for deferring the probe,
this is used if the endpoint is still not there after 30 seconds, e.g. :

 i2c-INT3474:00: deferred probe pending: waiting for fwnode graph endpoint

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index bd0b2f0f0d45..387c529d9736 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1132,7 +1132,8 @@ static int ov2740_check_hwcfg(struct device *dev)
 	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
@@ -1330,7 +1331,7 @@ static int ov2740_probe(struct i2c_client *client)
 
 	ret = ov2740_check_hwcfg(dev);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
+		return ret;
 
 	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov2740->reset_gpio)) {
-- 
2.47.0


