Return-Path: <linux-media+bounces-42058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB71B4A1B3
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8394B4E5264
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 06:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFBD2F3616;
	Tue,  9 Sep 2025 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU+gkdG8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FB1C683;
	Tue,  9 Sep 2025 06:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397719; cv=none; b=KjrZKUJ5ajP4Q8t7SuihQtcrkReUbEz3mxzUYV7Iq7esxVTn0UvNRH3VJHmXbiP2EosbDkuRkZJKragxAOyHMShpH+/i5yYhpZOqZrHPZ6jcfFCh8kMGtbyr3i0CI2h7b2gj4dkPKedT2mClf9daOCoLpjQOVkPAB/qnFf7kMMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397719; c=relaxed/simple;
	bh=XqgrlkpvzP3NmYxyJ+lK3TRI0gFL3HLG7zPWY0XiWCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bRcRhmJVxHMeLAzsin2+cKCcbQqTWgoNveBbMQfpZgvznahL7r7/KaH+iWPlX8UclXIiyQRKZ8oOBVXePRRFfZT1OOPJz9c3LEh5/IOMefqmINM/crImfx/hFBPrq9Egn5c+8OUeccBGjsijhM5jPAmYBM/NTquvO2tCq+L4NwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU+gkdG8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757397718; x=1788933718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XqgrlkpvzP3NmYxyJ+lK3TRI0gFL3HLG7zPWY0XiWCk=;
  b=fU+gkdG8xmySbjLV4Pu6VYruwvu3XJvfSpJCtHUYet83v65QxC2TdMrc
   t+Gv8yO5vP+VQzKDh/OIIXzy4kAUIbPFDv3g+kDOx9dzfoLOHxasqqVGk
   jUY5fhgLgJvvQAOivXRrgBzCm/+oakQeNghdNsf2t5HMe6gJ8+TUjNSlG
   FrFJmvQgsDISoV7lrenZBSvfmAF3k+9rsBPB4ajgEuUK0jtzCggU9QYmC
   YQkZNhwKWUJNx7Ds3bjEi4+6bmDd3B3ujlHGiNESFg56E0B3Nmyjr7A+p
   n+2tj7sFnaibdxQMnoFFLSRZFYiGr4Qadv/sefqBPLfmVOieOjbomkK1q
   A==;
X-CSE-ConnectionGUID: OW0vZVI/QV679nleMgHyYw==
X-CSE-MsgGUID: QmaXbGPWR9m848pF38/EBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="69925478"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="69925478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 23:01:57 -0700
X-CSE-ConnectionGUID: lwaoXzlLRmatLizHI3skoQ==
X-CSE-MsgGUID: 0kU9zhrZRD2C7Nzfvl0XAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172920234"
Received: from vtg-chrome.bj.intel.com ([10.240.202.157])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2025 23:01:54 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com,
	hans@jjverkuil.nl,
	stable@vger.kernel.org,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: staging/ipu7: fix isys device runtime PM usage in firmware closing
Date: Tue,  9 Sep 2025 14:01:53 +0800
Message-Id: <20250909060153.2502429-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The PM usage counter of isys was bumped up when start camera stream
(opening firmware) but it was not dropped after stream stop(closing
firmware), it forbids system fail to suspend due to the wrong PM state
of ISYS. This patch drop the PM usage counter in firmware close to fix
it.

Cc: Stable@vger.kernel.org
Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8756da3a8fb0..173afd405d9b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -946,6 +946,7 @@ void ipu7_isys_fw_close(struct ipu7_isys *isys)
 		ipu7_fw_isys_close(isys);
 
 	mutex_unlock(&isys->mutex);
+	pm_runtime_put(&isys->adev->auxdev.dev);
 }
 
 int ipu7_isys_setup_video(struct ipu7_isys_video *av,
-- 
2.34.1


