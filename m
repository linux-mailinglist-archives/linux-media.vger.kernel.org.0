Return-Path: <linux-media+bounces-52843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICuDO/rbkmn3zAEAu9opvQ
	(envelope-from <linux-media+bounces-52843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:57:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798B141BC9
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47C043001FE4
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 08:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0530C28640C;
	Mon, 16 Feb 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="X8alXg+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B0281376
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232244; cv=none; b=Fw37RRUdzYuqYWDKrZp4rNBQ8t3g5drS11HWcW4w7HRLPngY2n/9YvJHt30SPTIzc6Z4r7qS+iTwNRpjqVclEnu4OeKDCFCflQQgHnpaLOEoeFyMaTAJ+Oi90WMgIDofGNwUxKK50WGSKNqAZht0nuaKO+BmXA/TE+BSKQAd0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232244; c=relaxed/simple;
	bh=yQZA7Muu+RPhM4ceHt5ok0QGV5J19GhHbbDuVsedxIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTScND2uOYoWmSBbyN18UwbnjiSKMfi17+gG9wTtvpQhOXNFjudCxYeJBh/KHnKlouOWU9cawjNRon05OekSeIciUFMTB6zbVqaKBUihSzwm0jm19efax8rIGzqqtWqe/r0KjFEJ06UJ4rjwQshivYAkvP4b94chVBQ37j3IyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=X8alXg+g; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so373825966b.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771232240; x=1771837040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STBcC3H9MWJKmZFqlxoU5+Er8LcD4qLuOBRUUuCCh94=;
        b=X8alXg+gXNeWdT3zwgG4qhiQ9KBxIg+8WJD3E0UrKA4NqbH8pjGSQzDD2NLLb+TEQR
         b7k5hc4WP6/Ayj5A44znhdUHppBZg05hK7fOShnVGUdbyKlG769Fms+bqMed/mJnD766
         mt9K+DJOmmySDrs9X949zhtLOb0/BnNI1WqNsifvYkpQTv7MHC+iQM31b0Fysy+ib+Z4
         BWjY0G9K+IUBp0N367Ge/2ygG7qf7JtKDq2Kxg+iWyYLFtfSVkMxo06FF+W4P62xfs8h
         C4ELf0K7BtHodJeW4PDsLpHhJqu2CoWV8w+CH3UgsuRcuvCHe0eytzvm50S1kE6CNaR0
         7Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232240; x=1771837040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=STBcC3H9MWJKmZFqlxoU5+Er8LcD4qLuOBRUUuCCh94=;
        b=xSwrywFi/A9IqBhcoBB3g94VdTBBV6peu4zmik9seJbQVX/JvRfM1MvCDF9N+KYGJN
         UXsSKtexD3yk20vJ2DIkqyamlnN0IZ/+VhTnbX3hDeBPrzI7XIrQsoXud5B+ow9Pzdsb
         EWLCeo8SsT6OtH4B58eMWDI6Jk5VQHQHTFZ5u9xTkp9nrZVUM55K8iag+WpH7Ymr/unx
         BQJiENCBwBDE7dSRGXYotdY8SQUbmVxn5iT0CVC4Satkjw+35ZYpL5UNYXXmjoaZAkEL
         10cpDIpNLh9tHF+itJ5AEKeU60dEeMPx/JIOfJH6VzVnjXKXGVque2hBrFy7QQji1EYl
         sS3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW12BhM5EIA6VfKUml1FKkQhhyBtKenSF3xiND7Ymsk0hDd6LG5y5Aq8p/DfyZ5TTB9lldVMuj7+GXZjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJqsW7T/8Y3tGRKoCgqxsXbBBf6yrpoDsXsiPEpQhSMPidZ02
	hgLb96v9iK+eNwNqqwU03S/2DaHfn0XznU1gM3CV+ntzvcSWq7+p+yMsK2ypldfIp+g=
X-Gm-Gg: AZuq6aIPojD8P7xJNTLVOaUtkxvvoVFm6f4wJlaBZZHcsh8bHm6UD3rtAr1Gzjh3DAG
	XCmPC6rRwdZfkEYJ17ZQHyn3eea+kzBuQoFsoNtzVJzyExZ5MvQlwm9EnQWmjtNKFhH85l/Q2pT
	BJxSHK651Ev19+AlwVl9Zx+Injq/AVI2vqPf5ZVZ31zxuPyq/RFIeB7/nky7oO/EDNA8G3HG/yn
	oSyJI64wVZegL6V+RgQ1KPWHvzw+l+AwpFuIHSLc0V0dmDX7q4m3GwXvuIB45QIqWpm1ENuieuG
	AL03AwTnRklpYVkXVW3ObsJHx5gQhncu9N3w4C4G60eH3Mr2whpSnQWbg1/xkrCvcrMvDdEcdmz
	zuHGhUaW9w6rFwVWxwPfV2+xzzaIwes+usgFjDiAyi0ntgNnzzrEixwoM2m4BttHlM4aSkWU3mu
	xOeH15+bjv+tA4y4F5JtMVjE2tsiPR280ayF8XyrKeLAbXsNzNC3zF5VTcIs2Jyw/65Q0JF/bJc
	I7ypw==
X-Received: by 2002:a17:907:1c28:b0:b8d:be68:bc24 with SMTP id a640c23a62f3a-b8fb4195e62mr524863666b.11.1771232239711;
        Mon, 16 Feb 2026 00:57:19 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769437bsm236867966b.61.2026.02.16.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:57:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 16 Feb 2026 09:54:20 +0100
Subject: [PATCH v4 2/3] media: qcom: camss: Add SM6350 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
In-Reply-To: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771232235; l=16255;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yQZA7Muu+RPhM4ceHt5ok0QGV5J19GhHbbDuVsedxIo=;
 b=oRGfm1Vp8/k6T4Piqpo8ODPgt2Z9N+WXyBw16ZbZaaht4Mi47ggs6pa9Ul9M6ijJ1UYK5gDRP
 O1k+IaTsLfXA/WuNOm71nDCNRUZtQRKzC3k7BLBmZBHKF5x+UoTWfxN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52843-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9798B141BC9
X-Rspamd-Action: no action

Add the necessary support for CAMSS on the SM6350 SoC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 261 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 389 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 415483274552..dac8d2ecf799 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -399,6 +399,126 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.2.3 2PH */
+static const struct
+csiphy_lane_regs lane_regs_sm6350[] = {
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0910, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0900, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0908, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x005c, 0xc0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0x0d, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c80, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c88, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0a04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0a10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0a00, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0a08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0a04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x023c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x025c, 0xc0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0260, 0x0d, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0b04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0b10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0b00, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0b08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0b04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x045c, 0xc0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0x0d, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c00, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x063c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x065c, 0xc0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0660, 0x0d, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+};
+
 /* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_qcm2290[] = {
@@ -1011,6 +1131,7 @@ static bool csiphy_is_gen2(u32 version)
 	switch (version) {
 	case CAMSS_2290:
 	case CAMSS_6150:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1105,6 +1226,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
 		break;
+	case CAMSS_6350:
+		regs->lane_regs = &lane_regs_sm6350[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5baf0e3d4bc4..7dc937d018f6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -343,6 +343,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_660:
 	case CAMSS_2290:
 	case CAMSS_6150:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -2003,6 +2004,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_6150:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd..b53fb94ab54a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1703,6 +1703,253 @@ static const struct resources_icc icc_res_sm6150[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_sm6350[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy0-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy1-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy2-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 80000 },
+			{ .supply = "vdd-csiphy3-1p25", .init_load_uA = 80000 },
+		},
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_sm6350[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite" },
+		.interrupt = { "csid_lite" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_sm6350[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe0",
+			   "vfe0_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe1",
+			   "vfe1_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe2",
+			   "vfe2_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "camnoc_axi", "vfe_lite",
+			   "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm6350[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -5233,6 +5480,19 @@ static const struct camss_resources sm6150_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm6150),
 };
 
+static const struct camss_resources sm6350_resources = {
+	.version = CAMSS_6350,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_sm6350,
+	.csid_res = csid_res_sm6350,
+	.vfe_res = vfe_res_sm6350,
+	.icc_res = icc_res_sm6350,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm6350),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sm6350),
+	.csid_num = ARRAY_SIZE(csid_res_sm6350),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm6350),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -5329,6 +5589,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
+	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919..d323c105d185 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -81,6 +81,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_2290,
 	CAMSS_6150,
+	CAMSS_6350,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x39,

-- 
2.53.0


