Return-Path: <linux-media+bounces-40928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7018B33BBC
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FE8C1643FD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DD4280018;
	Mon, 25 Aug 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzkrGxiS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4202D0C9D
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115482; cv=none; b=Lnn3LLAsEHw9lCNejTxLfbKhJ/9YPS6SbmQWDo12na3aEeIFMw+Rjn2i/2hrDuf2uaEQ1xHvH94WXKTeNpbknUMjQUjFb2eAa8jWu/GDNBudh9ogmAxuwZAl3sfC4kmo/UcYVUJp7lSmXjsz9jcyvj4RyWLVkeBZRzcV1PU+RXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115482; c=relaxed/simple;
	bh=iIZt5PCRiwvzE7LkkOpyQfaGzwmtzvBLLPxN2Kxhq+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PekN4MpO5OxzGM0oQoOC6tzrKbJ2KpOUozc/06XkuDv7xE+BXfStY1jw3ebJjNb9rPi0bgEC/nZ5NJZV0I69nrm83eAw28a3kIdymRs/b8sTRciIFDg7/u58Dv6P0gNm52Y5vNvNkPfLpX2q/xfrALR9lqo4k2NkD7tELJXBmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzkrGxiS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115481; x=1787651481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iIZt5PCRiwvzE7LkkOpyQfaGzwmtzvBLLPxN2Kxhq+c=;
  b=WzkrGxiSw0n5rFvMm1h+hYtbBGyX7apES97WoPEVN3nXwRg5Oo8fKMxq
   sF7xK7vLsjrAvOnhwBdfNKxhoZZX/Xy1B3bw6u4YBNGGlwQKCbmiV7hCf
   k55u3j17Tsf/o37JWvo8ZQQYwYn5knyrAovOy3THGmgTMCCt7NoOedK6Q
   H7vgZMiVOgA6+X9wLT+KWhn52nTNivmzbh6ufAPYcWqwmb+CNBdSdgH3A
   kJeysId6bN6EVR2JnGbrol0XiKIhiGhNwRmbZPABdZ2/FlP4dPaWjs8y+
   Km9Mn3Pt4d7YpeydQNY/84IZ+HdYhotvmAVM2PW53p6CgfXdnCpQyXUUP
   g==;
X-CSE-ConnectionGUID: ZFfTNKveS0yw+JiFlDPkgg==
X-CSE-MsgGUID: RsAHV3ckT9e1Tvrvrpnnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695729"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:17 -0700
X-CSE-ConnectionGUID: PloD02gBQsysIn8vS0Ookg==
X-CSE-MsgGUID: 7zFyZZdxRbC8XIFHWA6UQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195355"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12447120783;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adM-05rs;
	Mon, 25 Aug 2025 12:51:08 +0300
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
Subject: [PATCH v11 02/66] media: Documentation: Fix routing documentation flag references
Date: Mon, 25 Aug 2025 12:50:03 +0300
Message-ID: <20250825095107.1332313-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The routing flag indicating an active route is called
V4L2_SUBDEV_ROUTE_FL_ACTIVE, not V4L2_SUBDEV_STREAM_FL_ACTIVE. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 24a69c419dfe..f30a98a9cf78 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -577,15 +577,14 @@ Device types and routing setup
 
 Different kinds of sub-devices have differing behaviour for route activation,
 depending on the hardware. In all cases, however, only routes that have the
-``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
+``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
 
 Devices generating the streams may allow enabling and disabling some of the
 routes or have a fixed routing configuration. If the routes can be disabled, not
-declaring the routes (or declaring them without
-``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
-disable the routes. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
-back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
-flag unset.
+declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
+flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
+``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
+the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
 
 Devices transporting the streams almost always have more configurability with
 respect to routing. Typically any route between the sub-device's sink and source
-- 
2.47.2


