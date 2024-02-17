Return-Path: <linux-media+bounces-5340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7F858F10
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C691C210D4
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4112B65E04;
	Sat, 17 Feb 2024 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFAvjR9x"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF42657A9
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169101; cv=none; b=TwnE/3lHkdJXN0MEAoe/TFrlgdrkc3qmviJNztSaRggTv0u7/Juge2dX+oZD5DhTxPm/GbG8M1/sqW56juEU3GxLoudaxpSLSROJz6/Gc0gDLvQZC5O/5GgpyYa060Ur6egLd1psW85fQ8ryjB4YrFCVUGmgB0VvL1H7M7JIyhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169101; c=relaxed/simple;
	bh=GhHWTQah4qAfwcyOiKugTZYg+iNzrMhg4TO18/Rhp7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmTZXDGaYAVf9hoGmRrd3r3kd1Zt9GnJMYVLav3eVwX1mLk6kyuAq93tcnChEC1zf0MPomnAHXxYJPJqguGMC+kfoGGn7dyLJRCQyrItUFmlTWId20ml+lSveaESFUWZRDE+QdWv8B8cUt13LVl3E9vnAHLMKa7THI1b+QCNyG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFAvjR9x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJYlabdakQKxlJf7c7KUDCD4THOgNbpITlRwUK0S6Pc=;
	b=QFAvjR9xFwgCe7CX5YVw8fqDh5XyvHk6bvWDdloWzff238/ZQVZHEyytf2NXecTmRTjNsm
	X8aR6Ebs2nATUaQVoHtJX2v1sFXAg+Idyxc+AN6WfFj1wQ4e7/QVBg3bmc4cprr1f6YGWk
	F153k1ajZRmVf5fN58LJTk+p4ShMApA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-PcI-C41HNIy1inDFWs4NyA-1; Sat, 17 Feb 2024 06:24:54 -0500
X-MC-Unique: PcI-C41HNIy1inDFWs4NyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E3E811E79;
	Sat, 17 Feb 2024 11:24:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0191C1C7E3;
	Sat, 17 Feb 2024 11:24:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/9] media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev
Date: Sat, 17 Feb 2024 12:24:34 +0100
Message-ID: <20240217112438.15240-6-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev, so that
a proper /dev/v4l-subdev# gets created for it.
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 8293bda0c681..7f1ca05ce54a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -802,7 +802,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	sprintf(sd->name, "ATOMISP_SUBDEV");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
-	sd->devnode = &asd->video_out.vdev;
 
 	pads[ATOMISP_SUBDEV_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	pads[ATOMISP_SUBDEV_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-- 
2.43.0


