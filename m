Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7204745CD21
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244840AbhKXTZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:25:21 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:51233 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243524AbhKXTZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:25:19 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MulVd-1mY1YC0V19-00rnZF; Wed, 24 Nov 2021 20:22:07 +0100
Received: by mail-wm1-f50.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so2973822wmd.1;
        Wed, 24 Nov 2021 11:22:07 -0800 (PST)
X-Gm-Message-State: AOAM530Y8T9MVAZaaG/zDSsDvnv79rTzglEiOySjgIrPEgyeYvz/pRp9
        IeOJwLETOIRZX8gLOwnh3Uv5KpyXywqVa5qcPeE=
X-Google-Smtp-Source: ABdhPJyA967xXsVVOdLJdkVj5zYgmz3qs3/FxEAJIV2nNiYoRheYa4DjM+GWWKPY+38aCDJUPzvYqT2XNbgtE7c9kMM=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr17497596wmi.173.1637781726785;
 Wed, 24 Nov 2021 11:22:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org> <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 20:21:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ez6nEw4d+Mqa3XXAz0RFTZHunqqRj6sCt7Y_Eqqs0rw@mail.gmail.com>
Message-ID: <CAK8P3a2ez6nEw4d+Mqa3XXAz0RFTZHunqqRj6sCt7Y_Eqqs0rw@mail.gmail.com>
Subject: Re: [PATCH 18/20] media: mtk-mdp: address a clang warning
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>,
        Mauro Carvalho Chehab <mauro.chehab@huawei.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vWb0aqbCgPPx+8oSG3he29TFEVIpooUUVX6BaNktpTLtvW02HP/
 b2o8/9YCE4SlU7lnmuPfJaTm65yRBsbizRVtehR1RXGBjMHxCC/5ZaGhCKEB+UOZ89OGJsL
 vETdcB+eYvEPhiBdW1fkx8/7Q1wnLmki2yvmsNPVZwuE9ejMvzq1ySIHzQwlhne/kTNTqXo
 z4qhtHohZjCOlNKDGgc2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ijx3qnJwyzY=:4vsRg5vCMHLDN9IuuVP3ak
 2+dvgVJHBqqYNHMW10TIy5zUOeR1zVY4RZCStkfSJIy+DTpniOEwxyT5lFyzV3tv3VHS2DAJ4
 LBmaTbMsFSk5gWGSfczlTnYf/KEXz7hDHUd19JThQSO0rGq32FYHzmnGtlzR9S3eQiojBiVb8
 UlQPM9yVlxJ3U45wdf92WjxCNPjOP157SIwt04ITS3PG0GtIhmFzD2imTg1FU2ATzmvJA+iQp
 QrQsMiesev7/o+zZtAQHxg4aRBLEuUO/QNlN5zHYgfRGviermpkeVGBThVrtvCh9ehR4o5oyW
 Z6qrAeB+ofnu4Xm579lp6NQ2MzObdKORGXDzZVgcs5bvPGnbV0P0vbTukpeXB7CqXvBR27jja
 VNFJca3JwKh1AfeJQcmHdT7rpQGaD1eYjW0+96cNHOfcOwmnf3SHKmWAAKtkgU9R63xkfd0zc
 vig52UH0ojb/C14bdKAUkqSo09Xx49OCOzQBumJdUexaa5UMOhUZa7fm9qSFLvrtMb0J5cc5s
 HhgmVjO8l1LW1rrGnYRhz8QwFPZWpm1Jew+CPP+EkOW0fMib+0zuhgLEWr7yFhDh0Eprluzns
 1lCgpr5Rh78P9ZewU/u6caDmnt19kn869i3LsMniNVucT14NcOyLTvRfoEIzg2vlSWXIJf21i
 /fmXOFb5fmYhCDmxfYyKzbzPT7Fff8jOhMXo+0yqAT2bRFQmMIGM7IwEpHHTysWcaB+U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 8:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The typecasts at the dvb-core generate clang warnings when W=1
> is enabled.
>
> Such warning is harmless, but it causes the build to break with
> CONFIG_WERROR and W=1 with clang, so do the cast on a way that
> it won't produce warnings anymore.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

>
> -               comp_type = (enum mtk_mdp_comp_type)of_id->data;
> +               comp_type = (long)of_id->data;

I would generally use (uintptr_t) for this purpose, but the effect is the same.

        Arnd
