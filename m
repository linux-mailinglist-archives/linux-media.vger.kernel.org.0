Return-Path: <linux-media+bounces-10878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1F8BCF6E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1A2B1F21DAE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF7780C03;
	Mon,  6 May 2024 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="tHmY2rea"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80A7FBBE
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003313; cv=none; b=ZD2JucLyfq2uBeXITmq80x6Wud2+bpmSUx0P0yVY1wZU04hnxh6Hhdn69SVTmjB5OALR6BcsmNWvnZBcs/ReuEoJMnWYTY71ufePsmMO3MqAGHxjNYnKSHapH5aCeSoMJsJTx9P9TZNot8yFowuAepnxQQkkSZkzr6ypu4GCCSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003313; c=relaxed/simple;
	bh=KkTKkbItVaoNaebdlZbTplZomRRkcshA7Z5iO0bO4bU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kW81Op/iPuY20kzPNsT3sTAuMVwE7bx6PVR1t3eZBeTDJ7DzXJToZBAM35rgmfpH9MHB7ZjqMwJiAGas3lOAz2kRXfyO/kZD+5kAFj8PZeZkkAmFqIg/e4uK8Efb8VPle2RyNZ8vxrUyWnq9Z+9IeJb6umFg4xtCaFSnZ7etNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=tHmY2rea; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so2317534e87.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715003309; x=1715608109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=tHmY2rea40SZGtV3urQvOGojFdJ84Xu2RZLL7uYIwm+t7JvRW474Qx0Su5oetg4It0
         18KAGe4Y8tlBcRjiV5XgdXxyJndv/j3uTLWqHk4Dmz5cH1JgWvC8YFWTLja1AKPhe88K
         ZXClSkDJ7oxWjP8VGljiBnSfLw1AYluOJsVbLo4VAHJ9Gl1tjeabS16FXom1IN2EK3Bf
         JGG725cs41wGhilnK8WrrVfuuh6lDOCTo38lg3Lp5xwJ5wrKKU65VDm8ViGc0JpK8lnT
         DWrIW+jrBXX4T11g8zdTxkOqSdLFPaLEZZh19T8s7WIPMFFlcr287OnSd4hbPwWC4bhq
         H7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715003309; x=1715608109;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=ES73qn3VawzEhQyMZk+AVR1lHzMSAs378x5ZKmlrOFNxjfkzAP4oDWk1QtdA1oE88A
         hFFRbL8F/iSx8AQwCOpfFyicIlFqoQH1iQBloffqE8T+F6xeboS87iAcMQejB8ResGMo
         uuqXhiHbaaQEvtpkyMZADmR+qi5cqmp7fKKqKDhNladzCCuCz28ZwKIfH3UHX2YQPh9A
         E2y0mPd0BaT/CU3eGXXwk34a+3dpvhrjnD8eJkOm0TmJ613mhh+MeqyT3T+sNvRwTqof
         F97+5ECgyd1WLQow4EgeRFa6vUfqvYvlJ9YDDCsN+GIs8Y03Ut4QHAh1JTlpFlTnIIs1
         qOww==
X-Forwarded-Encrypted: i=1; AJvYcCUqQSulb4HrLb+I2Lvb14QzFEI5emJ4dd4HmvMPoYD7l9/Co0JAQ6Be7log1V/YzCZlisFotjb60+2pR9z0gLnQZmry8KY5CfY/8FQ=
X-Gm-Message-State: AOJu0Yye6XFn9j/lqI+4NwrTVQvDf8YAuZO4ROl1LxTbufOs4Asww5VN
	EZUjWWSZgMWUKTe8xayFEAh6B7lKMW50rW5AxwirjhES4R/00122BFdKBzySeZI=
X-Google-Smtp-Source: AGHT+IEHDHR77wZC2Yk5IorPluWW0YYOwrto2AB7fQsL46fWUFMec9hqmWFCuw9eYy7Pr6Rv+wJhcg==
X-Received: by 2002:a2e:a550:0:b0:2e0:12f1:f827 with SMTP id e16-20020a2ea550000000b002e012f1f827mr8328144ljn.43.1715003308828;
        Mon, 06 May 2024 06:48:28 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm16131973wmb.42.2024.05.06.06.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 06:48:28 -0700 (PDT)
Message-ID: <b3047c0c-16de-4426-a781-fa9239c42856@freebox.fr>
Date: Mon, 6 May 2024 15:45:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/3] dt-bindings: media: add qcom,msm8998-venus
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Language: en-US
In-Reply-To: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

msm8998 has the same video encode/decode accelerator as msm8996.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 3a4d817e544e2..56c16458e3bb4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,msm8996-venus
+    enum:
+      - qcom,msm8996-venus
+      - qcom,msm8998-venus
 
   power-domains:
     maxItems: 1
-- 
2.34.1


