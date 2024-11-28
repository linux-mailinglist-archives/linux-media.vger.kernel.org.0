Return-Path: <linux-media+bounces-22248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8501E9DBCA6
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E850B219CF
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 19:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DADC1C2432;
	Thu, 28 Nov 2024 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="U7nV+5JW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB724AD4B;
	Thu, 28 Nov 2024 19:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732822792; cv=none; b=t/C/vDUI5MJt5Brk/ds76ynRm7ZtmSW2zgDXWUlLEC/K8DOTMFq8dwZ3fLqCJYKx1g6+WcKj7lxMoCvR04rEicvMJ/Gx2hGw8q9FeNKVKhUx5n5CbAE6H7lpiLP/K82Hv0kRHQe+8RSw4Q5sz3LkMmnIJS7go3wjESc6+KeRA8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732822792; c=relaxed/simple;
	bh=fo0QL5lRbW8+EcGku5BR4zfg9S5ssZnecDlbvwSvW9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cqz2lrwr3cKGnBbquACxyOCQdqm3Wpiwhxw/EZK1kpOS/KJp4pYRa2SMe5IvlXQQUDOjWuZVeB4w4DSMhJIqnDVQrXl/uF4oRZbxJ0StC0b7E+l8NgyhKktfN//iUWyYddqAl9aMEsJRjC6u3kldSnopLtnqjaOTtC2Vy9AQFn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=U7nV+5JW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.115.162] (254C15C0.nat.pool.telekom.hu [37.76.21.192])
	by mail.mainlining.org (Postfix) with ESMTPSA id ECBE2E4804;
	Thu, 28 Nov 2024 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732822788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=udSxRHucipPKVvHUnssy5yglHd6VLYZkCL7xgS1KLhA=;
	b=U7nV+5JWWvbd/7fEMHNfZ7Yl7OlxrL94tsD+ip3LhI33Fzn+YLO5h/0bF2Pn9NtP9yr44V
	GNHLGMXt2FSDvq6hn0theeNwdy/TD1J+dDm5jK4BoJpwkHu9XVjsOnUnCWxfAxDMB7HAb3
	N2M9mitvnatbMKFiG7NCh8uPwoz6KaNhPBQ7RIUoACZ7qk4DAgUaD1TF4s9FJs/JIwbtei
	JHYvnL1RIa+Gth8uxacMsJks+2LOYiO8y+IQnQznt54yvnLuZU/2qKxoVDco+/GIE6YGdM
	YykkbyR+1cNCXpEq4zTILt7c9rW2Hj7AOWva64XfpGxa3dUS+M0/zzKT7sZn+Q==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 28 Nov 2024 20:39:46 +0100
Subject: [PATCH v2] media: qcom: camss: fix VFE pm domain off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAHHSGcC/32NUQqDMBBEryL73RQ3NSr96j2KiJhNXKiJJCW0S
 O7e6AH6+WaYNztECkwR7tUOgRJH9q6AvFQwL5OzJFgXBlnLBlFKkQyN2zpqv07sRm+MmFVX1z2
 pBtsOym4LZPhzOp9D4YXj24fveZHwSP/ZEgoUPWrsjWpVe9OPo3qxY2evPlgYcs4/UCsWErcAA
 AA=
X-Change-ID: 20241122-vfe_pm_domain_off-c57008e54167
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732822787; l=1871;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fo0QL5lRbW8+EcGku5BR4zfg9S5ssZnecDlbvwSvW9A=;
 b=9B6aF+iDemJKll545evaMgTTwP3sjNn4x+3AS2xS20ZtfTvvRlv7FF9gAlQZVk0JURj/+cC50
 BdMb3UdqL+5DmYldVGZYuo7p4N9ueAcJWJAOMe1TpEnsSCeohNxbRZQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Fix NULL pointer check before device_link_del
is called.

Unable to handle kernel NULL pointer dereference at virtual address 000000000000032c
Call trace:
 device_link_put_kref+0xc/0xb8
 device_link_del+0x30/0x48
 vfe_pm_domain_off+0x24/0x38 [qcom_camss]
 vfe_put+0x9c/0xd0 [qcom_camss]
 vfe_set_power+0x48/0x58 [qcom_camss]
 pipeline_pm_power_one+0x154/0x158 [videodev]
 pipeline_pm_power+0x74/0xfc [videodev]
 v4l2_pipeline_pm_use+0x54/0x90 [videodev]
 v4l2_pipeline_pm_put+0x14/0x34 [videodev]
 video_release+0x2c/0x44 [qcom_camss]
 v4l2_release+0xe4/0xec [videodev]

Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable")
Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Add backtrace to the commit message.
- Link to v1: https://lore.kernel.org/r/20241122-vfe_pm_domain_off-v1-1-81d18f56563d@mainlining.org
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
  */
 void vfe_pm_domain_off(struct vfe_device *vfe)
 {
-	if (!vfe->genpd)
+	if (!vfe->genpd_link)
 		return;
 
 	device_link_del(vfe->genpd_link);

---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241122-vfe_pm_domain_off-c57008e54167

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


