Return-Path: <linux-media+bounces-23934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424759F94AF
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A5F167646
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E405C218848;
	Fri, 20 Dec 2024 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YYcr1zIO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9E218828
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705718; cv=none; b=B2WM5ELb9USfLmzNaWywK6YBBUuK1+f4uMjYWLGLffeFDScjOA4VUIcPKnlMwC1Kx80LlDCXdYKqeKh/2l6lFQ7FhIHkoYROkYjwvBYmUJ8UCYsPNpwwXcVHqDzPmWSKRnAx3C95uCkgW8jqnBLA3MyffB9KtW5a4fi7GIZtJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705718; c=relaxed/simple;
	bh=Lqo8npuMKZ6VyG1lnHGsmw7FhIF2X/8NgZQCySVY4bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgyP0jQEWEuH44DmjxsOewVqrFnHSo5Iq0udG9PTyithEsKIsNEmJui3AbKsWCESocEoO2FNFE/o7euA7ilSNH3wTaVFroR32zuWz+UG7fdADygRMXnvjZLcbzL/fTYjPOc6KQG6i/qBUwh268u9NXJxpNiIMd9RxWIXyhS2de8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YYcr1zIO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwlPUwb4AcwGNEUf/ODdOOrdvyeeiwL0rnMx6NwfYz4=;
	b=YYcr1zIOkkfCZY0LV8wphno5NGyt94DQp4+Nh4MEsV/LiJQbaLcA8zf8zR66RO7ktuQNwt
	oi44UYr2VtOKHxAIc3H0BAwZZVbfv38Fn9WVGCzWBdb24gdlLqZVQn5MikUBwfWpiEz71S
	q/kOiPjkxCFvewwXDvXYDKLU1Qnb93k=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-aeS2jYIGPbK4glRKwhi9Xw-1; Fri,
 20 Dec 2024 09:41:51 -0500
X-MC-Unique: aeS2jYIGPbK4glRKwhi9Xw-1
X-Mimecast-MFC-AGG-ID: aeS2jYIGPbK4glRKwhi9Xw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3ADF519560B6;
	Fri, 20 Dec 2024 14:41:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 733EA19560AD;
	Fri, 20 Dec 2024 14:41:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 04/10] media: ov08x40: Get clock on ACPI platforms too
Date: Fri, 20 Dec 2024 15:41:24 +0100
Message-ID: <20241220144130.66765-5-hdegoede@redhat.com>
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

ACPI platforms might also have a clk provider which needs to be controlled,
always try to get a clk using clk_get_optional() and when that fails fall
back to getting the xvclk frequency from the "clock-frequency" property.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 21f36d16ed1e..a01c5333ce6e 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2175,15 +2175,13 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	if (ret)
 		goto out_err;
 
-	if (!is_acpi_node(fwnode)) {
-		ov08x->xvclk = devm_clk_get(dev, NULL);
-		if (IS_ERR(ov08x->xvclk)) {
-			dev_err(dev, "could not get xvclk clock (%pe)\n",
-				ov08x->xvclk);
-			ret = PTR_ERR(ov08x->xvclk);
-			goto out_err;
-		}
-
+	ov08x->xvclk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ov08x->xvclk)) {
+		ret = dev_err_probe(dev, PTR_ERR(ov08x->xvclk),
+				    "getting xvclk\n");
+		goto out_err;
+	}
+	if (ov08x->xvclk) {
 		xvclk_rate = clk_get_rate(ov08x->xvclk);
 	} else {
 		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-- 
2.47.1


