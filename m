Return-Path: <linux-media+bounces-32766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A38ABBC7D
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A03C1892F41
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E7127587C;
	Mon, 19 May 2025 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7VIpFcH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47851275841;
	Mon, 19 May 2025 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654509; cv=none; b=qR6BgJyAOGb1h1XYdSSuLFAf20jTu8/ZZ8YTEsGKMLzCckGcGvijFcbhsQ03OE23nKU0+NM6Bdr8G+Saci4tonLsOLAowql4i1bp0BT+D4h8LgBMnFhit9CO/QweP/Lll15VdUBA9/94RwVJrB5+++X+tMSW+Ah8aFNFo7ioafg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654509; c=relaxed/simple;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=f48IYDbmTzc3YGors65PQ1TbllOsaNXFuToKnLeNcaYNzY8txDY0iaehkWlArSYVcLanjO5oOiTQKDGGhFxefr/GiCpHmVC2ZcojYQJ1+48GLlJaKvwMXeVffABYL6EVP653g1x431BetEq1g0FEJvB5nrkcguh/LRK1qHXZ6B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7VIpFcH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759EAC4CEEB;
	Mon, 19 May 2025 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747654508;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=h7VIpFcHr6U0DcTho2F+efRbJQdlLucjdzMetej5rEedmQyLQ5UPJUuLUumWUqhfs
	 ppYLGbrAPKy/mJpMAId4xlxrT6gXvBpFuu7vBY4DPIvnB9UATUTic9pCsLJazRr9gt
	 SvMLwGAlPRXu/gWBWO66nECyjT9uWpCaRO2CkMO5wimBuGtY8twojY2y0PCZn5ll0H
	 PrJdjnXARvkZPsSl4Tnt45jqKZlYxRrbNLNcGZlwnNcg/N03XGew9a1uyEbrzMoAY3
	 2oVAS6aVLBDnJ3JpRm9opPHqOLbS5/xy5uXmm/9KXPlA0SQzG3l1iXRmHJi/yV3QMi
	 MoSbuVV1a4bhA==
Date: Mon, 19 May 2025 06:35:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Todor Tomov <todor.too@gmail.com>, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
Message-Id: <174755315042.2793587.17691583538434075316.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: Add qcom,qcs615-camss binding


On Sun, 18 May 2025 14:33:07 +0800, Wenmeng Liu wrote:
> Add bindings for qcom,qcs615-camss in order to support the camera
> subsystem for qcs615.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,qcs615-camss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,qcs615-camcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,qcs615-camcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/media/qcom,qcs615-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1524: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


