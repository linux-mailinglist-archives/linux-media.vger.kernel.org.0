Return-Path: <linux-media+bounces-55983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE3XEmN4uGn5dgEAu9opvQ
	(envelope-from <linux-media+bounces-55983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 22:38:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2952A10DC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 22:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE45430DFCC9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 21:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E753644AD;
	Mon, 16 Mar 2026 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWL6Iemu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76E218E91
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696899; cv=none; b=e8SAH6dvtSaNp29zbLjnaoPlIXu93r0xtV3ZukzvQIj+CdgD5wNi4/qSGJG6kqKzqloXpsd3Pqu4PsFaeXXLsPKc516KWmwG6oStlB9eje9wENLIprmTMXAmXHB3UF6uyEbhD+oh4SjhkNww0/8014tWHCHFGRzPs2uX99nv+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696899; c=relaxed/simple;
	bh=sey2K7tPsLMu993vURn0lPenCtNJ/eHoOmpw6ebQLyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HEqKoPV0nTtZasVijn5q8INYOQZRtZzc3A1DPwmuP8SbE5FTG7ZxCn4UsA0vmLVIgu+dctft+AZu+1xmDgkq05xvoJKhejivbKrkHrj+notcnBkQAV31YBO6B289ZHZ1cGXnQNgzQu/eu11Ww5SlV4DeeMGar25hDiO4uv5JBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWL6Iemu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773696897; x=1805232897;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sey2K7tPsLMu993vURn0lPenCtNJ/eHoOmpw6ebQLyI=;
  b=OWL6IemuMuZ/U9cYPZigO50rHlJu47SpGadvV0DpotMGozG9AzJ6NJ/b
   jhlImA7bmrItQjUAaIhevNCJWvPbkp/cvg9aELEoWoPvOLvhLJXB62bEb
   QBB6i+EdoAdcACyjQ5f2RrKZJCn9ajfBndYVUYFnPvVqaQZqi1ozmxOUu
   xzSSEGLhOQKFyEp7AtvJIb0Sa41x4AzEX2M9VhJFZi2w1MasDRl0rePbE
   lE/CELumcBGSxJcDr4qJarCjMNVrAalqu7FuA6Jd9XlhTVr9buBAXO8ux
   f1/rIubo0JjmF3aQt76cwF7T1C4CxvsjYtMnIz/jBkcLZgGmrFLLIbRS3
   Q==;
X-CSE-ConnectionGUID: htwZMFlzRoetbTcVg69hpg==
X-CSE-MsgGUID: HwRp/toAQuWApyyXXqP3CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74800746"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74800746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 14:34:56 -0700
X-CSE-ConnectionGUID: 9+bs37DxTjKRraztO1bGSw==
X-CSE-MsgGUID: e0sd61hARcS7zU7uuHsb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226176193"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.29])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 14:34:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9CB271202CE
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 23:34:53 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2FcN-00000000tCQ-1lLD
	for linux-media@vger.kernel.org;
	Mon, 16 Mar 2026 23:36:55 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ov02a10, dw9768: Remove Dongchung's e-mail
Date: Mon, 16 Mar 2026 23:36:55 +0200
Message-ID: <20260316213655.212178-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55983-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A2952A10DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dongchung's e-mail address returns a permanent error:

	The following message to <dongchun.zhu@mediatek.com> was
	undeliverable. The reason for the problem: 5.1.0 - Unknown address
	error 550-'Relaying mail to dongchun.zhu@mediatek.com is not
	allowed'

Remove the address.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/dw9768.c  | 2 +-
 drivers/media/i2c/ov02a10.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index d434721ba8ed..d037d3009c9a 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -551,6 +551,6 @@ static struct i2c_driver dw9768_i2c_driver = {
 };
 module_i2c_driver(dw9768_i2c_driver);
 
-MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
+MODULE_AUTHOR("Dongchun Zhu");
 MODULE_DESCRIPTION("DW9768 VCM driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 18fe36287a76..7fc267963d04 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -1000,6 +1000,6 @@ static struct i2c_driver ov02a10_i2c_driver = {
 };
 module_i2c_driver(ov02a10_i2c_driver);
 
-MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
+MODULE_AUTHOR("Dongchun Zhu");
 MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
 MODULE_LICENSE("GPL v2");
-- 
2.47.3


