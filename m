Return-Path: <linux-media+bounces-28026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB080A5BFB3
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 12:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02D4A1768EF
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA80255E37;
	Tue, 11 Mar 2025 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mz12ml6T"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B8224258
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 11:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693743; cv=none; b=vBHA+YmUJchrN91slxtBpbVEF5c3bJwjbg6yESwGKbrJpPyfNVUgIeigYNIa580JAk60FfeLXa0H6ZCY/k9+BP3yLZRgfAeZh16tjYmTCL+n3RwZ4AqORPjchiv4wJMDmfKBFHJy6x3XpU0/TVrkqaWmFOe19svkzx9csxtB3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693743; c=relaxed/simple;
	bh=+vlO64ju7g/p+jl67/8W4wRBRR7WjAeT7Mpsl28ogfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDc/Y1G8zJma/tq8fKGhRNHyyrzuO/I4y6IDEW80DeZFAwojHIoRAXSw/oKI3sp0aIVQbmVf1jtAP4XN4DnhpxkbY/NkSfFT9DvuGKjEMQuceyhoPBEhy+osWUal0tYlnNolir9CExWBjXRU1d2rMUKwnoMU+WbwWh2Hmly1jKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mz12ml6T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741693740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+w6guCNStiWWD5AG2mGvq/2FQu/C03U9KRO9jThrbxU=;
	b=Mz12ml6TxPy4L1j82NP3h/7zUqzfI26DZm9o2RSH13jNnRLQ3zQSZY1qqCjFTyEf1gwxEO
	qA/x3kUwwUhQhBCxR+iBROu6im3rICw4ONXwsuRXs8gcILWixZJOPu+fjegp/CUVZGkOfj
	ywkBn0RBf3b9rO1+bMBZq2Sdg9XfnY4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-mRMdkyNYM4O4MySSH-UrWg-1; Tue,
 11 Mar 2025 07:48:57 -0400
X-MC-Unique: mRMdkyNYM4O4MySSH-UrWg-1
X-Mimecast-MFC-AGG-ID: mRMdkyNYM4O4MySSH-UrWg_1741693736
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B1F619560B7;
	Tue, 11 Mar 2025 11:48:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.35])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D98251801747;
	Tue, 11 Mar 2025 11:48:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: ov08x40: Extend sleep after reset to 5 ms
Date: Tue, 11 Mar 2025 12:48:44 +0100
Message-ID: <20250311114844.25593-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Some users are reporting that ov08x40_identify_module() fails
to identify the chip reading 0x00 as value for OV08X40_REG_CHIP_ID.

Intel's out of tree IPU6 drivers include some ov08x40 changes
including adding support for the reset GPIO for older kernels and
Intel's patch for this uses 5 ms. Extend the sleep to 5 ms following
Intel's example, this fixes the ov08x40_identify_module() problem.

Link: https://github.com/intel/ipu6-drivers/blob/c09e2198d801e1eb701984d2948373123ba92a56/patch/v6.12/0008-media-ov08x40-Add-support-for-2-4-lanes-support-at-1.patch#L4607
Fixes: df1ae2251a50 ("media: ov08x40: Add OF probe support")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index cf0e41fc3071..54575eea3c49 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1341,7 +1341,7 @@ static int ov08x40_power_on(struct device *dev)
 	}
 
 	gpiod_set_value_cansleep(ov08x->reset_gpio, 0);
-	usleep_range(1500, 1800);
+	usleep_range(5000, 5500);
 
 	return 0;
 
-- 
2.48.1


