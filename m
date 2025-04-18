Return-Path: <linux-media+bounces-30527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32FA93391
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FFC44664A3
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B579126A0E2;
	Fri, 18 Apr 2025 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oyq49u/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8BA1C5485;
	Fri, 18 Apr 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744961962; cv=none; b=LzkUu/VuA+PbxAaBGu4BobDoLVoqHl40vJ15Lp22eNGO1uXvJ23KMp+ivczBtej+6BQVvKkBE1tVGZTZnDAEE4V8o0ui690mV209XZlBCEL9UZC+eL4GT21L4di5es/V/bfMQJ+zGvXEAkH53Kh0kfM5rgX+u7ywOzZf+oFLe7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744961962; c=relaxed/simple;
	bh=nW/2UbnuU/ZrZcQJ5gWpxSbrhdu0j3UXBbQ2JLjzdcI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BuCvS1iR33Ce7WSxpO8fvE79ONQPgYaq7PrrEyTTTWfhVpSzHaPE5SMnQJ30E43sYZnVcAdUYNlHauY9M8EVuFCmSP9je46yBql8dTgWNG4P+A7XhGfKcLzLy29hz3YS/pDHUh8LFm79z5Aq9n+MqKbeHhTecZ4FXBYxxvGfhIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oyq49u/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2214AC4CEE7;
	Fri, 18 Apr 2025 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744961959;
	bh=nW/2UbnuU/ZrZcQJ5gWpxSbrhdu0j3UXBbQ2JLjzdcI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Oyq49u/Zr/I3oRzKhik23iGdj3MKBNIqItWmuYbSmH+isq8vnowvruaFrj9n6NbtU
	 ekWxvme8gDsWhnIkot0CWXRa85s7oMRRY5sPyySbVqfZq/tHwhckJhzl2ar9mwMwkW
	 kwZoa33725NMjwFlMd2fjnKG39JH2UnrPwiNn/GWhtsFAJDTrSdLilgBhFPuS41ccU
	 lI4PlNklkzjmcWMMz/7hCLEzaeXVfmvSmyN8CivFn5huU9ika+ff64EpQ3vrLgPoQx
	 U8WUM075wXTxSQ8bXMqnMtDZsM6C7ophuRPwf8rvux1OzIPegm3rW362frLJI4antX
	 A9usx43I9/RCQ==
Date: Fri, 18 Apr 2025 02:39:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
Message-Id: <174496195764.2395149.13107137878496953642.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator


On Fri, 18 Apr 2025 11:58:39 +0530, Vikash Garodia wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
> have different(lower) capabilities when compared to SM8550.
> 
> This patch depends on patch 20250225-topic-sm8x50-iris-v10-a219b8a8b477
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
MAINTAINERS: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


