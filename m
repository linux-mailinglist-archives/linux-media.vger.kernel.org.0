Return-Path: <linux-media+bounces-9001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638D89F057
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 464B4B220CE
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E2213D274;
	Wed, 10 Apr 2024 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjSYlsnE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D11591E1
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712747204; cv=none; b=HhuYYEe7oc+8LwIUTuXTUCEks2lKMLLpAslHv91gp/RA5XM+mKOCbDlSoUOfIA0oLP6H99JhEqHt6LuBCRczyF3ed0QIdO95TiCZW6IItt0tkZMozQmGjtE4xBdBKKS0pspdOmVmOeI433U7bSOUcZsD04rqDBk1mS0xO3FKjTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712747204; c=relaxed/simple;
	bh=E/yi8qXgYYDnk9oqqSnKlnrRphRaPUTXE11fg+jbIYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S3OXbGwpChF0JLutCDAqkslYWT8//1mkrsR96fw6GJ821dumyjFLI3NMO9jPu17rsEmqUO3QT4YJOtNq8komSvqqHsvKuEwVIGhdJYhf9UbvO+I5f5aIIQLBbqcl7RCr0UABe43elDeVWeE83LUSGPtXc6CHd0dZx55/2elgIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjSYlsnE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712747202; x=1744283202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E/yi8qXgYYDnk9oqqSnKlnrRphRaPUTXE11fg+jbIYU=;
  b=AjSYlsnEDDCkyx80z7wmgfOCQxTVdHxPmhYw0lIKSvpgfkbYvXMZ+lnr
   n3EDL4d7Z2SyP9uNlO/0E85m51ISY0Z1nBLIamjWaGQvICBwdG+oKdn+4
   YgVfGA1RcgR7P4qvGwPDAdOK7jFD6Qeiu9fzaJKnmF6x9h4sLw0pb8Duu
   2MXwyaOjz0tQvs5uJo+ECybHtMZZPnaMzTbOL1+yE0dUie1im+W7JX5VN
   QF7+5KxSwZxuYCIK7mxQ/CTrA5McT8+dZM5eWjbBq8XA748PlTyc9/Bl8
   pOdWLzHqp2QcuXfx38E2E7i34xymCEIZBYFZMB7GR/byZlSTNNcyMg+7V
   A==;
X-CSE-ConnectionGUID: x2+3vNwyS42U8h1uz5zCzQ==
X-CSE-MsgGUID: C+SlpwbOQ5CDN/5WaBmaSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18710000"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18710000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:06:41 -0700
X-CSE-ConnectionGUID: mRAW3E8RRz+s2CJPHSVzVA==
X-CSE-MsgGUID: ebbq0P2PQEyiwRpRifRVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51491204"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:06:41 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B299E1203E6;
	Wed, 10 Apr 2024 14:06:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ruVmn-001kE3-26;
	Wed, 10 Apr 2024 14:06:37 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	jacopo.mondi@punajuuri.localdomain,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] media: v4l: async: Properly re-initialise notifier entry in unregister
Date: Wed, 10 Apr 2024 14:06:27 +0300
Message-Id: <20240410110627.416011-1-sakari.ailus@linux.intel.com>
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


