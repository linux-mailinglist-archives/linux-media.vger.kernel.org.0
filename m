Return-Path: <linux-media+bounces-24059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E09FC4C5
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 11:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9E9B7A16F5
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78120191F7C;
	Wed, 25 Dec 2024 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wm1+iNeM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361113B7BC;
	Wed, 25 Dec 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735122568; cv=none; b=hKfiTKvhaoU6wMnyYm2Zp0AosghOHFoc+2Hx76WpOAl9ARydK7TsumAfdRigB9YurQ7Oss0vAaDjOLiiyE3b1AsxlMNabYC5rXLWdXpHGuAtxWT6daTSCif+0qXWKIIi1InR4JE4CMI1b2xENug9+JP8QCdoPsRp4wSQX7lKjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735122568; c=relaxed/simple;
	bh=BlZHZylE3rkpvbrheLcHA/p7NRcnz2PMtoKAQwhJgy8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nkHhQVAGxwq+fZ/DgqtXv4iy6gSZxybuH7kcV44jcoL6S+A9uol7Bu0UvlQu5gQ0WXU9k6XcWwNoDmluT4xIETnpjfBoTgXUDG/NP/XqWw8alN+fhw+JHQg1BeKtXYcF4xpf+Te7ZmA7d3b8RRwbikSvAG3AH04134JzhMy4MZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wm1+iNeM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4582C4CED6;
	Wed, 25 Dec 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735122568;
	bh=BlZHZylE3rkpvbrheLcHA/p7NRcnz2PMtoKAQwhJgy8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Wm1+iNeMLPeEftMNySyryeQTAFkv13G5yNV7DFPagTpHSS0s15hTeIOQUpcWYvRd8
	 XVgtT5RIagUjDlU//D3gj0LGvKKkCi/bU5b68/X9zn+Xd1bA17CLL+PVca7BG+CxyG
	 uNFEo0zZjNwwzp1o9qKpuNgRZxr6mtt5fwStRulynhHeWYMRgORzbR0cCwtSzrxn2N
	 9zgp8AxQKXkX7CJoiF1ljyB762/Zg4u/usZU8+vy/CI/+rR+kqIVAtJeFyzLZWFcKq
	 v6S/CSSbkxzeLKnVzkVZag+Czd/L6Yve8gTtuO+YKFCX4/lFQmXge8qcuPl1yR8yiZ
	 yMJfdiUdS1p4w==
Date: Wed, 25 Dec 2024 04:29:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bo.Kong@mediatek.com, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, mchehab@kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org
To: "bo.kong" <bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-3-bo.kong@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
 <20241225090113.17027-3-bo.kong@mediatek.com>
Message-Id: <173512256651.1988706.15570394656231888489.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] media: dt-bindings: add MT8188 AIE


On Wed, 25 Dec 2024 17:00:21 +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> Add YAML device tree bindings for MT8188 AIE.
> 
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> 
> Changes in v3:
> none
> 
> Changes in v2:
> 1. Fix coding style
> ---
>  .../bindings/media/mediatek,mt8188-aie.yaml   | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek-aie.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.example.dtb: aie@15310000: reg: [[0, 355532800], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-aie.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.example.dtb: aie@15310000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/mediatek-aie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241225090113.17027-3-bo.kong@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


