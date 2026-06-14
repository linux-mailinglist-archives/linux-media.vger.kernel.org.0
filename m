Return-Path: <linux-media+bounces-64796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RclBMAjALmqo2QQAu9opvQ
	(envelope-from <linux-media+bounces-64796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:51:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E95681519
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:51:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=Lsam92mS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64796-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64796-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F758300851D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 14:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBA93C76B9;
	Sun, 14 Jun 2026 14:51:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F33C37A5
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 14:51:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448700; cv=none; b=bWRCNL5Z20RTqLZJ5Sm72kE9EECjlzBPUiNr+cXhE8pJtTs4SGhsheXBQuzLg5Pf1uZwANTqtQXO77bcEYo8Gmy0mAHK/QsHYBdXaJyx2rG7SukZOZR0Uu9dZYLkjapeFjn8lM/aA0exeEnCm+we3WDYXq/hkoK3RpnmiyuDoO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448700; c=relaxed/simple;
	bh=Q0X/qpV6OiVig0rnFyHw8H0kYx8sjAI6G3zKCiw3d2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKkJM871iHPTmMobAjtxhewNvNj399hShmKESV7ydJCepmfP0Qft8zexhVNYw1GR5FG2QnOHRUxFtgpo5YYftzoL9mppmlUdvrbMLKqIb/ljiHLM9Vktq73B9rGtuCXFm8kMCtBZv5d/t0QYwvt6pJGLzkpdrCK8UZb0uuBHfm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=Lsam92mS; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0b944f6edso27003865ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781448696; x=1782053496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4soJXbEiJIWDYO1GkRrtkxYao7UqwnYefJpu0d9FEg=;
        b=Lsam92mSl0nTo27mMh8oeftkiUHTCHehN9A8aq09+rk5bHVEo15opw7svRzCmDkt24
         UjGovlhslnlsBpAdQ8iwWwCOPWZ4lyxcXIKsds+xqWe7jS4W4gpinyxc9lVbf2x2MF6W
         vly6y+DpFr2MoRn71Nse4kxd+RYGhgLIh/cAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448696; x=1782053496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4soJXbEiJIWDYO1GkRrtkxYao7UqwnYefJpu0d9FEg=;
        b=m/RYatWPTOcfaTkNe40819M0uXdNbFXLkk00VjGJO0JQkpsyPQg6U6LuIOiJ9hqR+u
         vOtS9a6ivu0z5TsyIlNm2Zdba37aCU+zSyQl9oSkPS/znGezHNZx/Avg+eevZgAvg8CV
         kBIAcx5E1Qxq6BoC2fPySfl0PDxVLWLrUIYkiD5Nsa76/z3pakOzcNR1sY+RiPMBxHXd
         nOHaGo+yrqyUpM66dJAM1soZ0MQX9ZLpUqkjmLoQE54t2WUJspx+mPvfG2lT4bpee2PH
         JSIOcKt+2ILvHLww/pOfanSnCNc5DZdSeOOebQjsvnIwGlCEzHt+rvdUtUjP6mflo6FV
         yJfA==
X-Forwarded-Encrypted: i=1; AFNElJ9v4pSfKYA6404Owt7Z8bkBQKftDKHlkc3aJuoqTltiDMH76zQxmf8LznhfBJldWigXLBxWK/u9oDbzFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Rsxe9Nd8FuVewFbDXuMIeLmZv3k8y4wPw8JRAEnv0EE3Leml
	hRfXXV2WD3iAI2mZlyjXsGs9YAj14PXgPoxxjrsLOTErxyKCaUIlWjjg4HmRgxc6e1I=
X-Gm-Gg: Acq92OF1UiMJksXN2NXOd21KPTdCHGsuMO9P2wW06R2MFvunrxPMwFlt23WF5LRNURg
	2z+is+DSIcOzyPPS1QOXys3yQWUIpAucakLv5qYh6sxI4aSvGEy4hsb+5OENu5W07hswOvToccI
	TT9Ww+P3fzNxaGlEroFgKdSFsYWuVoq3GO6ZaP+5EbgZro5B4IHq0MVWXvZPmNV7LmCuoz2cFZq
	MdWvzh6jscV9P6gstbsOD1NuzYS6EWR21UZNbv0M2dooy7VsgDcLSvu55B2n2HgOSWOH8iGfTZ2
	pimKvvbrPtsPy2pFP9uMwevVQcy8kMX67Qsu7iYHOfXtKIo/cEQ5h9lnX/SOU0Gp/Qby2d1EFs/
	meWIvlTe0P6wpAhWiQw2WsZymFgJUWAXVEQMKxch9vsIA936kLwpNowe/FBhRlf6zZVO1qELWIf
	eGZdwe6FIlcKtfxMufy/tiNB+esr+i3E5ww9OBE/cXoTAgUmpAihnbXalGG02Kd1JcHo8vsEn9k
	meNO3QdQUUumVGNsca+5NzKz2rVDgFFfFNzMUsdyI0lWQaaWs6Fp1Gc2m7MZaPVDMvmeT9FSlQu
	iPln75MjistP9YcY3MFNKrW5qwD2DLb2vt9jf5x45UNGJJyps3lM2WcAXtpvmQ==
X-Received: by 2002:a17:902:ebc7:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c664082585mr87995225ad.0.1781448696479;
        Sun, 14 Jun 2026 07:51:36 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acca5sm66746385ad.51.2026.06.14.07.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:51:36 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Daniel J Blueman <daniel@quora.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
Date: Sun, 14 Jun 2026 22:51:11 +0800
Message-ID: <20260614145113.84243-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64796-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel@quora.org,m:mchehab@kernel.org,m:stephan.gerhold@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[quora.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34E95681519

In addition to the firmware-loaded codec carveout, some Iris platforms
need to declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from IOVA ranges that earlier
firmware stages have already mapped through the SMMU.

Permit a second memory-region phandle for this purpose, and describe
the meaning of each entry so the ordering is unambiguous.

Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v2:
- drop redundant maxItems, keeping the items descriptions (Rob)
- add Fixes tag and Cc stable for the backport dependency
v1: https://lore.kernel.org/lkml/20260601041336.9497-1-daniel@quora.org/

 .../devicetree/bindings/media/qcom,sm8550-iris.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b5..5abcaee4101c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -80,7 +80,10 @@ properties:
   dma-coherent: true
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   operating-points-v2: true
 
-- 
2.53.0


