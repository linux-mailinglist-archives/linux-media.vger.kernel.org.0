Return-Path: <linux-media+bounces-42936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDECB90776
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 13:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1A124E2152
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 11:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998AC2FCBFD;
	Mon, 22 Sep 2025 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSJQbikZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737D76026
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541498; cv=none; b=bhcFWGUu/egs6fcRehEkoLPmzdeNeMf8cYt8TUcOr1p0roq61E0ukuQxABMFGocONBovq/tnOWmulcl7VEnrEYA0zfBC2XkmULFXPhtrdTURpZsy/KsCO6rhnCEDRhwxdQMKHOyvGoVg6RlBgaLlJOS1Vqq5i6JivM3AdDEmddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541498; c=relaxed/simple;
	bh=STj2YtGCHlMk6HiA/e33tRKAW91gtdNY/8YfK9XT1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=evw1kdK16YZLyNp64PNLbH7ETERYNUS1XNBlU64iJFuMwn7qs8pXDR90c19nHfuyIVtpHZr3/3gkj+S7zR94dWAD0H6ZNK94hbO4b7K7sD4PIKTw0aKs4aeiGytLAfvMxWAJP/5SdlH3hMYRfkQnhQ4RgsMwyaaZlGIKEIWudfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSJQbikZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758541496; x=1790077496;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=STj2YtGCHlMk6HiA/e33tRKAW91gtdNY/8YfK9XT1LA=;
  b=ZSJQbikZ0ZX68d3sMSUGxAWdrZ7+Z6Pg9U2B7m2RYjsfpJ10cwEsN/Ax
   cE3aoU2fs7gUIs/Em5OigeXD1FIr2iu1sw24jGQPIri33BbB433g8W/7Z
   bExWnfOHUSwN8zpsZIhPfZK8HpRPemcWviShY3bn2Jeh6ASQMEoXAyap3
   BA/vAEKBaPl5+y/AMrPTVohyhSAmYSxMbVCUt1+3WneyNaCpvYMjG/Mzv
   OYEbUAVnlg1tCUdE/ZT3DJL1KFd57q+FCLX+aZgn6mlDX6NaJEbPOWnsU
   EoDYi21+b6y/MmBXlnQF2gRpjb0lNwHs2/tWfjjQi7OfdN6k9gBhjRXCf
   Q==;
X-CSE-ConnectionGUID: wmVd9SyaQzats/mvzGwQkQ==
X-CSE-MsgGUID: yZxWYF1GRwqToCcVSrkZeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60856422"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60856422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 04:44:55 -0700
X-CSE-ConnectionGUID: O3iHrL6OSNK03n4ePotxFw==
X-CSE-MsgGUID: 9912nyQdSseA2m8sDMzrWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="180865211"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 04:44:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CAB8711F967;
	Mon, 22 Sep 2025 14:44:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v0eyQ-000000002Sh-2w13;
	Mon, 22 Sep 2025 14:44:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jimmy Su <jimmy.su@intel.com>
Subject: [PATCH 1/1] media: MAINTAINERS: Assign ov08x40 driver to Jimmy
Date: Mon, 22 Sep 2025 14:44:50 +0300
Message-ID: <20250922114450.9455-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wentong's e-mail no longer works; assign the ov08x40 driver to Jimmy Su.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee8cb2db483f..e4455dc69b07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18632,10 +18632,9 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov08d10.c
 
 OMNIVISION OV08X40 SENSOR DRIVER
-M:	Jason Chen <jason.z.chen@intel.com>
+M:	Jimmy Su <jimmy.su@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov08x40.c
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
 
-- 
2.47.3


