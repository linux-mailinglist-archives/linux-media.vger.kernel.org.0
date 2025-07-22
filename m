Return-Path: <linux-media+bounces-38207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C396B0D54C
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 11:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 272EC18923B9
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC762D59E8;
	Tue, 22 Jul 2025 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQYWW1tm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415292236E8
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175298; cv=none; b=cH/eF9Ai7PvIkUi/9A+JH4PnCvMSODgwK+JWzyMa/5q92m009jcb64Qg4a9kl7ciXQE/hbCv+bpy5D0AOl81QFHbyTe6WAlgh7qzKH/8ivMcXy7hR9zr7ICWNiQsz9/TYpQwnif2pKJImv97WsrBc1e7+ahPICIXcCXLY+pzmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175298; c=relaxed/simple;
	bh=83y5T3BM2ZAJfHW+ZSwnCHCOGkeZBOQGBR5TAJpsVHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fU1KjyiNM6ieu1UD4q0Erlw97srqvhDVGC06SDqtDR/W4bZRHrxx+HmbyeWK60Z/wZKRfYPYpcJK4DB/qbZjo7HBI4IXtXHtomyNPPLly14O/pw+ly+ehAYbE4xnE5gTucPy54FVf9q64ApV5ZVVDiJadoTqFZMJf1KYfFZwG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQYWW1tm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so23927215e9.3
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 02:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753175294; x=1753780094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=On3JvqZOf5viVWmDtf1F5EeuSK6iuUoSgcnf4ZkG6MQ=;
        b=OQYWW1tmk8QoyecUn/2m5gL34JQVn5XkNTNdVTp5VHbJ8WGisQrKd/zf3DX/fsozq+
         6+KfiAY4zwzwIpLYtV1iLOnEfqf18fdt4hWGMLCp664D5JNO9IXOxNDT14oUlYy9ERF2
         XFMGvA5Orv4GbSoHLYRX/oHoJayimuWFBS+02fNtWom0ry5UKObAQu+PissT7eSVf7DW
         igxOzdjeCHnbv0guO1FcY7bq8ytgZaQO7NUg9BCY8yDZDd03/YHg0C77rgUOt6m/b2Xr
         OKU3x0jzBwx+FJu7Nk45iXAfxitXOeWRkFS36nvB7F8RdLwIy9gKvvoW4kHyNq2gJqwJ
         +lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753175294; x=1753780094;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On3JvqZOf5viVWmDtf1F5EeuSK6iuUoSgcnf4ZkG6MQ=;
        b=fgEm9xViGpJ7yfsEjnF4IoCsVifNY3py89qxCY1sM0FlKy3ChTCFqwtwZPgZ/oMMwq
         bEeywsyzp0OBR63/IRpG/nMT6bGa1IHnPnJwdHnZ4/8iE7iHAlTC2CBEb0k3mu5cSXzn
         /lzGdsUAt0HDuyLEx95Wc0NJrJWh4Pl68fype6iqGa67VNaOiSYK4O0dZzE3AelfGRXe
         pwHPnKkJ0EdhWmT4Ci0cMZRRFJWEGZBIRMumZJj4WF9RsAtsmsKtU/D7/P0zkWdZwnnK
         pZCxsVk1+vE2zyliT66IOegiDkq39stNquo4ax5nP4C31xhZn6p/PPOiYcDb/Zw2IUJ+
         TJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWV58H0OSIl258gTYsK2l3MIyPElpzUsom+OvkMczEjhuHTPP/phO+tfqHJ3sqSWHsEHrupAHJGZksOlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6PqtndWKIODloLUxMPcwCzvEx51DDnEdtmfjogPyVCb8xjOu
	QNByEwYkJJZu/Etg5ZYe88ynzcmdAwRxwrzLwhguh3RvrxQ9WkaxGW46ZDFUXiwXWDg=
X-Gm-Gg: ASbGncs+X1OvuyTp0DuNT9eKayoe5sIKfd97btDTklXhVLfRFD6VJa78LSWwv0E9AQI
	pcP0Dia16KvOlXesQvUN68bZwh0yVDGMFVgJeUTiPKlrCvPlj2OnvrkBxLRZOEMB2acjG/ZGQoR
	hVqFvaHvS3cozJcgvZwLGRJy+13M1zXyfFl9N9biWZlyWolLbJQG3LyETUpparJ5wIQ6RmPc6Ky
	8HCQc/KV/rbIHwohjAPeq5gXSmiz/DU15aVqANaS81YOtELQl2rmGrnDInBTJ1geU/teGUH9IgQ
	uWwRFfA9MlgBZvge6Rr5W1sovQ4uD3arOg7xu+A+VhM44Shj7aQEyNHkOi4be4Eu6imc8prpbcB
	5oi3BluMkrkyo60pEPg+VhzgR3yiHVcQOnv1cidZPseDvD+EtgRA890mu+d93PbwD6+uCWgCpcg
	==
X-Google-Smtp-Source: AGHT+IGIe5v+xkseT1R+b83ynGM35H1dtttBfIBKdXEdhjXXuEssWueZy6PEB6lRJfSUU+5XBI6EAg==
X-Received: by 2002:a05:600c:8b85:b0:456:2347:3f01 with SMTP id 5b1f17b1804b1-456355c60d3mr166991665e9.20.1753175294468;
        Tue, 22 Jul 2025 02:08:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca253f9sm13035086f8f.6.2025.07.22.02.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 02:08:13 -0700 (PDT)
Message-ID: <4edefe21-27b6-4884-befa-ddb451bb9376@linaro.org>
Date: Tue, 22 Jul 2025 10:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
 <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
 <3UXVZ6ANM9mDjVdMV4SXsiIx_pT3S1lp3RC_Q7mh_o7jF2dpYsni1Sl2TAWv6OCMCRTFmi9aE6BxDquGkOnwEg==@protonmail.internalid>
 <8b908a20-0bf3-447d-82ea-a5ecee1bf54c@linaro.org>
 <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
 <33d76d7f-ab14-4e76-8ffb-eb370901a046@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <33d76d7f-ab14-4e76-8ffb-eb370901a046@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2025 09:32, Neil Armstrong wrote:
> The whole key point here is the combo mode, as I understood the combo 
> mode feature
> makes the PHY lanes available as 2 separate streams, like if you got 2 
> "controllers"
> attached to the same PHY. So in fact, the PHY should have a single node, 
> but 2 PHY
> interfaces in combo mode.
> 
> This makes all this controller/phy model very complex to handle and add 
> a lot of
> logic in the camss side. Moving the "csiphy" as an independent media 
> device that
> can declare up to 2 endpoints in combo mode makes things much simpler, 
> and allows
> us to attach each "csiphy" stream to any "controller" side of camss.

I think there should be a generic extension to PHY/linux-media to 
support that instead of something Qualcomm specific.

The first task is qcom/CAMSS specific which is separate the CSIPHYs out 
from the CAMSS block - done in this series and do so in a way that 
doesn't break the existing ABI - done in the context of adding Hamoa/x1e.

The second step should be to extend the existing linux-media and PHY API 
to support multiple sensors on the same CSIPHY in a generic way.

If you want to ship me some hardware, I'll help.

---
bod

