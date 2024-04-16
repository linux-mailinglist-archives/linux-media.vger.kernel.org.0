Return-Path: <linux-media+bounces-9560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3408A74DD
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D9A8B21FB0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550F712E1F0;
	Tue, 16 Apr 2024 19:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLz/4cDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F703139D01
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296020; cv=none; b=UNZeRlmTJPuXtj0YYyDay9xYPpZBtSR6TXnuJlYg78xTzFLKLN6XiE7KUqa1R1DjmxiZK0rUM08WvW7wJaCHaejz2DW7jKFCuCAibraT4FqtebJ8sljL0QncAfCPqMMVw5lB4mXw5mzmZ+KbmLngauUyg5fDPFJRc4WaXBZRTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296020; c=relaxed/simple;
	bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SIWmHIj4bKecOUxGpC4VRNBpilp3AbADnZVS0+1R6r/kaEs1//C1ze5ZVhP+suQB7JM/Tjv4Hv3hDt9UE9rHS7q8zr6tHMNFOVI64WoAtqBb7YdUEQIee8bsQaobyvjE1CpmrvocZP6HpjZf5Rh8087N9Uner0hIm0CNaY+P+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLz/4cDx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296020; x=1744832020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9NVcs+CPjK/NLXHVLxYJeBlkgHJ6cOnfdXWiFvZE//s=;
  b=gLz/4cDxFNxSbL2Q430wBJxouxoV3je8nOKeGfTqB5A44xX/TkGHEcNs
   bMcOdLhmoLJ4b+W6uqO7cXqeaDqtldbvxXKUPhNEkxLUwBaQSc4dSa69E
   JGFv5YSPU75yyn2P5+v0skVQ14HSlIpNg2aoPn/aDrJLKUHYyFeTTlNpv
   zXh8090xEG787YGS2+BHSto7nukKZ8orsv7cPCFM5YUPfdKhz+S213wXp
   mShPvDatKL6XYPPg0PZ8NL8eAFCDTYlpUdNCLrL5ZYv2iAykgICspxyrl
   Ki56WpRZjtB1EWGJDk3+DT0FvYryR361nQ2yoaWWSh6nbqLFVb9imtLCW
   g==;
X-CSE-ConnectionGUID: VYeuttgxRLayofDQXiYN/Q==
X-CSE-MsgGUID: RWkJ204yQFSQuajQZqjq/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906045"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:39 -0700
X-CSE-ConnectionGUID: DyG+bwgdR9Kn8oSiii7Mcg==
X-CSE-MsgGUID: iwHIyuS9QRysHeVCTlMaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155273"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:36 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5C0A012053D;
	Tue, 16 Apr 2024 22:33:32 +0300 (EEST)
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
Subject: [PATCH v9 08/46] media: Documentation: Additional streams generally don't harm capture
Date: Tue, 16 Apr 2024 22:32:41 +0300
Message-Id: <20240416193319.778192-9-sakari.ailus@linux.intel.com>
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


