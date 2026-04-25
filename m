Return-Path: <linux-media+bounces-59605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIrXGWEJ7WkEegAAu9opvQ
	(envelope-from <linux-media+bounces-59605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:35:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F64675AC
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 313F2304E33F
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4249376466;
	Sat, 25 Apr 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3bWBZMS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180F378D7D
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141894; cv=none; b=sr9xY1Vs3LB+ggbinDsSWNmhZgjELrJtak8ksrUpPPFqGisq3RtE3btBBaU2XG5gl1z07fg+Me9n3JB6Zwqv+H84FuTGCjVvFlipRdxneexQPGAOQiNfO70RGBPGMJmrZtwdf9baTvkCpBhMIiR7Yg9+cY5Jn5A7nmSfOQ37Kd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141894; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TH6YbWRLi+2eSRBuZs2nToLu4fbFjcrhaNkPABKDjs1LyTaY7265wJLVPB3zZQT8hETcUa+2hyR3Szjm9b9Z3m5rtQP95dpijMm3iC6F+8uN+51oLi8IMpD4HFhUEAzTtPPRy5MXWI7xHkCePMZRTCBuycYMTA35wsOye2Qic/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3bWBZMS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so80912385e9.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141889; x=1777746689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=Y3bWBZMS/mcFFkGD36D5wZookWEBsU/W7RzuCuJG1bTN/LngYLXZtRhJ6jEnioAfRd
         QPGWsOK8FPte1RMcqLeHyhHsfubHgWB8fe8PLfap5P162//Cvk+l4QqcSsU0AYqIgvxj
         hxOAM8sQEBtcxcZSDc9pBY/ARDoNELA74e/684bWDsFUwBJrQAA1TdbWsd/OeEQjYfLH
         MOQv1JBi6hK2xTwv2kl5H9Ko7mn1A8OStDJ6mEFuQdZWdOl5fGVOvM8vCKb0iRRK1vqL
         Bg3emTp1LE6TG4WUrJPfkgIZ6fJN0FHKLMgfGDYMpeM8UYV1r5c60+HVXB7hFEsLptIv
         18wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141889; x=1777746689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=dXcXwNavFK5c3y6iqvbYk8cx2FYe8O0cWGGy5n5cV9FJPiXAY9RcuaegbHPoFMDcb3
         w0QNc7S40vWh/13bSpWwKTQalzG2GkE+R0hmXTn5Cktctwkc6w9wc8gvnaot+HEJ8/UO
         QjFl6Wr6AnoptZbNiseSX574o06krbX/wTr9DfSKgrtcP0o+keij0Pec+wMSXjurOMnY
         aQ4MKqoMErHjuLQab1F+mB/+bLV7cD62SgC+3depugJms1Sa1m8LdcdrQ6erOI6Wk+N5
         bbZIKaREDlkpFe8fFumuMkGhc0/ijxNLo5RPgVU/fdob8np0V+8e2QKBedI8c++2Efk8
         m7Jw==
X-Gm-Message-State: AOJu0YzVoNkodpmqEdBGJpMDlQ9D1UsnilrONtO1imnx7U0uYAUzUDtW
	u6eMKneNO+N78CmtNO/X0JmNIfiR7zNkY8O8Grx5fV/sZOLXMteEb1NL
X-Gm-Gg: AeBDiet2ApL7f1irLOJYH8RB/xiyl7I+mLLopRdPLCqS6kI8UMGp9A2SO0UAQ3AO7DB
	OP2vg1aX3QE2MR+4l1LuWWq+BqnQgtG4Q7DpfXqZjad3C/Wo2CNq9NM4QCyeHXf7m6Mj8LUtx+e
	4AekEpd0WnBNaSKu8bbQu7ml8q6o/q/d0coQg9VUaSb0s7+lsWF62V0ot4SYlJSCiicCGprdJLl
	m1isW/BclZn9EihdgUbvR9MwYWH4btWcz0OivMft+O6dItUtrEQYBzVQfEdJhDIpmcfF5gArEkx
	sl3WX2IFw6hkjM1zdB3nskv+qBI9g6BrAP1W6YmR3/LMRuZrICPwSA7xnvDqn/bi0LRpkwKtKi2
	I1Q4zCLG5lkieNkTcBAaKegQSr49fqd+94aiHR2qh10m53509vmtpCeKJ3CQiTAoi2MjYpNEBEY
	60nAyjXeeNHPlHPnNTT23sDfQh0+D+kViQbq0=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr512182135e9.18.1777141889423;
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:07 +0300
Subject: [PATCH RFC v2 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-6-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: BC2F64675AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59605-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
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


