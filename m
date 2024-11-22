Return-Path: <linux-media+bounces-21821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34AC9D5CF5
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8011B1F22CB0
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4576E1DF24E;
	Fri, 22 Nov 2024 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1wUDwLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E341DEFE9
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270023; cv=none; b=brnacnp0dy+GbblHMNLcHrSvPcb7Zxvh3bHgZkay9PSSXIpDSc3ZuzIUQcNTN9qQ57rtUe4zva8Sq2mu2fPimJWs9YF9qB9SpuslxJO4DAmrvgNT+KcQMTVrA99a41FA/ffY1W907i/t7UTZ7dV0Tejg6D/uNf20rLLZOu87+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270023; c=relaxed/simple;
	bh=WG1qQIgFnvy4XQTRrFc8isXGbG8ujiIiT4N+wUKpJ/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lekdyCD580muTAB0JVjx+4QGN4mpgX3pSyax2nEWnC3S90vMPH7DiZA1kA2eTYvqSg+t6JW9aHQLptl/tysfr2I4jcRHkqkJIkOpvTLEr++jvtAA6ZaUfNaxxeDRrxBjz0BtPFeNMBe19jNJdt/HdkUdnLtp6UPtYwir0AYPGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1wUDwLf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270022; x=1763806022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WG1qQIgFnvy4XQTRrFc8isXGbG8ujiIiT4N+wUKpJ/8=;
  b=m1wUDwLfHJFVx4eB0cg1KJbWodQWYecvvRBjLm1edFJrwioISm+N66iI
   HjqBZl3hErgkNZAKWw/NZtHJwR1Wy2Q/hLwbHpwGIWd72OPyrcxQIGfMm
   E0aaTEF6NgrVejYLr8IP0fuaDiAtnSsbx35o2I91B1uzWhGPt36tqq0xQ
   qKi3BejzyY0WH5m+P/jwme9a3pgAacJ1aQFEmtBEFPKi+Gw7jcsD9Pyrh
   jkNhdjxDDQRukAVy8dI3zF2c0z5RyTI4WkkmhL0O5nHMibZ6FEjQXd+Ir
   v77/HPheQ0q7vNbrmdGvznWHeSD37aTsB3xSOP/RA39FGhbGQL9RltSfj
   Q==;
X-CSE-ConnectionGUID: DnRQekF8RuibaeWGI1t45A==
X-CSE-MsgGUID: 6yB37lmtSuyHXg7yEJ1T+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54927658"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54927658"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:07:00 -0800
X-CSE-ConnectionGUID: eL2AiauEQf+xvysmoqXusg==
X-CSE-MsgGUID: WzWdMH5KQqmN7UUJKXcodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121403095"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:55 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A1BB3120D28;
	Fri, 22 Nov 2024 12:06:43 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tEQYl-0002Ll-25;
	Fri, 22 Nov 2024 12:06:43 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
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
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 8/8] media: Documentation: Add binning and sub-sampling controls
Date: Fri, 22 Nov 2024 12:06:33 +0200
Message-Id: <20241122100633.8971-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
References: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the binning and scaling controls (V4L2_CID_BINNING and
V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/subdev-config-model.rst   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 25030b80734f..ae39a1bfd2f7 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -161,9 +161,14 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - X
       - Binning, sub-sampling and scaling. This rectangle is relative to the
-        V4L2_SEL_TGT_CROP rectangle on the same (pad, stream). The combination
-        of binning, sub-sampling and scaling is configured using this selection
-        target.
+        V4L2_SEL_TGT_CROP rectangle on the same (pad, stream). Binning is
+        configured using the :ref:`V4L2_CID_BINNING
+        <v4l2-cid-camera-sensor-binning>` control and sub-sampling is configured
+        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+        V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`
+        controls. Further on, scaling may be configured by setting the compose
+        rectangle, relative to analogue crop rectangle after binning and
+        sub-sampling.
     * - 2/0
       - Format
       - X
-- 
2.39.5


