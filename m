Return-Path: <linux-media+bounces-5116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D11368544DB
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D24EB29308
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1591171E;
	Wed, 14 Feb 2024 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiXjSbaM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C9D26B
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902290; cv=none; b=QDXpiEZpZn0Rb8cyCWIXfyBnmV++GpSXX17Rl8jdOkdfUX3wwBANatQwJg3GLQ9wHNASI3NoyBPrFTpbueiP5tr7q9TKAOC9xHs1MVpeYaU6BqmfDW2rePGHQ8aCEYE9WRmmdtC8W5kttNZeZyE26D7pXPEBOhPt0NH0kWlgRNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902290; c=relaxed/simple;
	bh=asTwWkT19qzIO+GLY2gjRPETbEKwo0bPk159DNkKKmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UdKwYuoPM2Um1DYNUXD6EC0viP0W9w3+dpM/9zyhEthoeJjBMwd5suZvFCiZNeS09a/uQ52ZaebYFlYlhrPp3yxdJd49RI99pb+L1eQsV5huuRGgvMfS7ZtDotIFxN5cwUleP5qUAudKn5MBD28MchEMYIzr5ebbu0srt60qoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiXjSbaM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902288; x=1739438288;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=asTwWkT19qzIO+GLY2gjRPETbEKwo0bPk159DNkKKmU=;
  b=aiXjSbaMagoFkxzKg24Hn8GxqvVxOBjv0CkYfbpqc7mwe+POY+CiOlJN
   g5g0FFB8kf4tvvtsw+zkT5AwDs5RspFbZJ5CQQdqG9IL72XHQIncuM0HB
   uLDIsq7YLMf1Tb8MCPB5W8FnbFb5wf3BYveo86miWluUc6TUcm5bLL+Kt
   WLJuUw07VlUfScZNYg9RVt1rZMhO4IxUS70//uc5zWP48wvkjG9o1d2CT
   CxZBoxhSVZnGC+Yy7PGGx5oZqLK8fqxpEzF7OZn3TkkraaR8vGdtOHA89
   weDL5QJG3AuQ6bJf7s+HQj3BGF6DVkFYnoFuQYojhe+N8obJjU7OgI7R3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2301714"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2301714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935605007"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935605007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:03 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9103111F86A;
	Wed, 14 Feb 2024 11:17:54 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 0/5] IPU bridge improvements for IPU6
Date: Wed, 14 Feb 2024 11:17:49 +0200
Message-Id: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are four simple patches, one to add support for ov01a10 in Dell XPS
9315 and the rest to improve reliability of driver probing on systems with
IVSC.

since v2:

- Remove unused fwnode variable in the 2nd patch.

- Include the IPU 6 PCI ID header patch. This and the MEI CSI patch likely
  are going to be merged with the IPU 6 driver.

since v1:

- Instead of sleeping in IPU6 driver probe, instantiate the software nodes
  via IPU bridge init also from MEI CSI driver.

Sakari Ailus (5):
  media: ipu-bridge: Add ov01a10 in Dell XPS 9315
  media: ipu-bridge: Move graph checking to IPU bridge
  media: ipu-bridge: Serialise calls to IPU bridge init
  media: ipu6: Add PCI device table header
  media: ivsc: csi: Use IPU bridge

 drivers/media/pci/intel/ipu-bridge.c     | 26 ++++++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 31 +++---------------------
 drivers/media/pci/intel/ivsc/mei_csi.c   | 20 +++++++++++++--
 include/media/ipu6-pci-table.h           | 28 +++++++++++++++++++++
 4 files changed, 75 insertions(+), 30 deletions(-)
 create mode 100644 include/media/ipu6-pci-table.h

-- 
2.39.2


