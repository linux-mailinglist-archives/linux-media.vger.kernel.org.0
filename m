Return-Path: <linux-media+bounces-40930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 338EDB33BD2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7D231B26A07
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7032D4809;
	Mon, 25 Aug 2025 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmyGZ2qZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18E2D46B3
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115484; cv=none; b=TaAyPETLBSElo9y5NjjD6OLG4PhEDC3nkSsnzgThQ7JxUBc/5x9YNveEHuQV/fxx1luuK2gvR488bKoTgmf1/s3a9EX8a1fJwV5/FHgx5IJNuqdKvtSGFPiXwKI22e+/sOHc/pNxY7rZO4DpDCC4zqZURDYmQqu/ERUnT+MZBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115484; c=relaxed/simple;
	bh=TJpxzv+aTeHJgXT6dqi7wWphXEXmHl6pG2zHU0wchEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmxFMkGU9gtaKwFvlSjo8UNkL1s6QBSIooaPU/5EMwIh/ax7y/rx9Z/SFjt49a6lMdNufHzupmYuah1Djl1IJrTqGmPbsurMAKKDF0xi+fH+n/092L62GmLHSsdK509XgpOOQ8pmw50NU9ZZFVZw9wdVLO2R8AKhhhKKjAH3IUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmyGZ2qZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115483; x=1787651483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TJpxzv+aTeHJgXT6dqi7wWphXEXmHl6pG2zHU0wchEM=;
  b=GmyGZ2qZOxWpgF/9JKWkdCBwkWrtgKuUtr4dMJj4xbAWPenQS0nbKQF8
   vdsZNFwQ+61vDVhGJOM+K09EHaBWEnWEgj3tUGt/nwOWXzLYg6zKj6yK0
   wohLfguAkZJ0AV1as4q+0fzSe/hReIpx6NKdL8eGrJYl22J4tjXNBhlYI
   uE/JWuEl3zM5lVpk/vIWDZgga8fWiLJTrsL1HkBPo7GQRArPuip5thDSP
   GafgzKviIIP3q4rDf99p3GoOjZgd0hPm35GxcY5FmmOI019iJmMFdKmaR
   ephP16S0YpIYlCRjnl3eE1uyR2gcbXK7MH9t7jwcvl0EHJk2UVBqhKxbC
   w==;
X-CSE-ConnectionGUID: 83c25XPBRJGU7DSCnfjRZg==
X-CSE-MsgGUID: +kwkKIhrSbOJT3S6ZQtlDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695755"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:18 -0700
X-CSE-ConnectionGUID: g2pZqWQTSjKGMhhlw4/xGw==
X-CSE-MsgGUID: 8Bonr/3YT7edfXaR99zEXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195361"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1948C121F6C;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adU-0FSM;
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
Subject: [PATCH v11 04/66] media: Documentation: Document -ENXIO for VIDIOC_SUBDEV_S_ROUTING
Date: Mon, 25 Aug 2025 12:50:05 +0300
Message-ID: <20250825095107.1332313-5-sakari.ailus@linux.intel.com>
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

Document that -ENXIO is returned when the user tries to set a routing
configuration not supported by the hardware (or rather the driver). The
documentation details the exact cases of this, besides -EINVAL that is
already documented for VIDIOC_SUBDEV_S_ROUTING.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst             | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 1cf795480602..15f448664e6b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -155,9 +155,18 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 EINVAL
+
    The sink or source pad identifiers reference a non-existing pad or reference
    pads of different types (ie. the sink_pad identifiers refers to a source
-   pad), or the ``which`` field has an unsupported value.
+   pad), the ``which`` field has an unsupported value, or, for
+   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field value is larger than that
+   of the len_routes field.
+
+ENXIO
+   No such link can be created or such link state change can be made. Either the
+   sink or source (pad, stream) pair or the combination of the sink and source
+   is not supported by the hardware, or no multiple routes from or to the same
+   (pad, stream) pair are supported.
 
 E2BIG
    The application provided ``num_routes`` for ``VIDIOC_SUBDEV_S_ROUTING`` is
-- 
2.47.2


