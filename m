Return-Path: <linux-media+bounces-47083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB35C5D311
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9ECF4E1069
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328A8246781;
	Fri, 14 Nov 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+MZnC4P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA241BD9C9;
	Fri, 14 Nov 2025 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763124977; cv=none; b=PLh4mVIqcbLoryNO0Ps5hYbENCkFgorewH1qPFQ9QwRGt1h+MXKSnBiCZBIa/D47TkmLuHrutQ9u8OqBhJivbDknoX4Og/lajxZ/CP0lWZlWFWAl4eVNkoQd0STc9AJrH8IwKSxO4ouZBkPfZiRxiEFUfkUNky75Ju94qqvKWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763124977; c=relaxed/simple;
	bh=BfKMK2VUDYz5iEAm3juDe+CsVgPYibaQcFNVRyurpOM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ijedr4YOyABzutlybqWwomM/cBWcTpKlYEwq/ip/2FplNgH/XmssT8XqWMznw2abxNuDcCHat69+gIcVgaiqPwR4f4uIEu2gNXW6tPfcKwJoLuQJadTZrt0gM1T3MXKe/bm8xq/0o+b6NTmOwHEKkokCfEzanzWQF3tQJ9wzGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+MZnC4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B598DC16AAE;
	Fri, 14 Nov 2025 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763124976;
	bh=BfKMK2VUDYz5iEAm3juDe+CsVgPYibaQcFNVRyurpOM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f+MZnC4PWRjKhxWNMdQ40OLVbG9reKmW3QnZwvfetwsbnPmbATlESRtuaklbITFEX
	 J8oHZrMh+zkci2QdKuYb1A6xAQd6QN1EEU5PDwdjVag3BU6hT/UvdZFTCmAz2H/HXo
	 FtoTBvXUJee5Sib8l1y6EaNjtJEFyk4gyJKbSZ8NL1n3QQQvT8Lo2A6+SZYuDKBLIc
	 E3THxgsx6sOHoudRuwzGWY8gOP9DRhsPhzPs1omxphE8y/x73XI9at8sNNPTbuxVM6
	 yNmx8BR9f43WpHYfmrg9UIsIxQi58g1Ed9EtdBV8meVZ3GEad/gjGSHP/ml7Zcnpkg
	 A0Furxu6uDw6A==
Date: Fri, 14 Nov 2025 06:56:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-kernel@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, phone-devel@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Todor Tomov <todor.too@gmail.com>, Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
In-Reply-To: <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
Message-Id: <176312497517.2667601.9733109080533112949.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add
 qcom,sm6350-camss


On Fri, 14 Nov 2025 12:15:24 +0100, Luca Weiss wrote:
> Add bindings for the Camera Subsystem on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
>  1 file changed, 349 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/qcom,sm6350-camss.example.dts:169.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/media/qcom,sm6350-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1547: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


