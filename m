Return-Path: <linux-media+bounces-60752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMHJG/RP/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:40:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F44E4F81
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10CA430F153A
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCA337186A;
	Thu,  7 May 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwoG1hsS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF737649E
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142839; cv=none; b=EuqvhjUXe2V235KsCfItWT3QBNTJXR6Bzv8h9MxZjIjFUEeCWsuzT6WTLH2ntvz/X1eZ7Q+k74kukQVD3wXA2xGYfTCBT8u559cYyH9kBk/hvSbewOe6PhZR7KJHBRapwx3DOknU+qUKjkLo8JV4hF7G+mqMO4u/auTO3iuX/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142839; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lbw1OE4Cv/djvHvnCiI2xmg6xTRL/046UP5HOGzxoz50UMsXkWfm5+sOzka4O+2DoSYvYtC9LMGXDcz2o21j026JmbgkSWq0O/JaTAVKxf0pHKoGpVYhRdVZ960YqxaWPfUgl35j6bQWESLiVozrm88voP+DrATmIR0/wRHI5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwoG1hsS; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7982c3b7da9so4641877b3.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142834; x=1778747634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=RwoG1hsSRhinX+dYNPOsRm0FVWfUthen9uk6CI8nlMdec/tM2wUmIlUYiOqt736F02
         ZHn/GNr//7AsdT5G2Z2VqLzJzHzrR1qVkt4ygynyLcPglQpJnfzLaAhnkmIoM8INBDFk
         ce8HFNj09XXGJelNbFyCVK2H4tbiVQGU742DTmd3oTo8uyBiWGU8lzR9uBY7w1MDyHlA
         Hl7gAKKaD+pKlNkkYZDL2IqQhKTbQ95AsbjDZJIE3Yk0IcRaYF3ne9xHMMfI/vna4BiU
         4aZHT+VzbviX4tm6PXlgwuV6+NdRxYF17Zt5tYYxvlv4Jl+qCTAHCOOjUNTPzPyezb/O
         IZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142834; x=1778747634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=MoOzmbiKimsoYyL3Kk3NmBapLdrsDskBNgvsegO/cf1e1URkee/wbfl3r3c7GGI2Nn
         Z/dm5DB+b01FCaUemruD6dNvw3L7RQjFadFZg1Bzky+gROX7MpyesIfrd7wTvaylZxvg
         TSea/KszQZRAHE9vyERjHPB92LZrIrGoOM0lyaKj/orZcpNC6+ScTvm6En/dj2u6Fuo2
         J59YlaLQd+PqJ+MkGJNL8IaAn+zvmFe7+seUspQPNkRkNqu2YLD3SOmjfNc50i75eKug
         hhE8WcZu6N4c8QGnYYRSyNBJghwOLIOt3bhl0bxMFG/1VLhzH5zeGfDCfTwR03rmbADb
         yxsg==
X-Gm-Message-State: AOJu0Yx1mRZPrO44yVIuf+5b+kVHMbn4Q/uWDhfQrRRVLXgCcR1rV9Iw
	XdQHgVPY5ZaXZZxmOJqfUKSi5slufyvMf8rXd3Xw3PIGTrFefGnbXas4
X-Gm-Gg: AeBDiesyhP5wF574qiKGfc77okYvovog2ONvgxh70JoLf7N3Hv9cdxTKkSy6s5k3PKn
	cXUuAkKzbjIMYBge+sM5wlJYZ1XWy8OjNB3dDpyeJzdG60DwrbpqAXs+WqAelwlzVw9piQDMmLW
	Ki/gDNmYUXG7Y/EcohlcSCgEfgRNol3d4VaeJNvX8+7enGUOEw9Cf0HCi3C2i1HK8kA2Ubd3pix
	svN50xLm1z6E0YarGloPKAoDDI9JBuK83DEE2CEffYSa3AtgPjMJAIz4NPkYmv1d3WWv+mKZD2B
	zeDGwoLKD4922r/exloWm2kaJ0mI8Th5KZfmFw4+ZlGLNSPL7jLXdOkEW2PBPrc4kFvfBvr16sL
	49zHnrUKdvvM96wDEtq2bckQX0hcz91J0z6zXBzzdyCnnyjO3jf9lMBgHte9nH0xDx7+uVet4TO
	MoRPYTBYLr4awborUEer4/XYX3LcEK3cECbTxD
X-Received: by 2002:a05:690c:ed5:b0:7b8:5f91:65b8 with SMTP id 00721157ae682-7bdf5d99133mr75100527b3.9.1778142834200;
        Thu, 07 May 2026 01:33:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:18 +0300
Subject: [PATCH v5 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-3-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
X-Rspamd-Queue-Id: AD1F44E4F81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-60752-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

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


