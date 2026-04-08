Return-Path: <linux-media+bounces-58270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIfCGex31mm9FggAu9opvQ
	(envelope-from <linux-media+bounces-58270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:44:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C33BE6B3
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 552A430A9FC5
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E923A1E80;
	Wed,  8 Apr 2026 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRz3AuqD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181183D3D1E
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662850; cv=none; b=A15yNrmF7M/ZPo7xSddpWH/Gl7VbFILYcQ+l15P1kUN46NB9sB0wg20C7VCzrqKrFuQOvAqli34fLnvJQGX7sfI3g4TydSJCeOQbZb49eQGozadFyWPfTF2dI0XzXy72tAZPKCsMDdH8ucQQ5UiYFd0mwfVBe48dKwO4RUgPCJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662850; c=relaxed/simple;
	bh=dqHvYXgqfBq2IsgpSs5FBePOlINW7+I7sgqIgCV5w7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBf4wSU/0n6d/c4rq/OPX0fYWKa4rj+n8PH8qck1Y9GmqZ7SKIOt3ts9VuSb6sUuOC6KS4G3AGR7eIxBT37WDkTVhoXSPqxH1LUkICgr2Mule0FS407Pm7V2mh/9NDDHQCpnTZoiuYt7uHrfYoGAiFtR0khPo/Jeq6/5Cpf1cMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRz3AuqD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662833; x=1807198833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dqHvYXgqfBq2IsgpSs5FBePOlINW7+I7sgqIgCV5w7M=;
  b=iRz3AuqDhaCG181DH9BujCsU8PySt48BHDUTeUwVHw+tWRl/B+PjAGDW
   CWucFL0vARXsPuNtpBB5pIwlr4mJ4g18JmkUQfeRqCUKc7x/3S1p89JOU
   AtKgiKGe66ns20wo3OXRQlhJ/dctV8sW1HF3l1hL8Mtf634zPodHDeko8
   LNKT6cRyg0894VBJ3tpxWcxIZ8dtN8gKNqlywWmiwApGhUjKwoyJu64fM
   TejiCJuIup6V0Np2oHHEiGLvwVtguDvdL5MZaYjzNYwRvX10K3cB+Yc6f
   l5My0kHzAADEyYpyXpCbgVpo6DdYz0ret5HW/iHoYAnPcJGLGpXtjBtzZ
   w==;
X-CSE-ConnectionGUID: o7jdidBGQsef5WD4JEwwlQ==
X-CSE-MsgGUID: D0uzTNeGQqmfbBnYYXMZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038589"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:02 -0700
X-CSE-ConnectionGUID: c0Cnu0QWT/+aM0aJRVJfrw==
X-CSE-MsgGUID: no7CqnZBQOm5QXXLY+GHkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740411"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 587F912231C;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044EB-3KZ7;
	Wed, 08 Apr 2026 18:39:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 29/29] media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops
Date: Wed,  8 Apr 2026 18:39:38 +0300
Message-ID: <20260408153939.969381-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58270-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,crop.target:url];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D87C33BE6B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add const struct v4l2_subdev_client_info argument to the sub-device pad
ops get_fmt, set_fmt, get_selection and set_selection. This patch has been
entirely generated using Coccinelle and will be squashed to the previous
patch before merging.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adv7170.c                   |  2 ++
 drivers/media/i2c/adv7175.c                   |  2 ++
 drivers/media/i2c/adv7180.c                   |  4 ++-
 drivers/media/i2c/adv7183.c                   |  4 ++-
 drivers/media/i2c/adv748x/adv748x-afe.c       |  4 ++-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  3 ++-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |  4 ++-
 drivers/media/i2c/adv7511-v4l2.c              |  2 ++
 drivers/media/i2c/adv7604.c                   |  3 +++
 drivers/media/i2c/adv7842.c                   |  4 ++-
 drivers/media/i2c/ak881x.c                    |  2 ++
 drivers/media/i2c/alvium-csi2.c               |  3 +++
 drivers/media/i2c/ar0521.c                    |  2 ++
 drivers/media/i2c/ccs/ccs-core.c              | 15 ++++++++---
 drivers/media/i2c/cx25840/cx25840-core.c      |  1 +
 drivers/media/i2c/ds90ub913.c                 |  3 ++-
 drivers/media/i2c/ds90ub953.c                 |  3 ++-
 drivers/media/i2c/ds90ub960.c                 |  3 ++-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  2 ++
 drivers/media/i2c/gc0308.c                    |  1 +
 drivers/media/i2c/gc0310.c                    |  1 +
 drivers/media/i2c/gc05a2.c                    |  4 ++-
 drivers/media/i2c/gc08a3.c                    |  4 ++-
 drivers/media/i2c/gc2145.c                    |  2 ++
 drivers/media/i2c/hi556.c                     |  3 +++
 drivers/media/i2c/hi846.c                     |  3 +++
 drivers/media/i2c/hi847.c                     |  2 ++
 drivers/media/i2c/imx111.c                    |  1 +
 drivers/media/i2c/imx208.c                    |  2 ++
 drivers/media/i2c/imx214.c                    |  4 ++-
 drivers/media/i2c/imx219.c                    |  4 ++-
 drivers/media/i2c/imx258.c                    |  3 +++
 drivers/media/i2c/imx274.c                    |  4 +++
 drivers/media/i2c/imx283.c                    |  2 ++
 drivers/media/i2c/imx290.c                    |  4 ++-
 drivers/media/i2c/imx296.c                    |  7 +++--
 drivers/media/i2c/imx319.c                    |  2 ++
 drivers/media/i2c/imx334.c                    |  4 ++-
 drivers/media/i2c/imx335.c                    |  4 ++-
 drivers/media/i2c/imx355.c                    |  2 ++
 drivers/media/i2c/imx412.c                    |  4 ++-
 drivers/media/i2c/imx415.c                    |  4 ++-
 drivers/media/i2c/isl7998x.c                  |  2 ++
 drivers/media/i2c/lt6911uxe.c                 |  5 ++--
 drivers/media/i2c/max9286.c                   |  3 ++-
 drivers/media/i2c/max96714.c                  |  3 ++-
 drivers/media/i2c/max96717.c                  |  3 ++-
 drivers/media/i2c/ml86v7667.c                 |  1 +
 drivers/media/i2c/mt9m001.c                   |  6 ++++-
 drivers/media/i2c/mt9m111.c                   |  4 +++
 drivers/media/i2c/mt9m114.c                   |  6 +++++
 drivers/media/i2c/mt9p031.c                   |  4 +++
 drivers/media/i2c/mt9t112.c                   |  4 +++
 drivers/media/i2c/mt9v011.c                   |  1 +
 drivers/media/i2c/mt9v032.c                   |  4 +++
 drivers/media/i2c/mt9v111.c                   |  2 ++
 drivers/media/i2c/og01a1b.c                   |  1 +
 drivers/media/i2c/og0ve1b.c                   |  3 ++-
 drivers/media/i2c/os05b10.c                   |  2 ++
 drivers/media/i2c/ov01a10.c                   |  3 +++
 drivers/media/i2c/ov02a10.c                   |  4 ++-
 drivers/media/i2c/ov02c10.c                   |  1 +
 drivers/media/i2c/ov02e10.c                   |  2 ++
 drivers/media/i2c/ov08d10.c                   |  2 ++
 drivers/media/i2c/ov08x40.c                   |  2 ++
 drivers/media/i2c/ov13858.c                   |  2 ++
 drivers/media/i2c/ov13b10.c                   |  2 ++
 drivers/media/i2c/ov2640.c                    |  3 +++
 drivers/media/i2c/ov2659.c                    |  2 ++
 drivers/media/i2c/ov2680.c                    |  4 +++
 drivers/media/i2c/ov2685.c                    |  3 +++
 drivers/media/i2c/ov2732.c                    |  4 ++-
 drivers/media/i2c/ov2735.c                    |  4 ++-
 drivers/media/i2c/ov2740.c                    |  1 +
 drivers/media/i2c/ov4689.c                    |  2 ++
 drivers/media/i2c/ov5640.c                    |  3 +++
 drivers/media/i2c/ov5645.c                    |  4 ++-
 drivers/media/i2c/ov5647.c                    |  3 +++
 drivers/media/i2c/ov5648.c                    |  2 ++
 drivers/media/i2c/ov5670.c                    |  3 +++
 drivers/media/i2c/ov5675.c                    |  3 +++
 drivers/media/i2c/ov5693.c                    |  4 +++
 drivers/media/i2c/ov5695.c                    |  2 ++
 drivers/media/i2c/ov6211.c                    |  3 ++-
 drivers/media/i2c/ov64a40.c                   |  2 ++
 drivers/media/i2c/ov7251.c                    |  5 +++-
 drivers/media/i2c/ov7670.c                    |  2 ++
 drivers/media/i2c/ov772x.c                    |  3 +++
 drivers/media/i2c/ov7740.c                    |  2 ++
 drivers/media/i2c/ov8856.c                    |  2 ++
 drivers/media/i2c/ov8858.c                    |  3 ++-
 drivers/media/i2c/ov8865.c                    |  3 +++
 drivers/media/i2c/ov9282.c                    |  5 +++-
 drivers/media/i2c/ov9640.c                    |  2 ++
 drivers/media/i2c/ov9650.c                    |  2 ++
 drivers/media/i2c/ov9734.c                    |  2 ++
 drivers/media/i2c/rdacm20.c                   |  1 +
 drivers/media/i2c/rdacm21.c                   |  1 +
 drivers/media/i2c/rj54n1cb0c.c                |  4 +++
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  4 +++
 drivers/media/i2c/s5k3m5.c                    |  4 ++-
 drivers/media/i2c/s5k5baf.c                   |  3 +++
 drivers/media/i2c/s5k6a3.c                    |  2 ++
 drivers/media/i2c/s5kjn1.c                    |  4 ++-
 drivers/media/i2c/saa6752hs.c                 |  2 ++
 drivers/media/i2c/saa7115.c                   |  1 +
 drivers/media/i2c/saa717x.c                   |  1 +
 drivers/media/i2c/st-mipid02.c                |  1 +
 drivers/media/i2c/t4ka3.c                     |  3 +++
 drivers/media/i2c/tc358743.c                  |  2 ++
 drivers/media/i2c/tc358746.c                  |  3 ++-
 drivers/media/i2c/tda1997x.c                  |  2 ++
 drivers/media/i2c/thp7312.c                   |  1 +
 drivers/media/i2c/tvp514x.c                   |  2 ++
 drivers/media/i2c/tvp5150.c                   |  3 +++
 drivers/media/i2c/tvp7002.c                   |  4 ++-
 drivers/media/i2c/tw9900.c                    |  2 ++
 drivers/media/i2c/tw9910.c                    |  3 +++
 drivers/media/i2c/vd55g1.c                    |  4 ++-
 drivers/media/i2c/vd56g3.c                    |  4 ++-
 drivers/media/i2c/vgxy61.c                    |  5 +++-
 drivers/media/pci/cobalt/cobalt-driver.c      |  8 +++---
 drivers/media/pci/cobalt/cobalt-v4l2.c        | 14 +++++-----
 drivers/media/pci/cx18/cx18-av-core.c         |  1 +
 drivers/media/pci/cx18/cx18-controls.c        |  2 +-
 drivers/media/pci/cx18/cx18-ioctl.c           |  2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |  4 +--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  5 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 ++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  3 ++-
 drivers/media/pci/intel/ivsc/mei_csi.c        |  1 +
 drivers/media/pci/ivtv/ivtv-controls.c        |  2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  2 +-
 drivers/media/pci/saa7134/saa7134-empress.c   |  6 ++---
 .../platform/amlogic/c3/isp/c3-isp-capture.c  |  2 +-
 .../platform/amlogic/c3/isp/c3-isp-core.c     |  1 +
 .../platform/amlogic/c3/isp/c3-isp-resizer.c  |  3 +++
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c    |  3 ++-
 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |  3 ++-
 .../platform/arm/mali-c55/mali-c55-capture.c  |  2 +-
 .../platform/arm/mali-c55/mali-c55-isp.c      |  5 +++-
 .../platform/arm/mali-c55/mali-c55-resizer.c  | 15 ++++++++---
 .../platform/arm/mali-c55/mali-c55-tpg.c      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      |  4 +--
 .../media/platform/broadcom/bcm2835-unicam.c  |  3 ++-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  7 ++---
 drivers/media/platform/cadence/cdns-csi2tx.c  |  7 +++--
 drivers/media/platform/intel/pxa_camera.c     |  6 ++---
 drivers/media/platform/marvell/mcam-core.c    |  4 +--
 .../platform/microchip/microchip-csi2dc.c     |  2 ++
 .../platform/microchip/microchip-isc-base.c   |  1 +
 .../platform/microchip/microchip-isc-scaler.c |  3 +++
 drivers/media/platform/nxp/imx-mipi-csis.c    |  5 ++--
 drivers/media/platform/nxp/imx7-media-csi.c   |  3 ++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  3 ++-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  3 +++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  3 ++-
 .../media/platform/qcom/camss/camss-csid.c    |  4 ++-
 .../media/platform/qcom/camss/camss-csiphy.c  |  4 ++-
 .../media/platform/qcom/camss/camss-ispif.c   |  4 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c | 17 +++++++-----
 .../media/platform/qcom/camss/camss-video.c   |  2 +-
 .../media/platform/raspberrypi/rp1-cfe/csi2.c |  1 +
 .../platform/raspberrypi/rp1-cfe/pisp-fe.c    |  3 ++-
 drivers/media/platform/renesas/rcar-csi2.c    |  3 ++-
 .../media/platform/renesas/rcar-isp/csisp.c   |  3 ++-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  2 +-
 drivers/media/platform/renesas/renesas-ceu.c  |  7 ++---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  3 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  3 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
 .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      |  3 ++-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  3 +++
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 26 ++++++++++++-------
 .../media/platform/renesas/vsp1/vsp1_entity.c |  4 ++-
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  9 +++++--
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 +
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  3 +++
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_video.c  |  2 +-
 .../media/platform/renesas/vsp1/vsp1_vspx.c   |  3 ++-
 .../platform/rockchip/rkcif/rkcif-interface.c |  5 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  3 ++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  3 +++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  3 +++
 .../samsung/exynos4-is/fimc-capture.c         | 13 +++++++---
 .../samsung/exynos4-is/fimc-isp-video.c       |  5 ++--
 .../platform/samsung/exynos4-is/fimc-isp.c    |  2 ++
 .../platform/samsung/exynos4-is/fimc-lite.c   |  8 ++++--
 .../platform/samsung/exynos4-is/mipi-csis.c   |  2 ++
 .../samsung/s3c-camif/camif-capture.c         |  7 ++++-
 .../platform/samsung/s3c-camif/camif-core.c   |  4 +--
 drivers/media/platform/st/stm32/stm32-csi.c   |  1 +
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  6 ++---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  3 ++-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |  3 +++
 .../st/stm32/stm32-dcmipp/dcmipp-input.c      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  2 ++
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  2 ++
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  2 ++
 .../sun8i_a83t_mipi_csi2.c                    |  2 ++
 .../media/platform/synopsys/dw-mipi-csi2rx.c  |  3 ++-
 .../media/platform/ti/am437x/am437x-vpfe.c    |  4 +--
 drivers/media/platform/ti/cal/cal-camerarx.c  |  3 ++-
 drivers/media/platform/ti/cal/cal-video.c     |  6 ++---
 .../media/platform/ti/davinci/vpif_capture.c  |  2 +-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |  6 ++++-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |  4 ++-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |  4 ++-
 .../media/platform/ti/omap3isp/isppreview.c   |  6 ++++-
 .../media/platform/ti/omap3isp/ispresizer.c   |  6 ++++-
 drivers/media/platform/ti/omap3isp/ispvideo.c | 12 ++++-----
 drivers/media/platform/ti/vpe/vip.c           |  7 ++---
 drivers/media/platform/via/via-camera.c       |  4 +--
 drivers/media/platform/video-mux.c            |  1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  2 ++
 drivers/media/platform/xilinx/xilinx-dma.c    |  2 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |  2 ++
 drivers/media/test-drivers/vimc/vimc-common.c |  2 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  3 ++-
 drivers/media/test-drivers/vimc/vimc-scaler.c |  3 +++
 drivers/media/test-drivers/vimc/vimc-sensor.c |  1 +
 drivers/media/usb/cx231xx/cx231xx-417.c       |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |  4 +--
 drivers/media/usb/dvb-usb/cxusb-analog.c      |  6 +++--
 drivers/media/usb/em28xx/em28xx-camera.c      |  2 +-
 drivers/media/usb/go7007/go7007-v4l2.c        |  2 +-
 drivers/media/usb/go7007/s2250-board.c        |  1 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  2 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  2 ++
 .../media/atomisp/i2c/atomisp-ov2722.c        |  2 ++
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 16 ++++++++----
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  2 ++
 .../media/atomisp/pci/atomisp_subdev.c        |  4 +++
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  8 +++---
 .../media/deprecated/atmel/atmel-isc-base.c   |  4 +--
 drivers/staging/media/imx/imx-ic-prp.c        |  2 ++
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  2 ++
 drivers/staging/media/imx/imx-media-capture.c | 14 ++++++----
 drivers/staging/media/imx/imx-media-csi.c     |  4 +++
 drivers/staging/media/imx/imx-media-utils.c   |  2 +-
 drivers/staging/media/imx/imx-media-vdic.c    |  2 ++
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 ++
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  4 +++
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  2 ++
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  3 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  2 ++
 drivers/staging/media/tegra-video/csi.c       |  2 ++
 drivers/staging/media/tegra-video/vi.c        | 12 ++++-----
 252 files changed, 678 insertions(+), 209 deletions(-)

diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
index ef8682b980b4..6ad3dab4c79b 100644
--- a/drivers/media/i2c/adv7170.c
+++ b/drivers/media/i2c/adv7170.c
@@ -261,6 +261,7 @@ static int adv7170_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7170_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -284,6 +285,7 @@ static int adv7170_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7170_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index 384da1ec5bf9..6ef4d53c2781 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -299,6 +299,7 @@ static int adv7175_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7175_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -322,6 +323,7 @@ static int adv7175_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7175_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 669b0b3165b1..a5e6aa5a77e7 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -755,6 +755,7 @@ static int adv7180_set_field_mode(struct adv7180_state *state)
 }
 
 static int adv7180_get_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
@@ -771,6 +772,7 @@ static int adv7180_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int adv7180_set_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
@@ -808,7 +810,7 @@ static int adv7180_init_state(struct v4l2_subdev *sd,
 		: V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 
-	return adv7180_set_pad_format(sd, sd_state, &fmt);
+	return adv7180_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 25a31a6dd456..7b8afc225b4a 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -420,6 +420,7 @@ static int adv7183_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7183_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -446,6 +447,7 @@ static int adv7183_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7183_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -598,7 +600,7 @@ static int adv7183_probe(struct i2c_client *client)
 	adv7183_s_std(sd, decoder->std);
 	fmt.format.width = 720;
 	fmt.format.height = 576;
-	adv7183_set_fmt(sd, NULL, &fmt);
+	adv7183_set_fmt(sd, NULL, NULL, &fmt);
 
 	/* initialize the hardware to the default control values */
 	ret = v4l2_ctrl_handler_setup(hdl);
diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 678199196b84..d487cef3a979 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -326,6 +326,7 @@ static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv748x_afe_get_format(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_format *sdformat)
 {
@@ -349,6 +350,7 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_afe_set_format(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_format *sdformat)
 {
@@ -359,7 +361,7 @@ static int adv748x_afe_set_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return adv748x_afe_get_format(sd, sd_state, sdformat);
+		return adv748x_afe_get_format(sd, NULL, sd_state, sdformat);
 
 	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index ebe7da8ebed7..aa7515266c3a 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -226,6 +226,7 @@ static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
 }
 
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
@@ -233,7 +234,7 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbusformat;
 
 	if (sdformat->pad == ADV748X_CSI2_SOURCE)
-		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+		return v4l2_subdev_get_fmt(sd, NULL, sd_state, sdformat);
 
 	/*
 	 * Make sure the format is supported, if not default it to
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index b154dea29ba2..63819d5d218e 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -418,6 +418,7 @@ static int adv748x_hdmi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
@@ -440,6 +441,7 @@ static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_hdmi_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
@@ -449,7 +451,7 @@ static int adv748x_hdmi_set_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return adv748x_hdmi_get_format(sd, sd_state, sdformat);
+		return adv748x_hdmi_get_format(sd, NULL, sd_state, sdformat);
 
 	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 853c7806de92..159d4d93b133 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1241,6 +1241,7 @@ static void adv7511_fill_format(struct adv7511_state *state,
 }
 
 static int adv7511_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
@@ -1273,6 +1274,7 @@ static int adv7511_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7511_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..94a874f2fed4 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1920,6 +1920,7 @@ static void adv76xx_setup_format(struct adv76xx_state *state)
 }
 
 static int adv76xx_get_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -1943,6 +1944,7 @@ static int adv76xx_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1963,6 +1965,7 @@ static int adv76xx_get_selection(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index ea6966c0605e..1c0755c79b3e 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2072,6 +2072,7 @@ static void adv7842_setup_format(struct adv7842_state *state)
 }
 
 static int adv7842_get_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -2110,6 +2111,7 @@ static int adv7842_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv7842_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -2120,7 +2122,7 @@ static int adv7842_set_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (state->mode == ADV7842_MODE_SDP)
-		return adv7842_get_format(sd, sd_state, format);
+		return adv7842_get_format(sd, NULL, sd_state, format);
 
 	info = adv7842_format_info(state, format->format.code);
 	if (info == NULL)
diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index ee575d01a676..7d96b0cdec36 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -91,6 +91,7 @@ static int ak881x_s_register(struct v4l2_subdev *sd,
 #endif
 
 static int ak881x_fill_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -122,6 +123,7 @@ static int ak881x_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ak881x_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 955b7072a560..130925b6dfed 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1887,6 +1887,7 @@ static int alvium_init_state(struct v4l2_subdev *sd,
 }
 
 static int alvium_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1922,6 +1923,7 @@ static int alvium_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int alvium_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1957,6 +1959,7 @@ static int alvium_set_selection(struct v4l2_subdev *sd,
 }
 
 static int alvium_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index ed324c2d87aa..070aa3a4d87c 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -437,6 +437,7 @@ static void ar0521_adj_fmt(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int ar0521_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -457,6 +458,7 @@ static int ar0521_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ar0521_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index aa4dd7e7cf5a..1cd4db3f5708 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2148,6 +2148,7 @@ static u32 ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
 }
 
 static int ccs_get_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -2189,6 +2190,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_format_source(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -2200,7 +2202,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = ccs_get_format(subdev, sd_state, fmt);
+	rval = ccs_get_format(subdev, NULL, sd_state, fmt);
 	if (rval)
 		return rval;
 
@@ -2242,6 +2244,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -2252,7 +2255,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
-		rval = ccs_set_format_source(subdev, sd_state, fmt);
+		rval = ccs_set_format_source(subdev, NULL, sd_state, fmt);
 
 		return rval;
 	}
@@ -2467,6 +2470,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 }
 /* We're only called on source pads. This function sets scaling. */
 static int ccs_set_compose(struct v4l2_subdev *subdev,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_selection *sel)
 {
@@ -2536,6 +2540,7 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_crop(struct v4l2_subdev *subdev,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_selection *sel)
 {
@@ -2587,6 +2592,7 @@ static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
 }
 
 static int ccs_get_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -2633,6 +2639,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -2655,10 +2662,10 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		ret = ccs_set_crop(subdev, sd_state, sel);
+		ret = ccs_set_crop(subdev, NULL, sd_state, sel);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		ret = ccs_set_compose(subdev, sd_state, sel);
+		ret = ccs_set_compose(subdev, NULL, sd_state, sel);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 69d5cc648c0f..4d1d6cb980e5 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1771,6 +1771,7 @@ static int cx25840_s_ctrl(struct v4l2_ctrl *ctrl)
 /* ----------------------------------------------------------------------- */
 
 static int cx25840_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 49aa5f4a172c..b452ff233db3 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -373,6 +373,7 @@ static int ub913_set_routing(struct v4l2_subdev *sd,
 }
 
 static int ub913_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
 {
@@ -386,7 +387,7 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
 
 	/* Source format is fully defined by the sink format, so not settable */
 	if (format->pad == UB913_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	finfo = ub913_find_format(format->format.code);
 	if (!finfo) {
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a8ab67f4137f..8bcb82e0ad2d 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -426,6 +426,7 @@ static int ub953_set_routing(struct v4l2_subdev *sd,
 
 
 static int ub953_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
 {
@@ -438,7 +439,7 @@ static int ub953_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad == UB953_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	/* Set sink format */
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index d50e977cf6ce..fab7b6335b0d 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -4045,6 +4045,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int ub960_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
 {
@@ -4056,7 +4057,7 @@ static int ub960_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (ub960_pad_is_source(priv, format->pad))
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	/*
 	 * Default to the first format if the requested media bus code isn't
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 50121c3e5b48..915bd60f3ac4 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -996,6 +996,7 @@ __et8ek8_get_pad_format(struct et8ek8_sensor *sensor,
 }
 
 static int et8ek8_get_pad_format(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -1013,6 +1014,7 @@ static int et8ek8_get_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int et8ek8_set_pad_format(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/gc0308.c b/drivers/media/i2c/gc0308.c
index cbcda0e18ff1..064766b6f627 100644
--- a/drivers/media/i2c/gc0308.c
+++ b/drivers/media/i2c/gc0308.c
@@ -1044,6 +1044,7 @@ static void gc0308_update_pad_format(const struct gc0308_frame_size *mode,
 }
 
 static int gc0308_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 7af4d66f42a0..741ec64a2d68 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -362,6 +362,7 @@ static void gc0310_fill_format(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int gc0310_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index 8ba17f80fffe..e2cae5f3f77e 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -731,6 +731,7 @@ static void gc05a2_update_pad_format(struct gc05a2 *gc08a3,
 }
 
 static int gc05a2_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -762,6 +763,7 @@ static int gc05a2_set_format(struct v4l2_subdev *sd,
 }
 
 static int gc05a2_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -796,7 +798,7 @@ static int gc05a2_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	gc05a2_set_format(sd, state, &fmt);
+	gc05a2_set_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/gc08a3.c b/drivers/media/i2c/gc08a3.c
index 11fd936db9c3..ce80976e3a2a 100644
--- a/drivers/media/i2c/gc08a3.c
+++ b/drivers/media/i2c/gc08a3.c
@@ -706,6 +706,7 @@ static void gc08a3_update_pad_format(struct gc08a3 *gc08a3,
 }
 
 static int gc08a3_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -738,6 +739,7 @@ static int gc08a3_set_format(struct v4l2_subdev *sd,
 }
 
 static int gc08a3_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -772,7 +774,7 @@ static int gc08a3_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	gc08a3_set_format(sd, state, &fmt);
+	gc08a3_set_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index b215963a2648..661a59641f19 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -709,6 +709,7 @@ static int gc2145_init_state(struct v4l2_subdev *sd,
 }
 
 static int gc2145_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -774,6 +775,7 @@ static int gc2145_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int gc2145_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index de573cee4451..58d912db4f2f 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -960,6 +960,7 @@ __hi556_get_pad_crop(struct hi556 *hi556,
 }
 
 static int hi556_get_selection(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
@@ -1071,6 +1072,7 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int hi556_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
@@ -1113,6 +1115,7 @@ static int hi556_set_format(struct v4l2_subdev *sd,
 }
 
 static int hi556_get_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..802c79ac5f93 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1688,6 +1688,7 @@ static int __maybe_unused hi846_resume(struct device *dev)
 }
 
 static int hi846_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -1775,6 +1776,7 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 }
 
 static int hi846_get_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -1840,6 +1842,7 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int hi846_get_selection(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index def01aa07b2f..6ddb5cf9b6ba 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2639,6 +2639,7 @@ static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int hi847_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
@@ -2682,6 +2683,7 @@ static int hi847_set_format(struct v4l2_subdev *sd,
 }
 
 static int hi847_get_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/imx111.c b/drivers/media/i2c/imx111.c
index 8eb919788ef7..5b860fa052b1 100644
--- a/drivers/media/i2c/imx111.c
+++ b/drivers/media/i2c/imx111.c
@@ -1122,6 +1122,7 @@ static int imx111_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx111_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index d5350bb46f14..16407ff86f53 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -560,6 +560,7 @@ static int __imx208_get_pad_format(struct imx208 *imx208,
 }
 
 static int imx208_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -574,6 +575,7 @@ static int imx208_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx208_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index d4945b192776..96833f2bf287 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -662,6 +662,7 @@ static const struct v4l2_subdev_core_ops imx214_core_ops = {
 };
 
 static int imx214_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
@@ -717,6 +718,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 }
 
 static int imx214_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -754,7 +756,7 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	fmt.format.width = imx214_modes[0].width;
 	fmt.format.height = imx214_modes[0].height;
 
-	imx214_set_format(subdev, sd_state, &fmt);
+	imx214_set_format(subdev, NULL, sd_state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 5a85d76af65a..67b02fa338d0 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -818,6 +818,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -917,6 +918,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx219_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -959,7 +961,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	return imx219_set_pad_format(sd, state, &fmt);
+	return imx219_set_pad_format(sd, NULL, state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index bc9ee449a87c..bc3aa2b2ff6e 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -899,6 +899,7 @@ static int __imx258_get_pad_format(struct imx258 *imx258,
 }
 
 static int imx258_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -913,6 +914,7 @@ static int imx258_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx258_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -988,6 +990,7 @@ __imx258_get_pad_crop(struct imx258 *imx258,
 }
 
 static int imx258_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 241821572e03..b2d3772b0ba7 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1052,6 +1052,7 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 }
 
 static int imx274_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1064,6 +1065,7 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx274_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1097,6 +1099,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx274_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1213,6 +1216,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
 }
 
 static int imx274_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 38ea1902f2c2..e3cd27ca238e 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -958,6 +958,7 @@ static void imx283_set_framing_limits(struct imx283 *imx283,
 }
 
 static int imx283_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -1260,6 +1261,7 @@ static int imx283_identify_module(struct imx283 *imx283)
 }
 
 static int imx283_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2ed..d562a9aa455c 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1149,6 +1149,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx290_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1187,6 +1188,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx290_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1246,7 +1248,7 @@ static int imx290_entity_init_state(struct v4l2_subdev *subdev,
 		},
 	};
 
-	imx290_set_fmt(subdev, sd_state, &fmt);
+	imx290_set_fmt(subdev, NULL, sd_state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 69636db11a2b..74bb295799fd 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -675,6 +675,7 @@ static int imx296_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx296_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -726,6 +727,7 @@ static int imx296_set_format(struct v4l2_subdev *sd,
 }
 
 static int imx296_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -751,6 +753,7 @@ static int imx296_get_selection(struct v4l2_subdev *sd,
 }
 
 static int imx296_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -812,8 +815,8 @@ static int imx296_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	imx296_set_selection(sd, state, &sel);
-	imx296_set_format(sd, state, &format);
+	imx296_set_selection(sd, NULL, state, &sel);
+	imx296_set_format(sd, NULL, state, &format);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 953310ef3046..097e29544d01 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2015,6 +2015,7 @@ static int imx319_do_get_pad_format(struct imx319 *imx319,
 }
 
 static int imx319_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -2030,6 +2031,7 @@ static int imx319_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 imx319_set_pad_format(struct v4l2_subdev *sd,
+		      const struct v4l2_subdev_client_info *ci,
 		      struct v4l2_subdev_state *sd_state,
 		      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 553a16b84f4d..b2ae0887cc09 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -722,6 +722,7 @@ static void imx334_fill_pad_format(struct imx334 *imx334,
 }
 
 static int imx334_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -741,6 +742,7 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx334_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -786,7 +788,7 @@ static int imx334_init_state(struct v4l2_subdev *sd,
 				 ~(imx334->link_freq_bitmap),
 				 __ffs(imx334->link_freq_bitmap));
 
-	return imx334_set_pad_format(sd, sd_state, &fmt);
+	return imx334_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 static int imx334_set_framefmt(struct imx334 *imx334)
diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 1f777a1a8192..8f29d9f2da83 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -844,6 +844,7 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
 }
 
 static int imx335_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -901,10 +902,11 @@ static int imx335_init_state(struct v4l2_subdev *sd,
 				 ~(imx335->link_freq_bitmap),
 				 __ffs(imx335->link_freq_bitmap));
 
-	return imx335_set_pad_format(sd, sd_state, &fmt);
+	return imx335_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 static int imx335_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 27a5c212a527..0257fc3e2a9c 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1330,6 +1330,7 @@ static int imx355_do_get_pad_format(struct imx355 *imx355,
 }
 
 static int imx355_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -1345,6 +1346,7 @@ static int imx355_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 imx355_set_pad_format(struct v4l2_subdev *sd,
+		      const struct v4l2_subdev_client_info *ci,
 		      struct v4l2_subdev_state *sd_state,
 		      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 2705af2f16c0..a10ef2a99963 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -674,6 +674,7 @@ static void imx412_fill_pad_format(struct imx412 *imx412,
 }
 
 static int imx412_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -696,6 +697,7 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx412_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -733,7 +735,7 @@ static int imx412_init_state(struct v4l2_subdev *sd,
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	imx412_fill_pad_format(imx412, &supported_mode, &fmt);
 
-	return imx412_set_pad_format(sd, sd_state, &fmt);
+	return imx412_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 /**
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 0b424c17e880..f70c36e45a25 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1021,6 +1021,7 @@ static int imx415_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx415_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -1042,6 +1043,7 @@ static int imx415_set_format(struct v4l2_subdev *sd,
 }
 
 static int imx415_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1070,7 +1072,7 @@ static int imx415_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	imx415_set_format(sd, state, &format);
+	imx415_set_format(sd, NULL, state, &format);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 5ffd53e005ee..356fc020cb45 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -997,6 +997,7 @@ static int isl7998x_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int isl7998x_get_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -1027,6 +1028,7 @@ static int isl7998x_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int isl7998x_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
index bdefdd157e69..c9da174dbfa6 100644
--- a/drivers/media/i2c/lt6911uxe.c
+++ b/drivers/media/i2c/lt6911uxe.c
@@ -384,6 +384,7 @@ static int lt6911uxe_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int lt6911uxe_set_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
@@ -439,7 +440,7 @@ static int lt6911uxe_init_state(struct v4l2_subdev *sd,
 		: V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 
-	return lt6911uxe_set_format(sd, sd_state, &fmt);
+	return lt6911uxe_set_format(sd, NULL, sd_state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops lt6911uxe_video_ops = {
@@ -562,7 +563,7 @@ static irqreturn_t lt6911uxe_threaded_irq_fn(int irq, void *dev_id)
 	 * As a HDMI to CSI2 bridge, it needs to update the format in time
 	 * when the HDMI source changes.
 	 */
-	lt6911uxe_set_format(sd, state, &fmt);
+	lt6911uxe_set_format(sd, NULL, state, &fmt);
 	v4l2_subdev_unlock_state(state);
 
 	return IRQ_HANDLED;
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ac0712ce1e65..d877626edcf0 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -910,6 +910,7 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int max9286_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *format)
 {
@@ -922,7 +923,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	 * from the sinks.
 	 */
 	if (format->pad == MAX9286_SRC_PAD)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	/* Validate the format. */
 	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index e3e625e6f11a..e64d327fee21 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -327,6 +327,7 @@ static int max96714_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int max96714_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *format)
 {
@@ -339,7 +340,7 @@ static int max96714_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad == MAX96714_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 72f021b1a7b9..58bb2bf341db 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -414,6 +414,7 @@ static int max96717_set_routing(struct v4l2_subdev *sd,
 }
 
 static int max96717_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *format)
 {
@@ -427,7 +428,7 @@ static int max96717_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad == MAX96717_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	/* Set sink format */
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index 57ba3693649a..0db1e8114751 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -200,6 +200,7 @@ static int ml86v7667_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ml86v7667_fill_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 7a6114d18dfc..139154957571 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -248,6 +248,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mt9m001_set_selection(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
@@ -289,6 +290,7 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_get_selection(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
@@ -314,6 +316,7 @@ static int mt9m001_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -359,7 +362,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 	int ret;
 
 	/* No support for scaling so far, just crop. TODO: use skipping */
-	ret = mt9m001_set_selection(sd, NULL, &sel);
+	ret = mt9m001_set_selection(sd, NULL, NULL, &sel);
 	if (!ret) {
 		mf->width	= mt9m001->rect.width;
 		mf->height	= mt9m001->rect.height;
@@ -371,6 +374,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 3532c7c38bec..ac4461b465cf 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -446,6 +446,7 @@ static int mt9m111_reset(struct mt9m111 *mt9m111)
 }
 
 static int mt9m111_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -490,6 +491,7 @@ static int mt9m111_set_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m111_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -515,6 +517,7 @@ static int mt9m111_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m111_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -617,6 +620,7 @@ static int mt9m111_set_pixfmt(struct mt9m111 *mt9m111,
 }
 
 static int mt9m111_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index e395e2d14e97..813345bfa195 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1255,6 +1255,7 @@ static int mt9m114_pa_enum_framesizes(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -1282,6 +1283,7 @@ static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -1305,6 +1307,7 @@ static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -1878,6 +1881,7 @@ static void mt9m114_ifp_update_sel_and_src_fmt(struct v4l2_subdev_state *state)
 }
 
 static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -1924,6 +1928,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *state,
 				     struct v4l2_subdev_selection *sel)
 {
@@ -1983,6 +1988,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *state,
 				     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..d78a6e814d61 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -574,6 +574,7 @@ __mt9p031_get_pad_crop(struct mt9p031 *mt9p031,
 }
 
 static int mt9p031_get_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -585,6 +586,7 @@ static int mt9p031_get_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_set_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -623,6 +625,7 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_get_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -647,6 +650,7 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_set_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 2d2c840fc002..97452ab2bd89 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -872,6 +872,7 @@ static int mt9t112_set_params(struct mt9t112_priv *priv,
 }
 
 static int mt9t112_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -897,6 +898,7 @@ static int mt9t112_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -912,6 +914,7 @@ static int mt9t112_set_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
@@ -953,6 +956,7 @@ static int mt9t112_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 055b7915260a..d6faa4974bf8 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -336,6 +336,7 @@ static int mt9v011_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mt9v011_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index d4359d5b92bb..994bb7aa0cb5 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -468,6 +468,7 @@ static int mt9v032_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_get_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -503,6 +504,7 @@ static unsigned int mt9v032_calc_ratio(unsigned int input, unsigned int output)
 }
 
 static int mt9v032_set_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -547,6 +549,7 @@ static int mt9v032_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_get_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -561,6 +564,7 @@ static int mt9v032_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_set_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 64a758c95ab7..6b7d72efb3e7 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -868,6 +868,7 @@ static int mt9v111_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_get_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -886,6 +887,7 @@ static int mt9v111_get_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_set_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1d109ca75d76..d18b10fb0a1f 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -677,6 +677,7 @@ static int og01a1b_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int og01a1b_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade1..84682389d989 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -481,6 +481,7 @@ static int og0ve1b_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
@@ -544,7 +545,7 @@ static int og0ve1b_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	og0ve1b_set_pad_format(sd, state, &fmt);
+	og0ve1b_set_pad_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index e0453c988e4a..a46cfa513e98 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -595,6 +595,7 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 }
 
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
@@ -624,6 +625,7 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int os05b10_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 8a29e5b4b6ba..b9a7dacd603e 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -634,6 +634,7 @@ static void ov01a10_update_blank_ctrls(struct ov01a10 *ov01a10,
 }
 
 static int ov01a10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -715,6 +716,7 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov01a10_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -747,6 +749,7 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov01a10_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 143dcfe10445..7fc267963d04 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -296,6 +296,7 @@ static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
 }
 
 static int ov02a10_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -328,6 +329,7 @@ static int ov02a10_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov02a10_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -523,7 +525,7 @@ static int ov02a10_init_state(struct v4l2_subdev *sd,
 		}
 	};
 
-	ov02a10_set_fmt(sd, sd_state, &fmt);
+	ov02a10_set_fmt(sd, NULL, sd_state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d36032e1..d622f5dcac60 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -701,6 +701,7 @@ static int ov02c10_power_on(struct device *dev)
 }
 
 static int ov02c10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 4a64cba99991..fde8cdf4b88f 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -590,6 +590,7 @@ static int ov02e10_power_on(struct device *dev)
 }
 
 static int ov02e10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -642,6 +643,7 @@ static int ov02e10_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov02e10_get_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 9adef5446a61..3cd7a5d1e66a 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1178,6 +1178,7 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int ov08d10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -1226,6 +1227,7 @@ static int ov08d10_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov08d10_get_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 5eaf454f4763..1bbe8f056e08 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1829,6 +1829,7 @@ static int ov08x40_do_get_pad_format(struct ov08x40 *ov08x,
 }
 
 static int ov08x40_get_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
@@ -1844,6 +1845,7 @@ static int ov08x40_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov08x40_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 162b49046990..aa48abfb4eb5 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1330,6 +1330,7 @@ static int ov13858_do_get_pad_format(struct ov13858 *ov13858,
 }
 
 static int ov13858_get_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
@@ -1345,6 +1346,7 @@ static int ov13858_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov13858_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..a96c045b913f 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1096,6 +1096,7 @@ static int ov13b10_do_get_pad_format(struct ov13b10 *ov13b,
 }
 
 static int ov13b10_get_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
@@ -1111,6 +1112,7 @@ static int ov13b10_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov13b10_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index d27fc2df64e6..8b9b3b951bc2 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -909,6 +909,7 @@ static int ov2640_set_params(struct i2c_client *client,
 }
 
 static int ov2640_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -938,6 +939,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2640_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -1028,6 +1030,7 @@ static int ov2640_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2640_get_selection(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 061401b020fc..479cbff65f84 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1022,6 +1022,7 @@ static int ov2659_enum_frame_sizes(struct v4l2_subdev *sd,
 }
 
 static int ov2659_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1080,6 +1081,7 @@ static void __ov2659_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int ov2659_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 78e63bd1b35b..e817297d9596 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -623,6 +623,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2680_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -640,6 +641,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -704,6 +706,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -734,6 +737,7 @@ static int ov2680_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov2680_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 4911a4eea126..f9a5c5075fc9 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -340,6 +340,7 @@ static void ov2685_fill_fmt(const struct ov2685_mode *mode,
 }
 
 static int ov2685_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -353,6 +354,7 @@ static int ov2685_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2685_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -413,6 +415,7 @@ __ov2685_get_pad_crop(struct ov2685 *ov2685,
 }
 
 static int ov2685_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov2732.c b/drivers/media/i2c/ov2732.c
index 40035320fec6..57dd0dd3fd85 100644
--- a/drivers/media/i2c/ov2732.c
+++ b/drivers/media/i2c/ov2732.c
@@ -281,6 +281,7 @@ static int ov2732_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov2732_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -317,6 +318,7 @@ static int ov2732_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2732_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -442,7 +444,7 @@ static int ov2732_init_state(struct v4l2_subdev *sd,
 		}
 	};
 
-	return ov2732_set_fmt(sd, sd_state, &fmt);
+	return ov2732_set_fmt(sd, NULL, sd_state, &fmt);
 }
 
 static const struct v4l2_subdev_internal_ops ov2732_internal_ops = {
diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
index dcb1add1fd9f..90d8be72b559 100644
--- a/drivers/media/i2c/ov2735.c
+++ b/drivers/media/i2c/ov2735.c
@@ -674,6 +674,7 @@ static int ov2735_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int ov2735_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -742,6 +743,7 @@ static int ov2735_set_framing_limits(struct ov2735 *ov2735,
 }
 
 static int ov2735_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -792,7 +794,7 @@ static int ov2735_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	ov2735_set_pad_format(sd, state, &fmt);
+	ov2735_set_pad_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fb590dfadda1..4023b5b7ca82 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1023,6 +1023,7 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int ov2740_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index a59d25b09b5b..466b6f74d982 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -330,6 +330,7 @@ static void ov4689_fill_fmt(const struct ov4689_mode *mode,
 }
 
 static int ov4689_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -385,6 +386,7 @@ static int ov4689_enable_test_pattern(struct ov4689 *ov4689, u32 pattern)
 }
 
 static int ov4689_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..051e066d3e8e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2786,6 +2786,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 }
 
 static int ov5640_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2948,6 +2949,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 }
 
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2994,6 +2996,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5640_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..149b09aafa72 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -848,6 +848,7 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int ov5645_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
@@ -905,12 +906,13 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
 		},
 	};
 
-	ov5645_set_format(subdev, sd_state, &fmt);
+	ov5645_set_format(subdev, NULL, sd_state, &fmt);
 
 	return 0;
 }
 
 static int ov5645_get_selection(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index db9bd2892140..ce705c01a30e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -762,6 +762,7 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -787,6 +788,7 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -837,6 +839,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5647_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index f0b839cd65f1..29583025f081 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2194,6 +2194,7 @@ static void ov5648_mbus_format_fill(struct v4l2_mbus_framefmt *mbus_format,
 }
 
 static int ov5648_get_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2215,6 +2216,7 @@ static int ov5648_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov5648_set_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 04b3183b7bcb..1d3b3e8aae8e 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2272,6 +2272,7 @@ static int ov5670_do_get_pad_format(struct ov5670 *ov5670,
 }
 
 static int ov5670_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -2286,6 +2287,7 @@ static int ov5670_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int ov5670_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -2554,6 +2556,7 @@ __ov5670_get_pad_crop(struct ov5670 *sensor, struct v4l2_subdev_state *state,
 }
 
 static int ov5670_get_selection(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 508149485248..fd7f8bb62b8f 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1016,6 +1016,7 @@ static int ov5675_power_on(struct device *dev)
 }
 
 static int ov5675_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -1057,6 +1058,7 @@ static int ov5675_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov5675_get_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -1075,6 +1077,7 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
 }
 
 static int ov5675_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbee92..d624f5c476f9 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -796,6 +796,7 @@ __ov5693_get_pad_crop(struct ov5693_device *ov5693,
 }
 
 static int ov5693_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
@@ -807,6 +808,7 @@ static int ov5693_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5693_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
@@ -882,6 +884,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5693_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -915,6 +918,7 @@ static int ov5693_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov5693_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 5bb6ce7b3237..71c0f3f5c203 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -805,6 +805,7 @@ ov5695_find_best_fit(struct v4l2_subdev_format *fmt)
 }
 
 static int ov5695_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -838,6 +839,7 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5695_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c
index 034d5d57d67e..2ad31b2c5249 100644
--- a/drivers/media/i2c/ov6211.c
+++ b/drivers/media/i2c/ov6211.c
@@ -459,6 +459,7 @@ static int ov6211_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int ov6211_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -522,7 +523,7 @@ static int ov6211_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	ov6211_set_pad_format(sd, state, &fmt);
+	ov6211_set_pad_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
index 78b62c169b99..7beddf480b8a 100644
--- a/drivers/media/i2c/ov64a40.c
+++ b/drivers/media/i2c/ov64a40.c
@@ -3107,6 +3107,7 @@ static int ov64a40_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov64a40_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -3138,6 +3139,7 @@ static int ov64a40_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov64a40_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 27afc3fc0175..32da4630fd9c 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1150,6 +1150,7 @@ __ov7251_get_pad_format(struct ov7251 *ov7251,
 }
 
 static int ov7251_get_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
@@ -1214,6 +1215,7 @@ ov7251_find_mode_by_ival(struct ov7251 *ov7251, struct v4l2_fract *timeperframe)
 }
 
 static int ov7251_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
@@ -1296,12 +1298,13 @@ static int ov7251_init_state(struct v4l2_subdev *subdev,
 		}
 	};
 
-	ov7251_set_format(subdev, sd_state, &fmt);
+	ov7251_set_format(subdev, NULL, sd_state, &fmt);
 
 	return 0;
 }
 
 static int ov7251_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 0cb96b6c9990..125a80256f34 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1098,6 +1098,7 @@ static int ov7670_apply_fmt(struct v4l2_subdev *sd)
  * Set a format.
  */
 static int ov7670_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -1133,6 +1134,7 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov7670_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 062e1023a411..66123d9a7b98 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1171,6 +1171,7 @@ static int ov772x_set_params(struct ov772x_priv *priv,
 }
 
 static int ov772x_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1193,6 +1194,7 @@ static int ov772x_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov772x_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1212,6 +1214,7 @@ static int ov772x_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov772x_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 632fb80469be..7f637703b865 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -766,6 +766,7 @@ static int ov7740_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int ov7740_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -808,6 +809,7 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov7740_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8bedb47cd7cf..6164e95def8c 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2132,6 +2132,7 @@ static int ov8856_power_off(struct device *dev)
 }
 
 static int ov8856_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -2178,6 +2179,7 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov8856_get_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..0bfc4350a8c9 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1409,6 +1409,7 @@ static const struct v4l2_subdev_video_ops ov8858_video_ops = {
  */
 
 static int ov8858_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1486,7 +1487,7 @@ static int ov8858_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	ov8858_set_fmt(sd, sd_state, &fmt);
+	ov8858_set_fmt(sd, NULL, sd_state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index a8586df14f77..35871264fc96 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2668,6 +2668,7 @@ static void ov8865_mbus_format_fill(struct v4l2_mbus_framefmt *mbus_format,
 }
 
 static int ov8865_get_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2689,6 +2690,7 @@ static int ov8865_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov8865_set_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2797,6 +2799,7 @@ __ov8865_get_pad_crop(struct ov8865_sensor *sensor,
 }
 
 static int ov8865_get_selection(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 5b6f897a74fc..f190ca0a3b73 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -761,6 +761,7 @@ static void ov9282_fill_pad_format(struct ov9282 *ov9282,
 }
 
 static int ov9282_get_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -780,6 +781,7 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int ov9282_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -826,7 +828,7 @@ static int ov9282_init_state(struct v4l2_subdev *sd,
 	ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE],
 			       ov9282->code, &fmt);
 
-	return ov9282_set_pad_format(sd, sd_state, &fmt);
+	return ov9282_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 static const struct v4l2_rect *
@@ -845,6 +847,7 @@ __ov9282_get_pad_crop(struct ov9282 *ov9282,
 }
 
 static int ov9282_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 2190c52b1433..12c430b5dc80 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -519,6 +519,7 @@ static int ov9640_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov9640_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -563,6 +564,7 @@ static int ov9640_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov9640_get_selection(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index c94e8fe29f22..4f7e9cf47f1d 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1181,6 +1181,7 @@ static int ov965x_set_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov965x_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1226,6 +1227,7 @@ static void __ov965x_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int ov965x_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 0eaf33807fc9..ea7ea871f7fb 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -681,6 +681,7 @@ static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int ov9734_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -722,6 +723,7 @@ static int ov9734_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov9734_get_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 52e8e2620b4d..51dc3a2bf4e3 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -415,6 +415,7 @@ static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int rdacm20_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462708c7..433227548371 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -294,6 +294,7 @@ static int rdacm21_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int rdacm21_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index e95342d706c3..99069d655631 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -541,6 +541,7 @@ static int rj54n1_sensor_scale(struct v4l2_subdev *sd, s32 *in_w, s32 *in_h,
 			       s32 *out_w, s32 *out_h);
 
 static int rj54n1_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -578,6 +579,7 @@ static int rj54n1_set_selection(struct v4l2_subdev *sd,
 }
 
 static int rj54n1_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -603,6 +605,7 @@ static int rj54n1_get_selection(struct v4l2_subdev *sd,
 }
 
 static int rj54n1_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -973,6 +976,7 @@ static int rj54n1_reg_init(struct i2c_client *client)
 }
 
 static int rj54n1_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index ab31ee2b596b..e81ffe3571d3 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -995,6 +995,7 @@ static int s5c73m3_oif_get_pad_code(int pad, int index)
 }
 
 static int s5c73m3_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1030,6 +1031,7 @@ static int s5c73m3_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1069,6 +1071,7 @@ static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1108,6 +1111,7 @@ static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/s5k3m5.c b/drivers/media/i2c/s5k3m5.c
index c591b580d2e7..bdf5bea78685 100644
--- a/drivers/media/i2c/s5k3m5.c
+++ b/drivers/media/i2c/s5k3m5.c
@@ -958,6 +958,7 @@ static void s5k3m5_update_pad_format(struct s5k3m5 *s5k3m5,
 }
 
 static int s5k3m5_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -1038,6 +1039,7 @@ static int s5k3m5_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int s5k3m5_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1075,7 +1077,7 @@ static int s5k3m5_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	s5k3m5_set_pad_format(sd, state, &fmt);
+	s5k3m5_set_pad_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index a580b7e63302..2b786829effd 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1276,6 +1276,7 @@ static int s5k5baf_try_isp_format(struct v4l2_mbus_framefmt *mf)
 }
 
 static int s5k5baf_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1307,6 +1308,7 @@ static int s5k5baf_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5k5baf_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1370,6 +1372,7 @@ static int s5k5baf_is_bound_target(u32 target)
 }
 
 static int s5k5baf_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index ba6477e88da3..eebe1bfa3897 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -131,6 +131,7 @@ static struct v4l2_mbus_framefmt *__s5k6a3_get_format(
 }
 
 static int s5k6a3_set_fmt(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
@@ -149,6 +150,7 @@ static int s5k6a3_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5k6a3_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/s5kjn1.c b/drivers/media/i2c/s5kjn1.c
index a707cb740556..80d713ba3a1e 100644
--- a/drivers/media/i2c/s5kjn1.c
+++ b/drivers/media/i2c/s5kjn1.c
@@ -985,6 +985,7 @@ static void s5kjn1_update_pad_format(struct s5kjn1 *s5kjn1,
 }
 
 static int s5kjn1_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -1065,6 +1066,7 @@ static int s5kjn1_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int s5kjn1_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1102,7 +1104,7 @@ static int s5kjn1_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	s5kjn1_set_pad_format(sd, state, &fmt);
+	s5kjn1_set_pad_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 1c0031ba43b4..cb3c0b877f46 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -543,6 +543,7 @@ static int saa6752hs_init(struct v4l2_subdev *sd, u32 leading_null_bytes)
 }
 
 static int saa6752hs_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -563,6 +564,7 @@ static int saa6752hs_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 48d6730d9271..1eaa28d21364 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1159,6 +1159,7 @@ static int saa711x_s_sliced_fmt(struct v4l2_subdev *sd, struct v4l2_sliced_vbi_f
 }
 
 static int saa711x_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index 713331be947c..65f8dccb8c59 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -980,6 +980,7 @@ static int saa717x_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_regi
 #endif
 
 static int saa717x_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 4675181af5fb..f9eabd9632d3 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -597,6 +597,7 @@ static int mipid02_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipid02_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
index 746548868bb0..3c07319015ec 100644
--- a/drivers/media/i2c/t4ka3.c
+++ b/drivers/media/i2c/t4ka3.c
@@ -364,6 +364,7 @@ static void t4ka3_get_vblank_limits(struct t4ka3_data *sensor,
 }
 
 static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *format)
 {
@@ -627,6 +628,7 @@ static int t4ka3_disable_stream(struct v4l2_subdev *sd,
 }
 
 static int t4ka3_get_selection(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_selection *sel)
 {
@@ -652,6 +654,7 @@ static int t4ka3_get_selection(struct v4l2_subdev *sd,
 }
 
 static int t4ka3_set_selection(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 59f509aa1939..f36632cba2f5 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1797,6 +1797,7 @@ static u32 tc358743_g_colorspace(u32 code)
 }
 
 static int tc358743_get_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -1816,6 +1817,7 @@ static int tc358743_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int tc358743_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 86d9ba3ea4e5..b088e8d32aff 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -873,6 +873,7 @@ static int tc358746_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int tc358746_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -881,7 +882,7 @@ static int tc358746_set_fmt(struct v4l2_subdev *sd,
 
 	/* Source follows the sink */
 	if (format->pad == TC358746_SOURCE)
-		return v4l2_subdev_get_fmt(sd, sd_state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, sd_state, format);
 
 	sink_fmt = v4l2_subdev_state_get_format(sd_state, TC358746_SINK);
 
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 5c6dda5338f5..f36e63eada06 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1776,6 +1776,7 @@ static void tda1997x_fill_format(struct tda1997x_state *state,
 }
 
 static int tda1997x_get_format(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
@@ -1798,6 +1799,7 @@ static int tda1997x_get_format(struct v4l2_subdev *sd,
 }
 
 static int tda1997x_set_format(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 775cfba188d8..f1c7f149c06c 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -729,6 +729,7 @@ static int thp7312_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int thp7312_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index 7af8f37646d6..8d660d35bda2 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -856,6 +856,7 @@ static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
@@ -880,6 +881,7 @@ static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int tvp514x_set_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e3675c744d9e..0237aaabf3df 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1045,6 +1045,7 @@ tvp5150_get_pad_crop(struct tvp5150 *decoder,
 }
 
 static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -1104,6 +1105,7 @@ static void tvp5150_set_hw_selection(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1156,6 +1158,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index c09a5bd71fd0..912ab5a1a53b 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -830,6 +830,7 @@ tvp7002_enum_mbus_code(struct v4l2_subdev *sd,
  */
 static int
 tvp7002_get_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
@@ -854,10 +855,11 @@ tvp7002_get_pad_format(struct v4l2_subdev *sd,
  */
 static int
 tvp7002_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
-	return tvp7002_get_pad_format(sd, sd_state, fmt);
+	return tvp7002_get_pad_format(sd, NULL, sd_state, fmt);
 }
 
 /* V4L2 core operation handlers */
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 53efdeaed1db..8aa5c7aeeb75 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -184,6 +184,7 @@ static void tw9900_fill_fmt(const struct tw9900_mode *mode,
 }
 
 static int tw9900_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -198,6 +199,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int tw9900_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index f3e400304e04..ea30f1b88951 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -715,6 +715,7 @@ static int tw9910_set_frame(struct v4l2_subdev *sd, u32 *width, u32 *height)
 }
 
 static int tw9910_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -741,6 +742,7 @@ static int tw9910_get_selection(struct v4l2_subdev *sd,
 }
 
 static int tw9910_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -792,6 +794,7 @@ static int tw9910_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int tw9910_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 78d18c028154..513d2262b401 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1217,6 +1217,7 @@ static int vd55g1_patch(struct vd55g1 *sensor)
 }
 
 static int vd55g1_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1300,6 +1301,7 @@ static int vd55g1_new_format_change_controls(struct vd55g1 *sensor,
 }
 
 static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *sd_fmt)
 {
@@ -1365,7 +1367,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
 			      &fmt.format);
 
-	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
+	return vd55g1_set_pad_fmt(sd, NULL, sd_state, &fmt);
 }
 
 static int vd55g1_enum_frame_size(struct v4l2_subdev *sd,
diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
index 157acea9e286..ca0dd1b24072 100644
--- a/drivers/media/i2c/vd56g3.c
+++ b/drivers/media/i2c/vd56g3.c
@@ -823,6 +823,7 @@ static void vd56g3_update_img_pad_format(struct vd56g3 *sensor,
 }
 
 static int vd56g3_set_pad_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *sd_fmt)
 {
@@ -858,6 +859,7 @@ static int vd56g3_set_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int vd56g3_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1038,7 +1040,7 @@ static int vd56g3_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	return vd56g3_set_pad_fmt(sd, sd_state, &fmt);
+	return vd56g3_set_pad_fmt(sd, NULL, sd_state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops vd56g3_video_ops = {
diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 3fb2166c81ef..5f85bea840b3 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -652,6 +652,7 @@ static int vgxy61_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int vgxy61_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -687,6 +688,7 @@ static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vgxy61_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1197,6 +1199,7 @@ static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int vgxy61_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1260,7 +1263,7 @@ static int vgxy61_init_state(struct v4l2_subdev *sd,
 	vgxy61_fill_framefmt(sensor, sensor->current_mode, &fmt.format,
 			     VGXY61_MEDIA_BUS_FMT_DEF);
 
-	return vgxy61_set_fmt(sd, sd_state, &fmt);
+	return vgxy61_set_fmt(sd, NULL, sd_state, &fmt);
 }
 
 static int vgxy61_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 9b9f69ff4016..2053849c9b4c 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -525,8 +525,8 @@ static int cobalt_subdevs_init(struct cobalt *cobalt)
 				&cobalt_edid);
 		if (err)
 			return err;
-		err = v4l2_subdev_call(s[i].sd, pad, set_fmt, NULL,
-				&sd_fmt);
+		err = v4l2_subdev_call(s[i].sd, pad, set_fmt, NULL, NULL,
+				       &sd_fmt);
 		if (err)
 			return err;
 		/* Reset channel video module */
@@ -609,8 +609,8 @@ static int cobalt_subdevs_hsma_init(struct cobalt *cobalt)
 
 		if (err)
 			return err;
-		err = v4l2_subdev_call(s->sd, pad, set_fmt, NULL,
-				&sd_fmt);
+		err = v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL,
+				       &sd_fmt);
 		if (err)
 			return err;
 		cobalt->have_hsma_rx = true;
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 51fd9576c6c2..bca8cc6cd4f7 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -172,7 +172,7 @@ static void cobalt_enable_output(struct cobalt_stream *s)
 		sd_fmt.format.code = MEDIA_BUS_FMT_RGB888_1X24;
 		break;
 	}
-	v4l2_subdev_call(s->sd, pad, set_fmt, NULL, &sd_fmt);
+	v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL, &sd_fmt);
 
 	iowrite32(0, &vo->control);
 	/* 1080p60 */
@@ -223,14 +223,14 @@ static void cobalt_enable_input(struct cobalt_stream *s)
 		iowrite32(M00235_CONTROL_BITMAP_ENABLE_MSK |
 			  (1 << M00235_CONTROL_BITMAP_PACK_FORMAT_OFST),
 			  &packer->control);
-		v4l2_subdev_call(s->sd, pad, set_fmt, NULL,
+		v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL,
 				 &sd_fmt_yuyv);
 		break;
 	case V4L2_PIX_FMT_RGB24:
 		iowrite32(M00235_CONTROL_BITMAP_ENABLE_MSK |
 			  (2 << M00235_CONTROL_BITMAP_PACK_FORMAT_OFST),
 			  &packer->control);
-		v4l2_subdev_call(s->sd, pad, set_fmt, NULL,
+		v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL,
 				 &sd_fmt_rgb);
 		break;
 	case V4L2_PIX_FMT_BGR32:
@@ -238,7 +238,7 @@ static void cobalt_enable_input(struct cobalt_stream *s)
 			  M00235_CONTROL_BITMAP_ENDIAN_FORMAT_MSK |
 			  (3 << M00235_CONTROL_BITMAP_PACK_FORMAT_OFST),
 			  &packer->control);
-		v4l2_subdev_call(s->sd, pad, set_fmt, NULL,
+		v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL,
 				 &sd_fmt_rgb);
 		break;
 	}
@@ -716,7 +716,7 @@ static int cobalt_g_fmt_vid_cap(struct file *file, void *priv,
 			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
-		v4l2_subdev_call(s->sd, pad, get_fmt, NULL, &sd_fmt);
+		v4l2_subdev_call(s->sd, pad, get_fmt, NULL, NULL, &sd_fmt);
 		v4l2_fill_pix_format(pix, &sd_fmt.format);
 	}
 
@@ -760,7 +760,7 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
 			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
-		v4l2_subdev_call(s->sd, pad, get_fmt, NULL, &sd_fmt);
+		v4l2_subdev_call(s->sd, pad, get_fmt, NULL, NULL, &sd_fmt);
 		v4l2_fill_pix_format(pix, &sd_fmt.format);
 	}
 
@@ -938,7 +938,7 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv,
 	s->ycbcr_enc = pix->ycbcr_enc;
 	s->quantization = pix->quantization;
 	v4l2_fill_mbus_format(&sd_fmt.format, pix, code);
-	v4l2_subdev_call(s->sd, pad, set_fmt, NULL, &sd_fmt);
+	v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL, &sd_fmt);
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index 4fb19d26ee29..f5961853eeae 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -930,6 +930,7 @@ static int cx18_av_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int cx18_av_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/pci/cx18/cx18-controls.c b/drivers/media/pci/cx18/cx18-controls.c
index 78eadad8b6e8..41f388ba22ab 100644
--- a/drivers/media/pci/cx18/cx18-controls.c
+++ b/drivers/media/pci/cx18/cx18-controls.c
@@ -85,7 +85,7 @@ static int cx18_s_video_encoding(struct cx2341x_handler *cxhdl, u32 val)
 	fmt->width = cxhdl->width / (is_mpeg1 ? 2 : 1);
 	fmt->height = cxhdl->height;
 	fmt->code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, NULL, &format);
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 0d676a57e24e..6f8d7f700016 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -150,7 +150,7 @@ static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 	format.format.width = cx->cxhdl.width = w;
 	format.format.height = cx->cxhdl.height = h;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, NULL, &format);
 	return cx18_g_fmt_vid_cap(file, fh, fmt);
 }
 
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 14d219fd1d8a..94ce00154e1f 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -134,7 +134,7 @@ int cx23885_set_tvnorm(struct cx23885_dev *dev, v4l2_std_id norm)
 	format.format.width = dev->width;
 	format.format.height = dev->height;
 	format.format.field = dev->field;
-	call_all(dev, pad, set_fmt, NULL, &format);
+	call_all(dev, pad, set_fmt, NULL, NULL, &format);
 
 	return 0;
 }
