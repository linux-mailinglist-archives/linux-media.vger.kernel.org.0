Return-Path: <linux-media+bounces-25546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD6A25535
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28A5F163EF1
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62113207A27;
	Mon,  3 Feb 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESmvUH2C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70525207A1C
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573183; cv=none; b=RIJ2XFYNn7BxUVW/3XiqZl/LvElaEw91INH1FpMrJ6u9RiQ1Rd9bdZ4D08XEuWwvWMwO6cCWbCC+BnenWQMpblMxeQZuoWQ2tTtIg8YxdsdsD7AKD2mlufLm7TVoHJ87VBg7RrdpxBJDEutUKhTMCe4px/gD0VxFsK0MJslkxO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573183; c=relaxed/simple;
	bh=SfzJn9M2bjse7hkVshxkPCf9F6K8r07NrS2mWkE8rYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BN3gd5VUtshX+UpD6/RpXxy8YwvK21QYNRkjtHkJAlm0c7fy+13vFQ++c5D2NUGRIXHypfqOSFjAJXHvmw2rvwSVuZoW90SEgutJ11EO7t9H6mOuP6AQQ6n4n/7seR2tV1x1qEn3PlUn5bxlNYvGHh/TSHd1k2/PCtQDNAwKYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESmvUH2C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573182; x=1770109182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SfzJn9M2bjse7hkVshxkPCf9F6K8r07NrS2mWkE8rYE=;
  b=ESmvUH2COr2bqD60y9fx0rdcJRSNHbZ1cXc0D1SUu+j90YDTQzADC0fk
   MG7rUjdW+Vjx11VdXpMmdBZgzwfYnNlqwN7z+6vq+pbzXXagQZh0DK94V
   LYDJ3d8CbjKrN4qEA7f4XundGwOWg74cz7bvAukg2hxr7TaKFmMgjbsEu
   Fy/6B3Kn46mRM4DvvDoHuqWV/0SV4sCOQB2NqpTxME1JqkiWtZGpYDr6O
   +Z0rECvbI19UWN4IAcakZOZ9xr/CRwQtzWHrCPIkKmXrYo+K37k+eS6D1
   XKGTIRyd1OXTqv8at/tlkghmKTRFh3DqvyvLZPxvcNcLXdDpNBeMzoCdm
   Q==;
X-CSE-ConnectionGUID: jh2Z2dD+QmqwHpiKjppuUQ==
X-CSE-MsgGUID: n2gns8ueSLOm13SJUZJQKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="56485401"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56485401"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:42 -0800
X-CSE-ConnectionGUID: X/QFMKdoQv6Qz0OgfjD92A==
X-CSE-MsgGUID: rSfR41gRQW2BlhPk4PW+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110066351"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:36 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B244011FC22;
	Mon,  3 Feb 2025 10:59:30 +0200 (EET)
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
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 09/15] media: uapi: Documentation: Improve column width hints for examples
Date: Mon,  3 Feb 2025 10:58:47 +0200
Message-Id: <20250203085853.1361401-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
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
index 1d46f1c4add1..a800342c8071 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -74,7 +74,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
@@ -118,7 +118,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
@@ -159,7 +159,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.8cm}|p{1.8cm}|
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
@@ -255,7 +255,7 @@ This format is little endian.
 **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
-.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}
 
 .. flat-table:: Sample 4x2 Metadata Frame
     :header-rows:  0
-- 
2.39.5


