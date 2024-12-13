Return-Path: <linux-media+bounces-23373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8AD9F0A0A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB095188B7BD
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B611C1F29;
	Fri, 13 Dec 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vratCu3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97B1B4128
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087028; cv=none; b=Ks9vxfcqFok1z4L3DWHVKC8dbOY7Em4OkIHwtfRyG8tyKYLAJlGUobBymAKr33ru7eakYjNMZGBOkKQsnycmw+uqlIT59DAT9Y0ol+9W5EkhVPgK5XNQUjVTaGYN0wXfH1i1iyTOA1XUMpCdopVQLKifynE+dxdGAohx3oUA+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087028; c=relaxed/simple;
	bh=gA3Q4ub77tN7sCgmbLmkx712qJth2K3MCOGVKBn36q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDRK2mNkiUgn/vdJ6gIWv6JYMrEMTLVe7Y/ejJIZfLvYO5UEX7pd/uoThGmHWAUwQNRBSJaUSdbPNsCZUk90b51cGnph9UnQJPXqadnigTX2nMXc9VCfebkbYaco6xfRcd3+NYh8b6W+4Ru2z6q1MePMT0Yflg6EaLHDKFm5/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vratCu3Z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e2ed7d951so255518e87.1
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 02:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734087024; x=1734691824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsMZoEd++TbxWw8duLL2sE2JWkwl2EC+I98Ex9pn+ng=;
        b=vratCu3ZOK2VjDZsyyhZXVv9HNetkP/G4PvP+34XY1/d+M2FUCE7vzT1LnnU2g6+Fl
         IOTvH5GXU/PjR8LtEF4LsaM1hQd5p7EFaIHDjNWmaHcZ4zdLjZDYR9mVgm8KbXwWiMLy
         m0NTcUV7sj8tLlFzUrKU3vyd6rJH9ESvg4Zb7uSfRcNJdYux600bygK421n5ybWhpZF1
         YIOeLHaILcPxIQ15A4Pa5G1QfbCZDIqTzkOMdGhrCvJHQY/wxXo/0AYkqNrRE6SwJ4ti
         IS7AnupvBIzj/Rw5sr1BB6Lj0lvBSUDy1K7xdfUqJP7BIIJyBVlMf+aw/nO8PpuelNJ1
         KqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087024; x=1734691824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsMZoEd++TbxWw8duLL2sE2JWkwl2EC+I98Ex9pn+ng=;
        b=lr+TM5wQz3xAozdqn7oAJ8Yb9ElxZS7KFslzwpKx1wQRgoFB1ftsOLi7rhRouFkJzB
         MA/Zn1w11BH1LFqOCW2oDDn7jcPLh54FOfnL/VdtIh1bchmvAkg2BwLRdtKLvkCsRK7s
         tlDiBNRm5zm82IV7z07hHn1V1Guqj/0K5gfl3EODtbq5Gskyg5kVlyaI20f5EzLyDPNq
         sW9wxNIrhZwq0MkrkxCrkTypzF+QRA67Yms+5656WJGQ9wVgcatHp1O64Q41qTGzw5wo
         ARsogkfgYamlKqLG88zXEHwAgtBUK5drRyUjros0I5LSrSrIY5RjdEzbhFWSTSsSwzcl
         oB9w==
X-Forwarded-Encrypted: i=1; AJvYcCUYRo1quSOh5/u+aJRe6NJHJv0gfBhYOsFifJu7/V9ytlVPV76f9PQToDi7vK3f0iXbfx1OAhVwEbSjzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMt3z9H9CEoVxOn/MnxsuZG71yYIjI2FybZiE6vFyXggN3uMRu
	xWOqiMlkMOiZpE+2YJkgbyKfRPW1CDLBdBNRXluVe2fvEdm8v7XN0mOpA9eIns8zMTcGM+kGGyQ
	M
X-Gm-Gg: ASbGncvmgAV/xUALq0AVa0vlWP5VK1gYUmNxPNIepiY6tAA36ahcVn3YvhHFfRbRgV9
	8P2yGziILalRZaHylE8hiRP9QrNNW6NSL5Ds8O0e0GRdU0DOga2GGieIPUC4YtCgNTy7O1YF5XF
	jVmik6uHQnEE9mhpKR5sy116sri75+Gdi/0/OubydBGn8G5SlEL8zrRuPHXCu7HHaywyRjS9eVa
	JDoFmPPXkF6XNu93NQzVt+gftLanArCN8g7fvriLmBqyrmbPw8TN9dXVmOj3aTnuv7fcAI/iSQL
	m2i8H8Nse6IHqYksUE2bll9lVt7fR2sGeMA=
X-Google-Smtp-Source: AGHT+IGw9a1uX5hBegI8/sPSllQufUgfjzOPxBgUy3/5ZZqbN7RuVYinY4oCJlX1bIMH1dO35Vhc1Q==
X-Received: by 2002:a05:6512:1594:b0:540:1b7e:c8ee with SMTP id 2adb3069b0e04-54090557f27mr229332e87.4.1734087023952;
        Fri, 13 Dec 2024 02:50:23 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54016a1cea6sm1888692e87.41.2024.12.13.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:50:22 -0800 (PST)
Message-ID: <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
Date: Fri, 13 Dec 2024 12:50:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 11:34, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>> CSI-2, but not any others so restrict the bus-type property describing
>> this to the supported values.
>>
>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>> introduced with newer SoCs.
>>
>> Do note, that currently the Linux driver only supports D-PHY.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>   .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>   .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>   .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>   .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>   .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>   .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>   7 files changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> @@ -94,6 +94,10 @@ properties:
>>                   minItems: 1
>>                   maxItems: 4
>>   
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>>               required:
>>                 - data-lanes
>>   
>> @@ -113,6 +117,10 @@ properties:
>>                   minItems: 1
>>                   maxItems: 4
>>   
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +

But is it really needed to specify the single supported bus-type?

I believe it is not, at least it's not ever done for other media devices
like sensors.

Here I would prefer to get a comment from Linux Media and/or DTB experts.

--
Best wishes,
Vladimir

