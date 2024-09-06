Return-Path: <linux-media+bounces-17721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516996E6AB
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 02:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCAD1F24693
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A2EECF;
	Fri,  6 Sep 2024 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePCiaIDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF7B629;
	Fri,  6 Sep 2024 00:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725581691; cv=none; b=cOvysLZAj2WSkRWNb+6J2ZZ+06hn1ei1FN0mNm+Lya6o9LZyKgZWH5qFkegztk9gC8e1e29xLOG/+sixuwYWDUO1SLegzSri/shDdpmEcZPlVSIqgPr960JW0yvJYFSmuqsfvEbTLIynmXwbGMEQJzDrEI+oTVxIpgy8wEV7Rpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725581691; c=relaxed/simple;
	bh=gkM4XagEUZnVGMEEeM9hj46JSs0g4BhTvXymd1kC0oU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=h5YXQlJpZxKDSyhaLWkr2hmCjeOgQ09AsjBVy7JjAqwktyANXwkUH+fERwvaw3MNQ0a4HgfeHV3oJEMS05NpZiXobDB9lehOG1QB88eDyhfoaz5d7AoW1ZjShkzpxORgnMjzpLSSIRnAdML1Fmu8bgPfxo4Q8rnux0wrduumihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePCiaIDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F25C4CEC3;
	Fri,  6 Sep 2024 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725581690;
	bh=gkM4XagEUZnVGMEEeM9hj46JSs0g4BhTvXymd1kC0oU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ePCiaIDZXRZ/X42dIaGo5GVKmNMXtMlm/HQzLhj+bm+g+yvTTid/+hLSlZDdRSrGa
	 5cz1e9PyAHDYZG8FlU0yV9iCcgfgcmxPxLHWO3+6clh3tbA78/3Sk1OT19E9RXqpDD
	 5SaaZzPKoYmjun+CIZlyDZAXPbg6sW0vS6K1dFxJwg0M3vR37yEZDFsQKXFFSNtuKZ
	 SRRhkmrSm8H1AasnD/UNxUfzCYQA0BMgD4ktMrVHhyUe0aWBtNIAbXFUDALQ6etK3G
	 Ny7hARN7skekb+d+lUGjqW9s8kDAQjcGiyEEe4x+qqPJg+N+mpsylF7BO5EwZ1/Vvl
	 MQKCfyjZJJZ9A==
Date: Thu, 05 Sep 2024 19:14:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@iki.fi>, Conor Dooley <conor+dt@kernel.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240905225308.11267-2-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
 <20240905225308.11267-2-laurent.pinchart@ideasonboard.com>
Message-Id: <172558168914.3706824.15757823860738253407.robh@kernel.org>
Subject: Re: [PATCH/RFC v2 1/9] media: dt-bindings: media: i2c: Add AR0144
 camera sensor


On Fri, 06 Sep 2024 01:52:59 +0300, Laurent Pinchart wrote:
> Add device tree binding for the onsemi AR0144 CMOS camera sensor. The
> binding supports both the monochrome and color sensor versions.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop clock-names
> - Rename vdd_io-supply to vddio supply
> - Drop unnecessary |
> ---
>  .../bindings/media/i2c/onnn,ar0144.yaml       | 162 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.example.dtb: camera@10: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,ar0144.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240905225308.11267-2-laurent.pinchart@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


