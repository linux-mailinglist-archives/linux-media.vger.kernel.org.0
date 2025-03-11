Return-Path: <linux-media+bounces-28034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B3A5C43C
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858E6171EC8
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 14:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B9F25D553;
	Tue, 11 Mar 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar9pqhhv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CA1BB6BA;
	Tue, 11 Mar 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741704771; cv=none; b=bl3D7cSTYmbIhwDg6p7+BPynfOcFfR3HeVTWdh4XwrZwYVZeDKaH4vI8GKAEuaNwR5a7fA55IAUtScKR8krZeE54C2P0bHSwYsriKicrbIqtXz5wmWI7x5I7bhlNpJ80fsT40MDLlE4GY6v7SwA+hIiPGGeZiXy8g+s8rsUN/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741704771; c=relaxed/simple;
	bh=yuPVk9WldAMtntYxp3zd8OUcJfojpeIHIzELiOdyLS4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=N5MQhUXEpblE20iPCxNpULb/jM5OyJ95Ic/X7xlH1HtpKimMK+oaJkWr3VLOerTa6obWPhSjJQkr53htNj59oi81H5Zrs6vbFYEohWpoLVUnXSZ5GLTDb8eBcpFvfPuHv0Mx3us3BIH7NqvCb7k8Y+jOphMcYKr7Dj0JRktO3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar9pqhhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCF1C4CEE9;
	Tue, 11 Mar 2025 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741704770;
	bh=yuPVk9WldAMtntYxp3zd8OUcJfojpeIHIzELiOdyLS4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ar9pqhhvcd7v1MMbdgBDPEcHDJJdVvA7FFumK4hO+UYQxAe0Z5oP8KGIec+JnrNnV
	 YNWfyEyp8TbI6bgMkDkA3xu8XUHeH+LuLGPOG6418LLq7sYPIZJN0rsbodBU+hH8G1
	 /qozxptgtc/qDDkKYIYpD4KVHsybKtVF2PrPwngJkNDQKLleE2ujbwoleglG5zXlPX
	 TbHzK+3gVPP6xDyAx31GaIFhqMdbiUoFuftmLkpQ7YEzvLtrOmu1cHUsVHcZDvSI6F
	 Jj0KhoxtLaTbNMOqOEOwHw0CxiBWxYl+yUZE2qZ0OPR8SeyCyA6M5e9CY2zJBVC3D2
	 UrqYvgb58nWUg==
Date: Tue, 11 Mar 2025 09:52:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
Message-Id: <174170473449.3452573.11984106414323631593.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name


On Tue, 11 Mar 2025 17:33:53 +0530, Vikash Garodia wrote:
> Not all platforms has a collapsible mx, so use the more generic naming
> of mx in the binding.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8550-iris.example.dtb: video-codec@aa00000: power-domain-names:2: 'mx' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


