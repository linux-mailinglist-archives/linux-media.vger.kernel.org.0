Return-Path: <linux-media+bounces-19437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ABB99A6E5
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9A37B21D40
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B076D1946C3;
	Fri, 11 Oct 2024 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npIJN5JE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB712BCFF;
	Fri, 11 Oct 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658230; cv=none; b=iGJRU4+cyL79AltMYVZDKL9gDhPqZpVBe/y1wpfRoddxRGlkghay6Btn10f3jKhuVhb8jafLWD0d7T1OJ1mtOESbn2TzVuAIzTvXZu861lXWvcNMFSRRP3+v1y9NUzjz4p6lPfTDMiM8i9e9rUuZlOZBRo4nr6B1jivVEjl/xKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658230; c=relaxed/simple;
	bh=Eu0I87dqw5nKcLGnt7NQcvS7bSJPZZtCzimyDhAT7Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InC9+ZoGIDNsUFhgj/qtAUVyatpvXewDKOKFSzmC7ohxPi2usjmTd6Y+WlhJdZgnYizkrphPc4Ifs736xem8Tv2vG8uSV+mQ6LdUELWrsp1OjOWDT3F7+2JDXelcUjfAPw3UbIggCPxf5gEY2fVU+igge6ssaw+J3nNnyb8C9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npIJN5JE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B798C4CEC3;
	Fri, 11 Oct 2024 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728658229;
	bh=Eu0I87dqw5nKcLGnt7NQcvS7bSJPZZtCzimyDhAT7Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npIJN5JEyTOdqoEKCaPjWFX2hVJdgQqGcJWvJpg8KxlBMalNoszi4liDk6K2tMAmE
	 jEXKYpCFZn1YPZJOfQpV/+JeR7KaO2CWxZQjkn/4HyImFGDsoglHUzTJc1TxXWWyzY
	 Tl74JvIEsSEGHp9qgAOSEwxgvE0MZF0+Dit+h1/hhkAAdaVFoBMStrH/9wkVYO08El
	 TEd+3Xn1u7dq4Z4iRtWSYHD3rEhTZYsxRubVvKY53mxEa5oqHRH54yCsU9Ffa6h+wg
	 s5Qn8SvtVMctTQCv6jCNyqvED455pdipXxHvp9weDdO7EQ8Pr4MAGKg2D5li1sAYpx
	 WNb1bp8F2rMRQ==
Date: Fri, 11 Oct 2024 16:50:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 2/8] media: dt-bindings: Add
 qcs6490-rb3gen2-vision-mezzanine
Message-ID: <nsylilmzl6zzukpgih65kmeibbllek6dpgryzkso2ttpuztk2x@3q5xiujcdujo>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-3-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011140932.1744124-3-quic_vikramsa@quicinc.com>

On Fri, Oct 11, 2024 at 07:39:26PM +0530, Vikram Sharma wrote:
> The qcs6490-rb3gen2-vision-mezzanine is a mezz on top of the
> qcs6490-rb3gen2 core kit. The vision mezzanine includes the
> IMX577 camera sensor.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5de6290cd063..f00851f30d3e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -390,6 +390,7 @@ properties:
>                - fairphone,fp5
>                - qcom,qcm6490-idp
>                - qcom,qcs6490-rb3gen2
> +              - qcom,qcs6490-rb3gen2-vision-mezzanine

Shouldn't this be an overlay?

Best regards,
Krzysztof


