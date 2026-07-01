Return-Path: <linux-media+bounces-66219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YWtqBbALRWoa5woAu9opvQ
	(envelope-from <linux-media+bounces-66219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:44:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E66ED806
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=VyW2Pf3B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66219-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66219-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8AF3237B53
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 12:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22EE492536;
	Wed,  1 Jul 2026 12:23:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59313481257
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 12:23:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908621; cv=none; b=VlyroiC9O3yHWaPf9s+Z838ez03tx4ezni8ozvXCUSPwTPOqS8U21d10LwM0k7RT9rilWbgZmm8VPKgytOyJBZ5qvFMJu3t5b/rhqwHYQH90ZLYlhCeFif86zJ3fn246U8zh1OpcLEsvYZnjNVY4zWhc5CwlWsIWsJTh/53pDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908621; c=relaxed/simple;
	bh=ZFUEK3qaIAkhz9g9HI5Au/m5muw6otIqnnGoQhxU5uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deZBxRYFXlKoQEvinxWI0RzXYACXIn9o3orZefmcl+av7bQYo7NWKWJxj2H+48A/7MLemW1l4uyT6onk/LArdI4FjY2JqJjyRZsK3/QgpHAatGmQ458sVpKW0vrJH4kVlvr1I4Tl9D7MF4suW5tKszuJGNHJRvmI8dGnMcE1dDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyW2Pf3B; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908612; x=1814444612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZFUEK3qaIAkhz9g9HI5Au/m5muw6otIqnnGoQhxU5uM=;
  b=VyW2Pf3BNMWxVZ3TOyETRvKykyc8RQoOQ6gO56TMqy6+Pl+q5io2/tlo
   BbesN3g0G+7x1LnuzDz4XiyoehSTbh1Nq248YAYMjEV6d17HtnjVK1kEI
   ffRt+IoSHDDF5PhA06UUZdeJvxbkcZLI8SSfbk2g1rPACoGt1UlRtba72
   i7SDt1beWnZrbKyTtTPSPyHn+XF4uqsM+lLzH3tYsIOXQU2H44qJL2zJq
   JcgQIa2i1n+4oj6HNg0kPJRa+4oMgGQN3d9Jn/XrIWI+YlK0tsSg3s4Vt
   mp9S/GoLd+uKMPxpBZjqtp/tDm6TvEJnYUx6YTJu3x49YbGNUMG8JJDyA
   Q==;
X-CSE-ConnectionGUID: 2DCwfjAcQA+G5gLZ7+laXQ==
X-CSE-MsgGUID: 5AE1X+7eQMeyDQK0LlfWRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239268"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239268"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:29 -0700
X-CSE-ConnectionGUID: 1K/lacz2TZGCIk2+DcdHnQ==
X-CSE-MsgGUID: AYKm5U2AR7ezN+I6/vJwDA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:23:22 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 195D0121D2C;
	Wed, 01 Jul 2026 15:23:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1weu1S-00000007FlQ-3RtZ;
	Wed, 01 Jul 2026 15:26:34 +0300
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
Subject: [PATCH v6 16/16] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
Date: Wed,  1 Jul 2026 15:26:34 +0300
Message-ID: <20260701122634.1728782-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66219-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:dkim,intel.com:email,sel.target:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D9E66ED806

Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
set_fmt, get_selection and set_selection sub-device pad ops. The client
info struct will soon be used to differentiate UAPI based on client
capabilities.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/adv7170.c                   |  1 +
 drivers/media/i2c/adv7175.c                   |  1 +
 drivers/media/i2c/adv7180.c                   |  3 +-
 drivers/media/i2c/adv7183.c                   |  3 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |  1 +
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  1 +
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |  1 +
 drivers/media/i2c/adv7511-v4l2.c              |  1 +
 drivers/media/i2c/adv7604.c                   |  2 +
 drivers/media/i2c/adv7842.c                   |  1 +
 drivers/media/i2c/ak881x.c                    |  2 +-
 drivers/media/i2c/alvium-csi2.c               |  3 +
 drivers/media/i2c/ar0521.c                    |  1 +
 drivers/media/i2c/ccs/ccs-core.c              | 12 +++-
 drivers/media/i2c/cvs/v4l2.c                  |  1 +
 drivers/media/i2c/cx25840/cx25840-core.c      |  1 +
 drivers/media/i2c/ds90ub913.c                 |  1 +
 drivers/media/i2c/ds90ub953.c                 |  1 +
 drivers/media/i2c/ds90ub960.c                 |  1 +
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  1 +
 drivers/media/i2c/gc0308.c                    |  1 +
 drivers/media/i2c/gc0310.c                    |  1 +
 drivers/media/i2c/gc05a2.c                    |  4 +-
 drivers/media/i2c/gc08a3.c                    |  4 +-
 drivers/media/i2c/gc2145.c                    |  2 +
 drivers/media/i2c/hi556.c                     |  2 +
 drivers/media/i2c/hi846.c                     |  2 +
 drivers/media/i2c/hi847.c                     |  1 +
 drivers/media/i2c/imx111.c                    |  1 +
 drivers/media/i2c/imx208.c                    |  1 +
 drivers/media/i2c/imx214.c                    |  4 +-
 drivers/media/i2c/imx219.c                    |  4 +-
 drivers/media/i2c/imx258.c                    |  2 +
 drivers/media/i2c/imx274.c                    |  3 +
 drivers/media/i2c/imx283.c                    |  2 +
 drivers/media/i2c/imx290.c                    |  4 +-
 drivers/media/i2c/imx296.c                    |  7 ++-
 drivers/media/i2c/imx319.c                    |  1 +
 drivers/media/i2c/imx334.c                    |  3 +-
 drivers/media/i2c/imx335.c                    |  4 +-
 drivers/media/i2c/imx355.c                    |  1 +
 drivers/media/i2c/imx412.c                    |  3 +-
 drivers/media/i2c/imx415.c                    |  4 +-
 drivers/media/i2c/isl7998x.c                  |  1 +
 drivers/media/i2c/lt6911uxe.c                 |  5 +-
 drivers/media/i2c/max9286.c                   |  1 +
 drivers/media/i2c/max96714.c                  |  1 +
 drivers/media/i2c/max96717.c                  |  1 +
 drivers/media/i2c/ml86v7667.c                 |  1 -
 drivers/media/i2c/mt9m001.c                   |  8 ++-
 drivers/media/i2c/mt9m111.c                   |  3 +
 drivers/media/i2c/mt9m114.c                   |  6 ++
 drivers/media/i2c/mt9p031.c                   |  3 +
 drivers/media/i2c/mt9t112.c                   |  3 +
 drivers/media/i2c/mt9v011.c                   |  1 +
 drivers/media/i2c/mt9v032.c                   |  3 +
 drivers/media/i2c/mt9v111.c                   |  1 +
 drivers/media/i2c/og01a1b.c                   |  3 +-
 drivers/media/i2c/og0ve1b.c                   |  3 +-
 drivers/media/i2c/os05b10.c                   |  2 +
 drivers/media/i2c/ov01a10.c                   |  3 +
 drivers/media/i2c/ov02a10.c                   |  3 +-
 drivers/media/i2c/ov02c10.c                   |  1 +
 drivers/media/i2c/ov02e10.c                   |  1 +
 drivers/media/i2c/ov08d10.c                   |  1 +
 drivers/media/i2c/ov08x40.c                   |  1 +
 drivers/media/i2c/ov13858.c                   |  1 +
 drivers/media/i2c/ov13b10.c                   |  1 +
 drivers/media/i2c/ov2640.c                    |  2 +
 drivers/media/i2c/ov2659.c                    |  1 +
 drivers/media/i2c/ov2680.c                    |  3 +
 drivers/media/i2c/ov2685.c                    |  2 +
 drivers/media/i2c/ov2732.c                    |  4 +-
 drivers/media/i2c/ov2735.c                    |  4 +-
 drivers/media/i2c/ov2740.c                    |  1 +
 drivers/media/i2c/ov4689.c                    |  2 +
 drivers/media/i2c/ov5640.c                    |  2 +
 drivers/media/i2c/ov5645.c                    |  4 +-
 drivers/media/i2c/ov5647.c                    |  2 +
 drivers/media/i2c/ov5648.c                    |  1 +
 drivers/media/i2c/ov5670.c                    |  2 +
 drivers/media/i2c/ov5675.c                    |  2 +
 drivers/media/i2c/ov5693.c                    |  3 +
 drivers/media/i2c/ov5695.c                    |  1 +
 drivers/media/i2c/ov6211.c                    |  3 +-
 drivers/media/i2c/ov64a40.c                   |  2 +
 drivers/media/i2c/ov7251.c                    |  4 +-
 drivers/media/i2c/ov7670.c                    |  1 +
 drivers/media/i2c/ov772x.c                    |  2 +
 drivers/media/i2c/ov7740.c                    |  1 +
 drivers/media/i2c/ov8856.c                    |  1 +
 drivers/media/i2c/ov8858.c                    |  3 +-
 drivers/media/i2c/ov8865.c                    |  2 +
 drivers/media/i2c/ov9282.c                    |  4 +-
 drivers/media/i2c/ov9640.c                    |  2 +
 drivers/media/i2c/ov9650.c                    |  1 +
 drivers/media/i2c/ov9734.c                    |  1 +
 drivers/media/i2c/rj54n1cb0c.c                |  3 +
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +
 drivers/media/i2c/s5k3m5.c                    |  4 +-
 drivers/media/i2c/s5k5baf.c                   |  3 +
 drivers/media/i2c/s5k6a3.c                    |  1 +
 drivers/media/i2c/s5kjn1.c                    |  4 +-
 drivers/media/i2c/saa6752hs.c                 |  1 +
 drivers/media/i2c/saa7115.c                   |  1 +
 drivers/media/i2c/saa717x.c                   |  1 +
 drivers/media/i2c/st-mipid02.c                |  1 +
 drivers/media/i2c/t4ka3.c                     |  3 +
 drivers/media/i2c/tc358743.c                  |  1 +
 drivers/media/i2c/tc358746.c                  |  1 +
 drivers/media/i2c/tda1997x.c                  |  1 +
 drivers/media/i2c/thp7312.c                   |  1 +
 drivers/media/i2c/tvp514x.c                   |  1 +
 drivers/media/i2c/tvp5150.c                   |  3 +-
 drivers/media/i2c/tvp7002.c                   |  1 +
 drivers/media/i2c/tw9900.c                    |  1 +
 drivers/media/i2c/tw9910.c                    |  2 +
 drivers/media/i2c/vd55g1.c                    |  4 +-
 drivers/media/i2c/vd56g3.c                    |  4 +-
 drivers/media/i2c/vgxy61.c                    |  4 +-
 drivers/media/pci/cobalt/cobalt-driver.c      |  8 +--
 drivers/media/pci/cobalt/cobalt-v4l2.c        | 10 ++--
 drivers/media/pci/cx18/cx18-av-core.c         |  1 +
 drivers/media/pci/cx18/cx18-controls.c        |  2 +-
 drivers/media/pci/cx18/cx18-ioctl.c           |  2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |  4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  1 +
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  1 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  1 +
 drivers/media/pci/intel/ivsc/mei_csi.c        |  1 +
 drivers/media/pci/ivtv/ivtv-controls.c        |  2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  2 +-
 drivers/media/pci/saa7134/saa7134-empress.c   |  4 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  1 +
 drivers/media/platform/amd/isp4/isp4_video.c  |  2 +-
 .../platform/amlogic/c3/isp/c3-isp-core.c     |  1 +
 .../platform/amlogic/c3/isp/c3-isp-resizer.c  |  3 +
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c    |  1 +
 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |  1 +
 .../platform/arm/mali-c55/mali-c55-isp.c      |  3 +
 .../platform/arm/mali-c55/mali-c55-resizer.c  | 15 +++--
 .../platform/arm/mali-c55/mali-c55-tpg.c      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      |  4 +-
 .../media/platform/broadcom/bcm2835-unicam.c  |  1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  1 +
 drivers/media/platform/cadence/cdns-csi2tx.c  |  1 +
 drivers/media/platform/intel/pxa_camera.c     |  6 +-
 drivers/media/platform/marvell/mcam-core.c    |  4 +-
 .../platform/microchip/microchip-csi2dc.c     |  1 +
 .../platform/microchip/microchip-isc-scaler.c |  2 +
 drivers/media/platform/nxp/imx-mipi-csis.c    |  3 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  1 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  1 +
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  3 +
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  1 +
 .../media/platform/qcom/camss/camss-csid.c    |  3 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  3 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  3 +-
 drivers/media/platform/qcom/camss/camss-tpg.c |  3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++--
 .../media/platform/raspberrypi/rp1-cfe/csi2.c |  1 +
 .../platform/raspberrypi/rp1-cfe/pisp-fe.c    |  1 +
 drivers/media/platform/renesas/rcar-csi2.c    |  1 +
 .../media/platform/renesas/rcar-isp/csisp.c   |  1 +
 drivers/media/platform/renesas/renesas-ceu.c  |  7 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  3 +-
 .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      |  1 +
 drivers/media/platform/renesas/sh_vou.c       |  6 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  3 +
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 18 +++---
 .../media/platform/renesas/vsp1/vsp1_entity.c |  4 +-
 .../media/platform/renesas/vsp1/vsp1_entity.h |  1 +
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  3 +
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 +
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  3 +
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  2 +
 .../media/platform/renesas/vsp1/vsp1_vspx.c   |  3 +-
 .../platform/rockchip/rkcif/rkcif-interface.c |  3 +
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  3 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  3 +
 .../samsung/exynos4-is/fimc-capture.c         |  8 ++-
 .../platform/samsung/exynos4-is/fimc-isp.c    |  1 +
 .../platform/samsung/exynos4-is/fimc-lite.c   |  3 +
 .../platform/samsung/exynos4-is/mipi-csis.c   |  1 +
 .../samsung/s3c-camif/camif-capture.c         |  3 +
 .../platform/samsung/s3c-camif/camif-core.c   |  2 +-
 drivers/media/platform/st/stm32/stm32-csi.c   |  1 +
 drivers/media/platform/st/stm32/stm32-dcmi.c  | 10 ++--
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |  3 +
 .../st/stm32/stm32-dcmipp/dcmipp-input.c      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  1 +
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  1 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  1 +
 .../sun8i_a83t_mipi_csi2.c                    |  1 +
 .../media/platform/synopsys/dw-mipi-csi2rx.c  |  1 +
 .../media/platform/ti/am437x/am437x-vpfe.c    |  2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  1 +
 drivers/media/platform/ti/cal/cal-video.c     |  4 +-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  1 +
 drivers/media/platform/ti/omap3isp/ispccdc.c  |  5 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |  3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |  3 +-
 .../media/platform/ti/omap3isp/isppreview.c   |  5 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |  5 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  4 +-
 drivers/media/platform/ti/vpe/vip.c           |  4 +-
 drivers/media/platform/via/via-camera.c       |  4 +-
 drivers/media/platform/video-mux.c            |  1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  1 +
 drivers/media/platform/xilinx/xilinx-tpg.c    |  1 +
 .../media/test-drivers/vimc/vimc-debayer.c    |  1 +
 drivers/media/test-drivers/vimc/vimc-scaler.c |  3 +
 drivers/media/test-drivers/vimc/vimc-sensor.c |  1 +
 drivers/media/usb/cx231xx/cx231xx-417.c       |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |  4 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c      |  6 +-
 drivers/media/usb/em28xx/em28xx-camera.c      |  2 +-
 drivers/media/usb/go7007/go7007-v4l2.c        |  2 +-
 drivers/media/usb/go7007/s2250-board.c        |  1 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 58 ++++++++++++++-----
 .../media/atomisp/i2c/atomisp-gc2235.c        |  1 +
 .../media/atomisp/i2c/atomisp-ov2722.c        |  1 +
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 16 +++--
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  1 +
 .../media/atomisp/pci/atomisp_subdev.c        |  3 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  8 +--
 drivers/staging/media/imx/imx-ic-prp.c        |  1 +
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  1 +
 drivers/staging/media/imx/imx-media-csi.c     |  3 +
 drivers/staging/media/imx/imx-media-vdic.c    |  1 +
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  1 +
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  3 +
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  2 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.h |  1 +
 drivers/staging/media/max96712/max96712.c     |  1 -
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  1 +
 drivers/staging/media/tegra-video/csi.c       |  1 +
 drivers/staging/media/tegra-video/vi.c        | 10 ++--
 include/media/v4l2-subdev.h                   |  8 ++-
 246 files changed, 541 insertions(+), 153 deletions(-)

diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
index 812998729207..9a7edd6583c1 100644
--- a/drivers/media/i2c/adv7170.c
+++ b/drivers/media/i2c/adv7170.c
@@ -284,6 +284,7 @@ static int adv7170_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7170_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index f1caab8e2abd..aedb54f1857b 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -322,6 +322,7 @@ static int adv7175_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7175_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index e5d11a6e6766..79a592f1831d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -771,6 +771,7 @@ static int adv7180_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int adv7180_set_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
@@ -808,7 +809,7 @@ static int adv7180_init_state(struct v4l2_subdev *sd,
 		: V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 
-	return adv7180_set_pad_format(sd, sd_state, &fmt);
+	return adv7180_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index a04a1a205fe0..9e4cbebe6e5a 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -420,6 +420,7 @@ static int adv7183_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7183_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -598,7 +599,7 @@ static int adv7183_probe(struct i2c_client *client)
 	adv7183_s_std(sd, decoder->std);
 	fmt.format.width = 720;
 	fmt.format.height = 576;
-	adv7183_set_fmt(sd, NULL, &fmt);
+	adv7183_set_fmt(sd, NULL, NULL, &fmt);
 
 	/* initialize the hardware to the default control values */
 	ret = v4l2_ctrl_handler_setup(hdl);
diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 678199196b84..28b755df30cf 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -349,6 +349,7 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_afe_set_format(struct v4l2_subdev *sd,
+				      const struct v4l2_subdev_client_info *ci,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index ebe7da8ebed7..1d7ab685d229 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -226,6 +226,7 @@ static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
 }
 
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index b154dea29ba2..8d5ebb369961 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -440,6 +440,7 @@ static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_hdmi_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 860cff50c522..27e0e2c31dbd 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1273,6 +1273,7 @@ static int adv7511_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7511_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index ac9c69ce438f..433b8c1d598c 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1943,6 +1943,7 @@ static int adv76xx_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1963,6 +1964,7 @@ static int adv76xx_get_selection(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 3cfae89ce944..7fe394da0e6a 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2110,6 +2110,7 @@ static int adv7842_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv7842_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index cea46f01997d..3449d95ee8a0 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -122,6 +122,7 @@ static int ak881x_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ak881x_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -216,7 +217,6 @@ static const struct v4l2_subdev_video_ops ak881x_subdev_video_ops = {
 static const struct v4l2_subdev_pad_ops ak881x_subdev_pad_ops = {
 	.enum_mbus_code = ak881x_enum_mbus_code,
 	.get_selection	= ak881x_get_selection,
-	.set_fmt	= ak881x_fill_fmt,
 	.get_fmt	= ak881x_fill_fmt,
 };
 
diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index dd991c2ee700..d9a5497855f7 100644
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
index ed324c2d87aa..6e07bc923105 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -457,6 +457,7 @@ static int ar0521_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ar0521_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 8e25f970fd12..1cc4350856fd 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2189,6 +2189,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_format_source(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -2242,6 +2243,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -2252,7 +2254,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
-		rval = ccs_set_format_source(subdev, sd_state, fmt);
+		rval = ccs_set_format_source(subdev, ci, sd_state, fmt);
 
 		return rval;
 	}
@@ -2467,6 +2469,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 }
 /* We're only called on source pads. This function sets scaling. */
 static int ccs_set_compose(struct v4l2_subdev *subdev,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_selection *sel)
 {
@@ -2536,6 +2539,7 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_crop(struct v4l2_subdev *subdev,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_selection *sel)
 {
@@ -2587,6 +2591,7 @@ static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
 }
 
 static int ccs_get_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -2633,6 +2638,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -2655,10 +2661,10 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		ret = ccs_set_crop(subdev, sd_state, sel);
+		ret = ccs_set_crop(subdev, ci, sd_state, sel);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		ret = ccs_set_compose(subdev, sd_state, sel);
+		ret = ccs_set_compose(subdev, ci, sd_state, sel);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
index 32e4bf74aa1d..24f1a6a5eee3 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -152,6 +152,7 @@ static int cvs_csi_init_state(struct v4l2_subdev *sd,
 }
 
 static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 8110d40931d9..f2cd3ff208b0 100644
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
index 6abb5e324ae1..ca0b07d7109b 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -373,6 +373,7 @@ static int ub913_set_routing(struct v4l2_subdev *sd,
 }
 
 static int ub913_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index d4228e1134ff..e6ae9cadefa2 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -426,6 +426,7 @@ static int ub953_set_routing(struct v4l2_subdev *sd,
 
 
 static int ub953_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 15a9797b47ac..7d7ba6d349fc 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -4045,6 +4045,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int ub960_set_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 738e2801016a..e8a7b7d87bb1 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1013,6 +1013,7 @@ static int et8ek8_get_pad_format(struct v4l2_subdev *subdev,
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
index 19458eebfde2..de55a896c9ee 100644
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
index de573cee4451..4c13adf4a900 100644
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
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..025f8bcd17bc 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1688,6 +1688,7 @@ static int __maybe_unused hi846_resume(struct device *dev)
 }
 
 static int hi846_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
@@ -1840,6 +1841,7 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int hi846_get_selection(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index def01aa07b2f..601de43be92f 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2639,6 +2639,7 @@ static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int hi847_set_format(struct v4l2_subdev *sd,
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
index d5350bb46f14..3a899b41a9d2 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -574,6 +574,7 @@ static int imx208_get_pad_format(struct v4l2_subdev *sd,
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
index f8bc762ebbf1..626855f84f9b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -831,6 +831,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -944,6 +945,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx219_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -986,7 +988,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	return imx219_set_pad_format(sd, state, &fmt);
+	return imx219_set_pad_format(sd, NULL, state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index bc9ee449a87c..065c33380f60 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -913,6 +913,7 @@ static int imx258_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx258_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -988,6 +989,7 @@ __imx258_get_pad_crop(struct imx258 *imx258,
 }
 
 static int imx258_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 76da647f9cf9..3245afc8ae5b 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1059,6 +1059,7 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx274_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1092,6 +1093,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx274_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1208,6 +1210,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
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
index 953310ef3046..281d39ed4194 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2030,6 +2030,7 @@ static int imx319_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 imx319_set_pad_format(struct v4l2_subdev *sd,
+		      const struct v4l2_subdev_client_info *ci,
 		      struct v4l2_subdev_state *sd_state,
 		      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 553a16b84f4d..ef66d14b33b8 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -741,6 +741,7 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx334_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -786,7 +787,7 @@ static int imx334_init_state(struct v4l2_subdev *sd,
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
index 27a5c212a527..d5961c5ccc67 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1345,6 +1345,7 @@ static int imx355_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 imx355_set_pad_format(struct v4l2_subdev *sd,
+		      const struct v4l2_subdev_client_info *ci,
 		      struct v4l2_subdev_state *sd_state,
 		      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 2705af2f16c0..f269bbaddc96 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -696,6 +696,7 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx412_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -733,7 +734,7 @@ static int imx412_init_state(struct v4l2_subdev *sd,
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
index a77538d2343c..cb2b752aaffe 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1027,6 +1027,7 @@ static int isl7998x_get_fmt(struct v4l2_subdev *sd,
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
index ac0712ce1e65..87c2b2a76d04 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -910,6 +910,7 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int max9286_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index e3e625e6f11a..0c2ff62a77ea 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -327,6 +327,7 @@ static int max96714_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int max96714_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 72f021b1a7b9..ff1df1d84049 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -414,6 +414,7 @@ static int max96717_set_routing(struct v4l2_subdev *sd,
 }
 
 static int max96717_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index 48b7d589df31..eda41a80d20c 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -298,7 +298,6 @@ static const struct v4l2_subdev_video_ops ml86v7667_subdev_video_ops = {
 static const struct v4l2_subdev_pad_ops ml86v7667_subdev_pad_ops = {
 	.enum_mbus_code = ml86v7667_enum_mbus_code,
 	.get_fmt = ml86v7667_fill_fmt,
-	.set_fmt = ml86v7667_fill_fmt,
 	.get_mbus_config = ml86v7667_get_mbus_config,
 };
 
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index d8fffed0818a..fe46ea65550a 100644
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
@@ -343,6 +345,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_s_fmt(struct v4l2_subdev *sd,
+			 const struct v4l2_subdev_client_info *ci,
 			 struct v4l2_subdev_state *state,
 			 const struct mt9m001_datafmt *fmt,
 			 struct v4l2_mbus_framefmt *mf)
@@ -360,7 +363,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 	int ret;
 
 	/* No support for scaling so far, just crop. TODO: use skipping */
-	ret = mt9m001_set_selection(sd, state, &sel);
+	ret = mt9m001_set_selection(sd, ci, state, &sel);
 	if (!ret) {
 		mf->width	= mt9m001->rect.width;
 		mf->height	= mt9m001->rect.height;
@@ -372,6 +375,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -405,7 +409,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return mt9m001_s_fmt(sd, sd_state, fmt, mf);
+		return mt9m001_s_fmt(sd, ci, sd_state, fmt, mf);
 	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
 	return 0;
 }
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 4e748080b798..f911c1cb43e1 100644
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
@@ -617,6 +619,7 @@ static int mt9m111_set_pixfmt(struct mt9m111 *mt9m111,
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
index 8dc57eeba606..ea006afd4aea 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -585,6 +585,7 @@ static int mt9p031_get_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_set_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -623,6 +624,7 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_get_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -647,6 +649,7 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_set_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index bd2268154ca7..f6452dd070fa 100644
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
@@ -953,6 +955,7 @@ static int mt9t112_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 985517f1cff7..c3483e268357 100644
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
index d4359d5b92bb..16c995540d07 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -503,6 +503,7 @@ static unsigned int mt9v032_calc_ratio(unsigned int input, unsigned int output)
 }
 
 static int mt9v032_set_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -547,6 +548,7 @@ static int mt9v032_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_get_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -561,6 +563,7 @@ static int mt9v032_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_set_selection(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 64a758c95ab7..6e9b3e190bca 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -886,6 +886,7 @@ static int mt9v111_get_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_set_format(struct v4l2_subdev *subdev,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1675f0460969..d18b10fb0a1f 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -677,6 +677,7 @@ static int og01a1b_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int og01a1b_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -763,7 +764,7 @@ static int og01a1b_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	og01a1b_set_format(sd, state, &fmt);
+	og01a1b_set_format(sd, NULL, state, &fmt);
 
 	return 0;
 }
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
index 143dcfe10445..2f5bcf323515 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -296,6 +296,7 @@ static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
 }
 
 static int ov02a10_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -523,7 +524,7 @@ static int ov02a10_init_state(struct v4l2_subdev *sd,
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
index 4a64cba99991..5c1e7013f559 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -590,6 +590,7 @@ static int ov02e10_power_on(struct device *dev)
 }
 
 static int ov02e10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 9adef5446a61..0710d2243cc0 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1178,6 +1178,7 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int ov08d10_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 5eaf454f4763..6de0c17e633d 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1844,6 +1844,7 @@ static int ov08x40_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov08x40_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 09d58e8b1c7f..de2b79a9a0e3 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1345,6 +1345,7 @@ static int ov13858_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov13858_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index b0d34141a13a..242a95834126 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1118,6 +1118,7 @@ static int ov13b10_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov13b10_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 50feb608b92b..3dbefac6d305 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -938,6 +938,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2640_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
@@ -1028,6 +1029,7 @@ static int ov2640_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2640_get_selection(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 7d8c7c3465a4..5bc30e7b8325 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1080,6 +1080,7 @@ static void __ov2659_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int ov2659_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 78e63bd1b35b..6c13cf7fa409 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -640,6 +640,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -704,6 +705,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -734,6 +736,7 @@ static int ov2680_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov2680_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 4911a4eea126..162859a140eb 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -340,6 +340,7 @@ static void ov2685_fill_fmt(const struct ov2685_mode *mode,
 }
 
 static int ov2685_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -413,6 +414,7 @@ __ov2685_get_pad_crop(struct ov2685 *ov2685,
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
index 92d2d6cd4ba4..5a57c0b292ad 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2948,6 +2948,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 }
 
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2994,6 +2995,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5640_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index c772ef6e51d2..a8d740ed4dc9 100644
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
index 3facf92b3841..4824013454f5 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -787,6 +787,7 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
@@ -837,6 +838,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5647_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index f0b839cd65f1..d06f5ebd9464 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2215,6 +2215,7 @@ static int ov5648_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov5648_set_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 04b3183b7bcb..c28d19f7bc2f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2286,6 +2286,7 @@ static int ov5670_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int ov5670_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -2554,6 +2555,7 @@ __ov5670_get_pad_crop(struct ov5670 *sensor, struct v4l2_subdev_state *state,
 }
 
 static int ov5670_get_selection(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 508149485248..883a3df0cc42 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1016,6 +1016,7 @@ static int ov5675_power_on(struct device *dev)
 }
 
 static int ov5675_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -1075,6 +1076,7 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
 }
 
 static int ov5675_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbee92..af44cb03beaa 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -807,6 +807,7 @@ static int ov5693_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5693_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
@@ -882,6 +883,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5693_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -915,6 +917,7 @@ static int ov5693_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov5693_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 5bb6ce7b3237..5b23f04ab9f8 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -805,6 +805,7 @@ ov5695_find_best_fit(struct v4l2_subdev_format *fmt)
 }
 
 static int ov5695_set_fmt(struct v4l2_subdev *sd,
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
index 27afc3fc0175..bffe64f1e458 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1214,6 +1214,7 @@ ov7251_find_mode_by_ival(struct ov7251 *ov7251, struct v4l2_fract *timeperframe)
 }
 
 static int ov7251_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
@@ -1296,12 +1297,13 @@ static int ov7251_init_state(struct v4l2_subdev *subdev,
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
index b6d238ba0d53..a3e5e315dcde 100644
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
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index be3ba284ee0b..76aa562213a1 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1171,6 +1171,7 @@ static int ov772x_set_params(struct ov772x_priv *priv,
 }
 
 static int ov772x_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1212,6 +1213,7 @@ static int ov772x_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov772x_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index c2e02f191816..059435c7b341 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -766,6 +766,7 @@ static int ov7740_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int ov7740_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8bedb47cd7cf..741fd60a93c2 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2132,6 +2132,7 @@ static int ov8856_power_off(struct device *dev)
 }
 
 static int ov8856_set_format(struct v4l2_subdev *sd,
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
index a8586df14f77..7d0d2353cdd5 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2689,6 +2689,7 @@ static int ov8865_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov8865_set_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -2797,6 +2798,7 @@ __ov8865_get_pad_crop(struct ov8865_sensor *sensor,
 }
 
 static int ov8865_get_selection(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 3ba630ec4f2a..9dfe32597d34 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -779,6 +779,7 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int ov9282_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
@@ -825,7 +826,7 @@ static int ov9282_init_state(struct v4l2_subdev *sd,
 	ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE],
 			       ov9282->code, &fmt);
 
-	return ov9282_set_pad_format(sd, sd_state, &fmt);
+	return ov9282_set_pad_format(sd, NULL, sd_state, &fmt);
 }
 
 static const struct v4l2_rect *
@@ -844,6 +845,7 @@ __ov9282_get_pad_crop(struct ov9282 *ov9282,
 }
 
 static int ov9282_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 122f411044ce..d24b3be1e0b6 100644
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
index 5c85db8a4a38..b596cfb2d7f3 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1226,6 +1226,7 @@ static void __ov965x_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int ov965x_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 0eaf33807fc9..8f39609ad1b6 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -681,6 +681,7 @@ static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int ov9734_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 23352d71a108..211f890a9cbd 100644
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
@@ -973,6 +975,7 @@ static int rj54n1_reg_init(struct i2c_client *client)
 }
 
 static int rj54n1_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 551387cea521..680add1da244 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1069,6 +1069,7 @@ static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1108,6 +1109,7 @@ static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
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
index 378d273055ee..b13c4754ec3c 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1307,6 +1307,7 @@ static int s5k5baf_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5k5baf_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1370,6 +1371,7 @@ static int s5k5baf_is_bound_target(u32 target)
 }
 
 static int s5k5baf_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1463,6 +1465,7 @@ static bool s5k5baf_cmp_rect(const struct v4l2_rect *r1,
 }
 
 static int s5k5baf_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index ba6477e88da3..071b31728a00 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -131,6 +131,7 @@ static struct v4l2_mbus_framefmt *__s5k6a3_get_format(
 }
 
 static int s5k6a3_set_fmt(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
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
index c6bf0b0902e8..6e2a3e4a63f7 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -563,6 +563,7 @@ static int saa6752hs_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 7cce90750c93..821684e909b2 100644
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
index 0536ceb54650..367539667948 100644
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
index fbd38bbfee03..c79ce2f7a6b9 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1816,6 +1816,7 @@ static int tc358743_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int tc358743_set_fmt(struct v4l2_subdev *sd,
+		const struct v4l2_subdev_client_info *ci,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 86d9ba3ea4e5..d55539c35a26 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -873,6 +873,7 @@ static int tc358746_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int tc358746_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index afa1d6f34c9c..bbc8e3ff5175 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1798,6 +1798,7 @@ static int tda1997x_get_format(struct v4l2_subdev *sd,
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
index 376eecb0b673..ad3908560349 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -880,6 +880,7 @@ static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int tvp514x_set_pad_format(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 9c204f38935d..91064f06f8c1 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1104,6 +1104,7 @@ static void tvp5150_set_hw_selection(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_set_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1156,6 +1157,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
@@ -1724,7 +1726,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
 static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
 	.enum_mbus_code = tvp5150_enum_mbus_code,
 	.enum_frame_size = tvp5150_enum_frame_size,
-	.set_fmt = tvp5150_fill_fmt,
 	.get_fmt = tvp5150_fill_fmt,
 	.get_selection = tvp5150_get_selection,
 	.set_selection = tvp5150_set_selection,
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index 3979ccde5a95..ada28cb8af7c 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -854,6 +854,7 @@ tvp7002_get_pad_format(struct v4l2_subdev *sd,
  */
 static int
 tvp7002_set_pad_format(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 617fcf7f0b45..60c102aba750 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -198,6 +198,7 @@ static int tw9900_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int tw9900_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 872207e688bf..731c97a40c82 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -715,6 +715,7 @@ static int tw9910_set_frame(struct v4l2_subdev *sd, u32 *width, u32 *height)
 }
 
 static int tw9910_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -792,6 +793,7 @@ static int tw9910_s_fmt(struct v4l2_subdev *sd,
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
index 3fb2166c81ef..e7819691723d 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -652,6 +652,7 @@ static int vgxy61_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int vgxy61_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
@@ -1197,6 +1198,7 @@ static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int vgxy61_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
@@ -1260,7 +1262,7 @@ static int vgxy61_init_state(struct v4l2_subdev *sd,
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
index 51fd9576c6c2..ad89e62a2747 100644
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
index 986b9afd7cb5..3333cdd81c13 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1229,6 +1229,7 @@ static int cio2_subdev_init_state(struct v4l2_subdev *sd,
 }
 
 static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
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
index dbd6f76a066d..ab04b5b0ad08 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -160,6 +160,7 @@ u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y)
 }
 
 int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 35069099c364..d4f76d513dc6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -31,6 +31,7 @@ bool ipu6_isys_is_bayer_format(u32 code);
 u32 ipu6_isys_convert_bayer_order(u32 code, int x, int y);
 
 int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *fmt);
 int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
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
index fc95f0bf48d5..aba55fcc1e22 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -587,7 +587,7 @@ static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 	format.format.width = fmt->fmt.pix.width;
 	format.format.height = h;
 	format.format.code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, &format);
+	v4l2_subdev_call(itv->sd_video, pad, set_fmt, NULL, NULL, &format);
 	return ivtv_g_fmt_vid_cap(file, fh, fmt);
 }
 
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 8c4f70e4177d..d04a68bb05d8 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
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
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..03752d88c0b6 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -890,6 +890,7 @@ static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
 };
 
 static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 0cebb39f98e1..856a2a0b4a12 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -240,7 +240,7 @@ static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev,
 	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
 	fmt.format.width = pix_fmt->width;
 	fmt.format.height = pix_fmt->height;
-	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, &fmt);
+	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, NULL, &fmt);
 }
 
 static int isp4vid_s_fmt_vid_cap(struct file *file, void *priv,
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
index 4bd98fb9c7e9..6f75112723b5 100644
--- a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
+++ b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
@@ -521,6 +521,7 @@ static int c3_mipi_adap_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index b9e4ef3fc308..0c399665f7fa 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -491,6 +491,7 @@ static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index e128adf6ee37..c8464dec9a21 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -203,6 +203,7 @@ static int mali_c55_isp_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
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
index c4f46651dcee..5833f72fdc97 100644
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
+		return mali_c55_rsz_set_sink_fmt(sd, ci, state, format);
 
-	return mali_c55_rsz_set_source_fmt(sd, state, format);
+	return mali_c55_rsz_set_source_fmt(sd, ci, state, format);
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
+		return mali_c55_rsz_set_crop(sd, ci, state, sel);
 
 	if (sel->target == V4L2_SEL_TGT_COMPOSE)
-		return mali_c55_rsz_set_compose(sd, state, sel);
+		return mali_c55_rsz_set_compose(sd, ci, state, sel);
 
 	return -EINVAL;
 }
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
index 894f4cf377af..cc390a3fc253 100644
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
index 8d28ba0b59a3..0cd9c8776acc 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1327,6 +1327,7 @@ static int unicam_subdev_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int unicam_subdev_set_format(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 1ff2d8f78d5b..07cba5eea5fc 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -622,6 +622,7 @@ static int csi2rx_set_routing(struct v4l2_subdev *subdev,
 }
 
 static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 629b0fa838a2..07277866dca7 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -201,6 +201,7 @@ static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int csi2tx_set_pad_format(struct v4l2_subdev *subdev,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
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
index 70303a0b6919..347e44fcd9ee 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -245,6 +245,7 @@ static int csi2dc_get_fmt(struct v4l2_subdev *csi2dc_sd,
 }
 
 static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *req_fmt)
 {
diff --git a/drivers/media/platform/microchip/microchip-isc-scaler.c b/drivers/media/platform/microchip/microchip-isc-scaler.c
index e83463543e21..192532f87271 100644
--- a/drivers/media/platform/microchip/microchip-isc-scaler.c
+++ b/drivers/media/platform/microchip/microchip-isc-scaler.c
@@ -46,6 +46,7 @@ static int isc_scaler_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int isc_scaler_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *req_fmt)
 {
@@ -124,6 +125,7 @@ static int isc_scaler_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int isc_scaler_g_sel(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 5f9691d76434..1b9012dbae39 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1104,6 +1104,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *sdformat)
 {
@@ -1225,7 +1226,7 @@ static int mipi_csis_init_state(struct v4l2_subdev *sd,
 		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
 					      fmt.format.ycbcr_enc);
 
-	return mipi_csis_set_fmt(sd, state, &fmt);
+	return mipi_csis_set_fmt(sd, NULL, state, &fmt);
 }
 
 static int mipi_csis_log_status(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 7ddc7ba06e3d..0b2ee4dfdcbb 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1890,6 +1890,7 @@ static void imx7_csi_try_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index c580c831972e..127c9cada81f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -248,6 +248,7 @@ static int mxc_isi_crossbar_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 2d0843c86534..e4ec2bc4fd96 100644
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
index 04ebed8a0493..17756b7fe1dd 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -597,6 +597,7 @@ static int imx8mq_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a981..a00791b00feb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -987,6 +987,7 @@ static int csid_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1036,7 +1037,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return csid_set_format(sd, fh ? fh->state : NULL, &format);
+	return csid_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 539ac4888b60..0dd50f3879d9 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -503,6 +503,7 @@ static int csiphy_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csiphy_set_format(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
@@ -555,7 +556,7 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
 		}
 	};
 
-	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
+	return csiphy_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 static bool __printf(2, 3)
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index aaf3caa42d33..b45080e98123 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1037,6 +1037,7 @@ static int ispif_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int ispif_set_format(struct v4l2_subdev *sd,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
@@ -1085,7 +1086,7 @@ static int ispif_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return ispif_set_format(sd, fh ? fh->state : NULL, &format);
+	return ispif_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index c5b75132add4..5764a60fa34c 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -292,6 +292,7 @@ static int tpg_get_format(struct v4l2_subdev *sd,
 }
 
 static int tpg_set_format(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -322,7 +323,7 @@ static int tpg_init_formats(struct v4l2_subdev *sd,
 		}
 	};
 
-	return tpg_set_format(sd, fh ? fh->state : NULL, &format);
+	return tpg_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d19158988..c14d97a131f6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1562,6 +1562,7 @@ static int vfe_get_format(struct v4l2_subdev *sd,
 }
 
 static int vfe_set_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel);
 
@@ -1574,6 +1575,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_set_format(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -1608,7 +1610,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
 		sel.target = V4L2_SEL_TGT_COMPOSE;
 		sel.r.width = fmt->format.width;
 		sel.r.height = fmt->format.height;
-		ret = vfe_set_selection(sd, sd_state, &sel);
+		ret = vfe_set_selection(sd, ci, sd_state, &sel);
 		if (ret < 0)
 			return ret;
 	}
@@ -1625,6 +1627,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_get_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -1695,6 +1698,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_set_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -1721,7 +1725,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 		crop.pad = MSM_VFE_PAD_SRC;
 		crop.target = V4L2_SEL_TGT_CROP;
 		crop.r = *rect;
-		ret = vfe_set_selection(sd, sd_state, &crop);
+		ret = vfe_set_selection(sd, ci, sd_state, &crop);
 	} else if (sel->target == V4L2_SEL_TGT_CROP &&
 		sel->pad == MSM_VFE_PAD_SRC) {
 		struct v4l2_subdev_format fmt = { 0 };
@@ -1742,7 +1746,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 
 		fmt.format.width = rect->width;
 		fmt.format.height = rect->height;
-		ret = vfe_set_format(sd, sd_state, &fmt);
+		ret = vfe_set_format(sd, ci, sd_state, &fmt);
 	} else {
 		ret = -EINVAL;
 	}
@@ -1772,7 +1776,7 @@ static int vfe_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return vfe_set_format(sd, fh ? fh->state : NULL, &format);
+	return vfe_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
 /*
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
index 05762b1be2bc..ea21fb1f60cf 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
@@ -429,6 +429,7 @@ static int pisp_fe_init_state(struct v4l2_subdev *sd,
 }
 
 static int pisp_fe_pad_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..ffbe9ded82f3 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1884,6 +1884,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..b21940a8a18c 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -331,6 +331,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 }
 
 static int risp_set_pad_format(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
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
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
index b1659544eaa0..04e168b9526f 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
@@ -157,6 +157,7 @@ static int rzv2h_ivc_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int rzv2h_ivc_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/renesas/sh_vou.c b/drivers/media/platform/renesas/sh_vou.c
index 4ad7ae188d5b..6d4ec80edd8f 100644
--- a/drivers/media/platform/renesas/sh_vou.c
+++ b/drivers/media/platform/renesas/sh_vou.c
@@ -714,7 +714,7 @@ static int sh_vou_set_fmt_vid_out(struct sh_vou_device *vou_dev,
 	mbfmt->width = geo.output.width;
 	mbfmt->height = geo.output.height;
 	ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
-					 set_fmt, NULL, &format);
+					 set_fmt, NULL, NULL, &format);
 	/* Must be implemented, so, don't check for -ENOIOCTLCMD */
 	if (ret < 0)
 		return ret;
@@ -974,11 +974,11 @@ static int sh_vou_s_selection(struct file *file, void *fh,
 	 * final encoder configuration.
 	 */
 	v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
-				   set_selection, NULL, &sd_sel);
+				   set_selection, NULL, NULL, &sd_sel);
 	format.format.width = geo.output.width;
 	format.format.height = geo.output.height;
 	ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
-					 set_fmt, NULL, &format);
+					 set_fmt, NULL, NULL, &format);
 	/* Must be implemented, so, don't check for -ENOIOCTLCMD */
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 325be30836d7..c4659e1d3488 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -124,6 +124,7 @@ static void brx_try_format(struct vsp1_brx *brx,
 }
 
 static int brx_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
@@ -167,6 +168,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 }
 
 static int brx_get_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -202,6 +204,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int brx_set_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index f6fbd3475329..5eb262a88f9f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -137,7 +137,8 @@ static int vsp1_du_insert_uif(struct vsp1_device *vsp1,
 
 	format.pad = UIF_PAD_SINK;
 
-	ret = v4l2_subdev_call(&uif->subdev, pad, set_fmt, NULL, &format);
+	ret = v4l2_subdev_call(&uif->subdev, pad, set_fmt, NULL, NULL,
+			       &format);
 	if (ret < 0)
 		return ret;
 
@@ -184,7 +185,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	format.format.ycbcr_enc = input->ycbcr_enc;
 	format.format.quantization = input->quantization;
 
-	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -199,6 +200,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	sel.r = input->crop;
 
 	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_selection, NULL,
+			       NULL,
 			       &sel);
 	if (ret < 0)
 		return ret;
@@ -226,7 +228,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 
 	format.format.code = MEDIA_BUS_FMT_ARGB8888_1X32;
 
-	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -240,7 +242,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	/* BRx sink, propagate the format from the RPF source. */
 	format.pad = brx_input;
 
-	ret = v4l2_subdev_call(&pipe->brx->subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->brx->subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -254,6 +256,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
 	sel.r = vsp1->drm->inputs[rpf->entity.index].compose;
 
 	ret = v4l2_subdev_call(&pipe->brx->subdev, pad, set_selection, NULL,
+			       NULL,
 			       &sel);
 	if (ret < 0)
 		return ret;
@@ -387,7 +390,7 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
 	format.format.height = drm_pipe->height;
 	format.format.field = V4L2_FIELD_NONE;
 
-	ret = v4l2_subdev_call(&brx->subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&brx->subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -539,7 +542,8 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 	format.format.code = MEDIA_BUS_FMT_ARGB8888_1X32;
 	format.format.field = V4L2_FIELD_NONE;
 
-	ret = v4l2_subdev_call(&pipe->output->entity.subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->output->entity.subdev, pad, set_fmt,
+			       NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
@@ -559,7 +563,7 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 		format.format.code, pipe->output->entity.index);
 
 	format.pad = LIF_PAD_SINK;
-	ret = v4l2_subdev_call(&pipe->lif->subdev, pad, set_fmt, NULL,
+	ret = v4l2_subdev_call(&pipe->lif->subdev, pad, set_fmt, NULL, NULL,
 			       &format);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 2ae2a573f0de..e03b1f6b5b89 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -300,6 +300,7 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
  * entity's limits, and propagates the sink pad format to the source pad.
  */
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -382,7 +383,8 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 			       : V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
-		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
+		v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state,
+				 &format);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index c0c1fe7d3e40..677a1efc104a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -188,6 +188,7 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt);
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt);
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 97dbfb93abe9..bd9efb42fd1f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -185,6 +185,7 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int histo_get_selection(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
@@ -306,6 +307,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_selection(struct v4l2_subdev *subdev,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
@@ -330,6 +332,7 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_format(struct v4l2_subdev *subdev,
+			    const struct v4l2_subdev_client_info *ci,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index df069c228243..d734b5775af6 100644
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
index ced01870acd6..ff5894265b54 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -110,6 +110,7 @@ static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
@@ -214,6 +215,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
@@ -255,6 +257,7 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 3fd9fde5c724..5e1cf60be311 100644
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
index 9f7bb112929e..d129964ec14d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -193,6 +193,7 @@ static void uds_try_format(struct vsp1_uds *uds,
 }
 
 static int uds_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index 52dbfe58a70d..16ddcd594134 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -54,6 +54,7 @@ static const unsigned int uif_codes[] = {
 };
 
 static int uif_get_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -92,6 +93,7 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int uif_set_selection(struct v4l2_subdev *subdev,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
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
index 414a9980cf2e..2cba42d7c5d9 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -25,6 +25,7 @@ static const struct media_entity_operations rkcif_interface_media_ops = {
 };
 
 static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
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
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index ddc6182f3e4b..9fa8a0407c90 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -304,6 +304,7 @@ static int rkisp1_csi_init_state(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
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
index d85811f4b8c5..8d7e7b190532 100644
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
 
@@ -804,7 +805,7 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
 				sfmt.pad = me->num_pads - 1;
 				mf->code = tfmt->code;
 				ret = v4l2_subdev_call(sd, pad, set_fmt, NULL,
-									&sfmt);
+						       NULL, &sfmt);
 				if (ret)
 					return ret;
 			}
@@ -1509,6 +1510,7 @@ static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -1575,6 +1577,7 @@ static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
@@ -1631,6 +1634,7 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_set_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
index 3c5d7bee2655..a0a9093081dd 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
@@ -191,6 +191,7 @@ static void __isp_subdev_try_format(struct fimc_isp *isp,
 }
 
 static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 8be20fd32d1c..1b7bae15189b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1052,6 +1052,7 @@ static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -1113,6 +1114,7 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
@@ -1148,6 +1150,7 @@ static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_set_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 452880b5350c..da6e67a79c09 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -575,6 +575,7 @@ static struct v4l2_mbus_framefmt *__s5pcsis_get_format(
 }
 
 static int s5pcsis_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index ed1a1d693293..98dfd394a1aa 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -1275,6 +1275,7 @@ static void __camif_subdev_try_format(struct camif_dev *camif,
 }
 
 static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
@@ -1342,6 +1343,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s3c_camif_subdev_get_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
@@ -1429,6 +1431,7 @@ static void __camif_try_crop(struct camif_dev *camif, struct v4l2_rect *r)
 }
 
 static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
+					  const struct v4l2_subdev_client_info *ci,
 					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..2ab5a2008818 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -228,7 +228,7 @@ static int camif_register_sensor(struct camif_dev *camif)
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
index eeb0199864dd..d61715c3a421 100644
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
@@ -1063,7 +1063,8 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
+	ret = v4l2_subdev_call_ci_state_try(dcmi->source, pad, set_fmt,
+					    &format);
 	if (ret < 0)
 		return ret;
 
@@ -1224,7 +1225,8 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
+	ret = v4l2_subdev_call_ci_state_try(dcmi->source, pad, set_fmt,
+					    &format);
 	if (ret < 0)
 		return ret;
 
@@ -1246,7 +1248,7 @@ static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
 	/*
 	 * Get sensor bounds first
 	 */
-	ret = v4l2_subdev_call(dcmi->source, pad, get_selection,
+	ret = v4l2_subdev_call(dcmi->source, pad, get_selection, NULL,
 			       NULL, &bounds);
 	if (!ret)
 		*r = bounds.r;
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
index 744197b0fccb..af35ece1d5cf 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -295,6 +295,7 @@ static int sun4i_csi_subdev_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun4i_csi_subdev_set_fmt(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..b80b350bb6c3 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -558,6 +558,7 @@ static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
+				    const struct v4l2_subdev_client_info *ci,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..82ad1a42b978 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -362,6 +362,7 @@ static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index dbc51daa4fe3..e1b961246ced 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -398,6 +398,7 @@ static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
+					const struct v4l2_subdev_client_info *ci,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e..b7247d597c9c 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -479,6 +479,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 1ca559df7e59..3cd5ee69d3c4 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -1314,7 +1314,7 @@ static int __subdev_set_format(struct vpfe_device *vpfe,
 
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 00a71dac0ff4..a978d27fe029 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -762,6 +762,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab1127..036d653c8bc3 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
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
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4769931b1930..0070cda59182 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1043,6 +1043,7 @@ static int ti_csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index 4708b6303493..f422d70ab6e4 100644
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
@@ -2346,6 +2348,7 @@ static int ccdc_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ccdc_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -2472,7 +2475,7 @@ static int ccdc_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ccdc_set_format(sd, fh ? fh->state : NULL, &format);
+	ccdc_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index d668111b44f4..c0da5cca9ddc 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -776,6 +776,7 @@ static int ccp2_get_format(struct v4l2_subdev *sd,
  * returns zero
  */
 static int ccp2_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -820,7 +821,7 @@ static int ccp2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ccp2_set_format(sd, fh ? fh->state : NULL, &format);
+	ccp2_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
index f227042b61b6..8fc2948d654c 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
@@ -994,6 +994,7 @@ static int csi2_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
@@ -1038,7 +1039,7 @@ static int csi2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	csi2_set_format(sd, fh ? fh->state : NULL, &format);
+	csi2_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 3f3b5bd9cdc7..ac5025ce4315 100644
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
@@ -2035,6 +2037,7 @@ static int preview_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int preview_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -2090,7 +2093,7 @@ static int preview_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	preview_set_format(sd, fh ? fh->state : NULL, &format);
+	preview_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index ad0127f5b5cb..874aa451a2d0 100644
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
@@ -1500,6 +1502,7 @@ static int resizer_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int resizer_set_format(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
@@ -1577,7 +1580,7 @@ static int resizer_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	resizer_set_format(sd, fh ? fh->state : NULL, &format);
+	resizer_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index b946c8087c77..cd324c730318 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -839,7 +839,7 @@ isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 	 * implemented.
 	 */
 	sdsel.pad = pad;
-	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel);
 	if (!ret)
 		sel->r = sdsel.r;
 	if (ret != -ENOIOCTLCMD)
@@ -890,7 +890,7 @@ isp_video_set_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 
 	sdsel.pad = pad;
 	mutex_lock(&video->mutex);
-	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
 	mutex_unlock(&video->mutex);
 	if (!ret)
 		sel->r = sdsel.r;
diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index cb0a5a07a3d4..baa4c8cc5447 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -1731,7 +1731,7 @@ static int vip_s_fmt_vid_cap(struct file *file, void *priv,
 
 	sfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sfmt.pad = 0;
-	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, &sfmt);
+	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, NULL, &sfmt);
 	if (ret) {
 		v4l2_dbg(1, debug, &dev->v4l2_dev, "set_fmt failed in subdev\n");
 		return ret;
@@ -2598,7 +2598,7 @@ static int vip_init_port(struct vip_port *port)
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
index 146131b8f37e..2f6f3af4e492 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -694,6 +694,7 @@ static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
 }
 
 static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 7deec6e37edc..bf39ddb9c296 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -278,6 +278,7 @@ static int xtpg_get_format(struct v4l2_subdev *subdev,
 }
 
 static int xtpg_set_format(struct v4l2_subdev *subdev,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index 0c2e715a8a16..cfda447a5b76 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -240,6 +240,7 @@ static void vimc_debayer_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
 }
 
 static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
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
index 0901d79e827d..a67e995f9628 100644
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
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c2be59e4c4a7..88280be29515 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -257,12 +257,13 @@ static int call_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int call_set_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
 	return check_format(sd, state, format) ? :
 		sd->ops->pad->set_fmt ?
-		sd->ops->pad->set_fmt(sd, state, format) :
+		sd->ops->pad->set_fmt(sd, ci, state, format) :
 		sd->ops->pad->get_fmt ?
 		sd->ops->pad->get_fmt(sd, state, format) : -ENOIOCTLCMD;
 }
@@ -348,19 +349,21 @@ static inline int check_selection(struct v4l2_subdev *sd,
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
 	return do_subdev_call(sd, check_selection(sd, state, sel),
-			      pad, get_selection, state, sel);
+			      pad, get_selection, ci, state, sel);
 }
 
 static int call_set_selection(struct v4l2_subdev *sd,
+			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
 	return do_subdev_call(sd, check_selection(sd, state, sel),
-			      pad, set_selection, state, sel);
+			      pad, set_selection, ci, state, sel);
 }
 
 static inline int check_frame_interval(struct v4l2_subdev *sd,
@@ -569,6 +572,21 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 			v4l2_subdev_unlock_state(state);                   \
 		return ret;                                                \
 	}
+#define DEFINE_CI_STATE_WRAPPER(f, arg_type)                               \
+	static int call_##f##_state(struct v4l2_subdev *sd,		   \
+				    const struct v4l2_subdev_client_info *ci, \
+				    struct v4l2_subdev_state *_state,      \
+				    arg_type *arg) \
+	{                                                                  \
+		struct v4l2_subdev_state *state = _state;                  \
+		int ret;                                                   \
+		if (!_state)                                               \
+			state = v4l2_subdev_lock_and_get_active_state(sd); \
+		ret = call_##f(sd, ci, state, arg);			   \
+		if (!_state && state)                                      \
+			v4l2_subdev_unlock_state(state);                   \
+		return ret;                                                \
+	}
 
 #else /* CONFIG_MEDIA_CONTROLLER */
 
@@ -580,15 +598,24 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 		return call_##f(sd, state, arg);                     \
 	}
 
+#define DEFINE_CI_STATE_WRAPPER(f, arg_type)                            \
+	static int call_##f##_state(struct v4l2_subdev *sd,          \
+				    const struct v4l2_subdev_client_info *ci, \
+				    struct v4l2_subdev_state *state, \
+				    arg_type *arg)                   \
+	{                                                            \
+		return call_##f(sd, ci, state, arg);		     \
+	}
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
-DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
+DEFINE_CI_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
 DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
 DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
 DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
-DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
-DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
+DEFINE_CI_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
+DEFINE_CI_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
 
 static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.get_fmt		= call_get_fmt_state,
@@ -863,7 +890,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->ci, state,
+					format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -880,8 +908,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 
-		rval = v4l2_subdev_call(
-			sd, pad, get_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -906,8 +934,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		sel.target = V4L2_SEL_TGT_CROP;
 		sel.r = crop->rect;
 
-		rval = v4l2_subdev_call(
-			sd, pad, set_selection, state, &sel);
+		rval = v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, &sel);
 
 		crop->rect = sel.r;
 
@@ -977,8 +1005,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, get_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -991,8 +1019,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			sel->stream = 0;
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
-		return v4l2_subdev_call(
-			sd, pad, set_selection, state, sel);
+		return v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
+					state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f9cc5f45fe00..38f69582c174 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -520,6 +520,7 @@ static int gc2235_startup(struct v4l2_subdev *sd)
 }
 
 static int gc2235_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..e3137fbc5802 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -623,6 +623,7 @@ static int ov2722_startup(struct v4l2_subdev *sd)
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..52c71cd86dec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3745,14 +3745,16 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
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
@@ -3765,13 +3767,16 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
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
@@ -3783,7 +3788,8 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
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
index 95b9113d75e9..71df4ef629c2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -123,6 +123,7 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_set_format(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *ci,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9de9cd884d99..bdd2d9b18da2 100644
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
@@ -555,6 +557,7 @@ static int isp_subdev_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int isp_subdev_set_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..476fe143a591 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -913,7 +913,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_NATIVE_SIZE;
-	err = v4l2_subdev_call(input->sensor, pad, get_selection,
+	err = v4l2_subdev_call(input->sensor, pad, get_selection, NULL,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
@@ -922,7 +922,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP_DEFAULT;
-	err = v4l2_subdev_call(input->sensor, pad, get_selection,
+	err = v4l2_subdev_call(input->sensor, pad, get_selection, NULL,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
@@ -968,7 +968,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	if (!input->sensor->state_lock)
 		v4l2_subdev_lock_state(input->try_sd_state);
 
-	err = v4l2_subdev_call(input->sensor, pad, set_selection,
+	err = v4l2_subdev_call(input->sensor, pad, set_selection, NULL,
 			       input->try_sd_state, &sel);
 
 	if (!input->sensor->state_lock)
@@ -980,7 +980,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
-	err = v4l2_subdev_call(input->sensor, pad, set_selection,
+	err = v4l2_subdev_call(input->sensor, pad, set_selection, NULL,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..46ac33821f89 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -151,6 +151,7 @@ static int prp_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int prp_set_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..5ee59b418a5e 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -919,6 +919,7 @@ static void prp_try_fmt(struct prp_priv *priv,
 }
 
 static int prp_set_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index ef22a083f8eb..43c637b333f2 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1525,6 +1525,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
@@ -1593,6 +1594,7 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int csi_get_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
@@ -1657,6 +1659,7 @@ static int csi_set_scale(u32 *compose, u32 crop, u32 flags)
 }
 
 static int csi_set_selection(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 58f1112e28e5..8dcbb6fe7649 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -566,6 +566,7 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 }
 
 static int vdic_set_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 211f67fb92b5..f6cbf0310e89 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -525,6 +525,7 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int csi2_set_fmt(struct v4l2_subdev *sd,
+			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d342f4..61fdefe78c3d 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -145,6 +145,7 @@ static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
+			       const struct v4l2_subdev_client_info *ci,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
@@ -212,6 +213,7 @@ imgu_subdev_get_compose(struct imgu_v4l2_subdev *sd,
 }
 
 static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
@@ -236,6 +238,7 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
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
index 67a776033d5b..2cb0521b4240 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -99,6 +99,7 @@ u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y)
 }
 
 int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.h b/drivers/staging/media/ipu7/ipu7-isys-subdev.h
index faa50031cf24..c3585d1c4128 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.h
@@ -31,6 +31,7 @@ bool ipu7_isys_is_bayer_format(u32 code);
 u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y);
 
 int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format);
 int ipu7_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e04895..94ae304ac85f 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -264,7 +264,6 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index 46a334b602f1..3f376af6c228 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -313,6 +313,7 @@ static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
+				  const struct v4l2_subdev_client_info *ci,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *format)
 {
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 41d57dac61a7..5a5fca378ae6 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -170,6 +170,7 @@ static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
 }
 
 static int csi_set_format(struct v4l2_subdev *subdev,
+			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 456134a9e8cf..c4d42fbac038 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -477,7 +477,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
 		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
-		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
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
 
@@ -626,7 +626,7 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 	 * Try the get selection operation and fallback to get format if not
 	 * implemented.
 	 */
-	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel);
 	if (!ret)
 		sel->r = sdsel.r;
 	if (ret != -ENOIOCTLCMD)
@@ -667,7 +667,7 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	if (vb2_is_busy(&chan->queue))
 		return -EBUSY;
 
-	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, &sdsel);
+	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
 	if (!ret) {
 		sel->r = sdsel.r;
 		/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 056eaa949786..f3fe12cc096e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -755,11 +755,14 @@ struct v4l2_subdev_client_info {
  *
  * @get_fmt: callback for VIDIOC_SUBDEV_G_FMT() ioctl handler code.
  *
- * @set_fmt: callback for VIDIOC_SUBDEV_S_FMT() ioctl handler code.
+ * @set_fmt: callback for VIDIOC_SUBDEV_S_FMT() ioctl handler code. The ci
+ *	     pointer may be NULL for in-kernel calls.
  *
  * @get_selection: callback for VIDIOC_SUBDEV_G_SELECTION() ioctl handler code.
+ *		   The ci pointer may be NULL for in-kernel calls.
  *
  * @set_selection: callback for VIDIOC_SUBDEV_S_SELECTION() ioctl handler code.
+ *		   The ci pointer may be NULL for in-kernel calls.
  *
  * @get_frame_interval: callback for VIDIOC_SUBDEV_G_FRAME_INTERVAL()
  *			ioctl handler code.
@@ -854,12 +857,15 @@ struct v4l2_subdev_pad_ops {
 		       struct v4l2_subdev_state *state,
 		       struct v4l2_subdev_format *format);
 	int (*set_fmt)(struct v4l2_subdev *sd,
+		       const struct v4l2_subdev_client_info *ci,
 		       struct v4l2_subdev_state *state,
 		       struct v4l2_subdev_format *format);
 	int (*get_selection)(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
 	int (*set_selection)(struct v4l2_subdev *sd,
+			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
 	int (*get_frame_interval)(struct v4l2_subdev *sd,
-- 
2.47.3


