Return-Path: <linux-media+bounces-10972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 757778BDE44
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 11:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0115B23043
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 09:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A26613D88D;
	Tue,  7 May 2024 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="LVFae5Rf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6277F14EC49
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074287; cv=none; b=RYM7ohPZ+PJDRnZnp+U1iMUdlZkl934qkPnb/246FazE3N1oX8tkY+TuFGrobOarGkHCbxHm9ULjcZmehsRIeILy2wAYgfMK5bMFtYUrNQ8smopCWvVt/5tYEoUyZR/rHke2sTZuGKbe4Lq0yux0amYR2lvWrv4xUSH11N7NhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074287; c=relaxed/simple;
	bh=KkTKkbItVaoNaebdlZbTplZomRRkcshA7Z5iO0bO4bU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ebnifgFUAchAwzdMCtPYt5Xci2LurRFeGitPlUuOxaNaVOGhDOYX27DxfVBj9uCdmJhyN/Q3O02OiIIySlT175NRL1mPc89Swtvsektsdv/ZLSl+84D207MAoyd6L5kFLzk39UASep1Qrpl/FlFW9t0QZbUtm84vFwD25CoeiIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=LVFae5Rf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34f0e55787aso1493769f8f.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715074279; x=1715679079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=LVFae5RfpGMv5LTob1g/mFGi55l8vFLcw3mWgEDtaWWU17oj33b4fkyrvO9Cl1X5+R
         C3niGl2aT5RQyN9KNsPG8nMfcCEgB89PF96X8INzqR5rwEQoH8FpdB8fFeeBbLldHjxn
         ruO97iGJcCCd8ldRASmuKhPYT9M/xTExu0XciUaO/L3kES+PSb1QSa8BwXc0krzdtakh
         snAd4uuMhVv87oA+b8yDCqJ+cXAR/IKx7pLrbZF4Fsm4nR7943ZOSxeN+OmMzHWhj+QK
         yYEqcjs/16TCqmbB7A56l7KwwQeqCQCJhetMakFRA9PqEctlWJpvDh6D8ML8fhGznUvt
         /LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715074279; x=1715679079;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=ISg1GigHyX68TVjKV6Um8w8QPTWpCepAJUzpKoqIxa+1JQyfxgnsJmaDPqA4hHNbPl
         t613eF8ZyZDuWBehxpixntdT5ct7/RXXfWWXDNF3L/q5wWEYHCfBmWA8aM6F859EyBoI
         Q0JyklP+fkSYSuEYnEu2MiXT2f7JvOjR8VZLGQ15uFspGH4J6VUAvi/cTzcs8GvDf/qS
         O6H3VX3sa7rXjmYCh2nSH2MM/788Np72kNWbXRCuJLFq6oWy9V6d29SQ28Mkly9BaaH2
         Nxn36+oYlY9890xuoe73l63hBMSOuPc8AlNGEOLCixk3M+j1SBH3nSZGiJwH8qBgYELi
         +jZA==
X-Forwarded-Encrypted: i=1; AJvYcCUFdfkaEcOTEWMcMa0x64TFXx570AByQZstjNX+1z61NyMnE//H3R58ifgYTjKegv8hRfNysal7yMBU9jHFu/I2LxZIZpO/nsxTcYw=
X-Gm-Message-State: AOJu0YwH4wf3060XTfTvT8TYv/9i5VUDXKortK/Bbf2LUkeIbO76VKqz
	9LItfMGMciCV35Bjv5Y4fvnIqaxLfL/Sh8fLcGfEZMABgvIox9wgmBwEer2I63M=
X-Google-Smtp-Source: AGHT+IEvHZqrO35Cj7iFDpIZwkGv71Jk7pChDTuL9+k9WP9x5+qLDkeol9+hXhU87pe+EvybRgC4zA==
X-Received: by 2002:adf:a18f:0:b0:34c:b31e:18de with SMTP id u15-20020adfa18f000000b0034cb31e18demr8591141wru.35.1715074279066;
        Tue, 07 May 2024 02:31:19 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id f3-20020adfb603000000b0034dced2c5bdsm12517710wre.80.2024.05.07.02.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 02:31:18 -0700 (PDT)
Message-ID: <a5a6b080-268e-4643-b652-76b220672035@freebox.fr>
Date: Tue, 7 May 2024 11:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] dt-bindings: media: add qcom,msm8998-venus
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
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Content-Language: en-US
In-Reply-To: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
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


