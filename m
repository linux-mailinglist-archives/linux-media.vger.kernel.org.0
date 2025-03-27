Return-Path: <linux-media+bounces-28869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91832A73773
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 17:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C36FF17676C
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1382192F2;
	Thu, 27 Mar 2025 16:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dgG4xaY6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A4218EAB
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094543; cv=none; b=rQKmJLEK4uXlLj0vSLR4/klfBPxBnL2qFRz7xpdWoDG3JN+KsxHptIVSZa/3ptkHGSiMf9d1SXbQHjeM1tnDVRz3fAkVP5Drzkoo0qReg/gvKjNpy8ye3mOyMSUjP0vq+/o7fzz+jPqa2rjoCKFCG01H9rldELzNeV6a3hf0zoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094543; c=relaxed/simple;
	bh=nj7ctlLUPBhXLU2hYbBq2i6X82dxxo6rB22cQvrf4cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMbazJ+zeTUJ7x5TIgPuujuFtVNRcxb/reGn5JOj/7cC4FuiA/CnlU6ZlTQzh4x8fP6CabuHr99Ek+5PbxG5s8SqIo5qAsOOTCwEqJJH1Km9HHQXDX4oREGi6JOJ5qxHRKc+Zcn7Phqd0Lr7KOqLCgf0Fj8Wt/gLWPIYFubFWFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dgG4xaY6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743094540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VbX/5Ob9pOtkWAganTWpzVv74gSf/f5jc7A7ck7dnNQ=;
	b=dgG4xaY6LpX9GWOUzKeRmbqTtnBrOf7J7KllHjYOhPjNFFeR3gkoohHAE0BlD+oqipQ/yT
	7vl4P0j3tdsMQ1OJqLugvi8SmkAznbDVLW7MZ6QyLaWgjAN9Q9mKECt2txoWtwiYsiJ4G8
	X+rlmsCa4E5lo7HKH9QaAbZJThC9Xpg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-SmbQ37vyPRqr8ezw_g485w-1; Thu,
 27 Mar 2025 12:55:36 -0400
X-MC-Unique: SmbQ37vyPRqr8ezw_g485w-1
X-Mimecast-MFC-AGG-ID: SmbQ37vyPRqr8ezw_g485w_1743094535
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB9E518004A9;
	Thu, 27 Mar 2025 16:55:34 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.44.32.148])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B1BFC180174E;
	Thu, 27 Mar 2025 16:55:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] media: ov2740: Move pm-runtime cleanup on probe-errors to proper place
Date: Thu, 27 Mar 2025 17:55:29 +0100
Message-ID: <20250327165529.31388-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

When v4l2_subdev_init_finalize() fails no changes have been made to
the runtime-pm device state yet, so the probe_error_media_entity_cleanup
rollback path should not touch the runtime-pm device state.

Instead this should be done from the probe_error_v4l2_subdev_cleanup
rollback path. Note the pm_runtime_xxx() calls are put above
the v4l2_subdev_cleanup() call to have the reverse call order of probe().

Fixes: 289c25923ecd ("media: ov2740: Use sub-device active state")
Cc: stable@vger.kernel.org
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add Fixes: tag
---
 drivers/media/i2c/ov2740.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 80d151e8ae29..6cf461e3373c 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1456,12 +1456,12 @@ static int ov2740_probe(struct i2c_client *client)
 	return 0;
 
 probe_error_v4l2_subdev_cleanup:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	v4l2_subdev_cleanup(&ov2740->sd);
 
 probe_error_media_entity_cleanup:
 	media_entity_cleanup(&ov2740->sd.entity);
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
 
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
-- 
2.49.0


