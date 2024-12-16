Return-Path: <linux-media+bounces-23513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5859F3D88
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC03B1888693
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601E21D8A0D;
	Mon, 16 Dec 2024 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6XSv0pb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607F45D8F0;
	Mon, 16 Dec 2024 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388240; cv=none; b=Y5UbCU+5PRNsRq1xGrEytvkHg7fjz9lj3VogMh7JcohyO0KlXViBsmLAQKjtMzcq4sC0NsNZ2oERI2Ex4tox/NsgTyq4dxUW+TptDyGZMZijf1p7uCMrz7Mr9LbCdKjLSavzxJS1Sqt4lGr8AJDTLQG2SfbQg4TOu+97zoQu+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388240; c=relaxed/simple;
	bh=j1nmSz4h9xbZuxtFBuqrqJx2eZckGLAAhtREhszTjdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hripM+my9WAdRcrxO6xqrUvfwPPfIEgdnMLhfPIVJ3vPBiTUQXNzbxa88vdEPtak6vmzoIQSAW+Ka2v233Hd0JC4qjbXFa5jHViLPXFYUqAcF/DDoACz3ZHF3A0PjZmlNipSFUckh//5mtxGS1lrXTC4WqNp6BMMguycXEV4eaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6XSv0pb; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844ce213af6so155162139f.1;
        Mon, 16 Dec 2024 14:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734388238; x=1734993038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LumiF4eO+NG7cdcWuV/5Rou+YqcDG+HnDje6/Mwwnx4=;
        b=C6XSv0pbY1b3eX9lt5eD47CwFUkl7S21A7AY0D/xUF4fZc0JrBe6+Be/ejQ+1QetiF
         8DBGgAag34c1QQge0yO7uZNasJmTCy+97y2nqnZGULsBzLPPTyEt86H8VLAQDz1hf3Hj
         QBQCswI+2J16ERyGgUwy3Mq8O74nnXL6wIJxiRqqVoGlX6l8+l7y2gYCPCFHG1LKPvMT
         c5sywxJGJ4i/917Nn4sazVwazdeUF7ow69sEl6X7vnCVNo/fNiIjqLJfzTvhbWYTa3SD
         tjihewr5uqBsi0rr5hJfRbVbBZ1dpUhyZBsc/6GhwNI9SJTRuJFBdsKUT5eIF/ZY5cpZ
         /KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388238; x=1734993038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LumiF4eO+NG7cdcWuV/5Rou+YqcDG+HnDje6/Mwwnx4=;
        b=i1whqrvg0Ufi4cfmVPW+abRIcCk2X2IiuB0O/i1pPg+B3Xn2LOncGp1pJzWp7BsCQR
         YEJ2SsDPQBzg+WqYxJ4CRrwSkdfwMiNRaLb10NYvFf1C5sTCCWCIb1xQRTC949mSlGwL
         vQBCjop7wO21EuoUJz7U7+TehclBol1w5sycOrdmVxbPCYvObAoxZL0il62m2ImDADdz
         WhDqrVRVWOsajteSR89Fxdxc/u7gYJsN965QZ6cnX6dX51urNT4o9B+2+ZX2U4zJv9RH
         AvnPUC8cd7mr/bwpyYz0JmoRPhYiXSwhdNN3sBmMAdl2kFVhgvbGlQqs+GoSsRJtNp4j
         m1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU8YlxVO1imM7fZpDJ1DUCp64v/6iV8U2iR2mw58IVJUuxA3IECjadHMD0IvYodRoSNKwsbL8c7KzQEKjXMeg==@vger.kernel.org, AJvYcCW4AT9Qqx8szHFtWveQ8W5TyIrA71HOSXG114KAn+ui98o5HLGVnl5kjg4yoslDQySq5pd9GXMGZD67@vger.kernel.org, AJvYcCWjymLz2idqWVxrdLuYr07/ffZESiTwJ6KFsggEM+zUaavXWV92RFzSO3/kZl7cYfkTTXrUxSXTnf53@vger.kernel.org, AJvYcCX3q5mUsUv3ZRXBO/kKqC+bZU+L9Ji1fd5CPgBztEYmQUs97WlN1filG3AbTvhy0lPc5pIVqCgBw4WGnu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XqjXQ2Lhxsln/5xCCJPMPodLZ02inFMFYadfqpb2sn1Ixpvt
	f1A03sCz2+0gI+lXLv2ZI5ZBXJlVb48XQPYXRzAtxJZn1kjtHLZLoueB7vLp
X-Gm-Gg: ASbGncsw73uUbn6EKCzoD/d4MpeRGZUDC2En3VwxEtBujxCPh+UuaaFSVEiqQeEsvZQ
	WznPQcsSLxqAMszZlAPuxdLSQiVgDt/iCOiXCUrd/wOJZhn0HHosUcTMxu9WbU4Mr+3RbncLMfd
	keo6ZN2XhWtq0NJZxUtyFVZdSwXaMslUzb4MFcVFxoCJsXsZfPS7uAxVe9+TvdcGZ5owLS0js1s
	3UHHtdzDg1Uvo99yo0QKbuKUrSeYd7no99PVVyUdlzQ
X-Google-Smtp-Source: AGHT+IFJ0zxweZtV4BUdI65ENjg0CAhLMFsEaAIVI8x1QLfLKS6Ods/5TZFSAOVbhNAB5xHYi/+Mug==
X-Received: by 2002:a05:6602:1603:b0:843:eca9:a050 with SMTP id ca18e2360f4ac-844e880ffc0mr1229590639f.1.1734388238501;
        Mon, 16 Dec 2024 14:30:38 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::d916])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f629270asm149168839f.25.2024.12.16.14.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:30:37 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 1/5] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
Date: Mon, 16 Dec 2024 17:30:22 -0500
Message-ID: <20241216223019.70155-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216223019.70155-8-mailingradian@gmail.com>
References: <20241216223019.70155-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clocks on SDM670 and SDM845 have no significant differences
that would require a change in the clock controller driver. The only
difference is the clock frequency at each level of the power domains,
which is not specified in the clock driver. There should still be a
compatible specific to the SoC, so add the compatible for SDM670 with
the SDM845 compatible as fallback.

Link: https://android.googlesource.com/kernel/msm/+/d4dc50c0a9291bd99895d4844f973421c047d267/drivers/clk/qcom/camcc-sdm845.c#2048
Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
Link: https://lore.kernel.org/linux-arm-msm/7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sdm845-camcc.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index 810b852ae371..fa95c3a1ba3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -20,7 +20,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sdm845-camcc
+    oneOf:
+      - items:
+          - const: qcom,sdm670-camcc
+          - const: qcom,sdm845-camcc
+      - const: qcom,sdm845-camcc
 
   clocks:
     items:
-- 
2.47.1


