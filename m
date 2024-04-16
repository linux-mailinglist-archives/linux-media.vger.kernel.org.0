Return-Path: <linux-media+bounces-9579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14AD8A74F0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DFEA1C21E25
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495E213AD14;
	Tue, 16 Apr 2024 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBn/yO99"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72713958B
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296048; cv=none; b=uJay3xjxhYh6O39NUFacAbn6BlybwEhr/trXqOlX5gYVj7Be4Vcr9yXEKfksPTnc/hZZrKQDdDUFJBLmXKMydZ8K1GSbT9KEZapB1j+YZS0dZZZHrZjm8ucNQ0saPcS14w0NIhnF/BhXboehAAx6pJR8/rYXsf1LY+5tbHoaIHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296048; c=relaxed/simple;
	bh=e2kvcpv99pDAd1hu5g35PdbAxL6mlsgulaOwWSj18ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YWmm2G022HLGg4uUWcK31j1hvLGI1snB/uivjGwRXPJY8rnPYrMPJSRFWcZ6bQx2jEdVq2foTxkfTLKECPkj7lJ6xe5AG8KwInRi95ox04WA+5EW5HA8pVqve67PnkYhhBhM+2o7x6g8CK6uWj/gUWbWWQGQop0fstJy1Xq7plE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBn/yO99; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296047; x=1744832047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e2kvcpv99pDAd1hu5g35PdbAxL6mlsgulaOwWSj18ss=;
  b=lBn/yO99+i2SRooNxsyHWU0nbQbCeTc5tZ4LGpLWCk6hxyi/UQbOVnFj
   6BIpMZcdlrDLdj7uvBCZ5sxAXuB4RF7Mnk/byIz2Kwhs0Zpp6GuqvLgp6
   Y9qsU5TpiLaE9JyStt8XDsXwDy8tzoaL6Lp1MZhvo6yFeIEIuUQi4dops
   hfH0ECSzJIV7hqV7+bOtXbKv87Npe9vPytBCXYpaWFx236AU90ZabbIzr
   t4VQ8x3koRdSX+FsvqFOl9ETKdhrIvkr5VJUkkEALHV33Wdxo2Jzldixp
   Fnwz0ITmloq9A4BMGY9Z2uUIQ+katmnbkOlt7+vPIKwSj1mPTB5v2/nLK
   Q==;
X-CSE-ConnectionGUID: 6CobmWczRpizueeAQR6bCA==
X-CSE-MsgGUID: B2cHbW2RQgOKIahKyPVU4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929837"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929837"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:06 -0700
X-CSE-ConnectionGUID: ticq78Z+TuuzoC03bZnuEQ==
X-CSE-MsgGUID: mGs+ollXQ4KP/L4Rkb0cYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:03 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E2D161204F9;
	Tue, 16 Apr 2024 22:33:59 +0300 (EEST)
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
Subject: [PATCH v9 28/46] media: Documentation: Document non-CCS use of CCS embedded data format
Date: Tue, 16 Apr 2024 22:33:01 +0300
Message-Id: <20240416193319.778192-29-sakari.ailus@linux.intel.com>
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

The CCS embedded data format has multiple aspects (packing, encoding and
the rest, including register addresses and semantics). Explicitly allow
non-compliant embedded data to use the two former to reduce redundant
documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 9f3b0da3ad0d..dc415b8f6c8e 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -123,3 +123,14 @@ In general, changing the embedded data format from the driver-configured values
 is not supported. The height of the metadata is device-specific and the width
 is that (or less of that) of the image width, as configured on the pixel data
 stream.
+
+CCS and non-CCS embedded data
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Embedded data which is fully compliant with CCS definitions uses ``CCS embedded
+data format <MEDIA-BUS-FMT-CCS-EMBEDDED>`` media bus code (level
+3). Device-specific embedded data compliant with either MIPI CCS embedded data
+levels 1 or 2 only shall not use CCS embedded data mbus code, but may refer to
+CCS embedded data documentation with the level of conformance specified and omit
+documenting these aspects of the format. The rest of the device-specific
+embedded data format is documented in the context of the data format itself.
-- 
2.39.2


