Return-Path: <linux-media+bounces-58408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFaHNeMJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FFD3CF62A
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55185307B4DD
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF0133CEA2;
	Thu,  9 Apr 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLtfJugi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657A33ADA3
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765725; cv=none; b=f5/IGYZpEjIXlJK8b8PPzmnba0TqDZh7Emy41NTsYHm1LDzSS49xj8tqIUzTT9XgsE4YFceY0NXGDGzxQfnVZO+Q4CcTJpMnArqgJ9e0WvmaQsoNPVlONjHsaq8H1H40SJh6iH7SMWc+Zogrm0HEH6HxvGPTTY+jgU5dq1AsfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765725; c=relaxed/simple;
	bh=2ExQXRnvQZsyJFflhQgvW1ARsEn1H5U89OrQunCpVhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQ8WM2RSgF5it5vt6kAke0kOO9/BSRTkKPAklxDDDJu9v1+OsC0R/y5qqzogub1rcaVCL5p6vhHkraOV3ZSBQ+bdQ+98bj0V0dRJZOSNBApzs9SxOXx74f17bU+ckZ4N/lt7HPR2nA6XWtWcG21+Ug297gvq40A0YetS6LgK9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLtfJugi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765724; x=1807301724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ExQXRnvQZsyJFflhQgvW1ARsEn1H5U89OrQunCpVhI=;
  b=HLtfJugi56Bfki76MHIBrYNaqd4HOrwXEJXnClDqrjuv9umwllFXuOmv
   YmrX9c7rEGw5JMd4gfVNSttmg/SAUQfRz40EMpLw31TW6iqh9LIxTHDHX
   qxtMm+zq8F2k+nkO4ljCQCqnpAaojwuZHTqs1Mt/FWUKzgp7L7C45PQQ4
   x7qRhKWG9U9qhKfbPyb5acpWYOA+3eHpO9ClQ4yzN8IgeOWN+8yMc3L3Z
   P3wmNzxyKCcMiMlHRoGdKOPx+THkXYvrR57z7b9XfvST3w3spsPaE32wr
   FHxdsidUNO8buS0LwjTu5dBto2W7UKMFdTYcJdHTXdi00HBqPK+j9JDxs
   Q==;
X-CSE-ConnectionGUID: jBXk0HetT0aX41u9+Rhw4g==
X-CSE-MsgGUID: J1nGUZx4R1i40llK+YNJYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408956"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: H4BrPqltRm6EreANND+K+w==
X-CSE-MsgGUID: doo9sh2RS8iGY4wFM8qxHw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7DF15122140;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qh-440o;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 85/86] media: ipu6: Don't track power status, rely on runtime PM
Date: Thu,  9 Apr 2026 23:15:00 +0300
Message-ID: <20260409201501.975242-86-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58408-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59FFD3CF62A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rely on runtime PM suspending and resuming the device and so remove
tracking of power state. Also remove the power_lock spinlock that
serialised firmware initialisation and cleanup with the ISR. This is no
longer necessary as the ISR now runs when the device is in RPM_ACTIVE
state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c |  5 ----
 drivers/media/pci/intel/ipu6/ipu6-isys.c    | 31 ++++-----------------
 drivers/media/pci/intel/ipu6/ipu6-isys.h    |  5 ----
 3 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 62ed92ff1d30..e239905f899c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -137,7 +137,6 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	int retry = IPU6_ISYS_CLOSE_RETRY;
-	unsigned long flags;
 	void *fwcom;
 	int ret;
 
@@ -147,11 +146,9 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 	 * to SP icache.
 	 * spinlock to wait the interrupt handler to be finished
 	 */
-	spin_lock_irqsave(&isys->power_lock, flags);
 	ret = ipu6_fw_com_close(isys->fwcom);
 	fwcom = isys->fwcom;
 	isys->fwcom = NULL;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
 	if (ret)
 		dev_err(dev, "Device close failure: %d\n", ret);
 
@@ -164,9 +161,7 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 
 	if (ret) {
 		dev_err(dev, "Device release time out %d\n", ret);
-		spin_lock_irqsave(&isys->power_lock, flags);
 		isys->fwcom = fwcom;
-		spin_unlock_irqrestore(&isys->power_lock, flags);
 	}
 
 	return ret;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8258a6dbf43c..eac0d696754c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -345,12 +345,11 @@ static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
 	void __iomem *base = isys->pdata->base;
 	u32 status_sw, status_csi;
 	u32 ctrl0_status, ctrl0_clear;
+	int pm_status;
 
-	spin_lock(&isys->power_lock);
-	if (!isys->power) {
-		spin_unlock(&isys->power_lock);
-		return IRQ_NONE;
-	}
+	pm_status = pm_runtime_get_if_active(&adev->auxdev.dev);
+	if (!pm_status)
+		return 0;
 
 	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
 	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
@@ -395,7 +394,8 @@ static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
 
 	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
 
-	spin_unlock(&isys->power_lock);
+	if (pm_status > 0)
+		pm_runtime_put(&adev->auxdev.dev);
 
 	return IRQ_HANDLED;
 }
@@ -801,7 +801,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
 	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
 	struct ipu6_device *isp = adev->isp;
-	unsigned long flags;
 	int ret;
 
 	ret = ipu6_mmu_hw_init(adev->mmu);
@@ -814,10 +813,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	if (ret)
 		goto err_mmu_hw_cleanup;
 
-	spin_lock_irqsave(&isys->power_lock, flags);
-	isys->power = 1;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
-
 	isys_setup_hw(isys);
 
 	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
@@ -845,10 +840,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	if (!ret)
 		return 0;
 
-	spin_lock_irqsave(&isys->power_lock, flags);
-	isys->power = 0;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
-
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -864,7 +855,6 @@ static int isys_runtime_pm_suspend(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
-	unsigned long flags;
 	int ret = 0;
 
 	ipu6_fw_isys_close(isys);
@@ -873,10 +863,6 @@ static int isys_runtime_pm_suspend(struct device *dev)
 		ret = -EIO;
 	}
 
-	spin_lock_irqsave(&isys->power_lock, flags);
-	isys->power = 0;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
-
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -1053,8 +1039,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
 
 	spin_lock_init(&isys->streams_lock);
-	spin_lock_init(&isys->power_lock);
-	isys->power = 0;
 	isys->phy_termcal_val = 0;
 
 	mutex_init(&isys->mutex);
@@ -1189,9 +1173,6 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 	u32 index;
 	u64 ts;
 
-	if (!isys->fwcom)
-		return 1;
-
 	resp = ipu6_fw_isys_get_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
 	if (!resp)
 		return 1;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index c8f9059bc83e..8755d80e8fcf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -77,9 +77,6 @@ struct sensor_async_sd {
  * @media_dev: Media device
  * @v4l2_dev: V4L2 device
  * @adev: ISYS bus device
- * @power: Is ISYS powered on or not?
- * @isr_bits: Which bits does the ISR handle?
- * @power_lock: Serialise access to power (power state in general)
  * @csi2_rx_ctrl_cached: cached shared value between all CSI2 receivers
  * @streams_lock: serialise access to streams
  * @streams: streams per firmware stream ID
@@ -97,8 +94,6 @@ struct ipu6_isys {
 	struct v4l2_device v4l2_dev;
 	struct ipu6_bus_device *adev;
 
-	int power;
-	spinlock_t power_lock;
 	u32 isr_csi2_bits;
 	u32 csi2_rx_ctrl_cached;
 	spinlock_t streams_lock;
-- 
2.47.3


