Return-Path: <linux-media+bounces-13436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0163690B1C3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20D41C22B95
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4351AB533;
	Mon, 17 Jun 2024 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="2hRTfSKm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB81A3BDD
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631370; cv=none; b=C95zMOdslV8B2taphh6jv+cDXEtQNww3BRtisgkeBRtHR5SoTj2j758WzntxMGr27DiRMZpZHG0/W/sWx9l4wy43j/J7ljo/vF7OOsWdvclkPvgZ30G113hPdQE3rsYbDqzgq+IU7kG8IRG47Goc7pWrhhsUFlJqeIlRdoJoPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631370; c=relaxed/simple;
	bh=51VpGQU9TQb2BYNIV1hunBeJWs//aAYMlaVemJqOiis=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WlGj7SgND2Kt+dPh3UGwYmsPh7NsKnZhDW07gCtrr1b0KUjEB6GSQcWe9rE3cxf+/OSioV8aGI9UZcOjsqyQsB/NAL2/gjb4m5srQTJqJdwORc7gdLfllnK5U4IlYF9bwa4qHLIkYs1344bW1gZBduifYRh9wiAfNE8MP6v8Ffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=2hRTfSKm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso5198358e87.1
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718631366; x=1719236166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SGE8udosehPs8x6k5Jqshd1Fc55L9dYXXaHceJtRoDQ=;
        b=2hRTfSKmUU/ixcKn11+aAwmG8RjwkcDCQr/k6V2edWZcgjdO5hCPPRZ2chwQXqf0xg
         KudUQRr+H4WRG8wVnwxAV75ibwwQl8z1QFa3kcNG4PkLURdwCBfN8TCb3H8p9RDEckb1
         XLMmwr/+eKqd1Zkq05gQi+RU6hXoV/uoMOe1+RxV/GwP+QpMUvpCNR2C5nE869eUkYMk
         Lgd4UDI5DWVSinSXk1VU9nSs9YB8nYV6334V4AJ37IC2Z1WiIz4UAmjM34mmVTlKlPiU
         HqfOYMIbthlGA05fA4p1cvWHY2eP2vJ2iz7jAgFs4zPF8HadngZJyQCoChL+gFhXlV6Z
         7kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631366; x=1719236166;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGE8udosehPs8x6k5Jqshd1Fc55L9dYXXaHceJtRoDQ=;
        b=kDx9kdEL3RTDBGyrPhAkhvYp94gFRav5cjJRKc3nY8UxrLWz64ui2pRroD51sZ35Jm
         or/SGG0dLZsUI6Wp/U6InEvlR6icbg+MKEY8N0YZWuoIGRz8gbie9f/uQneqrIm8A8sF
         oRH0CipNRsJgy3NHywuWiixpm9ml6c4C4utQqJnmniLMQWbyfEyy1vOqKnF2LfBC3SLR
         f5Y3rzmQdVG/BSbRifnVa4A9NXteibA87v9b07e3icNenHaQecRYYdvzUT17Q6vYzC/0
         RsEiW+wORsYwzTKsGD1z5OE6UppjY6RgMeT+6uCZK01FPkmmE+IBEoliud2kS4UVKBXO
         RI6g==
X-Forwarded-Encrypted: i=1; AJvYcCUS9l8rB0uVp3W7daNSVeTgG95Rw3HKIY0D8q/1HYNpHozAjR0rpn1z7Qd8I402fgyu3VxWdWqKlcfPNPFAwiRp5RSid3MwKbwg6ss=
X-Gm-Message-State: AOJu0YxgM+3w3TXOHai+6kIpI7AhnezqTskBEJKAzMKCkgACDN3FTNRE
	kOvM57987jxa8dWMDW5FcWQa+7bj2MBiakBXjdHYG3Ld5CZVBTEOi8dAUDtQ5g4=
X-Google-Smtp-Source: AGHT+IG6y8wrPBA0o1vryGKYpHdpkvwU9Q1FxHSYaxn555rEKLWnrGWdeHs2ikwmLBI+IVbg85jeHA==
X-Received: by 2002:a19:6448:0:b0:52c:a64e:83fa with SMTP id 2adb3069b0e04-52ca6e9097dmr5228997e87.45.1718631365754;
        Mon, 17 Jun 2024 06:36:05 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f22absm12108635f8f.79.2024.06.17.06.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 06:36:05 -0700 (PDT)
Message-ID: <abfedc39-43d6-4ab0-b7b2-de68371d5d28@freebox.fr>
Date: Mon, 17 Jun 2024 15:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
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

Hello Mauro,

Can you merge patches 1 & 2 in time for 6.11 ?

Regards


On 04/06/2024 18:41, Marc Gonzalez wrote:

> Changes in v5
> - Collect latest Acks (from Vikash)
> - Resend to Mauro
> 
> Marc Gonzalez (1):
>   dt-bindings: media: add qcom,msm8998-venus
> 
> Pierre-Hugues Husson (2):
>   arm64: dts: qcom: msm8998: add venus node
>   media: venus: add msm8998 support
> 
>  Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)


