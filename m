Return-Path: <linux-media+bounces-32241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D76AB299B
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 18:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E469174A8D
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 16:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6882125CC60;
	Sun, 11 May 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKj+Z7QH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A41426C;
	Sun, 11 May 2025 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981502; cv=none; b=MJzrt6CyVU8OvVzCGazeLP9KApZvXd8RzJb1fyFAftxANBYqv/ulm9WDCjL+jrh5kYJB1F3c+HXOc/4mvMbK2QgWKkJTQF0U6RX0/8Q6t9hBu/YbdhPOXyoIRuGbiQOpzRuZaRcp4LFuHrOXQZPQ6pewm5wd4TDA2wj+XKC0kz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981502; c=relaxed/simple;
	bh=hs5vd8LRGfzxohCkfiT0NgBKcp5M5vzIsAKBSBoXpLQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=D8LT9261r6bw0kS8VTLNZN9BBLD9vqO5eW3nEcpMt+F6qloHCRqQTdTAw4tG3ZYvSF3sVx9FmxGFpq73iFIdk18uJ8LblP0THKWiXDvfRINbPzZubGc2pAyDMSRROfDsJWURep4/z8mBpNZGF5xz+esJVU14V8OJ3OkrRN/C6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKj+Z7QH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171BFC4CEE4;
	Sun, 11 May 2025 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981502;
	bh=hs5vd8LRGfzxohCkfiT0NgBKcp5M5vzIsAKBSBoXpLQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iKj+Z7QHlhKB3tC5Zy0pppDZKsomMglPO8eSOMhdfZmNdk1ifDb4+svINF/4J2UC0
	 gwPfIOcRd65sFHTnRfoz6rvfmXlzfeaTe9tdeSV5Hbpb9uuilbn5u53QOzSba5Vv6r
	 kNzZy+KJm861N8LvwR4O4SI2CCopHm1FLlCjzlrXL/fkXriW7FKBlqMCWjkEXgbjDY
	 SJ6YWKvEHLOW3oVj2UnXZ06MKymeQ+Sv0zMtOMaa1BuwUqqB02FSKCykpJjXfUU5yd
	 YIf+Xx0A6X92HPqBVnQADUH0ddUl9wobZ6wysQ2+TvI6Wz4nlyWIYOVsr1kSnUM/6U
	 xKRbtaYcBAalw==
Date: Sun, 11 May 2025 11:38:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Junhao Xie <bigfoot@classfun.cn>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 linux-kernel@vger.kernel.org, Michael Tretter <m.tretter@pengutronix.de>, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@amd.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
In-Reply-To: <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
Message-Id: <174698150049.490551.15288138396615870362.robh@kernel.org>
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3
 IP


On Sun, 11 May 2025 16:47:34 +0200, Yassine Ouaissa wrote:
> Add the device-tree bindings for the allegro-dvt Gen 3 IP decoders, and
> update the MAINTAINERS file.
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegrodvt,al300-vdec.yaml | 86 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml:52:3: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml:52:3: could not find expected ':'
make[2]: *** Deleting file 'Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.example.dts'
Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml:52:3: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250511144752.504162-4-yassine.ouaissa@allegrodvt.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


