Return-Path: <linux-media+bounces-19370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A2999A90
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683D72853E4
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E260D1F473A;
	Fri, 11 Oct 2024 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS6f70Gc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE417BA9;
	Fri, 11 Oct 2024 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614258; cv=none; b=ijvkMyZXBsICCPzje4Sut+xzXNPeZKhcRpvk6JmV0D2WgSUf51KlN0rFRRcM1YPR0xPRQj5rqtsXxK4Z5tN4kzOWJ/Wkoqf9bHxvc6IxO/rB/KFJKPLgWNu3yO8QU/vJy0xHPXDB0pdH8j3f81HrILPU00lxxZDFvV/ZZphRQqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614258; c=relaxed/simple;
	bh=8lhdgPeFNdRxMQJrkBrFIQe368g3nhGpuoXWa83pmbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcyR8ovZdHxk1kxyTX40TDsmsHwCBmtZhvZzIuVtdSNJw9IOTqwWJBXEHlFMmlnszk3FoopdR2spZ3NmF0dInO2sMQnWX/d1kmoGHcfqUxWf6TJYl13QsI2QkREWpdp/MZBzCVyCpVaH3pfolOOak3coA6PvBJJssvqOKU8DvcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS6f70Gc; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b111e086e0so92669685a.0;
        Thu, 10 Oct 2024 19:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728614256; x=1729219056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SnnfKSH45WcECyzTIA3ELBtlq8aYQBuQ/JJ9N0zNs8=;
        b=kS6f70GcBMuwwag77DsYJwt05RgKZUxKs2/i+kOdX2Dpx6B/JXFspCvcFAXC0c8g+h
         5XpiwGXZJwYgFHdNesDBaoYpRjmRNTUWZMktcIM9h0e/6CiFoSaMy856UEFWm0lxTeuJ
         v2Q8UD48gLVgb1MJUxkRiKmARrUDneCIC7Vl+dkhR0zCnXU63Ro9Iw3esM7m2IBWeW06
         YqhrjyaNCZotk928sUD2QKBmyvl+IQsEY3D/Jf0RAX2NvVo70X+H/sLffgR8e9W/h8i5
         E8sI6qomS84UsUdd7r37bdQkhkl7DzTVDkA2qfDQ+jUx2L6iNjoBL6zYa73ol1A3IsGd
         Hdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728614256; x=1729219056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SnnfKSH45WcECyzTIA3ELBtlq8aYQBuQ/JJ9N0zNs8=;
        b=cvkjZ8JrrUyRhyMUr4ylm3ssX4rqeZG9cSRfFXX1ePqUXNXBare6STLWpivLi3R9cP
         Fw0NliNld+yDGu5f8nHyEoItFD7Lz74X5NWKhM3awFmB4U2N/0IJmnpIz98TloW/OTJa
         L3VZoLzy2L+XFltOZQC7KimisSADNnoXaUCwDjvtt/WvJoy9cWpw2D9Cj51cbC9TKUk8
         5UfmRgvbAaLnSsR8RvaAAKMIFfgU5+d0qJe4jq4GAAl0GuovtCp7o1vi0S70QGn+QON1
         1+QEVEYm26Sb03xqkuY9HnEBzOWVYHH5uPsWaaugid+RHA65kcEyMGiPrlOR2pSFS8Oa
         j2cg==
X-Forwarded-Encrypted: i=1; AJvYcCUp2obrW2lhJwrFKapoBPTsAGoeL0g90sadYY6zdO+9PkUCr6Oz8phorUn8Y7UZa1FzGf3Rt/kOJpqtpLY=@vger.kernel.org, AJvYcCVVcollY6WaGpyscetNiCicY7rANsuOEZ/j9HAgGlg5EfC9vwl2uSUGANcb1ZGzY2oFhHKdTokiGrIU@vger.kernel.org, AJvYcCXEFjRniIuGxuMndS2Ld5jo64I8891hrkqxr6OZSAQM8r01WytHJBdxHEz2kGIhxnlqK4SjFPhA52wg@vger.kernel.org, AJvYcCXOlwZvuejHrESsg90GWkOJXQahC5ro19X3yVRitW65bmN9ilzMxTyRNonG9pW2HxR7oD036Yi0D+zEEiIp9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBxOu2M/didEgzLtdFHQoX9U3G5Gm0YkmtXu0UcfL8ImldTE7G
	ktegFJVh6pHjQCD51h7nhDgfTZtIog3HuTLQMho812mDbsARmjn7
X-Google-Smtp-Source: AGHT+IHrB6vjI/VIow+HKTzPmrIMhSj9Rpje1pcp6jRjboLQSbgWOBAtmj/TFU4pugx4K6xyy0ud4w==
X-Received: by 2002:a05:6214:4687:b0:6cb:c8ef:3353 with SMTP id 6a1803df08f44-6cbeff74b80mr17312306d6.2.1728614255711;
        Thu, 10 Oct 2024 19:37:35 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8679a7csm11320106d6.135.2024.10.10.19.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 19:37:34 -0700 (PDT)
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
Subject: [PATCH v6 1/5] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
Date: Thu, 10 Oct 2024 22:37:26 -0400
Message-ID: <20241011023724.614584-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011023724.614584-7-mailingradian@gmail.com>
References: <20241011023724.614584-7-mailingradian@gmail.com>
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
2.47.0


