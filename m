Return-Path: <linux-media+bounces-23792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADA9F7CAE
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633901892524
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287F922540B;
	Thu, 19 Dec 2024 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P0q+tyzG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022511F8682
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616200; cv=none; b=JdmR8O+cQU1mt1nrR4e4nhV+237/feC00fa1EmFOKs3ri0HDoEaxmhjpMDTEITsnTqgHaxOprtMrtc3od+/ov62cCc0y66spNMFKwBfObC6jXzCVV+BobXX7hPoH7uACDsEF+s8rLSs0jqR7T1X99sjx0GnLfWzANy0HNU78EJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616200; c=relaxed/simple;
	bh=d4/TevPymctqsnNVqMhRRYhDLsvm21ITOlv8kVHNxYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8MEKnE9KLDw2dNHDmM4A9htIDRBL4beifEc/Swp1PRxKAupNDZuQ9WkLSjK+T1RNqO2v/MPw5YK+QA0S6IZQM2uSQNL1HHFW13YeRbWxndCAINKUS+7ORvbbFfxsFOnsn/Vn8SErMrNJfPWk2xjdOvxUP0A8iuRoRHMrdgLJlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P0q+tyzG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYcMqN0xprIBz0c5VREduwqaJY59wFvqmhIwCvl9maY=;
	b=P0q+tyzGdLJewYeEIdJJSsYyw97u1IKPvtF8M7+Pizk10L1iSUqLOxrxPrzH/t5ABbHcnY
	e3WOxltSK3WHJgT8dBdSPejmgrxlgdIP+8B9Ifa8Lo7LhmtRlBvpzsE4xkktWI59RN8eq1
	PMrv8epcndyuZcZ62eXCTjEtUU1SY/g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-LY92QmcAMQmCrCElChRwdw-1; Thu,
 19 Dec 2024 08:49:54 -0500
X-MC-Unique: LY92QmcAMQmCrCElChRwdw-1
X-Mimecast-MFC-AGG-ID: LY92QmcAMQmCrCElChRwdw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D68119560A3;
	Thu, 19 Dec 2024 13:49:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BD5AC1955F54;
	Thu, 19 Dec 2024 13:49:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/8] media: ov08x40: Get clock on ACPI platforms too
Date: Thu, 19 Dec 2024 14:49:36 +0100
Message-ID: <20241219134940.15472-5-hdegoede@redhat.com>
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

ACPI platforms might also have a clk provider which needs to be controlled,
always try to get a clk using clk_get_optional() and when that fails fall
back to getting the xvclk frequency from the "clock-frequency" property.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 8b1380506778..de8291e8b6e7 100644
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


