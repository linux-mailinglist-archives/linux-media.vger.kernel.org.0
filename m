Return-Path: <linux-media+bounces-23930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B19F94AB
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 543EC1889F71
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E886F2185B4;
	Fri, 20 Dec 2024 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WwGd34zs"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027121859D
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705709; cv=none; b=udxXecnGL/l7s+KwxgJ7UJ9bh7RPZR+tSqLyGJWUnigQsWz0B/Z3PanE3ogKHMDye7tlUcm1VJkH+GMh5/MyQNLqlw+sp+sHmAKpF54JKayNiOb6KmRWPgwvKarWPODElY0UwX4okovPFETVjTVY8s6KATTBfdc4eMc8JqHUCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705709; c=relaxed/simple;
	bh=S79IH9uQrKnSpqwqyKNdK8l18xDH1QS/F1MGC3GTQGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPN0PIFVaRprIz9nOxWFa8dSiQHSYqg2OPGKzS31tzRJWmtXtP2U7tHjK5THwBa24IY/iYS5/UBpc2KFvKicmccmuMWlj7roaAagVLWGhYDoKdNiIhRxYNF8y/swFcebFvwk8gHLzbm6pqMZDEAdGOqpxbOTQETraurXnyumMOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WwGd34zs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vg3rH1dUVRipxtVAruGyIBJRtszYktTBFbJ2xpH6gSc=;
	b=WwGd34zsQjWBFPARLpZlcQZXzV1PbdSVtLGtJXp749FSRwncCUx0qrnoOGJBQP3ln/RBsf
	rUUS1Yyb59Yp265O0Wm3/rKbxjf1EvQ7uWqXb0AQbykUeZmm4VRNOOPWwKm4LeSpkawD9l
	Yz7Jf5o26CM+ISkRn5fhkEaZkt7z1/g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-IFCnUmbZPw2zrXhJaS2weQ-1; Fri,
 20 Dec 2024 09:41:45 -0500
X-MC-Unique: IFCnUmbZPw2zrXhJaS2weQ-1
X-Mimecast-MFC-AGG-ID: IFCnUmbZPw2zrXhJaS2weQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71EAE195608B;
	Fri, 20 Dec 2024 14:41:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D51219560AD;
	Fri, 20 Dec 2024 14:41:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 01/10] media: ov08x40: Properly turn sensor on/off when runtime-suspended
Date: Fri, 20 Dec 2024 15:41:21 +0100
Message-ID: <20241220144130.66765-2-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Commit df1ae2251a50 ("media: ov08x40: Add OF probe support") added support
for a reset GPIO, regulators and a clk provider controlled through new
ov08x40_power_off() and ov08x40_power_on() functions.

But it missed adding a pm ops structure to call these functions on
runtime suspend/resume. Add the missing pm ops and only call
ov08x40_power_off() on remove() when not already runtime-suspended
to avoid unbalanced regulator / clock disable calls.

Fixes: df1ae2251a50 ("media: ov08x40: Add OF probe support")
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix wrong argument order of DEFINE_RUNTIME_DEV_PM_OPS() macro (oops)
---
 drivers/media/i2c/ov08x40.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b9682264e2f5..83b49cf114ac 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2324,11 +2324,14 @@ static void ov08x40_remove(struct i2c_client *client)
 	ov08x40_free_controls(ov08x);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov08x40_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	ov08x40_power_off(&client->dev);
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
+				 ov08x40_power_on, NULL);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08x40_acpi_ids[] = {
 	{"OVTI08F4"},
@@ -2349,6 +2352,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
 		.name = "ov08x40",
 		.acpi_match_table = ACPI_PTR(ov08x40_acpi_ids),
 		.of_match_table = ov08x40_of_match,
+		.pm = pm_sleep_ptr(&ov08x40_pm_ops),
 	},
 	.probe = ov08x40_probe,
 	.remove = ov08x40_remove,
-- 
2.47.1


