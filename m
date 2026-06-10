Return-Path: <linux-media+bounces-64415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5w8NM5ZIKWpOTgMAu9opvQ
	(envelope-from <linux-media+bounces-64415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:20:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB4668ADB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:20:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cs7mq+Rp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64415-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64415-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C962730CEA55
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46A6405C3A;
	Wed, 10 Jun 2026 11:11:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25057404BCA
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:11:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089884; cv=none; b=h0ekoEpdkbH0+vlYiHmNAnEpt9ReKspL2maBZrMgdOnjywWH79SSfyC4rPs44DKPBQJ1tEphPMKh5URPnirKWId5Do7HO83iK8tZgdUEE3P9Qu2ppS7bjURxK7gn+nbSqvvpF2wqfdXSwte5Q524ZePaViaHyS+l6WjzNhajWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089884; c=relaxed/simple;
	bh=TOj5OjxrruVphHTMiT2EGjrkwWWLSP4XZSWSQUFM7DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCsee4L9dXgD0GKh8VbDWBOX0PFZ2CTZ20tg/soV1CGt6FsxuX3McW4AQekCsj93I1wjCsixHfkELjkMwHAq9wdUz1m+UVsbFhMMvbkSah9CZNA/snIF2R+QEgUxcjWdEyPECeo6qgCYIYCwobn7Dps7/NB5OM/8m+3cIO4IDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs7mq+Rp; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso47685855ad.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089878; x=1781694678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06m6eTJZDZPQJ7w1wtJsPkoURM31DLSHf6Zo31tPFoY=;
        b=cs7mq+RpG6dR6AXshfcBjj/ymvMRu6LxZjL+FKjjm4p9svuWUzwcHwP/ALx5BdfQok
         j+IKXV7L1qKkXEeR3e7XUnCRBNgDF1OsFRaJH9v1s+NTpangFRqraJ7xIWryM4/ldL+X
         M91b0ngs9QS1qx54kbTYO8zLCGsaC8FbKChbJ5g5fdOfci6I/3+kdoXZZRm8Y42Tcviy
         l5BAp5u/1hiS8KjtfdAjR1g0Gvsle/KvcUg+wDT2iEeXcpzEtp5DVkGknxiu15YezFBA
         mcKSqzNbAa3f0ajR9NZW3/vgqEJJiofkJ+lIHtRs50WYKTCzRNPaYe4dloOD5ZxFpjml
         ZwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089878; x=1781694678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=06m6eTJZDZPQJ7w1wtJsPkoURM31DLSHf6Zo31tPFoY=;
        b=ffSRqzy9xIZdbMy0VgDxJzZqcdEM1Ey0hygW+dajG3U6jDma9z1xAi9HlTVNxVx0mp
         kFJuRfKVCvcMYD23iJBGoJ8AIRafRvufHsUlaoUHw3A3bDPn5bSvOHj5n8T2kSxQQYli
         /uWnXBO8KeikhrdcCxaNZDVelzY7Qf3yNTpj4fdFKS7GtKIZwapBadfxH5wJ7ig/KGlo
         oovDWVcLtjbGEwMo49AobX5Y8UxWq5TAk4jUcTLO+/LlsM12pmgVXb8lv54bPo9ZTaiv
         KFMjzk15XTQxO7Akn98+2fkS+UR9nTbIbhVN7AsiggsuiKL7XziHWXpTZPVfmVRR84ML
         YTGg==
X-Forwarded-Encrypted: i=1; AFNElJ99ncLwGEVnywuraFuaz8BvMyjKzPhZIktHv7k3yR1cQJAejOy3rygzwbYcr2VzREjU9ae2iBnFWg4zog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTynqys6AZ4pf91ZxgKzpp0Xec2Jkdc6nl5LrqQY1+Ofc9FVs/
	7x2yIadU3il86CFKBiMY7m31wcJbagev7H5rV1P8kdja+snAlBuRSzUs
X-Gm-Gg: Acq92OHYfyLKVK2om0KOrU9qMijyPSZHvc1oSgrZnAhzb7e6N8Q56wwODf7KSDYORnE
	Iobfh53ov5Rh1buDNAobtCyeFYjyBSWfXqccCwbVlcIYNSi5CPH10xjSoomDpZtE9uUk9T+Ju/W
	j4I+W+XzjAOw6d/C5TutEQs7ojcEim6ioyCT22Wt/mJPfdSdGX77ue5OnEmKX6yPQbcbVm/MuRd
	B1IKZqy0JUtiZRh7en9ZUBZjKtitZwDJ7TEe14fjhXmTxVGKHwjGSDChyT6CdFWZQC5JxB7R+tP
	PJjH0AcJq+ahcs6QBDgU15smHFqogI88wDTpLupJCb9pxSUutKAaF9yxZQzJXmSJdE6Qzjlsoku
	wCkIf9sr34OnldtANabidBiIKI9HuSR3BMEO4Zo41Es53KHPmzwHUaQbVJZqETfjDOQL4E81xrm
	nT202BxwHNKMOf797FkLgeqRsP7gKHrozbB9cLuw==
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr280552555ad.37.1781089878316;
        Wed, 10 Jun 2026 04:11:18 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:17 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:31 +0530
Subject: [PATCH 6/9] arm64: dts/media: qcom: keep PLL8 out of Purwa camss
 hot path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=TOj5OjxrruVphHTMiT2EGjrkwWWLSP4XZSWSQUFM7DA=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYPxDDLtCkxvbn6f4FJreQtb2Zfs33lMRdPL
 +pACyui44iJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDwAKCRAVlYpeERwF
 3ieLEACVICuCKoukuly4K7kScUxZ74qX8QAG4zbHFuiq7U94MhTncgezdfSWNrVxWQbmUtrbacm
 BXIBD2PS9ko97X5H0Ch32aHBTRmEX1oNGd+iIdOfsZwfapINTymnBGrDfZ4mWsGObV965OJi2tg
 TCmpD5TOFYOVQiHtlDRWrLLFCr6O0wUp4+4ebsCySQDTrs3eU7xqtZb8BheDCmmym0PCKreaF6D
 2r9G7zium9UGoIOcrcjIS5jbXRnYDWxG6aeFqotOZqIZw7YlHUCUQer+W1fMhKlILUFG7GVNWmj
 4ur/XNEc/31fSMZYppkLuQFJICy8BPKLPrNit/owy0WFTzJigxs/6J/L7L9h35fxWN/hQY890AS
 /nqA9WWoPtkO35gKQ/61813IxQL8GIBpp1EDpyBxt6Y9qB5sK/h7NH1PT0ic03qE7Db81FQbf12
 fox/NEdl634WSrlmowVIU1eEB+i4kFe3EGMY3F1M+WJrk5g70a34yodxVSIMlIrx8+uAEcgnxfJ
 PWhoWlwsvh9s6hFbGW3H5XrvDdTOjfVW4uozhpNYrmZ/zxSasqatK63fRDx1DTBhbhVLRxjapt4
 FPRGEMmLSNNTs/TIDF7yIM3CG7G87L3BosX5mKKbNHCQquuNoIQ1tc67UdGhRHBZ9Sjzve0uEXv
 xXKd0AWF4HyFvwQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64415-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EAB4668ADB

cam_cc_pll8 (defined in camcc-x1e80100.c) doesn't latch on Purwa
silicon. "Lucid PLL latch failed. Output may be unstable!" fires from
wait_for_pll() whenever something asks for a PLL8-sourced rate, and
the camera pipeline ends up dead with "Failed to start media
pipeline: -32" even after the qcom,x1p42100-camss compatible is in
place.

PLL8 sneaks into the streaming path via two RCG freq tables: the
slow_ahb RCG defaults to its 64 MHz entry (PLL8-sourced) when CSID
pulls it during csid_set_power, and vfe_lite picks its highest entry
(480 MHz, also PLL8) at streamon.

Fix this from the DT side:

  * pin slow_ahb at 80 MHz via assigned-clock-rates in purwa.dtsi so
    the RCG is reprogrammed to PLL0_OUT_EVEN at clk-init time and
    never reaches PLL8;
  * drop the 480 MHz entry from the Purwa vfe_lite clock_rate array
    so the driver caps at 400 MHz (PLL0_OUT_ODD).

I went poking at the Qualcomm Windows BSP shipped for the UX3407QA to
see what rates the vendor side actually uses. The AeoB resource blob
at qccamplatform_ext8380/CAMP_{PERF,RES}_MTP.bin lists the camera
clocks Windows enables, and PLL8 isn't referenced once. For CCI in
particular Windows runs at 37.5 MHz off PLL0_OUT_EVEN, not the
30 MHz/PLL8 alternative the Linux driver happens to pick first.
Whether PLL8 is fused off, trust-zone-only, or just unwired on this
SoC I don't know, but treating it as unavailable matches what the
vendor does.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi       | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index cee72349da49..5e39355c38d4 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -409,3 +409,15 @@ &tsens3 {
 &videocc {
 	compatible = "qcom,x1p42100-videocc";
 };
+
+/*
+ * PLL8 in the camcc-x1e80100 driver fails to lock on Purwa silicon
+ * ("Lucid PLL latch failed"). Several RCGs default to PLL8 as parent
+ * (slow_ahb at 64 MHz, cci_0 at 30 MHz). Pin slow_ahb to the next-best
+ * PLL0-sourced rate (80 MHz) at clock-init time so enabling it does not
+ * try to bring PLL8 up. cci_0 already defaults to 19.2 MHz via TCXO.
+ */
+&camcc {
+	assigned-clocks = <&camcc CAM_CC_SLOW_AHB_CLK_SRC>;
+	assigned-clock-rates = <80000000>;
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5c9530d52bbd..ca43ff309b26 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4437,8 +4437,8 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
@@ -4460,8 +4460,8 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {
@@ -4574,8 +4574,8 @@ static const struct camss_subdev_resources vfe_res_x1p42100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
@@ -4597,8 +4597,8 @@ static const struct camss_subdev_resources vfe_res_x1p42100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {

-- 
2.53.0


