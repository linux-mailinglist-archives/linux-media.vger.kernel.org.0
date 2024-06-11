Return-Path: <linux-media+bounces-12958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11246903F65
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 17:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07F31F23B26
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D590D17573;
	Tue, 11 Jun 2024 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfhYiDZe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7D212B89;
	Tue, 11 Jun 2024 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117994; cv=none; b=Ic9NvGo90SIh5juZrpp4Bwvp5eh8mhfJQyKIeKDCZfItuNbVmDGMoIxNiSLM9c9LzKCdB9O8hqB+5QRJkWxS4n3+4+M1kLbbLTT6uA0ovRFrVZBkg8M47T9TrsrHZLS1dQ1LWn4TjSjjrT8F8wrKRRVGMe8TcXxrq5gPc3SBiWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117994; c=relaxed/simple;
	bh=UYctEp2wmBZzjxzC3roRrXYvcSyT/7HQ0rmZrgj/cNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s9aHy4X+laoYZxaQ7PbqQCngo6J2m2juufNfePIeCgX6SGtEbf7NAz+Tlim5eLHBvrsi3V6wgjgqwRFE7R3xNvRMCO/rBfaGQOXMtDRq/RWJ0flMIeu4Dz/BPPEKnmo/YKkUKzewCaZA0FDbrs53ZWw4N3mzke2gh+jI1isT1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfhYiDZe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718117993; x=1749653993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UYctEp2wmBZzjxzC3roRrXYvcSyT/7HQ0rmZrgj/cNc=;
  b=LfhYiDZe8kThRfE8yLQvG2sFbyS8+dCMXxUwgIosgln42Yw89kDkSE7k
   Vis3sfMaTD/YGdnsxaQt3DL96SvZkavp734WvOI7FDVJ6G3e188TS5xEB
   biwQH0wbFVwuG7OpVY2+0RD8YSzuXzPzBaOlOAbn9vggFuq8mFIBySUb9
   7wIdnMqI+TYddOoShaZzk5o2RqXVQAOF/W9zKi1//ENYEL0EyvqFyzydb
   d5HkrzAKgio6B8n0q5pjRaz7nHOynZOfAjnvFFvGUoScTEcsILIEbWsYa
   5cjGhI8Bc1Y8e20NlPrndxDXV3/QN/28rtSgqqxH7/dILy8S9OKmmjHZ9
   w==;
X-CSE-ConnectionGUID: ykX6/Oj+Rk+IoIH/3G1mxg==
X-CSE-MsgGUID: XHGPxFhORAGKLR2DNl3AtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26250246"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="26250246"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 07:59:52 -0700
X-CSE-ConnectionGUID: vv8eEkUCSdKcMX/+DEiYcQ==
X-CSE-MsgGUID: gJOYl7FQT+qk1WmRL0Gs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="44408424"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2024 07:59:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79063169; Tue, 11 Jun 2024 17:59:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v1 1/1] mailmap: Add my outdated addresses to the map file
Date: Tue, 11 Jun 2024 17:58:57 +0300
Message-ID: <20240611145940.3879610-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a couple of outdated addresses that are still visible
in the Git history, add them to .mailmap.

While at it, replace one in the comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Cc'ed to Linus, since I have no clue who is the best to apply this
change.

 .mailmap                                  | 2 ++
 drivers/media/pci/saa7134/saa7134-cards.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index efd9fa867a8e..b6e9fe0916ce 100644
--- a/.mailmap
+++ b/.mailmap
@@ -72,6 +72,8 @@ Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>
 Andrzej Hajda <andrzej.hajda@intel.com> <a.hajda@samsung.com>
 André Almeida <andrealmeid@igalia.com> <andrealmeid@collabora.com>
 Andy Adamson <andros@citi.umich.edu>
+Andy Shevchenko <andy@kernel.org> <andy@smile.org.ua>
+Andy Shevchenko <andy@kernel.org> <ext-andriy.shevchenko@nokia.com>
 Anilkumar Kolli <quic_akolli@quicinc.com> <akolli@codeaurora.org>
 Anirudh Ghayal <quic_aghayal@quicinc.com> <aghayal@codeaurora.org>
 Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index 1280696f65f2..e80fb4ebfda6 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -5152,7 +5152,7 @@ struct saa7134_board saa7134_boards[] = {
 		},
 	},
 	[SAA7134_BOARD_AVERMEDIA_STUDIO_507UA] = {
-		/* Andy Shevchenko <andy@smile.org.ua> */
+		/* Andy Shevchenko <andy@kernel.org> */
 		.name           = "Avermedia AVerTV Studio 507UA",
 		.audio_clock    = 0x00187de7,
 		.tuner_type     = TUNER_PHILIPS_FM1216ME_MK3, /* Should be MK5 */
-- 
2.43.0.rc1.1336.g36b5255a03ac


