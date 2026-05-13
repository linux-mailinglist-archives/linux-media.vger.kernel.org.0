Return-Path: <linux-media+bounces-61543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEsnFoHsBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:26:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7353AFA7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F646302C3B8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6663B8D7E;
	Wed, 13 May 2026 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUM4QVRs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6123B635F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707564; cv=none; b=itG0kCpjOBFT4+IcLBWxXMKMMPBBqxt3Zf+F1Dfjlf2ImZ/2mgniBAA5+C6BBVs5krUe4ye/DG/wP3mjHDJZGKHUUC9Cn7zyLH2sLxAFNBFkK0bIeLYuesHkHhT4Wv+Jharz6OCYxfKQDgNePmmgu+nyVCBccOuIAANsOFTiX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707564; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smaBFn91B66Kz0uU2lgUWoqtWnm9lFaxOhIBESj9UG/c/jacsR6t4B6jeK9VKb1FFVqo4SAb1Zd76yobzHURjTY6FKwde4Yv5fhkEyxdkeMWH5H9wHUtGrKhKkdZsKv57luBAnPw04iUGZYG7KrZTrKQpDk5sqBO6K45h3VO0UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUM4QVRs; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64d5a7926cfso7249887d50.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707560; x=1779312360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=AUM4QVRswER92qtwHjyQVmWKTlEtgvxT6ShGu4rdeSHpmeGX6cBGhPwtBRS+u9m6AE
         otpzzCLfv933N15iuYZBTlKhJL8zMwVlFSqP2lbNeEbwDjYx4m51N82dFtxk3egp4+TD
         k03QJyEfKVAs7D/udCEJoqwtjQxMBIeB7IFe8DXXCfX26nfb85GIciN4jheLI742UlDv
         871ouuC1SgN4KCrgj3JKKtUAqBRlHZDG9ZpDpqbtbBnodxs5dlIwipEiVDal0BLzMp44
         IhID0j9Rw1LyzmkLfJHINa8xX7ghS6eAYhUkrRnXmMlNGJT6Wpv++BzyzmCkBl3PhGxS
         /VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707560; x=1779312360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=U+jBvKZwxqOVgo9jyAcACrgvzh8NfdbjvZTydudIn5YdqbOal9eJ5MzQuWaUwizaN/
         LKFCe0RjvTfPEFj+OoozouQLfMEuTZYLszL+lsTpckteejrWAxcIMWxGK+0+IDc3wuAJ
         8a18KREDz29l+Pph2No2S7LkFlIf8xHkgdY3fjieeKqwJ04LekK6WkVqxgolsEAOf0jQ
         QWSVirIFeDQrDdwTRfmOAW3rtqD0x7ED+4rSf555mf11O0hQp2tZrZcW01ZqVdy8Kcr1
         MwoeiErFa5K0TrzhRVK+kfPGJYZojhsH3gnQ3HJ7NDYiaqMW/MgMOIi8o4ScQX6dTFy+
         aR0A==
X-Gm-Message-State: AOJu0YwIF3E7FvddmXQqyB5y68mpx2uB4aTQ8Vuzt6aeT/1KQolRpQ00
	lxBZ0Hpxu/PgnPGk1FpTNkUzD0NSY9vtfWHAARN37yhDCExIt9X6eF/e
X-Gm-Gg: Acq92OFLm/EPAR6FLzLdfefEnAQtgAX2PvGLqrBOLbBOOTU4+IpjF6583eufjS1fG91
	5al57jSPsm9BIQWxjEQjR69viPRhn3erkv4GUM9kNRx8RGTaxM4LR5QuiEo2aQXb6sxmrDKQ2/n
	OrU+CRnqGEuKgD/PGFgJtybtrtbC7iYIVRImG1uTAbcQC0v153uzxxW2alrFAYWGNuJuUXttwmi
	RwWbgeJOSUg72Fc947V2C5lHRajViZJFZDIULcGBCkxLn9Cy/ynv9K0BcpfupFg+/PrSVEZFTHk
	UX5aAP8hUvht3vYO6K/Wc0ppMWgN66YCHA+KWdXMXRRPlDxuIP6l0h3QT7QVa0si83l7vxwpDMD
	U4AFMwLkRUwWkXzj75sDh5UYKM7N3oof1DwfM59khufzYRy/bukEgJHfk9Rtl42oskCXb16s19r
	aTXwcwv8tN98PZ6Pjwu6BHYujeQw==
X-Received: by 2002:a05:690c:ed3:b0:7c0:e1ab:87fb with SMTP id 00721157ae682-7c6da11a9e5mr45927147b3.12.1778707560454;
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:32 +0300
Subject: [PATCH v7 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-3-33c6c6fb9285@gmail.com>
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
X-Rspamd-Queue-Id: 61D7353AFA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61543-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,apitzsch.eu:email]
X-Rspamd-Action: no action

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


