Return-Path: <linux-media+bounces-49143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA2CCF3DD
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FBF4301D599
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC712F656E;
	Fri, 19 Dec 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvWLcUzQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9752F3C1F
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138319; cv=none; b=B+pl56Zf/Zzd+H02SulaDgDQ5qIEK316dzvRiAa0twTdxu7zsN3apCta/OzFy5sKG2Maqo+CynPiDoABV4DFIjVqY3QJhRDDukn96tEjY3zkpfHwq6VJan1EtahhFuwQhw1dNKsijyaOYF43LV4gM+Za3MWbusAf9GvxnAqGnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138319; c=relaxed/simple;
	bh=QjvX8NaoKhy2vx8amYRmyPQxQ12BXHwIHLuznRfYKZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtFOyLkmI3Tv2orgaD+eF+UwWUJo9zNUD/BeV+HtRHIXUOg2pnVVDttj7fdktmI+SjM9jPuu+lmc8BJIrPy7J5kqcTiFwbNJgH9SVZbUZti2L86je+ctYlEHoZEW7U9TdpUS/uioXVth1nbQKGYgX8deUA4Fgv23kl/scYo+rRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvWLcUzQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138317; x=1797674317;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QjvX8NaoKhy2vx8amYRmyPQxQ12BXHwIHLuznRfYKZo=;
  b=OvWLcUzQN6sm5J/wavIL4yiuWuMKMWgUYywjm2fNH4WQSNYTFy/oKsjQ
   Vrck0svs2MBmh5FqF/1333SXXDoYwKkOrjSz3qbp8WCLpFKe8GtSF0UUX
   HOlMVAKXPTf1nNLsYKOf5KxkVMGKTInUnkWEPk9J0Bye1pPslXnl9For7
   1vzDzUqRsB8GJr96lkikpLe59aPteS/ftc+BhiXP/eE2BUttDsMCmmpv2
   XzoMZE1miUii/WzCMRdv720iJxLKgkL95+9a4zo22UlWvI5cb2a5oTPkn
   PTTv/lZOvVW4dETr4nrglpM8umgsFvJmcdGI7hxa89Bd/ACXz0G+h7Dz9
   A==;
X-CSE-ConnectionGUID: akISF/N7Qwudzgx4iMchWA==
X-CSE-MsgGUID: 8EW23oGoT4iuutA2rkj+qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945155"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:34 -0800
X-CSE-ConnectionGUID: vY4r5hvgRuqV87EeCxXHWQ==
X-CSE-MsgGUID: Sba+VkqwTAGrZaV08shNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973369"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:33 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F27CB121D93;
	Fri, 19 Dec 2025 11:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRN-2VzH;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 00/13] IPU6 driver cleanups and fixes
Date: Fri, 19 Dec 2025 11:58:16 +0200
Message-ID: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
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
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 61 ++++++++------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 --------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 82 ++++++-------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 17 +---
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
 8 files changed, 66 insertions(+), 144 deletions(-)

-- 
2.47.3