@@ -619,7 +619,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	dprintk(2, "%s() width=%d height=%d field=%d\n", __func__,
 		dev->width, dev->height, dev->field);
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
-	call_all(dev, pad, set_fmt, NULL, &format);
+	call_all(dev, pad, set_fmt, NULL, NULL, &format);
 	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
 	/* set_fmt overwrites f->fmt.pix.field, restore it */
 	f->fmt.pix.field = dev->field;
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 986b9afd7cb5..8b3f4d732fd7 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1229,6 +1229,7 @@ static int cio2_subdev_init_state(struct v4l2_subdev *sd,
 }
 
 static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -1241,7 +1242,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	 * source always propagates from sink
 	 */
 	if (fmt->pad == CIO2_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+		return v4l2_subdev_get_fmt(sd, NULL, sd_state, fmt);
 
 	fmt->format.code = formats[0].mbus_code;
 
@@ -1287,7 +1288,7 @@ static int cio2_subdev_link_validate_get_format(struct media_pad *pad,
 		memset(fmt, 0, sizeof(*fmt));
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
-		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
+		return v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, fmt);
 	}
 
 	return -EINVAL;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6c92..f64d8d9a6281 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -403,6 +403,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_selection *sel)
 {
@@ -454,6 +455,7 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
 }
 
 static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index dbd6f76a066d..5dacc0a2aa9f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -160,6 +160,7 @@ u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y)
 }
 
 int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
@@ -174,7 +175,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 	/* No transcoding, source and sink formats must match. */
 	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
 	    sd->entity.num_pads > 1)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	format->format.width = clamp(format->format.width, IPU6_ISYS_MIN_WIDTH,
 				     IPU6_ISYS_MAX_WIDTH);
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index c2917e156345..f1dcf498cae7 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -338,6 +338,7 @@ static int mei_csi_init_state(struct v4l2_subdev *sd,
 }
 
 static int mei_csi_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/pci/ivtv/ivtv-controls.c b/drivers/media/pci/ivtv/ivtv-controls.c
index f087a12c4ebd..816e634de1eb 100644
--- a/drivers/media/pci/ivtv/ivtv-controls.c
+++ b/drivers/media/pci/ivtv/ivtv-controls.c
@@ -60,7 +60,7 @@ static int ivtv_s_video_encoding(struct cx2341x_handler *cxhdl, u32 val)
 	format.format.width = cxhdl->width / (is_mpeg1 ? 2 : 1);
 	format.format.height = cxhdl->height;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, NULL, &format);
 	return 0;
 }
 
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 8d5ea3aec06f..9eaaa4087b2a 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -591,7 +591,7 @@ static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 	format.format.width = fmt->fmt.pix.width;
 	format.format.height = h;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, NULL, &format);
 	return ivtv_g_fmt_vid_cap(file, fh, fmt);
 }
 
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 8c4f70e4177d..e851dd06416d 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -103,7 +103,7 @@ static int empress_g_fmt_vid_cap(struct file *file, void *priv,
 	};
 	struct v4l2_mbus_framefmt *mbus_fmt = &fmt.format;
 
-	saa_call_all(dev, pad, get_fmt, NULL, &fmt);
+	saa_call_all(dev, pad, get_fmt, NULL, NULL, &fmt);
 
 	v4l2_fill_pix_format(&f->fmt.pix, mbus_fmt);
 	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
@@ -122,7 +122,7 @@ static int empress_s_fmt_vid_cap(struct file *file, void *priv,
 	};
 
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
-	saa_call_all(dev, pad, set_fmt, NULL, &format);
+	saa_call_all(dev, pad, set_fmt, NULL, NULL, &format);
 	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
 
 	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
@@ -145,7 +145,7 @@ static int empress_try_fmt_vid_cap(struct file *file, void *priv,
 	};
 
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
-	saa_call_all(dev, pad, set_fmt, &pad_state, &format);
+	saa_call_all(dev, pad, set_fmt, NULL, &pad_state, &format);
 	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
 
 	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
