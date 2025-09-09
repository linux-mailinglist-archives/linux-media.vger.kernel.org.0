Return-Path: <linux-media+bounces-42051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD39B49FED
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 05:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D721B24364
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 03:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9040D26F280;
	Tue,  9 Sep 2025 03:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5CzIOOR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3782D515;
	Tue,  9 Sep 2025 03:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757388114; cv=none; b=MCohgG1vQcSOuLfwggT4ob4gEaDuq4Beer0X5D5iiwbGOkWlGUuyIntFEziEI4Yi4mZug5IxQNlUQOvJhjb86vjYgtR6g9XXmHLQ+2aTf+uOHdJ9tfGLzN1lmLeYTUvdYGGga+nSYexZ3FgMMLarv9GYGpsfmKucqu0YrWQqLiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757388114; c=relaxed/simple;
	bh=vnzfxFj2O/5YxWypX4/WDVz9mxhboZuyTOkVwJBP5CU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XeTi6mEPfbeN6gGrjE6FqgKDrV+CXNpp8LqYmk2PXm33VgINmguwjZ9cCWobOPwdPGTiQKiDuwaTxXWh2/X4FXsC2WNIPsWez9q0nbX1WR9BqlN6odnZmXB6W2gYAoDtTbrnUN/VQWhi1tDlBFD9ctrMuKG+IHH3Ok5+66YwJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5CzIOOR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757388112; x=1788924112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vnzfxFj2O/5YxWypX4/WDVz9mxhboZuyTOkVwJBP5CU=;
  b=b5CzIOORFuw/CYEJvqPElyKZDICzosYssB0zMWQfWqr/uOuBXxKJ9VOO
   2pCutAJFEnw5JG4pi0xNFcsbjmQQGKDycknA0VYPg/Vc+8DmEEy23sGoR
   dVKO6ceboqKmlpCiYwLcXBLE3wZUsbrvWxdIYI8S4l0b0gDdo/ICpp/AE
   h6IwQKnAQYZafJEoqVctCQY8G8OBEUgDgiMrN58mv0nK2C1g5SkMTVPka
   ejNdn728ZjTpPYrM1eNOhh6mEc82Q8KWDXodPtGcHlg+e1+yXkNaO3cRn
   ATQzXN1V2dqb7eMq5ojIb5SOfF25Ho7KiZJCzD3khLYEBbmI3A4eQ/yek
   A==;
X-CSE-ConnectionGUID: MZ6e//mUTE2jt7IK5ev/Kg==
X-CSE-MsgGUID: CX4ol2MiSRGnUf0EYxnFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="77274616"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="77274616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 20:21:51 -0700
X-CSE-ConnectionGUID: Tl6XxJ5JQ8OW4R4HrzpUfQ==
X-CSE-MsgGUID: 2Bx0iFD4Qtm7q0K1nIhGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172898402"
Received: from vtg-chrome.bj.intel.com ([10.240.202.157])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2025 20:21:49 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com,
	hans@jjverkuil.nl,
	stable@vger.kernel.org,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging/ipu7: fix isys device runtime PM usage in firmware closing
Date: Tue,  9 Sep 2025 11:21:48 +0800
Message-Id: <20250909032148.2019162-1-bingbu.cao@intel.com>
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


