Return-Path: <linux-media+bounces-10375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9E8B61AF
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 21:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A3251C21562
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 19:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CEB13AA3B;
	Mon, 29 Apr 2024 19:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/4krBFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFEC1E529
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714417739; cv=none; b=pAUFIvvaQt+tM93IbrI1I/HczdJw8rKlm//rWZTOQfmBx9GkW0V6ck9DU/1+V1FNhNz6l/DZFfnanho0e56wT/1kpWKmmOoopWrKS8CpEjnU2ErWDrfHe0FsYwIzIgfH52bsn7BU34cBt4/7G34kNwkfBSWS3jOJAIuP3LjtNDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714417739; c=relaxed/simple;
	bh=t7GKQPSTGyLQsu4YR2RYFWceT2vLFStrJo/sjK2AUG0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZNsjpzfnkpIcn5YpQXVFvFDOCzHIHndtA8zIItkIfWktIb61TOvkhnghwtYUogJBu2IqtFT2EEpZlP4nlrh5xa0sZwwyCYIgQYCTGtSyk5Hd4c2eAzSU0yOEZgWz8VWDtmLhWm8EedKnSV0w5kxVvudREmi2EsmEMdaX7m66QYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/4krBFT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714417737; x=1745953737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t7GKQPSTGyLQsu4YR2RYFWceT2vLFStrJo/sjK2AUG0=;
  b=H/4krBFTkMu4eNax/JR/i5lHw3lWrrH3x1TJ6EfHh2PtSAHdmPwFyJZx
   BpXkiSb9DfwfiKscuQHpoQRs+ZEimEy6S0RFIhqeo1XDDESQmv74CKF/c
   z2+fIIkKrQs1Ou0ymohP5NpUBcc6QGUtYpHModpfpQ6hJr9WU1n7FHmR5
   yp/wqa0gLXXPc0lAq2TMfGb0JNX7yRGirqcdbaXWO+XEbEOq9LeKBRNaR
   QgfcY1yQ9rX7JxcWF9NJaqYIsMpjkzaZvdCow8o9Q5wZ0udPOWfqrWF36
   lGXsWgZVhTCkbCB/jeurOwbnpd4kQrsplG7KZL3any/SKfkGt5ggjXoMs
   w==;
X-CSE-ConnectionGUID: oAwAe3LWSIuKG7g0/lPF8w==
X-CSE-MsgGUID: c5zQ1nrsSeienRe0piXC2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13875320"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="13875320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:08:57 -0700
X-CSE-ConnectionGUID: ujfOwrHbSRm0qdJE14wmnA==
X-CSE-MsgGUID: ZuIwXfnDT3a+zJ4BEDWxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30846307"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:08:56 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B6B5211F832;
	Mon, 29 Apr 2024 22:08:52 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 0/4] Use V4L2 mbus config for conveying MEI CSI link frequency
Date: Mon, 29 Apr 2024 22:08:48 +0300
Message-Id: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set adds a few helpers for obtaining the link frequency from the V4L2
mbus config for devices that don't need to provide an UAPI to change it,
and finally add support for the Intel IVSC CSI device.

since v3:

- Add back missing ret I accidentally removed rather than moved to the 2nd
  patch.

since v2:

- Switch to V4L2 mbus config for conveying the link frequency.

since v1:

- Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
  re-using V4L2_CID_LINK_FREQ.

Sakari Ailus (4):
  media: v4l: Support passing sub-device argument to
    v4l2_get_link_freq()
  media: v4l: Support obtaining link frequency via get_mbus_config
  media: Documentation: Update link frequency driver documentation
  media: ivsc: csi: Obtain link frequency from the media pad

 Documentation/driver-api/media/tx-rx.rst |  4 ++
 drivers/media/pci/intel/ivsc/mei_csi.c   | 72 ++++++++----------------
 drivers/media/v4l2-core/v4l2-common.c    | 24 +++++++-
 include/media/v4l2-common.h              | 14 ++++-
 include/media/v4l2-mediabus.h            |  2 +
 5 files changed, 63 insertions(+), 53 deletions(-)


base-commit: 12e3384b874e9f67c3e98ce501561fe5a54a0add
-- 
2.39.2


