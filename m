Return-Path: <linux-media+bounces-14797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC192C467
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 22:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0A2F1F23732
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A72185609;
	Tue,  9 Jul 2024 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4TcllW6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BFA1B86DC;
	Tue,  9 Jul 2024 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720556517; cv=none; b=O2zJ8tCdb5jQByUlsG4beuqHBxBoNBWBdVRGuoepl8GW27VmgQXJ7wY55H84IUvNSnksMHCzCFHR+xKMRozVG6/rwJl//Q/iAaEk7dSaaPQPixVI4NRN+SjQ5ChOCuHwDq+yd9U3wad9rH2OOvSpX8XfA8UODylZrbgHDEFWWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720556517; c=relaxed/simple;
	bh=K6oyBk1bC+Qy9qh3xzb5rfQeHRPPxfDAx1KkaTb3A9I=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Cfu4y9bUNYLXTJZC+1VlzXqq6pcljR8b4qyIEv9gDGW8RcHwB5lXjKXuc+oJ6VW4/Tmorv2IMWnJ0EfKdjzEpeeaJIvR45cPYjUFwlNKkGjQaP/ho7PZNDGld8m7T1H8y+PFPLrbv1l5WmGqmyUy3XRRQD7KJxRll2HcHuPs5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4TcllW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289BDC32786;
	Tue,  9 Jul 2024 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720556517;
	bh=K6oyBk1bC+Qy9qh3xzb5rfQeHRPPxfDAx1KkaTb3A9I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=H4TcllW6CBXFB78ob6xN33PRXGV8qpyupcFVzi5f8PSMG+6i51IxIiDNhUOUULwq4
	 orwXicvEVOE3tUP+Y+HY21z5S+2QB6Y1xydOZ/C4oFRZFZtxzi1Fy108Mh84Dk306h
	 sM932n08iP4N3o6KSIxJCK99esiqpwMN8ZxXN5Bs584NqJp8hAd97n66omC1ut4C4s
	 jY9T21Y/EK8WKmIuBxK2m6kVxiZ2sJCj3WiwwpmQpEUbwzr6egbybS8XBKyzVlkevO
	 B7k6w+ZCBvntrGZVDWzdczfbHfu0gDzqmiaKdn2VPr04UVgpFkUD8DPjY4AM8BafNi
	 FaeQnLZXRLzwA==
Date: Tue, 09 Jul 2024 14:21:55 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Depeng Shao <quic_depengs@quicinc.com>
Cc: rfoss@kernel.org, conor+dt@kernel.org, todor.too@gmail.com, 
 bryan.odonoghue@linaro.org, mchehab@kernel.org, 
 Yongsheng Li <quic_yon@quicinc.com>, krzk+dt@kernel.org, 
 linux-media@vger.kernel.org, quic_eberman@quicinc.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com
In-Reply-To: <20240709160656.31146-8-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-8-quic_depengs@quicinc.com>
Message-Id: <172055651592.687618.16227034595656867010.robh@kernel.org>
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding


On Tue, 09 Jul 2024 21:36:50 +0530, Depeng Shao wrote:
> Add bindings for qcom,sm8550-camss in order to support the camera
> subsystem for sm8550
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>  .../bindings/media/qcom,sm8550-camss.yaml     | 545 ++++++++++++++++++
>  1 file changed, 545 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: camss@ace4000: clock-names:34: 'cpas_vfe2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: camss@ace4000: clock-names:38: 'cpas_vfe1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: camss@ace4000: clock-names:41: 'vfe_lite' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8550-camss.example.dtb: camss@ace4000: clock-names:43: 'vfe_lite_csid' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-camss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240709160656.31146-8-quic_depengs@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


