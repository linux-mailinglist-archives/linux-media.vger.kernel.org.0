Return-Path: <linux-media+bounces-25271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D715A1B8ED
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7201B3B00AF
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3DB21C9E5;
	Fri, 24 Jan 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mjrU8mD1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF24194ACF;
	Fri, 24 Jan 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731900; cv=none; b=kC4lnoPmR4r3KSnRBCrHVP0d0tsAbMbYB8X2StRWnhLEcZMrv2qgCLGUXCErwFG/TuEDBNaOsh2uUsKZgyRgq3Nx9R2AgPLRc2WL2C8bzOa7985c7LdClUVLXgEAZfrJLquwnNPmT5dri0Ib5/F0O6vHw+A2+PfBVLp4qExhiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731900; c=relaxed/simple;
	bh=kcMU0qjNaqVFpOZnkoU0jMWxUqG9eiVmEPHe7AF/j3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj/OSCUSCZxiWupc3A3pDN7soB6Nq2BFnBAvQQoJhvYGBPN42ZyvBFH5RrlBBII35rHjJgJMVRiFan+FATBkTjhWmuGNdSkn5USnlAmGbtEvUN450RgETS0SbuAlye8DHM+YkrS1Tl0YmZeRfm5KIuRvolZMpPhWVfBP/Y+ljE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mjrU8mD1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEAF173E;
	Fri, 24 Jan 2025 16:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731830;
	bh=kcMU0qjNaqVFpOZnkoU0jMWxUqG9eiVmEPHe7AF/j3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mjrU8mD1/qSpTgqvnip7utzSyVUagoDJM8oSvHsW9Ev495tXmdCDCX8E6Mtzphaoe
	 QpC96ut01l0CEWtQdjr49InnlBZedd5rymxEqRseWtO1Dq2B2IEwLeM3QJdTKQHyS4
	 UKfRQh07oycit2sfk+xJEEaZkuQEX+qyueLiSP9s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:40 +0200
Subject: [PATCH v2 03/22] media: i2c: ds90ub913: Align ub913_read() with
 other similar functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-3-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=kcMU0qjNaqVFpOZnkoU0jMWxUqG9eiVmEPHe7AF/j3s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68sq2LF3bIupyfZyPHzoYtdAaqHwuTNHG4fs
 oL5/jDYsUyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLAAKCRD6PaqMvJYe
 9Q70EACFI/qMzlbmrxmeVO4NXyHfTpABheHYCf3ywKc32xteCcif3mZpWnmwXBkdSZEAq3/Gs6+
 FqBhmPj2EI4RxDupGtlaGWqZUnqJPeMQeiUZiYry0b7nJyGwHZa5PDPPrjdF3mZN+iWZAzeEeY7
 FZEp/Y0MXlphpsc0rAhWvondKqNbv826+wFkv2ir7c81UG6VJ1U7oC88AXw5m5urQto5vUbu2eZ
 rigq1ndi8nkM4G5I4o2b+3YhLrDLqQ7kY0uLRBu9cdQ5SNHEMsfeeThA01p2AthHSVrhuEpi/N1
 Z62afOr5L9TWct55CI+YSjtJYPBKloZJQSRQp1m4v8ir/zrkSrFphN1TZgcqWPaQGn0zcxi0Yy0
 3SohN3NYc+HVj/AXXvWZxNCXn9cCrREiTzXjIob1ufsssCxAxxZWPX2YIgQ6FPaljXxTMRYUsOg
 3em5WKJ1yfs0OMhg2kV2zSrYrPKAWGkliMKDSojrBklzf8jfT3J4KBAdz5iq4PNVaBBDTHyEit4
 ibzUGH+EdevyhouLYsgnRiH3Mq8C6X/sMVukuOq7p9feD4aepB/CfP2wYdwX1DlddkiTohEKHNU
 zLtntT5pNvIQ/de4WlsDTxJL+zjavUdFsjHP1epf83mhhd/jimfXWwhHcc/i8a+67pO5wFrzHIh
 8JsTfRFMBpyYOyQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Adjust the ub913_read() to have similar form than the other similar
functions in ub9xx drivers. This makes it easier to deal with all the
read/write functions with a semantic patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 5d754372230e..4a0c1e7cb8bb 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -125,14 +125,16 @@ static int ub913_read(const struct ub913_data *priv, u8 reg, u8 *val)
 	int ret;
 
 	ret = regmap_read(priv->regmap, reg, &v);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&priv->client->dev,
 			"Cannot read register 0x%02x: %d!\n", reg, ret);
-		return ret;
+		goto out;
 	}
 
 	*val = v;
-	return 0;
+
+out:
+	return ret;
 }
 
 static int ub913_write(const struct ub913_data *priv, u8 reg, u8 val)

-- 
2.43.0


