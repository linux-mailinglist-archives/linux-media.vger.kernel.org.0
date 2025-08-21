Return-Path: <linux-media+bounces-40577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8998B2F976
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 925731CE6C81
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF33320CD4;
	Thu, 21 Aug 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZQ+Eotp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48131CA59
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781207; cv=none; b=DPGElcTZtDKWroSuasl7tkUzzqXxmkTSDGPnVmKjzDvmevq/GWz5gbuK+29Oiaj8q3k6qRl0kqs9Rgl3hZQ+OsZHdZsDOUAF2R3tvcZQGO56eYxEMg1fgqQNegxrXW/Nz93MM3CqKoO/b1m2JqZmCY60J6dEBEOcX3T86I+DDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781207; c=relaxed/simple;
	bh=u9xeYT1yX3bHbN8YMPUx+gMAse2J8PEKAvib/B2j5U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fFKjq69XurvZfH+H0gnOPS9/Qho0tj2muwsg6M0IRlBykwWmbGtamvEFNfq0ofYYq46Un/YzsD/wpUa5FdIWhfzeIDg37XalcSwStVK2dA40lXDbPN2GPtKXnrB1WAYCKdLc3HhffdGZ0gDXw490x2PjByKo5IDxTKLJWiGmrAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZQ+Eotp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781205; x=1787317205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u9xeYT1yX3bHbN8YMPUx+gMAse2J8PEKAvib/B2j5U0=;
  b=JZQ+Eotp9zWvo93adjwUwX8giBlJB9jNfF3CHzNMxugDXBsKJ+aTy3KW
   oqX4td3Bw+DXkmE99MpKOP26PTnSISF8UScOeTNtiUPL7Cchjiyi981Gh
   H7PmrDBqYyhgVGLjX3UOWWtCiIlEKJneytSrjO9tpdx99EZlxnrfugBG4
   WeXX1FtJePCCTLWKUVBKxaC7d+FSsruqLiYJTCPHHIUoZvYv+MJDwHN/M
   1eD6hJwtLlmOiIixE67Sv3IRz9jERVmksO5lxs+gWQ8ps4wBPXxp96LNx
   xfAsp6lFY65f4V6wpeKf4lE7grdfPo8wquavITKrezB8zytdprtiveQCN
   g==;
X-CSE-ConnectionGUID: 4hLd2U8bRymFTCLhxHXT/w==
X-CSE-MsgGUID: R9S6JKH0RFO2N6WqO10ydA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58018251"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58018251"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:05 -0700
X-CSE-ConnectionGUID: 0X9H4JwVTC+ZGXUZFlBpsw==
X-CSE-MsgGUID: KCtuKfSaS7C+LU0YFAAudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199278780"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D6DA511FC36;
	Thu, 21 Aug 2025 15:59:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up4tb-00000002K2d-3MOh;
	Thu, 21 Aug 2025 15:59:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/3] Drop control handler argument support for v4l2_get_link_freq()
Date: Thu, 21 Aug 2025 15:59:56 +0300
Message-ID: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi folks,

This set removes the workaround from v4l2_get_link_freq() that allowed
calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
converted in the process as well.

As a result there's also no definition of v4l2_get_link_freq() without
CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
untested.

since v3:

- Use Laurent's proposed text in documentation fix patch.

since v2:

- Improve documentation for v4l2_get_link_freq(), aligning it to the
  removal of control handler argument support.

- Add a patch to mention the primary source of the link frequency is the
  get_mbus_config pad operation.

since v1:

- Remove redundant src_pad argument from c3_mipi_csi_start_stream().

Sakari Ailus (3):
  media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
  media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
  media: v4l2-common: Update v4l2_get_link_freq() documentation

 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |  7 +++--
 drivers/media/v4l2-core/v4l2-common.c         | 17 ++++++------
 include/media/v4l2-common.h                   | 27 +++++++------------
 3 files changed, 20 insertions(+), 31 deletions(-)

-- 
2.47.2


