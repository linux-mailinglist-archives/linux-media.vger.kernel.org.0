Return-Path: <linux-media+bounces-28365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782ABA65393
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 15:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6723AB8E2
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5524624168E;
	Mon, 17 Mar 2025 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMm3Gvt3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED92B24110F
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221728; cv=none; b=YVK2/hJ1j6br2tsplTozaN7vxmGlmKhpu5/PsagZkOndO27agDysaYTLIyld4kPXWraeEpa1qEh0RB8KbQzXAcAwdbM04Ym21B99Pg1RNY6guU0drDJ0v1JiIfIstR5Jnxc4HXbzUe9/Ux/wmHFVlLnAgqQjxFXIZc0gkYaHFuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221728; c=relaxed/simple;
	bh=iIGtsHyVSo7CeEpdmDblbz6HnFcEvzggIZXdLudj+yE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IiPWgZRrh9Iy8UnzPT8V6KaISDUX2GHGNqsTP0JdZx0xhcXmwep2XRnKo82PCR+lk4reAbE1PSUs5NUhLuP9UpGscRCKYMBl4PzaHe1pYSJp9V6J9tRWWop/TBoHtX/S/5/OctH/hZPOmBIwSZvFlJahQTfUB2lFDnHSiCmZ2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMm3Gvt3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742221727; x=1773757727;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iIGtsHyVSo7CeEpdmDblbz6HnFcEvzggIZXdLudj+yE=;
  b=hMm3Gvt3xAWTpTk4uG7cbuGkBUfkPLTPK3Qvu5gP3B6byfkAoFi0rgQa
   KGOlrXbwqGvNeWaYO3X7p70o47E47PHBWBeJwi7u5GCHBXIWBXzhoO9SM
   GmyDff3oXemR08ALOFYjdChZ5zEyJ0BUU+XOmbpneVioIFKeWDWOeMcnT
   YSNKEExBhSacfyFe8xl5epEOD082MEzz+Td5L24lVDm7enpp01ksp9uih
   WR2Nil69H+ivkBhu+M9L7ECJ6IThILBvLwj0SsaI7aDVAUvRu0NNiKHWe
   tApI4FwcByVn5OrhnrjpVmSNF7FfNeW+YvtRISHXGV6F06KUCxpkgVBWP
   Q==;
X-CSE-ConnectionGUID: hEJMPhOmSSKrULm4zSfWxg==
X-CSE-MsgGUID: dIrqd9ACSvi1odsMiOyULA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="46084819"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="46084819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 07:28:46 -0700
X-CSE-ConnectionGUID: qKn3tVhyTcq5XOOvTczpLA==
X-CSE-MsgGUID: GXgHohSGSae/LsgT4yN4bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121760659"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.96.183])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 07:28:44 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: intel/ipu6: Remove unused ipu6_isys_subdev_link_validate()
Date: Mon, 17 Mar 2025 15:28:42 +0100
Message-Id: <20250317142842.420910-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused declaration.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 9ef8d95464f5..268dfa01e903 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -37,10 +37,6 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
-int ipu6_isys_subdev_link_validate(struct v4l2_subdev *sd,
-				   struct media_link *link,
-				   struct v4l2_subdev_format *source_fmt,
-				   struct v4l2_subdev_format *sink_fmt);
 u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
 int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 				 struct v4l2_mbus_framefmt *format);
-- 
2.34.1


