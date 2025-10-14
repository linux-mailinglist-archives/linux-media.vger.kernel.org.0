Return-Path: <linux-media+bounces-44445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E629BDAA14
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 18:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A4903560C4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC931302CC2;
	Tue, 14 Oct 2025 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojsQW/ws"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D66230276A;
	Tue, 14 Oct 2025 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459720; cv=none; b=CiYAMtjdoKEp6ffK26i2FFFojEqumrwZFjP0YIjf1U2mbTjRVPGqL8Pb9kbtxlsaoNkPLouf7TT+rHpblmU+7gKmZtX4+bBbisq2iO0Oc81kMvZl5j5UWQkEi4PDHvNMlO/qqsrUgr1WDK2YGLsC86AKhV93TrTW5H8p3LPl6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459720; c=relaxed/simple;
	bh=V3BQixyVjuCVkkOX9feEiagJYME1UtbGBfo11YpVI/0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VFXQp9PZ0+HBa/ylcs82mmfpNv5dlVmatijZrmwTLmtqSqldqIoXUsMkZ0W/VCLVRStwXe2d9cefN2bPHSlCzPVFQk6horQEPrkQlMhD5JP45qRifUd6KaeOO18JWXDmGCiT1GEYb94qntCowLnbrW1Bsz1O9JTT1QQHoTdNVkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojsQW/ws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A6EC116D0;
	Tue, 14 Oct 2025 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760459719;
	bh=V3BQixyVjuCVkkOX9feEiagJYME1UtbGBfo11YpVI/0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ojsQW/wsHQ8jynUNzpnd2dKZgcAMGpab2GTVTWiEdNnE3tCNaOCznQ0ByVLG6yLDZ
	 ChBBU5oEzfvFBaocmngkn3Q1IOtgVjmt75SNrMpU2/dGbBKNKi9PILsj3gR02d+T2b
	 mgn22uychOKORC3/yDleOSCYKFj1qQ6P1QGjq9oj5gBe0X1V9+JycL8em+nkQhMf2b
	 K3ZdqIDAO6k9VxdecdTB8mC+7dkNlDd+1NXid2gS99Zvyj+qzdxZgp5gE65C6GVg9F
	 /2rmXbQ7+88nse4PHnSdBGnXyNA6mGVbmfWm4u02lm0BU6O8RUadZSqGQeEpZHxoPZ
	 YmMxhGczgsNkw==
Date: Tue, 14 Oct 2025 11:35:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Val Packett <val@packett.cool>, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bod@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com>
Message-Id: <176045970552.4162088.13140212466799720724.robh@kernel.org>
Subject: Re: [PATCH v12 05/18] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver


On Tue, 14 Oct 2025 15:01:51 +0200, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 152 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.example.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupt-names:0: 'err1' was expected
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.example.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupt-names:1: 'err2' was expected
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240220-rk3568-vicap-v12-5-c6dbece6bb98@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


