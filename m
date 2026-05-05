Return-Path: <linux-media+bounces-60488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BO1ICJm+mmnOgMAu9opvQ
	(envelope-from <linux-media+bounces-60488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:50:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF04D414C
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3BB030F8B1C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7449B345CB2;
	Tue,  5 May 2026 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNOfQYUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E03AEF3F
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017580; cv=none; b=niAScJJ82j7tZ1ZY8bL1uVb8FOqs8O7r8qqHbm2oV1tPmxZrXJXoS4yReqfPFUqXdoFn4yyKA/99y/uMVNDf3UKNKVcmEmivVx4ANspCFKOCz42MX5b8sMMVz5WdHdX0a2RuBvI8l7zCz4oNxzNriuuboPvI/3bGosChUDq7PGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017580; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKV5FzBgMklLUV+/8vy7Y/zPmgdA2XOH+z1/VQMSQ+iNAzWOWfa0JQRWScgr1SIvHpMXa2B6q7wg/FR2su2C2xpZPP0WFQ+Tntv+s9A6FEY43xi2anad5d5IOICnTpaRG2G5vFCPw+n3ggTnmK//D/F5+NNINa31GVCQm0ZdkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNOfQYUG; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bdc947aa88so9080827b3.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017579; x=1778622379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=oNOfQYUGlkdShswceSkeqF7C0jATaSb/VNCd4PK1bFq5KhY5U1iEdnZMGRcmyTMpZO
         7badLoPgphqJccfEvdu9C6gAhznj37ZmkO9HM13q0MNYI88Hd2SKlsr8YsiC0SeSsRNS
         Yymz2d0fiTqCMaUUP/bY933ybZ5PXBOV9fAj6kLomlft+NfE2sy29enuDJbsG2Er9MUf
         X/JScuRIZVMk5FOzvkLSqdf4j8ln8WWiPBENYv0uPQNUc7+EI84St5nDGcfyIIfTzuqj
         P4xaXpvDNvdZCTPJrmuMTokK7maru5LdLgeE2smnvpnsuffYTujM15RnGkKY1x9N/v4z
         bUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017579; x=1778622379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=ZmRkti2kFUnNlC3WTtkdUPR6PoRJcHLgCRnCRiZuIZ4kGxynVG7OZFFDvmdrzA6nRt
         gIKUwIXXC9hMzPDcP/ADTF03JYl9iTQKIILTWzOUOEUnA+hNBwKEiXki9UDFFDiRhAc+
         sqehZ9tfhTSI6hsAzx+QrtnVPYjBn1K3IdYDYyuv28yQ8JeK4Dc2vmm1gynNuWSbXHjp
         ePO+0P/PPiT9TtZfHPxYI4CKeq2jb7QwbxeqWM8trJVJYrGe0SDQU/BvfsqulJ1hgYZw
         lW8RkUA9jAagS6FdCmiVoZC9+/On/Lt92Gne+CgyxEk5O19yOOnGguDSU5WKFP0SPkRz
         zy1w==
X-Gm-Message-State: AOJu0YyAV41LT8tOnUMgdPLL49/3Ua0TGY7It0CtKH2PfgFo/jQV70UG
	omkOxP6eV/l1o/2fnw5JdW73f2tv6kftqEOp2b9NwYaTU5rtwm9ovxTn
X-Gm-Gg: AeBDievybrDTtWNTFtUkRDO0H+zj+lLHc1OQoRb5KqOrlUlJwUDW/AQfQcUJcsyXjrj
	P0gPkaDoMxb8TTOYox94EUd65GIFsn54NyQvN6FxLp82rL7TOORMR0jhQpV51VP6TR1S1tL04bu
	XKV7ZqXenMjMGDHEuWv+9Teh4HfbY3TdEd4udUBRNscAh3lraMkHGfoKmYBkkYw/kI/osP6z99w
	CmEd2Y1WJfCDFVtFLc01GMVqz9ZkEYCiAh3xwXxOYj8firjnPJ3+ayGtAwqJWaSh2oIThfH96P0
	BgIX84l9mDVhPlWmMaN4Qw3qPyIr1PDDMlDlMnWbRqNkqKQl5HTIH5LEoC0Xx8qMdlMXFQBhPaV
	EtF1C5/lYJSHwFQmdXJfO3h0Wm5gZRZV2kkU+GQGuFZ6mz+7RfEWO/Jsj4gpcxnrE8EhJ2DCHXw
	lpHAM3r9SjgUjpC+mTxd6hWV4kzNGx7RhCkuq2
X-Received: by 2002:a05:690c:b9b:b0:7bd:a50c:454c with SMTP id 00721157ae682-7bdf5e032e2mr12769457b3.19.1778017578724;
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:43 +0300
Subject: [PATCH v4 6/9] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-6-994f5eb22acb@gmail.com>
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
X-Rspamd-Queue-Id: EDAF04D414C
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
	TAGGED_FROM(0.00)[bounces-60488-lists,linux-media=lfdr.de];
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


