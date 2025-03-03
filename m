Return-Path: <linux-media+bounces-27361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD807A4C608
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D12F16F905
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619CD217F27;
	Mon,  3 Mar 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xd+sj9f9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6A3215057;
	Mon,  3 Mar 2025 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017753; cv=none; b=VqxydaNqPtKiEnNHxAkEHT4fwTvzeaGV5H7dgTujWV5cAqaTT29G7EeyhA3OxvfUImlAt5Onl6Oy0KfkFYiux6iHdljEmgs9KAZzgzhDJeCzAWVpAQxyXHLnlIK1iVZJOJ3JvGsIQdXDMe3SsxH0EWkezE0jgV3VV4m2ubv6q+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017753; c=relaxed/simple;
	bh=otnwcbFWhDhUPF+LRNkVnBE7tXry7h29uKAVmJYC7Kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0W0cINcdDtsJGStRgVUd4wMEYHwJcs260OrG2UUzVtLqtqgWUsDzVjSNN0KCHslaT0GIdcj6u08w6rkSoAoZ+0nAXgI90HjRmcRNMZ0LgLEi/+EsMeCY+yEQPJrcK5eJ/gRc+wY36RWTcmBUFgCk/z19slVjapJoCoIg0hbsQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xd+sj9f9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B9F21189;
	Mon,  3 Mar 2025 17:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017658;
	bh=otnwcbFWhDhUPF+LRNkVnBE7tXry7h29uKAVmJYC7Kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xd+sj9f9IgFiZT60oLkXRE0fbiQE/H1qPKOFBJTnT/JZN3rPK+2WGqmc7mSK7qemT
	 3jQ80Yl1K+PZNKIuk4dLGvYHLCiR5mkhXWB04EbQbPZvPmFiYpu5hRIBxV+xgs3vcx
	 klrETb19jw6GeqOG7FJn+07eos5Y9Wd8HhyZm8wg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:06 +0530
Subject: [PATCH v3 03/19] media: i2c: ds90ub913: Align ub913_read() with
 other similar functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-3-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ehwui8SOAsIre7y53CJZ4hsVlIUThE2tbEdDQO3AyJ4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ+C4Bc2KWXRt2eyOq94jurDzVxGOVl2I92i
 cjyP7ruIW+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfgAKCRBD3pH5JJpx
 RUX4D/0dDZettXt2L5oJhm3XOB/sOmH+Zeq312Ef72q/01I7uVMK8fG72D0klSeUSDhDhjkQj6L
 4CmcBGMlCHObHFAsDM/nvbIXfFvkDA+VfwRSGDdWfcRSrK1Xb6TKP+EelI/+YcKdfL0meD0Uun2
 +Sfg4771MkryWkw6Lw6N5r+NTjd8JtWsKJPKvGlHuId57wgahTjvBs20wlGHPHz4tPpcVZrLl/w
 wLB4ACPWefbm49xIBNQr8AQ4gfJIwYF92vktBrWXZ3HTGQizwNBaLGuXFXLZuhio5kcf3nqIXkE
 jgJZA/Ke1I34pbxkmu5oUN/kbvKudK8gFPN0s+yCTUfHMTRJ9KXusRujVccJxysOYHL0r3w7P83
 04+p65KIxnuqMaSRYA9oVWgt0s9kXkXMxldVOb7KhUz01R9YrYNn4L+P3FzUXOwbhsvbs/LSfwU
 Zf4ohEjo3Kc/pP4UpoluHhbPEAuoh97+lDbbgAg7W6IB92K7ytIlOK/X/GeOkDK5hmk5KIKJSk1
 QCFVocBSaFzBn6bdj8y0rWnScO7k9kDUexMoXhHZpcIAPQg6yleJ7v5PfGzF1n4dxlZRtJ5iAoE
 xqXIjmnZcnS4xxX6hfiz9kk0brHkPhPIkaZS5GbBx6VcRydDMHqT/KzTdrNQKXUiMO+j5+ACa+O
 EglY+luuNT0+L1g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Adjust the ub913_read() to have similar form than the other similar
functions in ub9xx drivers. This makes it easier to deal with all the
read/write functions with a semantic patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 1445ebbcc9cabb3ab43a670aa165deea52db5f35..facbee79164eec1fbccaea2c1d4d62cf439e49b6 100644
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
2.48.1


