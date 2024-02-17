Return-Path: <linux-media+bounces-5342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B895858F12
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02211F22361
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C17664D5;
	Sat, 17 Feb 2024 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Du8Y4eh+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642B65BCD
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169105; cv=none; b=gnpk4pc3+CGQz8jaVuS2NTwUm6HYtMHfPXvLf1zphvTciGDWcygoBuOJFksncKYl5sK26qD2TtjXagarBdCD/6avra62s5MzZBdSN9RSZlcoVXRWT3B+gN6B683rWZX2mHznuyLO1o6AaJSX7WKUBy7LNtQb5XAmBYHvkwz2cxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169105; c=relaxed/simple;
	bh=az0juSVxRAm+2xPusheL0MEA2fzlp8Nt4iN47vXYwV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJ7tXhwNPR0gTRzFp7FUaKkZSUmBVdEXu7sx6JX/GqjTJtLHa6Yb2KFgmigEO/Q9v0MCMR1yJeIKJ/vO7oimPstOwNASUQga2BRa/jIrZi+nwuaRdmXPYwceFwI0pOE1i1kI9SW3H6vUk/uIbzOYzaGbTWdZKyLqgfRdX8I/Fnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Du8Y4eh+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLyDg+vKCWtQHBB/yP8t49hpe+D3zz4E/SvOD24Eu0c=;
	b=Du8Y4eh+rHGZlTF76vIj8n/9VRfnQp71UViJgkd10SaBN4lLQ7agA/8xvgVsJadENQYYt0
	ywEDim/VT3s9Mlz9Zv+MBZDaAwc3OeEMisTCySpkG18JYFEjbLXa6fd9NbZjOvjed/BvQ0
	sJiyV4sGm2vKU0ORJk0B7rIgRj5gqFg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-zNfwzdCpOjOGU9dMbvtq4A-1; Sat,
 17 Feb 2024 06:24:58 -0500
X-MC-Unique: zNfwzdCpOjOGU9dMbvtq4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6750D3806707;
	Sat, 17 Feb 2024 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0D241C1C7E3;
	Sat, 17 Feb 2024 11:24:55 +0000 (UTC)
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
Subject: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
Date: Sat, 17 Feb 2024 12:24:36 +0100
Message-ID: <20240217112438.15240-8-hdegoede@redhat.com>
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

Change the generic "ATOMISP_SUBDEV" name to "ATOM ISP" to make clear
that this is the subdev for the ISP itself.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 8253b6faf8cd..822fe7d129e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -799,7 +799,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	int ret;
 
 	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
-	sprintf(sd->name, "ATOMISP_SUBDEV");
+	sprintf(sd->name, "ATOM ISP");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-- 
2.43.0


