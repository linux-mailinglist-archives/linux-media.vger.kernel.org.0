Return-Path: <linux-media+bounces-9002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9397C89F058
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F18528295B
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14CE15958A;
	Wed, 10 Apr 2024 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8tm7INe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433913D274
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712747249; cv=none; b=b+cAsDAHhOkaVRV/6e8wd/FwknOJ6KXLVA2PzaAzBmd16uShj9pZ7sAEErzYy5+sLJU/RtzDFfaBRHskCe5b+zF5kyFY1I0yIVA1TS1MhSuR+66Xj7oyf8Ek6aDQrCRRqcSLb8LsgcPInhGYBKmBxNEDlU0HMfa1XzsaPxhDQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712747249; c=relaxed/simple;
	bh=E/yi8qXgYYDnk9oqqSnKlnrRphRaPUTXE11fg+jbIYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BziAf5MZRLqEBkWmdD49xNh7DEOYyuzBIHqanuZAZAe2Nb/Up6T31W87NdHKeXOIBIK0Ny3ekdhjbc4Qo+L3tFfDM0U+TVVI8YGQH5CCdc5UkteQiE4np+06NnWw4I0M+b3geZyU+x1UOmr3+QYYbQHhrO++NIBuKKHIquFN+Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8tm7INe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712747247; x=1744283247;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E/yi8qXgYYDnk9oqqSnKlnrRphRaPUTXE11fg+jbIYU=;
  b=V8tm7INen6uMqSPK1Ydq1iJJennAhSxWxSZNdjMU2TkwIsleIw/6ZQVB
   33zRykyTPBWtonLtYfqjhLMlRGm/k4kdgV/77HPDAL7ehSv4TPuD1PynR
   mw44yWvW/Dno6QADhhCtMLyickCMQ9Bl/l7sretjwmP1+pjFcmbbS1Iwa
   6bV4fHfImy14Q3j+0jg4fRE5/cJ3prasLIZudSFWLaz+R7ezMOBvrJf9N
   EUeNkLNwEPLJln+YyA78p+eL04ibo+/ctRXmVY+zUaGky2gQHBb4wp5bR
   etf/cIdwUj7TR0+Lk4B+mq0A/zD26TYGVP6YWZEeBjMd9oedT3ltKJTHG
   A==;
X-CSE-ConnectionGUID: o0PCah0jR1e631Q/kXJMdQ==
X-CSE-MsgGUID: +cIy9H1eRHGbkBicxq4Rrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33509634"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="33509634"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:07:26 -0700
X-CSE-ConnectionGUID: dYDXwUWOTpa21fBx/AXS+Q==
X-CSE-MsgGUID: xCSGt2DBQMCzHHMbo755aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43764644"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:07:24 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0113F1203E6;
	Wed, 10 Apr 2024 14:07:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ruVnV-001kEP-37;
	Wed, 10 Apr 2024 14:07:21 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [RESEND PATCH 1/1] media: v4l: async: Properly re-initialise notifier entry in unregister
Date: Wed, 10 Apr 2024 14:07:11 +0300
Message-Id: <20240410110711.416033-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The notifier_entry of a notifier is not re-initialised after unregistering
the notifier. This leads to dangling pointers being left there so use
list_del_init() to return the notifier_entry an empty list.

Fixes: b8ec754ae4c5 ("media: v4l: async: Set v4l2_device and subdev in async notifier init")
Cc: <stable@vger.kernel.org> # for 6.6 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2ff35d5d60f2..4bb073587817 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -635,7 +635,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 
 	v4l2_async_nf_unbind_all_subdevs(notifier);
 
-	list_del(&notifier->notifier_entry);
+	list_del_init(&notifier->notifier_entry);
 }
 
 void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
-- 
2.39.2


