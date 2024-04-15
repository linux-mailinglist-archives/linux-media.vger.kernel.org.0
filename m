Return-Path: <linux-media+bounces-9325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EBC8A4BB5
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B771F22E27
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761465730E;
	Mon, 15 Apr 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJZ3qAYz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1BD50A78
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713173847; cv=none; b=ogelCdF9jIlH0B+vYfdPPykE2kvWyvzT2ppojiH8Y6PF3KI7i/m276GwKiusPlYnHCUAHIqXwnmj2mStISeSe6hLsDvVkeQLskbca/93x00auLRiGxpjU+nYVl6CS/Eriea5GIAo77feFuqFd0aQdCFNCHv3VWjnvbG4kB8tgbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713173847; c=relaxed/simple;
	bh=/bYd4QPFF9u/H4VaXZPJ7Ey9+4QopHunrfYxBqDBQ3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuUIjYies5VNmx6nUR0rBpWQ6UyA1C/8wSKn4iLQ9nwWfxQO7vrk789KzbHjjYCitN5gE7UjuRA7Rdkw3/Ak4QdvKLl4Tw9z/UEEFJG8Htlh8QKsfKOne5nXTP0qUDHORF+jPMMYEMFwOyxJFRfkDZuQ3bS3hoGfsystAaKMd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJZ3qAYz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713173845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpcEjCLxjEjcI5QOITqGouj1PntRRjHbyxIYxn7d8Fo=;
	b=TJZ3qAYzJuWhGSr8zBwykmNEusa3b6ksTCu4tUVSX2fFc0CfckLKCievXdDB1t8KoWPcmd
	c12zoutde8zu2yEX0e3eUudZ1gqIjX2BmVbWLoRxt2Mn2NN4ypypYGrsXkWL3KnKdqcL5r
	UNoto6eJv0XFinl/NJJ2YLjESTHrjNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-RLqE-YBHM0q-pI8p0pYzBw-1; Mon, 15 Apr 2024 05:37:22 -0400
X-MC-Unique: RLqE-YBHM0q-pI8p0pYzBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD5C080A0D5;
	Mon, 15 Apr 2024 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B29EFC13FA3;
	Mon, 15 Apr 2024 09:37:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 5/5] media: ov2680: Add camera orientation and sensor rotation controls
Date: Mon, 15 Apr 2024 11:37:04 +0200
Message-ID: <20240415093704.208175-6-hdegoede@redhat.com>
In-Reply-To: <20240415093704.208175-1-hdegoede@redhat.com>
References: <20240415093704.208175-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Add camera orientation and sensor rotation controls using
the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
helpers.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 14a5ac2bbf8b..840e6b63ad19 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -946,6 +946,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
 	int def, max, ret = 0;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
@@ -1000,6 +1001,14 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 		goto cleanup_entity;
 	}
 
+	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
+	if (ret)
+		goto cleanup_entity;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto cleanup_entity;
+
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-- 
2.44.0


