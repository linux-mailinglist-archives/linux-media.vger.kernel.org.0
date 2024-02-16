Return-Path: <linux-media+bounces-5233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D218573AA
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 03:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1201F23AAC
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 02:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5D4DF58;
	Fri, 16 Feb 2024 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIPU09j1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D471149DE5;
	Fri, 16 Feb 2024 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708049362; cv=none; b=J0PInsZOZ01e8d0PsrlUHK7OA9kW7EwmVPy8ja1rXMDPFsiRceCIfNPyDVre+Pou6JGlE6Ay87Fjx32qcCNsZ57H6QPXOihfd4aMm4CcGsXPh85eqeUqYA8nmUMb7LQamhSvczY2cjueHc+H5hh1aJK6Clon3sLDOwn2Q7SbGUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708049362; c=relaxed/simple;
	bh=1gaFKdJQ1rw2MsNtx4emD/DqXw2bcuzrZ1WKhGy7eMU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=IPKvX5fxnOMbLazl9lOWKh0W+tXZMmYaQzGFKor9dp+dxEBxQMH7vWl31c30MlRMNFCfn48gt1tZtJzgUeXmDiWGlszj5ing+jVcA4uLEqGzVy2svQp7K3oApB932X+Mnzcxhdg5UvL8qI0TOZtrMdmRVZaxPL1Vunx6e96WQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIPU09j1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2673EC433F1;
	Fri, 16 Feb 2024 02:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708049362;
	bh=1gaFKdJQ1rw2MsNtx4emD/DqXw2bcuzrZ1WKhGy7eMU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qIPU09j1RW1JMl7H3g4/paF0gs4RsKFyk14oQuD/ezF3Sq/FdhL8yQwywhnpAyGdt
	 ffZC84wnXzYU5F4u28QeVIy30wZ1kWTBWELLVnWIXufObZ35xzRYrN2sLQQg+6FDZV
	 3RQhXlx0CiJy5UR/g3nuNtqqSl99CKhYXUe13E7Oe4KXceG3M9wSCVMKYXtVDNvfJ9
	 SrQo8GylFqKCwWqzmZkKGXfiAWQOHWJ+BtnncC+/+U9OWC8ONc7TN+SrB9VXX2sCQ5
	 6q9uKvIXDEa+TB0zJ1ocmpaDDY0HaVrgfXXepPHY4e65Bt5ZqXSwbIBOFkbYOYDZ1M
	 kB/iQLRUpvDXg==
Date: Thu, 15 Feb 2024 20:09:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Fabio Estevam <festevam@gmail.com>, willl will <will@willwhang.com>, 
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20240215204436.9194-2-umang.jain@ideasonboard.com>
References: <20240215204436.9194-1-umang.jain@ideasonboard.com>
 <20240215204436.9194-2-umang.jain@ideasonboard.com>
Message-Id: <170804935906.836524.16563023693485203536.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: Add bindings for IMX283


On Fri, 16 Feb 2024 02:14:34 +0530, Umang Jain wrote:
> - Add dt-bindings documentation for Sony IMX283 sensor driver
> - Add MAINTAINERS entry for Sony IMX283 binding documentation
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../bindings/media/i2c/sony,imx283.yaml       | 100 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx283.example.dtb: camera@1a: 'vadd-supply', 'vdd1-supply', 'vdd2-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx283.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240215204436.9194-2-umang.jain@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


