Return-Path: <linux-media+bounces-25088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A63A188E9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 623633A4DA4
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44AB175BF;
	Wed, 22 Jan 2025 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6nfezr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151A182BD
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737505391; cv=none; b=nUY5HnrVRDw8Cy0fOWnTklvZIDaYjA/xeKm2eJAIcHTpvuFO/rhMAMMTzXdor0DcfgtnZAGubtOeVFP9KmUwUPZWoUgqebpyDvl4mDTFry2ubudjiqZztCQc8WMjGrP7SSH2QL+MGlb6I2i7s+n3qE72yN2B8bzcL2aW82dl1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737505391; c=relaxed/simple;
	bh=4yCpljMzPlAVYGrTlq8EYb2mmWKfdU7nrndVdkCBQKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ColvyXmmi+1gN0/SaHhEAsfKe/IpuprDWnKPMQnS/CSblM1ZN29twqU79yx7BhMiTgJZYVqyVsiqqwsE6OtgPUImDlQBPGssMyzAHxFJI38Zou3Iva3xVdmtvq9CDPUDDUz989gA1aU4LZeyiM3OZ17QD2fRGOwpXF+fkvMbpQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6nfezr3; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30224cee64dso5137221fa.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 16:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737505387; x=1738110187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0HJqNUI3/7Fv7C3ghrvDvyETXZbWbMIAg+sHqC9AMM=;
        b=s6nfezr37lPhkB6njjLcE6VP7emBUg/LpKFDIGcW9DDdeZ7rvdgTFia64rMNNamGUu
         YaBlXCzFq6ks5NWnUKT/FiBqkd3dy+upMBoDUoaoZ1S6NCBDJ3yAiAxEf5Aa9iKy9n41
         RCTCQXwXR3PEpXdCkpeMnT+9AzlSumV6J2aAJsG/LSbjLolIjc39RoUoAUflydfx8RVZ
         J0dH3fAQGqxHnmERYyXi76ryxcEe71dFA+LGp/QuepSZ2zbd3qqXxCbXc+UNBFeFGP+8
         MQQDqAarjQoQelOVgW9fV8VlYcrapveocn7cMaLgabPGQTFIH55a9q1y5QqK0vF1lYYe
         HnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737505387; x=1738110187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0HJqNUI3/7Fv7C3ghrvDvyETXZbWbMIAg+sHqC9AMM=;
        b=bEw7qqfxApxPGBlJe6/k5d2qp7ouaXiD6L8QofJakyIJgU3tY1iwlopblHZ23E7JO/
         +jkNuYVMYIIuszqsOtPjALd3RpsWnP0DvKefBCzptC+Knb8Q2Wv6TcGMstM80lfl7Iuk
         euylBIe27H9wu89c/uTY5CjBotzPrOn4ZYhr/xeI/1wvM+c5nPn0nmY6OwS5as6Q4GSk
         HfukYVfhCnHSDeI88x+oORbIR+5tfaIIhCoJUw2r2AklowYS9YBAPDggpk64HmkTLdP9
         KcE64kdyep8VdMPhm02L2Io7MkSneXdIkYZtx1YgZSUcpUlMeK1DNaIMoJTmlCMWdyaO
         RpyA==
X-Gm-Message-State: AOJu0YxiRF2jDrDCqaFwXzJUGlCMHJUMxd8aYOEUTbu9TqZCKDH/2mci
	W2Z4j5dTfO1kIineY5B0Jn7DhWpsvUGt4RMoW5KlbVDpPy3NtysVfx+LX04jiK0=
X-Gm-Gg: ASbGncub1fKRgz81D/LrPlmeQw1U5oqGwEf7qwD8kHovUa7PhYh1mxn2yu/XWS/AF8p
	9r68fa/Xfg+1CTY9oxUPR/+subtdXQb7OI7Vmmmug2wsPpPWtKESsTXCLbQHADdxAerUeUioySP
	AEjj8gQAu6Ggj/jQQnpbCMGijihpLhhfBYp9hnegw0DtaAyvafAXFeoiyuFm5Fb7rbK97MkRUtr
	pA/BgDLqtWQ+Hc8HaHEmB3V1M03vCBaxwLSYOjKkiGzuXCVaM6Rhgf0cxFQzQgKzh7uB390uOBu
	P+18qHJ3XZR528JZNpjYJsHRXCiBvIkFYRLO/+phSIUXeeKW
X-Google-Smtp-Source: AGHT+IGehczE7c0uuAo0Zo0nBz5xQR/MBgNuOF0Q3+9sCbYo6xr1LGkNlCSvRELQ1OyRp1ZW7lODuA==
X-Received: by 2002:a05:651c:221e:b0:300:c10:7c33 with SMTP id 38308e7fff4ca-3072caffef9mr24267851fa.7.1737505386792;
        Tue, 21 Jan 2025 16:23:06 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3446c8sm23683521fa.27.2025.01.21.16.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:23:05 -0800 (PST)
Message-ID: <f6fa8949-6c49-4aa2-8b3d-1ce23ca73f96@linaro.org>
Date: Wed, 22 Jan 2025 02:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: qcom: camss: Add support for 3ph CSIPHY write
 settle delay
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-5-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-5-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> Currently we have an s32 value called delay which has been inherited from
> the CamX code for PHY init. This unused value relates to a post-write delay
> latching time.
> 
> In the silicon test-bench which provides the basis for the CamX code the
> write settle times are specified in nanoseconds.
> 
> In the upstream kernel we currently take no notice of the delay value and
> use all zero in any case.
> 
> Nanosecond granularity timing from the perspective of the kernel is total
> overkill, however for some PHY init sequences introduction of a settle
> delay has a use.
> 
> Add support to the 3ph init sequence for microsecond level delay. A
> readback of written data would probably accomplish the same thing but,
> since the PHY init sequences in the wild provide a delay value - we can
> just add support here for that delay and consume the values given.
> 
> Generally these delays are probably not necessary but, they do speak to a
> theoretical delay that silicon test-benches utilise and therefore are
> worthwhile to replicate if the given PHY init sequence has the data.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

