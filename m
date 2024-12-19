Return-Path: <linux-media+bounces-23836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB49F8436
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED31A16A79C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB281B0433;
	Thu, 19 Dec 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mfc7g5XU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E661AE875
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636461; cv=none; b=cUa4zdx8nbTTNt3dn1Lnwf/umJ3vFnzSfjAVarHH0d00jVWOMwX4DTt/RNUY3J4WYcTevIbMMb8sEKfQvWLuHweJYmt85C40VgQXX1U6thhLD/eZewmShOq/sRvRflv1r5odRPlCPotared+HpOCffZGX3OHU7qj9oi82KtzzRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636461; c=relaxed/simple;
	bh=Efeih0sE+iZmXFH+maxzPA8OiWpE3105c8vH2/eXKtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RtMafUIjXibPKz9gPoEilbS3ACEb9nhubVxNB87AvO2N95ot/4WTLvE6/v70cUGsV7OfdCc4RsUPIASoO8MnNtAUgq7YhGGOFdO3134G35MGBfQefQTKJ+5n1NML0DAz/pGA1AskcO49D8zWqmA+g0vrIIYdnDXslA4wXBELn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mfc7g5XU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QSpGyY51F9Z3FnymB5FSOHcZmc33S1pPzw4xTvYvSPg=;
	b=Mfc7g5XUBTpqLyKdJZFxMseh3KjvdUqdjd/IP38BRBoOBqLktfmdHXvT/M4BCB6v0iPR8H
	YMaSXP1hHFTu3ZCIXbV0iz2wHZ0OuiYyPivWcpEtkOFRYbIn5F3lyzqLRN/QuLCM8k3qO4
	hFdqYI8d3RdNrcPuGDo40BX9tbpuESI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-MbSwbpvHNeCU6Vugb9uTFg-1; Thu,
 19 Dec 2024 14:27:37 -0500
X-MC-Unique: MbSwbpvHNeCU6Vugb9uTFg-1
X-Mimecast-MFC-AGG-ID: MbSwbpvHNeCU6Vugb9uTFg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA5E11956048;
	Thu, 19 Dec 2024 19:27:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7EFB81956096;
	Thu, 19 Dec 2024 19:27:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/4] media: hi556: Fix memory leak (on error) in hi556_check_hwcfg()
Date: Thu, 19 Dec 2024 20:27:30 +0100
Message-ID: <20241219192733.45659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Commit 7d968b5badfc ("media: hi556: Return -EPROBE_DEFER if no endpoint is
found") moved the v4l2_fwnode_endpoint_alloc_parse() call in
hi556_check_hwcfg() up, but it did not make the error-exit paths between
the old and new call-site use "goto check_hwcfg_error;" to free the bus_cfg
on errors.

Add the missing "goto check_hwcfg_error;" statements to fix a memleak on
early error-exits from hi556_check_hwcfg().

Fixes: 7d968b5badfc ("media: hi556: Return -EPROBE_DEFER if no endpoint is found")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 3ac42d1ab8b4..c28eca2f86f6 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1230,12 +1230,13 @@ static int hi556_check_hwcfg(struct device *dev)
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
 		dev_err(dev, "can't get clock frequency");
-		return ret;
+		goto check_hwcfg_error;
 	}
 
 	if (mclk != HI556_MCLK) {
 		dev_err(dev, "external clock %d is not supported", mclk);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto check_hwcfg_error;
 	}
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
-- 
2.47.1


