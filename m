Return-Path: <linux-media+bounces-35471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2725AE15CC
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A373AFEF0
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BFC235BF1;
	Fri, 20 Jun 2025 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhWuVTod"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0816C235079
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407786; cv=none; b=i7NL2wl0slVvrhhnhiGIvIlGH5vHp66ilp3xfI8OFSr6BpLbQ67qtAsof683lH3mG9nA/Z4lPYTkfLVeVrpZrKbdS3PmzBiIBVn5nX9xSjbAaLsFEfG0EOn/Qcm454A8KW730v6Lus5TQp5xhS/WVSQhSXOYq/wWnC1G4dVk/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407786; c=relaxed/simple;
	bh=7tSh5+2krdqnWuUERcbn/3lYdwwhhze2giXAcsvhp9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uO0NRnphBQvu/BfSzTnY6vJuzRfr3TpshjXhZxcBO11ECY+TaMoy5zCaDoSVgwUkYEoMBM996GQqJB28nkVU/xY+msxMl9zPu0DBDvhNy0clYb+QskLnP3UoPnTceN4oYJKiQmYtVUfyhwSITAlZEGo5dDwJRRTlBk0LINGL40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhWuVTod; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so11234805e9.1
        for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750407782; x=1751012582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsEGtYKUN+w5ozSR1va5NJMUtfwswEKGiufzaQb3bTo=;
        b=rhWuVTodnrbFlLRwI/B+UaXkswcqB9VxoRoRBm4jks3X2YwJKqlbCvCttFvqeRuXRc
         MXhA2Pdm/69zEe2icjNkFdfJ5wmI5fu1OyGV+QzMRKIv9+CsFNx0gaxiYapXkOu6nVnr
         PmBQRK8wmAlwPajlr9/sDt+gakLRUJ0LZFEsF+QyORAUDkTywGKlKnW2MwWhIoyLLPZK
         /ksYT4A8zcFk0ouqOGmqvvQG27hSwX6naD7oIe1tnYnBAF/L+jthOgOtFWxMoQKXWUH+
         uZ4quyP4LSXR6DtLLE+YU1BbTSIkmIgamDMSklIiYBz6kCGIRADY/s5iTusjigBDKRv2
         U/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750407782; x=1751012582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsEGtYKUN+w5ozSR1va5NJMUtfwswEKGiufzaQb3bTo=;
        b=K5RGdGvNz19Qs4z4vSIghHdjfKiES6QERu0vjoLIQVI5eutHvxMs2/5nz9kyIgGU/z
         KcnGZMHoYYPVR/Bco+eaLcSrJ7xB0g7v6ARJlGMDYkCQxgCJnYg0+t+H84b5ywqxAjo5
         ANgTudjRo3MpIMOrZL2CRBsN8jLxT670voIHfM0CZaQgJ2dQOHlAT2JAO2HU0Fv3fXeB
         xxLLuHxvYTvJV9ZrjShQv7SjARyMbXZpmRseVWcFm+mYKQFpjE/SyI5e2eX5zOizys4H
         TuFksc+tZ6FdLUlKpJ/rMbikaGrrrvKMW4ECBeDSvqIY1e9vFciAq9vUtK4rUvggbnY4
         5dnA==
X-Gm-Message-State: AOJu0YxY+SC2dGsvuj4ch6tyIBNw9qlETBtjOzn0drFXQPVq4P6yLKNs
	kp3FDbnZXyHOrJb63wRONWrYOdHsJJa1r/xFQ+s2B7C5aj8aCSsMPpp1B6AWGHIAP2o=
X-Gm-Gg: ASbGncsXUHW7463/RcCIZSHyhBcWw/KHV81Q8a+xjswgYIzxzpp0ZXbOMqBlY2l5T/E
	npfO9D0Velo3ZeOj3fLuv6ufBrif1KlaeUJJxGi2MAoJ/BMcWAZcn8QOEEjDjhSlf4ZBlyQpefO
	Dh8Ae7nGWzMeo5blHorABp9mrCvSUlBq/dr4pTKTvougkRZaAQ/S3ZQLD3KphluW2rjW+7X+Jx8
	AWSKOPavZxKM1KTM7JUBPFC0Tk10NZn5pVLX8pr1/YEtuQkXOoPjWIH98MdrQVf1Qf9Kts9aGqy
	g95o+bXnwNrGWDh2AE0qMnAWY/bfOoFlEIv9zYmY/DFkqApih+/L7dA7fLlnuYvWWeBWrbMgNKm
	xSd7R7SmuJ4ElL3ejxjStGblUGIg=
