Return-Path: <linux-media+bounces-56578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O6SDB7CvWmEBQMAu9opvQ
	(envelope-from <linux-media+bounces-56578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:54:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 852392E182E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 823143060787
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245E53F210B;
	Fri, 20 Mar 2026 21:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrIJqrw4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052D3612DB;
	Fri, 20 Mar 2026 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774043665; cv=none; b=RTOO4+PWXwBSo82edHWyNGTolZ2H8gdZ8LcSOzOKGBa/ALVy362UeRpxkoAqrECbRHXIZ0BYwFYrISNdcXkg33b+7MaCHEUtQTh1jXpyQH4Q9Qrk7M9eAsllNa6DDhh2yhCyudGGt7cUpWt3pZUpaVnwH16i5NMOEx4MNvok2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774043665; c=relaxed/simple;
	bh=asPKn1FGytN6vBD6LN/i/JVPqQzbUnKMWhU5TlpIr6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F1s4Uyfea4yEEn8AgaHR9ndhTl4dRmg9Ys64OjmDn+tLeBHbqpHhONHY7eIfzeZtUZ9SKuYhCX8+wwcJPpv1nsI7Hy/bU+bUmiiNqTjHBtDtG0zmohi3jS79E8bAWMfzHpUnsPBEebswSqHoE81Y3ZWDhvkJZfGIKlgHk+kV7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrIJqrw4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774043665; x=1805579665;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=asPKn1FGytN6vBD6LN/i/JVPqQzbUnKMWhU5TlpIr6I=;
  b=SrIJqrw4rD6TfkSypYiDdjUW21EjuxWtTYb+vQal8tynhrGAKaVk73Xk
   Mvz5MSmbD55KDvZopToRoAdiZc7s4BSUG78TmJgbfQ+H7HSkei5cBYjOk
   hGjx7y5Pd1AQDxijXlyR0exkihVfOwPriv3pll6yx8H6xOpn0ALpOS8lj
   oVgkcTcvzZHH6XuGdjPV/zoV+lU7fpZPf1exODQofmNddf7qfaYLVofW2
   0zHheakp4XsPPmrrXHoccTMo5Ye1pbr6mONMgCLxEQx2vE3tCGidgY5f3
   IbTLswvzYuckCJVkeVApBvr2AYc4ejAS6WzYCAcdI8LNjzzTmPVZQudxc
   w==;
X-CSE-ConnectionGUID: j1/F4u6eQHqkwB0e9hPyDQ==
X-CSE-MsgGUID: lJQUFhVdToaQB0Pyqrdhow==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85763374"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="85763374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:54:24 -0700
X-CSE-ConnectionGUID: IRwdLoQMSu+HBWCdgWXwCw==
X-CSE-MsgGUID: Zp3vc7j8TbaTo9Zs48oX1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="227893260"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 20 Mar 2026 14:54:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BC87D95; Fri, 20 Mar 2026 22:54:20 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: atomisp: Drop unused include
Date: Fri, 20 Mar 2026 22:54:19 +0100
Message-ID: <20260320215419.3236251-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
	TAGGED_FROM(0.00)[bounces-56578-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 852392E182E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..236122722703 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -11,7 +11,6 @@
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
-- 
2.50.1


