Return-Path: <linux-media+bounces-31671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B33AA85DC
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C345D189B10F
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1461A23AD;
	Sun,  4 May 2025 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UrkPQIuS"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D80193436
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353660; cv=none; b=iMlQC5UhnRO9tKEIqlwU0UJf7uDY4tPqWNIen/5X2OXfZyBALYK21OCjS6MGYyUdQRXHK0X2shOWxpeOIfjAPtYZBqg3thNYACL3GAa7sniVq90CPJgUJrI6vG8G3iQxzFAF01UCY4xdOD1RIvTZgXH7/h7hXQdxVrFOnWXQu/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353660; c=relaxed/simple;
	bh=twUQVKM5/j8RAJaBclNtymcBQSMKBGjxxMmCtgR2+1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKjKZ1YgGvgnCcvrawitlkFBxT5H7XBmW2N+Ud5MvphFE3MgUSqRLUqp6+ZvPKsd7FtqekshgzXwjJ6+f/w2rQNtOSSqZp51w3Wlsr8uD1NgexWEcKzYUgOlqXeIh4NClWGVXoyfHKLPXDAkiYi2ubKuPlSv9v/Cldw5rerdh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UrkPQIuS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUvHG/6LpTE1eUi7KeyVODrFJoW0/ie14mhCUhBzcSo=;
	b=UrkPQIuSha3gx1KswAFArGE+sB3284uSOAdrNpORMvsRDN22m7dldnymXfsKOF3jBFmTeN
	AADm7EaJ0fFS5kLKaRQCyfu4rAFfnxYYXsUv1l4lg7r4set6pzWXohffLh0pFPl391Ca+Q
	sSZi9Nih8Ucq1uQxcjkg24OCEzDqiDY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-W5ShvsgzNa-5vrTPiWiI_Q-1; Sun,
 04 May 2025 06:14:14 -0400
X-MC-Unique: W5ShvsgzNa-5vrTPiWiI_Q-1
X-Mimecast-MFC-AGG-ID: W5ShvsgzNa-5vrTPiWiI_Q_1746353653
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EA5419560AB;
	Sun,  4 May 2025 10:14:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78D2018001D5;
	Sun,  4 May 2025 10:14:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 12/13] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
Date: Sun,  4 May 2025 12:13:33 +0200
Message-ID: <20250504101336.18748-13-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

With IPU# bridges, endpoints may only be created when the IPU bridge is
initialized. This may happen after the sensor driver's first probe().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 28c5a5752621..eba8232444c9 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2361,11 +2361,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 	struct fwnode_handle *ep;
 	int ret;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep) {
-		dev_err(&sensor->client->dev, "No endpoint found\n");
-		return -EINVAL;
-	}
+	if (!ep)
+		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
-- 
2.49.0


