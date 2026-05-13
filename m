Return-Path: <linux-media+bounces-61544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHReBCntBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:29:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4E53B05E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A9330D3317
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5123B8405;
	Wed, 13 May 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQuqohlK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2613B5F59
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707566; cv=none; b=LVHlaSkp5gRaMrMx+3RCseZXWs6TYk8aV2TEvH5XJFDcPvcoaPFTFro5+IQQmbRCdNbUBCN5l+i5irb65gcOqJYvIKZiQtrkwA1kTmfwXMLccjiOatqp7TXnVqq2q8bWRapi7BSJYY4Lilb0O5NRE/3Lua4u+/OROX10I9ZJD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707566; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhcnLPL+DCXQT98fNPJruESVZ0fVZG4pVyIF25K+pSoAEjNMUW7NZXpkzfbt0hwveQ9XU/D68HJeaW80CGmAoxBcgJVz4wKcblXWLaD5Tat9m7IU1L/K6j9v7/CavfgcYg50DHsQfuC8N2/tF5+4wOslFTjJheGQb/pug/LTeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQuqohlK; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so7552733d50.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707564; x=1779312364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lQuqohlK7z4Fk55bjl0NZZAObXDohyNSxVbRdQA7mB0duAnikSTFQHacnFCdg4bxk9
         itK8l6YVA9zFdtJ43ohraSl13dD+9A/76AuGIOImg6lubQwi4mnOs0qPPUWBPvuzzkSl
         tRfJZbb+NGCpPkTXzfQgH5nB6+tDkTN3psPDTY6YP3iG0jNXVXTra12zwiMMAw4ayqa7
         ooHF5A5CibhpjWWVjGb1r6J4jpJltAim503s/D83te6Rd/S8ctr67v9M1JqrHcFZFjzY
         XPrUfAMgwV1f7zknfN8ZJ4K+GRI2nd50OINP5O09c9w2UTMCBC8wUXfUOhwcLmRQClFV
         q1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707564; x=1779312364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=TYXo9FUJ3OvGJpZsq1H3Yue1smztnWUYWhTHlIxyy7d1lTIOC/4cg2OyvRo+/cZUEy
         23gtRM+MDUWaGLtyVu5agGd7vRDyFBr23b1wJtc5Q9QvnOT4++pjYXgNkN1qvHKNtaI4
         T9P9ludRsTZb0BLsMsWtRqXzNTc6OtHP7apM6H7LmsKSc72iogQMwFsd9p3tbd90qh2z
         GEvSHsiKbBS/di0bSiBCH3s79V//S4a7sIyDuQ4w3h1UJR5xK6bfAZwFwQJ0bt+wBegW
         rKFms0CD1XqYHWG/InGVWDwqDz0K+skmbLd9ZWyTx/IyXsQSF2J3dWiLl4u4U1/fOvbt
         gyrg==
X-Gm-Message-State: AOJu0Yx6gW31cS25120UA475nTv9P/CrdJzqEy0nmo5kZ0Ec05a0n7o4
	qvVCepznbU4qnD2ayyivN0rUZVemnE06CjNiTmfNhQlVToDOWsvPLGTr
X-Gm-Gg: Acq92OFTOVkV+iPEtv+wGZq6ki9vv9FU5yJmqNObw2QC285evfPbXsQTCeNMRopgzmt
	q5TfAlrwfTWyuEFk0vYQeFZ6GBSGlHEjYCXavdGYVEOeq4h+NE7rTr4s9Q45BfQLHQvJHZwEqAy
	dUYwVnZzMl9+f0IXFZ0JE3yXY6b+6rPZawkcWXGHnen0ZS4AdIsGMNnKKqxbrHXusPJq5YDnnHe
	QkWQjyEDKa9SPpfzsywvGkwV1SJ4frkN9PpRRvF7ub8Uuwl+I+LZattg+2hFKyst9Rv6aM2BmCM
	MOol7ApkH0PunFj8fdpyLrL888my3UDT5j+ZihWR1a3cad0r9Yq6OxAkQnp3ek3Xy3KVvEL9tgA
	XMXVeseWUIbWkiE0XPxD5+ypmy90LJMUMhqji638nR5TrgcJ8kQ9VaqExzmEx2JhxyMXzz2om81
	h4MJgts+ZGb6f+IgRvCmuMG/9A0A==
X-Received: by 2002:a05:690c:4d44:b0:7bd:4792:66ef with SMTP id 00721157ae682-7c6dc7b21b1mr47195157b3.42.1778707564477;
        Wed, 13 May 2026 14:26:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:33 +0300
Subject: [PATCH v7 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-4-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
X-Rspamd-Queue-Id: 6FA4E53B05E
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
	TAGGED_FROM(0.00)[bounces-61544-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
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
X-Rspamd-Action: no action

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


