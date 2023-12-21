Return-Path: <linux-media+bounces-2866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758181B932
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 15:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997DEB28A6D
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 14:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9118D59901;
	Thu, 21 Dec 2023 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxglkqIT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FE5823F
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703167107; x=1734703107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DeOXoj/VGJSaEzft2Jcq5QgHpOWbtmH7iz7+6AXUN84=;
  b=KxglkqITjsPyITSyaSL35xtbQJtGRXVp9wLEdqKYPAVaxqQzAPYV/msE
   /l/k8t9Z5n0iwDs6EVs2mvHEun63lO/y3RwCB55zxYstyFVTC6P1KZ5wc
   vv2WMSqyqSo2G8rYRCvfXBlNql5T9LuLrUJa9GyUfdsJUlAheiyReOH/Y
   EZqE2NR5HdZF18PB262LfJYo7fTnS3DGDmTV+KRpp+BpL5UT5yVjbipeY
   wiYL5MpPZndZE85txmzgGmuJH8FZe2pqwRa1OECua9rJA01scX0/673mk
   5S2gsDPMK0hd+bOInJEiLWOkxi+x0woZ8x41U9XQbrKPhp3gBSpDhwomX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="460312122"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="460312122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1108108401"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1108108401"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:25 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C73FA12039E;
	Thu, 21 Dec 2023 15:58:22 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH 0/3] Miscellaneous small things
Date: Thu, 21 Dec 2023 15:58:19 +0200
Message-Id: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set does three things: refactor link creation in ipu3-cio2 driver by
using v4l2_fwnode_create_links_for_pad(), add debug prints in
v4l2_fwnode_create_links_for_pad() and drop an unneeded debug print in
media_relase().

Sakari Ailus (3):
  media: ipu3-cio2: Further clean up async subdev link creation
  media: v4l2-mc: Add debug prints for
    v4l2_fwnode_create_links_for_pad()
  media: mc: Drop useless debug print on file handle release

 drivers/media/mc/mc-devnode.c            |  1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 22 +++++-----------------
 drivers/media/v4l2-core/v4l2-mc.c        | 21 +++++++++++++++++----
 3 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.39.2


