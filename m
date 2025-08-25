Return-Path: <linux-media+bounces-40929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C982B33BBD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D928486E12
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550D72D46BB;
	Mon, 25 Aug 2025 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZmzHDga"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E72D46B2
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115483; cv=none; b=nfbNeZgsxESe78imFH7srFtwOmepB00wBgZnLR3EY84Y/hVS847BgiQYKI8QDE1o7vyygt6BgCjxLJ409j3TaMNgnaGeJNwAOkqIFahX4J2D/vHe18M/rfZkNwnMhZBwTu7wsBHun9AdYKyrOpmTphRHABiUJaQv5R4D6t6v7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115483; c=relaxed/simple;
	bh=m3sL4GsJGFMdJjbQiUmWM98KDA1iBtXWq87sIoWYLi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fi9rP1gnlJXcb0QpZzeem4uNUNGClReO/5bfhL/t67iRHos/jkgdRVu+937pzEmRpXiOg6TdtMu9sjTfc2Oww7FK5h3QyJPtGd7vNa7ICClX7Q31OmQLpWCym/1kx4s7IyFyNNv6/Hlwu6PD86k/YZbjx76F/MFgbFnpvt9BEo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZmzHDga; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115482; x=1787651482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m3sL4GsJGFMdJjbQiUmWM98KDA1iBtXWq87sIoWYLi8=;
  b=hZmzHDgaAP00dYv0iaOpijGDiqcDEB06zU+9roo7gQ/DfCgM1SYyHCzj
   EZrFJPf62qb8+nrva+bGjEyWepFgDQiubOxqP5M2/zdP7BhVz9DstCI9c
   +NfIMa5lZ6BQkSA9yPzs6xzEF0eehHkWpC8ho5gg8cjzzxbfrmY0qc00N
   GASbFBBvU+/HxijP1xMhGr97pkuvvj2Wa/n44tOkFCZ3GJLHUoe4d/yRH
   nzFJQa+V6TgZtJwqSUf2A7N4Nw4SxCYU+Z1WQ2pZY8fErEbNbo9vYc5Q5
   Wnw0jV39DGBGk20s1Cgz+hWyZS7Er77Rag+5A0Fz2OdZYzz3qnX56pSqD
   Q==;
X-CSE-ConnectionGUID: 8QZdjlP6TWCteiB5BrJ8GQ==
X-CSE-MsgGUID: pOMxutJNR86z+Z+93L0leQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695744"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:17 -0700
X-CSE-ConnectionGUID: aAKnHjCFQbyPQrmzYQAOYw==
X-CSE-MsgGUID: WqgYxDiORB+PKCdjuZhf1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195357"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 15C0B121F65;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adQ-0BFw;
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
Subject: [PATCH v11 03/66] media: Documentation: There are either immutable or mutable routes
Date: Mon, 25 Aug 2025 12:50:04 +0300
Message-ID: <20250825095107.1332313-4-sakari.ailus@linux.intel.com>
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

Document that each sub-device may have either immutable or mutable routes,
not both of them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index f30a98a9cf78..4da67ee0b290 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -594,6 +594,11 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
 called on the sub-device. Such newly created routes have the device's default
 configuration for format and selection rectangles.
 
+A sub-device may only have either immutable routes (routes that have
+``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``) flag set or routes that are all user-created
+or user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
+flag). This is subject to change in the future.
+
 Configuring streams
 -------------------
 
-- 
2.47.2


