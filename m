Return-Path: <linux-media+bounces-10378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F28B61B2
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 21:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF63285AD9
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 19:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB24113B5BE;
	Mon, 29 Apr 2024 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQki3VSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96113AD39
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714417742; cv=none; b=Ur+wQc2U/OYVselfjfUcJGSxtkqHJ6tTh2mDi+AvYVqAnwaL456FOUUkzLjGK/nBXq1ZR+7f7DCvaG9nc+FhgcUo0pqfueVMGnZuvZjnYXev3pMiL7hakzNPOYbHIKhkMMZBB/5n2/QL0LTiMC5JU/f/Wfhge99wFlve7RYc8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714417742; c=relaxed/simple;
	bh=ieIzZg255XIGr0no7RsEtbUaifU3529HA23fgu8fC94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SaabEZe3sbe6+2MvuymNF+6EIBbpRZHPzst1a4PkkpqdY6hdlrLNgfSnth71m50o19+N4KcyDitHKKerbTagzIjDOd39SAcSfDUav0LbhCjTW6EbKzupeW/2YKeCepcp3f/FqWlfgM0dF/GzjYHoZnixwDovFAsJnnNQmLO2mA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQki3VSQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714417740; x=1745953740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ieIzZg255XIGr0no7RsEtbUaifU3529HA23fgu8fC94=;
  b=bQki3VSQY7UUdNHNRRlncaaD6TF+MEVnwZ3cRsPIcx67uaf+IPpVKwME
   yjUMZ1iQnLHIxby7I4ElDZs3CMmLR9upn6U9HTPwV8WqaOH/Mmt65jNdj
   NCKd9w5bcolCVE4wkoJeYRTPmpjVwBtooIS4G1kaH6QVaDBrrzXCSIjy1
   y8rl21UCP1ba02foEZgR3q0/5P1oMYTuV2dMhDOeeu4A4sk05XoBvWwlu
   mgRQZfNtTJJCFvAhPQ69Zac/f/x0PoJE7tDW1vgaW75cEKlFMcC0SiQal
   SpLYURg2P6aDPqZ+6ZtVXfUQcTxnJQA6pdVN5LZuFlx+SH+1/eqtQCKbn
   Q==;
X-CSE-ConnectionGUID: dcf/HQDRSBK5aUdTQkd+qg==
X-CSE-MsgGUID: 3McIGSN0T8uTz/bt17JOJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13875335"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="13875335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:08:58 -0700
X-CSE-ConnectionGUID: PVv7t/9KQSqk0KupzFCdTg==
X-CSE-MsgGUID: aHMGt/wGSMmZsqk5AKBVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30846315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:08:57 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB53F1205C0;
	Mon, 29 Apr 2024 22:08:54 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 3/4] media: Documentation: Update link frequency driver documentation
Date: Mon, 29 Apr 2024 22:08:51 +0300
Message-Id: <20240429190852.1008003-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
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


