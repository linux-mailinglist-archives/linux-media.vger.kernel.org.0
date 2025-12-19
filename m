Return-Path: <linux-media+bounces-49176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3E8CD0332
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1E8C3019D9A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C554632860B;
	Fri, 19 Dec 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ru0fzdn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F12327BF4
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153195; cv=none; b=b1qth3xdwEayKp0moq8gXUjjhhP518DEU/DQ5dtQq8qdFLtzNXqij3unUhNy3ppB9mn64OPLY11lMPGCMY/gK9y9M8psUSSMcRYRfZnZ0oPWe3yBua82HJ0D1MZ3OulgaXJQuwilBrvH71GnGGMXeyApWEbKPryI2cqvxVYLwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153195; c=relaxed/simple;
	bh=egFzCMnGOD3tJo+4vJ8btYz5dTAD6NLL/56REmlPA40=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i3FlYP6/v4+/4K7+Uqz0WF7uI88yn2wRzbMYxtqtAqJqEO0X4YbUZ6nogSCmYgIYOkxvaQMpw77n1ijTZOvA9BPYivllc91/ftkjBm4A38COZIXgeZ7nMRIMUnwE/shDZdU4Mh30RzM0no928fZ7kcKiUND5gkGfJMeAUFNpXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ru0fzdn2; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso2245124a12.3
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 06:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766153190; x=1766757990; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPBoI4RkzL5cm0xuXI21DUKNk04nFE+PV9GWAo62RZo=;
        b=Ru0fzdn2XnoEObwjbCNWmkMN2t7QqrT6cR97kIxMyxz+JhsJMBpJoz3SG5DYov5M/z
         tf97jZc7wOpAdVjmSKbmfsOHziDx896vcLnQSFM6KrYuM/3/RD0azeeloMYoUrSnFWWZ
         EmL4pMJdMBEmoQuC1HHXNsco1lAn5chTiGCqCjBhzSMMmfLa2w/hyD/Nf+x1j2fSlJk/
         9uCgiPi+gt8Kz4n5KXsL8Sk18aZFpG4PpeawuawjDpwRNJT9hjmMaGB5YxgV5DByZAlE
         cEdYCoD8IvmSC9vzx/HuMFSm0GHr84xeZfZ0fAqqMXBVF1nN7jhAzLG733uY2T+g3mMk
         Jcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766153190; x=1766757990;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPBoI4RkzL5cm0xuXI21DUKNk04nFE+PV9GWAo62RZo=;
        b=JIW81jlFRyeqk/Cw+EQFmNvTwfZd1SNFXX3jOPp0le+9MabqsmPuGpV/WD/G/+DCcH
         Eja+2pnaI45vh3heW+F5N0Oih/WrAQIeXjYvzvV6N+24efaSpITJTVlWavSG+3pXarwW
         RPcJN1tC+0RMP978kuLS6ZyD0/WQ1jqMCmI0+DFuPBGipLqSL6gis9EkDBY9HDiqAFtq
         TUVct/0PxmpRD/tzTtZ/zD/WvhoeSUYc1vKAZcu0os+F09bXrj1we48gyrFGJttF2+YD
         GuJ2yv+jlMaITrymMftKs6cmC8RQmn0D8Dc3npKIGEP0mtOGdBUbkv8gU3Rk9DxlHkfJ
         3jeA==
X-Forwarded-Encrypted: i=1; AJvYcCWWetI1PDHaJomJdfJawm9CcpueDdxCW9vvG5bLXjWSOSmdBf3QUzATEHu+nS13+p3OesyaE9Kc+EUL5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoRjsuGVjNdvK2i75/eGXHZ6LvddLtsUJv8K4RigQ+c+XoWD+
	KP4SDNS92+iye3rklLWsraTaOf3wCZtz3xE8PIJ22MfSb+YA7o+p1EJ8AyNQsEHYo1w=
