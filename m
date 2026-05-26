Return-Path: <linux-media+bounces-62800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFpLGnqiFWqmWwcAu9opvQ
	(envelope-from <linux-media+bounces-62800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:39:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E415D6A8B
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6096530CD99F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F073FE665;
	Tue, 26 May 2026 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTsUz0n7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916853F7AB2
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802319; cv=none; b=Z7NUv+UhjkpRvCUptuL1i43+pP+LW+pinThMIGcJCP1UjwsN4mDBoC5FAXOxt2Muz3z1UAyNpD1BeNopl+lQs1jHKX6ZF/LfXbu9emh4CmYqUKLN5Wh7PktPA9VOxtAZdhtSCzFlNvXOgAWKCu+dHbKmpU+ZfQwrNkluykZKkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802319; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ih+FuOyXtsSDWR1qC9RqjrU6a8OCYrq5FI2U1J/99eanEccyFvXzrRLGT+zj3RCXnSC9gQ51SYol5R1zc1CPRfP41pIHjZB7tbB0W1DlBQB5/64taqS4WvUbZaFgg1ao/zAQVJ/TgkeZY8Uui/79BlEOXYTZYSPHmR12DFmy1qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTsUz0n7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso29926425e9.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802306; x=1780407106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=eTsUz0n7yYcM2Nx55/K+Lme1gYXcoWxuIdcD4LTBanSDP7tAbZGEaQyQnkP+21/ll4
         fnjSIy9wisKrcVcX965J3qlylj5P8r/GpnqMELwKtmnYFO5pWVGt8C8yV23oBE52yJ+i
         bBIW0d6F7TEJcpiNtB0lQKVmsn4dKNCMNEPMhZ/RIPKN1ur3IMMuFBTz49pt619DIHEF
         FSrfcmpXLOaTNdZayxi33u1efq4/098YBdlk7uNy2EnF7cW4zWad7WHPdjvLoQXOycdJ
         E+wiwJmOTpHqsKgHGvu6MYLhxqefHmMiVNCTOjIEpmixKp7HJFP03inNgkdCZykjRy5r
         dTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802306; x=1780407106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=Jbc8cGG4NSleObd41h1vL7RKWK9UYVQ5+sd8/ZaQegU1KpvhnJR2REIJg4kYXdwbn/
         gYXeu8CTD4T7tXBs4dj2GzCKco8lEfQDi6I82xcOYKwsHqFFVGIgzyjVRzqLUCak4wai
         v0lhvbjPj/X0jaeqEylbRCZFD5kYIedPaTLVyaZ3Y7VUdKFPSfuLTksScoABimviyvRp
         ivc8T8CWfU1i+01h5eV2z/DdNve1GTnsS6mFf1uVeXyzghh4Oi8fTVIbEEhueIzCjos8
         uouCWCfdMlEKFKyheMTG1k/EDesXKV0ZWeXJrPDK7MYOuFYtP3E45Lk1+ziMD+qYPw/V
         QMzA==
X-Gm-Message-State: AOJu0Yxb99zSdB6n4rnGxnMKGEfQ1v0iE6Z7Opswyc/wlHeQR/Phis9z
	BCT4J5qS9yOSQYQT8YnjAjAcptxpcj0TECFPLh4Jmh+aCl30XuvXgPW8
X-Gm-Gg: Acq92OHqHojcqhgqBQu294pw/ohFvGR1aW5wMHRvqGm6HaUZ84QjFYLraZuTOTuVfR6
	YimWzh+DVD7kOSZnHYCU6zqpbAzgUMFoZi6Xik+MSZKMj76GYnJWTm5CbfyGozZDFqIie1fcD42
	VB8rqQlmno9V/T+UoDZwpCVhjFq2BxUmT9M+THNLk4Jq4i/9TnAij/WcUHQ3eMER926kurMfHSZ
	SMpsqJLLZx7wvFVH1aX7nuSWFoat8y3qMERa9rNMqPXvp5IfHL7kvLbF5Do4PziLH27qvGYhI1n
	fZxnDiqrDZ4Q/U8M7hHFFyVGmbcRmDaKOLEqb+EICUTTg4UASIhFPc+yOBtU0te2nsH9o6gLn1D
	eDjD5BZMwjikZ5pn5My+UmNXhBCzOdQ6xxOzt2t7I7dIpicfPocQQ5jq7ehyfnoZpnT4wQrNjG3
	BNILajtLpd8UgZ+74PMNZileXOcA==
X-Received: by 2002:a05:600c:3b12:b0:490:545c:7a8a with SMTP id 5b1f17b1804b1-490545c7c2emr215250765e9.20.1779802305717;
        Tue, 26 May 2026 06:31:45 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:45 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:30 +0300
Subject: [PATCH v9 7/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-7-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62800-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B6E415D6A8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


