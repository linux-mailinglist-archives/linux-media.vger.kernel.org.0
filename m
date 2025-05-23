Return-Path: <linux-media+bounces-33271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E490AC25AB
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 16:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E4883BF440
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F419F296D2A;
	Fri, 23 May 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1jl85x+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B42957AD;
	Fri, 23 May 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012024; cv=none; b=MK66m9KCdEhUmzRXBY64ll+ubrmqrKSwWYn/0yPJDvY4PmHd0j5anWO3F1+3Q88Acj6SIfQfGjHNGfSJre+5WshseCh26uRTAgrhymHieqE9K5lBpw7GIcPySE5jCYwB51bWd39ezIsE+imA+/HopWPxjcPbuXFepG9mjqdeiLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012024; c=relaxed/simple;
	bh=HATUZF0Vtlf1O5ShWubkaMv3AMrVKKLUmHPj4Bew+YM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RHC7YJsaMwdbxHTYk/q9n0JnXi/EsuqD4ZbvVpsWN3YHSI9Pxv/wzFFbTTIy2kw3+JVuLKUGq2MYisdtCjRUa8+sXoDsFI53QlwbPGLXPfaU5NSRQ5GkK9EWGCvYmJHStqtcjMPfqbJH4LkXGTOf/Diw3XbCFatV5By/uR/Hhjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1jl85x+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A3BC4CEE9;
	Fri, 23 May 2025 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748012023;
	bh=HATUZF0Vtlf1O5ShWubkaMv3AMrVKKLUmHPj4Bew+YM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B1jl85x+fOg7LMml+TAJp9nfOKpG1bu0U0dQoYXlp9Sy77lk5VSIlae2qeu7Z56gW
	 oqxSBbz07sVPkgtnDEtT48/mbX8O0fKjDREOw9IaLRlLxKZMnEW/+1Um9Zh784b/r1
	 TWdFI7bMFu0GqpuLKncTSTU5RpawE5nMr/NAHTzT2TvnafVz1rIMhX0YtMI8ZubhSp
	 tZIA9fs82dTxlTJSG9Dt/Q4/2swXFguua3YdPkbkJXOZ/G0Cl3ZeBxvGMqPCLAduyN
	 mGYiLpV1PM57GQBql5LnDqVn0iqcTrmZ0DJGl2Bsh4nv9ZooLAoS47nk6mzU22E2Gt
	 aH1t9g2eBS2Vg==
Date: Fri, 23 May 2025 09:53:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Hans Verkuil <hverkuil@xs4all.nl>, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Junhao Xie <bigfoot@classfun.cn>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>, 
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@amd.com>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, linux-media@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Michael Tretter <m.tretter@pengutronix.de>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
In-Reply-To: <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
Message-Id: <174801202204.1815416.4328234127791627696.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP


On Fri, 23 May 2025 15:41:47 +0200, Yassine Ouaissa wrote:
> Add compatible for video decoder on allegrodvt Gen 3 IP.
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegro,al300-vdec.yaml    | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
MAINTAINERS: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523134207.68481-3-yassine.ouaissa@allegrodvt.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


