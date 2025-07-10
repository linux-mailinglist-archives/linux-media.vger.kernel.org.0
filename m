Return-Path: <linux-media+bounces-37257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AAAFFAE9
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40EE93BBC6B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DACD28981B;
	Thu, 10 Jul 2025 07:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmb0rccu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F9289344
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132730; cv=none; b=SVMEzJYiElferRC5SunkGHRFf3NrLcDVpqKReTm/ACWmKGgha/7ff3IHla+wdgeg+BhRZIvdejF2LR/Td83VOQIhPUnh6STqfzP+Q9g4KO4lXUmPrrULPZ8gkj8LmiugPIKB4/zjoVaP5gCPy/cNqbGs2dEiU8z2isSQK6LYbPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132730; c=relaxed/simple;
	bh=Y2hy6wcKWQmxK8f8qHVGPHWVjcj42/MUdAhEmM5LoZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XhAJF6HccUQ9Oovox6Vo6u7ZfLUCsa6X8KFrPDAHzToFR18nDDU+Pwh7PZCGKrusPfCHlr8kqHS0oNz4rYkxxKp1uYSEYY6tTRf2WPmy/kQ6BHirXkr+Mxp/rgyuXv6yCh2MBXxNmew71PYDYReFdP3OXoGX811zmLUGRLJ9b2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmb0rccu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752132730; x=1783668730;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y2hy6wcKWQmxK8f8qHVGPHWVjcj42/MUdAhEmM5LoZk=;
  b=lmb0rccukCF887NV1ymkmMykzhGq9Xj9lHeNSHGRqbfEYCTsYLzYk3QK
   bGy5ubgbFeiFLM311mK+Sko48EIeJnmFc3Nswzpf1CH0WTws1myWeAF2j
   b5Qbo1wnuPHgKifEIPnznD/JLtggGmp6s5djY5m+Wp0Tgd9D9B8glvDsJ
   Mz9JY03I4SAvhYTZ6dlCUmm1MGN9lwwsvyHS1vbJGaTgehMzTuQzZo5km
   y0KPr73TCtGMgldXRikELdzp9KSqLM7Wiaj8O7tjxlKohiEff0ah4MRTw
   xhme3NyYp3+XO/K4cYtlW0TsK+MVKu3pukXPc8gQcdCIGKEonIEwH9DEu
   g==;
X-CSE-ConnectionGUID: sg3qz3EuT+Sc0epORyEURQ==
X-CSE-MsgGUID: 8saNr5scQt2zS6GpjrJM9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54258396"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54258396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:32:06 -0700
X-CSE-ConnectionGUID: qXXe7TfgRke+O2booGMwng==
X-CSE-MsgGUID: aYgQyivMQ2KbiV7Pz7nm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="186998390"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.54])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:32:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 899B81207A2;
	Thu, 10 Jul 2025 10:32:01 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uZllB-0045v6-2P;
	Thu, 10 Jul 2025 10:32:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 0/2] Add debug prints to help working with streams
Date: Thu, 10 Jul 2025 10:31:59 +0300
Message-Id: <20250710073201.976056-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

These two patches add debug prints to help working with streams. They were
previously a part of my MC streaming control set
<20250619081546.1582969-1-sakari.ailus@linux.intel.com>.

since v1:

- Align debug print formatting with the rest of the framework.

Sakari Ailus (2):
  media: v4l2-subdev: Print early in
    v4l2_subdev_{enable,disable}_streams()
  media: v4l2-subdev: Add debug prints to v4l2_subdev_collect_streams()

 drivers/media/v4l2-core/v4l2-subdev.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.39.5