index 11d85f5342f0..41ae490d628c 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
@@ -517,7 +517,7 @@ static int c3_isp_cap_link_validate(struct media_link *link)
 	};
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &src_fmt);
+	ret = v4l2_subdev_call_ci_state_active(sd, pad, get_fmt, &src_fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
index ff6413fff889..553c808f8f3b 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
@@ -461,6 +461,7 @@ static void c3_isp_core_set_source_fmt(struct v4l2_subdev_state *state,
 }
 
 static int c3_isp_core_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
index 453a889e0b27..1f9c16eb0842 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
@@ -621,6 +621,7 @@ static void c3_isp_rsz_set_source_fmt(struct v4l2_subdev_state *state,
 }
 
 static int c3_isp_rsz_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_format *format)
 {
@@ -633,6 +634,7 @@ static int c3_isp_rsz_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int c3_isp_rsz_get_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -674,6 +676,7 @@ static int c3_isp_rsz_get_selection(struct v4l2_subdev *sd,
 }
 
 static int c3_isp_rsz_set_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
index 4bd98fb9c7e9..4c6ea03c9c38 100644
--- a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
+++ b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
@@ -521,6 +521,7 @@ static int c3_mipi_adap_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
@@ -528,7 +529,7 @@ static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
 	const struct c3_adap_pix_format *pix_format;
 
 	if (format->pad != C3_MIPI_ADAP_PAD_SINK)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	pix_format = c3_mipi_adap_find_format(format->format.code);
 	if (!pix_format)
diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index b9e4ef3fc308..923f65648629 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -491,6 +491,7 @@ static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
@@ -498,7 +499,7 @@ static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	unsigned int i;
 
 	if (format->pad != C3_MIPI_CSI2_PAD_SINK)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	fmt = v4l2_subdev_state_get_format(state, format->pad);
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index 7aaa5c3f7354..efdc69cedcb1 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -291,7 +291,7 @@ static int mali_c55_link_validate(struct media_link *link)
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 4c0fd1ec741c..ea7a5248c954 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -203,6 +203,7 @@ static int mali_c55_isp_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
@@ -217,7 +218,7 @@ static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
 	 * format.
 	 */
 	if (format->pad != MALI_C55_ISP_PAD_SINK_VIDEO)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	sink_fmt = v4l2_subdev_state_get_format(state,
 						MALI_C55_ISP_PAD_SINK_VIDEO);
@@ -265,6 +266,7 @@ static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_isp_get_selection(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_selection *sel)
 {
@@ -278,6 +280,7 @@ static int mali_c55_isp_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_isp_set_selection(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
index a8d739af74b6..3ac117b59483 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -715,6 +715,7 @@ static int mali_c55_rsz_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_rsz_set_sink_fmt(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *state,
 				     struct v4l2_subdev_format *format)
 {
@@ -773,6 +774,7 @@ static int mali_c55_rsz_set_sink_fmt(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_rsz_set_source_fmt(struct v4l2_subdev *sd,
+				       const struct v4l2_subdev_client_info *ci,
 				       struct v4l2_subdev_state *state,
 				       struct v4l2_subdev_format *format)
 {
@@ -812,6 +814,7 @@ static int mali_c55_rsz_set_source_fmt(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_rsz_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
@@ -826,12 +829,13 @@ static int mali_c55_rsz_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->pad == MALI_C55_RSZ_SINK_PAD ||
 	    format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
-		return mali_c55_rsz_set_sink_fmt(sd, state, format);
+		return mali_c55_rsz_set_sink_fmt(sd, NULL, state, format);
 
-	return mali_c55_rsz_set_source_fmt(sd, state, format);
+	return mali_c55_rsz_set_source_fmt(sd, NULL, state, format);
 }
 
 static int mali_c55_rsz_get_selection(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_selection *sel)
 {
@@ -850,6 +854,7 @@ static int mali_c55_rsz_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_rsz_set_crop(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -908,6 +913,7 @@ static int mali_c55_rsz_set_crop(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_rsz_set_compose(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -956,6 +962,7 @@ static int mali_c55_rsz_set_compose(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_rsz_set_selection(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_selection *sel)
 {
@@ -963,10 +970,10 @@ static int mali_c55_rsz_set_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->target == V4L2_SEL_TGT_CROP)
-		return mali_c55_rsz_set_crop(sd, state, sel);
+		return mali_c55_rsz_set_crop(sd, NULL, state, sel);
 
 	if (sel->target == V4L2_SEL_TGT_COMPOSE)
-		return mali_c55_rsz_set_compose(sd, state, sel);
+		return mali_c55_rsz_set_compose(sd, NULL, state, sel);
 
 	return -EINVAL;
 }
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
index 1af5d2759a83..22d58d8dfdbb 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
@@ -180,6 +180,7 @@ static int mali_c55_tpg_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_tpg_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index a05a744cbb75..f5e85271a275 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -609,7 +609,7 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
 
 	isi_try_fse(isi, isi_fmt, &pad_state);
 
-	ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt,
+	ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt, NULL,
 			       &pad_state, &format);
 	if (ret < 0)
 		return ret;
@@ -641,7 +641,7 @@ static int isi_set_fmt(struct atmel_isi *isi, struct v4l2_format *f)
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix,
 			      current_fmt->mbus_code);
 	ret = v4l2_subdev_call(isi->entity.subdev, pad,
-			       set_fmt, NULL, &format);
+			       set_fmt, NULL, NULL, &format);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..38afdf5a32ba 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1327,6 +1327,7 @@ static int unicam_subdev_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int unicam_subdev_set_format(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
@@ -1342,7 +1343,7 @@ static int unicam_subdev_set_format(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (unicam_sd_pad_is_source(format->pad))
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	/*
 	 * Allowed formats for the stream on the sink pad depend on what source
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cde690c6fdee..6b894d5df29e 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -276,7 +276,7 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 	s64 link_freq;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
+	ret = v4l2_subdev_call_ci_state_active(&csi2rx->subdev, pad, get_fmt,
 					    &sd_fmt);
 	if (ret < 0)
 		return ret;
@@ -532,6 +532,7 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
@@ -540,7 +541,7 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad != CSI2RX_PAD_SINK)
-		return v4l2_subdev_get_fmt(subdev, state, format);
+		return v4l2_subdev_get_fmt(subdev, NULL, state, format);
 
 	if (!csi2rx_get_fmt_by_code(format->format.code))
 		format->format.code = formats[0].code;
@@ -577,7 +578,7 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
 		},
 	};
 
-	return csi2rx_set_fmt(subdev, state, &format);
+	return csi2rx_set_fmt(subdev, NULL, state, &format);
 }
 
 int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 629b0fa838a2..357deed9ff07 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -170,6 +170,7 @@ static int csi2tx_enum_mbus_code(struct v4l2_subdev *subdev,
 
 static struct v4l2_mbus_framefmt *
 __csi2tx_get_pad_format(struct v4l2_subdev *subdev,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *fmt)
 {
@@ -182,6 +183,7 @@ __csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -191,7 +193,7 @@ static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 	if (fmt->pad == CSI2TX_PAD_SOURCE)
 		return -EINVAL;
 
-	format = __csi2tx_get_pad_format(subdev, sd_state, fmt);
+	format = __csi2tx_get_pad_format(subdev, NULL, sd_state, fmt);
 	if (!format)
 		return -EINVAL;
 
@@ -201,6 +203,7 @@ static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int csi2tx_set_pad_format(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -214,7 +217,7 @@ static int csi2tx_set_pad_format(struct v4l2_subdev *subdev,
 	if (!csi2tx_get_fmt_from_mbus(fmt->format.code))
 		src_format = &fmt_default;
 
-	dst_format = __csi2tx_get_pad_format(subdev, sd_state, fmt);
+	dst_format = __csi2tx_get_pad_format(subdev, NULL, sd_state, fmt);
 	if (!dst_format)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 2269d852ab0e..9e1fdd963b55 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1819,7 +1819,7 @@ static int pxac_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 			      pixfmt == V4L2_PIX_FMT_YUV422P ? 4 : 0);
 
 	v4l2_fill_mbus_format(mf, pix, xlate->code);
-	ret = sensor_call(pcdev, pad, set_fmt, &pad_state, &format);
+	ret = sensor_call(pcdev, pad, set_fmt, NULL, &pad_state, &format);
 	if (ret < 0)
 		return ret;
 
@@ -1882,7 +1882,7 @@ static int pxac_vidioc_s_fmt_vid_cap(struct file *filp, void *priv,
 	xlate = pxa_mbus_xlate_by_fourcc(pcdev->user_formats,
 					 pix->pixelformat);
 	v4l2_fill_mbus_format(&format.format, pix, xlate->code);
-	ret = sensor_call(pcdev, pad, set_fmt, NULL, &format);
+	ret = sensor_call(pcdev, pad, set_fmt, NULL, NULL, &format);
 	if (ret < 0) {
 		dev_warn(pcdev_to_dev(pcdev),
 			 "Failed to configure for format %x\n",
@@ -2091,7 +2091,7 @@ static int pxa_camera_sensor_bound(struct v4l2_async_notifier *notifier,
 	if (err)
 		goto out;
 
-	err = sensor_call(pcdev, pad, set_fmt, NULL, &format);
+	err = sensor_call(pcdev, pad, set_fmt, NULL, NULL, &format);
 	if (err)
 		goto out_sensor_poweroff;
 
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index b8360d37000a..227fbecd8488 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1022,7 +1022,7 @@ static int mcam_cam_configure(struct mcam_camera *cam)
 	v4l2_fill_mbus_format(&format.format, &cam->pix_format, cam->mbus_code);
 	ret = sensor_call(cam, core, init, 0);
 	if (ret == 0)
-		ret = sensor_call(cam, pad, set_fmt, NULL, &format);
+		ret = sensor_call(cam, pad, set_fmt, NULL, NULL, &format);
 	/*
 	 * OV7670 does weird things if flip is set *before* format...
 	 */
@@ -1362,7 +1362,7 @@ static int mcam_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	f = mcam_find_format(pix->pixelformat);
 	pix->pixelformat = f->pixelformat;
 	v4l2_fill_mbus_format(&format.format, pix, f->mbus_code);
-	ret = sensor_call(cam, pad, set_fmt, &pad_state, &format);
+	ret = sensor_call(cam, pad, set_fmt, NULL, &pad_state, &format);
 	v4l2_fill_pix_format(pix, &format.format);
 	pix->bytesperline = pix->width * f->bpp;
 	switch (f->pixelformat) {
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index 70303a0b6919..4d826612d04e 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -225,6 +225,7 @@ static int csi2dc_enum_mbus_code(struct v4l2_subdev *csi2dc_sd,
 }
 
 static int csi2dc_get_fmt(struct v4l2_subdev *csi2dc_sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -245,6 +246,7 @@ static int csi2dc_get_fmt(struct v4l2_subdev *csi2dc_sd,
 }
 
 static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *req_fmt)
 {
diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda7..f4570799a139 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -916,6 +916,7 @@ static int isc_link_validate(struct media_link *link)
 
 	/* Get current format from subdev */
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, get_fmt, NULL,
+			       NULL,
 			       &format);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/microchip/microchip-isc-scaler.c b/drivers/media/platform/microchip/microchip-isc-scaler.c
index e83463543e21..6f8f2e63e971 100644
--- a/drivers/media/platform/microchip/microchip-isc-scaler.c
+++ b/drivers/media/platform/microchip/microchip-isc-scaler.c
@@ -26,6 +26,7 @@ static void isc_scaler_prepare_fmt(struct v4l2_mbus_framefmt *framefmt)
 };
 
 static int isc_scaler_get_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -46,6 +47,7 @@ static int isc_scaler_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int isc_scaler_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *req_fmt)
 {
@@ -124,6 +126,7 @@ static int isc_scaler_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int isc_scaler_g_sel(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 5f9691d76434..1868b74f3fec 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1104,6 +1104,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *sdformat)
 {
@@ -1116,7 +1117,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	 * modified.
 	 */
 	if (sdformat->pad == CSIS_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, sdformat);
+		return v4l2_subdev_get_fmt(sd, NULL, state, sdformat);
 
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
@@ -1225,7 +1226,7 @@ static int mipi_csis_init_state(struct v4l2_subdev *sd,
 		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
 					      fmt.format.ycbcr_enc);
 
-	return mipi_csis_set_fmt(sd, state, &fmt);
+	return mipi_csis_set_fmt(sd, NULL, state, &fmt);
 }
 
 static int mipi_csis_log_status(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 7ddc7ba06e3d..f477fdcb39f1 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1412,7 +1412,7 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	int ret;
 
 	/* Retrieve the media bus format on the source subdev. */
-	ret = v4l2_subdev_call_state_active(&csi->sd, pad, get_fmt, &fmt_src);
+	ret = v4l2_subdev_call_ci_state_active(&csi->sd, pad, get_fmt, &fmt_src);
 	if (ret)
 		return ret;
 
@@ -1890,6 +1890,7 @@ static void imx7_csi_try_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..a3f6a75e1677 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -248,6 +248,7 @@ static int mxc_isi_crossbar_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -264,7 +265,7 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
 	 * can't be modified.
 	 */
 	if (fmt->pad >= xbar->num_sinks)
-		return v4l2_subdev_get_fmt(sd, state, fmt);
+		return v4l2_subdev_get_fmt(sd, NULL, state, fmt);
 
 	/* Validate the requested format. */
 	if (!mxc_isi_bus_format_by_code(fmt->format.code, MXC_ISI_PIPE_PAD_SINK))
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..423077d7eeea 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -448,6 +448,7 @@ static int mxc_isi_pipe_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mxc_isi_pipe_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *fmt)
 {
@@ -543,6 +544,7 @@ static int mxc_isi_pipe_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int mxc_isi_pipe_get_selection(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_selection *sel)
 {
@@ -602,6 +604,7 @@ static int mxc_isi_pipe_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 04ebed8a0493..6da5b4a1af13 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -597,6 +597,7 @@ static int imx8mq_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
@@ -608,7 +609,7 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	 * modified.
 	 */
 	if (sdformat->pad == MIPI_CSI2_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+		return v4l2_subdev_get_fmt(sd, NULL, sd_state, sdformat);
 
 	if (sdformat->pad != MIPI_CSI2_PAD_SINK)
 		return -EINVAL;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index ed1820488c98..d13019a9491b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -961,6 +961,7 @@ static int csid_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_get_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -985,6 +986,7 @@ static int csid_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1034,7 +1036,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return csid_set_format(sd, fh ? fh->state : NULL, &format);
+	return csid_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f414..cd2e94e9bcdc 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -479,6 +479,7 @@ static int csiphy_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csiphy_get_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -503,6 +504,7 @@ static int csiphy_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csiphy_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -555,7 +557,7 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
 		}
 	};
 
-	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
+	return csiphy_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 static bool csiphy_match_clock_name(const char *clock_name, const char *format,
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index aaf3caa42d33..9e655b58f7b3 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1013,6 +1013,7 @@ static int ispif_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int ispif_get_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
@@ -1037,6 +1038,7 @@ static int ispif_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int ispif_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
@@ -1085,7 +1087,7 @@ static int ispif_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return ispif_set_format(sd, fh ? fh->state : NULL, &format);
+	return ispif_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5baf0e3d4bc4..89ebecb3c191 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1545,6 +1545,7 @@ static int vfe_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_get_format(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1561,6 +1562,7 @@ static int vfe_get_format(struct v4l2_subdev *sd,
 }
 
 static int vfe_set_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel);
 
@@ -1573,6 +1575,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_set_format(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1607,7 +1610,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
 		sel.target = V4L2_SEL_TGT_COMPOSE;
 		sel.r.width = fmt->format.width;
 		sel.r.height = fmt->format.height;
-		ret = vfe_set_selection(sd, sd_state, &sel);
+		ret = vfe_set_selection(sd, NULL, sd_state, &sel);
 		if (ret < 0)
 			return ret;
 	}
@@ -1624,6 +1627,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_get_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -1640,7 +1644,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 			fmt.pad = sel->pad;
 			fmt.which = sel->which;
-			ret = vfe_get_format(sd, sd_state, &fmt);
+			ret = vfe_get_format(sd, NULL, sd_state, &fmt);
 			if (ret < 0)
 				return ret;
 
@@ -1694,6 +1698,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_set_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -1720,7 +1725,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 		crop.pad = MSM_VFE_PAD_SRC;
 		crop.target = V4L2_SEL_TGT_CROP;
 		crop.r = *rect;
-		ret = vfe_set_selection(sd, sd_state, &crop);
+		ret = vfe_set_selection(sd, NULL, sd_state, &crop);
 	} else if (sel->target == V4L2_SEL_TGT_CROP &&
 		sel->pad == MSM_VFE_PAD_SRC) {
 		struct v4l2_subdev_format fmt = { 0 };
@@ -1735,13 +1740,13 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 		/* Reset source pad format width and height */
 		fmt.which = sel->which;
 		fmt.pad = MSM_VFE_PAD_SRC;
-		ret = vfe_get_format(sd, sd_state, &fmt);
+		ret = vfe_get_format(sd, NULL, sd_state, &fmt);
 		if (ret < 0)
 			return ret;
 
 		fmt.format.width = rect->width;
 		fmt.format.height = rect->height;
-		ret = vfe_set_format(sd, sd_state, &fmt);
+		ret = vfe_set_format(sd, NULL, sd_state, &fmt);
 	} else {
 		ret = -EINVAL;
 	}
@@ -1771,7 +1776,7 @@ static int vfe_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return vfe_set_format(sd, fh ? fh->state : NULL, &format);
+	return vfe_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 831486e14754..931a5f4cfc45 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -96,7 +96,7 @@ static int video_get_subdev_format(struct camss_video *video,
 
 	fmt.pad = pad;
 
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c b/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
index 104908afbf41..66d0dde6d840 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
@@ -404,6 +404,7 @@ static int csi2_init_state(struct v4l2_subdev *sd,
 }
 
 static int csi2_pad_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c b/drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
index 05762b1be2bc..1de48432fcc2 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
@@ -429,6 +429,7 @@ static int pisp_fe_init_state(struct v4l2_subdev *sd,
 }
 
 static int pisp_fe_pad_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
@@ -501,7 +502,7 @@ static int pisp_fe_pad_set_fmt(struct v4l2_subdev *sd,
 	case FE_CONFIG_PAD:
 	case FE_STATS_PAD:
 	default:
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 	}
 }
 
diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..7739cc376096 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1884,6 +1884,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
@@ -1891,7 +1892,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	unsigned int num_pads = rcsi2_num_pads(priv);
 
 	if (format->pad > RCAR_CSI2_SINK)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..6b4720e80797 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -331,13 +331,14 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int risp_set_pad_format(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *framefmt;
 
 	if (format->pad > RCAR_ISP_SINK)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	if (!risp_code_to_fmt(format->format.code))
 		format->format.code = rcar_isp_formats[0].code;
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 9d45e11898c1..d73ff64e97c6 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -360,7 +360,7 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
 	index = pad->index;
 
 	fmt.pad = index;
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 65f7659a9e02..47b9e4753301 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -841,12 +841,13 @@ static int __ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt
 	 * time.
 	 */
 	sd_format.format.code = mbus_code;
-	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_state, &sd_format);
+	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &pad_state,
+			       &sd_format);
 	if (ret) {
 		if (ret == -EINVAL) {
 			/* fallback */
 			sd_format.format.code = mbus_code_old;
-			ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt,
+			ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL,
 					       &pad_state, &sd_format);
 		}
 
@@ -900,7 +901,7 @@ static int ceu_set_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
 
 	format.format.code = mbus_code;
 	v4l2_fill_mbus_format_mplane(&format.format, &v4l2_fmt->fmt.pix_mp);
-	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &format);
+	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, NULL, &format);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 6dc4b53607b4..c17283cba3a6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -633,6 +633,7 @@ static int rzg2l_csi2_post_streamoff(struct v4l2_subdev *sd)
 }
 
 static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -687,7 +688,7 @@ static int rzg2l_csi2_init_state(struct v4l2_subdev *sd,
 	fmt.format.quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt.format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
-	return rzg2l_csi2_set_format(sd, sd_state, &fmt);
+	return rzg2l_csi2_set_format(sd, NULL, sd_state, &fmt);
 }
 
 static int rzg2l_csi2_enum_mbus_code(struct v4l2_subdev *sd,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 5f2c87858bfe..21dd0162fd6e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -200,6 +200,7 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
@@ -300,7 +301,7 @@ static int rzg2l_cru_ip_init_state(struct v4l2_subdev *sd,
 	fmt.format.quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt.format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
-	return rzg2l_cru_ip_set_format(sd, sd_state, &fmt);
+	return rzg2l_cru_ip_set_format(sd, NULL, sd_state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops rzg2l_cru_ip_video_ops = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..eb629368c30d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1121,7 +1121,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
 
 	subdev = media_entity_to_v4l2_subdev(link->source->entity);
 	fmt.pad = link->source->index;
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
 
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
index b1659544eaa0..7a4ffd7fb2e4 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
@@ -157,6 +157,7 @@ static int rzv2h_ivc_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int rzv2h_ivc_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
@@ -164,7 +165,7 @@ static int rzv2h_ivc_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 
 	if (format->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	sink_fmt = v4l2_subdev_state_get_format(state,
 						RZV2H_IVC_SUBDEV_SINK_PAD);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index b1a2c68e9944..a1041affb5d7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -124,6 +124,7 @@ static void brx_try_format(struct vsp1_brx *brx,
 }
 
 static int brx_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -178,6 +179,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 }
 
 static int brx_get_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -212,6 +214,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int brx_set_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 15d266439564..f91e1095b6e6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -87,13 +87,15 @@ static int vsp1_du_insert_uif(struct vsp1_device *vsp1,
 
 	format.pad = prev_pad;
 
-	ret = v4l2_subdev_call(&prev->subdev, pad, get_fmt, NULL, &format);
+	ret = v4l2_subdev_call(&prev->subdev, pad, get_fmt, NULL, NULL,
+			       &format);
 	if (ret < 0)
 		return ret;
 
 	format.pad = UIF_PAD_SINK;
 
-	ret = v4l2_subdev_call(&uif->subdev, pad, set_fmt, NULL, &format);
+	ret = v4l2_subdev_call(&uif->subdev, pad, set_fmt, NULL, NULL,
+			       &format);
 	if (ret < 0)
 		return ret;
 
@@ -140,7 +142,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	format.format.ycbcr_enc = input->ycbcr_enc;
 	format.format.quantization = input->quantization;
 
-	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -155,6 +157,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	sel.r = input->crop;
 
 	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_selection, NULL,
+			       NULL,
 			       &sel);
 	if (ret < 0)
 		return ret;
@@ -170,7 +173,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	 */
 	format.pad = RWPF_PAD_SOURCE;
 
-	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, get_fmt, NULL,
+	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, get_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -182,7 +185,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 
 	format.format.code = MEDIA_BUS_FMT_ARGB8888_1X32;
 
-	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -196,7 +199,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	/* BRx sink, propagate the format from the RPF source. */
 	format.pad = brx_input;
 
-	ret = v4l2_subdev_call(&pipe->brx->subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->brx->subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -210,6 +213,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	sel.r = vsp1->drm->inputs[rpf->entity.index].compose;
 
 	ret = v4l2_subdev_call(&pipe->brx->subdev, pad, set_selection, NULL,
+			       NULL,
 			       &sel);
 	if (ret < 0)
 		return ret;
@@ -345,7 +349,7 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
 	format.format.height = drm_pipe->height;
 	format.format.field = V4L2_FIELD_NONE;
 
-	ret = v4l2_subdev_call(&brx->subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&brx->subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -497,7 +501,8 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 	format.format.code = MEDIA_BUS_FMT_ARGB8888_1X32;
 	format.format.field = V4L2_FIELD_NONE;
 
-	ret = v4l2_subdev_call(&pipe->output->entity.subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->output->entity.subdev, pad, set_fmt,
+			       NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -507,7 +512,8 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 		format.format.code, pipe->output->entity.index);
 
 	format.pad = RWPF_PAD_SOURCE;
-	ret = v4l2_subdev_call(&pipe->output->entity.subdev, pad, get_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->output->entity.subdev, pad, get_fmt,
+			       NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -517,7 +523,7 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 		format.format.code, pipe->output->entity.index);
 
 	format.pad = LIF_PAD_SINK;
-	ret = v4l2_subdev_call(&pipe->lif->subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->lif->subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 1dad9589768c..cb33e364f2a4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -162,6 +162,7 @@ vsp1_entity_get_state(struct vsp1_entity *entity,
  * a direct drop-in for the operation handler.
  */
 int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -387,7 +388,8 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 			       : V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
-		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
+		v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state,
+				 &format);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 3f87a2c9df0e..5f8153430fd3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -189,6 +189,7 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int histo_get_selection(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
@@ -247,6 +248,7 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_crop(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_selection *sel)
 {
@@ -269,6 +271,7 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_compose(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -316,6 +319,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_selection(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
@@ -335,9 +339,9 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 	}
 
 	if (sel->target == V4L2_SEL_TGT_CROP)
-		ret = histo_set_crop(subdev, state, sel);
+		ret = histo_set_crop(subdev, NULL, state, sel);
 	else if (sel->target == V4L2_SEL_TGT_COMPOSE)
-		ret = histo_set_compose(subdev, state, sel);
+		ret = histo_set_compose(subdev, NULL, state, sel);
 	else
 		ret = -EINVAL;
 
@@ -347,6 +351,7 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_format(struct v4l2_subdev *subdev,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 830e124beb7b..fcf656b3ddf9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -109,6 +109,7 @@ static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int hsit_set_format(struct v4l2_subdev *subdev,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index c72518b29f84..4546c6ec5a01 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -110,6 +110,7 @@ static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
@@ -219,6 +220,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
@@ -266,6 +268,7 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 94149da0c900..7dd70e7cbc50 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -210,6 +210,7 @@ static void sru_try_format(struct vsp1_sru *sru,
 }
 
 static int sru_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index dd4722315c56..66e4ca037c0f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -193,6 +193,7 @@ static void uds_try_format(struct vsp1_uds *uds,
 }
 
 static int uds_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index fe1dac11d4ae..64a8fda61395 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -72,7 +72,7 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
 	if (subdev == NULL)
 		return -EINVAL;
 
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
index 1673479be0ff..5c39bacfb13f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -120,7 +120,8 @@ static int vsp1_vspx_rwpf_set_subdev_fmt(struct vsp1_device *vsp1,
 	format.format.field = V4L2_FIELD_NONE;
 	format.format.code = rwpf->fmtinfo->mbus;
 
-	return v4l2_subdev_call(&ent->subdev, pad, set_fmt, NULL, &format);
+	return v4l2_subdev_call(&ent->subdev, pad, set_fmt, NULL, NULL,
+				&format);
 }
 
 /* Configure the RPF->IIF->WPF pipeline for ConfigDMA or RAW image transfer. */
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 414a9980cf2e..d555ca56fc50 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -25,6 +25,7 @@ static const struct media_entity_operations rkcif_interface_media_ops = {
 };
 
 static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
@@ -37,7 +38,7 @@ static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
 
 	/* the format on the source pad always matches the sink pad */
 	if (format->pad == RKCIF_IF_PAD_SRC)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	input = rkcif_interface_find_input_fmt(interface, true,
 					       format->format.code);
@@ -77,6 +78,7 @@ static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int rkcif_interface_get_sel(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_selection *sel)
 {
@@ -115,6 +117,7 @@ static int rkcif_interface_get_sel(struct v4l2_subdev *sd,
 }
 
 static int rkcif_interface_set_sel(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 20d88865081c..fed9e7e761b0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1469,7 +1469,7 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index ddc6182f3e4b..e59d552d6746 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -304,6 +304,7 @@ static int rkisp1_csi_init_state(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -313,7 +314,7 @@ static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
 
 	/* The format on the source pad always matches the sink pad. */
 	if (fmt->pad == RKISP1_CSI_PAD_SRC)
-		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+		return v4l2_subdev_get_fmt(sd, NULL, sd_state, fmt);
 
 	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_CSI_PAD_SINK);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..4043a75ca3f0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -817,6 +817,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 }
 
 static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -834,6 +835,7 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -872,6 +874,7 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 8e6b753d3081..5926917434af 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -543,6 +543,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 }
 
 static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -558,6 +559,7 @@ static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -591,6 +593,7 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index d85811f4b8c5..81c8bf83d599 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -796,7 +796,8 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
 			sd = media_entity_to_v4l2_subdev(me);
 
 			sfmt.pad = 0;
-			ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sfmt);
+			ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, NULL,
+					       &sfmt);
 			if (ret)
 				return ret;
 
@@ -804,6 +805,7 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
 				sfmt.pad = me->num_pads - 1;
 				mf->code = tfmt->code;
 				ret = v4l2_subdev_call(sd, pad, set_fmt, NULL,
+									NULL,
 									&sfmt);
 				if (ret)
 					return ret;
@@ -1136,7 +1138,8 @@ static int fimc_pipeline_validate(struct fimc_dev *fimc)
 			sink_fmt.format.code = ff->fmt ? ff->fmt->mbus_code : 0;
 		} else {
 			sink_fmt.pad = sink_pad->index;
-			ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sink_fmt);
+			ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
+					       &sink_fmt);
 			if (ret < 0 && ret != -ENOIOCTLCMD)
 				return -EPIPE;
 		}
@@ -1144,7 +1147,7 @@ static int fimc_pipeline_validate(struct fimc_dev *fimc)
 		/* Retrieve format at the source pad */
 		sd = media_entity_to_v4l2_subdev(src_pad->entity);
 		src_fmt.pad = src_pad->index;
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &src_fmt);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			return -EPIPE;
 
@@ -1468,6 +1471,7 @@ static int fimc_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -1509,6 +1513,7 @@ static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -1575,6 +1580,7 @@ static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
@@ -1631,6 +1637,7 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_set_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
index ad219ac1b951..cabab7f0bd8b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
@@ -463,7 +463,8 @@ static int isp_video_pipeline_validate(struct fimc_isp *isp)
 		if (!(pad->flags & MEDIA_PAD_FL_SINK))
 			break;
 		sink_fmt.pad = pad->index;
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sink_fmt);
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
+				       &sink_fmt);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			return -EPIPE;
 
@@ -474,7 +475,7 @@ static int isp_video_pipeline_validate(struct fimc_isp *isp)
 
 		sd = media_entity_to_v4l2_subdev(pad->entity);
 		src_fmt.pad = pad->index;
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &src_fmt);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			return -EPIPE;
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
index 3c5d7bee2655..b3b4aa21d118 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
@@ -119,6 +119,7 @@ static int fimc_is_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int fimc_isp_subdev_get_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
@@ -191,6 +192,7 @@ static void __isp_subdev_try_format(struct fimc_isp *isp,
 }
 
 static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 8be20fd32d1c..1036b9b3e0d5 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -783,7 +783,7 @@ static int fimc_pipeline_validate(struct fimc_lite *fimc)
 			sink_fmt.format.code = fimc->inp_frame.fmt->mbus_code;
 		} else {
 			sink_fmt.pad = pad->index;
-			ret = v4l2_subdev_call(sd, pad, get_fmt, NULL,
+			ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
 					       &sink_fmt);
 			if (ret < 0 && ret != -ENOIOCTLCMD)
 				return -EPIPE;
@@ -795,7 +795,7 @@ static int fimc_pipeline_validate(struct fimc_lite *fimc)
 
 		sd = media_entity_to_v4l2_subdev(pad->entity);
 		src_fmt.pad = pad->index;
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fmt);
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &src_fmt);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			return -EPIPE;
 
@@ -1021,6 +1021,7 @@ static struct v4l2_mbus_framefmt *__fimc_lite_subdev_get_try_fmt(
 }
 
 static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -1052,6 +1053,7 @@ static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -1113,6 +1115,7 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
@@ -1148,6 +1151,7 @@ static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_set_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 452880b5350c..788c517d84ef 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -575,6 +575,7 @@ static struct v4l2_mbus_framefmt *__s5pcsis_get_format(
 }
 
 static int s5pcsis_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -604,6 +605,7 @@ static int s5pcsis_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5pcsis_get_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index ed1a1d693293..7bde9d0af1a3 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -816,7 +816,8 @@ static int camif_pipeline_validate(struct camif_dev *camif)
 		return -EPIPE;
 
 	src_fmt.pad = pad->index;
-	ret = v4l2_subdev_call(camif->sensor.sd, pad, get_fmt, NULL, &src_fmt);
+	ret = v4l2_subdev_call(camif->sensor.sd, pad, get_fmt, NULL, NULL,
+			       &src_fmt);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return -EPIPE;
 
@@ -1207,6 +1208,7 @@ static int s3c_camif_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int s3c_camif_subdev_get_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -1275,6 +1277,7 @@ static void __camif_subdev_try_format(struct camif_dev *camif,
 }
 
 static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -1342,6 +1345,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s3c_camif_subdev_get_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
@@ -1429,6 +1433,7 @@ static void __camif_try_crop(struct camif_dev *camif, struct v4l2_rect *r)
 }
 
 static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..3b44259ce515 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -222,13 +222,13 @@ static int camif_register_sensor(struct camif_dev *camif)
 
 	/* Get initial pixel format and set it at the camif sink pad */
 	format.pad = 0;
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &format);
 
 	if (ret < 0)
 		return 0;
 
 	format.pad = CAMIF_SD_PAD_SINK;
-	v4l2_subdev_call(&camif->subdev, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(&camif->subdev, pad, set_fmt, NULL, NULL, &format);
 
 	v4l2_info(sd, "Initial format from sensor: %dx%d, %#x\n",
 		  format.format.width, format.format.height,
diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..8a07032646ca 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -736,6 +736,7 @@ static int stm32_csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int stm32_csi_set_pad_format(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index e5663fbe6422..2253c7450cd4 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -738,7 +738,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
 			format->format.width, format->format.height);
 
 		fmt.pad = pad->index;
-		ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
+		ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
 		if (ret < 0) {
 			dev_err(dcmi->dev, "%s: Failed to set format 0x%x %ux%u on \"%s\":%d pad (%d)\n",
 				__func__, format->format.code,
@@ -1196,7 +1196,7 @@ static int dcmi_get_sensor_format(struct stm32_dcmi *dcmi,
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(dcmi->source, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(dcmi->source, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret)
 		return ret;
 
@@ -1246,7 +1246,7 @@ static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
 	/*
 	 * Get sensor bounds first
 	 */
-	ret = v4l2_subdev_call(dcmi->source, pad, get_selection,
+	ret = v4l2_subdev_call(dcmi->source, pad, get_selection, NULL,
 			       NULL, &bounds);
 	if (!ret)
 		*r = bounds.r;
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index a42f43d19f9e..45ff8f7162d4 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -822,7 +822,8 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 	};
 	int ret, i;
 
-	ret = v4l2_subdev_call(source_sd, pad, get_fmt, NULL, &source_fmt);
+	ret = v4l2_subdev_call(source_sd, pad, get_fmt, NULL, NULL,
+			       &source_fmt);
 	if (ret < 0)
 		return 0;
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 0c7aeb0888f6..5da8b70750ff 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -264,6 +264,7 @@ dcmipp_byteproc_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int dcmipp_byteproc_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
@@ -298,6 +299,7 @@ static int dcmipp_byteproc_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int dcmipp_byteproc_get_selection(struct v4l2_subdev *sd,
+					 const struct v4l2_subdev_client_info *ci,
 					 struct v4l2_subdev_state *sd_state,
 					 struct v4l2_subdev_selection *s)
 {
@@ -351,6 +353,7 @@ static int dcmipp_byteproc_get_selection(struct v4l2_subdev *sd,
 }
 
 static int dcmipp_byteproc_set_selection(struct v4l2_subdev *sd,
+					 const struct v4l2_subdev_client_info *ci,
 					 struct v4l2_subdev_state *sd_state,
 					 struct v4l2_subdev_selection *s)
 {
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 7d3f5857cbfe..b8aff94162ad 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -269,6 +269,7 @@ static void dcmipp_inp_adjust_fmt(struct dcmipp_inp_device *inp,
 }
 
 static int dcmipp_inp_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 744197b0fccb..cdb8a72d945e 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -278,6 +278,7 @@ static int sun4i_csi_subdev_init_state(struct v4l2_subdev *subdev,
 }
 
 static int sun4i_csi_subdev_get_fmt(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -295,6 +296,7 @@ static int sun4i_csi_subdev_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun4i_csi_subdev_set_fmt(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..fd3c2d871d17 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -537,6 +537,7 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
@@ -558,6 +559,7 @@ static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..b11fd2904e1d 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -341,6 +341,7 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
@@ -362,6 +363,7 @@ static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index dbc51daa4fe3..67d83c4a64ba 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -376,6 +376,7 @@ sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
+					const struct v4l2_subdev_client_info *ci,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_format *format)
 {
@@ -398,6 +399,7 @@ static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
+					const struct v4l2_subdev_client_info *ci,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index ce17f986279e..031075f35b2d 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -441,6 +441,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *format)
 {
@@ -450,7 +451,7 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 
 	/* the format on the source pad always matches the sink pad */
 	if (format->pad == DW_MIPI_CSI2RX_PAD_SRC)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!sink)
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 1ca559df7e59..7588d73ef8c1 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1288,7 +1288,7 @@ static int __subdev_get_format(struct vpfe_device *vpfe,
 	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
 	int ret;
 
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -1314,7 +1314,7 @@ static int __subdev_set_format(struct vpfe_device *vpfe,
 
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 00a71dac0ff4..293702e701d8 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -762,6 +762,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
@@ -771,7 +772,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (cal_rx_pad_is_source(format->pad))
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	/*
 	 * Default to the first format if the requested media bus code isn't
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab1127..cb97500ca70a 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -111,7 +111,7 @@ static int __subdev_get_format(struct cal_ctx *ctx,
 	struct v4l2_subdev *sd = ctx->phy->source;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
+	ret = v4l2_subdev_call_ci_state_active(sd, pad, get_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -136,7 +136,7 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
+	ret = v4l2_subdev_call_ci_state_active(sd, pad, set_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -281,7 +281,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
 	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 
-	v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
+	v4l2_subdev_call_ci_state_active(sd, pad, set_fmt, &sd_fmt);
 
 	ctx->fmtinfo = fmtinfo;
 	*f = ctx->v_fmt;
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 15df3ea2f77e..2618a94e1bd6 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -997,7 +997,7 @@ static int vpif_g_fmt_vid_cap(struct file *file, void *priv,
 	*fmt = common->fmt;
 
 	/* If subdev has get_fmt, use that to override */
-	ret = v4l2_subdev_call(ch->sd, pad, get_fmt, NULL, &format);
+	ret = v4l2_subdev_call(ch->sd, pad, get_fmt, NULL, NULL, &format);
 	if (!ret && mbus_fmt->code) {
 		v4l2_fill_pix_format(pix_fmt, mbus_fmt);
 		pix_fmt->bytesperline = pix_fmt->width;
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf..8dbe8b5f7788 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -953,7 +953,7 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	const struct ti_csi2rx_fmt *ti_fmt;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(csi->source, pad,
+	ret = v4l2_subdev_call_ci_state_active(csi->source, pad,
 					    get_fmt, &source_fmt);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index 4708b6303493..8126b883ab59 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -2232,6 +2232,7 @@ static int ccdc_enum_frame_size(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int ccdc_get_selection(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_selection *sel)
 {
@@ -2276,6 +2277,7 @@ static int ccdc_get_selection(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int ccdc_set_selection(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_selection *sel)
 {
@@ -2322,6 +2324,7 @@ static int ccdc_set_selection(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ccdc_get_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -2346,6 +2349,7 @@ static int ccdc_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ccdc_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -2472,7 +2476,7 @@ static int ccdc_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ccdc_set_format(sd, fh ? fh->state : NULL, &format);
+	ccdc_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index d668111b44f4..f68e06b9b61c 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -754,6 +754,7 @@ static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int ccp2_get_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -776,6 +777,7 @@ static int ccp2_get_format(struct v4l2_subdev *sd,
  * returns zero
  */
 static int ccp2_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -820,7 +822,7 @@ static int ccp2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ccp2_set_format(sd, fh ? fh->state : NULL, &format);
+	ccp2_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
index f227042b61b6..80e57b7ee5a7 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
@@ -972,6 +972,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_get_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -994,6 +995,7 @@ static int csi2_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1038,7 +1040,7 @@ static int csi2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	csi2_set_format(sd, fh ? fh->state : NULL, &format);
+	csi2_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 3f3b5bd9cdc7..195d4fe83447 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -1925,6 +1925,7 @@ static int preview_enum_frame_size(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int preview_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1968,6 +1969,7 @@ static int preview_get_selection(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int preview_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -2013,6 +2015,7 @@ static int preview_set_selection(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int preview_get_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -2035,6 +2038,7 @@ static int preview_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int preview_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -2090,7 +2094,7 @@ static int preview_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	preview_set_format(sd, fh ? fh->state : NULL, &format);
+	preview_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index ad0127f5b5cb..67e2fd00ea4e 100644
--- a/drivers/media/platform/ti/omap3isp/ispresizer.c
+++ b/drivers/media/platform/ti/omap3isp/ispresizer.c
@@ -1222,6 +1222,7 @@ static void resizer_try_crop(const struct v4l2_mbus_framefmt *sink,
  * Return 0 on success or a negative error code otherwise.
  */
 static int resizer_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1275,6 +1276,7 @@ static int resizer_get_selection(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int resizer_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1478,6 +1480,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int resizer_get_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -1500,6 +1503,7 @@ static int resizer_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int resizer_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -1577,7 +1581,7 @@ static int resizer_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	resizer_set_format(sd, fh ? fh->state : NULL, &format);
+	resizer_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index b946c8087c77..bdc3114a4dd4 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -286,7 +286,7 @@ __isp_video_get_format(struct isp_video *video, struct v4l2_format *format)
 	fmt.pad = pad;
 
 	mutex_lock(&video->mutex);
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	mutex_unlock(&video->mutex);
 
 	if (ret)
@@ -774,7 +774,7 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 	isp_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
 
 	fmt.pad = pad;
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret)
 		return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
 
@@ -839,14 +839,14 @@ isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 	 * implemented.
 	 */
 	sdsel.pad = pad;
-	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel);
 	if (!ret)
 		sel->r = sdsel.r;
 	if (ret != -ENOIOCTLCMD)
 		return ret;
 
 	format.pad = pad;
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &format);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &format);
 	if (ret < 0)
 		return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
 
@@ -890,7 +890,7 @@ isp_video_set_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 
 	sdsel.pad = pad;
 	mutex_lock(&video->mutex);
-	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
 	mutex_unlock(&video->mutex);
 	if (!ret)
 		sel->r = sdsel.r;
@@ -1073,7 +1073,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
 
 	fmt.pad = source_pad->index;
 	ret = v4l2_subdev_call(media_entity_to_v4l2_subdev(sink),
-			       pad, get_fmt, NULL, &fmt);
+			       pad, get_fmt, NULL, NULL, &fmt);
 	if (unlikely(ret < 0)) {
 		dev_warn(isp->dev, "get_fmt returned null!\n");
 		return ret;
diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index 0e91e87bda9b..29e65db4314c 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -1730,7 +1730,7 @@ static int vip_s_fmt_vid_cap(struct file *file, void *priv,
 
 	sfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sfmt.pad = 0;
-	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, &sfmt);
+	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, NULL, &sfmt);
 	if (ret) {
 		v4l2_dbg(1, debug, &dev->v4l2_dev, "set_fmt failed in subdev\n");
 		return ret;
@@ -2581,7 +2581,8 @@ static int vip_init_port(struct vip_port *port)
 		goto done;
 
 	/* Get subdevice current frame format */
-	ret = v4l2_subdev_call(port->subdev, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(port->subdev, pad, get_fmt, NULL, NULL,
+			       &sd_fmt);
 	if (ret)
 		v4l2_dbg(1, debug, &dev->v4l2_dev, "init_port get_fmt failed in subdev: (%d)\n",
 			 ret);
@@ -2597,7 +2598,7 @@ static int vip_init_port(struct vip_port *port)
 		mbus_fmt->code = fmt->code;
 		sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		sd_fmt.pad = 0;
-		ret = v4l2_subdev_call(port->subdev, pad, set_fmt,
+		ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL,
 				       NULL, &sd_fmt);
 		if (ret)
 			v4l2_dbg(1, debug, &dev->v4l2_dev, "init_port set_fmt failed in subdev: (%d)\n",
diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 1b81acba7da0..6a6e10c6f649 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -249,7 +249,7 @@ static int viacam_configure_sensor(struct via_camera *cam)
 	v4l2_fill_mbus_format(&format.format, &cam->sensor_format, cam->mbus_code);
 	ret = sensor_call(cam, core, init, 0);
 	if (ret == 0)
-		ret = sensor_call(cam, pad, set_fmt, NULL, &format);
+		ret = sensor_call(cam, pad, set_fmt, NULL, NULL, &format);
 	/*
 	 * OV7670 does weird things if flip is set *before* format...
 	 */
@@ -842,7 +842,7 @@ static int viacam_do_try_fmt(struct via_camera *cam,
 	upix->pixelformat = f->pixelformat;
 	viacam_fmt_pre(upix, spix);
 	v4l2_fill_mbus_format(&format.format, spix, f->mbus_code);
-	ret = sensor_call(cam, pad, set_fmt, &pad_state, &format);
+	ret = sensor_call(cam, pad, set_fmt, NULL, &pad_state, &format);
 	v4l2_fill_pix_format(spix, &format.format);
 	viacam_fmt_post(upix, spix);
 	return ret;
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index cba34893258a..b253b260b605 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -146,6 +146,7 @@ static const struct v4l2_subdev_video_ops video_mux_subdev_video_ops = {
 };
 
 static int video_mux_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 146131b8f37e..940f56f5f035 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -679,6 +679,7 @@ static int xcsi2rxss_init_state(struct v4l2_subdev *sd,
 }
 
 static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
@@ -694,6 +695,7 @@ static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
 }
 
 static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index fcfe0883aba5..307cd202dda0 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -66,7 +66,7 @@ static int xvip_dma_verify_format(struct xvip_dma *dma)
 	if (subdev == NULL)
 		return -EPIPE;
 
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
 
diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 7deec6e37edc..d87fe7d885a9 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -266,6 +266,7 @@ __xtpg_get_pad_format(struct xtpg_device *xtpg,
 }
 
 static int xtpg_get_format(struct v4l2_subdev *subdev,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -278,6 +279,7 @@ static int xtpg_get_format(struct v4l2_subdev *subdev,
 }
 
 static int xtpg_set_format(struct v4l2_subdev *subdev,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index 4f4fcb26e236..d56bc2103ff6 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -250,7 +250,7 @@ static int vimc_get_pix_format(struct media_pad *pad,
 		const struct vimc_pix_map *pix_map;
 		int ret;
 
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &sd_fmt);
 		if (ret)
 			return ret;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index 0c2e715a8a16..c2cc07894857 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -240,6 +240,7 @@ static void vimc_debayer_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
@@ -255,7 +256,7 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 	 * the sink.
 	 */
 	if (VIMC_IS_SRC(fmt->pad))
-		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+		return v4l2_subdev_get_fmt(sd, NULL, sd_state, fmt);
 
 	/* Set the new format in the sink pad. */
 	vimc_debayer_adjust_sink_fmt(&fmt->format);
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index e2037c67e423..d8dc65d33f62 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -140,6 +140,7 @@ static int vimc_scaler_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int vimc_scaler_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -204,6 +205,7 @@ static int vimc_scaler_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vimc_scaler_get_selection(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
 {
@@ -239,6 +241,7 @@ static void vimc_scaler_adjust_sink_crop(struct v4l2_rect *r,
 }
 
 static int vimc_scaler_set_selection(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 5deebcc78a33..c58012093142 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -152,6 +152,7 @@ static u32 vimc_calc_vblank(u32 width, u32 height,
 }
 
 static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c695a97e202b..d0955ea18195 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1666,7 +1666,7 @@ static int cx231xx_s_video_encoding(struct cx2341x_handler *cxhdl, u32 val)
 	format.format.width = cxhdl->width / (is_mpeg1 ? 2 : 1);
 	format.format.height = cxhdl->height;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(dev->sd_cx25840, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(dev->sd_cx25840, pad, set_fmt, NULL, NULL, &format);
 	return 0;
 }
 
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 2cd4e333bc4b..ec9306a940a8 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -909,7 +909,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	dev->format = format_by_fourcc(f->fmt.pix.pixelformat);
 
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
-	call_all(dev, pad, set_fmt, NULL, &format);
+	call_all(dev, pad, set_fmt, NULL, NULL, &format);
 	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
 
 	return rc;
@@ -950,7 +950,7 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	format.format.code = MEDIA_BUS_FMT_FIXED;
 	format.format.width = dev->width;
 	format.format.height = dev->height;
-	call_all(dev, pad, set_fmt, NULL, &format);
+	call_all(dev, pad, set_fmt, NULL, NULL, &format);
 
 	/* do mode control overrides */
 	cx231xx_do_mode_ctrl_overrides(dev);
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 3bbee1fcbc8d..8c7d0888c721 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1031,7 +1031,8 @@ static int cxusb_medion_try_s_fmt_vid_cap(struct file *file,
 	subfmt.format.field = field;
 	subfmt.format.colorspace = V4L2_COLORSPACE_SMPTE170M;
 
-	ret = v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, NULL, &subfmt);
+	ret = v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, NULL, NULL,
+			       &subfmt);
 	if (ret != 0)
 		return ret;
 
@@ -1513,7 +1514,8 @@ int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
 	subfmt.format.field = V4L2_FIELD_SEQ_TB;
 	subfmt.format.colorspace = V4L2_COLORSPACE_SMPTE170M;
 
-	ret = v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, NULL, &subfmt);
+	ret = v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, NULL, NULL,
+			       &subfmt);
 	if (ret != 0)
 		dev_warn(&dvbdev->udev->dev,
 			 "cx25840 format set failed (%d)\n", ret);
diff --git a/drivers/media/usb/em28xx/em28xx-camera.c b/drivers/media/usb/em28xx/em28xx-camera.c
index b5f58dc6dd0f..bc55ad66658c 100644
--- a/drivers/media/usb/em28xx/em28xx-camera.c
+++ b/drivers/media/usb/em28xx/em28xx-camera.c
@@ -392,7 +392,7 @@ int em28xx_init_camera(struct em28xx *dev)
 		format.format.code = MEDIA_BUS_FMT_YUYV8_2X8;
 		format.format.width = 640;
 		format.format.height = 480;
-		v4l2_subdev_call(subdev, pad, set_fmt, NULL, &format);
+		v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &format);
 
 		/* NOTE: for UXGA=1600x1200 switch to 12MHz */
 		dev->board.xclk = EM28XX_XCLK_FREQUENCY_24MHZ;
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index 2087ffcb85a5..86b853e09ecb 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -252,7 +252,7 @@ static int set_capture_size(struct go7007 *go, struct v4l2_format *fmt, int try)
 		go->encoder_h_halve = 0;
 		go->encoder_v_halve = 0;
 		go->encoder_subsample = 0;
-		call_all(&go->v4l2_dev, pad, set_fmt, NULL, &format);
+		call_all(&go->v4l2_dev, pad, set_fmt, NULL, NULL, &format);
 	} else {
 		if (width <= sensor_width / 4) {
 			go->encoder_h_halve = 1;
diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index 567f851d5896..31fd14f6f583 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -398,6 +398,7 @@ static int s2250_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int s2250_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 3c270ef00752..21a0dfbd455e 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2924,7 +2924,7 @@ static void pvr2_subdev_update(struct pvr2_hdw *hdw)
 		format.format.code = MEDIA_BUS_FMT_FIXED;
 		pvr2_trace(PVR2_TRACE_CHIPS, "subdev v4l2 set_size(%dx%d)",
 			   format.format.width, format.format.height);
-		v4l2_device_call_all(&hdw->v4l2_dev, 0, pad, set_fmt,
+		v4l2_device_call_all(&hdw->v4l2_dev, 0, pad, set_fmt, NULL,
 				     NULL, &format);
 	}
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..0b84cefee7e5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -520,6 +520,7 @@ static int gc2235_startup(struct v4l2_subdev *sd)
 }
 
 static int gc2235_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -568,6 +569,7 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int gc2235_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..0b5e880ff076 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -623,6 +623,7 @@ static int ov2722_startup(struct v4l2_subdev *sd)
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -697,6 +698,7 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2722_get_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..e0252f5bac1b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3739,14 +3739,16 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	sel.r.left = ((input->native_rect.width - sel.r.width) / 2) & ~1;
 	sel.r.top = ((input->native_rect.height - sel.r.height) / 2) & ~1;
 
-	ret = v4l2_subdev_call(input->sensor, pad, set_selection, sd_state, &sel);
+	ret = v4l2_subdev_call(input->sensor, pad, set_selection, NULL,
+			       sd_state, &sel);
 	if (ret)
 		dev_err(isp->dev, "Error setting crop to (%d,%d)/%ux%u: %d\n",
 			sel.r.left, sel.r.top, sel.r.width, sel.r.height, ret);
 
 set_fmt:
 	if (ret == 0) {
-		ret = v4l2_subdev_call(input->sensor, pad, set_fmt, sd_state, &format);
+		ret = v4l2_subdev_call(input->sensor, pad, set_fmt, NULL,
+				       sd_state, &format);
 		dev_dbg(isp->dev, "Set sensor format ret: %d size %dx%d\n",
 			ret, format.format.width, format.format.height);
 	}
@@ -3759,13 +3761,16 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 		sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor_isp);
 
 		format.pad = SENSOR_ISP_PAD_SINK;
-		ret = v4l2_subdev_call(input->sensor_isp, pad, set_fmt, sd_state, &format);
+		ret = v4l2_subdev_call(input->sensor_isp, pad, set_fmt, NULL,
+				       sd_state, &format);
 		dev_dbg(isp->dev, "Set sensor ISP sink format ret: %d size %dx%d\n",
 			ret, format.format.width, format.format.height);
 
 		if (ret == 0) {
 			format.pad = SENSOR_ISP_PAD_SOURCE;
-			ret = v4l2_subdev_call(input->sensor_isp, pad, set_fmt, sd_state, &format);
+			ret = v4l2_subdev_call(input->sensor_isp, pad,
+					       set_fmt, NULL, sd_state,
+					       &format);
 			dev_dbg(isp->dev, "Set sensor ISP source format ret: %d size %dx%d\n",
 				ret, format.format.width, format.format.height);
 		}
@@ -3777,7 +3782,8 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	/* Propagate new fmt to CSI port */
 	if (ret == 0 && which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		format.pad = CSI2_PAD_SINK;
-		ret = v4l2_subdev_call(input->csi_port, pad, set_fmt, NULL, &format);
+		ret = v4l2_subdev_call(input->csi_port, pad, set_fmt, NULL,
+				       NULL, &format);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..3e864ffc1f1a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -57,6 +57,7 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_get_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -123,6 +124,7 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..68073cde4dd3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -259,6 +259,7 @@ static void isp_get_fmt_rect(struct v4l2_subdev *sd,
 }
 
 static int isp_subdev_get_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -452,6 +453,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 }
 
 static int isp_subdev_set_selection(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
@@ -535,6 +537,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int isp_subdev_get_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -555,6 +558,7 @@ static int isp_subdev_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int isp_subdev_set_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..d7656d3d30b6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -912,7 +912,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_NATIVE_SIZE;
-	err = v4l2_subdev_call(input->sensor, pad, get_selection,
+	err = v4l2_subdev_call(input->sensor, pad, get_selection, NULL,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
@@ -921,7 +921,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP_DEFAULT;
-	err = v4l2_subdev_call(input->sensor, pad, get_selection,
+	err = v4l2_subdev_call(input->sensor, pad, get_selection, NULL,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
@@ -967,7 +967,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	if (!input->sensor->state_lock)
 		v4l2_subdev_lock_state(input->try_sd_state);
 
-	err = v4l2_subdev_call(input->sensor, pad, set_selection,
+	err = v4l2_subdev_call(input->sensor, pad, set_selection, NULL,
 			       input->try_sd_state, &sel);
 
 	if (!input->sensor->state_lock)
@@ -979,7 +979,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
-	err = v4l2_subdev_call(input->sensor, pad, set_selection,
+	err = v4l2_subdev_call(input->sensor, pad, set_selection, NULL,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index fb9ee8547392..4859a027ecba 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -959,7 +959,7 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 	isc_try_fse(isc, &pad_state);
 
 	v4l2_fill_mbus_format(&format.format, pixfmt, mbus_code);
-	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, set_fmt,
+	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, set_fmt, NULL,
 			       &pad_state, &format);
 	if (ret < 0)
 		goto isc_try_fmt_subdev_err;
@@ -1004,7 +1004,7 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 
 	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, mbus_code);
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad,
-			       set_fmt, NULL, &format);
+			       set_fmt, NULL, NULL, &format);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..e5616dbef9a9 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -126,6 +126,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
@@ -151,6 +152,7 @@ static int prp_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int prp_set_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..bda6a4aff782 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -850,6 +850,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
@@ -919,6 +920,7 @@ static void prp_try_fmt(struct prp_priv *priv,
 }
 
 static int prp_set_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a..3a84b9c45d4e 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -359,7 +359,8 @@ static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
 	u32 fourcc;
 	int ret;
 
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, NULL,
+			       &fmt_src);
 	if (ret) {
 		dev_err(priv->dev, "failed to get src_sd format\n");
 		return ret;
@@ -432,7 +433,8 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, NULL,
+			       &fmt_src);
 	if (ret)
 		return ret;
 
@@ -458,7 +460,8 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
 		return -EBUSY;
 	}
 
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, NULL,
+			       &fmt_src);
 	if (ret)
 		return ret;
 
@@ -683,7 +686,8 @@ static int capture_validate_fmt(struct capture_priv *priv)
 	int ret;
 
 	/* Retrieve the media bus format on the source subdev. */
-	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, NULL,
+			       &fmt_src);
 	if (ret)
 		return ret;
 
@@ -880,7 +884,7 @@ static int capture_init_format(struct capture_priv *priv)
 	int ret;
 
 	if (priv->legacy_api) {
-		ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL,
+		ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, NULL,
 				       &fmt_src);
 		if (ret) {
 			dev_err(priv->dev, "failed to get source format\n");
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index ef22a083f8eb..71b906e51445 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1366,6 +1366,7 @@ static int csi_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int csi_get_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
@@ -1525,6 +1526,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
@@ -1593,6 +1595,7 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int csi_get_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -1657,6 +1660,7 @@ static int csi_set_scale(u32 *compose, u32 crop, u32 flags)
 }
 
 static int csi_set_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..b62a739ff935 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -441,7 +441,7 @@ int imx_media_init_state(struct v4l2_subdev *sd,
 			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
+		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL, &format);
 		if (ret)
 			continue;
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 58f1112e28e5..9b0e418ccb0a 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -499,6 +499,7 @@ static int vdic_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vdic_get_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
@@ -566,6 +567,7 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 }
 
 static int vdic_set_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 211f67fb92b5..662ed780cd35 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -507,6 +507,7 @@ __csi2_get_fmt(struct csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
 }
 
 static int csi2_get_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
@@ -525,6 +526,7 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int csi2_set_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d342f4..c9f3d7416080 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -121,6 +121,7 @@ static int imgu_subdev_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -145,6 +146,7 @@ static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -212,6 +214,7 @@ imgu_subdev_get_compose(struct imgu_v4l2_subdev *sd,
 }
 
 static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
@@ -236,6 +239,7 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index f34eabfe8a98..fcc7efcf69c3 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -190,6 +190,7 @@ static int ipu7_isys_csi2_enable_stream(struct ipu7_isys_csi2 *csi2)
 }
 
 static int ipu7_isys_csi2_set_sel(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_selection *sel)
 {
@@ -241,6 +242,7 @@ static int ipu7_isys_csi2_set_sel(struct v4l2_subdev *sd,
 }
 
 static int ipu7_isys_csi2_get_sel(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
index 67a776033d5b..ca551894833b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -99,6 +99,7 @@ u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y)
 }
 
 int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
@@ -113,7 +114,7 @@ int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 	/* No transcoding, source and sink formats must match. */
 	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
 	    sd->entity.num_pads > 1)
-		return v4l2_subdev_get_fmt(sd, state, format);
+		return v4l2_subdev_get_fmt(sd, NULL, state, format);
 
 	format->format.width = clamp(format->format.width, IPU_ISYS_MIN_WIDTH,
 				     IPU_ISYS_MAX_WIDTH);
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index 46a334b602f1..9e9a95178ba3 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -292,6 +292,7 @@ sun6i_isp_proc_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *format)
 {
@@ -313,6 +314,7 @@ static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 41d57dac61a7..01fa749c8686 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -68,6 +68,7 @@ static int csi_enum_bus_code(struct v4l2_subdev *subdev,
 }
 
 static int csi_get_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -170,6 +171,7 @@ static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
 }
 
 static int csi_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..4957d84b9b1e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -489,7 +489,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		try_crop->height = fse.max_height;
 	}
 
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state, &fmt);
 	if (ret < 0)
 		goto out_free;
 
@@ -543,7 +543,7 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
 	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret;
 
@@ -570,7 +570,7 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	 * is corresponding match in the Tegra supported video formats.
 	 */
 	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret)
 		return ret;
 
@@ -626,13 +626,13 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 	 * Try the get selection operation and fallback to get format if not
 	 * implemented.
 	 */
-	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel);
 	if (!ret)
 		sel->r = sdsel.r;
 	if (ret != -ENOIOCTLCMD)
 		return ret;
 
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret;
 
@@ -667,7 +667,7 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	if (vb2_is_busy(&chan->queue))
 		return -EBUSY;
 
-	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
 	if (!ret) {
 		sel->r = sdsel.r;
 		/*
-- 
2.47.3


