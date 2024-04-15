Return-Path: <linux-media+bounces-9356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826DF8A4E5A
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F17280D7F
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBAF679E5;
	Mon, 15 Apr 2024 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLTDNj5W"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5024967C53
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182571; cv=none; b=pdLKDhje0ibNi4XYHZ1fxkBAZDBuoBNZxyMc9f4fNPo1RyD/xqhc+BcRAJklquhfO+49I2iyjDL3dnbkwsysFpbjxIzxwjfh3jSfdi+XxlbP0zBe1OBp6XBdP7m3Olu3nPKN1TUsW0N1b4c+lGjnAwdgWvqABhcneyQ5A5kj34Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182571; c=relaxed/simple;
	bh=I/crcJGKiGCPrKWos2HMZnCxZmGYZxEmvwoI5y3ZeRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAdeG5pW8pv/Ak9kPE2LlMigvCRpBIsrHEAU/IcvcYU6pBWHl4mbE4+OE6+W4vo3mLysiTKgrvrqF8/bxeldpUICBInE63fmlyMrEIKxX6yZ51aCd3MOPBbwGzCvE6Q7VbN6fz5P0wyIaUwvUqfRLjFN1BZkA20Z7z7Vrei51Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLTDNj5W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHzcZyoOlxgXyDuEDBT5OdCwYlfJiRf4NMMCpBV++9c=;
	b=bLTDNj5WKIcjESn521t41nMEBGHGGnwq/TchvKzPBhmfPj2gO4BNWAWLCb4T66feyqJbaq
	smM1RTmzob0hMyNDcVxNCM7RkxOTh9VeBp2xYYWI/9SAYjosQxiVkZrV/N60+oZVzzVyp3
	8PF0MqfCX2caKuKipoYR0fJMgt04gKw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-PgibmUJzNUuyYj6HEf46pg-1; Mon,
 15 Apr 2024 08:02:43 -0400
X-MC-Unique: PgibmUJzNUuyYj6HEf46pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7EAE1C0C64B;
	Mon, 15 Apr 2024 12:02:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DCA3C13FA2;
	Mon, 15 Apr 2024 12:02:41 +0000 (UTC)
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
Subject: [PATCH 06/23] media: atomisp: Propagate set_fmt on sensor results to CSI port
Date: Mon, 15 Apr 2024 14:02:03 +0200
Message-ID: <20240415120220.219480-7-hdegoede@redhat.com>
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

So far the CSI port sink and source pads have not had their fmt set at all,
leaving things at the default of SBGGR8_1X8/0x0.

This means that pipeline validation such as e.g. done when calling
media_pipeline_start() will fail since the links to / from the CSI
ports have different fmts on each end.

Store a pointer to the CSI port v4l2-subdev in struct atomisp_input_subdev,
and use this in atomisp_set_sensor_crop_and_fmt() to propagate the sensors
new fmt after a successful set_fmt to the CSI port it is connected too.

The input->csi_port pointer also allows simplifying atomisp_link_setup().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c |  7 +++++++
 .../media/atomisp/pci/atomisp_internal.h        |  1 +
 .../staging/media/atomisp/pci/atomisp_subdev.c  | 17 +++--------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c    |  1 +
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b273234dc439..ecd521043021 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3858,6 +3858,13 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	if (sd_state)
 		v4l2_subdev_unlock_state(sd_state);
 
+	/* Propagate new fmt to CSI port */
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = v4l2_subdev_call(input->csi_port, pad, set_fmt, NULL, &format);
+		if (ret)
+			return ret;
+	}
+
 	*ffmt = format.format;
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 02fffa7f65e1..c81a1c5f2864 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -129,6 +129,7 @@ struct atomisp_input_subdev {
 	bool crop_support;
 	bool camera_on;
 	struct v4l2_subdev *camera;
+	struct v4l2_subdev *csi_port;
 	/* Sensor rects for sensors which support crop */
 	struct v4l2_rect native_rect;
 	struct v4l2_rect active_rect;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index aabffd6a424d..53225958c23b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -644,7 +644,7 @@ static int atomisp_link_setup(struct media_entity *entity,
 					      entity);
 	struct atomisp_sub_device *asd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = asd->isp;
-	int i, csi_idx, ret;
+	int i, ret;
 
 	/* ISP's source is immutable */
 	if (local != &asd->pads[ATOMISP_SUBDEV_PAD_SINK]) {
@@ -653,24 +653,13 @@ static int atomisp_link_setup(struct media_entity *entity,
 		return -EINVAL;
 	}
 
-	for (csi_idx = 0; csi_idx < ATOMISP_CAMERA_NR_PORTS; csi_idx++) {
-		if (&isp->csi2_port[csi_idx].pads[CSI2_PAD_SOURCE] == remote)
-			break;
-	}
-
-	if (csi_idx == ATOMISP_CAMERA_NR_PORTS) {
-		v4l2_err(sd, "Error cannot find CSI receiver for remote pad\n");
-		return -EINVAL;
-	}
-
-
 	for (i = 0; i < isp->input_cnt; i++) {
-		if (isp->inputs[i].camera == isp->sensor_subdevs[csi_idx])
+		if (&isp->inputs[i].csi_port->entity.pads[CSI2_PAD_SOURCE] == remote)
 			break;
 	}
 
 	if (i == isp->input_cnt) {
-		v4l2_err(sd, "Error no sensor for CSI receiver %d\n", csi_idx);
+		v4l2_err(sd, "Error no sensor for selected CSI receiver\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 1008a709b589..809b9c4e7a92 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1058,6 +1058,7 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 		input->type = RAW_CAMERA;
 		input->port = i;
 		input->camera = isp->sensor_subdevs[i];
+		input->csi_port = &isp->csi2_port[i].subdev;
 
 		atomisp_init_sensor(input);
 
-- 
2.44.0


