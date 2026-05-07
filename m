Return-Path: <linux-media+bounces-60754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBX1GMVR/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:48:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D69514E5190
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63DD307EA1B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E7D372B24;
	Thu,  7 May 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNCYP8M6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9D3793C5
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142852; cv=none; b=JHOmlpu5ZFRTZen++aj64C+aTPfiJRtQ+cSbH8t9nYPrx0iuITCKY54HV/kIAiSwK2cN/xXtA/4bwUGPUOlRsdyi41oSJm6rbWF1E7wpd5uEnq0EgBIN1DmC54SV7DlFBC7OvZ536grLYFHpVKVfBVhmY42BJraYPdDruFfxTd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142852; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckSvhL9LFAKjL3gjZsq+V5evvJvfIcAp3tabsYqTpEB6NF1GpKXSDS+mbAFOld96x3omMi8hZuMA5d1z61Sq9Myk2+anbOns1M9D8OT9F6lOm3Ui/okstmEDWbxE9Q3rLRMGfYFTf1OoTQppO/UOwgTTLddLWFYu5fdWqjXlP10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNCYP8M6; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-794719afcd4so4896967b3.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142846; x=1778747646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=RNCYP8M6/LjoYO8nMJ/oN6KxMjjWkWoUT+gNVU5FOP8hydfQEwAh6D48WzDMP7fKXK
         W5Z7Ofsu3YNmFjxoBWnp4A9YI/O7quLHTI8WReNBm15Ndh5Z0JOad+ZAjUbLUUcbITpM
         bKaXkB4MDGwEOinEeD3gG5TzwZeOIts7AuT5TBaeROFuLirWjifcciaP7OgQtr00fNqf
         XGO9OUN1qOU6S2efK3TAiVEIh1UmAzOpgcdptuMnwhSOTk8vwkj7gxhHEUliAUCoPaET
         +/W3kcU+ZVogvHnHjw4/NDL3SbvAedVRBQkjY3ULG2hduufZhni0AVgjzR7W2gDFvFyV
         VW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142846; x=1778747646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=j5MsOhrUMTI3x4PW2GjP8wImh6/wNjZL2tO6lNrPod8qU5mh+TW8kcNuggGYRVvFjC
         htYRcPoLV04Q2inLunl9dnLZs4CcHESYeSEXCUxcvnswI0uWh426IVNstcQfNc8X9Olm
         uBMvVNwC3eQHg1L9ayAcIOmdcuvQKZ5PRhSnuwU4HUhuVHjXFwUddUkQ4QlvHSaUZrgi
         t0a5hJdPKDxDeojRQlHAbzmv51UTMsoByIAHBHqAYjoKG7s/l2lsZDYq2K0yZgT5HcI4
         HC9BQBDpf65UV2AOu4ak3/pNc4Y5zi3Vb889Htb+UqY6/oYmaxnsmZGKQ3fmJx+/kJY2
         2PoA==
X-Gm-Message-State: AOJu0YxGfPU66X1EbZCUIwcPh1z0AeZUI/JRoDqSF9QRvZqw6QBvB4FA
	Co1KZ9zM47kmlJmTWweCZ73oFVs3f+Xp65c/8nqjgHoA2buRchEKzCB6
X-Gm-Gg: AeBDietS+cjoCaMsoAhBFVmoVzlBRwXgr7zjeaPm0EtrrtUCpSQ9bFW/1WLEjaoF8nW
	4dTgL43E2N3sbF1/7WigkIqm/ncHdsbjfwhGaGw5kfDJAUWYi3IPkbCf8fkN8Mx8XNXgv6QVDOv
	5BFYU9KE+4718tfQym6jbIorZZJXnwHmtGPtbFmqSplhDNSoa878ze0JH6VBtGuLtC2Ue/EOt7R
	uSxPaN/EiNZaj8Aai/hsOcc1pLu4L5mPy8hxyJCI7vycJ6DSUEwSxK2yelCXhsiZPYFC19tK4ZJ
	JLPOulVRP0M15YzBwTyX0BeaJFLV3Qhk8uyVS8Y+VFoBtHV7S8gkKKNDtUSMEhxPtCa4T7rok4q
	/gb+ai3Qahe3dhpPkP9fcKGBtZOCnylxVvNw/y1m1+H2Zokve1gIgsh8uWr3SVWGNFE+xzpl03W
	3sd14y6J3zngL4n9W2kym7sCwK0Zs+9HYYQ8dQ
X-Received: by 2002:a05:690c:60c3:b0:7bd:8cb2:4fa6 with SMTP id 00721157ae682-7bdf5dac0d5mr72252127b3.20.1778142846035;
        Thu, 07 May 2026 01:34:06 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:04 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:20 +0300
Subject: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: D69514E5190
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60754-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


