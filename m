Return-Path: <linux-media+bounces-23386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 029339F0BA0
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39F93188892D
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEEF1DF26E;
	Fri, 13 Dec 2024 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwNHO1Km"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E961B1DE3BD
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090602; cv=none; b=fHdLLI2IwoHgiRCuGRrcClGAGZuPm3lBVWB92CXjTeT8dyrw/enwfY9fZXCxxvM3zXmIZVxZJWI+T3j9JpD4n6ic3A6DVmwE6XICw7weat1whXEmJzzrxuoQPBDSgX4SCydLn9rh5xdQssHMo2AOu6/rYzoPlmnCkoIy8R+u5Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090602; c=relaxed/simple;
	bh=rseqG1N7BkubN/07fCW2g1V5YNbhgZMmYrUXJDT4lHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rU0qGxppoNpfi8MV3vYku98q7JWsnM5jfxeZvmvNkawYZyM+ooIpcqyO18DVDWxcPvkfNliG7WvdPk92Jk/FxKmh1CQmGAfgkDwkEg63KSh8VVs3A7tFEDjLXTVnLSrB66BUdQr6XwEhYJoSZTzxARoXc492G4oHNwELMPZtEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwNHO1Km; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5402ec870b4so181811e87.2
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 03:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734090599; x=1734695399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZNvkdVhdOTKRjQLQWRnWH7IxlshGdmbBQhAJdL+f3Q=;
        b=kwNHO1KmTH8zu/hoO3ZP64VuRS4sIeoLta+FafK6O5/yYGcBF87Db3nqf7YTnUxHBP
         VEK/d22jy96pcGGJXyyWwLDAhLanSbgey51Ut7iN/QB5aQUDRl3BmBhRGKkOjb21BHE+
         VEvcxVVl0sF52D7rlYulA9DIGONJarmYBVOdMl/29FsegtP+oSQ1dr2Zo5f2y5GCOcDz
         y6Ql3Q65RWZyx1XvXAkOn3H1xZaYqQVTjSy1+8FCnT5IkoIEdCKhc38FvBO7VykRxln3
         Sat6oVsDiawtBLLOqqX/HY4B4+umBtTpjw+9SMfBEm0FWPlK8Brz9+umjYh0hSQiNTTb
         cmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090599; x=1734695399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZNvkdVhdOTKRjQLQWRnWH7IxlshGdmbBQhAJdL+f3Q=;
        b=Tvjkd/F1j/6fELmrA/Pw/DbCYtsP2ad3Nr+TQTT/sT56xWr4NHZIfJVQlrVA6Jatlc
         oc5fcUZ9x9cp6YdjMheeqcOSkWh2JD2k//1ewsDE1ojIBJOHede15Op661QLOK9AiW1p
         ZJC5Bhz62AkbFQo54ELuvueDyl9oOG/65wuJe8lXsIcq7AH929LRCz9t/DMkkvA+mODx
         f/26ZOjpwU7wY4jbloOTy0aCEFBXZrR39DRGKpn/M2js/PQ5HKSH6THg9w9RzjjMmjbp
         BsLWyV1HGbk1sRVJXjmwtHAqkxl99KET/abG3XWJISl1/dxfXjBDNyhvBnY35eVVTB2T
         87Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9XRtQ52CU+p/K9bOX0XXRr2LFsv8GH3K5yc7uCWW98urDby/J/2U/2sVH19n5yzuirMc+9XKtokFiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nkxmClhS/13LdeyGAd3WanYd71fnYTxHpGL5QVcHiN0v++dw
	HqOQNKyZxWXI09BlfG5YIcL1wMnDpUeZqFVUgCC5SzTDz0LQCv5hvk2aHd8bxew=
X-Gm-Gg: ASbGncv5ApRuhxM8UcEmCAQs6yzA1rGkaO77oiscxJe0rdBs+cGHcSjvl1FzocPpU22
	LlZ3kQmKAII3vdyASablkfyIBE+9iZ8PDT986Cyjrnj7X0ehbIvzn12LWN02pylzZovojPaJNkJ
	5evqymthP1N2KAmcWoaKEOHG5UeTcx6w4PsuEdcsP+QXWv0wcdZbCzUjagcvLhoJP/sXMokK8CO
	94K8MjArEfB0Gj8JwU1gjPgDdaXY9fU+4hvYfJyuaowVf1HgUgTTG3cmtP7J6NqlIOpYBmw0WPT
	sjCQJKfrCF44zFXaDGZGWrLBKEBSlKfL/lU=
X-Google-Smtp-Source: AGHT+IE7DQ2pj/KUeERm3qCZ9d65Km3gnEvSTNiDUBZ2SHDIDeNSeDP69n07wAfxEAhqwpPx2pLp1g==
X-Received: by 2002:a05:6512:6c6:b0:540:2300:25d2 with SMTP id 2adb3069b0e04-54099b72a8cmr257596e87.14.1734090598971;
        Fri, 13 Dec 2024 03:49:58 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f4001fb53sm1948890e87.157.2024.12.13.03.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:49:57 -0800 (PST)
Message-ID: <12618e8f-6f7b-4578-8315-1dc3d7049688@linaro.org>
Date: Fri, 13 Dec 2024 13:49:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Restrict endpoint bus-type to
 D-PHY
Content-Language: ru-RU
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
 <9c89e6f4-a9af-4270-b266-537f3464ee32@linaro.org>
 <a047e4b8-c2d6-4486-8037-e7b854660cb1@linaro.org>
 <D6AJ8KNRUHB7.1EC9O3WSCSNIP@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <D6AJ8KNRUHB7.1EC9O3WSCSNIP@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 13:22, Luca Weiss wrote:
> On Fri Dec 13, 2024 at 12:02 PM CET, Vladimir Zapolskiy wrote:
>> On 12/9/24 14:32, Bryan O'Donoghue wrote:
>>> On 09/12/2024 12:01, Luca Weiss wrote:
>>>> Currently the Qualcomm CAMSS driver only supports D-PHY while the
>>>> hardware on most SoCs also supports C-PHY. Until this support is added,
>>>> check for D-PHY to make it somewhat explicit that C-PHY won't work.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>     drivers/media/platform/qcom/camss/camss.c | 9 +++++++++
>>>>     1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>>>> index 9fb31f4c18adee886cd0bcf84438a8f27635e07f..b99af35074cdf6fa794a0d2f0d54ecf12ac354d9 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>>> @@ -1855,6 +1855,15 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>>>>     	if (ret)
>>>>     		return ret;
>>>>     
>>>> +	/*
>>>> +	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
>>>> +	 * D-PHY is supported in the driver.
>>>> +	 */
>>>> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
>>>> +		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>
>> Looks like it would break all old board dtbs, which is not just bad, but NAK.
>>
>> V4L2_MBUS_UNKNOWN shall be properly handled without the risk of regressions.
> 
> Please see drivers/media/v4l2-core/v4l2-fwnode.c around line 218.
> The code there sets bus_type if it's UNKNOWN
> 
>      if (bus_type == V4L2_MBUS_UNKNOWN)
>          vep->bus_type = V4L2_MBUS_CSI2_DPHY;
> 
> So setting "bus-type" in dt is not necessary, even if it makes things
> more explicit from dt side. I don't think we'll ever get UNKNOWN here in
> camss.

Thank you for pointing it out, I haven't tested the change yet, but hopefully
I will find time today to do it later on, it should exclude any doubts.

--
Best wishes,
Vladimir

