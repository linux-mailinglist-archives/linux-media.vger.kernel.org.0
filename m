Return-Path: <linux-media+bounces-27262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A2A4AAD2
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 12:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AFC01885EDA
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 11:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73C01DC9B8;
	Sat,  1 Mar 2025 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JGZFztft"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5344823F37D
	for <linux-media@vger.kernel.org>; Sat,  1 Mar 2025 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829720; cv=none; b=X/hsAVugFIaTOVOqVZKHbwjzpOGR744wBurQ/1wC8GPAmmuUaI5/wYhvCVEjL7rgI28tmyqbGn3tZ7AkQ8mGj5ngFmNugv6X5BgFDdJEkJKa9A2DzVSmCU+9NtiFLUwW9ppAlgG+uSr6TN6DHOj7XGpxc5SMb0PQcE/wob8dU14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829720; c=relaxed/simple;
	bh=78fCvBFXnyWcLO2awmbYh1GvgaaeSV76wAe5nOAWM7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqZMYAnpBPMiX/KrCKB5jGsS1aWuAjuH6oLyuqJolsVKxVs9Chj6rptvfVvRpUll7FpIab8x7L2mXM2iJ65VR+6mfP3Ya4Q0rP2uBouazJjRBnvIjFv0hJpihawTty7Pm6a2DNuO9Zl1/LJvKLZuQsr/YhYHHpiOZHYIhpDumjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JGZFztft; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740829717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8bTTssIo/QD3yZHkz9RzXMFjTRQE6SuMFwZxUMZS53I=;
	b=JGZFztftkn8Vwr5d989j8QVYvGly9wcGFGd87CjGAR507+iCdwB7eGKtL1th9mx0kf9AZY
	OHFdp99hRyDC8PyVbIo3KOqgB7FIKbS3aXkK0190W/XexziwI1/4tsi9odvrSeuVCFWLCC
	qDMZCoIscug4QzsdEPSECu9G1QfzK50=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-XHec2s40NOek9B2WkX6rGQ-1; Sat,
 01 Mar 2025 06:48:35 -0500
X-MC-Unique: XHec2s40NOek9B2WkX6rGQ-1
X-Mimecast-MFC-AGG-ID: XHec2s40NOek9B2WkX6rGQ_1740829714
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73FA21800268;
	Sat,  1 Mar 2025 11:48:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E9BF19560AE;
	Sat,  1 Mar 2025 11:48:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: ov08x40: Fix value of reset GPIO when requesting it
Date: Sat,  1 Mar 2025 12:48:29 +0100
Message-ID: <20250301114830.22668-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

We should put/leave the sensor in reset when requesting the GPIO, after
requesting it there are 2 possible scenarios and having the GPIO driven
low is no good in either scenario:

1. The sensor was in ACPI D0 before probe() runs, in this case
   ov08x40_power_on() + ov08x40_identify_module() will run immediately
   after requesting the GPIO and ov08x40_power_on() starts with driving
   the GPIO high. So if the GPIO was already high it will very shortly
   be driven low, more of a spike to low then actually properly be driven
   low. Which may leave the sensor in a confused state.

   If we request the GPIO to be high at request time then power_on() will
   driver it high again (no-op) and then sleep for 1-2 ms, so no spike.

2. The sensor was in ACPI D3 / off before probe(), in this case probe()
   leaves the sensor alone. But when the sensor is off its reset line
   should be driven high not low.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index c2a399e3bb41..a4790e68f523 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2167,7 +2167,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						    GPIOD_OUT_LOW);
+						    GPIOD_OUT_HIGH);
 	if (IS_ERR(ov08x->reset_gpio)) {
 		ret = dev_err_probe(dev, PTR_ERR(ov08x->reset_gpio),
 				    "getting reset GPIO\n");
-- 
2.48.1


