Return-Path: <linux-media+bounces-31847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F249AAC3B2
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 819211C25AA2
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429027FB1D;
	Tue,  6 May 2025 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwQUmIXH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322CF27FB01
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533935; cv=none; b=JHPocx5/kMClmfOJPNXyNz6NDhV+LF7hJkQH2MbQPv2UvcqtVKVR09NFIYxgXrjh4B1Rhkli8NbdO5CAkzLbiP+RJP3NI0dt7SEJFwCom1eB4Kok0fuQbKn3cJZV2dRtb4fPjvRq2nE6+kfu5dwRG3LR8jqmxidrsFyFTLNyGGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533935; c=relaxed/simple;
	bh=mFGArPOpreFO2wMcx2c4ojV6OrofNSqfGsaJrYSNsu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Enw5n+uqM0+QAaaqIuBvqwil0mUZ0u0BCDw2wLWNE+CDS/lhnCp2djkDzbZmGEkDnjLoE3frTc7ej1utM65diX7m/sVJGar+NYRhcBpFfyzrKGriCpkEsKqa8SOXhmtfROEceBLQPAeMrGlbd9l8ukhx5rTInS8nYHl6NvhsB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwQUmIXH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746533932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exqOEfzpKskW3EvRh6Wj5rZebSOdVhJG1GjSpN16cBI=;
	b=bwQUmIXHwdFy52t7yFiivfrn0hyIRU2xaknq0CZIK+T2MEgMoQyjpD4ZdWNS5ZbK4CirFb
	L7a0f9KmVT7aFwOSpBwEByzllUYJ1s2mUlNczTtxqqCC+0FMKgZmxk92OpY4EwXfdR2lCz
	Mk5tuSD5EOX+VF21DjuQhWvP71Ij8h8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-TW0a55ZNMjCkmyNKLQ-L7w-1; Tue,
 06 May 2025 08:18:51 -0400
X-MC-Unique: TW0a55ZNMjCkmyNKLQ-L7w-1
X-Mimecast-MFC-AGG-ID: TW0a55ZNMjCkmyNKLQ-L7w_1746533930
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D31901800360;
	Tue,  6 May 2025 12:18:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.225.249])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBF33195608D;
	Tue,  6 May 2025 12:18:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ipu-bridge: Debug log link-number and lane-count from SSDB
Date: Tue,  6 May 2025 14:18:43 +0200
Message-ID: <20250506121843.250995-2-hdegoede@redhat.com>
In-Reply-To: <20250506121843.250995-1-hdegoede@redhat.com>
References: <20250506121843.250995-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add a dev_dbg() call logging the link-number and lane-count from the SSDB.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a12bc1676c81..e342492e8f3b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -308,6 +308,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 		return -EINVAL;
 	}
 
+	dev_dbg(ADEV_DEV(adev), "link %d lanes %d\n", ssdb.link, ssdb.lanes);
+
 	sensor->link = ssdb.link;
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
-- 
2.49.0


