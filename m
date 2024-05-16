Return-Path: <linux-media+bounces-11552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE98C7650
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74AD828675C
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36B11465A1;
	Thu, 16 May 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+lUzLzj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF2146018
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862347; cv=none; b=MAH4w5J1bTCyaxc2JzBvzuBpn5ev1Ki9PUAYdu/cNQb+ipu6lYSMKVrLk8C2hCxSftBbyIbf/AUsRmOupoF/eheeof8yRgq+qiYnNURZVbSr6ZGHcU9+MJL+hr4oazF6Q+V5r5Az11Pa2ICW3ynSw16kyiRE+7tunSg81GDzygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862347; c=relaxed/simple;
	bh=nRbkJen+ptzp+3ir5jSVWyig5FoCaHzN3+3FP13EZ6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CLBni2oe5LaOKg0QjW6RDUyBBIqif84AEHzuwgcom8ikWD1S2N717CBzxQ1yv2pLJBCLt/LivLhr/Lb+PJJtK7aoltf8QN58wjzl9QZebJneZIyoLdbit6CntVegrHK2sQ9QSbP6AB0J9+7GOJ/zclM9Q+p0HthNvwq8IraPWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+lUzLzj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715862345; x=1747398345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nRbkJen+ptzp+3ir5jSVWyig5FoCaHzN3+3FP13EZ6M=;
  b=e+lUzLzjin3dCNQcjCtqQW4+CFaX5QKhkfi7xqR6AdIy21ayGTsBK2kE
   H46XxHIWaf8tr4MvRgTpSSUSBKtmeSkMabgVJnl88F7yOkJgDbI5+bp2s
   hE5KMtHyY9kk18ycLhT7/ssOl12zF1iX/WsXwxsauZ8cU6P+dM3PYLmaf
   QhZsYJMpy1bWML1dwfl+CUYTioUS6QEj60a9jdpgmCivY2Ird2wMs2yWs
   t89aU6nvPOmEfeM/uoLx2/iz3/Xw0t6kG5QMaq+Rjb1EJ/Hbu3VFJYept
   ezhtBVAkfdlcS8MS3e2DNgiEiTLc7KOEiBwN8fOIvEwdr2HPS3woBxu9H
   w==;
X-CSE-ConnectionGUID: Z7rUPBlVTXGUDXjiUGq5KQ==
X-CSE-MsgGUID: pe+RC0wATTqd+k+qAzpBfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37345809"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="37345809"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:45 -0700
X-CSE-ConnectionGUID: jaRTbsWsTwC4PzgPMDLK4A==
X-CSE-MsgGUID: KIdpyo5zT065QE56XYB0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36290245"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 108A3120D04;
	Thu, 16 May 2024 15:25:39 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v6 0/4] Use V4L2 mbus config for conveying MEI CSI link frequency
Date: Thu, 16 May 2024 15:25:35 +0300
Message-Id: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set adds a few helpers for obtaining the link frequency from the V4L2
mbus config for devices that don't need to provide an UAPI to change it,
and finally add support for the Intel IVSC CSI device.

since v5:

- Only support pad-based operation with CONFIG_MEDIA_CONTROLLER (1st and
  2nd patches).

since v4:

- Rework documentation a little.

- Remove wrong alignment change in 2nd patch.

- Move link_freq field after the type field in struct v4l2_mbus_config.

since v3:

- Add back missing ret I accidentally removed rather than moved to the 2nd
  patch.

since v2:

- Switch to V4L2 mbus config for conveying the link frequency.

since v1:

- Add a new 64-bit integer control V4L2_CID_CUR_LINK_FREQ instead of
  re-using V4L2_CID_LINK_FREQ.

Sakari Ailus (4):
  media: v4l: Support passing media pad argument to v4l2_get_link_freq()
  media: v4l: Support obtaining link frequency via get_mbus_config
  media: Documentation: Update link frequency driver documentation
  media: ivsc: csi: Obtain link frequency from the media pad

 Documentation/driver-api/media/tx-rx.rst |  4 ++
 drivers/media/pci/intel/ivsc/mei_csi.c   | 72 ++++++++----------------
 drivers/media/v4l2-core/v4l2-common.c    | 26 ++++++++-
 include/media/v4l2-common.h              | 19 ++++++-
 include/media/v4l2-mediabus.h            |  2 +
 5 files changed, 70 insertions(+), 53 deletions(-)


base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
-- 
2.39.2


