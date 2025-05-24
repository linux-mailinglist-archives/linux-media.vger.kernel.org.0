Return-Path: <linux-media+bounces-33325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1BAC2FE7
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 15:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E350189DD41
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F4D1E7C08;
	Sat, 24 May 2025 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FISFleck"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844411E5B62;
	Sat, 24 May 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748093865; cv=none; b=iZVezpURCuC+sivn0PcEpjcwtmM1izECZgqLAxSRNtpZKSU0hMyqQt9ALURcTt4oLOxNNkjV0tPB3O6v3ua6TPP7Y8/Sxj7NQ6Gn+k3iVANzZaCrA8VY6d8zKGe+q8ZuJ10AwrvOnRMRkr7kfKcqZqsM/gKWvQKfPrZ/4kOUfW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748093865; c=relaxed/simple;
	bh=Rr1Xa7yDBxx2hT3ic3Dq3kYtEe67rYrGKMaE4/DKIwA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WnUrjhHf6H/B5Y4353VZ2bMHDTizQpHbjnNWVOQvftOxeWgBj5Q8wK1GGr5Ac/aQqjlrjUdijwnRRMpxJ2MCAqKppsq4UyeN8nBMuOrFdgqjxWeu67yequCFboIN3qpdPWHBf3AdiAOefsJuKev8olSFzDgHgo/s469VJq45uRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FISFleck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33215C4CEE4;
	Sat, 24 May 2025 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748093865;
	bh=Rr1Xa7yDBxx2hT3ic3Dq3kYtEe67rYrGKMaE4/DKIwA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FISFleckQqpX8PG34UP4oEbwrm5iGq6A8n3X69FzrvWxQWwvKJzQ9e+P/QM8S0u35
	 y9n1I82g2LTp2zNrb2xfRdZ7JifsjuiAoz0sGOLuGOCOUhedonT5hTdnLmSCyY1aHH
	 phoDVeau2VmbN8+vmT8zCRMxfo03oJiYSOBc+Z1ZBLrLgZnw/1I7lpWT+jaw/2q/R8
	 mF5JROn1rARZWhV8uFmDmYFt0739S8Sq2Znd411d+ouNpV793Xjc4/O42jyztXmXQt
	 WvmY9P9uXAh0I5kD/gpzTjz8ovjRIDyUf3Jf7GNoH+YOfOWB2vavu+xY3DHSHTtYEX
	 1PQL8CGIz1edA==
Date: Sat, 24 May 2025 08:37:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: teddy.chen@mediatek.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
 yunkec@chromium.org
To: Olivia Wen <olivia.wen@mediatek.com>
In-Reply-To: <20250524115144.3832748-3-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
 <20250524115144.3832748-3-olivia.wen@mediatek.com>
Message-Id: <174809386113.549698.18274088720500456314.robh@kernel.org>
Subject: Re: [PATCH v1 02/10] dt-bindings: media: Add MT8188 ImgSys's LARB


On Sat, 24 May 2025 19:49:54 +0800, Olivia Wen wrote:
> This patch adds support for the MT8188 Image System's Local Arbiter
> (LARB) in the device tree bindings. The LARB is a crucial component in
> MediaTek's ImgSys architecture, responsible for managing memory access
> and arbitration between various hardware modules.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> ---
>  .../bindings/media/mediatek,imgsys-larbs.yaml | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.example.dtb: /example-0/imgsys-l11b: failed to match any schema with compatible: ['mediatek,mt8188-imgsys-larb']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250524115144.3832748-3-olivia.wen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


