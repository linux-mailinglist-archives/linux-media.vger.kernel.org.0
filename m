Return-Path: <linux-media+bounces-25542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E9A25531
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A801C1640FE
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9300E206F1B;
	Mon,  3 Feb 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJqCdzfB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE862066EA
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573169; cv=none; b=tWv9nIXvSCYViPx990easrhxULIgJkQqHJgqMITnfy+1VaX0tsvnars/hzT4/7UFWkE7dwixmipzlEj2rKAencEEPR0IAhyaiZJ1HfhxHmvvHSTR+2qZsZLYO6ykbMr948EKPs/iE4lLf0e2KlVlATxUxjGuTUJ99oeyvgMcjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573169; c=relaxed/simple;
	bh=5vlaUg1R9x+PdU7jkf01tddKR5QgqMcfnNVKYq+QLvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eFvXzW5AjiISmj/JxMLB0KrVFdSAdx7lFnR9PTARHZ5v9S6OJZJgVjgAOsExBgk33SggSoOWL+WpuRJ06sX2JPMBwSwgwSimkOmIs+a/hIsx7PWjxKTykQzJStcUkpShixV/rQXiakB1lUeY8ECAC+cR97+3u3B/Fa7phbIVZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJqCdzfB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573168; x=1770109168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5vlaUg1R9x+PdU7jkf01tddKR5QgqMcfnNVKYq+QLvc=;
  b=MJqCdzfBIjzuDe3eKxec2fl8eeysGbnz5BxguH6+IvaMdAUj2KWH6Bkj
   VnwS9O14YdLjEj9M5gdD1Sir04y7O87aGDhg88ZXpyl9yrM4CQxRcByoe
   tOI4y7lfbirWP5P8TbpVglp8eD4z6Vpc0qA0PN3q1ADvhkz398zAyeBXh
   CoLWLIIVhFLJAT2J0wWugE0qg+zJPSQxKqx7CsBiifh+/9GG0dTaJdckm
   JMONXte/hlbRdJ5NgU5lhYPctN3H93wn3KTRtG1tuyboBxVgB5AC8Qgvr
   FznD/hdFwBNoMLn8X8RgPzTQlsunwliDqPe2KN7ZXIIxcf859qESyhrJM
   w==;
X-CSE-ConnectionGUID: WbqPJZgfQ62ktFfUr5KuHA==
X-CSE-MsgGUID: 6KK7nIMsQqm+Fi4Xkq8Oew==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50472651"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50472651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:27 -0800
X-CSE-ConnectionGUID: n0pFkRyrTHe3uHadU5Bmxw==
X-CSE-MsgGUID: wFtZ3gSIRpm7VjN92Na2Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110382959"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:21 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D02E1204F2;
	Mon,  3 Feb 2025 10:59:14 +0200 (EET)
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
Subject: [RFC v5 05/15] media: Documentation: Add scaling and post-scaler crop for common raw
Date: Mon,  3 Feb 2025 10:58:43 +0200
Message-Id: <20250203085853.1361401-6-sakari.ailus@linux.intel.com>
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

Document scaling and post-scaler digital crop operations for the common
raw sensor model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index b0bd09772ceb..f15e5495cc34 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -118,11 +118,18 @@ sub-sampling to achieve the desired size.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
-0/0. The resulting image size is further output by the sensor.
+0/0.
+
+The scaling operation is performed after the digital crop. It is configured by
+setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
+relative to the digital crop.
 
 The sensor's output mbus code is configured by setting the format on the (pad,
-stream) pair 0/0. When setting the format, always use the same width and height
-as for the digital crop setting.
+stream) pair 0/0. The width and height fields are used to configure post-scaler
+digital crop if supported by the driver, affecting the right and bottom edges of
+the frame. If post-scaler digital crop is not supported, the width and height
+fields of the format will match the compose rectangle sizes applied on the same
+0/0 (pad, stream) pair.
 
 Drivers may only support some of even none of these configurations, in which
 case they do not expose the corresponding selection rectangles. If any selection
@@ -180,12 +187,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - X
       - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 1/0.
+    * - 0/0
+      - ``V4L2_SEL_TGT_COMPOSE``
+      - \-
+      - X
+      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
+        rectangle on (pad, stream) pair 0/0.
     * - 0/0
       - Format
       - X
       - X
-      - Image data source format. Always assign the width and height fields of
-        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
+      - Image data source format and post-scaler crop. The width and height
+        fields of the format, used to configure post-scaler crop on the right
+        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 0/0. The media bus code reflects the
         pixel data output of the sensor.
     * - 0/1
-- 
2.39.5


