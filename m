Return-Path: <linux-media+bounces-9355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 882658A4E59
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DCB31F21B59
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479E5692FC;
	Mon, 15 Apr 2024 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JjVRUs9r"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A36BB46
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182570; cv=none; b=k+rOrYRzeBOsIjhT6f4e05Gd9mbH0oKeG7ytWFBNscIG2viucVUfbF0u2ZvBRXJ1QUOkmOU5pI/6u1DlkA63Kf9ThcQmgDqf8Rz9BCwikgMVeET3LCuGm0JXWdKvI7uce1iNEaKBTnyQDl3lecPoLEUupErBK240ASylvd7VAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182570; c=relaxed/simple;
	bh=tUq7lwX0vF8fdvib6LhCKRkou0XV5TAkKQ8Jqf72BhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKW5GBByOGngp6ZsLg/A4kQb2198AvegkLdEhfici+19tGW7tg0Ldw54CPNeMUTzEe6zKY8hUfX3fRSubJy0byjMwM6SrRIK6eEa3h+vFcq+9ceiRuQuLDS+673ob0f80ENz80qsvO7EZs4egNKsDDQ9fLvx9wC04jQnezTuP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JjVRUs9r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hUwAdp8wxs1jFxxpeLQwctLRnJdVN0kFo2BYKYYTfc=;
	b=JjVRUs9rk8ADWK0iGK/PCwfurDnHVQfL1jTuN3hqFgy7GpB5KSt1WzuiE+k5vrbzcFiE3i
	FiR06EJxEYZlsioQiPfSiG4hIqEHOdsyd42pHX9Ax5laYaHw8pfgsTc9BWrBgC3Vt4S5QB
	jwcZbkwG9xbJnifrOP8UEryPAnCoSmk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-ssassCmsNCmIq7k3abJBmg-1; Mon,
 15 Apr 2024 08:02:44 -0400
X-MC-Unique: ssassCmsNCmIq7k3abJBmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B38238143A0;
	Mon, 15 Apr 2024 12:02:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14E2DC13FA3;
	Mon, 15 Apr 2024 12:02:42 +0000 (UTC)
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
Subject: [PATCH 07/23] media: atomisp: Propagate v4l2_mbus_framefmt.field to CSI port sink pad
Date: Mon, 15 Apr 2024 14:02:04 +0200
Message-ID: <20240415120220.219480-8-hdegoede@redhat.com>
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

Most sensor drivers report V4L2_FIELD_NONE as v4l2_mbus_framefmt.field
value. Propagate this to the v4l2_mbus_framefmt for the CSI port to pass
the link validation done by media_pipeline_start().

Keep the v4l2_mbus_framefmt.field for the source pad of the CSI port
as V4L2_FIELD_ANY to match the ISP sink pad.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 89118438a3b6..e939a09a279b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,9 +107,12 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 		actual_ffmt->height = clamp_t(u32, ffmt->height,
 					      ATOM_ISP_MIN_HEIGHT,
 					      ATOM_ISP_MAX_HEIGHT);
+		actual_ffmt->field = ffmt->field;
 
 		tmp_ffmt = *ffmt = *actual_ffmt;
 
+		/* Always use V4L2_FIELD_ANY to match the ISP sink pad */
+		tmp_ffmt.field = V4L2_FIELD_ANY;
 		return atomisp_csi2_set_ffmt(sd, sd_state, which,
 					     CSI2_PAD_SOURCE,
 					     &tmp_ffmt);
-- 
2.44.0


