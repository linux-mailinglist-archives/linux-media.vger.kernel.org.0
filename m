Return-Path: <linux-media+bounces-12542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F120C8FB969
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB509285168
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FDF1494CA;
	Tue,  4 Jun 2024 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="tZjIPass"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB90147C7D
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519571; cv=none; b=kW1G3jhc+UI3CkgKjIaVc177r7+OgkqrSoWkOaYmJnf17ASf9yvTraNYgjb8q2/pkGjKdG3MokZ4qLLhCZxn1nW9wGczMPTx3aSkxU5bfezSNWbAAKg2Gy0kXAGbkWXBXYtWg2G1brYl3h6ZNupi8WWeKGJj0p2AVPIf7YSyLRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519571; c=relaxed/simple;
	bh=V/n6N+TOSeadphevdOSNbz+/OF7dVHiqPrKnq5b76Kw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d3pRgZzNtR/yy+hsdHnhXEO/hbVabBydE8vqcZnQBp4CeRCo4U+EisOP4s3aG3TzQV2TUj2HJoc/k6ac3VOxvHdUIRGJZ7fd2LQdvRRZM9XaZ08vOYZ4MclzCqBMT7aarEWaoaexFpWzOmvxbuRs1gtC4i4R1sPqZaXqT/OQd7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=tZjIPass; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35b447d78f1so10912f8f.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2024 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519567; x=1718124367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzX2crzner54qLH1BfhKB/A+YfwINCia8LSzqi1+8vk=;
        b=tZjIPassX4ao52fljki28nkQFowzi8xv85CYONNniqNGIH6acvTZyhWgHaEAetxVWt
         jlNt6Hr+6B+QS4m0ozSJMSyYJv1c2x26PExC5eVonXF6FlKt3ZAZTVviSOGMVDZ+y28W
         qA3VWCc9Kf435DYdG+mQtsaiD9ywX5bhrRUO6h0jI91Zskb3CV+jFq1yZNHYmbltTeV6
         ASLqzLYCGQ5k0a6m1qtB0II9WTTIlL9ORtnVe6055YUwOvEFyORyNARzbQ+33NMqBfGS
         GZnyFusmvBdq6G/jo9hSGjtmlYen7Z1WRH44niuUHWgUmdvefzx/plNIZ/SCreck+dYo
         YQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519567; x=1718124367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzX2crzner54qLH1BfhKB/A+YfwINCia8LSzqi1+8vk=;
        b=WgI/ersGcgIAGT3xNdDtGhcyUhdyjNE9vl6wNgeXTFOVRxaCIkWU2chMfO5kTjWYIB
         PdpWGOnlbKVSTdYEaV21UO3xTQ+p4YewN+TDfBvl+wELe6qLU1Fx1XrBs168bu1U0k9h
         ILP3+leQD8t/DAeXPQ4vw72Zh6TvVORxMRezkveXhF79ArywL5HMoTAylRmeZRpfmMDQ
         bnHvVqn8DhN0qh9BNvZwwZDc/UIF+0Z34RiD0KqZ7ggtMYQSpFTRcis4Td4bQk7kRiZU
         /wkRb4Hpca9Tv01uccaIO+zKzhcsrYu+4Z69ChHR0eGXPC9+oJ6JeuBzIlzpN3KXbEwG
         SA/g==
X-Forwarded-Encrypted: i=1; AJvYcCUb34lZCHw59yPKd8vFcrkLTFn8OKZy2HYHM/N8IwGe7eNoIf3bYN9G3ONuXb79qbLTJl2GJKjSZsJ4fK821isH1GtodELPcXdeSsw=
X-Gm-Message-State: AOJu0YyCAFhrdjxgDh3kiZju93TkHiGYXwNXKh6hFgh5+yFVIVr+4vN8
	DcRL+WymE6i62rPz3NYh9KsQuWky85J0/vCZENZYN0VYlqddcCDqJ3t8r9zz0DTQ3+HY4/BYVr6
	crW8=
X-Google-Smtp-Source: AGHT+IHsjwQSpgpoULxOmieXHX2EY9bSw43cMW3Y1lHVNFwHiKurh8RKIaF8+RMv/nVJic85jiZtmA==
X-Received: by 2002:adf:fd8f:0:b0:359:f17c:134f with SMTP id ffacd0b85a97d-35e7c591460mr2636525f8f.32.1717519566817;
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:06 -0700 (PDT)
Message-ID: <2db42e45-c034-43be-be96-0e88511d1878@freebox.fr>
Date: Tue, 4 Jun 2024 18:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/3] dt-bindings: media: add qcom,msm8998-venus
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

msm8998 has the same video encode/decode accelerator as msm8996.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


