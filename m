Return-Path: <linux-media+bounces-36457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D9AEFF76
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2BA48834B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 16:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E40827CCCD;
	Tue,  1 Jul 2025 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5/ETV29"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36C1B0421;
	Tue,  1 Jul 2025 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386671; cv=none; b=WQSKwdSS4fGDKm7zhdoDwzKwR/za1l1JTsTOgOn85pGw9nOnmFJGdZvTRkk2lVpYDsAW8B/k7NggiLOowQixMi0vjUFNfk2aCTv3ukWYalpyfzAnojlFaexzVDtFPUrBdxNeiDvChTyB2Md16IrcmZlAFF3UcSqI3Za3U2p192o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386671; c=relaxed/simple;
	bh=VgEUdu0q4EvG+1GBYiBLad2HJ/euMqfFmgh5Ah/cRY8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bI8tJ3hYjvDaotHdjmZAuyu89A/sLiUbcUYyfz5nwQcp6f//VvoIufIUaxQzNO7p+zE6g6R6zzQkiv6j6IScoKXqjPR05lP96qZLt3M6654B9c9c/1e4oLAkxuJl+330OEvcMFDUdj8+2nEizsgTLWcj8ohWkS6k9as+TvOKfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5/ETV29; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1D0C4CEEB;
	Tue,  1 Jul 2025 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751386670;
	bh=VgEUdu0q4EvG+1GBYiBLad2HJ/euMqfFmgh5Ah/cRY8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S5/ETV296TRoztdOgbrk4egzZkxadobWOKmlzSxgzYiw1jn1ilTfNGvzE3md26GhW
	 f3nEOj5zMSOO+phCMxDYRT/Sg/0gtSUtPzGh9qpaCEtsHMAIB4DAFpwfbq/yeMp8A5
	 mqrlrgroD/kCFr8Trf63daIIzwB2jqyzhUZBAZA+iOEMNJDkt8j4sMAwUGvostgS7X
	 IcYCsnSXLr7LvGu8epTfbKDr7FTr4+Ibjewc+U5QsfumhrSvXKeidfyK3ghfonh/+s
	 4YmXnlyRsPPzeaZPDN8lo1xC0pSIjEz/eX0Bbm5nUExwFS/ds3ay0wU1WGMEssxaL9
	 PmolG3w8vUGcw==
Date: Tue, 01 Jul 2025 11:17:49 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 mchehab@kernel.org
To: philippe baetens <philippebaetens@gmail.com>
In-Reply-To: <aGP67H5_GxL4z2Nc@raspberrypi>
References: <aGP67H5_GxL4z2Nc@raspberrypi>
Message-Id: <175138666987.1857452.9901567554592051735.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] Add bindings for ams Mira220 cmos image sensor


On Tue, 01 Jul 2025 17:12:44 +0200, philippe baetens wrote:
> Mira220 is a global shutter NIR-enhanced image sensor made by AMS.
> Driver is submitted in the next patch of this series and verified on a raspberry pi.
> 
> Signed-off-by: philippe baetens <philippebaetens@gmail.com>
> ---
> Changes in v3:
> 	 - Improve commit message
> 	 - add mailing list for device tree.
> 
> Changes in v2:
> 	 - add maintainers and Documentation.yaml
> 
> ---
>  .../bindings/media/i2c/ams,mira220.yaml       | 125 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/ams,mira220.example.dts:24.39-42.15: Warning (i2c_bus_reg): /example-0/i2c/camera-sensor@1a: I2C bus unit address format error, expected "54"
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ams,mira220.example.dtb: camera-sensor@1a (ams,mira220): 'vana-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ams,mira220.example.dtb: camera-sensor@1a (ams,mira220): clock-names:0: 'inck' was expected
	from schema $id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/aGP67H5_GxL4z2Nc@raspberrypi

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


