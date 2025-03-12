Return-Path: <linux-media+bounces-28086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF257A5DBA0
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 12:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85723B42D5
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 11:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DD41DF735;
	Wed, 12 Mar 2025 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVsOBf+h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989623BD13;
	Wed, 12 Mar 2025 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779194; cv=none; b=ZAo9hGc+Xml4Hwn10lUmKVTkhHp0WLJLSbSz07C4cUxSnMcaCpbL6/btcyGbm1GvUJToIz3vxczwvmvG2F6FukD4m+OOGqSjHk2vftnYfXfez4Imz6OnYhcamY/6fRovkU8zFmHD2ghFMmptFOxJ9ial4+I8c+2v/UKMd1XOWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779194; c=relaxed/simple;
	bh=E/aiie6JpPwOoULZENAwypugxM9ePI9OiT+4riVd96I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kgbbkxcWH/0FBRaXhjGMuG9ShiEYeIkgQfLluX0Kj84F5ehdsLVw7EOV4N1qDngmP//8DKAl4LJ+WTLnhD8VDBsyMrNG7M9D2Hi/8BLd6CNMnDJ/BuUR4+5AQWHg3CVfAg1PKaliEsh9coFzj+0WC7YdCxnXvDatKa4+QLttB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVsOBf+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BF0C4CEE3;
	Wed, 12 Mar 2025 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741779193;
	bh=E/aiie6JpPwOoULZENAwypugxM9ePI9OiT+4riVd96I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QVsOBf+hGXDuQi4Jh9IdImcG+z3rvAvsfHFbflbK1R2PlcYTzaIGLOHbeRSA4ep/K
	 LYej0d9sMCFAsowl5gHUaFsbscu50j3ezojudo6G75P02ERPTj3q0wP5U1MoJtKTD5
	 /XNbRwa9xA1nddJuKrPdx+CcJv4brPkmwEhbpFamcIH5ZC0Cz76BzK3JQlAcWaD06j
	 +TjDJ66bRRs5Y4QAtV0OSkpDFFm4F2y0wrilm8hgta0rmgoZaMQE3n3KN4mpIVUgRP
	 bIuMfTi7kplhzCi9c36zm3hNrN9cf9mbLUkrcTuPxB2cLTKbQtz0PBA+ejqkqAjCpU
	 ET4bJWcGXZZiQ==
Date: Wed, 12 Mar 2025 06:33:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
Message-Id: <174177914766.189343.17822607487336311201.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS
 IP


On Wed, 12 Mar 2025 02:11:30 +0200, Vladimir Zapolskiy wrote:
> Add device tree bindings for Qualcomm SM8650 camera subsystem.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
>  1 file changed, 389 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml: properties:ports:properties: '^port@[0-5]$' does not match '^[#$a-zA-Z][a-zA-Z0-9#,+\\-._@]{0,63}$'
	hint: Expected a valid DT property name
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250312001132.1832655-2-vladimir.zapolskiy@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


