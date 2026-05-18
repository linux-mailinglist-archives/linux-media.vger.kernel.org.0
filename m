Return-Path: <linux-media+bounces-62029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPPpJO5CC2qsFAUAu9opvQ
	(envelope-from <linux-media+bounces-62029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:48:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4BE5712EB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 253DF307FDEF
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69F948BD4E;
	Mon, 18 May 2026 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyKhwnfH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF6848AE12
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122603; cv=none; b=U+sxp3ktZ4B9j8pzqmR2YYIWoDSziQqLxDdO3xeNb7KgF70wQEbvAswai/suVnSNwBaqseZL1NRj3Ovd6es+HrM8hNZYjM7aM1WVFVKt8GVqUIGKqQG95W6Euf+/0e9elMWj1FxuqE4DB1DSitFnevCB5pTiJzHYM/+DixrVcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122603; c=relaxed/simple;
	bh=iDZ8Etq2SSkdJpKeeN1TnS9LyWhSDTGPHB6NiEYeHjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsRF7oHpasQm4hAxlmJbfMsh6s/JV0MFUMCOsSogzJJeghxNUQgD9AHelPQFr6gPSW2jkQtzfo/PQXs5IVT0WYd89S9rK3rzKtvDI91358peFYslqr0oDbk5zbeuMUgva0nIKTh7myJQAD2ExxS92czsd3XGo6qqsD7iejwpoGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyKhwnfH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122602; x=1810658602;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iDZ8Etq2SSkdJpKeeN1TnS9LyWhSDTGPHB6NiEYeHjk=;
  b=cyKhwnfHgcFvOyi7KXcXsdURFAbmVc5P0356jcjsDjO8U/6DSifjGIqC
   vO8HC4jwhsSmYNpggxDvOid0z8kEWgo7BoliaJlPcHZDJ9kcIWSKinwAE
   5V69EP344TZ0uKnBfPCVHoIodg0riqX+9MeVvNypfbqIt4qZz4THvVpx+
   sZltbE/QE0flRbW81DduYa3E2AMf8dOw+gf8SoY2czgri5qzFEsuC/pN7
   GhAjqZ3oNcnnpxil8ZrMt1a/J6GHs9B/O9Dy/tGPDPxHkm/ULKy/afqhX
   /sFvYmynFiYcdDnLeGCcq7d+N8C5APCrRijfZy/8R6dg7A5B2vboXLVPd
   Q==;
X-CSE-ConnectionGUID: pEjizKUKSb+Y1eEw7bwmcw==
X-CSE-MsgGUID: lV19+jDIT3abVm0PWquhyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413820"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413820"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:20 -0700
X-CSE-ConnectionGUID: BFBzuKPETKi6IEefAlM7zg==
X-CSE-MsgGUID: KjVBqvE1RlyU+XhRfN9BiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019137"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 27992121CA8;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89W-0Bnd;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 00/17] Rework frame descriptors
Date: Mon, 18 May 2026 19:43:00 +0300
Message-ID: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62029-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D4BE5712EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

since v1:

- Take Frank's patch adding media bus format to dt / bpp conversion.
  Always return -EINVAL on error.

- Rework sub-device framework patch split to make the patches more
  reviewable.

- In call_get_frame_desc(), always set fd->entry to fd->entry_mem and
  fd->len_entries. Also use memset_after().

- Check for num_entries in call_get_frame_desc() first and thus remove the
  redundant else case.

- Check for validity of the returned frame descriptor type in
  call_get_frame_desc().

- Merge the patches adding v4l2_subdev_get_frame_desc() and changing the
  interface to return the frame descriptor.

- Check for descriptor type early in v4l2_subdev_get_frame_desc().

- Return 0 instead of ret in v4l2_subdev_get_frame_desc() when ret is 0.

- Check the number of returned entries in v4l2_subdev_get_frame_desc().

- Fill in the first frame descriptor entry in v4l2_subdev_get_frame_desc()
  instead of allocating one in the stack.

- Move the definition of frame descriptors to the
  v4l2_subdev_get_frame_desc() call site.

- Rework the code dealing with frame descriptor allocation.

- Move frame descriptor declaration to the location of first use in driver
  patches.

- Fix numerous bugs in driver patches.

Frank Li (1):
  media: v4l2-common: Add helper function
    media_bus_fmt_to_csi2_(bpp|dt)()

Sakari Ailus (16):
  media: v4l2-subdev: Align frame descriptor error codes with routing
  media: v4l2-subdev: Prepare for changes in getting frame descriptors
  media: v4l2-subdev: Allow releasing frame descriptors on return
  media: v4l2-subdev: Allocate frame descriptors based on the need
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

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  22 +--
 .../media/platform/broadcom/bcm2835-unicam.c  |  22 +--
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  19 +-
 .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  28 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  27 +--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  21 +-
 .../samsung/exynos4-is/fimc-capture.c         |  18 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  26 ++-
 drivers/media/v4l2-core/v4l2-common.c         | 183 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 152 +++++++++++++--
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    |  19 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  26 ++-
 include/media/mipi-csi2.h                     |  24 +++
 include/media/v4l2-subdev.h                   |  78 +++++++-
 14 files changed, 512 insertions(+), 153 deletions(-)

-- 
2.47.3


