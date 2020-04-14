Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023781A8F06
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392089AbgDNXSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:57582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392077AbgDNXRz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:17:55 -0400
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5A1F20774;
        Tue, 14 Apr 2020 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586906274;
        bh=WdTCiKOB3OQ85f1rwfCljxgiziBMlr0YfV55qi2jrbo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QloyWelBE71CmKIbD1RCzZaIo+K8lLUrkD6Mcj0n2X9sml82jxPgaTJNuPRGm1lYJ
         wA+1NVjGQiyQFTyBGL7ZsCTywawls9BlRFoQYA86gQrC5Z+JsM3H1KL+bgbkSDG1Gm
         vxFW0veMrMjt/N/+lnmEfUz2WZBXqi6c966yLDmk=
Received: by mail-ed1-f53.google.com with SMTP id ca21so1951945edb.7;
        Tue, 14 Apr 2020 16:17:54 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ0NF5bezvuP8Xjmwzv1uxqg3SquMqPJSXRqmb/GZLyq04c3Lw6
        kuPh3JGtRmxDMls0F8WR4QAae2sJUjZOG4mJdA==
X-Google-Smtp-Source: APiQypJgoaBAyxL3iPSZCSNJxM8D8LE/eTLS0VKjjmKTYGy/LZGI8Teu7S9DiqAb6Y+rOQS+UJVF+JZSuJ74kPLs5ZE=
X-Received: by 2002:a17:906:2ad4:: with SMTP id m20mr2521641eje.324.1586906273069;
 Tue, 14 Apr 2020 16:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200414030815.192104-1-hsinyi@chromium.org>
In-Reply-To: <20200414030815.192104-1-hsinyi@chromium.org>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Wed, 15 Apr 2020 07:17:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY__y81v6Ji5JBpmSeeh5J1kStzqEABcN7ReiM7OH5+gqtg@mail.gmail.com>
Message-ID: <CAAOTY__y81v6Ji5JBpmSeeh5J1kStzqEABcN7ReiM7OH5+gqtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8173: fix mdp aliases property name
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        devicetree@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Hsin-Yi

Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2020=E5=B9=B44=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8811:08=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Fix warning:
> Warning (alias_paths): /aliases: aliases property name must include only =
lowercase and '-'

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8173.dtsi
> index a212bf124e81..d1e9c41004b4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -42,14 +42,14 @@ aliases {
>                 dpi0 =3D &dpi0;
>                 dsi0 =3D &dsi0;
>                 dsi1 =3D &dsi1;
> -               mdp_rdma0 =3D &mdp_rdma0;
> -               mdp_rdma1 =3D &mdp_rdma1;
> -               mdp_rsz0 =3D &mdp_rsz0;
> -               mdp_rsz1 =3D &mdp_rsz1;
> -               mdp_rsz2 =3D &mdp_rsz2;
> -               mdp_wdma0 =3D &mdp_wdma0;
> -               mdp_wrot0 =3D &mdp_wrot0;
> -               mdp_wrot1 =3D &mdp_wrot1;
> +               mdp-rdma0 =3D &mdp_rdma0;
> +               mdp-rdma1 =3D &mdp_rdma1;
> +               mdp-rsz0 =3D &mdp_rsz0;
> +               mdp-rsz1 =3D &mdp_rsz1;
> +               mdp-rsz2 =3D &mdp_rsz2;
> +               mdp-wdma0 =3D &mdp_wdma0;
> +               mdp-wrot0 =3D &mdp_wrot0;
> +               mdp-wrot1 =3D &mdp_wrot1;
>                 serial0 =3D &uart0;
>                 serial1 =3D &uart1;
>                 serial2 =3D &uart2;
> --
> 2.26.0.110.g2183baf09c-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
