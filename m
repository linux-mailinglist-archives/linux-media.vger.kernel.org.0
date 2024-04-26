Return-Path: <linux-media+bounces-10228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45A8B3A6D
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 16:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D87D1F242E0
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 14:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EADF148825;
	Fri, 26 Apr 2024 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcRw8Z0b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B731D52C
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714143354; cv=none; b=IQ6F3/0U/4oesSvPdh6XP0TLuQ4GbvWAnaHhsPc2ZNOJXPzaP4iV2M3n0hZ6xC2zQRc+ZSnzqg4PPsZx4bBpTHosmYpT7ocBWlAagGHYcMVl6VBQLnDaylofNcVyGPdoWire6CDaDqwRT4z5kX/8YF3YX1voRIWtrDX1uWtKwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714143354; c=relaxed/simple;
	bh=+AXY+HX2JNDDK+AlUnkYeE7JuMqVCc4rhEG15l+TxFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hk69dAF5owUx/PBQhU2OFM5h79/FQ0dvq8eUWR9+ouT/vjHPBzG8rjf/YqMPFEhB5lsV+IetrCxsGi8OnR+4OyqiMxCcfc8CeKDXNg1ancrpB5OMeMB4RI11CT4o8r0ScOhtuMu0vCa/uPPgwOr7xWMcVshXY6wZyrGf8NhhDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcRw8Z0b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714143353; x=1745679353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+AXY+HX2JNDDK+AlUnkYeE7JuMqVCc4rhEG15l+TxFc=;
  b=AcRw8Z0bOQK6ZNfbfC9MD6fZmYZ6kmkdoZJcZwv96wP/CaQRfLFf+jMB
   NPAL52gmwdJIsviI3MkfqD4CbDpu97Xzn6hJbcit38fWOopBLkz/Z0w3t
   SFg3l0QJXg21pmc76n5prNNCBSvSzewVny7lFPxdy2adyg9iWCkg191Ve
   DnVry96L+j776Uxp7ippsm+AGm67qQXdJpP+D+EeRu3qYNieQS0zhCAsi
   61D9mzsylSEpV8lPmC30WmC5C3TRbQQhum6/V5Fr9EffYd9MgyY3u/O5P
   Mrrlt5wHv4DfMnve7pysvK2m65wF4xKTW1tE5ILtJ2I3K/NP+xlMT24FB
   w==;
X-CSE-ConnectionGUID: ln5oxFSqTn6J2bxup+t+lQ==
X-CSE-MsgGUID: 0EM0CP7UTqWnCVEnORt3UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10095277"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="10095277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:52 -0700
X-CSE-ConnectionGUID: g7IYXJmURxKwZwZ3hYPHrg==
X-CSE-MsgGUID: OL5sJBzUTf+Ee6neneR9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25514716"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AFADC11FA8A;
	Fri, 26 Apr 2024 17:55:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s0MzM-002kC6-25;
	Fri, 26 Apr 2024 17:55:48 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 0/3] Use INTEGER64 type for MEI CSI LINK_FREQ control 
Date: Fri, 26 Apr 2024 17:55:35 +0300
Message-Id: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

An integer menu isn't a useful control type for conveying the frequency
depending on an external device to the receiver. Instead, in the MEI CSI
driver, just obtain the link frequency from the upsteam sub-device and
pass it on to the receiver.

The v4l2_get_link_freq() is changed to add support for this and it's
documented as well.

since v1:

- Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
  re-using V4L2_CID_LINK_FREQ.

Sakari Ailus (3):
  media: Documentation: v4l: Add CUR_LINK_FREQ control
  media: v4l: Support obtaining link frequency from CUR_LINK_FREQ
    control
  media: ivsc: csi: Fix link frequency control behaviour

 .../media/v4l/ext-ctrls-image-process.rst     |  4 ++++
 drivers/media/pci/intel/ivsc/mei_csi.c        | 24 ++++++-------------
 drivers/media/v4l2-core/v4l2-common.c         |  6 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 ++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 5 files changed, 22 insertions(+), 18 deletions(-)


base-commit: 6612d1ae37b52d37d1d515d7c5110b9f3afe94d2
-- 
2.39.2


