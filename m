Return-Path: <linux-media+bounces-26068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEFBA326B6
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 14:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB829188A247
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 13:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0341120E703;
	Wed, 12 Feb 2025 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YD2USBb8"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCE20E6F3;
	Wed, 12 Feb 2025 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366004; cv=none; b=sv915fCwmSTlIqUINeoBHQNGJqddE8CKEs/vrJENDU1dnjxdMmnoYdqy2UXelhTrKO9itOaqLtq1K1WisiN6BX3RlNGtfPh+qHt35ZEUHsuFEk77D4nELHekc1IxJoA9lFiIc/J6iEZMaR7D5y4S/Xfc0ptKpfuz8PvJT4w3f40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366004; c=relaxed/simple;
	bh=zCG/SUO7M4+COWP9KWE1Zoc70Q6vFdYxUpFKqy4YvHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNe/gEnVf+MrBFdaSErrWnlNTS682isocTNJRAOvnNVCTOyoUh1WHI3WWje3DalAa+1pWnxdx3gad7t3ZJUTdC6PLv3tiASB5kN2l7linR5ta4vJ2Hg3WCWsIkcKfPj2ozPybchz7sfjdwtp17wPjENV5InbbzlSdr85aL31YcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YD2USBb8; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CDD7nO3803188
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 07:13:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739365987;
	bh=vjCe+U8Uhg+hCjx6/OHf+h6rq2LNWx4o8TQIrd4L5Zk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YD2USBb8YeUY6g+e/TvrvfFXllxxr629O/eIaD3rabe1YxwQfs3zo6jS9yWkh7CA2
	 cgtAfkVCrxWac6phxTIrv00IaSkrKf4FsOsOg0HaQCBuuycB9kO+bWzG1BrL2+dQjS
	 bK2Bk3QFNSTi43az+3Jk0rbO/+M17WikrH0uNp7I=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CDD7pL117908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 07:13:07 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 07:13:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 07:13:06 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CDCkOO050929;
	Wed, 12 Feb 2025 07:13:03 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [RFC PATCH 3/3] media: ti: j721e-csi2rx: Add support for VIDIOC_LOG_STATUS
Date: Wed, 12 Feb 2025 18:42:44 +0530
Message-ID: <20250212131244.1397722-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The VIDIOC_LOG_STATUS ioctl outputs the current status of a device to the
kernel log. When this ioctl is called on a video device, the current
implementation queries the log status for all connected subdevices in the
media pipeline.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6412a00be8ea..946704458fee 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -377,6 +377,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
+static int ti_csi2rx_log_status(struct file *file, void *fh)
+{
+	struct ti_csi2rx_dev *csi = video_drvdata(file);
+
+	v4l2_device_call_all(&csi->v4l2_dev, 0, core, log_status);
+
+	return 0;
+}
+
 static const struct v4l2_ioctl_ops csi_ioctl_ops = {
 	.vidioc_querycap      = ti_csi2rx_querycap,
 	.vidioc_enum_fmt_vid_cap = ti_csi2rx_enum_fmt_vid_cap,
@@ -393,6 +402,7 @@ static const struct v4l2_ioctl_ops csi_ioctl_ops = {
 	.vidioc_expbuf        = vb2_ioctl_expbuf,
 	.vidioc_streamon      = vb2_ioctl_streamon,
 	.vidioc_streamoff     = vb2_ioctl_streamoff,
+	.vidioc_log_status	= ti_csi2rx_log_status,
 };
 
 static const struct v4l2_file_operations csi_fops = {
-- 
2.34.1


