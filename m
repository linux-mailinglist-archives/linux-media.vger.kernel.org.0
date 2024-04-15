Return-Path: <linux-media+bounces-9327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 327928A4BC0
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B46E0B240AD
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E8E4436A;
	Mon, 15 Apr 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UXVDzmbj"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12773EA96
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713174113; cv=none; b=dKGBHH5dQDLdtldoD8zf7uzDGeSQyJhPHGCYI3lhENxY6sa4zm4jssOkt4Veq2tLOfeDpSlj1fACAjCrplzPbO8fexWp/UkhJNqFd2NSd95evoCj9rQkAZ4OHgiPvM9GAhojew3KxJbws/M4qth82hpjsWIg405O0gW/nTWSpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713174113; c=relaxed/simple;
	bh=soogh2Kl4OCTxsK8RSBuV4VmMnuEw2/vj6QNAvJ3kdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhRIDIcAyS7gN2H9djWAFWiu05IMVPLgNXzDH+xNo9Sddh/YpiI/FuoMOtx1E4D/eyMcb5e2FxbdCPmk+mZrPrt2JC+aeUCiuEFC3XX4pK48zOKau9vdJME/RmQ7PcdjEPp8RfEI/lC8VeT+FCQbG+GCQkG1JEHYXkrYSNadWmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UXVDzmbj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713174109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kRsVSPkQfYy3ExT7223wBLMdl5dF1rzos3a1fVd3B4=;
	b=UXVDzmbjGyntGRRrBPzJCDgGejKXFAjmCAMvsuug1dBaN8I7vmsgMYCR8H4Rbjt3f3fyJd
	q2i8Aj72o4dueXpROPY7OpuLtJm++O7PZtdOZOrjwZ84AZCWxbVu14C6T/RZai0J8hu6TV
	A6Orx4vyRJM1QxhLYVA1Yheac+x0EGk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-oMBqdxTzMMCtMx1nzIVkKw-1; Mon,
 15 Apr 2024 05:41:48 -0400
X-MC-Unique: oMBqdxTzMMCtMx1nzIVkKw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5C0E3C025C3;
	Mon, 15 Apr 2024 09:41:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF402492BC9;
	Mon, 15 Apr 2024 09:41:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 1/4] media: hi556: Return -EPROBE_DEFER if no endpoint is found
Date: Mon, 15 Apr 2024 11:41:30 +0200
Message-ID: <20240415094133.210580-2-hdegoede@redhat.com>
In-Reply-To: <20240415094133.210580-1-hdegoede@redhat.com>
References: <20240415094133.210580-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

With ipu bridge, endpoints may only be created when ipu bridge has
initialised. This may happen after the sensor driver has first probed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 38c77d515786..96bae9914d52 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1206,8 +1206,13 @@ static int hi556_check_hwcfg(struct device *dev)
 	int ret = 0;
 	unsigned int i, j;
 
-	if (!fwnode)
-		return -ENXIO;
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -EPROBE_DEFER;
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
@@ -1220,10 +1225,6 @@ static int hi556_check_hwcfg(struct device *dev)
 		return -EINVAL;
 	}
 
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.44.0


