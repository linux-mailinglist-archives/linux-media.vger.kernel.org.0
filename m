Return-Path: <linux-media+bounces-31205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1CAA9F09B
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 033771779DD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAED3269B0D;
	Mon, 28 Apr 2025 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtCdP0sL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEB7267B67
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843181; cv=none; b=Mk5fC87omDdUT9PsySc4nQJahY+dApsIHcKXdOh8pi2qbzjGGC5R2wfvUcsjEVcKQEFM79DPkA3B7r3Jo714VgHji47F7pOkcTeqi0yuecVSryFK1x7a2GM0khxLi7xCT0NL0mhlodriBYAGyXkSKcRBU0jOOmfyxb33KDOqTxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843181; c=relaxed/simple;
	bh=lYzVuTzAO0lXDW/pRfcCGAFRK6nd4EKEBMQJ2wGtWGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xr3bFe2ehyQwMRa8D5pRxLtICYCnsRwbAiS6bDdCdd/mCT5JLTARaJf1i/BVWe2S5dZYDHwFrfjboBJiruy5C5OsmdkpHMM+ayUUqF+NHuuLXOHl77k40NmaxSe3OgdKZaE4lEV+uUl4wqE32awuMSv84hQN4eoQpCKCSXuYWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtCdP0sL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3637921f8f.2
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745843178; x=1746447978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=co5BIfbnH6mxdq8sV4aN5bUuF/8OaVGlXIVj8UR5Su8=;
        b=mtCdP0sLYdmBWtE7zrsvTAWe+fB7P7k1TyH+JY3IwBR10sYigzRvhOXb5jPpaEYm2E
         rMQJg9gsER3dfaMNoMPQUbkse8QNKofZW8CSSGdpgIoD8gMT83RXmKcgzKbD1d0Hxz+S
         kxwqh6mbYq1f67jvH5BpDPDRjv5Aj62QY9FmC1aQiY5mGUt2sVEdfMysW613+fwBbzyG
         t+r7xa5Txm36+mGZN5OVMfs1uA8d+Z0i++oam4fjQNYGMTcIKQBvyZRqngiyGNlQprre
         +EL0XlosplxlT1hNRyBzoFn3ysFvJ78lDgQZ703O+TOqT462eF4S4TPR/vL6lROU9g6e
         heCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843178; x=1746447978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=co5BIfbnH6mxdq8sV4aN5bUuF/8OaVGlXIVj8UR5Su8=;
        b=fb0r2t22lo4s/5d4mI6OTU2mGC4qzr1bN/pfEqPdkAlS4+uwVJaJtzyLq6bk1RyqiI
         1Cjzt5jiIW+FM1TKRlPpTp8J1QdzGaZWbzmsDeTFunQnzYafL61M6c4DQ6zC6sduNdPM
         13hiInjMruEJeifr7392+mjA7VncJVju0TQQQuwTAdi4yDBGGumqpFJkcjx7xZDIGale
         DU4zGbYxCw9xTb1ZJFKgInrk8tZDj7HhOEdaVCeUVuQHxKDLnIvLWfECmj0gSCj6nyiI
         BbT6hpgEPMRY2zkS/lJ/NQ/RgvEAZbdY3XVo7tcW9tI/wnyNeHA0CaZORbHdi/nUiEbX
         FwEg==
X-Forwarded-Encrypted: i=1; AJvYcCXAPIy+Ywea/0Pkn+K6vtBerOXTpL41KvuvAZ6w8XMpTrIam6s1t4yR6vWzstO2s0wjStcKxwwfhpnNmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVElLZ71n5t999m7F9sjDFWJiJWK78ZZtNBACNV9dtQS+u4PA
	tjVW+3T/BDtlxxHBn15XFC9tqyW8sJseRotis7xZ/jkN0wBQC/uKV+JT2Dr+OEQ=
X-Gm-Gg: ASbGnct46pEMZ0oqRg0bisIRDipBybzIN2P7rf/dmyWDecVHfULDB0GVeFzs9sruzsv
	bOoPD4SsPrwa61DUUViq/LYTDWhAFCzo9CHyrZjlls9XSMovMjnoF7R7ASKhAiHjmmtYBIH4Rzg
	x2LMxuXJ2a9Gdhban2h9LSiQ+VLWfesYpgB8hC/d6fCdTrRax8Sn0ZxVBogkuu702ufzsZ4QpZ7
	9GBDLoK/RUGx2VES4SoMOQLeHw80Y/CXmF1HlK3SgqYo88M9+5ZOU4HqYKTTs6/abVw0yHgn06Z
	75bv/OdlifhdDF7jBSSqrRhvRdEW7DXoZLp6DqUDPdKaS/lbzq7KEy/RbToI3otyxDgP8iU80Tg
	onWgF9Q==
X-Google-Smtp-Source: AGHT+IFtg5gANdNSZfspUoCUzrUK2EdsGN0jIu70mhAaQLR0b//Q691XryrnFCuvoB6b7ZknFBW73w==
X-Received: by 2002:a05:6000:430a:b0:3a0:8495:d66f with SMTP id ffacd0b85a97d-3a08495d6admr2559745f8f.23.1745843177763;
        Mon, 28 Apr 2025 05:26:17 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d4b0sm10933059f8f.89.2025.04.28.05.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 05:26:17 -0700 (PDT)
Message-ID: <364500a3-3343-42c2-a0cb-05a1bf39936c@linaro.org>
Date: Mon, 28 Apr 2025 13:26:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
 loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
 <20250426-b4-media-committers-25-04-25-camss-supplies-v3-1-19e5e72ffc3e@linaro.org>
 <20250428-lovely-flawless-grasshopper-bacbfa@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250428-lovely-flawless-grasshopper-bacbfa@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 08:14, Krzysztof Kozlowski wrote:
> Block has VDD_A_CSI_0_1_1P2 input, not separate one for CSI0 and CS1.
> I don't get what is the benefit of this and commit msg does not help me
> to understand such choice.
> 
> On IRC I clarified you could have less supplies in the binding than
> number of actual pins, to make things simpler and more consistent, but
> you did here reverse: more supplies which do not exist.

So the idea here is to make a consistent

- csiphy#-voltage-XpY

Which means that each PHY will have voltage rail names like

vdd-csiphy0-0p8
vdd-csiphy0-1p2
vdd-csiphy0-1p8

Irrespective of the SoC pin name.

The motivation for that is to have the names be consistent across SoCs 
which is I believe what we have discussed should be the case.

That means that each phy will have its own named set of voltage rails, 
consistently named across SoCs even if the pin-name is shared by the 
PHYs on the SoC pinout.

Is that not the namespace consistency you've been looking for ?

---
bod