X-Gm-Gg: AY/fxX7+cg4PotOWBdWgqfkmiBGmaC5yolXK0Js7endUnqKol8EAhPymeEiIdcOPabL
	9pPE8z0Fk/FDk3BXz2UuSbcsWaom+llI85U8uWmYgcFq5HJWMlcyHa3mvk1WagyizkuinlWpoyx
	4zqoQHuPa7yWVaHD5pRng/z7jzTWiaX6f52+t74kvYOiYSC9zpwKyL7crAxpXQksyplforepE8z
	S88DQeN5GOi8J53Qh8Jt1jgcvnU4c/54vL1Bm5glxRfgCWvWW2L6EmxLiKW09B2Vtst45yU0UpN
	QKsCpGR3IgEK5vRgQisbedbosSrqW29nv4dqz/GN4hpRfywA1y4fGvFB3MyaEjHZBn66dwz7seO
	ZONcnPcwdPYl9J8efFa6NDYKCYP2+xN8VDVL3iO6MtkjV9hjEZ3obFB+KzkOL+sReyS7uZdW9jz
	vL1+eJUylXEf7lwOotPvcpGX2bZy0bu+2MpVviKCg9qLVtz+A/3r8P61WOqCICYe38NNYql0EEe
	fskgtPxauFPYnpdZlSHg/fh
X-Google-Smtp-Source: AGHT+IE1v4c+8Sd4pe4o1DRqdOiLKSjOHSK0siHKrWox12nqjHle8Ep3VA4xCcrMCIW/7ulCvQnm0Q==
X-Received: by 2002:a17:907:d87:b0:b7a:1bde:1223 with SMTP id a640c23a62f3a-b80371e923emr294366266b.64.1766153189822;
        Fri, 19 Dec 2025 06:06:29 -0800 (PST)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm243460266b.23.2025.12.19.06.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 06:06:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 15:06:28 +0100
Message-Id: <DF291XT4MOYA.3OVO84CAJKJ5R@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, "Luca
 Weiss" <luca.weiss@fairphone.com>, "Robert Foss" <rfoss@kernel.org>, "Todor
 Tomov" <todor.too@gmail.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
 <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
 <r6EgtiSu8pqs2ouFERTw7fx8kYZ3RcSbGklwd17UPxNGGd3sbRDl2BPyplkABZVu3qyfrIzRMisa0qTSrm89BA==@protonmail.internalid> <DE8FV81S45S5.CH6K1QAX940D@fairphone.com> <a428f8b9-c338-4404-8dc1-da6daae37d5c@kernel.org> <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org> <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>
In-Reply-To: <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>

Hi Bryan,

