Return-Path: <linux-media+bounces-51651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NTbOKKreGl9rwEAu9opvQ
	(envelope-from <linux-media+bounces-51651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:12:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940E9414F
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F65C3047E6D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2648634C818;
	Tue, 27 Jan 2026 12:09:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45135334C27;
	Tue, 27 Jan 2026 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515785; cv=none; b=sALvxxtmUlOKqQ4Y824VRtp1IiuJwJieo7hIBwSUpzYGsc8IjbFNYTQyhMyQvm9+/r9kZXfDfd8MGCLcfU6mtpYjp0XCpTEG9LyRLKW3qWZy2jTNsiTrRxUxd84FY2+j6gfSEI17Go/KiJRBXzxrB3eJl2EZb2R2xiuiJjdrvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515785; c=relaxed/simple;
	bh=gAFVcdmQYWZcD14R3YEKbnKzYtijWyDHqGPXbRLb9hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QqaK39pWcQjAYJMriS7nLBTg2YqoeENcyLSRL0+FY/zWdsFL3bNKj38ZaY2tez1IzwcGirdewSjzmQb7+mo4pf1olOQpQpBHlQelWg169Kbaf1TYa6gw8TdkMQ4cGZcAG/uQX10+6zRcg/B+ZE7D6H/bAEQ8iQR3OxKyPLd5Nd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id AB80185AEB;
	Tue, 27 Jan 2026 13:09:32 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 1/2] media:pci:mgb4: Add zDML color mapping support
Date: Tue, 27 Jan 2026 13:09:12 +0100
Message-ID: <20260127120913.4690-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127120913.4690-1-tumic@gpxsee.org>
References: <20260127120913.4690-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tumic@gpxsee.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[gpxsee.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51651-lists,linux-media=lfdr.de];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,digiteqautomotive.com:email]
X-Rspamd-Queue-Id: 5940E9414F
X-Rspamd-Action: no action

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add zDML (a special signal mapping as used in Audi Digital Matrix Lights)
color mapping support. In addition to extending the already existing color
mapping property of the inputs, the same property is added for the outputs
that must be configured in the same way as the inputs.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_sysfs_in.c  | 18 +++++--
 drivers/media/pci/mgb4/mgb4_sysfs_out.c | 63 +++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_in.c b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
index 4cd4addcd0a5..80ff05450e98 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_in.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
@@ -128,7 +128,16 @@ static ssize_t color_mapping_show(struct device *dev,
 	u32 config = mgb4_read_reg(&vindev->mgbdev->video,
 	  vindev->config->regs.config);
 
-	return sprintf(buf, "%s\n", config & (1U << 8) ? "0" : "1");
+	switch ((config >> 7) & 3) {
+	case 0: /* SPWG/VESA */
+		return sprintf(buf, "1\n");
+	case 1: /* ZDML */
+		return sprintf(buf, "2\n");
+	case 2: /* OLDI/JEIDA */
+		return sprintf(buf, "0\n");
+	default:
+		return -EIO;
+	}
 }
 
 /*
@@ -151,17 +160,20 @@ static ssize_t color_mapping_store(struct device *dev,
 
 	switch (val) {
 	case 0: /* OLDI/JEIDA */
-		fpga_data = (1U << 8);
+		fpga_data = 2;
 		break;
 	case 1: /* SPWG/VESA */
 		fpga_data = 0;
 		break;
+	case 2: /* ZDML */
+		fpga_data = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
 
 	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
-		      1U << 8, fpga_data);
+		      3U << 7, fpga_data << 7);
 
 	return count;
 }
diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
index 5769f3ca6c2f..5ebb1f1356cf 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
@@ -69,6 +69,65 @@ static ssize_t video_source_show(struct device *dev,
 	return sprintf(buf, "%u\n", (config & 0xc) >> 2);
 }
 
+static ssize_t color_mapping_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct video_device *vdev = to_video_device(dev);
+	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
+	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
+	  voutdev->config->regs.config);
+
+	switch ((config >> 6) & 3) {
+	case 0: /* SPWG/VESA */
+		return sprintf(buf, "1\n");
+	case 1: /* ZDML */
+		return sprintf(buf, "2\n");
+	case 2: /* OLDI/JEIDA */
+		return sprintf(buf, "0\n");
+	default:
+		return -EIO;
+	}
+}
+
+/*
+ * Color mapping change is expected to be called on live streams. Video device
+ * locking/queue check is not needed.
+ */
+static ssize_t color_mapping_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct video_device *vdev = to_video_device(dev);
+	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
+	u32 fpga_data;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case 0: /* OLDI/JEIDA */
+		fpga_data = 2;
+		break;
+	case 1: /* SPWG/VESA */
+		fpga_data = 0;
+		break;
+	case 2: /* ZDML */
+		fpga_data = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
+		      3U << 6, fpga_data << 6);
+
+	return count;
+}
+
+
 /*
  * Video source change may affect the buffer queue of ANY video input/output on
  * the card thus if any of the inputs/outputs is in use, we do not allow
@@ -711,6 +770,7 @@ static DEVICE_ATTR_RW(hback_porch);
 static DEVICE_ATTR_RW(hfront_porch);
 static DEVICE_ATTR_RW(vback_porch);
 static DEVICE_ATTR_RW(vfront_porch);
+static DEVICE_ATTR_RW(color_mapping);
 
 static DEVICE_ATTR_RW(fpdl3_output_width);
 
@@ -731,6 +791,7 @@ struct attribute *mgb4_fpdl3_out_attrs[] = {
 	&dev_attr_vback_porch.attr,
 	&dev_attr_vfront_porch.attr,
 	&dev_attr_fpdl3_output_width.attr,
+	&dev_attr_color_mapping.attr,
 	NULL
 };
 
@@ -740,6 +801,7 @@ struct attribute *mgb4_gmsl3_out_attrs[] = {
 	&dev_attr_display_width.attr,
 	&dev_attr_display_height.attr,
 	&dev_attr_frame_rate.attr,
+	&dev_attr_color_mapping.attr,
 	NULL
 };
 
@@ -759,5 +821,6 @@ struct attribute *mgb4_gmsl1_out_attrs[] = {
 	&dev_attr_hfront_porch.attr,
 	&dev_attr_vback_porch.attr,
 	&dev_attr_vfront_porch.attr,
+	&dev_attr_color_mapping.attr,
 	NULL
 };
-- 
2.52.0


