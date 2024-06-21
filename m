Return-Path: <linux-media+bounces-13921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A24D91226A
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B0D28B06D
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 10:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0996A171675;
	Fri, 21 Jun 2024 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGo14M/O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DB17109B;
	Fri, 21 Jun 2024 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718965794; cv=none; b=HlI4PweJpnfwXAzcTR01R9BiP80bDH0oAGK//wTELGmo+TbBAk96hGaZ2P831aaYQDqIUwpbzblRnFoCTw+8EkUeoGlB3MWeslxO28HBrATz/GuG/sC9WlYdvF7MK4/1sjE6PfAGIT6DLbgEEtX5sWTDc5JC2Je3qqqICMBokr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718965794; c=relaxed/simple;
	bh=PeKv9k8X+PilrORiusMPipyJYYvxOeI/t16tF6szs5I=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=VIJvfsOt56PVVQl7IUYFz6bBkSO2ljt050jpLPIt21PUR20ougB7f59Ozty0xBPybLXdVHv2UhKuecB/by8Pps1l+0Qu/cdKOcjMbPLwNS7ZbnRSrmKYu3t6RIgHAgDptjWYTtaBTazV91wK5MDnPJ7t2oEFL55Ek7oKurp4hLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGo14M/O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A2C2BBFC;
	Fri, 21 Jun 2024 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718965794;
	bh=PeKv9k8X+PilrORiusMPipyJYYvxOeI/t16tF6szs5I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RGo14M/OYHn4kJqUWYEDDubinNXp3PPBzScxS5iT3zuUQQPs9JDXiy5zryEaxlos9
	 4Uw22bnmNCbRBPPRhVmfCI3SXOKpv3RE8mLPz1APBAX3UAxVwu4SH01l5j6F7MkAo0
	 9gq9qoyPyvS/fMUWC641NUdd6IokKULuA5AopEqbq8n1fZMxblONAUB8y6i6CKxgyU
	 MHdX/s0uz96Y5pNb+sbU5PvsU4W8nSiKvilB8RNKJN7S80J2FJfBvrNuFfnWHl9uFl
	 InOJ1DK2eOlLxTbB5Mf5hxegGKsHkz8rFPzUWbpgOvBnaMgMW7y90qo88jweTC2Uo6
	 fvyXvsS6cGLUg==
Date: Fri, 21 Jun 2024 04:29:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Chan <gchan9527@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 devicetree@vger.kernel.org
In-Reply-To: <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
Message-Id: <171896579289.1052121.7134078173104120668.robh@kernel.org>
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding


On Fri, 21 Jun 2024 17:40:53 +0800, George Chan wrote:
> Add bindings for qcom,sc7180-camss in order to support the camera
> subsystem for sm7125 as found in the Xiaomi Redmi 9 Pro cellphone.
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
>  .../bindings/media/qcom,sc7180-camss.yaml          | 324 +++++++++++++++++++++
>  1 file changed, 324 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clocks: [[4294967295, 6], [4294967295, 12], [4294967295, 37], [4294967295, 44], [4294967295, 50], [4294967295, 22], [4294967295, 14], [4294967295, 23], [4294967295, 16], [4294967295, 24], [4294967295, 18], [4294967295, 25], [4294967295, 20], [4294967295, 10], [4294967295, 11], [4294967295, 77], [4294967295, 33], [4294967295, 34], [4294967295, 36], [4294967295, 40], [4294967295, 41], [4294967295, 43], [4294967295, 47], [4294967295, 49]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:2: 'cphy_rx_src' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:3: 'csi0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:4: 'csi1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:5: 'csi2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:6: 'csiphy0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:7: 'csiphy0_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:8: 'csiphy1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:9: 'csiphy1_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:10: 'csiphy2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:11: 'csiphy2_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:12: 'csiphy3' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:13: 'csiphy3_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:14: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:15: 'gcc_camera_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:16: 'soc_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:17: 'vfe0_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:18: 'vfe0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:19: 'vfe0_cphy_rx' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:20: 'vfe1_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:21: 'vfe1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:22: 'vfe1_cphy_rx' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names:23: 'vfe_lite' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: clock-names: ['camnoc_axi', 'cpas_ahb', 'csi0', 'csi1', 'csi2', 'csiphy0', 'csiphy0_timer', 'csiphy1', 'csiphy1_timer', 'csiphy2', 'csiphy2_timer', 'csiphy3', 'csiphy3_timer', 'gcc_camera_ahb', 'gcc_camera_axi', 'soc_ahb', 'vfe0_axi', 'vfe0', 'vfe0_cphy_rx', 'vfe1_axi', 'vfe1', 'vfe1_cphy_rx', 'vfe_lite', 'vfe_lite_cphy_rx'] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc7180-camss.example.dtb: camss@acb3000: iommus: [[4294967295, 2080, 0], [4294967295, 2112, 0], [4294967295, 2144, 0]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


