Return-Path: <linux-media+bounces-27360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F7A4C604
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F7B1632C3
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A8421638A;
	Mon,  3 Mar 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SgTtv68T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455A214A9E;
	Mon,  3 Mar 2025 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017747; cv=none; b=GoasHtD3zfjOcb0p9pmjBBzYp3JS8jT9zb73Mi8q2eZcqEX5GottAG966KhPyX4ndG5k3m+ODy2sbQHSyVVT0rXQ9FzAsSpTe3HAXGWeYHgKt1hr/brp/DiXCCsfVIjJoa/cQEPTMeYMeEKzhz99JPTEwAeOUSz+NfxLf4iM+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017747; c=relaxed/simple;
	bh=JLH9MJR6Zq6nZAb3s9lKLinR8MoPluF9Iq/DKAfHIFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qR5xrvhrge51lMo7Uz2ha4cMBzpX96iUZbYfJ1uiYEEvCpQXHhstrdsJYXnr7AUBHtuBWulPCKh1tBhY7KVqAXwlEC9gAHcEYO63zMZrI8m+81Di2hdL8ZXMs2JVCbEJtj8h4Tw17ISWwHRvfOtNEr4yRkm6NYoHwbInSUQ5myI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SgTtv68T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 141341189;
	Mon,  3 Mar 2025 17:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017653;
	bh=JLH9MJR6Zq6nZAb3s9lKLinR8MoPluF9Iq/DKAfHIFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SgTtv68TVcBtayrUxnS/TRFIVaGcKyCkrQi2DmTo0bJr5tc7gVXyEwfJEoQ7ywokt
	 7gdUUyapNT9IpOyzmqIB/mGITOedYphtA23oU23OSITgGYf4WSzxTf+DMn39DH/LgZ
	 jAtE5oJMzknNLZU3Uo2wSacwV19SfRxUNXiK7JfY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:05 +0530
Subject: [PATCH v3 02/19] media: i2c: ds90ub913: Fix returned fmt from
 .set_fmt()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-2-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GzgsmXWOYQnJFZCCQStgSFGp+y0aPfeevNKeKV6gVVM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ+CVnm+xnkIRMaDDVGjWw0y8LZ/z5xqRq90
 96wRnQd8Y+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfgAKCRBD3pH5JJpx
 RTpQD/9ralZV2/880aAJ1glGh8LZagW7GbVtR3bxrmTUyGx/PG/vfhnYFV4TsLHmU1OooMvpCmc
 7b8UAM35cmEDz4aSrx78UjZSzmZhOSU5r9cmLcp4x40k2zTX4ikjdF0lt+101znyKVWF/Af6lRh
 HjbeD6pwfRQBuTKJE+OvQvAKPv/rXTfmRnKRJM0KirCKE71OLOYusz4IQQxTkmwPWVFQEXmq1IT
 A69aU0S2a8kyj3RyquueAbM6xevF2FtLsSeoS2uQ5HIUedVzX9WqplRSOzQvjpLOnlvq5BeZZQU
 9y94DLgPRri4NZN5kIaHOwSSyAFd9/pkbZsFIN90iciZhLZPPTgreo/RChuMHJseXi98lCmEr1W
 LxNbq1QeJAdQHbcyNUW0pOnWpttGMDw4IocTiwdtqevffBA0nKJQVDQGLxLF5tUNVroImbTfBLC
 iXxsL9j6PwT9ECFej3Pam8aL/N88mAF4ZsSmqZDVZKbYuwzrnRYMXBaiftVEHPHhAjPHkYJkSZt
 vap/dQ8oqAe4fu2BSD+H9ARScYbn3dIoGt0DhWUtBNRuYFn/GIjyWC2fDKD/WglE4UancpDriBb
 LS9Vtf37MYqj6LktW1Z9TETNHK65RfRvznlt6q7JKV9S0tOxb/HfeNS97TjZiMKczgNOd22YW65
 dZv5VgKDI1pW0kw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

When setting the sink pad's stream format, set_fmt accidentally changes
the returned format's code to 'outcode', while the purpose is to only
use the 'outcode' for the propagated source stream format.

Fixes: c158d0d4ff15 ("media: i2c: add DS90UB913 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bfb688f00d7bf5a109e978f6c322e6..1445ebbcc9cabb3ab43a670aa165deea52db5f35 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -450,10 +450,10 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
 	if (!fmt)
 		return -EINVAL;
 
-	format->format.code = finfo->outcode;
-
 	*fmt = format->format;
 
+	fmt->code = finfo->outcode;
+
 	return 0;
 }
 

-- 
2.48.1


