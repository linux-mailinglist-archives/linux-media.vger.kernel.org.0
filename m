Return-Path: <linux-media+bounces-23837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E648A9F8437
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2DF16AA3A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7661B3F30;
	Thu, 19 Dec 2024 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRdWH+X/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B11B0F10
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636464; cv=none; b=tOCEjV3wV8BI/GtygFP/C3RqZ8WWQDcWwOjNCnxtETG4t8Re1Yt9KFgUWQYM3IqcQJFsyHRCTWoMuLMhLToxuigAVIOnjGIUyA7YbDEndSs+4YOfhe2M4C6Wgx99FMnxHok17YcaeGKDzOTtAhohlqwSrJlapXAC7LlqQ78tSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636464; c=relaxed/simple;
	bh=RRhXT53WdyqN5PHui15rZqwk/Ea6k0LtYjgaIhcMTKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaoBFEAHUAZ/N+oB5kJyue98jIJpe1g1uDLOmcQSLpzt9eP8i4LPQS8lVi/E6wIxVQ/WLV7ZOIH9ffCP0DkeUdNADhotKN0/EboI3G89HMfhWpDGtDw18km1sbBFTO0Uoy5ZOI7jHWfXQ142stE2q39v+ga6NHKYgrTLONkYTLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRdWH+X/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUgi1yprzLXPaQaoeAw6aHK4O42KHYqsgX4NML0YkQs=;
	b=NRdWH+X/TC/OR7w55pXSnAuoUgTosqLt4r9Y0DAGjHf3kh/3Mv2HrtYS3v+dtIAdoTbrQm
	UzjRcpZL6QbMBmeMD7gIRB+sAGjkwYOTQmB73jA015yQMcOFvmwt7B40DTSjOMTozFZPuN
	R0wrkK0XjQuUKZwiT1cypdJcbU6OpLI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-D5cm8sfFNKauYatBcVM_qw-1; Thu,
 19 Dec 2024 14:27:40 -0500
X-MC-Unique: D5cm8sfFNKauYatBcVM_qw-1
X-Mimecast-MFC-AGG-ID: D5cm8sfFNKauYatBcVM_qw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A71019560AB;
	Thu, 19 Dec 2024 19:27:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 440F7195608A;
	Thu, 19 Dec 2024 19:27:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: hi556: Improve error logging when fwnode is not found
Date: Thu, 19 Dec 2024 20:27:32 +0100
Message-ID: <20241219192733.45659-3-hdegoede@redhat.com>
In-Reply-To: <20241219192733.45659-1-hdegoede@redhat.com>
References: <20241219192733.45659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The hi556 driver waits for the endpoint fwnode to show up in case this
fwnode is created by a bridge-driver.

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.952052] i2c i2c-INT3537:00: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for fwnode graph endpoint

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 960d6c2d3d93..57c51d0e9c4e 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1220,7 +1220,8 @@ static int hi556_check_hwcfg(struct device *dev)
 	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
-- 
2.47.1


