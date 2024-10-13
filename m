Return-Path: <linux-media+bounces-19513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516399BA23
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 17:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14797B2124F
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 15:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11981482E6;
	Sun, 13 Oct 2024 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXSCRS2s"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A3143890
	for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834072; cv=none; b=bSH4vlThu5I3Jk/uwIyUZQgnKnUix+u7P23+5fKfss88a3aIMxgSpgET7XH8mjrSU5XbEEPF5BnZzh9Ta5FmgsaxtXAyLM7tg6u9lh5by/pSl8Wa+wltl/V01yQ+vbYyoeKs698eWlCAf4lL4tmR0GdalL+vBMwZFz4SAf4EFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834072; c=relaxed/simple;
	bh=yrFD90V6Cn5fCqvrrgjt7ea/S+600jiTu00Ob6Vji7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCS8UEOjLY+T1hMpBfOJf8WYAWMvuptLl3/9BT+JyZk/O/v8//dQpFPBpINJE6ygITuuLLcx7MSyLr2u6vP9+y/xXCqCxsRc0egx+PnZV0LU1DmRJ7CNNM8Ia7SZuXKl/p0+GRigp+75RFaAfFGs3LQXZaXXe/LpTOlk0Z3K1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXSCRS2s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3SLJSXP7e4kGfBeIUTiQpLJl1uIykNaue+2p3v0dQs=;
	b=PXSCRS2sWfDWf61EkTZMgcR6ZrLxNUrh2QS49rG9Pkl0gOxyM0k2wNWH4elmXF+t6I+8aH
	lkSaNcJKuDjnKiWrRpZwPJijnoejl/o6AcnxalLbV6VNchH05OU9xpZFsvC4uMeDUrrmBu
	YejkC9GFnqZvz1pPyZ5M8D8mZ515MwM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-Fg-sDn55NnmttP5LBw3VOA-1; Sun,
 13 Oct 2024 11:41:07 -0400
X-MC-Unique: Fg-sDn55NnmttP5LBw3VOA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4AEE119560B0;
	Sun, 13 Oct 2024 15:41:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0631F19560AA;
	Sun, 13 Oct 2024 15:41:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/4] media: atomisp: mt9m114: Disable V4L2_CID_3A_LOCK control
Date: Sun, 13 Oct 2024 17:40:54 +0200
Message-ID: <20241013154056.12532-3-hdegoede@redhat.com>
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The V4L2_CID_3A_LOCK control is causing v4l2_ctrl_new_custom()
to fail with -ERANGE.

It would be better to fix this control but this entire driver is going to
be replaced with the drivers/media/i2c/mt9m114 standard v4l2 driver. This
quick fix gets things going for now until the driver is replaced.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 918ea4fa9f6b..b0b740dd3ca3 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1224,6 +1224,7 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 		.def = 0,
 		.flags = 0,
 	},
+#if 0 /* Causes v4l2_ctrl_new_custom() to fail with -ERANGE, disable for now */
 	{
 		.ops = &ctrl_ops,
 		.id = V4L2_CID_3A_LOCK,
@@ -1235,6 +1236,7 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 		.def = 0,
 		.flags = 0,
 	},
+#endif
 };
 
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
-- 
2.47.0


