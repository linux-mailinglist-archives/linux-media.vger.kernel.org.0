Return-Path: <linux-media+bounces-38572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA72B13CE0
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399051890138
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A0826B76E;
	Mon, 28 Jul 2025 14:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZcDYfv2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1426B748
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712157; cv=none; b=bV6ffy0AhKeNs6mfbLUu2SKNhatNIFejTqnOWXGD7dgwjk1N4gJpf5Tt5Sreu7W3R0Ww61qq8NKFc8Igp1mEsxemYHYj2/YY9egyq/6Qg1fO9pCQlZ9B0S6/9UecFJBuclcktztnfO4s9bFxhym3AxqVpS9oyRpTwS12h2cp6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712157; c=relaxed/simple;
	bh=jBvO+LGBhqE/ZtUi1WtCmXwaYi2oY/wR656ALdWYXLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLqd+YjPEQ9dDU10vFhs76YCf2Pvv8B3EGPVvWWjs1ii0LehA64qDncbSFGBGK24cnKWxpXSBvhmn65fX58QNQA1RyS/+e1TMpxWFPGR2fL6H2060IR0qLztEoyKxE4eWIft722TL1ZUpvASF3Kkg64k7WpXphKV7SIPXiBFgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZcDYfv2; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1065440866b.0
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712154; x=1754316954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=;
        b=uZcDYfv27Ljxwu17Bw3FiP0sF5BjqFvDTNy6rm49vj6002/fsukH2qLjiRG4PzMJzG
         Pw6Et/OHsa7Q3GlpBgcC4lyW9iennXdB/C02pAoSKqGWI4ADTuy/pRe2+U1eBcXbJPER
         LVxOGO5sY5DU6O9QHXu+wVGaOsvKizgmppB8+kbi5QAcorsbHZT3Im+yYEPOXTWkOS12
         J+f60FGNTaagGpdLCnWUu3Dgg50Fz+9R5F2r4nPLKJKOR+xO3vyp94HEDoWOauojbQT4
         OThBp98FRd/DIBeVwaBaaFn76Gaw+tVAqhm8hfr1JhR0mBfyK/cb/29ZF9s6d8UOYxvg
         bGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712154; x=1754316954;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=;
        b=BD4reVbISW5J9Mvg4c4S+SrCgSRVnevINEICVCkoJ7z8IZ3Xb9NKbB3LOYfQc2qieL
         Jy7rEhJivZjoypuiT1TbGJBhV4gxSBxEbJBr4fm3d1LzWT4IxFm+th0SbE1v89V/7xcT
         /vWeOi70hMS4Zg5efjOl132vn9RNQK/0vsI3QbOt3BsV63gGM8eVnOG875I7qK8C+PXK
         ub9A/A4dbb/tcKLzBXoE10+9dnRK7MpzjIXhfUBGxU3Ns882VQb84gZE+YJ0LhcXPN5e
         a0dRwauHzpxVL8jVMbL3A/PNc6lxhSpZ7JnLzdPaiA/kf28+iVSrK6PAWWExz6auMWcs
         XVsg==
X-Forwarded-Encrypted: i=1; AJvYcCUq3Vcxxn0YoB7K1tUC+Jd8W8tjCVE354gCpG49bcsuh7TxAMOPLht+zKf/j9iehEhghhRdYee9Kl3eRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZBQ8ZWCVsBnn0hgZ6upb+L+udAUHDYInTduCWM41QXOYizbYr
	drAl5fhcPQvfm+yci3KuM5DQWbbQI1l2Wkkh6v0UWcz3uXvTbKAVLGlXSzeYOiJGnXI=
X-Gm-Gg: ASbGncvvqyqbHiKWdIPxDW6y8Pl3YxnuFDgnQwQcWezS8V3gWZSreg+pzgY2OrMSQth
	j8MDRhgBZ7NNrjUoTp3THt7feZ+f+9DUd/kwdAOl8JunotP7hOioBP8HQP1ryvVPfxgs8BlLS6+
	wUrEAwo0/AmD6rj++TskeEnvBuSw7+0zjH988LEIjJaQncYVH8zhFgQlX2hSmrsc0hnlxt1nKhn
	LyIroqmkz/bc647kfbCLrHaL+RsANYLq4Gw+cPohAVV5XC9lb6KroGHSubtGPtu1QJzWDORncGv
	HRlcEa1Wh+h8xx9OqBrMmkSeY47WvepNReswC+xyOkQyabkIeBk+5fcJF9lGFa9hxoY9UzioUzU
	iVReDM2+qMbU51UTwr9tXho+zUlhTd76u3WoGkujlx8cyyrcCD8KpNYadW4LqaU+RlM1cIyds4w
	==
X-Google-Smtp-Source: AGHT+IEbup0WGzQKdd/SdReGqdXO/wPA2vfo/bvQOhQ0kc3j2Opi6K31loxxw0o1vQUzbFcAu0y+0A==
X-Received: by 2002:a17:907:7216:b0:af4:20f2:2dcb with SMTP id a640c23a62f3a-af4c242b969mr1664623966b.9.1753712153796;
        Mon, 28 Jul 2025 07:15:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63589c8ffsm419726066b.34.2025.07.28.07.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:15:53 -0700 (PDT)
Message-ID: <48d78f51-c094-46b4-a9af-91a9d855e296@linaro.org>
Date: Mon, 28 Jul 2025 15:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] media: qcom: camss: Add support for CSIPHY QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2025 14:11, Vikram Sharma wrote:
> Add support for CSIPHY found on QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Give the commit log a bit of love here.

Please add more text.

---
bod

