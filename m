Return-Path: <linux-media+bounces-9615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6DA8A754E
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C7191F23563
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7344F13AA48;
	Tue, 16 Apr 2024 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j39Tb8Bu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799413AA4C
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298309; cv=none; b=kZowzmSy2+gwQAULFiCH/2hSyO9MrzASnjnrMR9iYW/u8xTiGnr3OkzkYh/MrmHajv7x8yMTcCnNc7fiypSmar4TbPOvv5RcqhCeHblhW68l2kZUjGssZ1397zcovG/TJiGEdLl7hUt8y3o0st8Ci6Vee3yOn1JK/E0/W1qyqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298309; c=relaxed/simple;
	bh=Af6E/IZaN14wGRF8Njmnqqpc45WAScqEfj6XoD9e8m0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i7FSr0ioApiN3gQTU1mStcXkSZ5b/agqkiWrJvuFDVP42t5LfDNOlAUEZ4zQvWoogMjMxF7kzH3bcRmgRGc0OGs7+FjXXw0QI8t+89lQMU3D32y8BHL5GTZH2zcOWUOLGVZzZLqJTsAH5FTglOCZDTRRBxxbbHa3jk1gIIzGnAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j39Tb8Bu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298309; x=1744834309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Af6E/IZaN14wGRF8Njmnqqpc45WAScqEfj6XoD9e8m0=;
  b=j39Tb8Bu28HObCS03qPig4tDOb4qKr/6ukxa50BRdg5tvLCXd/3MnTmT
   hnRhQ9BA7u7gwkvdyweXnfzBvVJtfQcTnRz27mLJq5U5M3VS54Ev0qK9p
   QqkzIPB2PoEqfA/cR4ZkBpUNHkoxQTYGCtCQtA9mKBqjTvswofHb/5u6Y
   oy4OryeAFVZn+zxXN/066hrxH9IlOPoXSl2iVO1JZRpT9kne/s1PBTEyd
   g7DAHIWYrV40I03w0IN0U8VGGToaiVjVLOht0E/9iKMB4/k5sdSaqamlP
   R5MeQkhBil4KWKvGmUvMU/u1j86HSXLoDp1ImBAT9jGxWwtKJwt+paWw8
   g==;
X-CSE-ConnectionGUID: kwyIlX5HSCu7Iw3Ri1Dv9A==
X-CSE-MsgGUID: HRHV3jLeSsmBB8haTQ6oqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8877609"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8877609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:49 -0700
X-CSE-ConnectionGUID: dD4pW0ltRBygxIynp12FCQ==
X-CSE-MsgGUID: UOW2tLi2RKO0qYzWs/JQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22447928"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C6B012053D;
	Tue, 16 Apr 2024 23:11:41 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v4 16/19] MAINTAINERS: add maintainers for Intel IPU6 input system driver
Date: Tue, 16 Apr 2024 23:11:02 +0300
Message-Id: <20240416201105.781496-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Update MAINTAINERS file for Intel IPU6 input system driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c121493f43d..f9f6cde4b9f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10998,6 +10998,16 @@ F:	Documentation/admin-guide/media/ipu3_rcb.svg
 F:	Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
 F:	drivers/staging/media/ipu3/
 
+INTEL IPU6 INPUT SYSTEM DRIVER
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Tianshu Qiu <tian.shu.qiu@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/ipu6-isys.rst
+F:	drivers/media/pci/intel/ipu6/
+
 INTEL ISHTP ECLITE DRIVER
 M:	Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.39.2


