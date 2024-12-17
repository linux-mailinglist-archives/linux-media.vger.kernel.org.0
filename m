Return-Path: <linux-media+bounces-23668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C07AE9F5921
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 757457A03E2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948F71FA243;
	Tue, 17 Dec 2024 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZwgGOgm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED94A1F7580
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472497; cv=none; b=Sgl11yv53wV9TIDyLOU2SvjW4WjWPK+SOZyn9JnULcf/ZG4cSej3hMyb3PkxLodbLzENu9eyWU4LrAof8487+vL0xZRNk+56oS+Lhn2xGTwwz4FdT5cf6KlztqZmC6GkF8T5YtxQ9TcKBn0bItgQmiT9aJlVXfBcx3MXcTjHgI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472497; c=relaxed/simple;
	bh=Ss2le2bg2PCpLXGM/QUZlPmxsO2vDgpi7atAPfCy0ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BiwF0eQLfh0sb6w3t1ZxZ0nQBzuoKVBotpg7DJPRO4EgLk4o76fywNTu1qOsDSL9s/xAscKGYgRqrGOdr+9yUnYh9WNmBJeEEIVzpEaEgZBrC/saXif67HI7zgF518Qb5UQSWUVmsINwJwQmDzpqVdMg+PU5W0Bp1ZON4IbE8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZwgGOgm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472495; x=1766008495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ss2le2bg2PCpLXGM/QUZlPmxsO2vDgpi7atAPfCy0ro=;
  b=SZwgGOgmDnwjaNYFMw1F1PJCwYqqtPycsHMoa6ubZpIjzKtKqZQYnNV/
   G1EDJmyTZlUb1vZ2P/HaPfscgYJsrQhAFbpHRk1HNyv1zqWoVaLHuDanP
   +3XENueCEo+AApazw65KwB22AEQmkUyI4HwMzYGIE/eVRr+5FBDJSGFxw
   xb6sH33pKP3iCZtDqT6WjSBynY7unEp0qdBqtRKhmEXB45bpZsxUw4hsY
   6eZDX7XQkLpUboZzDJR3P2vjQBHxLVqi0fxdohxx0CxcK4vLUfC7HXtoH
   iDrr9MMt4KNQl1hNqf2+64Dyd8usBGhZmNK1cnK77Y4hmFutRfQUvwAQ5
   g==;
X-CSE-ConnectionGUID: W5OXVXduScmVeHHf8riF9w==
X-CSE-MsgGUID: MEdW0S3TQeOKz+7/CVGSCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861589"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861589"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:54 -0800
X-CSE-ConnectionGUID: eyeT41niTluMQBNiLBUUMA==
X-CSE-MsgGUID: 662HZ6nOSD+DoTPeGL8XsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511241"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:54 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 13ACA1203A5;
	Tue, 17 Dec 2024 23:54:49 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 3/9] media: Documentation: Update link frequency driver documentation
Date: Tue, 17 Dec 2024 23:54:39 +0200
Message-Id: <20241217215445.901459-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the get_mbus_config() as the means for conveying the link frequency
towards the receiver drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index c71003f74b1c..6f9eba189a9f 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+Drivers that do not have user-configurable link frequency should report it
+through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
+field of struct v4l2_mbus_config, instead of through controls.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.5


