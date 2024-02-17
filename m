Return-Path: <linux-media+bounces-5344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B344E858F14
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73981C20AE4
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61622679F3;
	Sat, 17 Feb 2024 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYOpr0wt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906065BAA
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169109; cv=none; b=L0kMYULOqYZ9euC4R1IsdMlwaPUjowhA7S/H/6+K+8Za36GK+s0sISGcmCFmMfI4uKQvdEn3IIn93emprLCdzE6skOxT2GBoAqOcMBaFss/b2Es30MinuKsY2XlZ8rp2vwibimD04LwJM91M4BPdmZDkxbLChsRzApfzip4VF6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169109; c=relaxed/simple;
	bh=LBdizpIdfxKhNb6xt+BBwC5JRMC7DKJqrZW0ugICFg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuLNBrkjR7noGcN4B5X4KOHNMDImEWDTCzfQbDWHbwr7LiFbDh87Pztddxfzf/SdL0T0KhF1gndXs3JHauV+zcQP+s997B5Q69laJVlgEjSpb7+QzBjboTJ9Y3tN1noF+/fY/lzKCFskI9NxTd/mn+ZjP2awbPNKW8OIYIJkN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYOpr0wt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnD/bpJNWsWwe9bikQDt+Bd0F5krXrJasXs0pkYTi68=;
	b=FYOpr0wtuovrORxO2U9FPRYVJWB24IJHFBPX2pdAyeYtu+PLPJWl4XKqyDh0LxwBHzOkRC
	1heEqE1er6GTrlmOjR6rqXJCCzN9n71LFTGLsN4Q/MW7UugJ4xOVV3jpyMYIzmCYyhpP27
	5VLMqXVw5gB0kPX0irXUUeCQLhD0bR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-pLvs6qLuOu6GDtAvGoFALQ-1; Sat, 17 Feb 2024 06:25:01 -0500
X-MC-Unique: pLvs6qLuOu6GDtAvGoFALQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC9C828CE2;
	Sat, 17 Feb 2024 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50CE31C1C7E7;
	Sat, 17 Feb 2024 11:24:59 +0000 (UTC)
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
Subject: [PATCH 9/9] media: atomisp: Implement link_setup op for ISP subdev MC entity
Date: Sat, 17 Feb 2024 12:24:38 +0100
Message-ID: <20240217112438.15240-10-hdegoede@redhat.com>
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

The atomisp driver's Android heritage makes it weird in that
even though it uses MC + subdev-s it is designed to primarily
be controlled through its /dev/video# node.

It implements s_input on /dev/video# to select which sensor to use,
while ignoring setup_link calls to enable a link to another sensor.

Add support for selecting the active sensor the MC way by adding
setup_link support.

The implementation is a bit convoluted due to the atomisp driver's
heritage.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 822fe7d129e2..17819d7586dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -30,6 +30,7 @@
 #include "atomisp_common.h"
 #include "atomisp_compat.h"
 #include "atomisp_fops.h"
+#include "atomisp_ioctl.h"
 #include "atomisp_internal.h"
 
 const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
@@ -634,8 +635,59 @@ static void isp_subdev_init_params(struct atomisp_sub_device *asd)
 }
 
 /* media operations */
+static int atomisp_link_setup(struct media_entity *entity,
+			      const struct media_pad *local,
+			      const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd = container_of(entity, struct v4l2_subdev,
+					      entity);
+	struct atomisp_sub_device *asd = v4l2_get_subdevdata(sd);
+	struct atomisp_device *isp = asd->isp;
+	int i, csi_idx, ret;
+
+	/* ISP's source is immutable */
+	if (local != &asd->pads[ATOMISP_SUBDEV_PAD_SINK]) {
+		v4l2_err(sd, "Error pad %d does not support changing flags\n",
+			 local->index);
+		return -EINVAL;
+	}
+
+	for (csi_idx = 0; csi_idx < ATOMISP_CAMERA_NR_PORTS; csi_idx++) {
+		if (&isp->csi2_port[csi_idx].pads[CSI2_PAD_SOURCE] == remote)
+			break;
+	}
+
+	if (csi_idx == ATOMISP_CAMERA_NR_PORTS) {
+		v4l2_err(sd, "Error cannot find CSI receiver for remote pad\n");
+		return -EINVAL;
+	}
+
+	/* Ignore disables, input_curr should only be updated on enables */
+	if (!(flags & MEDIA_LNK_FL_ENABLED))
+		return 0;
+
+	for (i = 0; i < isp->input_cnt; i++) {
+		if (isp->inputs[i].camera == isp->sensor_subdevs[csi_idx])
+			break;
+	}
+
+	if (i == isp->input_cnt) {
+		v4l2_err(sd, "Error no sensor for CSI receiver %d\n", csi_idx);
+		return -EINVAL;
+	}
+
+	mutex_lock(&isp->mutex);
+	ret = atomisp_pipe_check(&asd->video_out, true);
+	if (ret == 0)
+		asd->input_curr = i;
+	mutex_unlock(&isp->mutex);
+
+	return ret;
+}
+
 static const struct media_entity_operations isp_subdev_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.link_setup = atomisp_link_setup,
 	/*	 .set_power = v4l2_subdev_set_power,	*/
 };
 
-- 
2.43.0