On Sun Nov 16, 2025 at 3:05 PM CET, Bryan O'Donoghue wrote:
> On 14/11/2025 17:06, Vladimir Zapolskiy wrote:
>> On 11/14/25 18:09, Bryan O'Donoghue wrote:
>>> On 14/11/2025 13:06, Luca Weiss wrote:
>>>> Hi Vladimir,
>>>>
>>>> On Fri Nov 14, 2025 at 1:40 PM CET, Vladimir Zapolskiy wrote:
>>>>> Hi Luca.
>>>>>
>>>>> On 11/14/25 13:15, Luca Weiss wrote:
>>>>>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0=C2=A0 .../bindings/media/qcom,sm6350-camss.yaml=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 349 ++++++=20
>>>>>> +++++++++++++++
>>>>>> =C2=A0=C2=A0=C2=A0 1 file changed, 349 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-=20
>>>>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-=20
>>>>>> camss.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..d812b5b50c05
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>>>>>> @@ -0,0 +1,349 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>>>>>> +
>>>>>> +maintainers:
>>>>>> +=C2=A0 - Luca Weiss <luca.weiss@fairphone.com>
>>>>>> +
>>>>>> +description:
>>>>>> +=C2=A0 The CAMSS IP is a CSI decoder and ISP present on Qualcomm=20
>>>>>> platforms.
>>>>>> +
>>>>>> +properties:
>>>>>> +=C2=A0 compatible:
>>>>>> +=C2=A0=C2=A0=C2=A0 const: qcom,sm6350-camss
>>>>>> +
>>>>>> +=C2=A0 reg:
>>>>>> +=C2=A0=C2=A0=C2=A0 maxItems: 12
>>>>>> +
>>>>>> +=C2=A0 reg-names:
>>>>>> +=C2=A0=C2=A0=C2=A0 items:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid_lite
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy3
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite
>>>>>> +
>>>>>> +=C2=A0 clocks:
>>>>>> +=C2=A0=C2=A0=C2=A0 maxItems: 30
>>>>>> +
>>>>>> +=C2=A0 clock-names:
>>>>>> +=C2=A0=C2=A0=C2=A0 items:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cam_ahb_clk
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cam_axi
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: soc_ahb
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: camnoc_axi
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core_ahb
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cpas_ahb
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy0_timer
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy1_timer
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy2_timer
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy3
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy3_timer
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: slow_ahb_src
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0_axi
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0_cphy_rx
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0_csid
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1_axi
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1_cphy_rx
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1_csid
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2_axi
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2_cphy_rx
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2_csid
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite_cphy_rx
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite_csid
>>>>>
>>>>> The sorting order of this list does not follow the sorting order=20
>>>>> accepted
>>>>> in the past.
>>>>
>>>> What file should I best reference?
>>>
>>> Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>>
>>>>>
>>>>> I'm very sorry for the vagueness, but I can not pronounce the accepte=
d
>>>>> sorting order name, because it triggers people.
>>>>>
>>>>>> +
>>>>>> +=C2=A0 interrupts:
>>>>>> +=C2=A0=C2=A0=C2=A0 maxItems: 12
>>>>>> +
>>>>>> +=C2=A0 interrupt-names:
>>>>>> +=C2=A0=C2=A0=C2=A0 items:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid_lite
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy3
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite
>>>>>> +
>>>>>> +=C2=A0 interconnects:
>>>>>> +=C2=A0=C2=A0=C2=A0 maxItems: 4
>>>>>> +
>>>>>> +=C2=A0 interconnect-names:
>>>>>> +=C2=A0=C2=A0=C2=A0 items:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ahb
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: hf_mnoc
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: sf_mnoc
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: sf_icp_mnoc
>>>>>
>>>>> Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabli=
ng
>>>>> IP to produce raw images, and one day you may use them somewhere else=
.
>>>>
>>>> Ack, will give it a try.
>>>
>>> Disagree with this.
>>>
>>> See the Kanaapali patches. I'm asking new submissions to be as complete
>>> as possible, instead of limiting the hardware description to the RDI.
>>>
>>> So listing the ICP noc is the right thing to do.
>>>
>>> So please include register banks for
>>>
>>> - bps
>>> - cdm
>>> - icp
>>> - ipe
>>> - jpeg
>>> - lrme
>>=20
>> This suggests to get a DT backward compatibility lock forever,=20
>
> I'm not entirely sure what this comment means.
>
> The objective here is to get a full and complete DT describing camera=20
> hardware that can be consumed by
>
> - CAMSS RDI
> - CAMSS RDI + future goodness
> - FreeBSD
> - Any other DT consumer of upstream data perhaps even CamX
> which
>> makes it
>> a very bad advice, which is favourable for just the single interested=20
>> party,
>> which offers an alternative to the upstream CAMSS.
>>=20
>> Anybody who wants to get support of any CAMSS ISP functionality above RA=
W
>> images shall not add anything unrelated and unsupported.
>>=20
>> The asked inclusion shall be done later on safely, if ever needed.
>
> As I say the objective is to fully describe the hardware in DT, not to=20
> describe only the RDI path.

So far I've gotten this diff on top of v2, not quite sure how to
continue further...

Please advice how to turn these resources into a usable dt-binding.

I'm also a bit worried that it'll be subtly wrong due to all the
additions being impossible to test for me.

