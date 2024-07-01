Return-Path: <linux-media+bounces-14489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622291E8A2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 21:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52938285842
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 19:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA92816F857;
	Mon,  1 Jul 2024 19:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK/F8rRc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E416F82E;
	Mon,  1 Jul 2024 19:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862108; cv=none; b=mtEfnxjLfR8F1KKgLAzh+DD3Y6u7EhireBRN699BCApPBDx7quRKs+923DitXg8BsmSHt6hdNoMcyBccV+vGhPPYK+k0fzHVJT2mpAzAG8JNLVhYQ6g0UX7ydFjXhMZZRZ7SRJhP+Ryns/YP6TAkD6GFWbzES4tHOeFf0YxkYUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862108; c=relaxed/simple;
	bh=5Pb0c/Ig5x3IoqV7zXvxQplmAH8/JaolhjzydtQVsMQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=e0rXbHh2L654IgjjPG6bSCSVfQDGsIv+S0Afjy0hOMNg0q4j2XeDqSBstoTD8shsaWa8zddwlqZHLUSffKabVMxpziIbihHv/OWyn2w3vIyezCYfjsCuJSy1Q6scXeSOQhNomtNsQUkrmFiRSHAFJoTZwYTs7EZ9retrBma/NmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK/F8rRc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0362DC32781;
	Mon,  1 Jul 2024 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719862108;
	bh=5Pb0c/Ig5x3IoqV7zXvxQplmAH8/JaolhjzydtQVsMQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eK/F8rRcEhl6noiaLkE6Rb8qV2v5vtfplYcW20zP39uKLgGPewpCi0go+bYd5hLfh
	 cPo7tUtAKK2Xt5Wc7aYvB6iSu37/9XGzGYnUxXrsZ+xqTh1UtjxfNt0XpKc0pvdHDU
	 pHLtjrAr8Kj2MKRbMsG1lOwIMOpbT2s9V9NK3x0l9/hbQCmoDsYbu1z+2G7Rwuj0Dq
	 lNWCvQsCylYbKUQ1iN5LS93iXLokj19KOGdIb8K8tBX2WWmES6zQr0YtLr++9aciRi
	 VIzozdUEWlYtiPgjdPeEQZaTkv/zFdxIO0nkGXmv0vlhmopj3EogcXICnuyt537fV2
	 zg+ko26RMGa+w==
Date: Mon, 01 Jul 2024 13:28:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Spencer Hill <shill@d3engineering.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20240628-imx728-driver-v2-1-80efa6774286@d3engineering.com>
References: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com>
 <20240628-imx728-driver-v2-1-80efa6774286@d3engineering.com>
Message-Id: <171986210711.640699.6919165749438870008.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Sony IMX728


On Fri, 28 Jun 2024 17:17:00 -0400, Spencer Hill wrote:
> Add bindings for Sony IMX728.
> 
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx728.yaml | 119 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 126 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml:62:17: [warning] wrong indentation: expected 18 but found 16 (indentation)
./Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml:65:17: [warning] wrong indentation: expected 18 but found 16 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx728.example.dtb: camera@1a: port:endpoint: Unevaluated properties are not allowed ('data-lanes', 'link-frequencies' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240628-imx728-driver-v2-1-80efa6774286@d3engineering.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


