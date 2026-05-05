Return-Path: <linux-media+bounces-60487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BldFfll+mm3OgMAu9opvQ
	(envelope-from <linux-media+bounces-60487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:49:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 019764D410C
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0568A30EA09E
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940313CB2D7;
	Tue,  5 May 2026 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7j7QgO1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD383AEF3F
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017575; cv=none; b=Xs6ffT7bBPA3OGD9u1wxS5lYsA7KNKfzeu5YyWXde1jFfO3IAAnLtd9x1lQo0J7ggtOz7cj0k18Wmp2u79+1Qp6LjZRRo8qyFcjNMhO3K9mpyFrVBP4aoVj8SR4o1NS+Vc8XNFTchocrMR2ZZTNNB0goyOHgZOkol10hZh4W8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017575; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l19FhkIUe5ZijdEQl9jpPQ+H9ZpVCLwkhTDUrj68brIbVBHa/ORgOGUIlMaAinhl46KsIO7ZsF7yP2+m6bMhsBg6T7VWnv9w1y8fvTA9NdN217eM66+1o8L0NmMM2LP1/vanE4evPkBik7BAs/zlLYQCfkkMfhsR2IDNUeq7qrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7j7QgO1; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bdf83185bbso689167b3.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017573; x=1778622373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=F7j7QgO1/ZEHRQ8j4k3h/vV1CZpw7eBseb/MmldYW9NO71jM8C/2bvp7ZGvgtWquc2
         yILCpuBnYk+/WriHnGqFKxSKCZqueKWh9M9ZQ0EpMN+ixnRPbZgWuuLFx/jm6/x0xcfR
         GdAojbjrJ7TCqEZrdLr+86nnka9Xjl3NYL2xxxHLWi/vyuZi95DZG+yCin2o1MPwL2/2
         3x5TP8QiUXFDR/kY1sNKo8/yERmAcnK4fZZxudXxb9eRJXnFJL7Jy+6sMfwpKjtJ9JoR
         SicpfEqKqcnUIodTBpYkilqg+AAJw05xoy4ThX7DEKypOWw5PmO1nupZvbv88754fuu2
         h6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017573; x=1778622373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=rzaevZy2jna6JBU1dSL0aHs1GaNbwK34hre6dWQq4nOVCdk7y/hxNfaEOYjVuVVgXp
         MKcm33kasxCb6GfMjigb6Nv61bHD1bvf7Hnh4zgIR53VfaFlQCE1mRxHiODrRXz1FrWg
         aww/8Z+3sem1MYkWrPMmsV3WFUhGguVdFVVd4rQxIsJ8YSmRFn0TnlOQ8K4ICK9GMAVW
         ptRms6pjQWqaIgozNtLUJMUX+oHi8VF67Vy4Z7EO7NFhPbRRRDr54ZLa0j7+UmD8bAJd
         F0e43PwMCBg9OhNY+wyBiPvocHkDmBFT/f45r5lV+N2JUwY1LwNOxg8cXa157BkfF5jQ
         hHxw==
X-Gm-Message-State: AOJu0Yz6bjZoUml/7wqMQ4+c6/McpCE6XSMzEGcdgyQH3eF3Bc9P5ALX
	q0h7ts9mt4WBLuB1QGhJFP8PYlgnJ2WaUzywudP7OmfyqoGamFzrAQak
X-Gm-Gg: AeBDiesJG4mDLQWQmXyb/X8bs83IVKNeZEIBGGYMaVInf0W2d93vxL0mf4y7k1dwv+O
	pCLcrTzQBJSvQg5DgUCVZpBesSNvKGOT+mGNKLFoUjevi4UKUi8LZeYif/2EzNb1OUNfsKXspHk
	kCpnAuQ02EheWJP94chQY8wAWk2k2eM2n8bKaZVx3CCwJXVxKioEGFu0E1BLYS5I8xylAMwafBh
	564nLOlQbpkGlkJoG9rXWwi8yk2eQAAMPoULv7QFxfEXTdMUhCdHkUmXD7hKDcB4OlTRGxtWeXW
	YXn0wNt4ABELKh7i4vuK4x3+Gc0iGjHnrAWateAWcy/FUX7WHF2ALlyFxktrZAP9Ehlm5a6RSJB
	wyWiJGOX0rjx0K04FO7ZmXwLgQTkD/V4GDcg7BEWoSLU0U9Iy5wcQnuEbYcQBU8UYrjNBjCLlmU
	q1cQgUrkmibpnmu0S3v8Eiqa5AcbzjNOPv7hDy1lWsPRQl9js=
X-Received: by 2002:a05:690c:c4f9:b0:7ba:f1a2:a448 with SMTP id 00721157ae682-7bdf5d7f239mr11612357b3.10.1778017572841;
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:42 +0300
Subject: [PATCH v4 5/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-5-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
X-Rspamd-Queue-Id: 019764D410C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60487-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

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
2.54.0


