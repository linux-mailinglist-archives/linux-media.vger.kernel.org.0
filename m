Return-Path: <linux-media+bounces-25270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5005FA1B8F0
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7B0170375
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F1E21C9E4;
	Fri, 24 Jan 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K9ysMA8S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A02194A64;
	Fri, 24 Jan 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731900; cv=none; b=vCz6FNTwWHjyTgUFFa7dMJyqnyN3K1naB1T76HH2WDl4P9sYntBREh8BRnY/yex/H/23WhKuI2ydCUD1pK98gWaFNQiKwb3cZ4+oxEDZnv5OAAuDykfGb/3bQUEW+RusJHY5cDfCkByzh4QoLw5L/h7xtb7dCKs30/ygg1zhxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731900; c=relaxed/simple;
	bh=X3xU9c40ZhpwpTjCZ9+l3zyU0xGvLqOPHWunwPW24dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JE1mckiAHSKesMTbjTey3dp/WN2O7/Ny/3q6l38PHzefIN2fjWiVjWpU7nj3nKHQMsODtUzwuovrFbddOooaIUM9nwlcjH4YUT4CrYBRGXDnEwGFo8FrRvMCgUrxa+YM8cbqutU7ixRla/HIXg6UdgWy7ZKyJOZ7InMwclomUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K9ysMA8S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 611C466B;
	Fri, 24 Jan 2025 16:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731829;
	bh=X3xU9c40ZhpwpTjCZ9+l3zyU0xGvLqOPHWunwPW24dQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K9ysMA8SAimskBR1d7WDbYSyDOneQkAFx1+aCgaHbkey/9fhXlgNxaNULtgg6inLY
	 2D1oQY6pJMaCYrdhXGI4cmDE6cXEOUuOSI3oWhRL9yB3LI4+eY3W3/kPlDXX5peBDx
	 QsHAlAjfutXEl6uWkwP0foEPBjw/SSUnodsa5wXw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:39 +0200
Subject: [PATCH v2 02/22] media: i2c: ds90ub913: Fix returned fmt from
 .set_fmt()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-2-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=X3xU9c40ZhpwpTjCZ9+l3zyU0xGvLqOPHWunwPW24dQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68s+RieBCfeKJCsoQBinCAwGq/u4rXbnrIuU
 LaFa1ZkRBCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLAAKCRD6PaqMvJYe
 9dyWD/4/Tw0d6GF2GFXgxkI4Y0Age3Mp7YKHcox1IYFDZ4tbvHAoOCtmfyJFAmF+Gu8QhT58VNK
 WQZ4xFvAtdrbDcFMxB86YpooBTNCf+jbgQuqp5ZoNy9FJyhJEP+bJC6MedOXWiHwsjpYHdRQfoO
 jVotnhVlUheCmzF51hA1dZLePmdB+4kCJlaZz/0ZP+0/KBEZ8aO2J2JBauw2wdUoEkL3rDN7y4E
 oznR9mYRa1nw4igk4M0copqe8GOQwsABzFkEfY/14YzpgwbmURWLD8OFZoIqDYLl9Q/DvpdAebu
 4R6U97/2CDs2Qo50P4p7938tTYt2PUa9Axb+8oGSXV71YQG4Pn+aLlXL1h/6matlAiTV4WTPJwl
 IcRQyVL3Etrm+wtfrpDSXTYgYcfNu3x+1cf9iLecUZ7v5rH/TKp/mOBcepngUIhDmM0FqWlXSOT
 mJNxpRW9RjM3LRYApQHtHkGZmrBznRh+KFALMHVxtBsxkUnPavzO6Usr0879eHtsGKWjRV7UcaT
 O+r4b+KiuyMKdquQhssu7s9DuPUVGa/wOPNdvTouI+VK92Vt8Wd8E9gzr8mJ8oqVPvtSXgLEwBu
 pQAx/lYvGSIKyDJ015jlB+6eoYCsRg4wxhnFNw0yUaafZbMbkNaAHB54VYyI3yeEkSysbeLb8X0
 BHooqp8I8Y/EwFg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When setting the sink pad's stream format, set_fmt accidentally changes
the returned format's code to 'outcode', while the purpose is to only
use the 'outcode' for the propagated source stream format.

Fixes: c158d0d4ff15 ("media: i2c: add DS90UB913 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 7670d6c82d92..5d754372230e 100644
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
2.43.0


