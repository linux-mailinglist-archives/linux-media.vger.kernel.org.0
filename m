Return-Path: <linux-media+bounces-62162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFM6DMeADGprigUAu9opvQ
	(envelope-from <linux-media+bounces-62162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:24:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E991581624
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 265A53057B7A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E42C403E80;
	Tue, 19 May 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhYHepEj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B04F7993
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203634; cv=none; b=eBcAJl2FxGN9c4CFgFgrNoECgAIhvBHAnvy8ZHZD1BAcXNmhdoLWZ+tkW0s3nX1UkvbeX0/CAu6FmGqNx39kF0OtJV8u5B/PRifO87bD+7rU2S3/uLHa6qoxDtinvuxBliR7W8iIjmcRK9/uXznCKIHCabuxN0jiwZdl8//zEFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203634; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDW6EmdCaR0y8913rjaStJr6PwF+daVZQ+Gw0BVE/Oo0WoS57VPanIhiP4GyKaCJmO0L73aqYvhgUKO7cpjCtleq4JpUhtdCY0W2yc+zlHM0PdbWrgq3BvFl0FWaYcMcZSmZEZfL6zm0YaATYKgK04jhuJTw+ZkhGNDeOuSvKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhYHepEj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso4666815a12.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203630; x=1779808430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=DhYHepEjAME9HAypfjQdpTCctWhHMNRjAyhpQU1/0WqNsdXG1d5RwaQIA1heOPwwKt
         PgPxdbNmNlFSyFHvMcSF1o2AkXlFVk0YBJuVP/NGqJwce6E3EleGXRgTa3fYDI/stXIn
         28raa0ZhmPTnH8VTljkRhB7UEKe6Y61zgCoJQafdV56XGf+O6WBZixBbnH0uYNjIYiAF
         hJ80rffLRn+/Ir4yJ8E1q+hJOEYUOmyB1cHnrUOW5O270QqEOlVg2+yQZfIXL7NtO63d
         J8nUhG7EOioS8NbA1ElWfgloqYzVvrNnq8rsRPlg+8jCHLD4jUYhUUt8YbuqQOJYaqTK
         M8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203630; x=1779808430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=OeTxTJHQPbEIw2sO0lJzbsj2ibwE2cUNsjrWw+eTpszqURd7o8si0eQmqrWbuTIK80
         /m+nTFXOD7JpdM1Idci2fPPfDnpAGm2n7+8nnlmQ0XkxavtJQL7GHPp2+speh65wBvXu
         427ECH2356sWFt9F1iylmdTtB6ja95NPcnS3otIvfoGX36UlYcjChJwzheyRQ2KKXB78
         uMcYoA24OglTjmOVgetWDgUPBDcVbA2K7QAy8TZUjZ9Vb3Iju7TFBUzCVuG/u4tfeTgX
         xz8dbV+bleOeCMBB8T5e7KxrgtqQv0M9VjeoNm9wsXFsxOowJTwq4N2/WbxlvM23NhcO
         4YSw==
X-Gm-Message-State: AOJu0YwerGR9ulsTKDMAkuF74Mzn3/76jfBV0zx0pgJSlF9/Q5iSuYTf
	XHgWFa0IEluHXdTZHbZnuOHlxc2FLJoNIGFmnl+numIs9QmgV/J8K+TG
X-Gm-Gg: Acq92OFpXYe+0Gd0T+/sQ1jW4E1usSMPkgQmg1BFbT2edoDSSsECttyInk5+5U23Bwp
	l1T9LiEDtKV7JFfnouRuG+HuAKs+mMs58V9DtEkIl4gajQ4rLuF3gc/77NB/fx3DyCC2Pg9QR+K
	g6Go3xcmyptf2U4EbWPnD6njKGlAPi5W/J1PyZ8Iwa6CV4lcg68ceu1JzTmrGAw49tQ8eycpp+E
	N5jLvweZZgzFxsyre8+MXlfNnf5F6nV9xShWllmlSlAUEV9+15lVm/zcxiXfXDgAJKvzDtaDwzk
	zbSQ0uXAQhUZv88lrC3DRwZBXWeSpl49sVVVkNcyptBOCcJroU0YargWUzgdIu/E4Ek30HCmbFS
	wzYHVpn4hIUJNQeDwSylOGYPdvV6GhO7acwOGCQGKnryEUqMX+mRyq3BAX0fiOFNpt4c4882yGx
	8MtPc5D+7ap/csi4YE3LI4ntzPTT8ZOMgAl90J
X-Received: by 2002:a05:6402:e04:b0:670:ef2a:217e with SMTP id 4fb4d7f45d1cf-683baa391aemr10613028a12.0.1779203630340;
        Tue, 19 May 2026 08:13:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:49 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:53 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-8-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62162-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,apitzsch.eu:email]
X-Rspamd-Queue-Id: 9E991581624
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


