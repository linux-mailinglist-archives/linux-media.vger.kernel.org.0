Return-Path: <linux-media+bounces-31499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3BAA5F66
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 15:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 787EE7A4757
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 13:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC241D63C2;
	Thu,  1 May 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJBTAM7O"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC241AF4E9
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107018; cv=none; b=MpRVCzMMPwj6SXcKmVGA2dhE4RSh53VS+gmuQV/r2+HhKEYPfm2Rp+cKT6PuVZ+4moy+cqPdM8Zql244vP3+4kS9i+/bZJmn8YjVV5ETIDOxkGKN6IJlfA3/Z7ZJKYm7xunKx9tCk0/9Tcj6BUqu7VDy9dzZKi/AVJv4msdE+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107018; c=relaxed/simple;
	bh=1mEUJd/V5F3huV6bNQWff3ZDLINtWkcTqw0I87PDj2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndK1soGQIrQELdNXDrDuKyTiFGcXmrVIvk6NvseeVuAGcn1de0BwHC0CHnNou1pkyRiSGdFnjGNzBTn/yXD5pOh05lxskXm64ihF07rzyJmpolKcdXKquvT1Vh7+mt0rXY5twf4VB0teaC+F5OuzC+N40TIELEn+EiAFhajEAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJBTAM7O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746107014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzT5DPx6Bq1PuXCGYbF3aB0bvJdoUf2KjpFQvUF06Vk=;
	b=cJBTAM7Ogb1wpl9mkJyRmNG3JECY9DO9zt/K9HXFuEigD3qx5Dvsac5rRmsOD2XqKFLJIc
	1IsqOe0UHD+/yIxLc57QF1SyceWi7Qp4cnKb/twJuhp/mfDaoFqPHfDSBbQs/d3P3quCU4
	w6AAV+rfiPD3OYvSxuiSqAvj/d1W0Zg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-wAJC-smAMKqbOValkF3HCg-1; Thu,
 01 May 2025 09:43:31 -0400
X-MC-Unique: wAJC-smAMKqbOValkF3HCg-1
X-Mimecast-MFC-AGG-ID: wAJC-smAMKqbOValkF3HCg_1746107010
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29D551800261;
	Thu,  1 May 2025 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.142])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E76A61956094;
	Thu,  1 May 2025 13:43:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/4] media: atomisp: Avoid deadlock with sensor subdevs with state_lock set
Date: Thu,  1 May 2025 15:43:10 +0200
Message-ID: <20250501134312.104711-3-hdegoede@redhat.com>
In-Reply-To: <20250501134312.104711-1-hdegoede@redhat.com>
References: <20250501134312.104711-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

When a (sensor) v4l2_subdev has its state_lock member set to non NULL,
then all v4l2_subdev_state-s for the sensor share the same lock.

atomisp_init_sensor() calls v4l2_subdev_lock_and_get_active_state() and
then later on also tries to lock a separate v4l2_subdev_state used for try
calls (rather then changing the active state), while still holding
the active state lock.

Since this try v4l2_subdev_state shares a lock with the active state this
results in a deadlock.

Skip locking try_sd_state when sensor->state_lock is set to avoid this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 03c535bcb229..ac8fefca7922 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -963,10 +963,17 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	sel.which = V4L2_SUBDEV_FORMAT_TRY;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
-	v4l2_subdev_lock_state(input->try_sd_state);
+
+	/* Don't lock try_sd_state if the lock is shared with the active state */
+	if (!input->sensor->state_lock)
+		v4l2_subdev_lock_state(input->try_sd_state);
+
 	err = v4l2_subdev_call(input->sensor, pad, set_selection,
 			       input->try_sd_state, &sel);
-	v4l2_subdev_unlock_state(input->try_sd_state);
+
+	if (!input->sensor->state_lock)
+		v4l2_subdev_unlock_state(input->try_sd_state);
+
 	if (err)
 		goto unlock_act_sd_state;
 
-- 
2.49.0


