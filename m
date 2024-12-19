Return-Path: <linux-media+bounces-23796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9D9F7CB2
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5839218925D4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058812253FD;
	Thu, 19 Dec 2024 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WIOfw/Oq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE0224AE2
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616209; cv=none; b=hCUIq6hSgDZHzlH7yx0NbdQXqcCHHAAjJHh3FpYOm2Hrn0ElmnNRyJ68MIhHU1Kc2KLPVqVRZ7Bfc88IkWNrv5seL0K1jxBuL/mmKiz3DmypVrhBbM4GYKAm+tba1rHxb8ePbVKcboCxnbRMm35XPb7qvcONQIiNBoq069+Vf/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616209; c=relaxed/simple;
	bh=mfF/l6+L1SsYUaG5EcW4TES5zQnHAJwiLWYQuJRJvkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXIZp+msJn1V89KYGWyZobPM+Jqzn4MzpNIiBnMejkLE1K2J24ORpRCzptgfKjU/RbSi4a0YxzXk89sVQFnLPPsG0uNeY7mjxyzmAjeNwbqhCES23DXvHwVQ24BguHOp3LT6HKmF7NlIEyk4DfJ1f/KK2xD29FdnzZHM9q5ouFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WIOfw/Oq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06TmFM3SQ3VJkJ/46+Gz0gj7967oZLxEJrAuIsnG3xk=;
	b=WIOfw/OqqaD8gXnF8CY/vfS/L+3jGsSgO+zNPrtSQ0Nnrs9YirRgYfNjWg6AwWhvHMccYq
	xRLuE0MyqLuG88ZyeFNanDIMMpB2hd32IeRFdGlbtaO66dBkCzglSpz/luKNzyLvFN9sAI
	iK1b6zHKo08kEdPKzaVX/kd7lmWKZkU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-9c65JYopOPGBoqt2ATTzEw-1; Thu,
 19 Dec 2024 08:50:01 -0500
X-MC-Unique: 9c65JYopOPGBoqt2ATTzEw-1
X-Mimecast-MFC-AGG-ID: 9c65JYopOPGBoqt2ATTzEw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2395919560A3;
	Thu, 19 Dec 2024 13:49:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5C1E01955F68;
	Thu, 19 Dec 2024 13:49:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 7/8] media: ov08x40: Improve ov08x40_[read|write]_reg() error returns
Date: Thu, 19 Dec 2024 14:49:39 +0100
Message-ID: <20241219134940.15472-8-hdegoede@redhat.com>
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

Improve ov08x40_[read|write]_reg() error returns, if we got an errno value
from the I2C core use that instead of always returning -EIO.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index ca004343a9d8..7fde422039cb 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1394,7 +1394,7 @@ static int ov08x40_read_reg(struct ov08x40 *ov08x,
 
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
+		return ret < 0 ? ret : -EIO;
 
 	*val = be32_to_cpu(data_be);
 
@@ -1463,7 +1463,7 @@ static int ov08x40_write_reg(struct ov08x40 *ov08x,
 			     u16 reg, u32 len, u32 __val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
-	int buf_i, val_i;
+	int buf_i, val_i, ret;
 	u8 buf[6], *val_p;
 	__be32 val;
 
@@ -1481,8 +1481,9 @@ static int ov08x40_write_reg(struct ov08x40 *ov08x,
 	while (val_i < 4)
 		buf[buf_i++] = val_p[val_i++];
 
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
+	ret = i2c_master_send(client, buf, len + 2);
+	if (ret != len + 2)
+		return ret < 0 ? ret : -EIO;
 
 	return 0;
 }
-- 
2.47.1


