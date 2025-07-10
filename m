Return-Path: <linux-media+bounces-37418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1ACB00C34
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91BDC4E475B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CE92FD59F;
	Thu, 10 Jul 2025 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQsyrrIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50021A43D;
	Thu, 10 Jul 2025 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752176239; cv=none; b=NKWuK1RiUHq4NtdfvoebKu66i2yDttcpCNBvBh3KLuuwWPLFxfOB3XJB7+X0SlKB8xtxui5xS1+NynUofGfsmhDmMSAXYzyV/fueQU3ChfxnBMnwxvCsm2Xmw8iomF90P1twLhMu+kDV672nsZ3PalRgCXGaIHDuBQMbKxkIjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752176239; c=relaxed/simple;
	bh=wBRWdKVUiTOi2ue55+EVrE7xGyuSv1oYeqjAhNF9NC0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=D0PxQzSNS+FvifPSaHSMhKCe0AYoZhWRcembeLJCujlmmo8DjzVB+/iGmISZvKo91o69kMoCR+Xvccl+rK7z0r7jqdZ/A3awLN4kh+pz5chSMVovZyOXYpKx/qdo7+QtKisBqR/q1T+1g9QvhNAs8+VkGayyk6FbVSYqh9CY3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQsyrrIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E078DC4CEE3;
	Thu, 10 Jul 2025 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752176236;
	bh=wBRWdKVUiTOi2ue55+EVrE7xGyuSv1oYeqjAhNF9NC0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IQsyrrIZ1eESquyPZg7NfrQgoAtO/YqE4wet+RvinF22jf2KEPZvLwylm5LnAjm4B
	 dZ+O7PbtcLXaRFpXzGWD/ixvqdZlpMKtTxe4Bs2xDdasYdnHZ7hGnOyLXI996ILhkL
	 02kU7oaO6f6nFtEmOKTYZJgpXLZhg9BbWGgEqTwk39i2pPmzajX4ABPov8Z9MLwo33
	 FHblCWXxnqAn6YD52brkg8Zq5rDx4Iy/w8svgLV1oMZNg6UVVc+XMlOlqbvRCQHF/F
	 m6tGE1bnuWfsYTTxGgV2SxPT2Ndw7yPJmZhT+92a2oonBCqgM19H2bCwsmuzdkYUYY
	 BolVvvYEvmOIQ==
Date: Thu, 10 Jul 2025 14:37:15 -0500
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
 linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, devicetree@vger.kernel.org, 
 Leon Luo <leonl@leopardimaging.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250710174808.5361-5-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-5-laurent.pinchart@ideasonboard.com>
Message-Id: <175217623503.3371435.1552463179944377502.robh@kernel.org>
Subject: Re: [PATCH 04/72] dt-bindings: media: imx274: Make clocks property
 required


On Thu, 10 Jul 2025 20:47:00 +0300, Laurent Pinchart wrote:
> The sensor requires an external clock, and drivers need to access the
> clock to retrieve its frequency in order to configure the sensor. This
> makes usage of the clocks property mandatory for a system to work
> properly. Mark the clocks and clock-names properties as required, and
> update the example accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb: sensor@1a (sony,imx274): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb: sensor@1a (sony,imx274): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250710174808.5361-5-laurent.pinchart@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


