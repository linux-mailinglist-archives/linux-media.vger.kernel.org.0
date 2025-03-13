Return-Path: <linux-media+bounces-28158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48FA5FFAB
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F2A3A8C40
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81531EF363;
	Thu, 13 Mar 2025 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZtbjCqxY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D4B1EFF85
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891418; cv=none; b=gDxWmPC7LGWajgzfQH6ZCWf5hRqF6U+nzVrBqiJXEUd3Bf1HNAMIrzc65ASjnNALi0cfdt9GW+dXc8riRjxJI3pKsj+TEtpdpfbIbAlj+hgFLFQj0PgQ2IgDG6w65anLqidSGjSE8qF08NtGjgVIIZmOuQqbiwsZPmdp1ACN2IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891418; c=relaxed/simple;
	bh=XD/m5tMq6xOwMinqeDfPt4wgndx5FUgiRdzMqzu/Iow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pS+0q5oeH9Jv/VGhKVd/0dFD9HIVkSSv21Sju/mKX8k2KlYuVWVQsgs4UXGk9euLS2Y6MKLh0lAZ41ZSgyods54CywPem3bhc+zEUsEz2THZtRMrhfUEhFBAtoy6gnVmzfK/zoua0x44hvJyYCEFTOI3ICXZf28Qbtu4fGg9QGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZtbjCqxY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKYOPIxQXXhG7YOxYNtFp2F9bfRNF+MgS5Ll8j219hE=;
	b=ZtbjCqxYm1whAi77xIVexWw06iGmaz666hrf1uWnDNK0v016jSjufzbaQdMR2tYqJ6ExxX
	gurGgUgknzylk7poSUAZPIV+dxGitKVcKgUnSpdV2UrWoajAFgZ/Oe9Bl6vase507i61vO
	YpCM4vkZoY/PO9sf1Dfw123mM+DfU9k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-d6eOComiMJGOMYf7LAZo_Q-1; Thu,
 13 Mar 2025 14:43:32 -0400
X-MC-Unique: d6eOComiMJGOMYf7LAZo_Q-1
X-Mimecast-MFC-AGG-ID: d6eOComiMJGOMYf7LAZo_Q_1741891410
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 953F61809CA5;
	Thu, 13 Mar 2025 18:43:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D54C3003770;
	Thu, 13 Mar 2025 18:43:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 03/14] media: ov02c10: Fix hts for 2 lane mode
Date: Thu, 13 Mar 2025 19:43:03 +0100
Message-ID: <20250313184314.91410-4-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Using half the hts value when using 2 lanes results in hts < width,
which results in reporting a negative hblank value to userspace.

The hts value in the mode struct is only used for reporting the hblank
control to userspace so this change does not result in any different
register settings being written to the sensor.

After this change the register-lists are still writing 1140 to the HTS
register of the sensor in 2 lane mode, which seems to be a too low value
for HTS. But maybe the value of this register is multiplied by 2 internally
by the sensor when 2 lanes are used ?

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index f18b48fe8c0d..a33f9d4033e6 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -26,6 +26,8 @@
 
 #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
 
+#define OV02C10_REG_HTS			CCI_REG16(0x380c)
+
 /* vertical-timings from sensor */
 #define OV02C10_REG_VTS			CCI_REG16(0x380e)
 #define OV02C10_VTS_MAX			0xffff
@@ -372,7 +374,7 @@ static const struct ov02c10_mode supported_modes[] = {
 	{
 		.width = 1928,
 		.height = 1092,
-		.hts = 1140,
+		.hts = 2280,
 		.vts_def = 2328,
 		.vts_min = 2328,
 		.mipi_lanes = 2,
-- 
2.48.1


