Return-Path: <linux-media+bounces-49702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DFCE978E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B354302E07F
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3CE21254B;
	Tue, 30 Dec 2025 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI9fU37H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E022D9EFF
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091943; cv=none; b=muXNCt1wrPhc61VJ3u5gBiX7CX+oAEVvEv1ClyxleyWeI/g6iDA3LDfKRZDtEvxOdBhdYULMlb84G1pgxrvpGjUozgPIWpIy2RYoUtMJCK6dvzZ640rXevfWGPbmU498GCDVlZFQnVAdC/SzQHvv6bhVjOTTADe/Qs4KssvSKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091943; c=relaxed/simple;
	bh=N9HuvjIeWPiuvupvI6trmKj9RAs4tq8dZ7nZxjPSM8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YchJ6Fg+6399MSTA/9Rdzl0bnkD0HRaWqD+oBn40hO4jJMIC0ETphM4Wu9a7wSk9ZaEMSDbzk6kRVTo9EndoHbzCzi9O3HgVV4+pn7rImorEFMHw07tSg9AAIn7JU1k5KvUFeXN9HLIkkzn2ng5IZUvjlqkSp2P5eylutZip7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI9fU37H; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091942; x=1798627942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N9HuvjIeWPiuvupvI6trmKj9RAs4tq8dZ7nZxjPSM8E=;
  b=PI9fU37HX52aPJ/xo9PBqUybw/Ank9q8HFq3uE22ZpJUYb+nQN88x1bL
   Qhtgd/h2NfyECONZuXolVtyNwtdPttYKaOHH86Hl+Lp8EM6/GXfpAiN0f
   dQR7VlmBQEdBd4C/AqSe666Jj+A0QL7WWevU7X0sMOsBKV1NjtEoSvgpA
   DaKW8dL3Qz0wpPAwIeYsWgzmUWha2ITfP4+SKDE6HEpiuRMwBrPfNhfYN
   iyIiNRoT1JTTClA3KrX35rxT+8ahgXzLfX+o8XWXZeALTxp+ccLf0zEDj
   jiU9HTGEFxZ3l5ql0IWfrlI/+0jM2qSbrL6akDdkUXJCFYqOH7wW18mJn
   w==;
X-CSE-ConnectionGUID: 63JA/hQpREG2pWeg7++rZw==
X-CSE-MsgGUID: FAzR0qlBTAu4faGD+qiQNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148720"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148720"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:17 -0800
X-CSE-ConnectionGUID: PdCop3b3TzCDw9UAlrV6yw==
X-CSE-MsgGUID: qaZhC3AnQf2eloQjNZtwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186899"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7E3C8121D8D;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQXu-0e1A;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 00/13] IPU6 driver cleanups and fixes
Date: Tue, 30 Dec 2025 12:52:09 +0200
Message-ID: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

This small set contains cleanups and fixes for the IPU6 driver. I'm
preparing a larger set of improvements in the IPU6 driver on top of the
metadata series (I'll post an update soonish) so consider this to be
preparation for that.

since v1:

- Fix some intra-set compilation breakage and remove a now-redundant
  variable.

- Fix missing assignment of ret in ipu6_isys_link_fmt_validate() (includes
  a cleanup, too).

Sakari Ailus (13):
  media: ipu6: Ensure stream_mutex is acquired when dealing with node
    list
  media: ipu6: Drop MMU hardware initialisation in probe()
  media: ipu6: Remove redundant driver data checks
  media: ipu6: Make symbols static
  media: ipu6: Remove redundant streaming start via buffer queueing
  media: ipu6: Don't check pipeline in stream_start
  media: ipu6: Close firmware streams on streaming enable failure
  media: ipu6: Drop error argument from ipu6_isys_stream_start()
  media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
  media: ipu6: Obtain unique source pad from remote sub-device
  media: ipu6: Remove source_entity from struct ipu6_isys_stream
  media: ipu6: Drop custom functions to obtain sd state information
  media: ipu6: Always call video_device_pipeline_alloc_start()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 70 +++++++++-------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 --------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 83 ++++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 17 +---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
 8 files changed, 71 insertions(+), 149 deletions(-)

-- 
2.47.3


