Return-Path: <linux-media+bounces-35268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B914AE04C4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 378B35A43BA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA0325392E;
	Thu, 19 Jun 2025 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWt4r7AT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AE233158
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334332; cv=none; b=FPGcOiKMzN/DqISX4lbdaUXY+KMV4Li07AsJ2JxXLzHo0MpjRQd3mXvV/3CsK+3qDdGSVGL4hyjVS+QSq20qjvOfzpezXp8f62QuDPC4+fNXJE7buuWyO4MGyW0E5xRjysp3jUEeOCLL6D2YAiFVBTogXvWU5IXJAdCXyG93NNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334332; c=relaxed/simple;
	bh=Gkk1y1UO0Vaf8YbxTB14PodwdDAc1GlOlzdIXfyhZy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJiYPyeI3evOgj0nMaHQr59XZJGk0AMMQhM/TpJhiSMTIgiK++/uguz0uPtDSzDTZykQB4yLyq7msZJInCwf5TLYOZ+iYylxEiMPc0tHlqirlXQSGh0PsZKV30Ty/QRApjiHC3jwD2nu9qkagAycV3BVLcpsyqlS1UY0UeLm6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWt4r7AT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334331; x=1781870331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gkk1y1UO0Vaf8YbxTB14PodwdDAc1GlOlzdIXfyhZy8=;
  b=WWt4r7ATc9L6U7i3zf3HqN7NdYv/9FCSQz7Qi6oetgjyb8iSzJ01mnzq
   21zaBjHSMHOvnTdeqNurUlhxDWwx8t8ngN6qAdf1ed4e1yK9dUmpjsIDB
   9p2PeVmtcTKuXNAR1Bg1wTjvCHoo8jwLERblr4PDBoZhzZpH3B16I+/Yi
   hC9/woVtZzOFuYEsYtZyBB+uK0/F/ZdCh170/1JL4RrP/sm81227BD3Mj
   yBh/mkmBnv4WD4aYRtaYSeKv379OtlxGU5cnp7h2Yd8+TFbirOw0L/tuS
   Odvrn0TmweiPu7jgR68qLsQKVAA58y4s9lp7EVOMLit0XJxwaheWLS6An
   A==;
X-CSE-ConnectionGUID: +d1Moa0zRh67qcENwzOp+g==
X-CSE-MsgGUID: TTZw6VABQfm54MJKjBgBdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014761"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:46 -0700
X-CSE-ConnectionGUID: EhKTKcjuQz6vH2WouQ1EMA==
X-CSE-MsgGUID: vDgw0HWmTMC7bgmiRAA4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192129"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A5522120339;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AHj-25;
	Thu, 19 Jun 2025 14:58:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 02/64] media: Documentation: Move streams documentation one level up
Date: Thu, 19 Jun 2025 14:57:34 +0300
Message-Id: <20250619115836.1946016-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While streams can be found within pads, they do deserve their own
documentation section on the same level than pads. Move them one level up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 161b43f1ce66..225a45fef994 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -509,7 +509,7 @@ source pads.
 .. _subdev-routing:
 
 Streams, multiplexed media pads and internal routing
-----------------------------------------------------
+====================================================
 
 Simple V4L2 sub-devices do not support multiple, unrelated video streams,
 and only a single stream can pass through a media link and a media pad.
@@ -534,7 +534,7 @@ does not support streams, then only stream 0 of source end may be captured.
 There may be additional limitations specific to the sink device.
 
 Understanding streams
-^^^^^^^^^^^^^^^^^^^^^
+---------------------
 
 A stream is a stream of content (e.g. pixel data or metadata) flowing through
 the media pipeline from a source (e.g. a sensor) towards the final sink (e.g. a
@@ -554,7 +554,7 @@ sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
 Interaction between routes, streams, formats and selections
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+-----------------------------------------------------------
 
 The addition of streams to the V4L2 sub-device interface moves the sub-device
 formats and selections from pads to (pad, stream) pairs. Besides the
@@ -573,7 +573,7 @@ are independent of similar configurations on other streams. This is
 subject to change in the future.
 
 Device types and routing setup
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+------------------------------
 
 Different kinds of sub-devices have differing behaviour for route activation,
 depending on the hardware. In all cases, however, only routes that have the
@@ -596,7 +596,7 @@ called on the sub-device. Such newly created routes have the device's default
 configuration for format and selection rectangles.
 
 Configuring streams
-^^^^^^^^^^^^^^^^^^^
+-------------------
 
 The configuration of the streams is done individually for each sub-device and
 the validity of the streams between sub-devices is validated when the pipeline
@@ -619,7 +619,7 @@ There are three steps in configuring the streams:
    :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+---------------------------------
 
 A simple example of a multiplexed stream setup might be as follows:
 
-- 
2.39.5


