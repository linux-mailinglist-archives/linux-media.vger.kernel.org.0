Return-Path: <linux-media+bounces-8628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A099898381
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCE0828FB62
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FA07352F;
	Thu,  4 Apr 2024 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LapAMU1J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BF73186
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220728; cv=none; b=BQCuz8gdd4G+m8WFvnbioCcSC9/BWWyMiBAfvP5aAakhHjGQVSg1ekdakE/4l6kYA7FiKEDotrVye/XyxxG23PtJ9IglfDkZ3ZYsbt2AhDhz/cUDe5RtrNDup+d905AwkbQ5O6dUcGTnOzPoCttAeuE7cTPz0Vd6VNCDNRmsIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220728; c=relaxed/simple;
	bh=p+3l+7ZcKOQO9E+ShdU1NfyVaRVNj4u4GWZPxfccvA4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=fW9gkM1sM5JJM6mr/1pnDo4NI0yUA0LGWK4RCAAOaUbd8M1zDUnNXzKVu+QweiZ6BmdQXi9VcK9X+wngLvmuJmvgPircjKXLbsyJERx2Kl9QYD1tlB6k/jc4oMkYzEaOBr1dln5C1vPldehlthn/iPGjwtUqWtsRwcHv7CRSr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LapAMU1J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712220726; x=1743756726;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p+3l+7ZcKOQO9E+ShdU1NfyVaRVNj4u4GWZPxfccvA4=;
  b=LapAMU1JXG7aRjPU1jz0pxxxOg/MtQdJ49juGzFwoEQB6BFR7mg9cKML
   tN0Kd9w/Lxr5P0rKoGplr5Fzlh8dhneu5Jr0rjkzYgog7NXyTOA9ATCLI
   vA3bZ8eU/Z1FhUuxXR982cChYsnILCRhRwKn5+CjF/+vmFk+xBpLK011q
   N2lH1wxYxQ0lh6WPMrQr9l+yObCQvmt2T1e0LTAgJ3qh4Ndtp0ZyEU5JV
   5mxgCtcxMdpQW0KJQJeKkIWEOE3WZaK43kFH15h5K1BtRAGaEsaF299G2
   DPYiU0eKc/PWDgBa+3dxRIlYp6F57CDikgfgWwnZUvvpQWutPzuua2PFy
   g==;
X-CSE-ConnectionGUID: tp8+rYY7QNe6U883y2p8VQ==
X-CSE-MsgGUID: RdrD+WYUQmupF3+FYVl1ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7658995"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7658995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:49 -0700
X-CSE-ConnectionGUID: SuI8ppS5THeV/K9BO0NYyQ==
X-CSE-MsgGUID: NZ6BQr23RzCyTK7EOHPlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23186562"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B0C7B11F82F
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 11:51:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rsIoz-001hOG-24
	for linux-media@vger.kernel.org;
	Thu, 04 Apr 2024 11:51:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/3] Remove old e-mail addresses
Date: Thu,  4 Apr 2024 11:51:32 +0300
Message-Id: <20240404085135.405104-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set removes inactive e-mail addresses from Intel-contributed drivers.

Sakari Ailus (3):
  media: ipu3-cio2: Update e-mail addresses
  media: dw9714: Update e-mail addresses
  staging: media: ipu3-imgu: Update e-mail addresses

 drivers/media/i2c/dw9714.c               | 6 +++---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 8 ++++----
 drivers/staging/media/ipu3/ipu3.c        | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.39.2


