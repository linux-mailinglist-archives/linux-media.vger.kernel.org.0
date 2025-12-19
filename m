Return-Path: <linux-media+bounces-49148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE0CCF3EF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 354CF3062E3A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0A32F3C1F;
	Fri, 19 Dec 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7WC5ad3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E09D2F6188
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138323; cv=none; b=tJoDa9jHVJOC4kRuDhWo1robR5qcIfDCqBVdnjfcCpEi9mMKq+RvIv7rexKyz0IJrUXYX9pCkJAcwEz8x9bb+aQAHG0uxxp2ccJ/Svk8maFjnorXjlXURzL/5iZsNgJw17C2mZiMwqJzfPw8wBWhjxpE60qWzwrfRI2fS7UOPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138323; c=relaxed/simple;
	bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUpfsbZD9lK3fz+NXp4mFBsQyftnSyiZI4SwLTakzLM3eOnYWdypLs4A5RhoO/mQh9CKcijnAJRnEE47mducsePJZ0qqntkyolsZS5dtk05KuC/Br1SjRwtC64Gw9Kqil8os3LuAy/XFNtsqPQD9TDREvfbNKO8athgou2MVHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7WC5ad3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138321; x=1797674321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
  b=c7WC5ad3p211KQ/pfsLU4XKmsrPW1NWNa9qnleN6ZYOio0KMZLbMI1XY
   v3LQK7DluGt11fSinTuEk3KjVciCF3/ALEWulc7VeQT+WLU8IgTbxQNf4
   2QHgX81zKgQDEOwJG9J/sApXQupxojBGOj/CoWpZ7xJCPhvzkZdVZp+Lx
   vbnzPPbZacggMFW9rmvNLG11fDavB2felkXaK+jbr6LyjeSnpZmla/TSO
   IregP3vtqzTFeDhxmDtJ5UanxiNpqBH9b1t9Mv4GDTxlQAj/aReuBb5HO
   MwJmY6dyyFqVvXUGpY9PPSAHmxXiQC6T1kS4lEVxE3Ohqkorvv6QIz8+P
   Q==;
X-CSE-ConnectionGUID: E1981zZHQl6fRrYrKmaXtQ==
X-CSE-MsgGUID: cKIbhykBTy+Wcz7hWx7W4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945163"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: zdbPUx3KThivmvNerEE8mw==
X-CSE-MsgGUID: Rt4kkxieQaK/CzSNcksLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973392"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0C551121DAB;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRo-34R0;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 07/13] media: ipu6: Close firmware streams on streaming enable failure
Date: Fri, 19 Dec 2025 11:58:23 +0200
Message-ID: <20251219095829.2830843-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enabling streaming fails, the stream is stopped in firmware but not
closed. Do this to release resources on firmware side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index dec8f5ffcfa5..919b77107cef 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 out_media_entity_stop_streaming_firmware:
 	stop_streaming_firmware(av);
+	close_streaming_firmware(av);
 
 	return ret;
 }
-- 
2.47.3


