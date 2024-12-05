Return-Path: <linux-media+bounces-22666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B439E4FA7
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B82283536
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358181D4332;
	Thu,  5 Dec 2024 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRATLDEv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E91D2F74;
	Thu,  5 Dec 2024 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387180; cv=none; b=mq8GDxyYg7NM4c+C9qe1lJZSn6pHE2ulf185pRyBPZfyAAAUyeE3xzuSgA95+EN6sLuAmV29DtoO13PXLlqr69aVOjYcQh8Xty8rVr6JU1MT9zI37L7dd9SOKuYpjcdUOO/LpgnU8wLbr0WjM/FGlBTpwIoWfY+Yk3lejaeoZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387180; c=relaxed/simple;
	bh=XH+cYuaDd34JH2epRrx9wpA8eMHcKpnONy1B2w+jaEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaeGA+otgngKxP4/tFSDHnp3E6xihg1umAciv/QSluqpR+3JE7G5g9XFScdMxlXOIcykEqeJCEd+FWu9AKZ6W8qCZyxnLjGN86WEiZEDVa6MgLBrhZNmsdSZYfxwOjofyLFV8QjSxritqlZxtCfUjbBOreP8rYoa8ydhor9pZ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRATLDEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B2EC4CED1;
	Thu,  5 Dec 2024 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733387179;
	bh=XH+cYuaDd34JH2epRrx9wpA8eMHcKpnONy1B2w+jaEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRATLDEv/hnSkrUE9lFzL/yFaC9dR/siOLEUPTebWojXWZOQtrRdCbG00ZFHyVn1c
	 q2CKYpqYEPeNwuLRBF7sd/PNLYuWso+oC4LbWgax/48J9ffWm0zNEquQWIge8v1kxC
	 AJB1KZhVNh2KdhFtPYCy8cKcX7gVswK2aCQ70v3ky9g0ySS09i4S0vtXjye+EzDlde
	 lPgPFDrmO75hxfgPh/kK9HyQOxRdPPY3gLwUv4e5+mLIooN/Wv7F0ia8y/3Mc9U+oL
	 IWZ5Xc3x5UTMtfNVJy1r3nrcM/jLs43yQwGb+mRaNTbwjaBbGFcGUdRG/N89gcRQKV
	 5BYQRZ9mMYIYw==
Date: Thu, 5 Dec 2024 09:26:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
Message-ID: <oko5qqysmxhicqzkwhkz54wvsmt64ba3cd37zkcy55ee77owbk@5z3zetfr2ejx>
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204100003.300123-2-quic_vikramsa@quicinc.com>

On Wed, Dec 04, 2024 at 03:29:59PM +0530, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,sc7280-camss.yaml     | 418 ++++++++++++++++++
>  1 file changed, 418 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> 

...

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@acb3000 {

If there is going to be resend, then node name: isp

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


