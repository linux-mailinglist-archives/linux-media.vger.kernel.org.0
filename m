Return-Path: <linux-media+bounces-4967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F3851024
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072001C21D77
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B32A17BC2;
	Mon, 12 Feb 2024 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiXbROT6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A57E17BB7
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707731919; cv=none; b=p+s2IHqiQqalI7Z3bAS+sYudZpzHGrC8ijM0WQh6SIbl9e3SI3zNys1/QtYzKAXIZOGBeugYl+hzVSPkSDyme/QdJuOjzTiCoR38hKO6kQjJLrpIHBszNiENZACRCPYePQ6a3WPwXAsMfQxmR9YX381iCT3eKwxERosTTiSstbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707731919; c=relaxed/simple;
	bh=zhCJytNSYTdj0nd6wzwQkI7SSvx06F77nGd0nZWjcfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZBuXBhORpWmKHv1A8v6p/uWvC7FuBIShEEaQu9DfB7aYSY8S9H4bdtfeojNY22BXRLuBpscCet2TQU4ZIF5wV/e+88/7sWT9TiSv5oCd+l34bYYjLQGePn3L2j+TuNyBxwiIEGItRPUHP9qSO0f17Pl36gu1Dpn2QDlKTgz2yGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiXbROT6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707731918; x=1739267918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zhCJytNSYTdj0nd6wzwQkI7SSvx06F77nGd0nZWjcfc=;
  b=NiXbROT66pZEQgZtHM8BZLuktf9E9kIxGdbaG3B14hfmChJG/bsNI0vB
   hqd0ogtU4rJWbiPXnRIHKE6AQosRypG8lDBOovKAkOi5ccFPSZyE1zISz
   KA5ThN7Cl8uAZFWpGBsyCQWA/ZSVGOwBariKCxgSwYO3tGs8dhT5KqIl4
   d8GxJzbYDHazl2EAii3/+MCswznIek0cpcpRcjFX4qA3HS2QJGFdM9FEE
   XgSfImroGD4CRwmz3fw5lGj+4XljsZpDmflsPTLQ9zo9xhhgd8mDY9Fml
   lvChseI+mV6umL4yWlLS+EIgPPMuRcBbo4EDP8QpnQ4QYzDYE+h9tFjQN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="4670867"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="4670867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2507606"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:58:36 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9845911F86A;
	Mon, 12 Feb 2024 11:49:09 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 1/1] media: ivsc: csi: Swap SINK and SOURCE pads
Date: Mon, 12 Feb 2024 11:49:09 +0200
Message-Id: <20240212094909.345118-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch swaps SINK and SOURCE pads of the MEI CSI sub-device. While
this does change the UAPI by swapping the pads, the driver has never been
usable in upstream kernel as the Intel IPU6 driver it depends on any
functionality has not yet been merged.

Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 15b905f66ab7..3c74d06a27fa 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -71,8 +71,8 @@ enum ivsc_privacy_status {
 };
 
 enum csi_pads {
-	CSI_PAD_SOURCE,
 	CSI_PAD_SINK,
+	CSI_PAD_SOURCE,
 	CSI_NUM_PADS
 };
 
@@ -587,7 +587,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	csi->remote_pad = pad;
 
 	return media_create_pad_link(&subdev->entity, pad,
-				     &csi->subdev.entity, 1,
+				     &csi->subdev.entity, CSI_PAD_SINK,
 				     MEDIA_LNK_FL_ENABLED |
 				     MEDIA_LNK_FL_IMMUTABLE);
 }
-- 
2.39.2


