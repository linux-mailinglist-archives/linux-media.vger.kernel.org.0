Return-Path: <linux-media+bounces-35306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E5AE04DE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690334A4208
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CEC258CF5;
	Thu, 19 Jun 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4DxPkp1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5402580EE
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334358; cv=none; b=N7SF60dJl7LHegmAdwhCK+P+G/D9pw4K60ds/bSV66bJtKbryFB0ZLa/lw9ypGbIpn9dkGGwkLpoyJnb1yEp/9GiJ1b59htrtE8IBhTMeAPc477tI9l5QJYbzaFL7TKVVd9ew9TNQ0sZ3MJzCaxhh96/U/QISzooUTjK5/fTYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334358; c=relaxed/simple;
	bh=1Y6NpuHBiPRMA32nmzfssh2fA0N0J8J+jX+e3RQZux0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=snVc1vl1j8KSncc98TCtjAfHMpCvuNoH5+EFVfRBaAsFKWvBTB9S3JJACzpcYSeM1jluwtWRRL2dKdsLY9Nxgkzmp6KB/0CRe01SqdvU0XMsJ+m4v8oCZmTQEGViJ4IQjE/eHP7FVqz/dwkSY7UvM7oXkjHNr2UaBeyVc+hWmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4DxPkp1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334357; x=1781870357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Y6NpuHBiPRMA32nmzfssh2fA0N0J8J+jX+e3RQZux0=;
  b=Q4DxPkp1GDdjfJDJabKmMQcgiYd8V9mw5TIZwoZR68D3xW+7+mQ7mcmZ
   k0ep6bAq9aT681EH6DnBaOT8+LlcSz/kulOpwhRqpzy2/BTFYLIWymxGm
   UJPHm7fjx5A70sqnEs2xVkMqX4686U/lcPK22/CmJ14LwsFgvLiqygEEy
   WifM4dOxABBr1g4g0z9/jS6RvIQlti8BVwGmG9eXhwRYDVJToTsBOa2Ak
   r8mvA+83AYlvFsL7jqfsvr0BFy7AMqHqoJUxU6q4tGC1wZTQuoHCgRu/d
   Uf8mTP2MImAtA+GTTpF250l+am5FrfsiQKgd4lctAk1lJ5p7nb1a+7vqa
   g==;
X-CSE-ConnectionGUID: IWAsk1/zTlmaGPC0CJqz7g==
X-CSE-MsgGUID: cJrXbmGERPyYlbW2sA7fYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386626"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: wutttzAuRA6yCrYc0mxBmw==
X-CSE-MsgGUID: d5oKXO4OT6qjNARvWO75kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908429"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 292A41230D0;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKY-0S;
	Thu, 19 Jun 2025 14:58:37 +0300
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
Subject: [PATCH v10 37/64] media: uapi: Documentation: Improve column width hints for examples
Date: Thu, 19 Jun 2025 14:58:09 +0300
Message-Id: <20250619115836.1946016-38-sakari.ailus@linux.intel.com>
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

Use less arbitrary widths for the columns in metadata layout examples.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/metafmt-generic.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 90a1bc2ea15e..e8824b5a65d6 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -76,7 +76,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
@@ -120,7 +120,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
@@ -161,7 +161,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.8cm}|p{1.8cm}|
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
@@ -257,7 +257,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
-- 
2.39.5


