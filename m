Return-Path: <linux-media+bounces-19791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EAD9A1E8C
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053BD287A2F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E650A1D9320;
	Thu, 17 Oct 2024 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qi93aXe6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6713AA4E;
	Thu, 17 Oct 2024 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157807; cv=none; b=FdtdmwTzt82C51wFgKLpvQ5WCEWNDObw0HRgwMS7Elpo8qF8JJhKCsSyORCZy3znHQr7gmVgIQxpiQNPZlM9LwSmxMbCNVeF2JmjM/PwMlqT0qtXTX+xuNh/7GrUqadAYR1fQfa+xJLMeIcmCq5SIUJ3tJL6G39uz4IOFCt4BqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157807; c=relaxed/simple;
	bh=XQ8KSeY0btIB2wEygOoBrpdNMc8EU/NBR4PuXDo8z4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TSEEM1CbUEiz7kiSWCKVODvd0Cer4PoEDj/KGAsAfTuDj4dNJwJ+fcyG1XStRel+Ofh+guK6si/XX4N1qP3KDOWUZ4wsFHTFBgof6d+zoRlY7h757r0FCdILrzC4RD6oQ83T8E+5aQb+iCUqW0HF9FuJq5vk8EiCWTW18J4JmQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qi93aXe6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729157804; x=1760693804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XQ8KSeY0btIB2wEygOoBrpdNMc8EU/NBR4PuXDo8z4g=;
  b=Qi93aXe6SK/Q381FpTM5QkrkiqjDvM4/uxHJoK+ofddP2sHUMUZIW6Bh
   3Fo9/eIgUQzI3Ad3caLuOP3Cuw9ersT7UcTEoRDxW73id0GwiDHFnHkjN
   yUgSKGSb3KU7iWUey1eb/q3vXAWk4vJ72EQhFhOoRaXJjiV7COXtp027F
   OKob7yeYiUgJrnTiyIgoVfjoKS108CEy78/4OfBQVW3f7+PASG3p5NnlD
   /eVbOZWKEm3uDbYqHBH8kIFMUuusaEZfCRT4MQwBytqItrxcBM4xqiCCO
   X3ZbeVJocUZshw2lp1T8O95i0zRN9jz0KYI2zaHNFpGTuE5/Zxv/2nqbs
   w==;
X-CSE-ConnectionGUID: aOoe4ojxSmmuGOee3hdZ5Q==
X-CSE-MsgGUID: BwtlAuOgQ4q7ffZ+rWz8RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28423793"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28423793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:36:43 -0700
X-CSE-ConnectionGUID: CBwOZLdzQ5aQAV0SaHbuvQ==
X-CSE-MsgGUID: dWJSN6+2QV6KoPIzkDOKdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78394737"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 17 Oct 2024 02:36:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D0AC6184; Thu, 17 Oct 2024 12:36:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 1/1] media: ati_remote: don't push static constants on stack for %*ph
Date: Thu, 17 Oct 2024 12:36:06 +0300
Message-ID: <20241017093637.1183703-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to pass constants via stack. The width may be explicitly
specified in the format.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added 'media' prefix to the Subject line (patchwork integration)
 drivers/media/rc/ati_remote.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index d7721e60776e..a733914a2574 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -311,9 +311,9 @@ static void ati_remote_dump(struct device *dev, unsigned char *data,
 		if (data[0] != (unsigned char)0xff && data[0] != 0x00)
 			dev_warn(dev, "Weird byte 0x%02x\n", data[0]);
 	} else if (len == 4)
-		dev_warn(dev, "Weird key %*ph\n", 4, data);
+		dev_warn(dev, "Weird key %4ph\n", data);
 	else
-		dev_warn(dev, "Weird data, len=%d %*ph ...\n", len, 6, data);
+		dev_warn(dev, "Weird data, len=%d %6ph ...\n", len, data);
 }
 
 /*
@@ -502,7 +502,7 @@ static void ati_remote_input_report(struct urb *urb)
 
 	if (data[1] != ((data[2] + data[3] + 0xd5) & 0xff)) {
 		dbginfo(&ati_remote->interface->dev,
-			"wrong checksum in input: %*ph\n", 4, data);
+			"wrong checksum in input: %4ph\n", data);
 		return;
 	}
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


