Return-Path: <linux-media+bounces-62799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDaEBpmjFWprWwcAu9opvQ
	(envelope-from <linux-media+bounces-62799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:43:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6585D6BEF
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95CB630D22B6
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8EA3FB7E1;
	Tue, 26 May 2026 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaFpYZiY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DC63FCB06
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802319; cv=none; b=MA1QIpDTICEoO51B/l+AfEF0L9nV4JURfVSbie9gjtf4tVOKuG3PtyLDY0Fv2T3imk3+01/9FNBgt+UsSAxU6OYWZ9wRO70wHC0U1qtsmlqrMCBn53gua43l4f24VbnJ2/O6DeMSgkNoAsXiw5GpT8GLDmJ7/q47u8Vcpnf0Nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802319; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xc7yXC6Ky3RoalpDCJliOoMD0oXxWBBiGPBQemhS68Vy4+d1ep3/MHe1MPmyzLaO3J8YckC11mflkARi68jdI4O6y9Hm00n4aXfu6DFoMkfUSLJZnVwnmswdMz174hToJIrvfsfCsNgTTUg7Rc/eMErUMpQf7+RMdb3VPTTXFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaFpYZiY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so50519945e9.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802308; x=1780407108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=FaFpYZiYG8kkPPU8xAUK0V1ai0Yrr41pASF/JQ+2Ywq7KfHjbjK9CWyTrczbjy04Pt
         DLq8Oxg1534SpO1GC5aMMNMIE90jX6JvXqHP0+eoBA6H0HoMaBX7pvW/nUrar+YKMtYc
         iPbwNUPNemE6g1gJ6YVrQ1iyYXdu7JfafFLgfJtrFy6NhgiQUZR81y+1y3087PhFbqZW
         uXg9kNrku8POn98YwlSrcaKysrobJ+7YKFMZej+oyHkY8u7+fi6xBbhiW6jDJjmzRHmk
         0iKD8hVITO3N1AEOM5nILjyAemFyrbZiVwyTe5OVvNSLuyx2+XAdcPQOVIvWTOkHgIT8
         ixWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802308; x=1780407108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=RXxpn9j6nx2XHgW7x/ymDpZznFlGDItKF0ImCEUvLrbXgy5j8hEaR8DzMk0222eAzD
         eASEJHv8ZnS+uZMJkhdTgacSNPWug8ZDzkAlPa7klAOCbZrHODVt71FVBekNk3xYxn6a
         GSQyQ2tOxhsGR28GyBfBS3UVHgXT+pPVTNl+yxgJE3OROOHYhFVhDGAV5dDRljrHaxjH
         1YlefvPJ22jHTyEvYSB95vwHUVogzyBMHVQ69ouRjxE0n85dcigBSye7DkJKEPOt2Cci
         vlwTgfzKrzqfBsoewUk4wIJ/11IUqv5NZrtyRXd4s/v8kik9gR1Np/VYV0pC2Xy26npB
         cv4g==
X-Gm-Message-State: AOJu0YzVFPZiThKqqmhPedSuP126p5Iw9FaCzBRwNpjlNZhC4JEYM74b
	WLLdgRnXvqUgiabJBwFh2Md96zcQ4Ho4H/FN95oYTDaAzth1dHgUJUx/
X-Gm-Gg: Acq92OH7t+C4hxHClj6O9CFQcKbXrHbsxJs9FOnJbgMM7KG9Klnp/ngZnBDiSJ3eCmy
	yT80LzL7c0Pwzne+58+Vh/+Omg8sLfy7EGpsR1Fv19bvFLUKKLUY5vY6wFpDSKK1Mx4VaUdgw9e
	XaYuTU1/rNpgyLiUbwGM0UuKUMlk6yjATzBLnqgSXHru0byXqs9SJYyAH3Xr7o23BUSP6ZpGZrU
	QQaTnr+UmbZYDmKemIXrmVTNKn9G8mJtGtj9FSSvSdEMCq6GRISk0AUIEHhooXJHsP28y5MdUAR
	5BuIxXBNASSE5cqEbeAgqByOAbAD2oWXBu9dZX8CJPFcwWkhmS6VlGqoWrTLkmrLLE/UCZSDAwr
	JbqXjEdKUfCbktobuq7cqnWVaxUScW5Z5zG/fa3afD3ro4/qGChPqy0WcsMlWkbx6Is7CdayIZ/
	R2GTL5Crmha4CWBvVGH/NmV/51UA==
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr262860365e9.16.1779802307589;
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:31 +0300
Subject: [PATCH v9 8/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-8-bb1069f3fe02@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62799-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 6B6585D6BEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


