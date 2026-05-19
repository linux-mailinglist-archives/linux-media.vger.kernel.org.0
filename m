Return-Path: <linux-media+bounces-62161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xLIRMKiADGprigUAu9opvQ
	(envelope-from <linux-media+bounces-62161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:24:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602D5815EA
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 215303121882
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4228403E87;
	Tue, 19 May 2026 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfYX0kYW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC24028F2
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203632; cv=none; b=jbWAIv7Bj7VCSjfVDurbNPLsWZPTi5PZUnLBlEXHcZHt6MNyUA2DRLxtm/hf2PDk6NfO+roxfUknrut1YUBXayIEmKPXT9VYUn2Yfq3OaYKTq0E+mVJhFz+FW+1dIAMjH8nLTs92ts8dSPSEVJViYk3GGtz2jusqwoWRPEuUVEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203632; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tou0K5rttkXGM90XqnBo6QaWtEuL2tBoHBksMQuKzdw+2Thb39lzSRAYWd1ZzO1atrn35MjOWsdEeRQbRPVXjwDOyEAxzk8NM/ARuWA363H+b4kKJ+tB8UtAPwe4C1S5ZqvZlnXQfwLa2M4iYexGAuuGTQyHJ9um3fp20hTck1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfYX0kYW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso6466341a12.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203627; x=1779808427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=mfYX0kYWGAGHja1hXI5OLOgYj1OQk++tMmd0JiTSMXFa3ipin+LIVMe6e0gHdMMm3h
         fnP1qEat6X9Qo7I6dkypZ7M88rPZW12utguonExVUYK5MBfOj/aFSj+cO4gu9CD26JMy
         1TAmOEmKKROY0pd1uPweLNi1OgL2WixWPWH5EEj2fExxgWrdFv4uofyGRvUlJthnGldP
         z+ruEGdbw+TE6n0kV2kXZ1H35loTcxfhUSO70w0bfbI0UtktQxy/BCbgIiYXiNfU+JR/
         S6Zq9nPfznw9mMQNoaPCMyBC8glyaZ7ZPsvkvUs7gcSNT708imkR0X6yFTvQhaw9mZK7
         3Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203627; x=1779808427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=mxXcJowTA3i5J5YHRHFWQHKWaahU2sd4TN9/6ks6pR7/voM7ByA2Eu3xdbXWar1Xh2
         92xQ+iTAVJSy8yNKhh4WwPg1ZUfSXOQ42FgnL9Z0X+bIIBJ9cnwSIdJFs2W95oMlpmql
         IxLcLsATvcn9+6xRZyKAz5CmAmFaH8TH3QG3UlFYosyPvj9dDmZc3vzdbidYALNdBlTu
         +v7zgaen/Vjij20IU6JowHRyhEA5h1hfj+dWxw0uJEkBXNkKvz4BR5rZfNXaStxKJh4X
         anS8Q8Jeiy1fhWqSDQHHUC3No2fdMC4BtHmJ9DqbRl+15IkyVQTrWoFccxBzH2zBP1ni
         2TcQ==
X-Gm-Message-State: AOJu0YyrDf2PS79O5LShmsklSByf6h/e7mbfpYfJZMxXzDqTsfgLasai
	he7QTzURwrsCH9zu9V86RDjOyfzxg5eexhV2T45rkia+9ZdLcpHQNSO1
X-Gm-Gg: Acq92OFs7FxISV5JHEPT5ZvJ7w9Q8qdwhDJSwlwW2mn+p+KIYU+P2krkn/B/jleNHGY
	fej9j5PYWHcVv19At4YOnEu9h1MUNiA7aLjx4A9Sk8MO9LYyS/p5B6sEzhpYN4evyIrGFyxc4By
	22IxQ8cQx+/IrWWdx9+M9NvSwzQcvvvD2V7I5RidgvHXUOuT2lm2tyKfiS5egLHOluuYUCGL+4A
	YLo9GcPX4s/SnbOBzVwuN1pdZ4XncpAyvxyUB15NTS++egePg/eo62OcpJ2RzAxeMvO+fz/bsUw
	3aZuBdQR5C2vo3HiZewr8+8iRIJgqBDGRq+yjyvo576sxUTBIZ+2TW0p083Ea4+3x0V8jnYRFmH
	FKcw1+6391ixtgWtXWAKnKZgSUa9e1jeAljNHKDtAtb7tZEQVl1gnG1QWnVjfhHy7AejKP/cgyu
	jTzh6Ep6fceXJYVSz3gvVwIK9cQQ==
X-Received: by 2002:a17:907:8b8e:b0:bd5:7c2:7622 with SMTP id a640c23a62f3a-bd517aa9716mr1183183366b.49.1779203626813;
        Tue, 19 May 2026 08:13:46 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:44 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:52 +0300
Subject: [PATCH v8 7/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-7-542ec7557ebc@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62161-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,1d00000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2602D5815EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


