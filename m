Return-Path: <linux-media+bounces-62794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHVWBFmjFWohXAcAu9opvQ
	(envelope-from <linux-media+bounces-62794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:42:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108A5D6BAA
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC8D3007354
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A2A3FC5C7;
	Tue, 26 May 2026 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkFnESDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529823FAE15
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802302; cv=none; b=aBVxswr9N50C8jcnTk8SiNN8Yhwa46TUxOAO9hjSw7kOelQHF1Q3YpFJq5rA5d+BVaNybz7AIF4xMIzqiqJTAccgTEnj+/aFgEeug1OFSmv1CcdF/BRDZyH1C2hpIKUHrAc5TGCXXVGVHj8NKD/t7YxZHRppnjHfLUhM+43Ks28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802302; c=relaxed/simple;
	bh=JnLKribf6AOHWDcyQv5gYJuWC2U2xXYnGbnDQ8hOUS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjpmxBdEXsJKylJFu+1IU/uRxITx/xWZYMU+fCzvPPdqb8sKEuE2EEHMzDJ5dZ+tqt4dOYRafahvraDxdEd7lEXg55dM3wFrlLH3VugmIiQXcQmzbyEb3KKmSxJNOyK7NXFSnWjd05jdlRvTLcr3lDBBcQBbGGIdp3x3N/+nR5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkFnESDZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so37408855e9.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802296; x=1780407096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=MkFnESDZ7DLJ9+quB3dxFSDweMX9dE1XkK7rPHfSbBH1SByaoAfLapOwalTPAFOebE
         6dwiCgT78lSxCDTZGTSW/9w3pf9YTx6xA4E2CLksFQDXRyLfdqVx2eea5wF/xkcYytDu
         CUFrOjhMgTBkllaLKxTCx9cEnug4KR+0ByL+V1c4Cz5leD3ei/lBJ9G5BH9RWz4YWrhe
         EuXqZcfFmRM2O8uuUAbLRNNJ73g8phLPsG9rfX1lRm9szKpVC22HOBkOqk8hdnyGh4of
         49rDKBXFSN5NJee9cCXvW0Lx6U7x9Bma3j+0h1iMf2b2004N/L4QuNKdx8t3ezTnFo9+
         RvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802296; x=1780407096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=ShMsZr6JjrvA6ohTn5M82kmZg26CEdOKsmXFJaD3AVI55aAVtcnmuRh/VT3XJxcsKW
         dFWR15vybeuerQFPdo3j9xYJnvz16R8jciQJm/qpFRm+d+KgE2V757zC3MLc+qJ+BaTI
         aUtHVQpfK2djWirJ5KZEIjizKh/NMKhB/hsasnDiSXklyxVxTwLf6ThFt5hLKzZaYLzi
         o/mR9F5g4ZoRo8Js4BB5IxYVZybC4FFrOvV9f47FMgxg9u7/wtd/ohPHdHTugnVvfXDp
         JQvgvUWhJSKS4ddqT1Mkqr2VxFy2Ez7EV42won0jMx7rvkCq96p2JNKco5XSluPN+ygO
         sDhw==
X-Gm-Message-State: AOJu0YyrwcIxqIPyPUBUI7d8ocjJm0hWK7UREYTPB7qPiTgqG0SmUYcn
	0F+KVklu6lmQl/p2PX4LuiaYo4jYxRtlvzRJeXL5FLsdU+rN5T+qqV6k
X-Gm-Gg: Acq92OG3fwsmVsxkzu8DQ0wlZUVHE4QUKDpDeEpREGa5+YROFBCJfyMW3SV5aGIvpYj
	9L8JLm9FjVYdKJbcbh3tCxFxQFDz9Yj81mcEV3dKH0nNQfVL7gHVG6uabWri8jdwgYQyARpxWki
	bWqIWiXJr/VNvjrOM+1yS6mkzqQEx34tq7SZDj8UqzJjfZmOcvj9QyMmfEYe5/iHu2Q6y1hYPA/
	//nBVxKUCFuMpr5bV8T5UfVfsB0ZHLmraQeBC8JYQ46NrDrwUaiNabL0F6imIro1PwHR1aw59l+
	k9ovdCfRazhcylHNnezVDsqT3nzVhsI6S0dfoAtAdEDaF+E3P6O86+6HN3BFMX9NEo5jLJOY4Ol
	C3jWouKTdbHqqQbYu/0CvBdtC8Ws+oj0MUFJJp2AwIH6VWkbGFIQmS9O/gtv7O0gBz/NeNXy5ii
	O7Hj+elhU99T1RUR7eb17KllP7OA==
X-Received: by 2002:a05:600c:3592:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49044ebc292mr352432175e9.28.1779802295540;
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:25 +0300
Subject: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62794-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8108A5D6BAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..956295289ae8 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


