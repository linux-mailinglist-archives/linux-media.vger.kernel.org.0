Return-Path: <linux-media+bounces-19126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 384CA9916B1
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 14:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F3E1F22AB1
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CCF14EC5D;
	Sat,  5 Oct 2024 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GL/TJEcP"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0614D29B
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728130544; cv=none; b=IeMCvg5EUf9b9MXXt8pZB+IXI7fhQ6/Qf1JIbnH8KqOiCeA9vRGnQbpAXfsgN31Ft6PaVOsl4ej5ZLhEka/UrAk9tHlUWMdfOK6Y0hbk35Vl56W+M1jKB1g4xlSvYQJyBXByKwd5NxCs40X7z2VZai3cA4bAUMLRSu8N6YFYxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728130544; c=relaxed/simple;
	bh=QHeY0DgU6pspc693fQ+brZOVlDNysirnRA9d8w5aBBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XY+N9Zqo0hi8bzzCmB9plWZ9taUj7ZYPOHvLYCVnWB1Te+WV1Djl17UwH56hs2VkflLAg90/Gubx9hX+5we7CN4hxK62RiZFyxoKbD2Yq72QlqHOC0J4zJ6pkxbuYxUYztJ3RSbWNvNKLljO/STbRwogBfs0Hd/9KCbLUwSit9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GL/TJEcP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728130542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVXRb+uEhzo9kXQGOqfkyVC7wOiR5i8jgQD7Bg4jx2k=;
	b=GL/TJEcP+icAYfLFTEdSMqy8Cf8B+ASU+Cw+bLJ70Dkz7Tx9yOfRLRLbSZ7hXrBZbdxMgT
	ADcED0j23lVP2G837V/s9UilVyz4ShSbE0ERF9/euhylTB/u6f6H3O0cSC2NxFCRryCYbw
	26x4SN3ly/9JCExamC7BeAWF6WONqtk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-r7vCC_CFMHOD_jytsD096Q-1; Sat,
 05 Oct 2024 08:15:39 -0400
X-MC-Unique: r7vCC_CFMHOD_jytsD096Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09AD61954B10;
	Sat,  5 Oct 2024 12:15:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6777E19560A3;
	Sat,  5 Oct 2024 12:15:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: ov8865: Improve error logging when fwnode is not found
Date: Sat,  5 Oct 2024 14:15:24 +0200
Message-ID: <20241005121525.32172-3-hdegoede@redhat.com>
In-Reply-To: <20241005121525.32172-1-hdegoede@redhat.com>
References: <20241005121525.32172-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The ov8865 driver waits for the endpoint fwnode to show up in case this
fwnode is created by a bridge-driver.

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.952061] i2c i2c-INT347A:00: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for fwnode graph endpoint

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov8865.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 95ffe7536aa6..a2138f7988aa 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2991,7 +2991,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!handle)
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 
-- 
2.46.2


