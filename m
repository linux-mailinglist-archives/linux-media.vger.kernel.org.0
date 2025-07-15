Return-Path: <linux-media+bounces-37723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D7B04CB4
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 02:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57B594A79EE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 00:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0211CF96;
	Tue, 15 Jul 2025 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0IleP0s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71594431
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 00:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752538387; cv=none; b=WhGpUL3Wn8GLBWMkNgzLRToS+hZveAaYSElJbJGXBh9wW1eQSbpz2nKU3KpCKXaBbt+Lrh1aoUZym0dX4oM6HuqGDO6jhKSJCP8OQEKCAIslQM4ikMXv+tewyjJZRSCIx/cKrbq0oesBIQZVxkq1hIxgFbfeBvqE2Jw8GM6nSKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752538387; c=relaxed/simple;
	bh=Rtl+kg8lua8MhwuqM/aGV9rwRAtERpeCerUyDwG5VV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIahvEB55bGPi72rju0CQgX0MTFeuzPZxnA126Jf2KKO4SXbydMakt6pBvUB0GWQ6gdyg0MUwvQexwVoCiWGu9zFftV4H5u8biVIurUQja+P6OpBqiHYglptDve6Mw/dwsWvFoSlGGBIKXbX4x/rgHyuPYwo0qAy6NSepO+X6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0IleP0s; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so2519527f8f.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 17:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752538384; x=1753143184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjjlBO5McvqWYarNTItF1TpVtLRk0nuxtxgk1AQtFqQ=;
        b=M0IleP0sgw16y9WgCJk1fMPr3BfjtpxZ9QmUcTNtm/VRqp4gqZG9O76aHOKECZ8k1g
         Z6mYeaB9lc3GJVhWOB2wTR/W9jCl81CnBaiEml18OL3SrESnG+UTr8bTk18qv/vWdIiw
         eZqVN9ghaFBKJw4cSXv2p3pMPuu3h0Z476pppv5gdofex5H+T1nXCRGzGmIq8k94QDv0
         MgsFJyI29O5frBN76AC2ZLJH9wGRH3qYHo6SXTOYOjweA4s5yNB3pc5fNKH+cVaHBYUM
         zIDIwToO9+TGghAO3AVcNdr2ZrhRu6uHjkB7ADCPea+r/10nu/VlR+axewJMzoa+HIt+
         Q7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752538384; x=1753143184;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjjlBO5McvqWYarNTItF1TpVtLRk0nuxtxgk1AQtFqQ=;
        b=TJNGenvkU+Xbd0Di1FmpMjVUHQQxyBRmbA47XqZCdtFvqFYPf6EiMHKqL6lBP9C73z
         /W5UapQDSwowR85BC5sGgKn3DJ/FyOfzQcD9ZT3gdcp7IEUGTQ+SgMuf/eufXJGecZeJ
         xtpn7XDeya5nBSX9g11WEGQualhB6z2y9o1cSC3Gd58YQgAiu+I2VVrc3soSYO2u6Ec6
         h4tSYDswpmWbHzzM9BcmrF2on9Ne1q0zS6SmorKDAjq3uDiKo9mv4IDbXpY2f7dO6Urr
         ojm2iifixiF/MAKPk0CreUmO94wW92WoqA4kWoc1EaRn+KtCYajgjHp80/bNl7FJA2MV
         6Txg==
X-Forwarded-Encrypted: i=1; AJvYcCVdUMTmCuA92bFXnJT/Axs2T5ReehlMTmpudkgbXJsr+qcmYiKOlIqemWPjurzZd2ck3SiQ3iuN+b3iaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5L/284uNAIo/Axk2drurQywLBRXWIypcEwMZB+G4+31D3OVr2
	iqTfb2uBmmC+Q7uSB02QoDeQ3uCfjTCq8VA2IaFqy2rtrWMCo01ZX3Ef7ekbfNkz8n0=
X-Gm-Gg: ASbGnctpAPPAee9WVb62dPY6H0l7+0JYGjrxDiebzKUxXTB2GQehsKeJN3yk2Jt8PyA
	ktNd7Q49K/3ZTvXOmWaYNMbzvDT9SgxatT1luif36z2yJB6Vtr7VVOS69E5DbqW7BOJvGmzoumM
	RBX386CMha0fBHnOzcNNGB7BQ72OWBKyL0YFv/qpmMIpX7Q4aWKB/2nGA1smFCaQGOU9CRl0xuQ
	IrLtFOHc99td3cfHaaXdPmbZmYtZ4r1kLuMFRuny6/OaTuNl+sZPl5VzPEoj+X3DArCVVaWkhcd
	V6JM/0PbUkedxhhX02gjhGuKS4JN/IJWQwJuMpdFOGCOn2JHM1KWzTert3ruqpIuGZ1X5w4HoTC
	oUyU3qYwbm+vykEeJ7bGIRQiFuUOX9gtm46Urxmwby2LVN/thZoQyIYN+Qd04lZ0=
X-Google-Smtp-Source: AGHT+IFJd4axtAtvmY0ckIvQbLgd8yggih4zpyTmoTOUg1GtduaU49kxIVWw0qgHHk8eix9/zHH8ow==
X-Received: by 2002:a05:6000:e0a:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3b5f18cebeemr10550712f8f.33.1752538383914;
        Mon, 14 Jul 2025 17:13:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e211dcsm13335901f8f.84.2025.07.14.17.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 17:13:03 -0700 (PDT)
Message-ID: <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
Date: Tue, 15 Jul 2025 01:13:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>
>> I think that is genuinely something we should handle in camss-csid.c
>> maybe with some meta-data inside of the ports/endpoints..
>>
> 
> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.

All the PHY really needs to know is the # of lanes in aggregate, which 
physical lanes to map to which logical lanes and the pixel clock.

We should add additional support to the Kernel's D-PHY API parameters 
mechanism to support that physical-to-logical mapping but, that's not 
required for this series or for any currently know upstream user of CAMSS.

> Please share at least a device tree node description, which supports
> a connection of two sensors to a single CSIPHY, like it shall be done
> expectedly.
&camss {
     port@0 {
         csiphy0_lanes01_ep: endpoint0 {
             data-lanes = <0 1>;
             remote-endpoint = <&sensor0_ep>;
         };

         csiphy0_lanes23_ep: endpoint0 {
             data-lanes = <2 3>;
             remote-endpoint = <&sensor1_ep>;
         };
      };
};

&csiphy0 {
     status = "okay";

     vdda-0p8-supply = <&vreg_0p8>;
     vdda-1p2-supply = <&vreg_1p2>;
     phy-mode = <PHY_TYPE_DPHY>;
};

sensor0 {
     compatible = "manufacturer,sensor0";
     port {
         sensor0_ep: endpoint {
             data-lanes = <0 1>;
             remote-endpoint = <&csiphy0_lanes01_ep>;
         };
     };
};

sensor1 {
     compatible = "manufacturer,sensor1";
     port {
         sensor1_ep: endpoint {
             data-lanes = <0 1>;
             remote-endpoint = <&csiphy1_lanes23_ep>;
         };
     };
};

---
bod

