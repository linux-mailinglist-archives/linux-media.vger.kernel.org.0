Return-Path: <linux-media+bounces-12075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC48D186E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66DC1C24728
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE08516B734;
	Tue, 28 May 2024 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G25JmaCi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F6517BA2
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716891751; cv=none; b=oixDbHkh+4oWA+sl/2Yls5d3XMec5GUAiZvSO+y5MWH/VpB0XPgHKXy5rXkSgwhuLvF17Sr8dP+h8NAEBNq+IoGQK0OU9JkVhyfGgANpJgjQIaCMqYyOSQcehicKRQwbwaAjS5fVwFFJwqqn0Q3+tuwLifRL+br0VyVtZlk52+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716891751; c=relaxed/simple;
	bh=zbJs/vGTga4FEBDOByZ1q9nMqqEZolbhj14WBatkHYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RULqHz7Zee8GRhExSgirHYN42BujxsyooPY7luOeayp4IaQDnXq9ZeZGV7Wt9XC6ts32OngdCUMQGV6IX4/h9smiJeSbKZ3KRyKrtv1A8YacjORyYIpDTu6eMBRjTXU1X7WqHklnlEjmFdEoTkD+T8ylBRU38KLw500s7TipOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G25JmaCi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716891750; x=1748427750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zbJs/vGTga4FEBDOByZ1q9nMqqEZolbhj14WBatkHYM=;
  b=G25JmaCiPGjocD7lgj0veLFYATDm9Rb+rSGWQW9n85LlfuXt3eLMOtid
   9jQz4KD46IcC9xWUun3zvVvT4amXsn1URyKbk3hZ4RtVgCK5D4x6A0/1p
   iPV8a9GwSRd5VWLNur0fXzrZL9Ttf1Q2lmNyxqLR/1LjdDP99EtJRTryA
   cdyVnpNDUpzG0jLKh/ZnwHhWxrKWbTqA/EPC4xR7YuX6whGdLpOB+1fwX
   HGvEm4JVEBmAD1+fKZoNPdV598WzxRc0X5B4C4oUDdo0YNdEtwZ0rF3um
   oKTrOxu49QiBDQgCzFs0GB93Lb1Xq3zElQNQyls+dNWCcqRS54Qofwn+j
   w==;
X-CSE-ConnectionGUID: 5ZLAR2QeRqO7g0H31fVVdw==
X-CSE-MsgGUID: +UgoJGLISd2m7IYQ5puquw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17061056"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="17061056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 03:22:27 -0700
X-CSE-ConnectionGUID: 4hYNYtkNStS4o7ZtDH+H4g==
X-CSE-MsgGUID: h3+ZMJlIQsSTip8R4eaKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="35525096"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 03:22:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3F2B11FA4A;
	Tue, 28 May 2024 13:22:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sBtyJ-00CCXs-2Z;
	Tue, 28 May 2024 13:22:23 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: wentong.wu@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 0/2] MEI CSI fixes
Date: Tue, 28 May 2024 13:22:11 +0300
Message-Id: <20240528102213.2908148-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

These patches address issues in MEI CSI and IPU bridge integration.

I intend to submit them as fixes soon.

Sakari Ailus (2):
  media: mei: csi: Put the IPU device reference
  media: mei: csi: Warn less verbosely of a missing device fwnode

 drivers/media/pci/intel/ivsc/mei_csi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.39.2


