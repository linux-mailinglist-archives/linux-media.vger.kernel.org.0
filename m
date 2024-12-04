Return-Path: <linux-media+bounces-22594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766E29E384A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4051620A2
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A471B5823;
	Wed,  4 Dec 2024 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jyVEkWW8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DBA1B4F3A;
	Wed,  4 Dec 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310351; cv=none; b=hpIDUSz2JQTTRVu+mEwG3yKQ8RJ5R+oqJySJX10j2Ux0ofxli7TU1dKUg1Yd4jRbk3o9t/VSgriaLvFGS2Ar1Hj1385LLqIpxo1wMTrib9b8Irg69TUDFo3T3t8+00egwXo65u6OtBp2d5sObHUGlrPH1WGbJms/YobP0gCfJ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310351; c=relaxed/simple;
	bh=xIzfZpPEYKwaGmQ1wVvwBLTIhY24t7t/JYtth8aWl+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3qzEt7HOCevDHtlga3Cq46JBsDS3caKA6eENmXjBChulf/ph49JEthPLot0OW2I3EIUZg3hVxpmKVNotNAzx+7/UxO1UTset5JW1hH+aSEjFkjUO4I1trUjveEtBTrCKWuFlJpUt723EncPijbA6noWII2mV09ZCmPlwi1cWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jyVEkWW8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0AD1D04;
	Wed,  4 Dec 2024 12:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310318;
	bh=xIzfZpPEYKwaGmQ1wVvwBLTIhY24t7t/JYtth8aWl+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jyVEkWW8fgq9PrtMQLyOOovtn1Snsyx+HeyjvghRBz9DUtaPdg0XsHgVzVTFPDFbY
	 vq7gXPPqv/DrL3RypMeuF4Jbpk07EiUsTWUY/jLEtsG0V/SF0VzD5xIBTli8KB5Snr
	 gmOZsfMW5uJc8At/tTKooECkQPjiLaDTGTKgq+cc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:17 +0200
Subject: [PATCH v3 03/15] media: i2c: ds90ub960: Fix use of non-existing
 registers on UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-3-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xIzfZpPEYKwaGmQ1wVvwBLTIhY24t7t/JYtth8aWl+Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeCrwuDRfLsIsRWvmZPRxkvWteYpRXpcbJlV
 EvY1mJgxJOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3ggAKCRD6PaqMvJYe
 9Q4xD/9PXWkKEgSwQx0exAQ6eBW3jsCrJ3LYUGDoiqtm9qmnNPu/5vjRNPN/8+h3KL8ORZB+T/3
 5Uv389m77V0IIzC58AJ1V3hTJ/F3KW9fUtGq1G7/XTj43OTYagi3FFdtpHQnyMkW19At8z45UQ3
 4eIN7kMCLn8iVH/Xbb3+ZIfUZhenXDTqoi7kJ3yuD2Wz3oqoZthKNbT7fS9FcGJewU4TPwGObjm
 O3AvZH9kWiYairDTwuE9nv5XEWASXCyr+EGAQ2HzaW8fQq9hQDTBMkdViptg7Poz4Yc28EYTUN5
 Uz8p75+va1onkguk5N58QuGzeEsNEnJmNqrjsPIaVch0EsDa8ABiKxNybXJL7YZOj5P/7Re9qQX
 DYNuZcaI5eUeziYPy5ShKikY+ZfF0nYBBTiLS0ioB2LywIQhfBCTkYzYcDRnhUj02HsheiaDLxs
 cJLKEzIhRNoExnIIcQgRze0nF9w7EkLepPyHepU6B4tiLQFdEkoQ46nSi+njP73vYMOTVQaypYH
 DoSDALbYQYURoWBVaFS4OlshtFkw96SfOtysyGKL5DtjRfWckoNlgrayKsJs6sjstJq9aZlSRcR
 h8oKG1oqAj74AF6aW5lWY7YAGdEjZDzXuvtOUXGPlk7q8pX2O9VKKRCG3JwvUAZEAOheXDTmDrS
 hqc7802yzofvRFw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 doesn't have the registers for SP and EQ. Adjust the code in
ub960_rxport_wait_locks() to not use those registers for UB9702. As
these values are only used for a debug print here, there's no functional
change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org
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


