Return-Path: <linux-media+bounces-11502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5278C71CF
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58CC8B21C1B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA4B29CF2;
	Thu, 16 May 2024 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrkUdO0S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DE92F3B
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715843115; cv=none; b=rBVXs5G8eUqA6GrIJxw4snLVI5J7CJlZxEny3Xt3ozhL5prG4bi93row1Mk6tcxeOct8tBx7A+Lv/D2ZgcHrUCyV2BAQQOkfmoaelu8HfSkLbBjOztw9o1bS7xlsuK/Nuvr1LDhktd0Zarlbv8+SqshhbCfwxxGRWIbeDhDUmio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715843115; c=relaxed/simple;
	bh=VkNHRlFkkvDvRtDUTb+fXa4spYYCs+N3xnFyQ19I4qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sHQgQNV7IQTVs2G2H9nfbgwzTxi9IloNifdrX6RfkQw+NtcznOJe4Zp74IIJ9C/1UbwtF0dJpmMb3cxgtvAOjcA2iPD/JHciLOrL88NkzWVthTq1ydB4vjtR66pkj8xFitZL6q1EYstReDbOs1bUEvt6MDTtqmuzRntnLpdcwIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrkUdO0S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715843114; x=1747379114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VkNHRlFkkvDvRtDUTb+fXa4spYYCs+N3xnFyQ19I4qo=;
  b=VrkUdO0St7VgvMRXGJOkjhrA2656FHwcRpUL3TMcxqxmgqBEtl7vs6+P
   yegBjTmoi4msBKRdsguvi+uK5wPL7WxFejRtXhgQ0CZQVmozIY7mQRvLh
   3MnkgmVQngrANyl/jRNY8iEeS9Qm9+wJWJndyurx+YipFU97BT9EY2Dp/
   JoFxK28aI3YaTlh6qJyvWfPW8sxvBH/F5I9FJ2mgf1TA18qprY5q8aTlu
   vdWghSn2VPjBlsYDElEnPR7z4Vaey6LI7xQOA8u3EyzEa1fSuOIiTVJcK
   NtaE7lxLzqwrcTvdC6O+Ta4xBwRyhaeAiHtDj8SZN5jiKMB777J43H6fh
   Q==;
X-CSE-ConnectionGUID: H/0QfiAARPSOiS2ktI1CEQ==
X-CSE-MsgGUID: /Fdmo2NtRziBCoQWljykzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12113622"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="12113622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:13 -0700
X-CSE-ConnectionGUID: fK2TZ4DrSNmfcpgQB6lpKg==
X-CSE-MsgGUID: MbJCGzeOQHiKNFsmz4wUAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31894928"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BFD4F11FC04;
	Thu, 16 May 2024 10:05:07 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v5 0/4] Use V4L2 mbus config for conveying MEI CSI link frequency
Date: Thu, 16 May 2024 10:05:03 +0300
Message-Id: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
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

since v4:

- Rework documentation a little.

- Remove wrong alignment change in 2nd patch.

- Move link_freq field after the type field in struct v4l2_mbus_config.

since v3:

- Add back missing ret I accidentally removed rather than moved to the 2nd
  patch.

since v2:

- Switch to V4L2 mbus config for conveying the link frequency.

since v1:

- Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
  re-using V4L2_CID_LINK_FREQ.

Sakari Ailus (4):
  media: v4l: Support passing media pad argument to v4l2_get_link_freq()
  media: v4l: Support obtaining link frequency via get_mbus_config
  media: Documentation: Update link frequency driver documentation
  media: ivsc: csi: Obtain link frequency from the media pad

 Documentation/driver-api/media/tx-rx.rst |  4 ++
 drivers/media/pci/intel/ivsc/mei_csi.c   | 72 ++++++++----------------
 drivers/media/v4l2-core/v4l2-common.c    | 24 +++++++-
 include/media/v4l2-common.h              | 14 ++++-
 include/media/v4l2-mediabus.h            |  2 +
 5 files changed, 63 insertions(+), 53 deletions(-)


base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
-- 
2.39.2