Regards
Luca


diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
index d812b5b50c05..340bf03ffe91 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
@@ -203,6 +202,23 @@ examples:
                   <0x0 0x0acb6000 0x0 0x4000>,
                   <0x0 0x0acbd000 0x0 0x4000>,
                   <0x0 0x0acc4000 0x0 0x4000>;
+
+                  // ICP ?? =3D=3D qcom,cam-a5 ?
+               // <0x0 0x0ac00000 0x0 0x6000>, // ? a5_qgic
+               // <0x0 0x0ac10000 0x0 0x8000>, // ? a5_sierra
+               // <0x0 0x0ac18000 0x0 0x3000>; // ? a5_csr
+
+               // <0x0 0x0ac87000 0x0 0xa000> // "ipe" IPE (Image Processi=
ng Engine)
+               // <0x0 0x0ac6f000 0x0 0x8000> // "bps"? BPS
+               // <0x0 0x0ac6b000 0x0 0xa00> // "lrme"? LRME
+
+               // <0x0 0x0ac40000 0x0 0x1000>, // ? CAM CPAS: cam_cpas_top
+               // <0x0 0x0ac42000 0x0 0x4600>, // ? CAM CPAS: cam_camnoc
+               // <0x0 0x01fc0000 0x0 0x40000>; // ? CAM CPAS: core_top_cs=
r_tcsr
+
+               // <0x0 0x0ac52000 0x0 0x4000> // "jpeg_dma" JPEG DMA & Dow=
nscaler
+               // <0x0 0x0ac4e000 0x0 0x4000> // "jpeg_enc" JPEG Encoder
+               // <0x0 0x0ac48000 0x0 0x1000> // ? CPAS CDM
             reg-names =3D "csid0",
                         "csid1",
                         "csid2",
@@ -216,8 +232,12 @@ examples:
                         "vfe2",
                         "vfe_lite";
=20
-            clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
-                     <&gcc GCC_CAMERA_AXI_CLK>,
+            // CAMCC_FAST_AHB_CLK_SRC + CAMCC_ICP_CLK for qcom,cam-a5
+            // CAMCC_IPE_0_AHB_CLK + CAMCC_IPE_0_AREG_CLK + CAMCC_IPE_0_AX=
I_CLK + CAMCC_IPE_0_CLK for qcom,cam-ipe
+            // CAMCC_BPS_AHB_CLK + CAMCC_BPS_AREG_CLK + CAMCC_BPS_AXI_CLK =
+ CAMCC_BPS_CLK for qcom,cam-bps
+            // CAMCC_JPEG_CLK for qcom,cam_jpeg_enc / qcom,cam_jpeg_dma
+            // CAMCC_LRME_CLK for qcom,lrme
+            clocks =3D <&gcc GCC_CAMERA_AXI_CLK>,
                      <&camcc CAMCC_SOC_AHB_CLK>,
                      <&camcc CAMCC_CAMNOC_AXI_CLK>,
                      <&camcc CAMCC_CORE_AHB_CLK>,
@@ -246,8 +266,7 @@ examples:
                      <&camcc CAMCC_IFE_LITE_CLK>,
                      <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
                      <&camcc CAMCC_IFE_LITE_CSID_CLK>;
-            clock-names =3D "cam_ahb_clk",
-                          "cam_axi",
+            clock-names =3D "cam_axi",
                           "soc_ahb",
                           "camnoc_axi",
                           "core_ahb",
@@ -277,18 +296,24 @@ examples:
                           "vfe_lite_cphy_rx",
                           "vfe_lite_csid";
=20
-            interrupts =3D <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+            // 469 for cpas-cdm
+            // 463 for qcom,cam-a5
+            // 474 for qcom,cam_jpeg_enc
+            // 475 for qcom,cam_jpeg_dma
+            // 476 for qcom,lrme
+            // 459 for qcom,cam-cpas
+            interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>;
             interrupt-names =3D "csid0",
                               "csid1",
                               "csid2",
