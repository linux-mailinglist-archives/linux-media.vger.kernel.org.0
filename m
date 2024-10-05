Return-Path: <linux-media+bounces-19125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F09916B0
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 14:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7182832DB
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4D714C5AF;
	Sat,  5 Oct 2024 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVrFhStt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A1F9FE
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728130542; cv=none; b=MK8cGCI/iW+TVbACjhnMh9h2wjl2oMPhuynw3dDM337/L6JSMWKX4aSJMkWUnlC9Jvdgs/VaOHUWS8/2EX26j7ZrfKZWjgIAZpCvWS9pKiRhoWXZNWP2bjRv4KglZtoO8+ZEwzCVsqzrymRYhrZYJ1E1QzFCvRJhnUzK4QNXEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728130542; c=relaxed/simple;
	bh=ZQbZcseiitw8pn+pvtGFrneWG6SeI2Z9oJ6omr4f+xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnNbt/WsqTwRpGwj1uxvk4vWIkm+SDCI1V5hK6AzQXZ2KY2PkNdscrFbBB4z5npCImCGL/J1aMOjYvKY3oUl8UHJZkAVFz0B+PoMe8bDomdWiczG1DnEhvC/v6670siXPRPYSNzSvAPSehDKrhNnUA4Vj1viqB8QL+7DbRNXYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVrFhStt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728130538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Stm0EThDg453Kob8CSJ3gVpq6fshLRYK7wyGY/FLF3s=;
	b=jVrFhStt2BPMjMz95PVB4tMFzFNvWZGG/aRTzt6RCfZC+L88MKqGo3KNPwBaSsIuanjlOU
	yklpoBk5VUqEUid1WaDx+NwnaVkVYWettCSoeWJpN6aOMFLRm6G8Y76g8mH6oRN6jZRx9Z
	r/GkSVFlbH6OYnQbRzkr8UHE2g17ems=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-4HFyFn8ANiGCl8XFyZqzew-1; Sat,
 05 Oct 2024 08:15:35 -0400
X-MC-Unique: 4HFyFn8ANiGCl8XFyZqzew-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0605619560B0;
	Sat,  5 Oct 2024 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2F05F19560A3;
	Sat,  5 Oct 2024 12:15:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/4] media: ov5693: Improve error logging when fwnode is not found
Date: Sat,  5 Oct 2024 14:15:22 +0200
Message-ID: <20241005121525.32172-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The ov5693 driver waits for the endpoint fwnode to show up in case this
fwnode is created by a bridge-driver.

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.951709] i2c i2c-INT33BE:00: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for fwnode graph endpoint

Also update the comment to not refer to the no longer existing cio2-bridge
code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov5693.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 46b9ce111676..485efd15257e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1222,9 +1222,14 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 	unsigned int i;
 	int ret;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
 	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!endpoint)
-		return -EPROBE_DEFER; /* Could be provided by cio2-bridge */
+		return dev_err_probe(ov5693->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
-- 
2.46.2


