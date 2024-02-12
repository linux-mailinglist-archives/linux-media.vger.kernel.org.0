Return-Path: <linux-media+bounces-4962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08E850FA0
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68C8EB20D17
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D9310782;
	Mon, 12 Feb 2024 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7WN6GnB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2430EF9F6
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707729564; cv=none; b=D/DtjL3gTSe0VwWxFI1EzsYFKjipXGiyN5niIXa1Fu58R9tP/amDKDCr/5IPdjh+BBLIfIqGsvrc4B6sGHIwY2C5jjDlYh5rzUwRMbg+6L8eyzgDhdsGY1iN1vBCwKkP9/z93sRQfbYacmS27jduJO1AJ4SOkgkyMa964A5nYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707729564; c=relaxed/simple;
	bh=wvwN3WuQP5WQVZzg5lB8/FK706/UMqhpCpgXyryh/a4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y7usHPpLS+lnD+51f1UuTy9BytDsSX7nNcKPaD7f816PcwMjgG2Cgll0UxM1dOZ7lihl/KcKTFhX6v2ghn3+hMrqRM0s3KBLPak3GTLfesRSvDA/nbeLM6VmUD8v9apSJCBRFdCYcUUPsyA0Tdocz1EhO7nU33DiK95bNfmA7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7WN6GnB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707729564; x=1739265564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wvwN3WuQP5WQVZzg5lB8/FK706/UMqhpCpgXyryh/a4=;
  b=g7WN6GnBS7fqqrXmMunAhu/mTeEK6sxN7d02Quf3IGofwX7WfFtn7S4I
   ywmF4olx169l9McgvLTgnMSMt6GIaVP3HWPPYbqL9sdVaIl82rWHC0ZFE
   gHILXuw3BMWCH0QM5+0ZQ/4Rc/cDh5dSDgIMlyYavFV3Q3I2ShAUyhfMt
   eI74UT4uD6rYIol6PkNl6IXh7YXssXLmh0JIn3uKU+HnD2IaIIM9NVjFZ
   S16Wh16qfEEXflz/9is6EsVO/3mJaTMiSFoK+on9yT3k9f0Hec1c9gHNX
   Qy8To5lAG0YbrJyzTKTuxqnAryvwZNtlmEf/aH80U+vbY9QyU1d4Z01aj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5533289"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5533289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2739962"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:19:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BBCF511F86A;
	Mon, 12 Feb 2024 11:19:17 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 0/2] IPU bridge improvements for IPU6
Date: Mon, 12 Feb 2024 11:19:15 +0200
Message-Id: <20240212091917.342715-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are two simple patches, one to add support for ov01a10 in Dell XPS
9315 and improve reliability of driver probing on systems with IVSC.

Sakari Ailus (2):
  media: ipu-bridge: Add ov01a10 in Dell XPS 9315
  media: ipu-bridge: Poll for IVSC CSI device

 drivers/media/pci/intel/ipu-bridge.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

-- 
2.39.2


