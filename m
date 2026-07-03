Return-Path: <linux-media+bounces-66496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eq9cDSXVR2rcfwAAu9opvQ
	(envelope-from <linux-media+bounces-66496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:28:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C89703DE5
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:28:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nm3RKNWF;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66496-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66496-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C010308175D
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C2D417349;
	Fri,  3 Jul 2026 15:26:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5741736A
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092382; cv=none; b=l/PGpOXviy/MDMmBgwbFt3KckC35fhUnkqY0E66pEjZpPZKKVeFEP1+emL16qluGI7FI/LP2hT04/tw1UpJWWqfXAEDzxOn0ys3HADsg83R1XTT3SvqOhHeFNk6lBDrHf2U1s0A0iudYy6jtz+AkWepy7IfmGocacQd0ECueJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092382; c=relaxed/simple;
	bh=Vt7QDuIHNTfLBQf6xKMD2MnAUVnBPMkEdLjKWFCVdys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUT2q4XN4VAx4xjmqtrQkw86PEEUfhXFRkjZwBfIxtJZClHDif8lESwqz7ICpfkWqXfd+Y1IHkOAW/wl7O13Rsv3M5iOgNWAfyF9hBnP/54tro0XQPwPWlRI4jKy8/9fSNyrHhv+tOrF78K445SbqAjb83ny0YzcVntykRYL7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nm3RKNWF; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092381; x=1814628381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vt7QDuIHNTfLBQf6xKMD2MnAUVnBPMkEdLjKWFCVdys=;
  b=nm3RKNWFKyXDYF6DW2u7olBUaQhhjUsRq2dXauO0CZ7Qe6Fh67Sxs3U5
   OzAdtiGkrmgvRRsJxVwB5s90ose1ySd7ug/587Iai7XSb4dR+dDvLHjNK
   bZTHH2LAefqDVJUjmxDSDLDvb9s7lsiFIekPki6L5J6PAcP2Ry5njK9oa
   HVunIZ13r9maJhXw0cCd37KRxYJwLzt0eISuItMhXFkEBTA8ZTyWIl0gY
   7IC+KDOg3vRUDzP7U5V8lkY2M2nDmrjVjcRXiWLV0R5r1wrdTG1lFH6Mg
   VcPfac/7fkJkPdZwdsQxZxzgXzUZCdApwvrYg9ZGT41Vmj+gM9hwMLtvW
   g==;
X-CSE-ConnectionGUID: HNlxOCjrSAegOkwNyMLEAw==
X-CSE-MsgGUID: CO18ZrWHRH2cnLWUPbbegQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396237"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396237"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:21 -0700
X-CSE-ConnectionGUID: o+QnccqNTwahKALqcaXX7Q==
X-CSE-MsgGUID: 9P5feX1CTS2ptxRk0XluJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799760"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:19 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 30/41] media: ipu6: The SPC init is valid only for ipu6
Date: Fri,  3 Jul 2026 18:24:40 +0300
Message-ID: <20260703152451.1743132-31-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66496-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98C89703DE5

Skip it for ipu7.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index dae6fbb0756a..c7c33a7a4643 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1012,9 +1012,11 @@ int ipu6_isys_fw_open(struct ipu6_isys *isys)
 	if (isys->ref_count++)
 		goto unlock;
 
-	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
-			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
-			   adev->pkg_dir, adev->pkg_dir_dma_addr);
+	if (!pci_match_id(ipu7_ids, adev->isp->pdev))
+		ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
+				   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX,
+				   isys->pdata->base, adev->pkg_dir,
+				   adev->pkg_dir_dma_addr);
 
 	/*
 	 * Buffers could have been left to wrong queue at last closure.
-- 
2.54.0


