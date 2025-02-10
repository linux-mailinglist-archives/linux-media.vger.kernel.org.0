Return-Path: <linux-media+bounces-25920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F287A2EEB1
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DE7F3A311D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6566F221DA9;
	Mon, 10 Feb 2025 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM368Dxi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7822E3F7;
	Mon, 10 Feb 2025 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195278; cv=none; b=gwVcDIxT08lX9D4w2nVgMVnxYskkxaNMhdu9atsFyohIHtn9PmGaH5sh31chCgFQ1QvVKDPDEJlTpeCbqsze8ANyffN220nnqDFkduXhIr5EgWDZuWuHZh5xjW6XZNeFm5vpEAtZWJcCXFt0TM3hlQUWzSLHCLbKpyhkiE+puaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195278; c=relaxed/simple;
	bh=phjTkeBW3jpIy4yyAMVBWW6wSEKLGXYJA2Uw2ivdlAk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hOpWScQPG4bMKwJZfPl3eEiMKpT9conkhf8aLrJPM1yHvBy4sABaCZht06YAbKoUkOwyD21On33VxPlz/P67ZrlHzabLyg00W6kt5jhceDjrpqpmtMnZDm/1gp1JCsll6TFZD6zLyL0acijKf9QtIBuEi4GJHttJ7VB5sdrpboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM368Dxi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F15C4CED1;
	Mon, 10 Feb 2025 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739195278;
	bh=phjTkeBW3jpIy4yyAMVBWW6wSEKLGXYJA2Uw2ivdlAk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WM368DxijHFoFRVrf+ibBThM57jXWtxWO9y8SzgpCK0VZnLSjrgMxjUoAIqoxiCFe
	 W7Ocv5bH5vaP3a7/TMXoA6LVx/h76sldpBphpLOPaUArhJI0ARHYN/zrHyF7ziF77t
	 x4//JjrnK2as2CMb+UM0IjYc0UQ+Tw5sHHLPgZgpvbu/+wrUzCJE/MZbWjydBy6s50
	 ExtPEumf8k7B6YVNhiVD2jcqfvxgLcq2M+3wX0Y45NgJYLra4Dp0Ajz0H1B/GwBokF
	 oymVhYgqzwjmjmK/TxxvyKVCxsQ4qiOeufKiJkX9YsUZSIFneBI/6g7m4R66kgyvFG
	 JI5xZFZdfaPpg==
Date: Mon, 10 Feb 2025 07:47:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, biju.das.jz@bp.renesas.com, 
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org
To: Tommaso Merciai <tomm.merciai@gmail.com>
In-Reply-To: <20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com>
Message-Id: <173919527685.4086548.6588828837427786164.robh@kernel.org>
Subject: Re: [PATCH 4/8] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G3E SoC


On Mon, 10 Feb 2025 12:45:36 +0100, Tommaso Merciai wrote:
> The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
> interrups:
> 
>  - image_conv:    image_conv irq
>  - axi_mst_err:   AXI master error level irq
>  - vd_addr_wend:  Video data AXI master addr 0 write end irq
>  - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
>  - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq
> 
> This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.
> 
> Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 33 ++++++++++++-------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.example.dtb: video@10830000: interrupts: [[0, 167, 4], [0, 168, 4], [0, 169, 4]] is too short
	from schema $id: http://devicetree.org/schemas/media/renesas,rzg2l-cru.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


