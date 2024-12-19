Return-Path: <linux-media+bounces-23789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 872569F7CAB
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2809418925C2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9ED224B0B;
	Thu, 19 Dec 2024 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VHx2tL2g"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41404224AE3
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616192; cv=none; b=pPtkY/O6fOp91/Lj/cLZO7VVptKQBcl/U7CB4XVZZV1WwpFqGJhUha6SMbo0NA6JVEUgEqyF3Z3r4cx9Qw2jez687B2JHIxxJ3lxf/y7m4/1dRnZQ0GjyixRjsrlVi3WRC1Lk8pWwAUc085mTZVmKOg+zsshAalL9C3WQ7zh9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616192; c=relaxed/simple;
	bh=pDmgfodYgcujR/zkjQksND3Tbo7bQdDfdx+CHhRLe/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b14MMRk0ZjGW6AiQReN5WkBNFj2+JcCp+Cq3ECcQqHDZMsf8AhXllkGVW5YzodRMCL8RMpB/LIjTuTL1ak8IagCZ9ST8BGJHjm1d/NH8MhfNeIcHp84HwBMwE/HEH2igkWIkkz29o+jIkV8lmf8eUZNheT/G7b4pW1nA3ywxsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VHx2tL2g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TNuKj/GC6BKRW7dRblC0wfxYIk0g1MD46Ol1TJX8c4=;
	b=VHx2tL2gh0GC9evu1GvgZqRSoqF6C9a4AqSWtyFAcSu3WZkejVO8wz+pzf9cJuyIg6CEI4
	u8VcmMe92WN41aFXQw0qXkBrWlZzPrKcU0gHRoLj3NMI9aEb7pe3RG3JhPhTR6JRw13TMR
	4/i99fANfA+SOi4PwXSkajYuZXcyIc0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-1QBQyP1tO8i_lr74X9K_Ng-1; Thu,
 19 Dec 2024 08:49:47 -0500
X-MC-Unique: 1QBQyP1tO8i_lr74X9K_Ng-1
X-Mimecast-MFC-AGG-ID: 1QBQyP1tO8i_lr74X9K_Ng
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DFA2E19560BD;
	Thu, 19 Dec 2024 13:49:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBC131955F54;
	Thu, 19 Dec 2024 13:49:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when runtime-suspended
Date: Thu, 19 Dec 2024 14:49:33 +0100
Message-ID: <20241219134940.15472-2-hdegoede@redhat.com>
In-Reply-To: <20241219134940.15472-1-hdegoede@redhat.com>
References: <20241219134940.15472-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Commit df1ae2251a50 ("media: ov08x40: Add OF probe support") added support
for a reset GPIO, regulators and a clk provider controlled through new
ov08x40_power_off() and ov08x40_power_on() functions.

But it missed adding a pm ops structure to call these functions on
runtime suspend/resume. Add the missing pm ops and only call
ov08x40_power_off() on remove() when not already runtime-suspended
to avoid unbalanced regulator / clock disable calls.

Fixes: df1ae2251a50 ("media: ov08x40: Add OF probe support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b9682264e2f5..aae923da1e86 100644
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
 
+static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_on,
+				 ov08x40_power_off, NULL);
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


