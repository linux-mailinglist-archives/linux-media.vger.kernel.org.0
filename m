Return-Path: <linux-media+bounces-57171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDNoHCxzxWmN+QQAu9opvQ
	(envelope-from <linux-media+bounces-57171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:55:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9DE339966
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C73308A8FD
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D86838F64E;
	Thu, 26 Mar 2026 17:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW1hEVb3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320B30E85D
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547351; cv=none; b=gCc8zC3rcCKQZUGukrke90gJCaPQHuvFYWfafqIPZhURZvgkS0hDBtcujQpY1wxWX2QNZ0UDhPRkEiNNpQr1twPmuKkP5lF3ePNgqxveO+WSyxf7XIRUTfAp+8htwUVWwPBMPSMFt743ddFFj/aSTMLfjpUcfLYKtkzjpPX4geI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547351; c=relaxed/simple;
	bh=SyRV4ibNN4fPiax7DMvyaw5kIlF5ftMO3tpyBvpx/mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sv45nOuzTq/BGMfpJ6OCaQ/clogEgjVgB1Jjp1aFaLMDNBp0gcfsEsa0UjdwL53gla4iWCnCwbZZnmOxbZ+mf+//H5H7PK/ms3vdgrkLc0NYybPo1j9AGgVd9GnNGmfBaLVaPBYmu7e5uG7oeap5B/r9HZDwHIJwCdEjPenefcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW1hEVb3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774547350; x=1806083350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SyRV4ibNN4fPiax7DMvyaw5kIlF5ftMO3tpyBvpx/mg=;
  b=JW1hEVb3S9Opl2KzlTfzzAKNtZ6hwe/eSmNVVvYncAuEmCFNzu8SC4Sp
   a9KpEqfAKUmjp6ypTGlIcX8qjldAR0rgajWIowAn+LVOWxkvqyZUITub8
   zr88Xzj7yFyrjJpAOHQU3aUPHHfq3H9TCynQHoP0MlyxJV8j6uj7R58ux
   rJVnOnQAgSVvTlyywFAZVnrMphTZ7/YxFe1a9VKlX5G4e++K2iWRPliQz
   gNoSx5xAxcSY83IaIxfKShgN1a0RVnI52Z61md/fn0WNX3Dd/eRaYRsKc
   6rewl8SjC5AlsK9J06JvMzGTzewbAaUFLTCQtT9KgnEJN1uHm3Jarzr6X
   A==;
X-CSE-ConnectionGUID: h1S9EAZXQ+u4bj2TMmO1dw==
X-CSE-MsgGUID: e9acmIgDSnGTa82ugD11HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93000311"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="93000311"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 10:49:09 -0700
X-CSE-ConnectionGUID: i+Q9TmPRSPWlnOxDmu73yw==
X-CSE-MsgGUID: RIMaIc7WQhWRo49lypgjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="221765431"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.84])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 10:49:08 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9717511F9C9;
	Thu, 26 Mar 2026 19:49:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5opR-0000000BWXk-3t0Q;
	Thu, 26 Mar 2026 19:49:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Michael Anthony <manthony.nw@outlook.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/1] =?UTF-8?q?media:=20dw9719:=20Add=20back=20the=20I?= =?UTF-8?q?=C2=B2C=20device=20id=20table?=
Date: Thu, 26 Mar 2026 19:49:09 +0200
Message-ID: <20260326174909.2746696-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <AMBP190MB2678CBCD19A1B6416481EBB7ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References: <AMBP190MB2678CBCD19A1B6416481EBB7ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,ideasonboard.com,kernel.org,xs4all.nl];
	TAGGED_FROM(0.00)[bounces-57171-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D9DE339966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The I²C device id table is necessary as the device may be, besides through
system firmware, also instantiated in the IPU bridge so matching takes
place using the I²C device id table. Add back the table, with ids for all
supported devices.

Reported-by: Michael Anthony <manthony.nw@outlook.com>
Closes: https://lore.kernel.org/linux-media/AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM/
Fixes: 15faf0fa1472 ("media: i2c: dw9719: Remove unused i2c device id table")
Cc: stable@vger.kernel.org # for v6.19 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Michael,

Could you confirm whether this fixes your issue?

- Sakari

 drivers/media/i2c/dw9719.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 59558335989e..3b7ba88fd67c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -439,6 +439,15 @@ static void dw9719_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct i2c_device_id dw9719_id_table[] = {
+	{ .name = "dw9718s", .driver_data = (kernel_ulong_t)DW9718S },
+	{ .name = "dw9719", .driver_data = (kernel_ulong_t)DW9719 },
+	{ .name = "dw9761", .driver_data = (kernel_ulong_t)DW9761 },
+	{ .name = "dw9800k", .driver_data = (kernel_ulong_t)DW9800K },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
+
 static const struct of_device_id dw9719_of_table[] = {
 	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
 	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
@@ -459,6 +468,7 @@ static struct i2c_driver dw9719_i2c_driver = {
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,
+	.id_table = dw9719_id_table,
 };
 module_i2c_driver(dw9719_i2c_driver);
 
-- 
2.47.3


