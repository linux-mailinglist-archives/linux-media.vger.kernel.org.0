Return-Path: <linux-media+bounces-54258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LPuGTSdpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:35:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF201EADC6
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6546E304B5E7
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3293845BB;
	Tue,  3 Mar 2026 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxvUVBsO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538A386449
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526878; cv=none; b=uyfDWE77yPkD3Rs1ZfkopfearpcN9kaLZCQfgEFXVJ7R7OsBVxVymiX8SJdtWC5xAXxR5gMkgEDg80opRVFt4+3rkiB16VYYyubZy5Ps2uSirD2NZuVikxGRSQkUZ7Nm+hgPXkvouoWOvjkuc46cdBoOT2vHskGTB8/Fo/K0W4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526878; c=relaxed/simple;
	bh=sTWtD5SzQgvqS78bcuDm/xtsYEq+rjZSm4SHO40tiXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=boGk4M2mrwejDIzpd07Q6mrHb2RPRMiUq+UxuUzges+iJkmVg6S/1D8nAoZjFt8wtP8+JHtzk4+DrnvMm3Zn0PF+YtrOKvTM7Zuotcncg8HJ+zKg3//MsGOvo7Ku0kh409quq1JLMewbGl5CqKe0o/AbbX28Gghk3ATHjY6w2mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxvUVBsO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772526876; x=1804062876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sTWtD5SzQgvqS78bcuDm/xtsYEq+rjZSm4SHO40tiXQ=;
  b=nxvUVBsOnOvD3BX+MUUgTHf00ZNdj994P31IWHxeSyPrSqGDzbm0L7aG
   8JboKc2XlFvhfFPifDUDTB5No+yf38+A3bVd9jKGkhaEAvluPPE9Qmomi
   LiJFX8fg8UH/CHxHAoZfENUwpYft9Ed5e6PfmVUK/ko3/dY6TeQKrZb4K
   /rhQtH5+ofON1rTzsM3hzfCeAt8sQZN0vQY5wq35MwYiX1k0j33ww5JQi
   2JmK+iVkb1/xCkdjWKX13nHmUAYYXR/WT8rdC/iW5vzWUp6LKxMTQoYxb
   Du+YK4jm1AHZf7AKwXnVMhAifcOiQirGZ0lXPQhWyAWhdyddtT7163rn5
   A==;
X-CSE-ConnectionGUID: rUAm4zA0SOeQqL2FC/5Srg==
X-CSE-MsgGUID: k4cSUFMHRQuafze8DkGZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73666472"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73666472"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:34:35 -0800
X-CSE-ConnectionGUID: a3Coc82mTbmMh0gj35teRQ==
X-CSE-MsgGUID: 0kGHl8PKQ12vLMdNT4iW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217168127"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:34:34 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71AA8121D1D;
	Tue, 03 Mar 2026 10:35:01 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vxLDZ-0000000GJAU-0puq;
	Tue, 03 Mar 2026 10:35:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Date: Tue,  3 Mar 2026 10:35:01 +0200
Message-ID: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DFF201EADC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54258-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,tutanota.com:email,linux.intel.com:mid];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Disallow all private IOCTLs. These aren't quite as safe as one could
assume of IOCTL handlers; disable them for now. Instead of removing the
code, return in the beginning of the function if cmd is non-zero in order
to keep static checkers happy.

Reported-by: Soufiane Dani <soufianeda@tutanota.com>
Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
Cc: stable@vger.kernel.org
Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a7f22de1c889..50366bf10f32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1356,6 +1356,10 @@ static int atomisp_s_parm(struct file *file, void *fh,
 static long atomisp_vidioc_default(struct file *file, void *fh,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
+	/* Disable all private IOCTLs for now! */
+	if (cmd)
+		return -EINVAL;
+
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	int err;
-- 
2.47.3


