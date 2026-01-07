Return-Path: <linux-media+bounces-50179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA3D005CB
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 00:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E5CF304357A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 23:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304542F6904;
	Wed,  7 Jan 2026 23:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5v/20YH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC526E6F9;
	Wed,  7 Jan 2026 23:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767827073; cv=none; b=mDHVvahVVqwtEtsWR4klLm6XkuOUClTYcANNrPks+x2NBpm6xrbulwCntzTMPpQviLU4obozCqGKN2+PSx6zSK8opwwLM3uml6jNRJ6aACFZS8xRSXKcz3E0ewvcx630F2mXaptWBSXGZ792uepTdt8QB3LHjfnTpV8zLDNmZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767827073; c=relaxed/simple;
	bh=I6xheA3HBW8FXoLvBoYTxBynZhv7VLPB7kjGOA3MebY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o9RKlbhhTQqIO//Fbxu0cO+cfUMR/2C6F01dptv3hYJsC2xUfbE7oHjtsPbkWyPcShl2c1RNXlh3tJ0YjA5Dbizb4193dNSEPak7xJZWSGsqQy3vUhQPpNyjy+qxUUirIoUQvGKfAx3Qgo5DsNYtp39IK60gFdvFIl4SivVXKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5v/20YH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CDB9C4CEF1;
	Wed,  7 Jan 2026 23:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767827073;
	bh=I6xheA3HBW8FXoLvBoYTxBynZhv7VLPB7kjGOA3MebY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=C5v/20YHHn5q64q0b5qZKg8ZFjGtHNCw6IHPuCEFXyx9HzZSosW7kzaJG7U5Lncvk
	 HvCQ904YMDEJWXD9MAkjJrUuCBWmtwWyOSM/clHXm/sDwePtCpzDqWZA3X3k23pCVp
	 iTeqRwr6bFlXTwQRAUtcNK4jkCWlL+YRACQVq2MWYCCXpDhwuDR1C2WT3JmkBXuKTO
	 C5Sn4LiKNtjeDeFpKF1Ggrf1kUoO0fzq7KcR/RPnGG6TKJHukJllrJUe+49Vz/oIHe
	 I4nXYyP0NLkan10tXQRHPXLgir4IJqwG5LmcxGhzz6oZOCkx3iQJN3XvBQ+7M/Vcgl
	 SP60x/Njs+oTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03512D0D17C;
	Wed,  7 Jan 2026 23:04:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 08 Jan 2026 00:04:30 +0100
Subject: [PATCH v2] media: ccs: Accommodate C-PHY into the calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-ccs-account-for-cphy-v2-1-f2749ecf0733@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAH3mXmkC/4WNQQ6DIBBFr2Jm3WkAE9Sueo/GBR2hzAYMWKM13
 L3UC3T5XvLfPyDbxDbDrTkg2ZUzx1BBXRogb8LLIk+VQQmlhRQaiTIaovgOC7qYkGa/o3FD1/d
 PLdTgoE7nZB1vZ/YxVvacl5j282WVP/snuEqUSK1uh0kLrTp5542XK31gLKV8ASbcgca2AAAA
X-Change-ID: 20260106-ccs-account-for-cphy-af9788b6029f
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=pgifrmWzS93M40AkrvwrqvuNB9Em0PvPuVu5KPWYkkc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpXuZ/tSg/is/AuU7XMxXP5LVAvPoMiwqcI8u+i
 2WpM/Chrf6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaV7mfwAKCRBgAj/E00kg
 cqqkD/9JDlbDiNHaEuQ67d9ZmBvoLyan7X+vdNst4KlVIcrCifjoYS+xTj57D92gdHEjhZctiqP
 WmahRYRK+Kf9Sd/6awLhiYNbp7oCKrrWQgLQVy8cPtBXZmBkz2gIjJLyzvpeoJNCme47Av5ti1+
 Jj5v3X9lvfr6oS8zLZidxo1OCmxOhoU4N37DGJKFl00ZIFr9uVDzoa1EAwHViyVmrcS5o8Gf6C+
 pjq/CoZKhTYGZB9PEmA0t2zk0j/y0EKWX5Q/hZjLZyf0/FWtIZfH692MjX5ft8SgsJe4xMQd1Mx
 uhRK6s8i3dhwb0cIefIp+u07JEKQ2AuaeDmQEtZ6WJqQdNEgIX02mEGilXFt5deDH4lV2V8+3kU
 5K1xd1R/uCF0oSgu0tqUX+GYWUBmUq1NR7gfPIBqsQM1t8bw3qQhSbo9wC+UzS4yHIExnFg93Dm
 OlbGridgx5d+rUZzQ2FYKs4YwKzw0Qm7zosGQ9VfGj7d0DgoLp3hCJC3w8NUe5N+7mhJzmCftTb
 sn6fWGzFcAf8DblgFFIzKdpfkOqqVtvCTUGmNXqWkwP3Ae1S8AOi3K4QzqVtsQPx8BUjUluXBYU
 CaFNArFcp11ZEzKuxxTCUmkRF0PhaW6FqLWkgPtykLgmfHyxgXa9H3IRGS9eJyn/65GAtlaOUIb
 Wo5vjLxrPkFTykw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

We need to set correct mode for PLL to calculate correct frequency.
Signalling mode is known at this point, so use it for that.

Fixes: 47b6eaf36eba ("media: ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Account for CCP2 which PLL calculation handled same way as D-PHY.
- Add default statement for error handling. (Mehdi)
- Link to v1: https://lore.kernel.org/r/20260106-ccs-account-for-cphy-v1-1-c3639d606271@ixit.cz
---
 drivers/media/i2c/ccs/ccs-core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f8523140784c7..c1fff4029b5bd 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3425,7 +3425,22 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
-	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	switch (sensor->hwcfg.csi_signalling_mode) {
+	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
+		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_CPHY;
+		break;
+	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
+	case SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_CLOCK;
+	case SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE:
+		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+		break;
+	default:
+		dev_err(&client->dev, "unsupported signalling mode %u\n",
+			sensor->hwcfg.csi_signalling_mode);
+		rval = -EINVAL;
+		goto out_cleanup;
+
+	}
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
 	if (CCS_LIM(sensor, CLOCK_CALCULATION) &
 	    CCS_CLOCK_CALCULATION_LANE_SPEED) {

---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20260106-ccs-account-for-cphy-af9788b6029f

Best regards,
-- 
David Heidelberg <david@ixit.cz>



