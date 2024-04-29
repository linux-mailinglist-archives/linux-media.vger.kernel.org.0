Return-Path: <linux-media+bounces-10359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF4C8B5DD5
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942D81F21CE8
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4836D823A2;
	Mon, 29 Apr 2024 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ/E4VDK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356EE15E85
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714405031; cv=none; b=i18DX4uZeBV1YagbHogm8nZUd2vBR+FeGR0uxdV39TrxYmHPxshBqEoVA+Td3C/9MRN1wJFaZ7P4b8djVxNGUHUVN2/uZVGmIlbEXaWisWWZyAAAzvIc1KDRZYeETM6sl+3UZYmqWVt771N8Up/i1iAbCdtgH/m9Yxp9W0bKJkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714405031; c=relaxed/simple;
	bh=AcMXVLDvToBGgASy52r5a7SoVGtgAZbXJmqQgkcawA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZhtbwTrPq3tcf9zFWfRNnZoiatsU6aV3E8YYRJ/i6bru4DKt5WDiBw9WXqyPPnFTbQqg9ZrqoHLuLPp8m9OmdRbcmTWnmlVDpWPIvil9NfBmLWqAH4AMoRMS2+KOvWK321S8SdzeKRc+HZhieEg+OaHN1cQuXwYGqCzbqe/zQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQ/E4VDK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714405030; x=1745941030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AcMXVLDvToBGgASy52r5a7SoVGtgAZbXJmqQgkcawA0=;
  b=fQ/E4VDKNkxjgS6SKImYOuulnYCLwNWvIrExEjmy8lnqpBzBW9nI95wn
   DSpbhGQpS7ZrORde5SRwEGqdYUHczYmXDDWHaVSJ8NHMFpndeIaYMERNB
   vTCe6+ZJhfDLMDHBBY5bYP34ItE98HsnqzvBQdX5p/k7Yea/4SJ4qzV43
   ZPwhIfa0c48X2+ykf95EhBY3YgIXGqKooIeyIJxHi/fPybha12xHs/kJl
   SnhmkqSf4ZUUPC4CZNCKua5jlEOZQn807MFnAO41smNogrfjJsK36t2za
   VGiNunNK4JXj5IwWHydR2528UTHe1JgYdITYtqRQuSD/JRgXCtTDT2TEb
   g==;
X-CSE-ConnectionGUID: DyUO3LxVQ7ixSYYB0ucJNw==
X-CSE-MsgGUID: OjB+X1gDRMqH1tfSe370YQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9951159"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9951159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:09 -0700
X-CSE-ConnectionGUID: efkJO5c1Sb2G8VWVnYb0+Q==
X-CSE-MsgGUID: aNyMZlI2R3KhE5V27UoRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30972886"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:08 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E80D811F832;
	Mon, 29 Apr 2024 18:37:04 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 0/4] Use V4L2 mbus config for conveying MEI CSI link frequency
Date: Mon, 29 Apr 2024 18:37:00 +0300
Message-Id: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-common.c    | 23 +++++++-
 include/media/v4l2-common.h              | 14 ++++-
 include/media/v4l2-mediabus.h            |  2 +
 5 files changed, 62 insertions(+), 53 deletions(-)


base-commit: 12e3384b874e9f67c3e98ce501561fe5a54a0add
-- 
2.39.2


