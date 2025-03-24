Return-Path: <linux-media+bounces-28635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7581A6DAB8
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 14:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E31F1896C7E
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8650526136B;
	Mon, 24 Mar 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKp4u+bQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FC925EFBE
	for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821282; cv=none; b=RuPwHIK62+LhXqhoevGqbbtnIG8cE60fe+7ZaiLq6ZG1hgD/8aELj0sEHovAy4k7P5OoY4JjjqU+3ktCWxs29FaAiFT34PIKx+l8mynRQs4dRRAQ4THVk59S8rg1m5pcA1Awt/MFxwelTrOPJqTODMVu94mumiIc6GhC0IL52rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821282; c=relaxed/simple;
	bh=Du8dujwJxtsLJWrsIYIMgP23o+fvBwsT6i7zJcLV1Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUNS+0emMH9PCP+9SkfIA0SekweQS3o2ooH7JAJXD6jNEOLoaSf9L+XvnJC0jERd74oJciFbHTcgODmqMmH/EXOIdMQ6+XuoT1iNqrzh9HJhqoNe1RpCSC6vqjTJ4a1DTCKpbgFZ9gzTMrfjYJSYitHI3zByBm06WzWVfmnYiFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKp4u+bQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742821279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GvRk4VemhZP7rDwfgDJ18VhbnuimZF/4Wl4fbRihXpY=;
	b=IKp4u+bQVxSsQqaKHGXYvn8Nu20JUcWXs3Tiqhgpci1tpI1uNjgl5iJ9QgOrAvqCM8+NZW
	4575YB2CpnyLZntgw7zw+Wf4LVnQxdCqANvW+x44mEriKvHe3HE4BUkr61gpGIKPr8fExV
	Q2kK06OWHb3pIQH/pK0TVaFhuQThhZ4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-ellKYf5WNCCIRE8SIcewhA-1; Mon,
 24 Mar 2025 09:01:15 -0400
X-MC-Unique: ellKYf5WNCCIRE8SIcewhA-1
X-Mimecast-MFC-AGG-ID: ellKYf5WNCCIRE8SIcewhA_1742821274
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75BC918EBE91;
	Mon, 24 Mar 2025 13:01:14 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.44.33.69])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1423719373C4;
	Mon, 24 Mar 2025 13:01:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ov2740: Move pm-runtime cleanup on probe-errors to proper place
Date: Mon, 24 Mar 2025 14:01:09 +0100
Message-ID: <20250324130109.375068-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

When v4l2_subdev_init_finalize() fails no changes have been made to
the runtime-pm device state yet, so the probe_error_media_entity_cleanup
rollback path should not touch the runtime-pm device state.

Instead this should be done from the probe_error_v4l2_subdev_cleanup
rollback path. Note the pm_runtime_xxx() calls are put above
the v4l2_subdev_cleanup() call to have the reverse call order of probe().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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


