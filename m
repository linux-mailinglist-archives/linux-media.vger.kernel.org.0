Return-Path: <linux-media+bounces-60489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNm/Ekdm+mmnOgMAu9opvQ
	(envelope-from <linux-media+bounces-60489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:51:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE54D4165
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7890F31041E4
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55873C1967;
	Tue,  5 May 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Uvygq1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6294968EF
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017586; cv=none; b=PGBT49D30N/rWxfposN4SNaloedaruebuEffQsUZ1iX70Jv3PKrXH0wjDOpzgvVtUoWhdge/1ksafGYfIhnScZdZsG1POMIEkJASS9nVyxp8+VZlKIKuJfd0QzA+3Xx+I8jh/pYTgaGtsqsOPMCOjI3pN/5aUXuQTMiJ5hsG6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017586; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/nii5R2S4HNnbWWZ8/mmGZuhSIexUdqzsOaSOIYk9KVpXdXcWB/EkZmzN8l8qklLWzL50I9kp2yOSg37fovxGRWqx4+vqg4ulN4dE5IcpO0k9gpszabielZ8+JnwfYZ+i1JMK2EBWNBgKh2K2LOCZtLcPxjd/PaO1Q/IUQF9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Uvygq1; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bd9f61458eso18769127b3.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017584; x=1778622384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=S5Uvygq1FZKhtZ49BNJNEiSxKXhT+JmWafkSN+Qjnny7ap4+LfP08X7BUuF/ufaCgS
         /2fr1PLcIoGcv5sKHdvaTg97YjWhZNtIaKLVoiE9Tfuy3qQJZK4qTjpAnoZVMg6f5Tdk
         0gx3y6ED2bjh1ZUj8dDKfRVkEFr7b6dsx4wSGYHFiAwk1z3RJeyXeyFFICfyfReT18F9
         kCHnEC1v7Vy/8ba9UN2twYp54trvKh6nyYXpYGOMHe3d414JyCOYEp8OxtcDWSof/EoV
         3+TxVC4oTZq3gJFPSZUR1Wke9WfaNJCAl3I4eOu+UWFAQjTlXILZuerKTjDEpeiWvkTm
         PKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017584; x=1778622384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=QZaZiJ2IlwiFHYf+6iG5vHrERgvnjSMtmjbJ98cLgGNQ/rqy+6CNowaOSoDldyIKSt
         M/D4TNSJ0+QlY2WgRZyjtb2ebjKbpH+EpCPtfADt9aXW83wTE6UYfQcrYlDmiX2hO5HH
         SOLpbZix+IIB52zhYTWXzuN6lVk/IaHKltkU4w7ANw4L7QBiMVShFWUMmqzz6IyYasWD
         A6AoaB6MdC1AS9acobJe+PR+HxeptRXb7au1O4zpDZykbh5Kg8e0tr+ortEWNVnlTwW+
         kHj0swTeuoiG0QjiX9lLlF5TGrWmX0SHM0uLrkQ6BA91etFGxVhE6iw8cUwLQ5Q6q9ny
         dtTQ==
X-Gm-Message-State: AOJu0YxErbNLqJtqX927atqS4iDsUh9out3lOLabo8pBIRkGHtQb6ylX
	1CvmKTfiWnfkc6kSO6BeBBNaRtZVsQHv8d68YaUz5vSfEgzRCl79bkUa
X-Gm-Gg: AeBDievvur5DUryO8HOIbM2G2NT/7T8FuS7YtIJrqOOWtYObqxwRPAOdkL4gbBMMN9+
	sCoxZpSVQ62ouXx0mFU44HPYFWCpoj69LpfdGc81rMtUUoFuOCnQ4FQpfXsozK9WPITZLaMmnJ7
	3pPZWcxwGp2IJRcs3MytSepeagm/GTxiZX1ypeObZw1Qa6ySoRC19LQZTrZuqAb8wHCga52lqEx
	QVRYcM0BV4DjWn44AHeBAWy10XAytOs/1RsvsJ1qs3EbsaRdd1nahdVBJA7HoRY9dz+TiqUllf2
	sHQqGOO31D8p14CPjaeWEAZ8mrsoofIuLpznfUibvU/QZPXupb6/Z7J/o7KTx4MEQeFH9Ti9H1Y
	vY43xnLRQuhDlcxpyDUkX3dqu56xFTRccdy8IyW9tyeK2gqMwm+/C8Vkcsx/GeK2s7DyKR4DjUd
	E5zA8iuwgqEHjVpD4+nBEEdARhUntxp6p8jWuWXsLOE+/pXGQ=
X-Received: by 2002:a05:690c:c50e:b0:79a:b1e1:49cd with SMTP id 00721157ae682-7bdf5eb3683mr13883347b3.33.1778017583808;
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:44 +0300
Subject: [PATCH v4 7/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-7-994f5eb22acb@gmail.com>
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
X-Rspamd-Queue-Id: C2AE54D4165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60489-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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


