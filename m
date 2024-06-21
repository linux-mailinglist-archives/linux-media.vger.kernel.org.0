Return-Path: <linux-media+bounces-13908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BC9120EF
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0CB31F22995
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E4A16F29A;
	Fri, 21 Jun 2024 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OURpnU+B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02E516E895;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962857; cv=none; b=B5wCR5q299LVUI8f9eJ/WQKC6LDilZSqDWwMaYlnZcSP03SJ9VtdoSEEfVLYy7tqW8xPEIxEhjg6pYsdeAQ9MLNdARW70kT8DbahT0L4gyicZ/lI1ut4/iLBeiRQ2DosbuMHnRAzL8Vr5OQodRWchPL82i/dl/bsE6+HNjmesls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962857; c=relaxed/simple;
	bh=YyXgKYCSdn88IYgR4AI5OiSwc+6s3NkSV0A50DFCN3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjdsE0As/tp5QVpkDi6le8w4SaltmCmrqHltehxgRE2uiBYSWNVLldQj0DmudCbGqVCOYsm6TcNk5BGgK9qsKE8fQPj+rl4c1wwvzX1BjDX+qqTthjHYca3JLPdcIYi0QZo00FIHqOdsYIGEOnbiMqE6CYUOq5juxZ3MqmSWDo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OURpnU+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C928C32781;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962857;
	bh=YyXgKYCSdn88IYgR4AI5OiSwc+6s3NkSV0A50DFCN3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OURpnU+BY7jGENRYk9G9VAtNa3DCBojmpdnHndLL8VTFFDcDnayAxGjWsJXjQdBUG
	 kEGhosAn1YDVrYpOdIFaWyUoCmTghwz0nXdy6Pu+tdvF1xRLhfnwDHyLNAojGa6rGj
	 +CUWRPohLW9ObpzsBxuuQFVvaOpZ3KfJBAZwhnFuZW36wM1fek9msvN5EUReTS4q8B
	 di7GBlVmvAKkWxYoXgCjjx8O54SHOHVXzSdkNWUIj2cAyArEVPLPOh1tGyOSroeD+n
	 ZpYuQXhi8erluWaSG29AABQGzgQeyicp4no8aUk+Bfwqv6td1IDjmj3OPw3Ll69JJq
	 ongJC3+s0bGgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47724C2BD09;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Fri, 21 Jun 2024 17:40:54 +0800
Subject: [PATCH 2/6] media: qcom: camss: Add CAMSS_SC7180 enum
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-b4-sc7180-camss-v1-2-14937929f30e@gmail.com>
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
In-Reply-To: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718962855; l=576;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=4HwDgWtpMPEf780qBHcmuZUqzxXmWxCc6Ssp+LbI1Eo=;
 b=2Az5/ygCx4Ah/VzvEkKKKynF9jSOszic0691gERNKF8pSdCSYet1UgQ3PnkPqCniahi0mSfQv
 tTiW1FnMmlTA9A+BZGxZxNaHEDo/slKq5k4YNzcqOdUUCjz7a+UeOdH
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Adds a CAMSS SoC identifier for the SC7180.

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ac15fe23a702..5e750c481b74 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -76,6 +76,7 @@ enum camss_version {
 	CAMSS_8x96,
 	CAMSS_660,
 	CAMSS_845,
+	CAMSS_7180,
 	CAMSS_8250,
 	CAMSS_8280XP,
 };

-- 
2.34.1



