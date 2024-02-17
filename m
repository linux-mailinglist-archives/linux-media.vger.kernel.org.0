Return-Path: <linux-media+bounces-5343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6A858F13
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D1121F2221C
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F836651AF;
	Sat, 17 Feb 2024 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igBr6WX4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107865BC0
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169109; cv=none; b=NpC3umxSWDXMtMWv3DsEQVrIx3libLzowNtqh2Pmxm83HsaVccM5T0vHOHFNTk4iNVdkDHR+657qKDX07YKDH3ouTbrnqRXl3ze/OuSoQhswBR9eM0zG/T85Jm5PtG4aCh8PMVQHA/3TuxyQFB5xuscwuZK+Eopm+T0sp2JEAI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169109; c=relaxed/simple;
	bh=HmbcnKcq48Ewn+Xcm3fpubqQrcEZ0pdlF+AQkNIKtaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ymv+UgdAIFCDSvMrrZqTXfk16zRYGz63uICyPbCywNjO0TcFdtOIZBzoceyQz6u0BKSub/XtyCq3Q5T2L3jFh9Vx/X/TrXy3B7c7VGOqYHOyEN+Mod36q0dP0C5ck/wxXSAQQmCJxX+fMFi86fmXUc/+P4LIWoAI0eAJRw+WYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igBr6WX4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWflT3B0GVFI1GShcjGRlxXP08PiFbjDEA1rai0ECtE=;
	b=igBr6WX4pj91ongBm036Zo3WgoDsbb7jBVlTrKoVu5WbFP2Dk47E05SXWhJjY69cny3SvY
	F4YEInHYfyrb/BFM8n+kQExr0NrqAWfsRfRi/PwLWV1gdT9w05yeVG2MT7wf6NbzF8J0nr
	fc+TOsgfcgq409hkI4s/l1o7k1iSfF8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-Snku9i4fMOqkeym8lWH-YA-1; Sat,
 17 Feb 2024 06:24:59 -0500
X-MC-Unique: Snku9i4fMOqkeym8lWH-YA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FFDC3C0008A;
	Sat, 17 Feb 2024 11:24:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9886F1C1C7E6;
	Sat, 17 Feb 2024 11:24:57 +0000 (UTC)
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
Subject: [PATCH 8/9] media: atomisp: Make MC link from ISP to /dev/video# output node immutable
Date: Sat, 17 Feb 2024 12:24:37 +0100
Message-ID: <20240217112438.15240-9-hdegoede@redhat.com>
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

The link from the ISP's source pad to the /dev/video# output v4l2-dev
is always enabled and immutable, mark it as such.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 1a936dbe8eb4..86028721e7cb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1090,7 +1090,8 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 		return err;
 
 	err = media_create_pad_link(&isp->asd.subdev.entity, ATOMISP_SUBDEV_PAD_SOURCE,
-				    &isp->asd.video_out.vdev.entity, 0, 0);
+				    &isp->asd.video_out.vdev.entity, 0,
+				    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
 	if (err)
 		return err;
 
-- 
2.43.0


