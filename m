Return-Path: <linux-media+bounces-30603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF14A95071
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD70189393B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21428263F4E;
	Mon, 21 Apr 2025 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiMfBl+W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5214B263F45;
	Mon, 21 Apr 2025 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745236261; cv=none; b=VRVxVElRsTSqtvSfStUzBdP9+aqYWxb4+IHTw8kWKB2rrf10vhQr7CHfmamMp9GVe4xPS2TZvx2B6T3VktkeOXCNA7vEt7Ypz/dibuSHRJpqTKqER/XxmP5qKPVKkNqQNkjkW5R7+GaVqSV2k767SDivhA+UNPKj2aKA1aJT0vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745236261; c=relaxed/simple;
	bh=iqzPLokdK52iTpABVBzXV5mawjNYeU3GNuEBmXtj0Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDsbAK0Ox23FyFAGudS0IxjlF0GLDpzRbKYffkDSSiH4dCbC7LCgvoBBp6ymR2/buGA8KNOKH8JXVpIIgN0bjCeOTHzoSQXoiI4xq4rM5fsRkRmC4afEWJz1eLi3mB/pXR5tm4d0a733GnCv2aQNLtXSuiCsEBDWDyD+5i1PJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiMfBl+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC73CC4CEE4;
	Mon, 21 Apr 2025 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745236261;
	bh=iqzPLokdK52iTpABVBzXV5mawjNYeU3GNuEBmXtj0Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiMfBl+WiGNzMNDskLdjxsWJ1xbphBDHUNEzCl6zgnu5E+6vHSqP8G2CoxpwDt0Kk
	 JCFz16JEJdx3r4rESJM9MR0odx5QryDpXs4u3foDhLVrGf8DENFn9STrR5c0kagkUl
	 m1l6u7L0dbcaE7iOC9H8p3VVrCq+nyymT6nwYl+3zodawnrLFirgk2dox+qDmkeGpm
	 L1/pvNcH/KFj5gq8U7m3ghqVo4M2cXDSJKtXDEoFCb2sjIR0udC4CbZIqF38/SgwtH
	 fawJN+jS/4G/TrVkjXRcCoxHk9/7uV50JbznoV7ajndhtJGQBANkRRJw7/X2OMuXaW
	 xr19/OfSuLiTQ==
Date: Mon, 21 Apr 2025 06:50:59 -0500
From: Rob Herring <robh@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Message-ID: <20250421115059.GA1624060-robh@kernel.org>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>

On Fri, Apr 18, 2025 at 11:58:39AM +0530, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
> have different(lower) capabilities when compared to SM8550.
> 
> This patch depends on patch 20250225-topic-sm8x50-iris-v10-a219b8a8b477

An incomplete message-id is not useful. It also should go below the 
'---' so it is not recorded in git forever.

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - qcom,sm8550-iris
>            - qcom,sm8650-iris
> +          - qcom,qcs8300-iris
>  
>    power-domains:
>      maxItems: 4
> 
> -- 
> 2.34.1
> 