@@ -302,6 +327,9 @@ examples:
                               "vfe2",
                               "vfe_lite";
=20
+            // MASTER_CAMNOC_HF0_UNCOMP -> SLAVE_CAMNOC_UNCOMP ?
+            // MASTER_CAMNOC_SF_UNCOMP -> SLAVE_CAMNOC_UNCOMP ?
+            // MASTER_CAMNOC_ICP_UNCOMP -> SLAVE_CAMNOC_UNCOMP ?
             interconnects =3D <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIV=
E_ONLY
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACT=
IVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAY=
S
@@ -315,12 +343,18 @@ examples:
                                  "sf_mnoc",
                                  "sf_icp_mnoc";
=20
+            // <&apps_smmu 0xd40 0x20> & <&apps_smmu 0xd60 0x20> for lrme
+            // <&apps_smmu 0xd00 0x20> & <&apps_smmu 0xd20 0x20> for jpeg
+            // <&apps_smmu 0xca2 0x0> & <&apps_smmu 0xc40 0x20> & <&apps_s=
mmu 0xc60 0x20> & <&apps_smmu 0xcc0 0x20> & <&apps_smmu 0xce0 0x20> for icp
+            // <&apps_smmu 0xc80 0x0> for cpas-cdm0
             iommus =3D <&apps_smmu 0x820 0xc0>,
                      <&apps_smmu 0x840 0x0>,
                      <&apps_smmu 0x860 0xc0>,
                      <&apps_smmu 0x880 0x0>;
=20
-            power-domains =3D <&camcc TITAN_TOP_GDSC>
+            // ipe_0_gdsc for qcom,cam-ipe
+            // bps_gdsc for qcom,cam-bps
+            power-domains =3D <&camcc TITAN_TOP_GDSC>,
                             <&camcc IFE_0_GDSC>,
                             <&camcc IFE_1_GDSC>,
                             <&camcc IFE_2_GDSC>;
@@ -329,8 +363,14 @@ examples:
                                  "ife1",
                                  "ife2";
=20
-            vdd-csiphy-0p9-supply =3D <&vreg_l18a>;
-            vdd-csiphy-1p25-supply =3D <&vreg_l22a>;
+            vdd-csiphy0-0p9-supply =3D <&vreg_l18a>;
+            vdd-csiphy0-1p25-supply =3D <&vreg_l22a>;
+            vdd-csiphy1-0p9-supply =3D <&vreg_l18a>;
+            vdd-csiphy1-1p25-supply =3D <&vreg_l22a>;
+            vdd-csiphy2-0p9-supply =3D <&vreg_l18a>;
+            vdd-csiphy2-1p25-supply =3D <&vreg_l22a>;
+            vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;
+            vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;
=20
             ports {
                 #address-cells =3D <1>;

>
>>>>> I believe this clock is critical, and it is set so in the SM6350 GCC=
=20
>>>>> driver,
>>>>> therefore it should not be added here.
>>>>
>>>> True, gcc_camera_ahb_clk has CLK_IS_CRITICAL in gcc-sm6350.c
>>>
>>> DT describes hardware, not the happenstance of Linux driver setup.
>>>
>>> On that basis omitting <&gcc GCC_CAMERA_AHB_CLK> from the clock list is
>>> not correct.
>>=20
>> This has been already discussed, an enumerous amount of Qualcomm/MSM
>> specific resourced like clocks enabled in ABL, Linux etc. are considered
>> critical and not described in the dtb.
>
> I still think the argument for that is tenuous wrong in fact but, I know=
=20
> you are right, this is a lost argument.
>
> @Luca please _do_ include the full array of registers/clocks/nocs as you=
=20
> find them and yeah drop the AXI clock from that description because reaso=
ns.
>
> https://lore.kernel.org/linux-arm-msm/20251113-add-support-for-camss-on-k=
aanapali-v6-1-1e6038785a8e@oss.qualcomm.com/
>
>   ---
> bod


