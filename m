Return-Path: <linux-media+bounces-28159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A16A5FFB1
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC19176E55
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA531EFFB5;
	Thu, 13 Mar 2025 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgMhdSCf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481761EF393
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891421; cv=none; b=W95HuBJqrpUZTvt+Rz5uyslvE7CoLLag5X4c3673paoEj3PtQ2Ayb1jXzXC+LoRuw1MC9j0pTl22N1sUa0tkilWA8+ERQbz6RdY8Yu4hjNdL0UeO9eMjR+011OJ02p+J6fS2KYY5SlxnRLWzN5W+NtFPoyeGZEy836EhBNjJAqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891421; c=relaxed/simple;
	bh=rDQH6Olct2STXLluZxjALm7DSsTSzS3lupr+TVZposo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2/kE6xYGqWYHtblfy1cGkT+2kWvykdukwkjlay7E6Ljv0TnF18Cmj7HqVPOlnZ6b68UEiEUd3IxNprJXUDgexcvrfEoNxYCUdSO2Vs0ZNgHqSHcUtebgKfYKFwOmEZlq4KzZ8Jq4rQJ6tSKJ0A53zEmNzr8MPYojODXtb16lwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgMhdSCf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DsfxH7IQFNZirqe6a+FgtK0jMfKRt0KBA+TYAoqc5E=;
	b=LgMhdSCfYVKt8Wy3KlKB6/CJizsFB/0W1YXojN2bPGog8/2x4phenZ6x0Do7q8RmJF+/GU
	MYTZyn67fLybEod73/1bghBJJ8FuwqhXP5sOL0X/dV5b8k8rfYzwuQ2UP612NpA9K00fpi
	iD3KtEBc6W2P7DcKOApXon20oZMG2DY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-vBg6U4EFOLmILjnu8VnIjQ-1; Thu,
 13 Mar 2025 14:43:35 -0400
X-MC-Unique: vBg6U4EFOLmILjnu8VnIjQ-1
X-Mimecast-MFC-AGG-ID: vBg6U4EFOLmILjnu8VnIjQ_1741891414
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AE1E18001E3;
	Thu, 13 Mar 2025 18:43:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EDD35300376F;
	Thu, 13 Mar 2025 18:43:30 +0000 (UTC)
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
Subject: [PATCH v8 04/14] media: ov02c10: Fix vts_min for 2 lane mode
Date: Thu, 13 Mar 2025 19:43:04 +0100
Message-ID: <20250313184314.91410-5-hdegoede@redhat.com>
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

Doubling the default VTS value in 2 lane mode to keep the default fps at 30
fps while doubling the pixelrate make sense. But there is no reason to also
double the minimum VTS value. If userspace wants to use the extra bandwidth
to get more fps (at the expense of the max exposure time) then this should
be allowed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index a33f9d4033e6..ad5ab6c8a803 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -376,7 +376,7 @@ static const struct ov02c10_mode supported_modes[] = {
 		.height = 1092,
 		.hts = 2280,
 		.vts_def = 2328,
-		.vts_min = 2328,
+		.vts_min = 1164,
 		.mipi_lanes = 2,
 		.reg_sequence = sensor_1928x1092_30fps_setting,
 		.sequence_length = ARRAY_SIZE(sensor_1928x1092_30fps_setting),
-- 
2.48.1


