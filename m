Return-Path: <linux-media+bounces-17324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E49683BB
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E029284181
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE3D1D363D;
	Mon,  2 Sep 2024 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WTpg5yKo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAE1D3625
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270762; cv=none; b=fsLExJNDlu+P+dCACtnLOy8xCEvV5swcRrEjjGP77CecSmvj8FNaYzxctb1dzJobvtAwTeVgd6n9KymIHzS0oLjtGICr0yZ4LuvADRJeZDHAifsBVVFvDaDZws9SwJYVhcLYJgbbFFrI5/wLP2s2u7Y7PuZCJv/66gduUFXlX6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270762; c=relaxed/simple;
	bh=uFl7yUOCTqCDOLrEAYLSriT/u2ITNVBa4bTnp76X5rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gfGm1HbXq3xhOZndnn98SikfwmxCuRR7rzmYpbqbPZMnfvJqdKQJ2sC9G96E5DG7ggdAnV+xeRv5NwhXvvt2EZsuVAMSl/RGlIHw13XaQ8zgQS8hql7uuEb+Z6UFZx34T/BenBGWVNYeVchQxdvud/4Yd2pNaBzCtZbYLz8pE3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WTpg5yKo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725270759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vJDQ2P1zTQIQeCDvaOkG6DbFSwFe8KFI0TJMu3LvPg=;
	b=WTpg5yKoXhd7nKG5C/j1P3EIp9/eM0ncrEvWYsOHkTeBlykfeLSX75VmvgLkGdQGLW1+I5
	5TpmFzmAuJRYOMyn4h4MepHxwaui0A8eC1X+npvMcCAIQO0BiBKOCTrk5UKgKVMhwNUbLM
	pX2T139exGj9hKv7USqlbu54aFeKg1M=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-wULZuvGNNIW76kjhZble3A-1; Mon,
 02 Sep 2024 05:52:38 -0400
X-MC-Unique: wULZuvGNNIW76kjhZble3A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5641819DBAC3;
	Mon,  2 Sep 2024 09:52:36 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.30])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9AD5C19560A3;
	Mon,  2 Sep 2024 09:52:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: atomisp: csi2-bridge: Add DMI quirk for t4ka3 on Xiaomi Mipad2
Date: Mon,  2 Sep 2024 11:52:27 +0200
Message-ID: <20240902095229.59059-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The t4ka3 sensor on the Xiaomi Mipad2 is used as a back facing sensor,
it uses 4 CSI lanes, but the _DSM has CsiLanes set to 2. Extend
the existing Xiaomi Mipad2 DMI quirk to override the wrong _DSM setting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 31c9e05a1435..b2a3243ae2d4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -109,6 +109,8 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
+	/* _DSM contains the wrong CsiLanes for the back facing T4KA3 sensor */
+	{ "XMCC0003:00", "CsiLanes", "4" },
 	{}
 };
 
-- 
2.46.0


