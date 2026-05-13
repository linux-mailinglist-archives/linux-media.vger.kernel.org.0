Return-Path: <linux-media+bounces-61377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFjpHgtWBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBB531845
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A5B33054BE6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E3B3EE1C1;
	Wed, 13 May 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgBQnzHI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609DE3EF64E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669046; cv=none; b=SccvBWTHsF6Bh1udCpe6RzUTUuf8g1fcLVijWxxeCStL6DOlo6abjlJFtr5hF4CxLVKRLA2n3FJ0sGJGI6CV0+VWrg9OMj0/dB/upwn+dP1N/EopfZWjunPIRcRtJozdUO3ROwF9mDuJDk9xQ2RX1js6DsJvTCULHB2k+vS2/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669046; c=relaxed/simple;
	bh=W4YuarePKu51g6tF30wLW5/SuKEHm8DhPc17lllLX0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbRHYDNAf7gqxVJZ6GAivgdh9DxjWOdqRSaH3oh0m4D0xAXKb3L6NuqlzRcq7LmSFFY9sV+r22kZnnTmubdZ/7vbK+Z7dDTFbSK9AakpUMfKjSFu0PAbe2zZCvfa7TRXE4fMJ1EGlvUrKZWLSRY+jFdeuhm6eXIW5AeHWd68wzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgBQnzHI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669046; x=1810205046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W4YuarePKu51g6tF30wLW5/SuKEHm8DhPc17lllLX0k=;
  b=HgBQnzHI51Yt3XKYrTvvae4gols0lwbkvb8ZfLz3D9kt1OcP26/TTgVZ
   ht+he7laclfMA7JHem61v3n5Qy/8fIKSfD6lbOOHMbxxU3Mk9cSasCWfc
   LcTBafI/AkK24iVEjuYtAyF/km0XtVGNl1Psb9v5nga/Ui8+hhFBIpBkn
   y1InluuFQsbjr9aRPLjbjVMc8o564ftKcKz01Dj72YWAgUb3/ldv4mO7T
   FVKSpsjyrlyJ0M2UWiWQ3LgirQVONnUknBRI+Tunfj444ElK0j7UMpsFj
   3OZsREL8hm64pE66OoJ58vCy401VTmCxodXm4X5dLoF3WU6V1wcvKGifL
   g==;
X-CSE-ConnectionGUID: PnQbHTCERRG364xgnuw/Qw==
X-CSE-MsgGUID: 8bk1GOaoT9KUJAU/G58OPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464445"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:04 -0700
X-CSE-ConnectionGUID: O6Oa6x11R7yMmYubDW2CDQ==
X-CSE-MsgGUID: 1l8AxzAxTzGtAg9ZvxcICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599243"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BEFE011F80B;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S15-2nEa;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 00/17] Rework frame descriptors
Date: Wed, 13 May 2026 13:43:41 +0300
Message-ID: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3ECBB531845
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61377-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi folks,

This smallish set makes frame descriptors dynamically allocated and
implements a single-entry frame descriptor based on the device's format,
using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
do not obtain their frame descriptor from upstream are converted. The
helper also obtains a frame descriptor for the desired type (parallel or
CSI-2) and checks there's at least one entry there. These checks are
removed from drivers that currently perform them. (Some drivers also check
there's exactly a single frame descriptor entry but I think in most cases
this check could be loosened. That could be done after this set.)

On callee side these patches introduce no changes as the number of
pre-allocated memory for 8 frame descriptors remains as-is. The
get_frame_desc() pad op can return more than 8 frame descriptors by
setting the num_entries to the desired number and returning -ENOSPC.

If people prefer using cleanup.h / __free() to release the dynamically
allocated array (I think I'd almost require that), I'll merge the
now-separate __v4l2_subdev_get_frame_desc() into
v4l2_subdev_get_frame_desc().

More formats can be added to df-to-mbus conversion as needed. These are
meant to be initial formats that are enough for typical raw sensors (and
one RGB format, too).

Sakari Ailus (17):
  media: v4l2-common: Add mipi_csi2_dt_for_mbus()
  media: v4l2-subdev: Align frame descriptor error codes with routing
  media: v4l2-subdev: Prepare for changes in getting frame descriptors
  media: v4l2-subdev: Allocate frame descriptors based on the need
  media: v4l2-subdev: Provide a cleanup-friendly get_frame_desc
  media: v4l2-subdev: Change the maximum number of routes
  media: v4l2-subdev: Return dynamically allocated pass-through routes
  media: v4l2-subdev: Always return at least one frame descriptor
  media: bcm2835-unicam: Use v4l2_subdev_get_frame_desc()
  media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
  media: raspberrypi: cfe: Use v4l2_subdev_get_frame_desc()
  media: rzg2l-cru: Use v4l2_subdev_get_frame_desc()
  media: rkisp1: Use v4l2_subdev_get_frame_desc()
  media: exynos4-is: Use v4l2_subdev_get_frame_desc()
  media: ti: cal: Use v4l2_subdev_get_frame_desc()
  media: ipu6: Use v4l2_subdev_get_frame_desc()
  staging: media: ipu7: Use v4l2_subdev_get_frame_desc()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  23 ++-
 .../media/platform/broadcom/bcm2835-unicam.c  |  20 +--
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  15 +-
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  29 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  21 +--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  12 +-
 .../samsung/exynos4-is/fimc-capture.c         |  16 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  25 ++-
 drivers/media/v4l2-core/v4l2-common.c         |  47 ++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 156 +++++++++++++++---
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    |  16 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  22 ++-
 include/media/mipi-csi2.h                     |   2 +
 include/media/v4l2-subdev.h                   |  76 ++++++++-
 14 files changed, 344 insertions(+), 136 deletions(-)

-- 
2.47.3


