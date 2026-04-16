Return-Path: <linux-media+bounces-58901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PXZFhPp4Gl/nQAAu9opvQ
	(envelope-from <linux-media+bounces-58901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:50:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CCA40F2EB
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D34F83141556
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0613CFF57;
	Thu, 16 Apr 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDn48dsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99553CF022
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347077; cv=none; b=sHZGEXhEA6S6RSd3RfW5GeFEvQFg1wRoSWNH+QhmbOMnbTyvHQxJXRXX1fEigFlZgPZByDjRawNfdS7b127sRDAP2dsxIdOVSmHNVkAPgzEn3biljUbCJlySBUyZ08/Vccl/slpGE31kYnXm+bJ1g0vdkvK3WomSZoCKYLsBOek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347077; c=relaxed/simple;
	bh=+qxk9YKyNyEiRkeW5Mgtu8HCNYz2EeeeSG35f/DmqEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8HNuabAnIJzIz0q5ghGw8eF/uHWdhceXtZUPcireb4Dh8JGtsKR9qJ5qEwWAHgbmDAkRrxSsEekfeNQl85jlEcYzpMacPKUFVo4swgCdz+ttFzWjnNMedMW7FEHm/XvsGpLKGORmi51jVzjcuQQY6PlOwjf55pYWzNR3OQNyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDn48dsJ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7b37d84a6b3so46485647b3.2
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347069; x=1776951869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=fDn48dsJPQKBWfJCXLRzNLCQdvybuIC2gXn2uRFqAs5hAX4KrIUdsXcYV72VqJFgLY
         /nEjWzyCLmljGyR0SGhIWd6thkrMfJZQxzo+TZKHuEf7eN7QLlTTiv/L2bDHo6HgEcEt
         v1mkmw5ELq0W7hTbyA8QbFNPW5y7MAg9SdRPRP0mxqfAn8oW1Ec266rVOuTc4zN8ONOa
         LoFF9CAGUe8QPNBgP/qVpPpp2giALlc5XezBBsLWYHMprTFyuqM7BeNLgTRvGPNPbXBb
         /lwmdmKd/UFJtMjR3uWavjJyPFuYDsl4Gk/Z7Wea8QgEtHIFw8t4zp71YNKYrWfzedft
         C1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347069; x=1776951869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=a2TuMomTv31y1UYGw48t28T9jt08MlWlHLCNgRQ5kchjvkDvoPxbNhOcLzJKkydfCg
         noSl9i32N312JiAuM0KG9wQBnLjWnPP1IY/WsP6u4tGXjYfvoqoJhErvOs42y/Taaaye
         ig6Eyj7DxbFt25UE+CAy4YTxX1Cjl8FUJlJwofg73TmsBkw1jx+y+fcmAQFX8pDThCtG
         uCDcp3yWjvPYHu2YMB0zPgEI4ugVz6+hSpKCq60sfmMMxNoy2Ex5yJymMPnQ2b6meHiI
         Gu4b9FnuvAFG6AesiboIkMDFgCJ98vN7MGQVMIbChWO9xyqhy74YBLvuBPanS4Eh6fr6
         XAmg==
X-Gm-Message-State: AOJu0YxO/ymBazHXJGEuLNPLiyHMhj4i0NM4a0IPiZuv0jeEMupGdubf
	zORbV9xk+iEO1DZL0Vjoj2MC+ZtvUtqCa2hON9D65UhB9F9z+Lb8wuJ6
X-Gm-Gg: AeBDiesbE73n0+y5ZhrPUrBJUiY12cIKTp+ZmE93mWh6qa/Zzg1xFovOp8MGiZEqexZ
	mU/uKachM560rQfi/xBFkIzl2wHVWdhA04b/Xb7Y6q01h8CLyfYisDW2ZLnDFya+mCzNZIePqbJ
	Kr0DptAXXNQ3ZPyaCedLBeijNzP9AoFxNe0moaklQ0XHiLYvjAlXtKymDK3yHvx41KpZlQxziz2
	v5ek3Hed3H+0+tGM+i7oap5PFbSEmN3+1N0UNGCCxkj7dXHRRSapvIDL0e+GhYLckAdA4dj6IJF
	wVEbYpNUIq5zN9pmvN6VkIg2PEVbCnlU2fLej7ueIqMrE1lFD+1WlW5J1y/7LkbjZTXn8Hk4tqE
	6nyAJ4ZeOPk4dSa6dBdQqMISDiDHA2r6Ol+df4iqzeF41b7lY0ANwQt+EDWH0NlBEyZj81RUtqK
	9/4bdU1w+4xGdcKhKMwinNTzAJxg==
X-Received: by 2002:a05:690c:6b01:b0:7b2:7dc9:35eb with SMTP id 00721157ae682-7b27dd88a12mr158996207b3.50.1776347069632;
        Thu, 16 Apr 2026 06:44:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:52 +0300
Subject: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58901-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apitzsch.eu:email]
X-Rspamd-Queue-Id: C9CCA40F2EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.53.0


