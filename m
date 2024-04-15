Return-Path: <linux-media+bounces-9368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645418A4E66
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 955771C21083
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0636E2A3;
	Mon, 15 Apr 2024 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDVk9F6S"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45276CDD5
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182589; cv=none; b=VmL4Wg4XS1j0Id3OEoOC4uTYUhCxg3mXor9L4aU2h1S7DncQbDBj/I8gOLAAO185UuuBAs9lJJG/Na+rXSG9TSC01Z4ryZbvlYLbtPrg8Z4MbKed2lgmXcuKd4vE9VumU9jtmZoMYyIFBg+BsDxyn8pjdBE1eu0yc6eyxtq5nMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182589; c=relaxed/simple;
	bh=5PiI2EAGhlCp5O7Mu/AfGmr2NBv2RumY+w+9GqUDSYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3I4X+UAE9qEtNPkW2iN6nYFGAfvxOjRUc5nspEub1lR05n8rGS7kEpGN7zWrk1YtS/ioRPaSPLv/9Ai5NvHYCQEhaNEcYclZBF/5qSqoZII21debSu3XsVvG8OJ4CJwFAt9CBn/T2iNpk4sr88YwNk3hpfcO/ksrmr8bMSpnEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDVk9F6S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEtlZak3Z40jh25+hruqW/khfsHk4/m1Rl4X63tPTWk=;
	b=iDVk9F6SuzcX1mq2TesYe3gsWg/qFip0xbObuXhX+t897rwqsp4t/SNiwITeolp1MubhW3
	jkbqjkUI+6JCna6yjZtWPha1zb0qzILDsf4iEJjiWaePI6w4SBmKn276fq2J7nsV+mFgne
	sEI5b7MJvi8Cm8/Yg2eOeWEwiJM6qSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-Y1TUjfGsNS-jBsi8kihbSQ-1; Mon, 15 Apr 2024 08:03:03 -0400
X-MC-Unique: Y1TUjfGsNS-jBsi8kihbSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C265810431;
	Mon, 15 Apr 2024 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA82FC13FA1;
	Mon, 15 Apr 2024 12:03:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/23] media: atomisp: Remove empty s_power() op from ISP subdev
Date: Mon, 15 Apr 2024 14:02:17 +0200
Message-ID: <20240415120220.219480-21-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Remove the empty isp_subdev_set_power() callback.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 1bb33460210c..3a3e84a035e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -149,18 +149,6 @@ static long isp_subdev_ioctl(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/*
- * isp_subdev_set_power - Power on/off the CCDC module
- * @sd: ISP V4L2 subdevice
- * @on: power on/off
- *
- * Return 0 on success or a negative error code otherwise.
- */
-static int isp_subdev_set_power(struct v4l2_subdev *sd, int on)
-{
-	return 0;
-}
-
 static int isp_subdev_subscribe_event(struct v4l2_subdev *sd,
 				      struct v4l2_fh *fh,
 				      struct v4l2_event_subscription *sub)
@@ -596,7 +584,7 @@ static int isp_subdev_set_format(struct v4l2_subdev *sd,
 
 /* V4L2 subdev core operations */
 static const struct v4l2_subdev_core_ops isp_subdev_v4l2_core_ops = {
-	.ioctl = isp_subdev_ioctl, .s_power = isp_subdev_set_power,
+	.ioctl = isp_subdev_ioctl,
 	.subscribe_event = isp_subdev_subscribe_event,
 	.unsubscribe_event = isp_subdev_unsubscribe_event,
 };
-- 
2.44.0


