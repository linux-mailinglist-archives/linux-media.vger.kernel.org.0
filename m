Return-Path: <linux-media+bounces-66506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N0lsBl7VR2rxfwAAu9opvQ
	(envelope-from <linux-media+bounces-66506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:29:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B5703E15
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dw0iLpvV;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66506-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66506-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E52F1302C351
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BAE41735D;
	Fri,  3 Jul 2026 15:26:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFE417365
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092405; cv=none; b=RN1vJ2LGytkb2PHDeOBN4rjJlf7R83HDs5UyF5NgV01Pi0RYX/7v4EXxky9DgMvSXitsgtwU1TqE10UFenCS+CqgYA50uDRL7BxQJtm6BjjZ5tdBsEvbDWKsCSd7x2PfI3qwcx0q+Cy+0cRXJ/BjH9L7hQxvGh0tgtVP66yWWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092405; c=relaxed/simple;
	bh=Aah7KHJjGBNSAYToVDD0IHZRHgMFefr2iT0Ky7mrA9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0QNm7RAJCr06xZveHbShuxu/jS+FF43L9/y9o+2lcFxmrI4d/eTWIBgvpoayBbxQ7BHF2tDXgvjxRnKC4gCv5XyT7rOiwHSowC65An8tvBAwkkvnYeFz6JMgD/AbMQsH9PgiiWlXWDQ79xesAGJI+7++1UsSOcOEyN9MrMoWbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dw0iLpvV; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092404; x=1814628404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aah7KHJjGBNSAYToVDD0IHZRHgMFefr2iT0Ky7mrA9c=;
  b=dw0iLpvVNPhn744WeKQI0dR4HBEc25aOauTPYLB667HujVB3vYozJpVc
   MhEZFnx+HBUkdZoqmRNsTDysa+FFR7n3tqRdvQLoxor4CYGgzsKjqi7Mm
   SQr+OyDrISyG6Xvon2EESA4iu/eNQPs3czpuFsh7Xw+IcD+Ogv3ba+5dS
   5sM4p1Sdjw27EhuiNa6JSVNr1Am2v1pE0w8cy3JzTXvHp3WV3Uuxf4JA4
   44ulGP0rKxr/gEWfoFNQI10AT++3byFbKyX9Ojz9J4KUF/20ANPg/L1Fk
   TpizZ9KY0CimgwsELtwwZtzLgoV3YRcPjw4hO/xDMAs/1tOE6gXaLOHI7
   w==;
X-CSE-ConnectionGUID: Y78b8JpeQjyDKKmcrALnmA==
X-CSE-MsgGUID: XQ3lg2pvSjGNwG9mK7pcnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396287"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:44 -0700
X-CSE-ConnectionGUID: QBeWEafzQQqx68UGBPIOhg==
X-CSE-MsgGUID: vIWm4YDRRpmT1q5BiGRecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799858"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:42 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 40/41] media: ipu6: Set ipu7 as supported for ipu6 driver
Date: Fri,  3 Jul 2026 18:24:50 +0300
Message-ID: <20260703152451.1743132-41-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66506-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 944B5703E15

Set ipu7 as valid device for ipu6 driver too.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 27 +++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index eed856a771fe..3ea5a34c4304 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -116,6 +116,28 @@ static const struct ipu6_buttress_ctrl ipu6_psys_buttress_ctrl = {
 	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
 };
 
+static const struct ipu6_buttress_ctrl ipu7_isys_buttress_ctrl = {
+	.subsys_id = IPU_ISYS,
+	.ratio = IPU7_IS_FREQ_CTL_DEFAULT_RATIO,
+	.qos_floor = 0,
+	.freq_ctl = IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ,
+	.pwr_sts_shift = IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
+	.pwr_sts_mask = IPU7_BUTTRESS_PWR_STATE_IS_PWR_MASK,
+	.pwr_sts_on = IPU6_BUTTRESS_PWR_STATE_UP_DONE,
+	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
+};
+
+static const struct ipu6_buttress_ctrl ipu7_psys_buttress_ctrl = {
+	.subsys_id = IPU_PSYS,
+	.ratio = IPU7_PS_FREQ_CTL_DEFAULT_RATIO,
+	.qos_floor = 0,
+	.freq_ctl = IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ,
+	.pwr_sts_shift = IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
+	.pwr_sts_mask = IPU7_BUTTRESS_PWR_STATE_PS_PWR_MASK,
+	.pwr_sts_on = IPU6_BUTTRESS_PWR_STATE_UP_DONE,
+	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
+};
+
 static void
 ipu6_pkg_dir_configure_spc(struct ipu6_device *isp,
 			   const struct ipu6_hw_variants *hw_variant,
@@ -565,6 +587,11 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_IPU6EP_MTL:
 		isp->cpd_fw_name = IPU6EPMTL_FIRMWARE_NAME;
 		break;
+	case PCI_DEVICE_ID_INTEL_IPU7_MTL:
+		isp->cpd_fw_name = IPU7_FIRMWARE_NAME;
+		isys_ctrl = &ipu7_isys_buttress_ctrl;
+		psys_ctrl = &ipu7_psys_buttress_ctrl;
+		break;
 	default:
 		return dev_err_probe(dev, -ENODEV,
 				     "Unsupported IPU6 device %x\n",
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 18841141a120..34a477cbca68 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -25,6 +25,8 @@ struct ipu6_bus_device;
 #define IPU6_FIRMWARE_NAME		"intel/ipu/ipu6_fw.bin"
 #define IPU6EPMTL_FIRMWARE_NAME		"intel/ipu/ipu6epmtl_fw.bin"
 #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
+#define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
+#define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
 
 static const struct pci_device_id ipu6se_ids[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE), },
-- 
2.54.0


