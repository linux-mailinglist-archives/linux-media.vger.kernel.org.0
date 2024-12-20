Return-Path: <linux-media+bounces-23936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8FD9F94B1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A93F77A4657
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7C521885C;
	Fri, 20 Dec 2024 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ThIC7h83"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4BA2185A4
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705723; cv=none; b=QWwcoNColMXeELFhROwIfmjPviPajKWLZCqmpogr3zD8vODGZdQlaHTTysrDhzSnFfJDEI80f6l9Jadc7TyRbWPXcalL9yiPrGD2q8we5Em17Cs/5OHOo1uefLLPyCQYFFvxEGFwKr+W211SMT/Pnf0N09MRtKizcdXUEcYiteQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705723; c=relaxed/simple;
	bh=snSjHXnZpNhsDn2iUZ4O6a4vEzqQsA6t/Gi4s6XkoHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9j+1UoCtcmaz0YlYgnm+5klNG/njpC5pzwo8s4aiBSRWf5gfvfFZUlwdW1xddYEri+dzHkH5bkKJpCdmvu9OzO7Y/X0UL9Mv6VhwTJ8GTO5orNHZaLyqL1FKDHJVTLmfzodn7+8tkvfZf2xh+EYL2ZqOyuETkKJFD4G7j+dgLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ThIC7h83; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2eBgYZUkWOHjCvjJbUprRewqayE/iArLk0RD3FHKkc=;
	b=ThIC7h83ae8yKCUDPtLm7ywWJBznGjmkHm3bYKPFMzBIpw+ggcPoaULOZ4QJhAD2YcUaWe
	SyjZnlfrtcFf+ZhpjS75kjbux++vRZYedBID5dpmkTmTp33VX1x53SA8Np5su9YuN3ll9s
	jZ73+bT4HJ8Q1uR+qF/D/fBpqTQyetw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-KALhif2vPJet5iy1Kez_SQ-1; Fri,
 20 Dec 2024 09:41:57 -0500
X-MC-Unique: KALhif2vPJet5iy1Kez_SQ-1
X-Mimecast-MFC-AGG-ID: KALhif2vPJet5iy1Kez_SQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6DC41955F42;
	Fri, 20 Dec 2024 14:41:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6BAB19560AD;
	Fri, 20 Dec 2024 14:41:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 07/10] media: ov08x40: Improve ov08x40_[read|write]_reg() error returns
Date: Fri, 20 Dec 2024 15:41:27 +0100
Message-ID: <20241220144130.66765-8-hdegoede@redhat.com>
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

Improve ov08x40_[read|write]_reg() error returns, if we got an errno value
from the I2C core use that instead of always returning -EIO.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 10ec9896ca61..39430528f54f 100644
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


