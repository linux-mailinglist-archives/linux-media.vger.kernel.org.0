Return-Path: <linux-media+bounces-54403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBdZJm5kp2mghAAAu9opvQ
	(envelope-from <linux-media+bounces-54403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:45:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69E1F8214
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8AAD30BF284
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA168383C85;
	Tue,  3 Mar 2026 22:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8xHhWbv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F432359A80
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577890; cv=none; b=AKsgPk3LIMdXg6iG1Axwv9n5aO+2sJIeUXwDPKZFSfpQPQoJfKdW0ksSZRkOConSSqHh8wHbx+TXrgkp9nyUOjsWyzYOLwqI0R9IKcOw74uWBkYV2nKOTbIADnhKJM9f77KaT81yFE0m3xKK+Xqu0V6RVQtxStVksuPYtxvllDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577890; c=relaxed/simple;
	bh=vocxs+BPqLJQE6NcG0LaZ1x2NcKOp7F8SoxvbumZRdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCJmXBF6eggkEmiG9XhXtvSTQMjiKktxskGGIJBC9mxFJ2W6JTL2anpRNk/x6C0Nx8iom442xyEVdTKpis1Bg4aOxYhDtddAKgtjO+5Kt8ks6oIksAJ5dS2dC4JC7duwwJrUd6gHCPGQ75ujD/f9E9UKQMABvsGR+jJKTw/5UoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8xHhWbv; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb3b3e643dso366940685a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 14:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772577888; x=1773182688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWqHm0lK8kD8q+CNsdN3MvQwv8WuKF8UZ6conx+K6xw=;
        b=k8xHhWbvO3exEq6dWyRZ7DtuKYCkYhTKC6RL4jxk7bMLeXQlWMbAhC0/PC/T0pJ4lO
         HtdbcikhbuRtTh4h/ffSgeN7z1tZ65G7/oHoradmyLZ4ZwgzqkDh6z7tZHaU11VQflCr
         9hEFoZSqFQ1+gpzuy+uQt4B7Rh/nbUyZqOIU0u9PMG4Is/jXrR/XI4gaXKVmKShQQXnF
         Y0usBZtYUvj8J8QUVXKSN37MAOusBsp7ZNPx94QbMfRRQHo+/VnND2ArJH0bKD+VcVbx
         DVNxAdwV0vVRetu626NmtLgFkIqgFWRNw0qM/OcI6im48fXcEPNGNeC0UCmoaSSgKcl0
         JFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577888; x=1773182688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWqHm0lK8kD8q+CNsdN3MvQwv8WuKF8UZ6conx+K6xw=;
        b=t9GNpQXfN3dGZgBMye3wYdm6MqBO2TkOlJCd2fmu+DNuapGEBpysZijce9P/1f52jn
         FE+2lDkSLvBoCuPnV2kfFYrMRdn6a4rXGID3JY/LOjyk5Twnyyy5Z5F/SISzvS0JIm0/
         TyA7y4vdhgb0ZwVwXUcAdUeEdpNvcBx7AC4McjFrQyfhfk3vcEfMvhRdzBgdrWpSxEhl
         p4R7tYE7di1Cfeis+Ye8VbIMcj/a/fBV54s8NmLYW5Q2J48TStwsxugO6eRdBvP1kjWr
         zlMofBSOmi3ZBxOxRpbUhNb821i4PE3u9DQFIsKRnCS6qn5rApGEFiS7pYs1kuMoywTd
         9FpQ==
X-Gm-Message-State: AOJu0YyrQ7RPxxj/HJkcfOLdsTW+Rqvhpsg+FjxABnzqRuBzV4HXFsba
	fl7uZkVweVj9y2f2MyK+xDeaeqisehWPWh1ktyB1di3iIfvlPFvp3vvwzVSrRSqJDJQ=
X-Gm-Gg: ATEYQzycn9NPanYX5+NL6OQPUicuA9Xw3mj+us3PNf8i/QM6RjJEguA38AnkNjAG9n4
	dIH1WLZxd8rVTnHye+BM+nsUZWo9iUO6sUoF5asuyydVXxB5OcRhKSJIB4w8EcBYP2I6ynG7xsH
	Ka9AHmpOXv1c65k90dsQyUnCMivgCGpPrgltWaM3GeHkw25iLLjtcA4NJxNKbR5vFgFAv0kkiec
	IeHn/dIATwh+S/7DmUF+uqTLUk4Q32ylZP6QMTye8fOu/5vSvpqB6vFckrH9AdIVRoXm8/FLS+b
	dVJNgyEfq/V7iIM8Jsk/e35co7vqoqtCFDcInqVCWBZP9xm/cdf4OXtCl7/6/yFX5d7GO7Wa6lW
	BbP9UzQLerGWW8ajFaI9NjQH9hFjdVxay4O2yzHdZme/qVYypFqYaH68tRioyJ/8SDDpl6NXmyF
	Dy01MGzrhYd1NqJzgFnkAQs2CSqGUUfKnrdFlTktZiI0NJoR5qEgFCrWfWymfx9C4vJLvaS4X0
X-Received: by 2002:a05:620a:4481:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cd5adb8d1cmr12815285a.0.1772577887713;
        Tue, 03 Mar 2026 14:44:47 -0800 (PST)
Received: from hp-strix-cachyos.localdomain ([174.95.22.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899fc21676fsm54778816d6.22.2026.03.03.14.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:44:47 -0800 (PST)
From: Kinn Coelho Juliao <kinncj@gmail.com>
To: linux-media@vger.kernel.org
Cc: Bin.Du@amd.com,
	pratap.nirujogi@amd.com,
	mario.limonciello@amd.com,
	sultan@kerneltoast.com,
	linux-kernel@vger.kernel.org,
	Kinn Coelho Juliao <kinncj@gmail.com>
Subject: [PATCH] media: amd: isp4: add system suspend/resume support
Date: Tue,  3 Mar 2026 17:44:33 -0500
Message-ID: <20260303224433.87242-1-kinncj@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302073020.148277-1-Bin.Du@amd.com>
References: <20260302073020.148277-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3F69E1F8214
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,kerneltoast.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54403-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kinncj@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The ISP4 capture platform driver currently has no dev_pm_ops. When the
driver is loaded during a session, the ISP hardware is left in an active
state on s2idle suspend, causing the system to hang and requiring a hard
power-off.

Add suspend and resume callbacks that properly tear down the ISP firmware
and hardware state before sleep via isp4sd_pwroff_and_deinit(). On
resume, the device is marked so that userspace re-opens the camera,
which triggers isp4sd_pwron_and_init() to reinitialize the hardware.

Tested on HP ZBook Ultra G1a (AMD Ryzen AI MAX+ PRO 395, Strix Halo)
with CachyOS kernel 6.19.5 — multiple suspend/resume cycles with the
camera active before suspend complete successfully.

Signed-off-by: Kinn Coelho Juliao <kinncj@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4.c | 48 ++++++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index bf6b8e2..3e2c3bc 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/irq.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/vmalloc.h>
 #include <media/v4l2-ioctl.h>
@@ -221,11 +222,58 @@ static void isp4_capture_remove(struct platform_device *pdev)
 	media_device_cleanup(&isp_dev->mdev);
 }
 
+static int isp4_capture_suspend(struct device *dev)
+{
+	struct isp4_device *isp_dev = dev_get_drvdata(dev);
+	struct isp4_subdev *isp_subdev;
+	struct isp4_interface *ispif;
+	int ret;
+
+	if (!isp_dev)
+		return 0;
+
+	isp_subdev = &isp_dev->isp_subdev;
+	ispif = &isp_subdev->ispif;
+
+	if (ispif->status == ISP4IF_STATUS_PWR_OFF)
+		return 0;
+
+	dev_info(dev, "tearing down fw and hw state for suspend\n");
+
+	ret = isp4sd_pwroff_and_deinit(&isp_subdev->sdev);
+	if (ret)
+		dev_err(dev, "suspend teardown failed: %d\n", ret);
+
+	isp_dev->was_powered_before_suspend = true;
+
+	return 0;
+}
+
+static int isp4_capture_resume(struct device *dev)
+{
+	struct isp4_device *isp_dev = dev_get_drvdata(dev);
+
+	if (!isp_dev)
+		return 0;
+
+	if (isp_dev->was_powered_before_suspend) {
+		dev_info(dev, "ISP was active before suspend, camera must be reopened\n");
+		isp_dev->was_powered_before_suspend = false;
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(isp4_capture_pm_ops,
+				isp4_capture_suspend,
+				isp4_capture_resume);
+
 static struct platform_driver isp4_capture_drv = {
 	.probe = isp4_capture_probe,
 	.remove = isp4_capture_remove,
 	.driver = {
 		.name = ISP4_DRV_NAME,
+		.pm = pm_sleep_ptr(&isp4_capture_pm_ops),
 	}
 };
 
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
index 2db6683..f39be96 100644
--- a/drivers/media/platform/amd/isp4/isp4.h
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -13,6 +13,7 @@ struct isp4_device {
 	struct v4l2_device v4l2_dev;
 	struct isp4_subdev isp_subdev;
 	struct media_device mdev;
+	bool was_powered_before_suspend;
 };
 
 void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable);
-- 
2.53.0


