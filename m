Return-Path: <linux-media+bounces-13081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2A905AD0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760441F2429C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B7F4084E;
	Wed, 12 Jun 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2rTv7Hj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943131A83;
	Wed, 12 Jun 2024 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216794; cv=none; b=Ui1wYeg1dq0KgVFRqshb6ZmBKD7WNbftwvCR6yFKCdJ6z/xGdt8QVq+80yAaEE2uAu4dG1MFRlQsaaYfrdeffipYrwRb5LlUQNyCllP2ktHU1S8a+LA6pzuVlbzTP5tdtzwE94IY9xYm6XdlPC2zSy+Y2OYznYDX+nK8Nonxkx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216794; c=relaxed/simple;
	bh=Oflo0Z6FTwnUSLl+h7B3P+bMflqpd3ukTy2UKe/HuwQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Zx/oxdui90mYrLicBN3MNlM+c9b7J6RAjRBDRFzl7Qza4mCGk05ofooAEaJGnb40Q6el4n3QcMju+nTjshOXYp5c5J1pDWeXuAtathp+RyrjjpMvXtjZnBp2zzu9cRHf+PLlEDH5wO+aGBqiEg73/GdrOKsj+t9dtlOMQ3m9t7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2rTv7Hj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9FDC116B1;
	Wed, 12 Jun 2024 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718216793;
	bh=Oflo0Z6FTwnUSLl+h7B3P+bMflqpd3ukTy2UKe/HuwQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Z2rTv7HjFJLHLPmxLkfFWfoZVsrpsDg33wNt8pzWfR7haHlnF4ZXXBt7JS9wd0sj+
	 NyaplEUsjtqORao/P+OHiBdXmg3h9qrAjRfkVORmcXZJm1QcQw2SMXjzLnd415nA5V
	 3P2Oq/HC0AFfuMYJREx7iez2ND0CQ5H4yyKUp6psJoNSMKffXSc/PIIH3xUR8dZVgk
	 vvgYJHc9lcFUtCoTE6vxIJGAifJqbNXw5GDAB93aBlClGjN0kHJ960JnfE9Zf0jwZu
	 yAJ+494ULgRbE7G5qv5rU1+MUmoArKGRMq14/aHZ1qpOhFQT8vNsiFNswrRq9lCLMb
	 Ut32pJ4Hs0aEA==
Date: Wed, 12 Jun 2024 12:26:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 devicetree@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, 
 linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, kernel@collabora.com, 
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240612173213.42827-2-sebastian.reichel@collabora.com>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <20240612173213.42827-2-sebastian.reichel@collabora.com>
Message-Id: <171821679246.3419351.9732124883795406633.robh@kernel.org>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: rk3568-vepu: Add RK3588
 VEPU121


On Wed, 12 Jun 2024 19:15:41 +0200, Sebastian Reichel wrote:
> From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> 
> This encoder-only device is present four times on this SoC, and should
> support everything the rk3568 vepu supports (so JPEG, H.264 and VP8
> encoding). No fallback compatible has been added, since the operating
> systems might already support RK3568 VEPU and want to avoid registering
> four of them separately considering they can be used as a cluster.
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml      | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml: properties:compatible:oneOf: [{'const': 'rockchip,rk3568-vepu'}, {'const': 'rockchip,rk3588-vepu121'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240612173213.42827-2-sebastian.reichel@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


