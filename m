Return-Path: <linux-media+bounces-37870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63375B0761F
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 14:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB151C2700C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 12:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CFD2F5487;
	Wed, 16 Jul 2025 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/53GU+Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A602F5471;
	Wed, 16 Jul 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670044; cv=none; b=Rm2TasYfLy6HeqYN8bKzcK5lvRhliHat+YQDWY+d5E9FxSy+UvydTqSKIeq/fvPdXg6ygHAkc1fCv45+ZmGLXh1kHT4EdtmmEYRf/TfC1Yun+Buz7z52kpcZn0n7HhrSNdxNRVwvHJiVnXHRkG/tfTvjNLXkztxs3zLdyBO4UYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670044; c=relaxed/simple;
	bh=0pzCJliJ0HW2L3subDrWq+mOU/BVWiu8FjkzdTE7CYQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BErq1sBhyHD6gKGM6nCL2sMERAZF0RV1rskNscwh2sTLq7BjjxBCTymkQpb3uYSzGhvM9HFZK7o4eNSPzwaUZqAx0qIQuUNS6aJjkpHyy7VW7/viIuxWPiXnHj4PD7BSyzRGycxAE1ApX/CxRRkFh/mpTHbAwtNk1K6xn3hlQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/53GU+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3DDC4CEF8;
	Wed, 16 Jul 2025 12:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670044;
	bh=0pzCJliJ0HW2L3subDrWq+mOU/BVWiu8FjkzdTE7CYQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Z/53GU+YHmWDPHxVUHuXogBFzIsiDKRhdgkakLprnSi9sq0p2BiWrLjLX0mLgWKVY
	 kMueCPBXRzMBfSvt5xgYQg9TZnFUbLtSDRttQf08/WqtJHN2lixY4jHXKitaOnu/hi
	 uSQSzuwfXygFA0Hv70b2nBTl6iApAdtz8jt0IqIYdp/0Ll/7LaiS9UlTLmgSo14pD6
	 cXNiKemXlw8MGCI4DNrAgbHnr9mAXZQl7JrVIjcSE7RXj78DRVS2a5LWmLmOtTV99E
	 rg6PePaVt/QNxI0zrlefDqsj722M7LRe1c9eO1QSorQR15IMDv5EdR3dsZ+2edYXbc
	 wMNIeZoqhYnqQ==
Date: Wed, 16 Jul 2025 07:47:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, lumag@kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, u-kumar1@ti.com, 
 devicetree@vger.kernel.org, ebiggers@kernel.org, kory.maincent@bootlin.com, 
 bparrot@ti.com, dale@farnsworth.org, krzk+dt@kernel.org, 
 geert+renesas@glider.be, linux@armlinux.org.uk, linux-media@vger.kernel.org, 
 heikki.krogerus@linux.intel.com, mchehab@kernel.org, 
 claudiu.beznea@tuxon.dev, linux-kernel@vger.kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sbellary@baylibre.com, 
 andre.draszik@linaro.org, ardb@kernel.org, dagriego@biglakesoftware.com, 
 florian.fainelli@broadcom.com
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250716111912.235157-4-y-abhilashchandra@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-4-y-abhilashchandra@ti.com>
Message-Id: <175267004341.4181720.11859014527517980567.robh@kernel.org>
Subject: Re: [PATCH V2 3/4] dt-bindings: media: ti: vpe: Add bindings for
 Video Input Port


On Wed, 16 Jul 2025 16:49:11 +0530, Yemike Abhilash Chandra wrote:
> From: Dale Farnsworth <dale@farnsworth.org>
> 
> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
> can be found on devices such as DRA7xx and provides a parallel interface
> to a video source such as a sensor or TV decoder.
> 
> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v2:
> - Remove array and just use hsync: true in bindings
> - Remove array and use enum for bus width in bindings
> - Use pattern properties since properties across ports are same
> - Update copyright year
> 
>  .../devicetree/bindings/media/ti,vip.yaml     | 211 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/ti,vip.example.dtb: /example-0/vip@48970000: failed to match any schema with compatible: ['ti,dra7-vip1']
Documentation/devicetree/bindings/media/ti,vip.example.dtb: /example-0/i2c/camera@37: failed to match any schema with compatible: ['ovti,ov10633']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250716111912.235157-4-y-abhilashchandra@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


