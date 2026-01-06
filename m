Return-Path: <linux-media+bounces-50041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC82CF907B
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE5B33091F49
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2C93375CB;
	Tue,  6 Jan 2026 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZayMMaS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90C3346B0;
	Tue,  6 Jan 2026 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712448; cv=none; b=sYcQjTfkelbZb9X0ZEUA/S4L86MbtZe8e4F+RmDA92CzhTgAfHIyCoSC9HCLUkgpyPg+Dd778EBnMOB9FQOC9xurMKKk3gMebsEZnxgipoq3vN4mropITc+2/vSQDlFdEh9ObIbbqzhAjAieUKhPWr2Tl9xcny32qviLW8TWp/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712448; c=relaxed/simple;
	bh=2ApmWlo7y6D9h+PivaXb27nqv9LyVlHA6yH8DQnxb84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ENuTvUYPHbgYDJflFcbqLgey70/7dZIq6IQ2rJKJZ+hRE2Lj8BpnkHyVBQ45z3fcpcyBh4Cclkk9YCcy3ZgRcLL9zo6hU2XKduHYH4tGXI+k4Me5zRL8OOjNCs9wAz+MiXxlqqYe9sYnGZyZ49rIxzZfyYzqJpq6GBdaMcDpx4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZayMMaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BABEC16AAE;
	Tue,  6 Jan 2026 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767712447;
	bh=2ApmWlo7y6D9h+PivaXb27nqv9LyVlHA6yH8DQnxb84=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FZayMMaS/i/Qb9Mqt5mok2Rdn6s3mef1ndgGl5D/NUtUAXTEoUZtB3ffeOErfFhUW
	 tCK1OSahrZ0/B7e3+DQXv3VkeAv7BBkTsCQXScRoTmMEs7KU4jqVwkGuFOap0XHKxu
	 z0BbRITuvjsHiENE4dtaM2xwdUWjEw/WfYW7GU7J2tTkynxVwi7mrkYB6mlD5JEDaQ
	 QPbkK+Tb5lN/ObSgaR9kQ4gehf9DbLZJ6y2wGHHu29h5mTkfPPupXMJg7GcHZ6M3ml
	 2ano2pE+tralojG47vLRlUiS8zTYumDWE9cqRSMMVp9kDUOEFuMeJrDjcJQUrI7Ckm
	 uVZxKKW+OiDRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B4ACE9D4A;
	Tue,  6 Jan 2026 15:14:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 06 Jan 2026 16:14:05 +0100
Subject: [PATCH] media: ccs: Accommodate C-PHY into the calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-ccs-account-for-cphy-v1-1-c3639d606271@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAL0mXWkC/x3MPQ6AIAxA4auYzjZBBvy5inHAWrQLGFCjMdxd4
 vgN772QOAonGKoXIl+SJPiCpq6ANutXRlmKQSttVKMMEiW0ROH0B7oQkfbtQev6tutmo3TvoKR
 7ZCf3vx2nnD+WKD+HZgAAAA==
X-Change-ID: 20260106-ccs-account-for-cphy-af9788b6029f
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dwwD/3ToQdy2999UX5LH+C6Kbfqw7B2Pld4wPUvRozw=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGldJr6hRSnxRX3ddHeuWIjaZJfpEk1Fl0K7+qldAS/LzpOOn
 IkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJpXSa+AAoJEGACP8TTSSBy24QQAJ3P
 oYDcg7bkEuwDJ2VLTHZQSv/OBL+4D2EvFmFv2UBZUlW/HfRyL6rdSz4txsqGN7ofmf+tk/mS15w
 G9jHsTTTT0fhmDm8zzELQXot34oFCN1ISkjqAXX6k7bPRi9bsHYKI0yfWWsJgoqBVZ/G85rfuE0
 Ipdt39Vi3K+GnBma4R5RJxKIiIjooxBmY1xH6zouGZfb/mr5/SnL0MBL/DACIH3hPVCy0ZpBvAA
 TGzCZWysAwcsDDOw/Mfs1ec+9gcvg6q+BpFAiq1I6S+qthavLtIxiF9QFxyWwB4SWu9duPsnzFT
 3Gp31oc+xDQbjE4kTzdHAkeje8TkeEsVZGUeHytdGUlyk/eyncHnY32w3KVMZTzeXfO6UWfh0Ca
 OmrqLNY3F/7Phv5zMjKDEARCFChP/IK1zbD6HU/7aAjlVvbDuylC0/o67eNrnYbs0Jc2G5lIcvy
 9kfM5/4c7Zh92JeB1XmYZY7UvDAL0eopgacKBuN/7+1hH7U42LQDuFV6AYhu4ZBZqdEA6lHV3lj
 okrfALhrFhVpw6cQHCLhJ4jYgMLeCJVLBBei8tPp8VkoOzMBYVQIuUOjAj3ta4/orB2oQL4yAda
 ygm7h/GJmU2dhzxK0qfdNqjZkpcCFtMS9LCde3mSymlwc+XUWXMd98VW7TIKSlRlQDYVW+VAbnS
 R1Nj1
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
 drivers/media/i2c/ccs/ccs-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f8523140784c7..2d689e47ed094 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3425,7 +3425,14 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 
 	/* prepare PLL configuration input values */
-	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	switch (sensor->hwcfg.csi_signalling_mode) {
+	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
+		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_CPHY;
+		break;
+	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
+		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+		break;
+	}
 	sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
 	if (CCS_LIM(sensor, CLOCK_CALCULATION) &
 	    CCS_CLOCK_CALCULATION_LANE_SPEED) {

---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20260106-ccs-account-for-cphy-af9788b6029f

Best regards,
-- 
David Heidelberg <david@ixit.cz>



