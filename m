Return-Path: <linux-media+bounces-12430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D09F28D7CFF
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8631C212DF
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483D5535D4;
	Mon,  3 Jun 2024 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYkUeSH/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE51487BF
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401897; cv=none; b=SI1snebbwn6o+8pIt0+c7wtZTIRQLy99VOuGe2Fs3rclIKdMcyURcYFyOpoD1FQSMd3PW9toYp+6sSN9LVfECpPotMEC0ISt/5gG0B5Lvm4wwB3vHC/83XdUXqz5NO/o0xLTYmZd2UQIH86OdyyhM1ALCsLAhE4qjGf2iQxH/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401897; c=relaxed/simple;
	bh=4hB5FsHCXAn5KIhRr2sF5rJyfS4jxlfgGQu1HsprWk8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PSfms0wFAYe9/Rdav1p9NxBWFTu08XxAhBEf7U19xpmkyQQALN/YAuvXIDiBB+jQ2m1DB9eiLRMXyYS0KQcPO1b+xME+JpHGxv0jBsnqnKEMboKxh4Ccm++Fd6mZ+zlTJFtH0po7FyeN7m6puw7oac5gqbXDD9x5t1IKvIy3LNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYkUeSH/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717401896; x=1748937896;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4hB5FsHCXAn5KIhRr2sF5rJyfS4jxlfgGQu1HsprWk8=;
  b=gYkUeSH/QPTJTLGvNjPygW44+zHwW2Zqd3FJA0+mwiXPRYYjQx1djp2n
   LLqGlvJpzSmy6Zm1exEPM7uunqx3ERJnRwc4rBdOqs5fe8plfG7AsVyI+
   yQ0fcylk298JB0CxOPfxZhhR7Os8QJ51zt+chlRb+/Amc3GufOoIcCGPL
   gcQ033E678fnw5wrao2Y4bJcQ6HZqR73bgqPIyyFZesO/4PITOgrH89V8
   KDxFB7xeij9OCKcX6oj+Ah3r3EaC/sYe/Q8IYrcKgoBINoQjK7omx7BHC
   lmHwTxHKVxZnZqr3CHDcKwNsOvcqMfep6v8JMDFQ3rzwGZhUw8zCOf0dR
   A==;
X-CSE-ConnectionGUID: QlXCRXqjSPW5auln+62BMg==
X-CSE-MsgGUID: fT1aIYvfReGKB5lBeDe9hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="39285017"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="39285017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:04:55 -0700
X-CSE-ConnectionGUID: WcDWBTPNT0OcZQbdBLJvsQ==
X-CSE-MsgGUID: gZzQVTzCQCWrFI3+Yx2NtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36721980"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2024 01:04:55 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 0/3] Fix privacy issue for MEI CSI
Date: Mon,  3 Jun 2024 16:26:11 +0800
Message-Id: <20240603082614.1567712-1-wentong.wu@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if starting stream goes with privacy mode on, the whole
pipeline will fail because MEI CSI counts privacy mode on as error.
In face, the ongoing MEI command is well executed by firmware as
well even if privacy mode is turned on. The status (-1) of command
response is just to indicate current privacy on status instead of
failed to execute command by firmware. This patch set changes the
behavior to notify privacy mode on via v4l2 privacy control instead
of fail the ongoing MEI command.

This patch set adds one dedicated lock for v4l2 control handler to
avoid dead locking issue as well. And the useless privacy status in
struct mei_csi is removed to make code clean.

Wentong Wu (3):
  media: ivsc: csi: don't count privacy on as error
  media: ivsc: csi: add separate lock for v4l2 control handler
  media: ivsc: csi: remove privacy status in struct mei_csi

 drivers/media/pci/intel/ivsc/mei_csi.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.34.1


