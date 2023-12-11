Return-Path: <linux-media+bounces-2102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF880CCFF
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 15:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E091C1F210F3
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CE948786;
	Mon, 11 Dec 2023 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXvAOaUD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7278C118
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702303626; x=1733839626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UAdSssmSDpm4MMt1e2kaFSDh2ihAfWPytOuxzysIb5A=;
  b=ZXvAOaUDpOaR32P48myMmdd8jpln0AWm+OZkAGBU57JPqyR3KEgWr8Sf
   Tn2VE6EdPYayNieUg1rQgsm7K9eqsaSUrkQ9WlM99Pxkn5sezkeOCn0kH
   kmZMAalwYkcky53gGGvQDgQX/IpVLBwbY4l4bcGptSz/52nOaQsIQsmCj
   jBs3MFmYEoOqi2opfs6SfJqVSjjJIKHs5PcwCpLT/4QTj+mPVKYyAkqdM
   C79q+oXrPqsr6usjmOw2n6fLrC/+b7tTH8OvbDIPlOKL/2UcZbxbDvCT3
   pcNXFa8HbVfVWPAK2CkTGqfcXiPmk7DNTcASf3zIpd78NO1TcJZPe8Cve
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1778879"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1778879"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="773075701"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="773075701"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:02 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3AD8211FC1A;
	Mon, 11 Dec 2023 16:06:59 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 0/4] Add link frequency to bitmap helper
Date: Mon, 11 Dec 2023 16:06:54 +0200
Message-Id: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set adds a little helper for sensor drivers to match link frequencies
from system firmware with those supported the driver and generate a bitmap
suitable for passing to the control framework.

Imx319, imx334 and imx355 drivers are converted to use the helper, too.

I've tested imx319 and imx355 drivers.

Sakari Ailus (4):
  media: v4l: Add a helper for setting up link-frequencies control
  media: imx334: Use v4l2_link_frequencies_to_bitmap helper
  media: imx319: Use v4l2_link_frequencies_to_bitmap helper
  media: imx355: Use v4l2_link_frequencies_to_bitmap helper

 drivers/media/i2c/imx319.c            | 53 +++++++--------------------
 drivers/media/i2c/imx334.c            | 41 +++++++--------------
 drivers/media/i2c/imx355.c            | 53 +++++++--------------------
 drivers/media/v4l2-core/v4l2-common.c | 48 ++++++++++++++++++++++++
 include/media/v4l2-common.h           | 27 ++++++++++++++
 5 files changed, 116 insertions(+), 106 deletions(-)

-- 
2.39.2


