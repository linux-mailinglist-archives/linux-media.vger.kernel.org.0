Return-Path: <linux-media+bounces-25551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025AA25540
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A053A915A
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE669137932;
	Mon,  3 Feb 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORC5CbZg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD697207DED
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573205; cv=none; b=eRa6oWgID7dAGGl68anP4UPDdQzGcIFJKnC0scXx9akrmyUhwyl1m/xLFX2qGIgUHYI8SYdDVphb0OQSmEY4cPX4ufVskyk3Ub2gvGsklnces05miDjVXPEWy7U6bdqpbkOrcu7OKDrlJrirGTRloC7xCiNvPDZqrvyaG03MKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573205; c=relaxed/simple;
	bh=DCDd4l42t5wgUgKJbmC/nWT/Ei31a0a25pOSaKlzovQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jk7tRLrFv8TmI5DjT1nc6DgNGfq0xAi0TbMFYGkSB4wDe+MM2d2hAC/IDxhUY2nYVwadkqah0S80H5caOsrvp3UJme5r7kN1AxNTtCuxDtUnOxill+QbrZ7F33VUZEKDYaNNDyVEFqccCUaYmSFpLoS3qu6uDNkmb+9QQxi0G5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORC5CbZg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573194; x=1770109194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DCDd4l42t5wgUgKJbmC/nWT/Ei31a0a25pOSaKlzovQ=;
  b=ORC5CbZgV3ACFVQ5rSr2/HcrUUil39vJw8iUaiOKc7gckPv+BBBb1Hc0
   Bvzkwkhj8AWsF5b9SxetCNTkMuu24Ii50TfoYV/Kb/QcYTB58Y3jo9cCp
   tbwq7nXM5zTVLJVhsNvkpLMR/5Hsekdnr3Bftv46QkH0NALSa0AQqW42D
   6Ea3HbXwkyMfnQ04+I9s4av5zyZW+qWTHyv9Hdgq6nf92r5nTzH/ZPylG
   9w2QFcZqf9G+i6hTxmVRi5RqqYeQrluZbV9PCSjMWllPXfdW7V6j/Go8R
   VkeR73Rw23URRhG9rIalr9Adit7uD0iFYbtKUPr6j69w1Rj+mZ6+pzKfp
   g==;
X-CSE-ConnectionGUID: EZXTTIcqTK6avZxF1y4zCw==
X-CSE-MsgGUID: 9J4abgY4TeK+4SXxB3mluw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39211589"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39211589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:53 -0800
X-CSE-ConnectionGUID: iwtt06VURDazftMYP18KVQ==
X-CSE-MsgGUID: UgjrJaK2Q6+eTkbsbgIg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109988802"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:47 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E5FD911FAB1;
	Mon,  3 Feb 2025 10:59:41 +0200 (EET)
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
Subject: [RFC v5 12/15] media: uapi: Documentation: Use luma formats with CFA pattern control
Date: Mon,  3 Feb 2025 10:58:50 +0200
Message-Id: <20250203085853.1361401-13-sakari.ailus@linux.intel.com>
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

Document that the luma-only, greyscale formats (Y10 etc.) are used also
for non-greyscale images with the CFA pattern specified by the
V4L2_CID_COLOUR_PATTERN control.

The advantage of this approach is that there is little (or none at all)
work needed to be able to capture such images with existing CSI-2 receiver
drivers as many already support greyscale formats when compared to new
CFA-agnostic pixelformats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 74df19be91f6..ae4e431b5fd9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -9,6 +9,11 @@ Luma-Only Formats
 This family of formats only store the luma component of a Y'CbCr image. They
 are often referred to as greyscale formats.
 
+These pixel formats are also used on :term:`MC-centric` devices when the CFA
+pattern is specified by the :ref:`V4L2_CID_COLOUR_PATTERN
+<image-source-control-colour-pattern>` control in the image source, typically a
+camera sensor.
+
 .. note::
 
    - In all the tables that follow, bit 7 is the most significant bit in a byte.
-- 
2.39.5


