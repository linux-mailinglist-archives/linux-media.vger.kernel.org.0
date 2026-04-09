Return-Path: <linux-media+bounces-58401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MhEE7IJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3A3CF5D1
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5058C30658B6
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3842339B2D;
	Thu,  9 Apr 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShDrlx7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08232BF42
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765720; cv=none; b=p2i5c2bQNUvu/Ft/9cA5feui5Wzbm7maBFgAjHLiit2Ne9CZ0IeYtUX1/c9cGQsbwDCLc1Y1rzjsiGRj6x4FMW7ridBPb5oaaiVuSsH08VJcJPqbsm2Nd1y7sgmIh0XarGlTc7ZulEd2hJiRMzC0AVKW+8xOEOVEHyaMQBojWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765720; c=relaxed/simple;
	bh=izs06UqRUZ63jexkcQL3VD5pPq28HeQ5eAnYmDCUQRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqVQptcxAcYSgDKfhdgSJztJ2a4HY2YRCSr0o0wvFNoEUTx+0yJaH4YIePWa9UrT2IkPqULljZGrFFDa2cTN81D8KXPkViz0FwbZbAm+3P/joVw5zjACAj2qPUJqlCZEogXjWQ7KFzmXu1jvHXx4obNz9yUcN6rovYz5w7ghfvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShDrlx7Z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765719; x=1807301719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=izs06UqRUZ63jexkcQL3VD5pPq28HeQ5eAnYmDCUQRE=;
  b=ShDrlx7ZxtG/0nLz+5lEcCWFMnT2fDQA0Fia1GYmXMvKIwAPJZIrYClv
   3NUBIMLm5U2+dcN1PHzCxI6JqzCyD01un2tpDloecPOslCImbx3wIFlQ4
   gTHq/J4Q33/olM6gSt4B7g1XOzY9bWWSt9fbfVtP6v1fHWQRw0VGETkwQ
   cMJdKE40bR4fhraSrIwbENaS0qj+tVM7gBlJ7JRHixK04X8pihqTzUcul
   zT1bmADnEI3tKTiO4fY8y6zhtem59pvUQ+8M8kf2NrqhcyAmr69u8Q/Sz
   S5HPme5BWSuXn8eW9qEVAj+RHYeiTvlL2qEHipDSOOb3DkRxCrFB6yYme
   g==;
X-CSE-ConnectionGUID: WWXxxFUpRiCzGBfzSyWndA==
X-CSE-MsgGUID: 4w2zE7lhRdGpc4ue0RnNWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408844"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:10 -0700
X-CSE-ConnectionGUID: xae8ZQJjQE6u04nYbqJ1NA==
X-CSE-MsgGUID: O1m5MJNkQkmZTXvKRm5jkQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 79BE3122125;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qb-3zlI;
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
Subject: [PATCH v12 84/86] media: ipu6: Move firmware init/cleanup to RPM callbacks
Date: Thu,  9 Apr 2026 23:14:59 +0300
Message-ID: <20260409201501.975242-85-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58401-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3A3A3CF5D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move handling firmware initialisation and cleanup away from the rest of
the driver to the runtime PM callbacks. This simplifies the driver,
including removing the ref_count field in struct ipu6_isys.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 16 +++-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 11 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 73 -------------------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 53 ++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
 5 files changed, 60 insertions(+), 95 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index b1cf2c622b01..1d8f231e3333 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/minmax.h>
+#include <linux/pm_runtime.h>
 #include <linux/sprintf.h>
 #include <linux/string_choices.h>
 
@@ -486,6 +487,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, true))
 		return 0;
 
+	ret = pm_runtime_resume_and_get(sd->dev);
+	if (ret < 0)
+		goto err_del_av;
+
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
@@ -493,12 +498,12 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	ret = v4l2_subdev_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
-		goto err_del_av;
+		goto err_runtime_pm_put;
 
 	ret = ipu6_isys_alloc_start_streams_firmware(csi2, state, &desc);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
-		goto err_del_av;
+		goto err_runtime_pm_put;
 	}
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
@@ -526,8 +531,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streams_firmware(csi2);
 	ipu6_isys_free_streams_firmware(csi2);
 
-err_del_av:
+err_runtime_pm_put:
 	ipu6_isys_csi2_clear_watermark(csi2);
+	pm_runtime_put(sd->dev);
+
+err_del_av:
 	ipu6_isys_csi2_streaming_change(asd, state, pad, false);
 	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
@@ -576,6 +584,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_csi2_clear_watermark(csi2);
 
+	pm_runtime_put(sd->dev);
+
 out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 31df83b9f45f..b21ceb036617 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -572,19 +572,12 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out_pipeline_stop;
 	}
 
-	ret = ipu6_isys_fw_open(av->isys);
-	if (ret)
-		goto out_pipeline_stop;
-
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
-		goto out_fw_close;
+		goto out_pipeline_stop;
 
 	return 0;
 
-out_fw_close:
-	ipu6_isys_fw_close(av->isys);
-
 out_pipeline_stop:
 	ipu6_isys_stream_cleanup(av);
 
@@ -606,8 +599,6 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_stream_cleanup(av);
 
 	return_buffers(aq, VB2_BUF_STATE_ERROR);
-
-	ipu6_isys_fw_close(av->isys);
 }
 
 static unsigned int
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 0c3223c4d019..1e912b12d508 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -930,79 +930,6 @@ static const struct v4l2_file_operations isys_fops = {
 	.release = vb2_fop_release,
 };
 
