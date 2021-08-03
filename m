Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9795C3DEADD
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbhHCK1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235404AbhHCK1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:45 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04733C06179A;
        Tue,  3 Aug 2021 03:27:31 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id v8-20020a0568301bc8b02904d5b4e5ca3aso8037949ota.13;
        Tue, 03 Aug 2021 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a7FlZ03sMMFDq0EaJdzNgcA0RsE6ZHavlLrFbWbkVBI=;
        b=CTvQRaLuHwpr4YFmOpNfdF4A7yyh8VZ2GPLb8DzFNh22erw5Cc++vRRWJbF8keKdqd
         QVlhXXTEbwiHd3ovcn+RcDXgwv39FPnlMsufgZIJtX4a3NvXsLc8k/8jArevnDYmRJk7
         etrhLn8B0xe572yuRdZCNl/+thKd2QwGbU9fmTaZ69kgpWfm05aqq6ond6VQT68iHOz8
         qWG+MBQxMbz3Na1Uoxk/aD/a73ViW5EScqo/QdCt7f/f0XcECu+be2OEq5ULZOkJN0Y8
         EC/vrs0c4KdMVgYkEW7PDSBr8iHqkct/6kvg/axaC2Ds7gG5wHgOcc1v7pGCEKRS/J6A
         iRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a7FlZ03sMMFDq0EaJdzNgcA0RsE6ZHavlLrFbWbkVBI=;
        b=cXe7abme+8uWSEBJDbz2D6yuNkQ4eSiUVr+HMKqYesSRtoTuXppjWd90zzcBTiO7JR
         ZGqrC8ucjpXROG2xDa7Y7NsPfkjpnik2a88fXF9iIJQ37RcW71qrODGwSdLOP3ml1IX2
         KoaCiFjSt1Sx2OdfLPtBLAkB4qZv1No+H+VtzkjBHdRC3taARw5QuyFWriMQRx+nKjBn
         nM8oXjxNsaWAZc/X/dZGI/4iMnHVmawcnKm0vFCV8QKK9hqrZPGeTBG3t/4yxlUUgqyo
         9C3wtVdBcY+GWIe3Yk8gvO7u2o0q41xIeNVker40+BWKmIslpZoq0J038AOgEK/5v5Yl
         17Cg==
X-Gm-Message-State: AOAM531Giks82wN9tBXvQV4zw9UVnJcJzY5qRdAZV6ulQTrZhba9HAWM
        KfC6/B1GdwEcXZ13XeLTi8GmeYaVKN+y7uu0kJE=
X-Google-Smtp-Source: ABdhPJzoYlu+4fKg13DVvIhykV/dAvtsAaqF362YwTXvXeldN1kY6BImYn+JXzeDMp+4CQ/KtyJzyzujhmKXSI4scSM=
X-Received: by 2002:a9d:d86:: with SMTP id 6mr1355299ots.362.1627986450426;
 Tue, 03 Aug 2021 03:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
In-Reply-To: <20210802220943.v6.9.If10dbdfade9f48710e485efe79e53e6e65144a2f@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:27:17 +0200
Message-ID: <CAFqH_53dZxhTwVmSRJ5DX+uV86cPRZjyEri3UEzcRLiye=OhNA@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement from mtk-mdp
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dl., 2 d=E2=80=99ag=
.
2021 a les 14:15:
>
> It is no longer needed by the mtk-mdp driver
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>
> (no changes since v1)
>
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/D=
ocumentation/devicetree/bindings/media/mediatek-mdp.txt
> index caa24943da33..4c325585f68f 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> @@ -4,8 +4,6 @@ Media Data Path is used for scaling and color space conve=
rsion.
>
>  Required properties (controller node):
>  - compatible: "mediatek,mt8173-mdp"
> -- mediatek,vpu: the node of video processor unit, see
> -  Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
>
>  Required properties (all function blocks, child node):
>  - compatible: Should be one of
> @@ -41,7 +39,6 @@ Example:
>                 power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
>                 iommus =3D <&iommu M4U_PORT_MDP_RDMA0>;
>                 mediatek,larb =3D <&larb0>;
> -               mediatek,vpu =3D <&vpu>;
>         };
>
>         mdp_rdma1: rdma@14002000 {
> --
> 2.32.0.554.ge1b32706d8-goog
>
