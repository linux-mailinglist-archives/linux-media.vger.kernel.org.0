Return-Path: <linux-media+bounces-25715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67417A2A76B
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 12:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4082B188A595
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 11:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D124322A808;
	Thu,  6 Feb 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRKYoQ7q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3CA22688F;
	Thu,  6 Feb 2025 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841113; cv=none; b=HGKV/jnI7SZIg5tARO8k9moEEfnfe6qOPzs7Tul9psndupLLJWrvkk3dBxdDPJCECt/pi3AVeCMTymbPNA0bj9T05eA1ZKF1w/IRYD6T7RajYQryV2p0lxygg7icWD6w5PNJ8h5IGToO+3W1JdkpSK3Fvbqzluufw0RTrqFna4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841113; c=relaxed/simple;
	bh=3QenPFoiIxwYoHLxjpQR+89yGAMCqcwZRL9xqsJbz4s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=T81j2oMYLUkFs/X3XuhoBaH9TmQkWBhtJ1KSucldP3WylLBNEbREtNhrJhG9CXrZWzdbD/Z/3Vz3rvt5aeNzS7l1BmsLqdgdLy215BS4DZt2zlA+sXsztuqIDCjH2JoFrwgzK0Jp1yG43iMu+U9tzvPk3qz8qLx1/AJAu+dbQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRKYoQ7q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6843CC4CEDD;
	Thu,  6 Feb 2025 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841112;
	bh=3QenPFoiIxwYoHLxjpQR+89yGAMCqcwZRL9xqsJbz4s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QRKYoQ7qDIl0na9wnb7PijB/8D4fHcvdZUU4SQ8mwDb+jZ15mRpttChVLKFDhsxna
	 FiEvmQi2FKMDRXKO18sF0fAkWrohSVBSqEmLPlwKI6E0vv+tuw/yrz26sskPAHCL0x
	 OtLlVS9wTnIuRdJa4rOiMY/O9BYAz5UMK4WsutiZYTMeL+MzcuXa5RQKtd+aR8K2an
	 oQxbfQiCF9POYSLrZxyR++BhL6VxUSpmiMB9Y7EHwSp51XAbkmGG228DfUJmw4AmCX
	 UrXxazfw9WocXcErgNUM8tbSy8XcrMSjaUDmnLazJhZJeJFR35QWvM/g5FqRnAFM91
	 7r9X67UNyUY/Q==
Date: Thu, 06 Feb 2025 05:25:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-rockchip@lists.infradead.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Val Packett <val@packett.cool>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, devicetree@vger.kernel.org
To: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-3-69d1f19e5c40@wolfvision.net>
References: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
 <20250206-v6-8-topic-rk3568-vicap-v3-3-69d1f19e5c40@wolfvision.net>
Message-Id: <173884111130.679176.4491485161610037414.robh@kernel.org>
Subject: Re: [PATCH v3 3/7] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap


On Thu, 06 Feb 2025 10:57:41 +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 167 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 168 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.example.dts:73.3-74.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250206-v6-8-topic-rk3568-vicap-v3-3-69d1f19e5c40@wolfvision.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


