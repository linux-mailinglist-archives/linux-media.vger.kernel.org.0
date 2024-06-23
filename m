Return-Path: <linux-media+bounces-14001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BBD913F31
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3B61F21160
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E6E18A934;
	Sun, 23 Jun 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtEAYUtH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B81185E79;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=unUXm4jscJ/jRQT9l8azxwyAir+rr0A4mBd5CFSdbfKT71A7XQRqIJ3eEkbADZWxFU6waZFAkIAmNPvJNe3X5m3pHjbv2tUS9/Ywb1bB44fgSQ6up1hqjx9PCQmDnoyicBdeAkFEdF4qjiD64MzX5EQYjEoTUHpHK7/B7xTlodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=uxZoWyiS5m1gdIZqkbwAMcPfbU2bzkn3jcszmCTrfeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnaQLU4XIMqK/p6uqo1yvalK2aLzlByK8DsuWqPBSU0Z0NLe4SmWDzuKFJoKqkit39t/WV9ifLPsHC/JShwL+XvtQaBvrlpzXsmaybvXlcHilBfyFKpv1Ai38KmejsaDG3kAh3IKTJwgRaxyWdwr4rVrpIKcvxwe3Ijp3NIaFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtEAYUtH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A1CEC4AF17;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=uxZoWyiS5m1gdIZqkbwAMcPfbU2bzkn3jcszmCTrfeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UtEAYUtHZQrrtBIoO7EoxAkE6dlxm34h73jrexUzWWgsrWQxC6ef6MtIIhFi1xBLv
	 UVWoyWU9NOBIJa4TAChVXGaS73KASlifsFAuqB1g4IPe+b2L+pPDwFTqADw/19iPic
	 4j47KbYorwj6C61UoJF/4lfaztmKfz9YYS5sC2x82RvZtw5p8AjY8QcF1GLfaO597B
	 JJIZslXjuXXmvtee8HOLCvQAvAGVf2fPd/ouWFeC1o7AhYUjRCbzE2xE2wEpFmbfeT
	 bIZctqvRL5oLzvF4WCrFOblBXOevDmK9q5fcXOBxxrJL43TZphkQossgcmyJfV7OlP
	 oZPtuPSYwy8fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FA3C30658;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:44 +0800
Subject: [PATCH v2 5/8] Add debug log info to camss_enable_clocks function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-5-0dfecdc50073@gmail.com>
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184974; l=811;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=6aIAhDdR6ba+wStFSXsVTf8OUMR91nQ2Q2sdegpU84I=;
 b=nVTVcI2zBFK7DgJRrC8BySXVYzj3UDol6nS+rZRiLKHFSruoRZAaoPj/RVDpwaaZjiSJ8UH13
 R+aGtDssKe2CEuw3x9gprS7qtANiic5xi8BKZXDNpjHPc9BCfBim+/G
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Print out missing clock's name when doing camss_enable_clocks().

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 86ba80c47188..d50f98565531 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1467,7 +1467,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 	for (i = 0; i < nclocks; i++) {
 		ret = clk_prepare_enable(clock[i].clk);
 		if (ret) {
-			dev_err(dev, "clock enable failed: %d\n", ret);
+			dev_err(dev, "clock enable failed: %s %d\n", clock[i].name, ret);
 			goto error;
 		}
 	}

-- 
2.34.1