-int ipu6_isys_fw_open(struct ipu6_isys *isys)
-{
-	struct ipu6_bus_device *adev = isys->adev;
-	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(&adev->auxdev.dev);
-	if (ret < 0)
-		return ret;
-
-	mutex_lock(&isys->mutex);
-
-	if (isys->ref_count++)
-		goto unlock;
-
-	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
-			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
-			   adev->pkg_dir, adev->pkg_dir_dma_addr);
-
-	/*
-	 * Buffers could have been left to wrong queue at last closure.
-	 * Move them now back to empty buffer queue.
-	 */
-	ipu6_cleanup_fw_msg_bufs(isys);
-
-	if (isys->fwcom) {
-		/*
-		 * Something went wrong in previous shutdown. As we are now
-		 * restarting isys we can safely delete old context.
-		 */
-		dev_warn(&adev->auxdev.dev, "clearing old context\n");
-		ipu6_fw_isys_cleanup(isys);
-	}
-
-	ret = ipu6_fw_isys_init(isys, ipdata->num_parallel_streams);
-	if (ret < 0)
-		goto out;
-
-unlock:
-	mutex_unlock(&isys->mutex);
-
-	return 0;
-
-out:
-	isys->ref_count--;
-	mutex_unlock(&isys->mutex);
-	pm_runtime_put(&adev->auxdev.dev);
-
-	return ret;
-}
-
-void ipu6_isys_fw_close(struct ipu6_isys *isys)
-{
-	mutex_lock(&isys->mutex);
-
-	isys->ref_count--;
-	if (!isys->ref_count) {
-		ipu6_fw_isys_close(isys);
-		if (isys->fwcom) {
-			isys->need_reset = true;
-			dev_warn(&isys->adev->auxdev.dev,
-				 "failed to close fw isys\n");
-		}
-	}
-
-	mutex_unlock(&isys->mutex);
-
-	if (isys->need_reset)
-		pm_runtime_put_sync(&isys->adev->auxdev.dev);
-	else
-		pm_runtime_put(&isys->adev->auxdev.dev);
-}
-
 /*
  * Do everything that's needed to initialise things related to video
  * buffer queue, video node, and the related media entity. The caller
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 0c2adfa01034..8258a6dbf43c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -799,6 +799,7 @@ static int isys_runtime_pm_resume(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
 	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
 	struct ipu6_device *isp = adev->isp;
 	unsigned long flags;
 	int ret;
@@ -811,7 +812,7 @@ static int isys_runtime_pm_resume(struct device *dev)
 
 	ret = ipu6_buttress_start_tsc_sync(isp);
 	if (ret)
-		return ret;
+		goto err_mmu_hw_cleanup;
 
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 1;
@@ -821,7 +822,42 @@ static int isys_runtime_pm_resume(struct device *dev)
 
 	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
 
-	return 0;
+	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
+			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
+			   adev->pkg_dir, adev->pkg_dir_dma_addr);
+
+	/*
+	 * Buffers could have been left to wrong queue at last closure.
+	 * Move them now back to empty buffer queue.
+	 */
+	ipu6_cleanup_fw_msg_bufs(isys);
+
+	if (isys->fwcom) {
+		/*
+		 * Something went wrong in previous shutdown. As we are now
+		 * restarting isys we can safely delete old context.
+		 */
+		dev_warn(&adev->auxdev.dev, "clearing old context\n");
+		ipu6_fw_isys_cleanup(isys);
+	}
+
+	ret = ipu6_fw_isys_init(isys, ipdata->num_parallel_streams);
+	if (!ret)
+		return 0;
+
+	spin_lock_irqsave(&isys->power_lock, flags);
+	isys->power = 0;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+
+	isys->phy_termcal_val = 0;
+	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
+
+err_mmu_hw_cleanup:
+	ipu6_mmu_hw_cleanup(adev->mmu);
+
+	return ret;
 }
 
 static int isys_runtime_pm_suspend(struct device *dev)
@@ -829,15 +865,18 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
 	unsigned long flags;
+	int ret = 0;
+
+	ipu6_fw_isys_close(isys);
+	if (isys->fwcom) {
+		dev_warn(&isys->adev->auxdev.dev, "failed to close fw isys\n");
+		ret = -EIO;
+	}
 
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 0;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 
-	mutex_lock(&isys->mutex);
-	isys->need_reset = false;
-	mutex_unlock(&isys->mutex);
-
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -845,7 +884,7 @@ static int isys_runtime_pm_suspend(struct device *dev)
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
 
-	return 0;
+	return ret;
 }
 
 static int isys_suspend(struct device *dev)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 157b27a8eb6d..c8f9059bc83e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -87,7 +87,6 @@ struct sensor_async_sd {
  *         or optional external library private pointer
  * @phy_termcal_val: the termination calibration value, only used for DWC PHY
  * @need_reset: Isys requires d0i0->i3 transition
- * @ref_count: total number of callers fw open
  * @mutex: serialise access isys video open/release related operations
  * @stream_mutex: serialise stream start and stop, queueing requests
  * @pdata: platform data pointer
@@ -111,7 +110,6 @@ struct ipu6_isys {
 	bool icache_prefetch;
 	bool csi2_cse_ipc_not_supported;
 	bool iwake_watermark_enabled;
-	unsigned int ref_count;
 	unsigned int sensor_type;
 
 	struct mutex mutex;
-- 
2.47.3


