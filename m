Return-Path: <linux-media+bounces-28036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E5A5C4EC
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 16:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6E3163955
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA3225EFB3;
	Tue, 11 Mar 2025 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nb7UEfiU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1E25E801;
	Tue, 11 Mar 2025 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705650; cv=none; b=lUXMsg0M8yKi36968iYMThzBfk1Ia9E5QBWaXcSeicUKZBk9kMQT4UltCKD6jyVdVb9h73DSesoMXVAEm2OZKtbxdJSyCUTN6+Oefy2pSJAy4UzvSKC2SsVsYd5r6V9yHDEFQn113PQEC7mtT8I8n8E+c8yrVjnmgcpHgQemwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705650; c=relaxed/simple;
	bh=aRchE8PwF/duoza+GGDBrfQTpUq5j0xQPd9igaVd1Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inqUkObdfSMZo06kUMjbeFHro7BhXrr7TO/3B6W3gp7MJn1Zntk657chb9JG7JhIARKmNLa/zXh41U39fvTUN0q93NuWXXuHXs8NhWHQ3Jjd3HvSbSfhz06ZXM80QPpnpxeuiAUlpbJJfoLXmd4E4qlTXiUWB0MLh+wpo9EdPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nb7UEfiU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094E6C4CEE9;
	Tue, 11 Mar 2025 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741705649;
	bh=aRchE8PwF/duoza+GGDBrfQTpUq5j0xQPd9igaVd1Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nb7UEfiUf5d6PWuCgRPwXwVDji8sdBgGMWOts8UhDz7FPpD0Dl9oeS5I3+TY/EsBj
	 fe26M6E7b9OIHilGtV3M+swrTXhYCY1UMEBwAdLoOo9WRx6Nrst+JDICeFtwAf+5kA
	 lvNHmB4/JAnmnxFJU/1+H2XScHSJ1YvpeEdzWprNV8cIji0Xdxslbx3O8qUjsnpUmt
	 3A3RmDm/40MP31QdR9YF+TdRhDl3HuLbJbd0BkW8mvoZWQKlC/jYHnbOA0rGj1Jtck
	 4toXFdfdO9EAl4Y0Tvot89nPnG1X5kiqQqjoP25LKSSG4+vjl0hO4TL2D7Ikih3IrC
	 3GGsOLL+9nPZQ==
Date: Tue, 11 Mar 2025 17:07:24 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Message-ID: <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>

On Tue, Mar 11, 2025 at 05:33:53PM +0530, Vikash Garodia wrote:
> Not all platforms has a collapsible mx, so use the more generic naming
> of mx in the binding.

I guess, it wasn't even tested...

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index e424ea84c211f473a799481fd5463a16580187ed..440a0d7cdfe19a1ccedefc207d96b26eed5d6630 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -28,7 +28,7 @@ properties:
>      items:
>        - const: venus
>        - const: vcodec0
> -      - const: mxc
> +      - const: mx
>        - const: mmcx
>  
>    clocks:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

