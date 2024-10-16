Return-Path: <linux-media+bounces-19764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113969A0B2C
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 15:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA51D284ABD
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 13:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735DA17A92F;
	Wed, 16 Oct 2024 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e44/G4wx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B52021E3C8;
	Wed, 16 Oct 2024 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084606; cv=none; b=STwaSdJpkf2iOCtrmSJJuvWAnrytuW2BOlISzY7gNIaliA2YKahXDW/NOriLM0FvLR2KHXSwR1fSkBEFOZtx6MkuYs+kZp6aXs6J+QsS4eq+CQP2D6IvbdWO5zbpHDuz79UZ6KCQYmG8cvuxZUd+/DpYu09h3w74joapFrpcWX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084606; c=relaxed/simple;
	bh=hsymzkfTuge0XXIe3+kaUv0mZkgehaT5poyKfewWQAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUA69dS/2t+2R6jXP4SPhTgwZSWbBCSygXPODUVjovY+iLZdjRvQSuraT7e4n6SzKcdSskHzfPwpXqNFOx8sP3X7b7hz71am9nAFPEkSMStyby+x3n89tW2c0CAnDlHrUwWOTvlXWAh2d41la54jTtxMaW24UpC7xEUYL50JJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e44/G4wx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729084606; x=1760620606;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hsymzkfTuge0XXIe3+kaUv0mZkgehaT5poyKfewWQAc=;
  b=e44/G4wxxdjLj6y+Ocgj+eJs4+SqMlm/BAWO3sctpkzwguOKWy58GPzW
   37o95ddT1m/zQ/34XJ1XCe+7QnOUwCUZ65vGH4rm1CcOvoiIsHiJdwJ/N
   8bjeTwbHWO4i9jQCq8tdMqXDPyBDU5hOrRkFNlNGdDaLhhA7OzNGIKkeu
   50nC6hVpdMdrRTIbcUBbQUV2Ab8ILNCOEHv1hjjrsrzz6M+dArsFWSLNA
   Ua2c5qO5+GhKe3aROFx7j7OJE999IySI/r66mcPnoe745jNV3a6/oOazl
   pVhBwfPLFPpKCjoxAwSf1yo04mQ5hBDlq4+4t+fUOVflS9AniJGR0has+
   A==;
X-CSE-ConnectionGUID: 0PKVb3szR7KhTWP2eYZxyQ==
X-CSE-MsgGUID: QeE7BaQZSYODHTwffox7SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="53946200"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="53946200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:12:28 -0700
X-CSE-ConnectionGUID: W2jlOTDJQZy7XEs3ijPUlQ==
X-CSE-MsgGUID: mHgPJ6DfQ02YDs6j9nSMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="115655247"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2024 06:12:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A538D165; Wed, 16 Oct 2024 16:12:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/1] ati_remote: don't push static constants on stack for %*ph
Date: Wed, 16 Oct 2024 16:12:19 +0300
Message-ID: <20241016131219.897966-1-andriy.shevchenko@linux.intel.com>
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


