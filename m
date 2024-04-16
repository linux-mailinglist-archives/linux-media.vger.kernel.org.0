Return-Path: <linux-media+bounces-9598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B27888A7504
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CC7B28414B
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8913C3D3;
	Tue, 16 Apr 2024 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeB8kjTX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5D13C3CF
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296074; cv=none; b=rK94UM9arONEZCFtsdVj3kBoaKmwMhpW8jILUu69AQoMe1ET58j2DfGGS6g4wBNCT+e531BGqyQvpAlYOTwCnBKYnU5AK6xPuQ5WuPwJCBNPeIhn5eoczKklH1HPd32k01r2ZLGDUnJWHU1JxFoPD3slj/2mZVaOeQfeHAfuA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296074; c=relaxed/simple;
	bh=OX023vCDSksV4n94n8TNZmtzkek33LCJzZFZ+Xt33C8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qb1eqwoLJ4QguknDk3DDoDIa/V8Mw7hbtN4kJdRnKsK/xaqeusOOoKqejJHEbRLC9fX1mXhr16fPMci3M6mkK0ACUoHW9qj/Ta3hnQEaXL9mzG+yD4jCq5OuKeiWjvEKC5BcZU7JEX6cuKNVZvaH1VSfB/g5X4gQh+RcB+UUeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeB8kjTX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296073; x=1744832073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OX023vCDSksV4n94n8TNZmtzkek33LCJzZFZ+Xt33C8=;
  b=IeB8kjTXcPQ3uTLcH1qgwbbKum/uscSzDSJkNBCcyIJlVo2xEzMPCDz6
   qF1abHUGN0XBMzTJqE8lzbiFVlcSCkvCZh/BKtf+Eqpi0nyUxqukx+cUb
   0d5u76oXZZ4uwrBNhPBkrRMOPpipNPyIGEq/joPF/N43LYSDto3zphvH4
   sGyJdHkk+W6w4JJpuevjAjim5wwlTS8lufwaaTNLtjcEziDhIhBF/+lUN
   L5daIk5kdyAbtsJzUCjiQ8RDbMq/kKaUOcOSiWagXt+pYnqkmodqDw5rb
   sHBYpGeHH2nkAtNVs2n9WKpgxlyhPjnL4NCtrDrtGC3AO0I1VZfCZ/QiF
   w==;
X-CSE-ConnectionGUID: na5X6uiwT8aIkcyJslA4/Q==
X-CSE-MsgGUID: zinJLPhKRYKKbynkt8/zaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929946"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:33 -0700
X-CSE-ConnectionGUID: AyKuSJZkQFmm7rYtQ1jJ8g==
X-CSE-MsgGUID: KfhjWzIfQdSkChMvgAXnug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22244803"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6D77C12053D;
	Tue, 16 Apr 2024 22:34:26 +0300 (EEST)
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
Subject: [PATCH v9 46/46] media: ov2740: Add IMMUTABLE route flag
Date: Tue, 16 Apr 2024 22:33:19 +0300
Message-Id: <20240416193319.778192-47-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add immutable route flag to the routing table. The driver does not support
disabling the embedded data whereas the sensor itself does.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 6e355e986b88..d6b4533a834a 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1185,12 +1185,14 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 			.sink_pad = OV2740_PAD_PIXEL,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_PIXEL,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		}, {
 			.sink_pad = OV2740_PAD_META,
 			.source_pad = OV2740_PAD_SOURCE,
 			.source_stream = OV2740_STREAM_META,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
-- 
2.39.2


