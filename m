Return-Path: <linux-media+bounces-33324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A8AC2FE3
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 15:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152033BAE00
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4FC1E47A8;
	Sat, 24 May 2025 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOIIg87z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC07182D0;
	Sat, 24 May 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748093863; cv=none; b=P63ql6Hsc3QJm3jXYrIDWZ96/tg5Z8csF37x/9q2jHbp7K7D76qr7odOREUk3G/7sFuXcF0FrzpfKGrttpCC1T+JZvDNyCcFc/Y6akzshIoVkKeB8T4ZsGxcxsMhKq4h89hVj9TrB92cheW9b74haC7eI/kaFfUHqq6SRfFogRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748093863; c=relaxed/simple;
	bh=Dy6g9iTJD8/sXEcSHCbtuzEf0zlqojTeZLePMYmRv+w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OzGmSIAuJqreR/jsPDBzMOubFv6kg/szzKTJoX3tpDpsqjgDP0BXss+QLf0smHfENeHF9iL/Qn1BDVHoruNBugYba4/8UrXnapBG+545Gl2IuBF0NmeffeomaauK1oszb9vyNVkz9mX3NzViEY2BlrH2tcuJmnhVJtQlvWp3eIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOIIg87z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C23C4CEE4;
	Sat, 24 May 2025 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748093863;
	bh=Dy6g9iTJD8/sXEcSHCbtuzEf0zlqojTeZLePMYmRv+w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eOIIg87zh16DG5Ntu2dB+0edVj7Y2lCGJkJb5PPPgPxMknBBYeI/bGEcagqr2lCgr
	 M64M3gQLleXjic+p5O+b3eEmbIoapNkQLziZv4RN0U9kzMotl28HijCMHRYRJFdO57
	 a6f4PLTUdcu1GehK2z1NK/hsxdX5U88+UgMAXJeIAzgCnvygIzMZYGroaGJa3Aktln
	 8xtc1vwFlXb0FLf5+2tJp2W9AaF7KRWJz4R+usnWbM8399sg6wn3KW8kIT1oQcj4vs
	 g+wfQKDQHnOKclykBkDi/k245pxD4r/2eAr0fWYzWQRTzw97nSIvSGs+qcwLhl6pYy
	 DrKSNNenJ0PwA==
Date: Sat, 24 May 2025 08:37:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: teddy.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 yunkec@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org
To: Olivia Wen <olivia.wen@mediatek.com>
In-Reply-To: <20250524115144.3832748-2-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
 <20250524115144.3832748-2-olivia.wen@mediatek.com>
Message-Id: <174809386038.549652.1263468272508643617.robh@kernel.org>
Subject: Re: [PATCH v1 01/10] dt-bindings: media: Add MediaTek mt8188
 ImgSys components


On Sat, 24 May 2025 19:49:53 +0800, Olivia Wen wrote:
> Introduce more Image System (ImgSys) components present in MT8188.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> ---
>  .../bindings/media/mediatek,imgsys.yaml       | 180 ++++++++++++++++++
>  1 file changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,imgsys.example.dtb: imgsys-fw@15000000 (mediatek,mt8188-isp-imgsys): reg: [[0, 352321536], [0, 16384], [0, 352452608], [0, 65536], [0, 352583680], [0, 65536], [0, 358875136], [0, 65536], [0, 353370112], [0, 65536], [0, 353697792], [0, 65536], [0, 354484224], [0, 65536], [0, 357629952], [0, 65536], [0, 354418688], [0, 65536], [0, 357564416], [0, 65536], [0, 358612992], [0, 65536], [0, 354549760], [0, 256], [0, 355598336], [0, 65536], [0, 357695488], [0, 256], [0, 358744064], [0, 256], [0, 353435648], [0, 256], [0, 353566720], [0, 256]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek,imgsys.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250524115144.3832748-2-olivia.wen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