X-Google-Smtp-Source: AGHT+IFDX4dxd/+wQKhT7XlWvn/QO7QwYu42EgcWa6QV9yKKncbdEuYTOOqITM6cyvlAxavhP6u36w==
X-Received: by 2002:a05:600c:8b46:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-45365e98279mr13304165e9.15.1750407782340;
        Fri, 20 Jun 2025 01:23:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d156esm17456485e9.11.2025.06.20.01.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:23:01 -0700 (PDT)
Message-ID: <9deadaaf-7dc7-4616-a6e6-95a5f757779e@linaro.org>
Date: Fri, 20 Jun 2025 09:23:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Add current load setting for qcom camss csiphy
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, akapatra@quicinc.com, hariramp@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_svankada@quicinc.com, quic_depengs@quicinc.com,
 quic_vikramsa@quicinc.com
References: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/06/2025 05:07, Wenmeng Liu wrote:
> Currently qcom camss csiphy drivers don’t set regulator’s currents
> load properly using Linux regulator framework. This causes every
> regulator’s initial mode set as HPM (high current mode),
> which may have higher power consumption.
> To address this issue, add current configuration for CSIPHY.
> 
> Wenmeng Liu (3):
>    media: dt-bindings: Add regulator current load
>    media: qcom: camss: csiphy: Add regulator current load setting
>    arm64: dts: qcom: qcs6490-rb3gen2: Add csiphy current support
> 
>   .../bindings/media/qcom,sc7280-camss.yaml     |  6 ++++
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  1 +
>   .../media/platform/qcom/camss/camss-csiphy.c  | 29 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>   4 files changed, 37 insertions(+)
> 

How are these load-currents determined ?

Looking at other instances of setting current for PHYs

  grep -r regulator_set_load * | grep com 
  
            [git:camss-bugfix-6.17] ✖
drivers/phy/qualcomm/phy-qcom-edp.c:	ret = 
regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
drivers/phy/qualcomm/phy-qcom-edp.c:	ret = 
regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
drivers/phy/qualcomm/phy-qcom-usb-hs.c:	ret = 
regulator_set_load(uphy->v1p8, 50000);
drivers/phy/qualcomm/phy-qcom-usb-hs.c:	ret = 
regulator_set_load(uphy->v3p3, 50000);
drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c:	ret = 
regulator_set_load(priv->vregs[VDDA_1P8].consumer, 19000);
drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c:	ret = 
regulator_set_load(priv->vregs[VDDA_3P3].consumer, 16000);
drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c: 
regulator_set_load(priv->vregs[VDDA_1P8].consumer, 0);
drivers/phy/qualcomm/phy-qcom-qmp-combo.c:		ret = 
regulator_set_load(qmp->vregs[i].consumer,
drivers/remoteproc/qcom_q6v5_pas.c:		regulator_set_load(adsp->cx_supply, 
100000);
drivers/remoteproc/qcom_wcnss.c:			regulator_set_load(bulk[i].consumer, 
info[i].load_uA);
drivers/remoteproc/qcom_wcnss_iris.c:		 
regulator_set_load(iris->vregs[i].consumer,
drivers/remoteproc/qcom_q6v5_mss.c:			ret = regulator_set_load(regs[i].reg,
drivers/remoteproc/qcom_q6v5_mss.c:			regulator_set_load(regs[i].reg, 0);
drivers/remoteproc/qcom_q6v5_mss.c:			regulator_set_load(regs[i].reg, 0);
drivers/remoteproc/qcom_q6v5_wcss.c:	regulator_set_load(wcss->cx_supply, 
100000);

I think this is the type of thing we should bury in SoC resources not in DT.

I can think of how we might want to change the current depending on the 
pixel rate.. but then I think that is something we could calculate based 
on pixel rate with descriptions as a base in

driver/media/platfrom/qcom/camss/camss.c::static const struct 
camss_subdev_resources csiphy_res_SoCNumber[];

---
bod

