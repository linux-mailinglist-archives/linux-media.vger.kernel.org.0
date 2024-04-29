Return-Path: <linux-media+bounces-10362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D48B5DD8
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B86B11C21421
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981D582C6B;
	Mon, 29 Apr 2024 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKoMfMdr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7DC824AE
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714405035; cv=none; b=b/vguB68YzoBfo2Zny0m0ITZyp/LXmQ0YQigSBkYWaL8kZ+LZvT8MaZJVMRFOpROoyvL7VWuG0/J+48Hxz9QRdD3NdPIMJZyYA8O3cZdqG0cXVQtCaj9IwvFfsp33a1n6lFr5POH4CYEYCqfS/kz0qedIImbinGl271Tq+pWaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714405035; c=relaxed/simple;
	bh=ieIzZg255XIGr0no7RsEtbUaifU3529HA23fgu8fC94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4vt/+2u8s1/pSYDbdN+0RCjBGY63vlGW195n1NNRJBc035gtykbekX+aBSUtHpYJiFPrOpil4YBywovpkJLo4u3kEze2/3ITvWB3afxfbnFxxWXH2/QYbvTP9QejAnuw07rQxSzymeQ5TEBIHutdLrjC9qlR51mwQWkhPxWnqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKoMfMdr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714405033; x=1745941033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ieIzZg255XIGr0no7RsEtbUaifU3529HA23fgu8fC94=;
  b=hKoMfMdr1px9CVOfNRyr0uzVMREVXEcOUBDU7m0nA3EawDZ/cljAzqr6
   ksKlTJPwbD5oLMhzVAL6590mV8EAKfUVVYdeX6CFaWXo2G540a83/cBd+
   rpfRR4P+vwKLcx1qmTKF2xSP64Wsxwix34mV0cvOw6JtNQimiKwPb2uva
   8uvcppl0aeLICQjrRMBfMJM9TpO4iYqTDr/anmoOeoChIJTlj3Mkefo/I
   NY2lD4+E29eZ3DcH2r3RxWipBvcfBoft8affPug39vgRt6Ra2esVDqoIx
   SrP54+j1gQT66hT1OjmbxUqZtXWCNJvmku3G8kcup5nHWKWq11YFMBaWj
   Q==;
X-CSE-ConnectionGUID: 8VUJ52PaSvuHMDKTaMUymg==
X-CSE-MsgGUID: VkD/eL4wQBCHv3yXV3wjsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9951179"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9951179"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:11 -0700
X-CSE-ConnectionGUID: QaP34PrqRLeTOnWqTOsvkQ==
X-CSE-MsgGUID: XO2JX90bR/mEOZmxjdZA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30972913"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:09 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 34F731205C0;
	Mon, 29 Apr 2024 18:37:07 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 3/4] media: Documentation: Update link frequency driver documentation
Date: Mon, 29 Apr 2024 18:37:03 +0300
Message-Id: <20240429153704.1005192-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
References: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
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
index 29d66a47b56e..2f22a1534da9 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+For devices where the link frequency is read-only, the link_freq field of struct
+v4l2_mbus_config is recommended over controls for conveying the link frequency
+to the downstream driver in the pipeline.
+
 ``.s_stream()`` callback
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2


