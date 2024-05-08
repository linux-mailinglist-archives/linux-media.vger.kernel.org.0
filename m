Return-Path: <linux-media+bounces-11112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3A8BF4BE
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 04:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 591241F22184
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 02:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82194134A6;
	Wed,  8 May 2024 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="id37CP6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFB35228;
	Wed,  8 May 2024 02:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715136742; cv=none; b=XPaSiv5BSBH+5dcTXoKWjFlBFZGqDcxb00iFylQNpcld/18vfSMnV2i2OuVvEpikf2A5dQAIVBuH1rGTfVrR2BGxh4h1sAaB03JDaVFI/VV70KQvW5dcIyIThR+SdkywPxzBDfhfe5lJkGdZztj++TaOKXckjj/PO2WiOOYifb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715136742; c=relaxed/simple;
	bh=tsvoE3t4+nq4hodQWrfVGpaWSOPtMpX3lIjRqCsujEM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OSez/8QrUIQlecBVaAEWrqoOeFovNyjU+upkAfSyt/e8BzIfNwBMyXiIbLNSJe99wGMIg84ZWO6iBzB5uzM4CTLQ28T80FlAvKBV8H1q3LiWUy1Swq6rYf0dfvTXnl3CLmhU6JSYVR6uVrKj0/rXx4c6yMn+qF9vDeKMXvm41PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=id37CP6Y; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1715136732;
	bh=geZdhczy5v3XzQr5jvBujPytnWZIYj7CXxZvY/BFYqI=; l=2046;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=id37CP6YkKhYhgqRjFkjxptdViRINuLDgWY5XIHLuHlIhDH9AC9VsZ+J1yccfFJrv
	 VkRI2G2LrRGX4SIGLWHBCtzdqNKOvZgXI4hEBfoQhNnV9gKI6oZTOIK7dgPc2SN2RK
	 8eVufmhDN2MGPgOpycCoGD002U59IN1gLig1DWa7ENX4fkPlLui3IfZCSW+HO8evDy
	 lyG5DpHAqXbURTHsvX/zjij+OIiM4wXxfDONJlHeVss5VdeRzLwUTmZlGB96A14VaV
	 Ut3MFWHdXY7zvzyzwJtV19qE6agbi+HGvpheUtP2bV7jBx+tkpRerBjcqop3cP+50H
	 oRZ4FaMCf5Wzw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(3885196:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Wed, 08 May 2024 10:51:52 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 May 2024
 10:51:51 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 May 2024 10:51:51 +0800
From: <cy_huang@richtek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Daniel Scally <djrscally@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash subdev binding
Date: Wed, 8 May 2024 10:51:49 +0800
Message-ID: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
created from v4l2 device, the v4l2 flash subdev async binding will enter
the logic to create media link. Due to the subdev of notifier is NULL,
this will cause NULL pointer to access the subdev entity. Therefore, add
the check to bypass it.

Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi,

  I'm trying to bind the v4l2 subdev for flashlight testing. It seems
some logic in v4l2 asynd binding is incorrect.

From the change, I modified vim2m as the test driver to bind mt6370 flashlight.

Here's the backtrace log.

 vim2m soc:vim2m: bound [white:flash-2]
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
 ......skipping
 Call trace:
  media_create_ancillary_link+0x48/0xd8 [mc]
  v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
  v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]
  __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
  v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
  mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]

After tracing the code, it will let the subdev labeled as F_LENS or
F_FLASH function to create media link. To prevent the NULL pointer
issue, the simplest way is add a check when 'n->sd' is NULL and bypass
the later media link creataion.
---
 drivers/media/v4l2-core/v4l2-async.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3ec323bd528b..9d3161c51954 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
 		return 0;
 
+	if (!n->sd)
+		return 0;
+
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
 #endif
-- 
2.34.1


