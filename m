Return-Path: <linux-media+bounces-59709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GA6E2ql72mvDgEAu9opvQ
	(envelope-from <linux-media+bounces-59709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:05:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B187747822E
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDC6311A56F
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66A3ED5C0;
	Mon, 27 Apr 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Y3Upzr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357393EC2F6
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312747; cv=none; b=qzYVzFeuay6iaedu+q9md8ieb7nArdln1l/Irrrc9W2ZEWh+YaISxp6fGoZnD1NuvKaFDaDS4/mhPoUYmgmE/6LdjCH+9gfDOyPonJe/I9lGWmETlLxhVxIUeIF/kCIfi2kMN53M3D6rG+FR8UY2WKJpCPUeYnrbOqHOyOhqYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312747; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2QEz91NkgFR70RLd8NzgpijL4Mc2BmzRVTZBfsiGTtO60x5vVIUy7CvFk/W0bfhABfG5SuKSIWdLOJ1PRgbCRTwm3iVycFvg89LZPDhWq693KAJg3ZdxvLeKL8RqmkTpwkAt+8kxqZgb/5stN8QpL3hKpE5HoJLKahlcR2uAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Y3Upzr; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7982c3b7da9so99749497b3.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312744; x=1777917544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=S5Y3UpzrB0uu+Vxo0VIJkGdyxrv0+IBWysjGpqplCcAeeJUEBXRQG+pMY9+C4d6Vke
         MrZF7mGMt0BRdpg11j+MZumZK8vwen3dHp6UwSh9Fqayjf4/Jk5fyinCIYp1RnWIH7LX
         uFkzlDR8EvbADRstKh3nHwh53oD+7vYTCT6BkbW2EusvOGWGDuYMo/ZEwr38NfP1lyUD
         fExvXSEZxk8e+jpDbiAFXaX3RaS6ogLgQLwHqwK4J9qf95BCMeErZvWyocGZUQm2BG7p
         jWZPv54DV8sqO3d9xRVNQUMJpg4MzHCQgPnabB6V0RwMal8hILf8gY0gzoCXsP2X/lbV
         BCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312744; x=1777917544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=QxAZEpryMIQjwD+iUKXFrbpJ+PzkS3Ax5Oc03UpdNhgQKDOnMZCHtF5m9F1niR41Yf
         grQ2OJNLidf1jv5St7HpnVuZQRcY5AW3znlE0aB0wk4iar/TJdBCQzhb5XF9MFhY5rOe
         UngoixpyvOVCNS6GDVAw1VaijyvG3iizszyqRi1Id4Rvbhakp3Wb3hIvnFO0RJ4vxoZD
         0B0G42mVLnHxvbkIc5CR1ITWLbYHqbbSbqoAgWqfdBVCJy3zVgWzrGWpEE9Wl/vnqdg/
         EuHHVCr5ecFugj6nKvxXpkM4/H4n5+BpQeZi4hEGfA3h9HaVlD+n98h8p9V5TnibXAEX
         iPSw==
X-Gm-Message-State: AOJu0Yy89fm69xiPeaYrxIF9dIyrPRCr6tOOByT77W7ZyQB5T7ps+22E
	r4kgiJLR+C/Oc9LTYWMZm3cgyhuirnG3P8OttPtyGkS08eOKOe35zghZ
X-Gm-Gg: AeBDieuzBKFpDEFyZTcxv32y8r69HYWXkQDP5CnlgkQG6rEo5+bnwXdJdfvu1EfiKSO
	qjsy/VoUt86QqNewA0H1vnYP/l/xQMY+wv8y3DzFlxgVo3bP/KHAXGWCZyDLQZnUYnoZnmlrgBH
	osewIgTDxYBiHYdBPCCLjN1ndeyGkjVB0M6vgr/HeQSSqKf25LDsDPDOZBPapVygvynb2zSKNB1
	ABzMYMfr29ncX36wngKBnrq72H9Pm7W8AWmO+cpa8alnbhX6MShxiwAG078QWebuuBMv09LOWJC
	qUgOrhEI+TXBEkSMIzGiVzSzU4movAR7jxta3jS6QCF0f0e5renf7O5kd6zjTqqWFdL+x/Pungt
	Riam2X4rEd+yAtytN21CQ13ojckhfr1T/oq4uK4+znYe8zwZZEw3U+j0P4MDAjB6weHVTIHYLMY
	MReeO3aP6myYpi7X4vcGE00nl/iYmKOKARc2WHjjqdAqVN3FY=
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3564447b3.6.1777312744138;
        Mon, 27 Apr 2026 10:59:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:27 +0300
Subject: [PATCH RFC v3 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-5-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
X-Rspamd-Queue-Id: B187747822E
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-59709-lists,linux-media=lfdr.de];
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


