Return-Path: <linux-media+bounces-9354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7528A4E58
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1511A1F21C9A
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE2D6BFA5;
	Mon, 15 Apr 2024 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E6dr4SH7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C006BB48
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182568; cv=none; b=uN9G+eWHoKgwzBJ57BVzSgE/IiO8WjtDso/6ZA8ELzQOxF6hCigmznyEQZgafYFOM7GY76/wZubVD3Xv8bTE6Nc7oIy7HGLmYb0TBmuh1FRcirugkJE17DzbLgvRB1uCbtXHIiwH6+7CGbWZtOql6d645UWB+PeGQs+QUREP3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182568; c=relaxed/simple;
	bh=x3kCVnAyw5tLJJjpuLblY+XLP3kYr3A6D8hRR+rN4yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxDv3C/nkCB1xnJ0XdzJfBRnbnklpCbk1dstarBT7BtCgIlZ88a3YyfSsrhevfChs0XuXRwLtIcJHw//tvMoeaM9LHBRiotO1cEBgLzYlE9rd8zOCuVCpCuteO6EXzxZiPCmDieA0LFqaIZHowwqmLCEM/tw+IrKAPtiJhssh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E6dr4SH7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XYDpUrp+f4HmqzJpMM1JPG8lEyHLpq3QLCxRwUTsRw=;
	b=E6dr4SH7wqaSvt99c5DLUTbx3uqjutf4Ahdxb+lEML/xrap0wnLffokAU5Zj+XMfq5UW+S
	6JirGqorx/y/77ML57XFyWMSl7q6tWNSNuoFr3WbA9MdNzSPRII1BB8U2p3g0rhStMOn6r
	FbJ/GmtcyNvJ5Ai+l4cRODtqN+j2gWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-zPjW32AVOU2QKMVNSSNsDw-1; Mon, 15 Apr 2024 08:02:42 -0400
X-MC-Unique: zPjW32AVOU2QKMVNSSNsDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A68A1049BC8;
	Mon, 15 Apr 2024 12:02:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32F6EC01594;
	Mon, 15 Apr 2024 12:02:40 +0000 (UTC)
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
Subject: [PATCH 05/23] media: atomisp: Ensure CSI-receiver[x] -> ISP links correctly reflect current sensor
Date: Mon, 15 Apr 2024 14:02:02 +0200
Message-ID: <20240415120220.219480-6-hdegoede@redhat.com>
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

Add a new atomisp_setup_input_links() helper which ensures that
the CSI-receiver -> ISP link for input_curr is marked as enabled and
the other CSI-receiver -> ISP links are disabled.

And call this helper from atomisp_register_device_nodes() for the initial
setup and from atomisp_select_input() for runtime input_curr changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 34 +++++++++++++++++++
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  3 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  6 +++-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  4 +++
 4 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6c93bab17955..b273234dc439 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3755,9 +3755,43 @@ int atomisp_select_input(struct atomisp_device *isp, unsigned int input)
 	if (input != input_orig)
 		atomisp_s_sensor_power(isp, input_orig, 0);
 
+	atomisp_setup_input_links(isp);
 	return 0;
 }
 
+/*
+ * Ensure the CSI-receiver -> ISP link for input_curr is marked as enabled and
+ * the other CSI-receiver -> ISP links are disabled.
+ */
+void atomisp_setup_input_links(struct atomisp_device *isp)
+{
+	struct media_link *link;
+
+	lockdep_assert_held(&isp->media_dev.graph_mutex);
+
+	for (int i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
+		link = media_entity_find_link(
+				&isp->csi2_port[i].subdev.entity.pads[CSI2_PAD_SOURCE],
+				&isp->asd.subdev.entity.pads[ATOMISP_SUBDEV_PAD_SINK]);
+		if (!link) {
+			dev_err(isp->dev, "Error cannot find CSI2-port[%d] -> ISP link\n", i);
+			continue; /* Should never happen */
+		}
+
+		/*
+		 * Modify the flags directly, calling media_entity_setup_link()
+		 * will end up calling atomisp_link_setup() which calls this
+		 * function again leading to endless recursion.
+		 */
+		if (isp->sensor_subdevs[i] == isp->inputs[isp->asd.input_curr].camera)
+			link->flags |= MEDIA_LNK_FL_ENABLED;
+		else
+			link->flags &= ~MEDIA_LNK_FL_ENABLED;
+
+		link->reverse->flags = link->flags;
+	}
+}
+
 static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 					   struct v4l2_mbus_framefmt *ffmt,
 					   int which)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index f302763b7b2f..03703eed86fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -247,6 +247,9 @@ int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool
 /* Select which sensor to use, must be called with a valid input */
 int atomisp_select_input(struct atomisp_device *isp, unsigned int input);
 
+/* Setup media-controller links to reflect input_curr setting */
+void atomisp_setup_input_links(struct atomisp_device *isp);
+
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1f8d44900a82..c16942051cfb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -461,7 +461,11 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	if (ret)
 		return ret;
 
-	return atomisp_select_input(isp, input);
+	mutex_lock(&isp->media_dev.graph_mutex);
+	ret = atomisp_select_input(isp, input);
+	mutex_unlock(&isp->media_dev.graph_mutex);
+
+	return ret;
 }
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 1d7d38e2f904..1008a709b589 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1085,6 +1085,10 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 		dev_warn(isp->dev, "too many atomisp inputs, TPG ignored.\n");
 	}
 
+	mutex_lock(&isp->media_dev.graph_mutex);
+	atomisp_setup_input_links(isp);
+	mutex_unlock(&isp->media_dev.graph_mutex);
+
 	isp->asd.video_out.vdev.v4l2_dev = &isp->v4l2_dev;
 	isp->asd.video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	err = video_register_device(&isp->asd.video_out.vdev, VFL_TYPE_VIDEO, -1);
-- 
2.44.0


