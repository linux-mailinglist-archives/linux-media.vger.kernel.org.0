Return-Path: <linux-media+bounces-10472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6918B7C51
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 17:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4235B285827
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 15:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473601802B2;
	Tue, 30 Apr 2024 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="sqCP3/Zj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8143176FBE
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714492419; cv=none; b=iKhQmockGkRn6qCaaO4M9E/Zgo2+ImKcvuuwX9Dcp3m4IpDKKbVo5Pse6wuELdTDQRvdLlDPra/4r0FYyDsZHymtiLM+/1A57ZbE9csnZFPuKZtr/AX9RP5hjlBEyf/B9KGpq3HOviU/UVb2dR8iRnrSVWjBkaNYmxclD2UMIs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714492419; c=relaxed/simple;
	bh=g3bfRA7U/QqEPrJEloB7xAetG39gwY6KVV6eep+Zvp8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gTNeKCpG9Uvs/FXj3OLAYFI98KYcb1sdj3kmEqjz/EkNUFLNN/xnW8Ft6I32VDnnSh1yOLKOsrEToWu7fEb/dPaxihkQbsTM1DJStvDM+0ccg65YO3ouVK62+2Pki3tT+VAmuHHAUKtczeOOoCICh80J4nv1M4YwcscKt2sItb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=sqCP3/Zj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db101c11beso68223411fa.0
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714492416; x=1715097216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmiHE+A1rYMl/poK6E7NfydT5sKsdtRu2djmiPuGhh0=;
        b=sqCP3/Zj69GY2AJTJaHJFDyiCwD0vnPPOPi2iqoAJQay/vT8uDV8l+FsaF8OOZUVEb
         MgAqupOWP5EnQ298puUAEEFyuLNyhY1A5vj8NdF0v0xg6GGivJ7W6zZ/sUDaNbQkxp6/
         P1zJzKGleSj2377/+Dl7Z440x2QgBbuseoWJvJIc1JmeAeTkgNzn7djUMBoaTcIzu0y+
         Wpm1+SfWG5cSpcqBbUUCxdvQ6PzaNsnXWXdAPuBlzQmZp6ufqEE/T934ryoByx7JJAC6
         UGL5yHe/roH+gqtxTXDchVeqy2rRqCBCCrC0xLlL7WqBdtsWDMNqXFpXC7JiShzgb+Hg
         QwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714492416; x=1715097216;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmiHE+A1rYMl/poK6E7NfydT5sKsdtRu2djmiPuGhh0=;
        b=Y9j1AaZCXvz7vasijiVeNXjZrpCttCm/aSnrH1G4ADDbR1xyFV1/jkKLiNfH01EIH8
         OQSCrlSBVO4l+WJ4Y2E+hW2dqQ0nbv7bfXRnvV6z9Len40087C4+5E/8hDigfG1CXI5F
         9WidbiKCmG0wlX4470/93kAJAYLBMzqPbLnjiLVd+VV0Wv3zIRxfwJR3SlXKyC26NeRd
         OOUwpRur20rLZWwEUaA/zugTtso/pCSQhj8Zu5BSppSH+cKz6LW94LdwhUb6aDBmZKMe
         ZvRKPte9juhOTd5f0lfzPUT10pstmIAsd5BYS5gjf/Bauj6DzIUfFGVgFODqMQnPDk+m
         dnng==
X-Forwarded-Encrypted: i=1; AJvYcCVaQ5FobvZgLBr85j5C7BYyUQ/8gXQM7ZwdAKm7fiGFVPagkFT51mKBLeQs6+9h4ZSvHBDr/6LkiHu2NOnpjAnFr2U58euZt/fa8bE=
X-Gm-Message-State: AOJu0Yza8bzdVrVu/b106NizN0OOx1aVegTB96RlDN2G2bZ1NeYFtQKA
	ihWT6mGQznXVZmPmVBs6CrmYHJor/bXtUZt25Npv9tl+io+mnbI+v0WsPxMg2QM=
X-Google-Smtp-Source: AGHT+IH2DSKry0r2bE7SYkhlatHEsONxFyFzydt6Lgqb9SqPkBKBoVe4wlWqu6s+QWboiocgXA3/YQ==
X-Received: by 2002:a2e:7c03:0:b0:2d8:3fbb:df69 with SMTP id x3-20020a2e7c03000000b002d83fbbdf69mr74105ljc.11.1714492415792;
        Tue, 30 Apr 2024 08:53:35 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id fl23-20020a05600c0b9700b0041bc41287cesm14150365wmb.16.2024.04.30.08.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:53:35 -0700 (PDT)
Message-ID: <b26195eb-a040-4b8d-a968-4d01b20bd14f@freebox.fr>
Date: Tue, 30 Apr 2024 17:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
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
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Language: en-US
In-Reply-To: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Superseded by
Message-ID: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Subject: [PATCH v2 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
Date: Tue, 30 Apr 2024 17:28:46 +0200


On 29/04/2024 18:14, Marc Gonzalez wrote:

> Nothing to declare.
> 
> Marc Gonzalez (3):
>   dt-bindings: media: add qcom,msm8998-venus
>   arm64: dts: qcom: msm8998: add venus node
>   media: venus: add MSM8998 support
> 
>  Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml | 155 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           |  48 +++++++++
>  drivers/media/platform/qcom/venus/core.c                        |  42 ++++++++
>  3 files changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml


