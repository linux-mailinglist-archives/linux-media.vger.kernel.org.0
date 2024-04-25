Return-Path: <linux-media+bounces-10132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31F8B2AB3
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108E11F21BE3
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0C6156228;
	Thu, 25 Apr 2024 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT+NPlWW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D7155753
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080456; cv=none; b=HNmTug//oTPO5g6ArTQyK0GaVnGWHK8pFXQGBDhjXZca5zsysB1CywFX+sQxc8RJ8YGGHmM5eoZMKyLoIr7uuIgwGFC3aN5n/unkdas35z/nQJcqpVQutr61PCcnbZgO/RuW9RXhZC/Cx7XgrPUp/KWUIZE8z2rOmLTiS5l43JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080456; c=relaxed/simple;
	bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kgh73YK/KEGISIg73gq34L8RGz6Jy1zFMheHiQ1J4krAiTF0X33DZNeNaYJU3b6J2YHxoFm8tu3CbGxaJd3zLrjcPz09aXPbDMN/BTSOEcBvxrfkywmyRoXovqiBW7BoGTejgagcyDncoQ7X/n/a/znzGjXZdHN63As/swSSPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT+NPlWW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080454; x=1745616454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
  b=BT+NPlWWTOCq/kwrxj9oequalAo5zcToAyT2iRSsQu7ZEbSO2T/49/Lk
   DSQn30E/IZHj+E4MUCrZF8halAzUKdMdcIuHuIOapuwngm90WJ/MBeNNF
   c6HdaDGAJxtsRil5Ss/lEqT+aOv6LsGy1jmbM3NNLojCESYeFnxISLC4c
   U9jMWMv9Supp5A7MKGk9iOhcDESNZ6c/T38qq1PPE+sMNz0lHgsV9hXPQ
   xc7z/EA7qBDpzz1h9Wi+PRRje+ucWA4GV8yLJMlSzn6tzb/BdjtcJY7re
   pMzFWetf/nhvP1NWEk9I2BDnlTvkmYVcrdTHIau5vUp0y/x4Hpn4jsCVG
   Q==;
X-CSE-ConnectionGUID: uBq2SwmuSK2v62MG+IT0cg==
X-CSE-MsgGUID: y1BzOIGDTk2UokRHZEiQPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016699"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:33 -0700
X-CSE-ConnectionGUID: pllXJY3ESJagYTeP9QWUUg==
X-CSE-MsgGUID: sD95ypPZQCKdVPFyh6GBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620928"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 52EA3120768;
	Fri, 26 Apr 2024 00:27:26 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v2 08/14] media: Documentation: Additional streams generally don't harm capture
Date: Fri, 26 Apr 2024 00:27:05 +0300
Message-Id: <20240425212711.928300-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having extra streams on the source end of the link that cannot be captured
by the sink sub-device generally are not an issue, at least not on CSI-2
bus. Still document that there may be hardware-specific limitations. For
example on parallel bus this might not work on all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index f375b820ab68..b76e02e54512 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -529,9 +529,9 @@ the its sink pad and allows to route them individually to one of its source
 pads.
 
 Subdevice drivers that support multiplexed streams are compatible with
-non-multiplexed subdev drivers, but, of course, require a routing configuration
-where the link between those two types of drivers contains only a single
-stream.
+non-multiplexed subdev drivers. However, if the driver at the sink end of a link
+does not support streams, then only stream 0 of source end may be captured.
+There may be additional limitations specific to the sink device.
 
 Understanding streams
 ^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2


