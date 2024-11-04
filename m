Return-Path: <linux-media+bounces-20798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F09BB4C3
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ED58B24038
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A661B0F33;
	Mon,  4 Nov 2024 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIQlqs0K"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CA1EEE6
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723925; cv=none; b=KeJ9q/PDw8bloFtWOUzPa2fMkUD9ccUozLI8+QRIiVToALGCl6Gqe62uD2778PFLCjTcxvl6U54VRpjAk4OixOjRXcFb9QxHmwvhUdiD4n0xs2H0M8kjYjGrLlxDxOFRDp1ub2u9qxs1N3gFaFweMt47N17jl8MZXf5a/nfJL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723925; c=relaxed/simple;
	bh=kMRb9z0LlhB8JxNVhjyC70W0C4O+kyzjIdxTWZp+rDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3KFrRCwLp4FknivrYQtbD8e6Tf6gkFbnLNPZciaw22Lc3TuUxU5rmpZnkeRTENjRRpo3hqqUDPDLZ7BIzLHYGOa6vk0K439GieGfQex39Rul9yrImUjPRr1mrdV3/sj1hSHOBLaw/UCSR3G/eJeQ6w8G8xXiUzMzodDUDSZSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIQlqs0K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730723923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0TguugBBm63nRqzUI6ZsbECp0dH0NtKZZBhHRwBumm4=;
	b=FIQlqs0KYlUarM64NH95eggsVv2J/AzRjC5iHAjbaJ9jTShz+UEiVzoO8UjmSRtQBuF669
	Lpmkurc7aGHf6Itbu/oXaqmZ+y/yT0N5kUfFIpgdZKGwtPht0Nl+kIuNB32LwOwx+F0GYP
	Mi2JM3oLAe1vSzZugTCFActe7kNNmSE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-MTYynnx7O8az3bNUCNXZHg-1; Mon,
 04 Nov 2024 07:38:38 -0500
X-MC-Unique: MTYynnx7O8az3bNUCNXZHg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E13D19560BA;
	Mon,  4 Nov 2024 12:38:37 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E7D1A19560A2;
	Mon,  4 Nov 2024 12:38:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Remove gmin_platform Asus T100TA quirks
Date: Mon,  4 Nov 2024 13:38:32 +0100
Message-ID: <20241104123832.5539-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The Asus T100TA quirks set the same values as the defaults,
so they are not necessary. Remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c   | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..8ec990293b48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -225,16 +225,6 @@ static struct gmin_cfg_var ffrd8_vars[] = {
 	{},
 };
 
-/* Cribbed from MCG defaults in the mt9m114 driver, not actually verified
- * vs. T100 hardware
- */
-static struct gmin_cfg_var t100_vars[] = {
-	{ "INT33F0:00_CsiPort",  "0" },
-	{ "INT33F0:00_CsiLanes", "1" },
-	{ "INT33F0:00_CamClk",   "1" },
-	{},
-};
-
 static struct gmin_cfg_var mrd7_vars[] = {
 	{"INT33F8:00_CamType", "1"},
 	{"INT33F8:00_CsiPort", "1"},
@@ -309,13 +299,6 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = ffrd8_vars,
 	},
-	{
-		.ident = "T100TA",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
-		},
-		.driver_data = t100_vars,
-	},
 	{
 		.ident = "MRD7",
 		.matches = {
-- 
2.47.0


