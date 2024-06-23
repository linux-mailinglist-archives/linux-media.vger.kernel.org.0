Return-Path: <linux-media+bounces-14002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D0913F30
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A626281868
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2803618A936;
	Sun, 23 Jun 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqzOi34Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18618628E;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=m0FKgYpnACCQGUGJQIQfkmzmHlGSJXNDgjkFckkZNYT8oNG3w+KRYgZ6hX+OtJ+RiVQ7eYdIrs5wVZnUk/Lqn+h8VmnSu5ERmI7iba9mmEXaQ8ZesTJF0EFugOq3F96BZYG/4glym/6fb1Wn0H245Ib8ztipTrn2r+tBYF9gzxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=74S0E60M85VDOHydsBO6YWmb+q/SFEbCocOPAUBA84w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hz0Ev60uDWaq6OU6f08DgsVabhphgaEwz5SwOvRjIVCv7ydUvyP7Sadxl0cdOh/7X34rTZtkpskyIeGWE5oOkrWe8PsJ3iS3nnq7Gf2tStaNCcQlwUqvuwBkU/KKGw1i60Y5AfvEXD0XYeFQT5tRQdoPzh/yl/FzzmNapJq9ddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqzOi34Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB4CC4AF68;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=74S0E60M85VDOHydsBO6YWmb+q/SFEbCocOPAUBA84w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aqzOi34QC9MkRw2YUGm2aOgbELRpRnR7yf+9kuWcdblnuIIQrWyIpOUaDPpd6rkmI
	 pTO5ivl9/tr63Ksn/bNgRPIS0W47OsSE1eNZ1uUYGt9GMQ6221Ph4cnQ1rCUYUF8ES
	 gF4Myq8n9y8bBKcx90+9PDcUyiVcbQukKolnswyNX5J5PlVNmoD6oYB8MCrMEh8Vd8
	 QUUiNB+GsDZ/L61ZAP55FHnd23RICqQXY+Hf7vNLAOSkGfqkn3t0LbFxWqP5bNjdiu
	 klAQgk/rwVC0VNFNIsKNFEV2TE0Y0BpGMrz5qOHh4XuD/Obei9Y/FgHF4a4hJwyoPM
	 VxKQJ7r44jmLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701D3C2BD05;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:46 +0800
Subject: [PATCH v2 7/8] Add debug log info to vfe block init and set clock
 rate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-7-0dfecdc50073@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184974; l=1258;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=8g7c7y+bobDHCG87OSB8UdNx46oyvLYRoK1ecGyKT60=;
 b=TQ85B/lPVHtG5nfsfD/pB0LTzbsLt1MHncCyWrQ3FK94pgtLdjUZPMXrjQjqsl/oP1xoIEzpr
 cdAKlEFnX8XDxvX/NCQ0S70zYUWLQwaLrj0ruJRcZlNelKi6x0NHgFd
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Print out missing clock's name when doing msm_vfe_subdev_init().
Also print out min clock rate required at vfe_set_clock_rates().

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 05fa1adc1661..fbbf38755c0e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -579,7 +579,8 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 
 			if (j == clock->nfreqs) {
 				dev_err(dev,
-					"Pixel clock is too high for VFE");
+					"Pixel clock(%s) is too high for VFE, at least set to %lld",
+					 clock->name, min_rate);
 				return -EINVAL;
 			}
 
@@ -1452,8 +1453,10 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		struct camss_clock *clock = &vfe->clock[i];
 
 		clock->clk = devm_clk_get(dev, res->clock[i]);
-		if (IS_ERR(clock->clk))
+		if (IS_ERR(clock->clk)) {
+			dev_err(dev, "missing clk %s", res->clock[i]);
 			return PTR_ERR(clock->clk);
+		}
 
 		clock->name = res->clock[i];
 

-- 
2.34.1



