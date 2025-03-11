Return-Path: <linux-media+bounces-28039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5AA5C7BD
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 16:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DA033BBE21
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10833EA76;
	Tue, 11 Mar 2025 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkiqKK4U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3725B69D;
	Tue, 11 Mar 2025 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707123; cv=none; b=p6k2uOo386zXTWVmPPPycgpZBAWlZY7Lae5C/rRkq5EfMuTmcAoq5IVku1OEwC5NFYwEQ6beHxwoahSCjYCgKKCqssaU8JlPUIfztqdp/c+Z0M2/ngF4ydH84L2UD+tH+GQ5XriqUtwb9xR1EQ6eUiLpdDOzdfRDh7zlftHc7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707123; c=relaxed/simple;
	bh=VtkaJ7L6XEIE9QnAL1+dX4kibxBnJwlPy8zVdc2LrHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/p8E6nDey7AfC1eNGkYO9G5DRrT4q33vAWrPVm4sX4F6cj4vO0vex39tm9G2xtjSEzy/xnBz2CLKrXqfkixJDIBGZ+TXgnvjvWxbrPb79YvKTH1NBdVeb8Rau0m4Ep/VFuWTPFnYrwgnSMdQy9EDe/piFaQwLSFvRPJ8gnIP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkiqKK4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2036AC4CEF3;
	Tue, 11 Mar 2025 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707123;
	bh=VtkaJ7L6XEIE9QnAL1+dX4kibxBnJwlPy8zVdc2LrHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkiqKK4UlgQ3bHIj+Fa2H3znDor0YOQfCHGZi4BE+Oy4tLZIQ5G21b63zkyyJT5v2
	 LR3rdQKJ5nfiK3qFXAmVgYZ2PYDrJgp0fXL9hZXH7EWRf2jbhX7Tw52DiJ58vUg79V
	 umwYYl+FJAeSJocInIfr2sAR/85pHgdSsJ9i1g82EaYjlbpqeZF89RMsk8nlNRpgna
	 nIaTjGeBj4RcwafWQ1nIabLujNUz7oB7GxNqf1Cjl+dgll4SCKGrgSq/ePeF9eeMVl
	 6Sk+x8fFpz01tRLt7bRnZkp3/0WYa/jNg+qWCgW7oD+7Sz+K6Hv9RQbzW1/ryIeHBz
	 q/MDAV1qBbYYg==
Date: Tue, 11 Mar 2025 17:31:57 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
Message-ID: <ngzl7q3fli3bpuo5gjvppfrsnmlw6viy26ieqwhpfokgue2uxm@whomn2h6h3a7>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-2-5c807d33f7ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-dtbinding-v1-2-5c807d33f7ae@quicinc.com>

On Tue, Mar 11, 2025 at 05:33:54PM +0530, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SA8775P platform. SA8775P has collapsible MX compared to SM8550.

How compatible is SA8775P to SM8550? Should it be using a fallback
compatible?

This kind of comes as a more generic question: is there anything like
'IP version' or 'core version'? It would be really nice to determine the
'baseline' SoCs and make other instances compatible with the baseline.

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 440a0d7cdfe19a1ccedefc207d96b26eed5d6630..20ac596638ba33f49cce9e42d70d31a8aaa7c36e 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -19,7 +19,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,sm8550-iris
> +    enum:
> +      - qcom,sm8550-iris
> +      - qcom,sa8775p-iris
>  
>    power-domains:
>      maxItems: 4
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

