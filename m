Return-Path: <linux-media+bounces-26370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A6A3C08C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9371A1693A1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396771EB195;
	Wed, 19 Feb 2025 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFIwFIYx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79787199E80;
	Wed, 19 Feb 2025 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972948; cv=none; b=EEACPgdIHNP3uR9uNz4iZhRGvZNfA4T6gtT3UygoQ29da0k/niRg3DmRCwd+dfLVyPweRICHa7emX/OnbTfB2FVOjb19LUgGyAun7Lwt79GNnwW+OJCWkNvQOEVxnCR3+roqQ4bOvNcfN9pAe2FLzDawp1sbc6PZqR4VxrJpFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972948; c=relaxed/simple;
	bh=A1jQdtZvRbIjirpi/QpXD1jZ8tpStZUExtEIfK1U5Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOz05UaDVhreidWKpp5xvpHkyb5yKJ0yQqfzqXXcITRDolJEm1a4Ypay8sqbVPCZYEIpX59ZhYrn1LV0R74Zo0aS3u+xZmxLHkWpZf3spFUQIzP6sJ2rWchx4h/2mTbojYWBez1rncSrTvVnNGwjSVxA7HuZT5brJKLS4235iy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFIwFIYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAEDC4CEEE;
	Wed, 19 Feb 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972947;
	bh=A1jQdtZvRbIjirpi/QpXD1jZ8tpStZUExtEIfK1U5Cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IFIwFIYx0ARMx+0zY1HAfpnbVgkm//Wuvx46GSLkxcqt8pyR8cUWXdqQX9Ej8EiXY
	 lOcuGfIVJCls3eng4yKpq6pAOUAIFyjgJeOMXv/uc14jU0fNAWka+TYNrkG31Zby4A
	 q5VS+9iwtZOHE40aGcTDcdLU23EEaiFCpiIqVrn1HUceDqzWSED6ATPKac07FqWy18
	 xGWm3cfbewXnj16OJw5uP5S/dxWwk8fUQBiuNCzCP4YyUOTi2SA4nzyCv46RrN8pxN
	 geAc5o/X9/8YtXZmLfPdQPqnu0SC7k0Hm5aYQkVlcEXfFH68vkhwsmQAihN3TDx49u
	 +73uOfTOqinSg==
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so12733448a91.0;
        Wed, 19 Feb 2025 05:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3r+TkUvZe7ly/BbfAlwfhwz+zv7VeLiehuaralBs0JAVvpNFH/iGh/DkXOVq6/NuIuOsE9LrnD+ebDuQL@vger.kernel.org, AJvYcCUPOBp0c1Qt+4uHGJVLydFjKz9e0UbfraHyRalDhE+s5EGFdrZ+7NUD/SEFECX3EHu5RB4bH1QhAJLSYo8=@vger.kernel.org, AJvYcCWKykq2d1qY438QesGINQ1aFCsiLRbDHfWz4HbBKeObdPrRE8J2Zfe4N4Y6NlGe/iOhrPR91SPmJSF7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3bxzOjpWPIPzWqNj4tja5dBGWjRR2JIHobwlAW7D6PRWTwE/
	f3sC1JZ73qlE17dVtshf9UyIvpexDJrLBjfi8HPVr4zZyaLa4V2KXZ3mcg4UiKNuR0eLUmu2NdR
	cmojdLMyYWunp8t7cAgMphvUR2g==
X-Google-Smtp-Source: AGHT+IHzQqtYsvHwADMmf9VWFRyvbp1G6Xfgzoq4kaeRwD/sC1OC2iDXSHRlVSxq3fcQCkZrXfrGdEMDnJjaCDjhs5g=
X-Received: by 2002:a17:90b:17c4:b0:2ef:2f49:7d7f with SMTP id
 98e67ed59e1d1-2fcb5a39f93mr6272302a91.18.1739972947332; Wed, 19 Feb 2025
 05:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com> <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 21:49:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
X-Gm-Features: AWEUYZkyNYkPz9DDQbj1WmcsisPQynG6ha2xkIpk0KuCjDPQnw0UB2_LYJk3Qtw
Message-ID: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, sebastian.fricke@collabora.com, 
	macpaul.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B412=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:=
53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatible strings for the AAL, COLOR, MERGE and PADDING
> hardware components found in MediaTek's MT8188 SoC.
>
> This hardware is compatible with MT8195.

Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
>  .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
>  .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
>  .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
>  4 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index cf24434854ff..1479035da409 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -25,6 +25,10 @@ properties:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
>            - mediatek,mt8195-mdp3-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-aal
> +          - const: mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index 7df786bbad20..799c0b8fc1f9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -27,6 +27,10 @@ properties:
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
>            - mediatek,mt8195-mdp3-color
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-color
> +          - const: mediatek,mt8195-mdp3-color
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index dae839279950..415a25bc18fa 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -25,6 +25,10 @@ properties:
>            - mediatek,mt8173-disp-merge
>            - mediatek,mt8195-disp-merge
>            - mediatek,mt8195-mdp3-merge
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-merge
> +          - const: mediatek,mt8195-mdp3-merge
>        - items:
>            - const: mediatek,mt6795-disp-merge
>            - const: mediatek,mt8173-disp-merge
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
padding.yaml
> index be07bbdc54e3..86787866ced0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding=
.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding=
.yaml
> @@ -20,9 +20,13 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt8188-disp-padding
> -      - mediatek,mt8195-mdp3-padding
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8188-disp-padding
> +          - mediatek,mt8195-mdp3-padding
> +      - items:
> +          - const: mediatek,mt8188-mdp3-padding
> +          - const: mediatek,mt8195-mdp3-padding
>
>    reg:
>      maxItems: 1
> --
> 2.46.1
>

