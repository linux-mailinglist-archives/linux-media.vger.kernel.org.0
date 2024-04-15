Return-Path: <linux-media+bounces-9388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA078A50F3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4370828CEEF
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32E5128830;
	Mon, 15 Apr 2024 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AWC8jLo3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F41128361
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186225; cv=none; b=rdP+UDGeXASuwclsmNJxjkz1xowbqjAl5HqeMswM2csYr96MFjOIhEWV7SmYiJk6HfDY/sQjBRGV3w5FoOFuW7rMb33EFXIgWB6WZ4xl8rV8BkrYzTmk/EUHqtv/sqW3sZPjzNfaxM8bnU0y2izzSQw6kZG6nNSmiJE68oIiqe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186225; c=relaxed/simple;
	bh=RjOM+zY+lr15oCkXtk8/8oSu0AyjCcJCx8StnLJ07p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cN8ZlpD1qIhbRnjlOOgxzf8ihNuraFxTZS4C2CeQWqrJtBWzySFnT41As+5iYsuuB/GH1JoO91rPJlpyN+UDGhlOSxTR6o651ChMdxKU64gxMbs/b041wQd49p/0Pm/kYpXBo1mnkgcCUlHce9yAGd1wuGr5Nju4fVvb2VLdOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AWC8jLo3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ufrGXuakCTM/hzn6KUyp9Vnvpd3dyrREV21w5m5mQlw=;
	b=AWC8jLo32c2h/d5huX8TN8kYj0wiclQ4r1jlY5Sq2A3FLE6ZlBph+A7KH0u5itZht+YvyW
	Xj5uwiIG4dJl2Jd6rwDqclC3I2uLoAEJ7kH3OQWf7FgOqMg5QQmDCNuX+xoBsz/D4BmmeP
	/pF4y7I5gPcsOG26D5W5dYQz9PANRU8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-2wm4b_7_M6SydqICdGzvJw-1; Mon,
 15 Apr 2024 09:03:38 -0400
X-MC-Unique: 2wm4b_7_M6SydqICdGzvJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8237D1C0C65D;
	Mon, 15 Apr 2024 13:03:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89AA61121313;
	Mon, 15 Apr 2024 13:03:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 5/5] media: ov2680: Add camera orientation and sensor rotation controls
Date: Mon, 15 Apr 2024 15:03:18 +0200
Message-ID: <20240415130318.234222-6-hdegoede@redhat.com>
In-Reply-To: <20240415130318.234222-1-hdegoede@redhat.com>
References: <20240415130318.234222-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Add camera orientation and sensor rotation controls using
the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
helpers.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Use hdl->error to error check v4l2_ctrl_new_fwnode_properties()
---
 drivers/media/i2c/ov2680.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e8ec2a6d27db..6236a13a4981 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -957,6 +957,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
 	int def, max, ret = 0;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
@@ -1004,6 +1005,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
 					  def, def, 1, def);
 
+	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
+	if (ret)
+		goto cleanup_entity;
+
+	v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto cleanup_entity;
-- 
2.44.0


