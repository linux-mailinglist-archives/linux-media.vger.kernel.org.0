Return-Path: <linux-media+bounces-50324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B349ED0BC51
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 18:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C007B301274A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 17:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472D6364046;
	Fri,  9 Jan 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oknncg47"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D526ED3D;
	Fri,  9 Jan 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981427; cv=none; b=Sl8PVO3tiAtF6xVRavOBGiRSQovhPfdYAsPxl09h+K/Zp/zZ5Du7SwX8sWFv4gRkJvCGOAgRB9xpOvkLd//j8O6Y2xDRpQfQvb6JALgmPm1Zlmq/gKp5jMPVrM1l4Sf9ufPI/KOzFpS2xlHk3DJZpGdLPN5aS/kKjpT444+ODl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981427; c=relaxed/simple;
	bh=GTgHrJ2Zn6DwPfrRw6paeS4hhO+K+iNFok55Z6ID4cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AlZZaErTNIVf2fzTAHk720nQWyBNH7qENQV8hLLLzuBAVABKna7WpnzM0uDwuj1DJkFqZvUAXQJ7LbiP41sl8odhqUHFeLoOL46KTJQ1oGc48m5SaPQQsD5+gduuwwdGrdbr7dbvRmRW+/RbcHNtW6yoUJ8kw4h5PNHHlHPxZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oknncg47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7779AC19422;
	Fri,  9 Jan 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767981427;
	bh=GTgHrJ2Zn6DwPfrRw6paeS4hhO+K+iNFok55Z6ID4cA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Oknncg47YT5SX2ViwF3zDiyVaenzctpz+vK6YLT4/yiKNkgMKU1bM2MyVO1AoiCCT
	 6V96Xnp9GAy952thXCNf20PYQPv9Je1gDITxqsqt7svv4OiOVv5f6PX8/ftmfDCQNe
	 EMeQDXhw8f+W3YpsCDkBSDlgmZkABC/2KcgNy1SLoa4qil+OnuayApVumeWqVLKhh0
	 kyoMFKbl3UfaoScM5SxmUzdfTEgpZogOeVPtUq074DmQOs5+PD20q7dgEzH26vILKD
	 IYNbh4tSY59o27aIBVyGZ2Tpy0M96dMi/gp2kZkfwXD7jttb5M776VbjkfOWEcMT+K
	 wdL3e9Ved9nwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED78D26D7F;
	Fri,  9 Jan 2026 17:57:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 09 Jan 2026 18:57:07 +0100
Subject: [PATCH v3] media: ccs: Accommodate C-PHY into the calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-ccs-account-for-cphy-v3-1-e2f1d4fdefc9@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAHJBYWkC/4XNTQ6CMBCG4auQrh3TH9NSV97DuMChldlQ0mIDE
 u5uYaMb4/L9knlmYclFcomdq4VFlylR6EuoQ8Wwa/qHA2pLM8ml5oJrQEzQIIZnP4IPEXDoZmi
 8NXV911xaz8rpEJ2naWevt9IdpTHEef+Sxbb+AbMAAai0sq3mWhpxoYnGI77YxmX5TdQ/CFkIL
 83JOvTcKPUh1nV9A/uhukL5AAAA
X-Change-ID: 20260106-ccs-account-for-cphy-af9788b6029f
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=SSeDb6Dcr02AMjIrsAJrl7pAouBCagBE/oCQYvj01+o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpYUFyqJvdX4xzJNFisvNwbQpYy92hmqe0z9696
 F5Ir07ZKymJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWFBcgAKCRBgAj/E00kg
 clSiD/9jEsnZ6Nc66RZ8QqrV4C3jccjSlvnfwPgBhrgkhl+AJgK8wkI2opaw5m11D38BulJfyMV
 cQWXxuy6k5hoBqLrgCt6wmf9wH+qw8Kwmmm4UlJe5GAiDVN4zM7mFcsVt3ZoUWCjPD43m1zDkOb
 AsMyStCXkutNC3UTsnefzCmLj24Ugwm1olBBARRLddYXRNpRddLoaFp8P0C9AmdyprtwmWU5qh8
 GETaIOQqQodmOz12IWlHN7vA4cMGdWWMYrYRNDumz+4hs35fBzJ31nKbL0Bzk2IWwBeaCyiwkIK
 TqJFVY2FO0dYnkuqVG8oM976TClsdF5oN/jFhvqcZMrjvNir+c/NuxJm1XZ3Lh8mS0ipOIC++cA
 ZNJQnTM2WfU3kIiygGaBi587pafttNVxz4OBwDg1r7LU5TgyW6AgwqeaJU/8kBxm0UW/W6whek/
 rrZIAbzOjJyCeT5EGAmx1fcVzesCXJjW6Y8LN4+iP2Yke1ZF/hIWUaZDIqllIivclchk8t6yWws
 a1g1vdszIu/qQOZJK7nhfmPnqIFI4qSPZLU0UxMVhpdpcUENpzC5ntNrkGzkfFFHQXneKjrwDa/
 fNtB7e2kr9SPWhzOdHmmuFc7q6g/zaRzCmtu1sVmT+25z554wdi/JUcsjCo8PWl+NEDM/Ba+Hhh
 Niegd126KfPaFJw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

We need to set correct mode for PLL to calculate correct frequency.
Signalling mode is known at this point, so use it for that.

Fixes: 47b6eaf36eba ("media: ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY")
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Typo sneaked in (; instead of : in case statement), fix it.
- Link to v2: https://lore.kernel.org/r/20260108-ccs-account-for-cphy-v2-1-f2749ecf0733@ixit.cz

Changes in v2:
- Account for CCP2 which PLL calculation handled same way as D-PHY.
- Add default statement for error handling. (Mehdi)
- Link to v1: https://lore.kernel.org/r/20260106-ccs-account-for-cphy-v1-1-c3639d606271@ixit.cz
---
 drivers/media/i2c/ccs/ccs-core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 0d7b922fd4c48..ffa2707276284 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3427,7 +3427,22 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
-	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	switch (sensor->hwcfg.csi_signalling_mode) {
+	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
+		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_CPHY;
+		break;
+	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
+	case SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_CLOCK:
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
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260106-ccs-account-for-cphy-af9788b6029f

Best regards,
-- 
David Heidelberg <david@ixit.cz>



