Return-Path: <linux-media+bounces-21127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB479C193A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD664282E3F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC891E3772;
	Fri,  8 Nov 2024 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L2WQ01eq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8101E32B0;
	Fri,  8 Nov 2024 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058523; cv=none; b=BzJdPsejzS05eQaj8j5glywfZJ7JsnvblCDNfgXJUBFH4Ymfl6ckPrQ0Hm+Qh5h8oAcJ3BSaqJAadCOMPAY832riOxm+nW0pT7H2hgP0UUWAplT7mTjo77VDDMe23eAnPnqLVRczCmV48rMSqTwWox5HnPaCyBZq7K+4FfrNIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058523; c=relaxed/simple;
	bh=KEJUa+NA275qqmfLngLNAjLh7UNjtzQi4qbdB1cIyjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qK0OFt7qHF96Dkuzp0X6Es+jeUUAmwWCQxZloRePBDHV/tiy6YnM8iWieL7zT+6cUONFjDGicBf7KRQGcFfIoOBlBG+6jv6ClEDB/KmJ2PMNiVXhdC1LiqO2srBslc81sKVgHBnUKuF2RhAAgDDTBZI4KE3jIg2fSqNgzMDRu+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L2WQ01eq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C53BDD21;
	Fri,  8 Nov 2024 10:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058508;
	bh=KEJUa+NA275qqmfLngLNAjLh7UNjtzQi4qbdB1cIyjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L2WQ01eqZcwjxIZr8+LN/z1AWheDz8i0ycwPmN27K1pqUM4z3Y3y+Z1P4TYc9JwN4
	 HDm3bi+DHlNo+cfvoeov8CFcRP6CaaAQ0opBWVyoTdd7e3JjgV0ljCz8SrkKkJAm0s
	 SE2HkemQ4Ysya9awETMoRTavILMiYq2mD35y2eV0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:47 +0200
Subject: [PATCH v2 03/15] media: i2c: ds90ub960: Fix use of non-existing
 registers on UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-3-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KEJUa+NA275qqmfLngLNAjLh7UNjtzQi4qbdB1cIyjI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtOVGM4C82BoYG0QdjOkvHIzQuGFPpQwhaLM
 XUTScweMImJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTgAKCRD6PaqMvJYe
 9f4XD/0X6whY7P3M/FPk+E/LtIiszFNliYqfdDZPV97zqi0/gdsLTayoLMuhUMdRr/qXKpHs61j
 vT5xtviFBYl9iVeFfNNY8flUllCHeY8OH7arBmKgyxwnF1JdAYGtSljvGUpJMe8AgzdNNYfcuZE
 7zTdk725Idh2xwrHosagYb7QM8v8S56zLlYdbh8VbvZ1+gxEjnUSoMJr/idBcNqQ6LlgCJuf9Nn
 bCc82dmA8dU97bo/4v0VZUqEKHrJ6x3lGP5CN732XQip1E+0cS7DJVAjoA9f7xoPapRFOE9vkPB
 5CU+dugrn1CU9qkQAyqWxDMSxhjo7Qo7efWK9OcQ32HYXeVnjEjD0XacDQX0652ZIVHA2cGOhdg
 TghwcL9M5HrGKowCzwbPRvzagh+fjunj5FYFA7qB+oaWez5CJZXNSoohXZD+AmRbhg4d/tEwMzC
 JUHX+Pw0OBc8lf2056mO/OwFDiyd0hIjU6Gg70VFuUAYEPJMH/ycj93OaizmeYfm9Jm1Fr0mfOo
 K0/oIz3+UvmyBB3MaCZkJ50teds/VVaqtFijL0LoT7YGuwt5hJs9yRm2jw0q6h5cwJUomNn4GEE
 cJSr34eb4XNNBPx+7Rz+imQsE8QeIN+lKZtb0digdicMekR52hL5ysfspDVyq5PV0X7P4W6UufK
 oW3wyqpHdfPWaxw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 doesn't have the registers for SP and EQ. Adjust the code in
ub960_rxport_wait_locks() to not use those registers for UB9702. As
these values are only used for a debug print here, there's no functional
change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index b1e848678218..24198b803eff 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1577,16 +1577,24 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v);
 
-		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
-		if (ret)
-			return ret;
+		if (priv->hw_data->is_ub9702) {
+			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
+				nport, (v * 1000000ULL) >> 8);
+		} else {
+			ret = ub960_rxport_get_strobe_pos(priv, nport,
+							  &strobe_pos);
+			if (ret)
+				return ret;
 
-		ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
-		if (ret)
-			return ret;
+			ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
+			if (ret)
+				return ret;
 
-		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
-			nport, strobe_pos, eq_level, (v * 1000000ULL) >> 8);
+			dev_dbg(dev,
+				"\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
+				nport, strobe_pos, eq_level,
+				(v * 1000000ULL) >> 8);
+		}
 	}
 
 	return 0;

-- 
2.43.0


