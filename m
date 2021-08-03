Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3613DEAEF
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbhHCKaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234674AbhHCKaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:30:16 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1DDC06175F;
        Tue,  3 Aug 2021 03:30:04 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so9573904oth.7;
        Tue, 03 Aug 2021 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3psQaSG4d8w1oQM2avr7nhWCNx0TL7drom5fez4dSiA=;
        b=fIfnWsy3hsqYB+PJtAaqeFHZ2boRJZ5sjE/ghiWyO7OXl3t78XlU35QhG2nOjwQw/S
         T7GmDRZ9VA+QBgDBuBGktWIhdhlZU8y/L4vnzPvwpyJfP4jT9GsTk1bJhUoQjO2c6NLu
         HX6d8qiCRup83YWKzbWwfLsVoqRsP3ZTk6VBn3fR3uiseGmyP+OlSPXL+47EemdkSDdM
         usvB9EZlI95pRRVWj3+FoE4evyPoPANbEC70Jg9DBHDX6StbDfi1PDfclEB0yVuAvc/K
         Tg5ZXW9ac+ngp/hGny7Jqnxc8UjtB6gF0XmpE9FgEk3z9BNDT3QlXlayKxRlxiQsav/R
         Swag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3psQaSG4d8w1oQM2avr7nhWCNx0TL7drom5fez4dSiA=;
        b=rHa63ZLhkE4rMGLDF2yH0xOjOD55/ys5OxFg/pC6onOp2gNmTdyIOX2A8Ga6dfpXvL
         IjUvyb6Dn/V0mQoJRVHcs3Ghd33FO7NvP4KdFxIDrv43enjPXSrexvsTyaqai+dFYBBN
         1Bl2VERDrYfX6uZJt4b6/p3o/Dbnd8VNtydtOEbP6fZ68TbYZWJ/eBIZa9NjrWCtklse
         UoAE90ciuxGY9+kbWQhdXn7I7zEu2ElTZOTPDTLRWjYe1MNZIReHA8RZEi09mH+GXvhF
         bMFpNqcL7ktlhFTjvcELp/l3eYkaCPTsewOplYaWCViSTzhQm+SDZnp/+4TAjaBby5T2
         AK4w==
X-Gm-Message-State: AOAM532EJNU9LeaEoa0EMCEsJv+OnnN/sR1mH1WLdf0vd8TI46vmJuGs
        GTkKXQlNaM9e0ZTd3jmo1JlEC/D207BipGn9q2U=
X-Google-Smtp-Source: ABdhPJz7aYEd1VRZtveXnt0Uwl+nfwcojVZh6wKc8vyRBwlK5dggbGl+2+Ssk57ujfH0wJjXVjtVV0NXFs2KSY3sNV8=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr15305949otb.281.1627986604246;
 Tue, 03 Aug 2021 03:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:29:52 +0200
Message-ID: <CAFqH_51ZYwokcWAV0tg5z3vBhHmP3MHGKYf=jWDCa78RSYpifw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Refactor MTK MDP driver into core/components
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

Hi all,

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dl., 2 d=E2=80=99ag=
.
2021 a les 14:12:
>
>
> This is an update to
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D283075
> To address some comments and fixes.
>
> This series has been verified to work on 5.13.
>

The series have also been validated on top of 5.14-rc4 and linux-next
on an Acer Chromebook R 13 without observing any problems and running
some video decoding tests, so, for the full series.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

>
> Changes in v6:
> - Don't propagate errors from clock_on/off as an afterthought.
> - Split apart modifying mdp driver to be loadable from mmsys from
>   actually loading it from mmsys into two changs to make review easier.
> - Update devicetree bindings to reflect no longer needing the
>   mediatek,vpu property in the mdp_rdma0 device node.
> - Some stylistic cleanups.
>
> Changes in v5:
> - rebase and test on 5.13-next @ e2f74b13dbe6
>
> Changes in v4:
> - rebase and test on 5.13
> - don't depend on https://patchwork.kernel.org/project/linux-mediatek/lis=
t/?series=3D464873
>
> Changes in v3:
> - get mdp master from aliases instead of strcmp against of_node->name
>
> Changes in v2:
> - rebased onto Linux 5.12
> - 100 char line length allowance was utilized in a few places
> - Removal of a redundant dev_err() print at the end of
>   mtk_mdp_comp_init()
> - Instead of printing errors and ignoring them, I've added a patch to
>   correctly propagate them.
> - Use of C style comments.
> - Three additional patches were added to eliminate dependency on the
>   mediatek,vpu property inside the mdp_rdma0 device node.
>
> Eizan Miyamoto (9):
>   mtk-mdp: propagate errors from clock_on
>   mtk-mdp: add driver to probe mdp components
>   mtk-mdp: use pm_runtime in MDP component driver
>   media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
>   mtk-mdp: make mdp driver to be loadable by platform_device_register*()
>   soc: mediatek: mmsys: instantiate mdp virtual device from mmsys
>   media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
>   dts: mtk-mdp: remove mediatek,vpu property from primary MDP device
>   dt-bindings: mediatek: remove vpu requirement from mtk-mdp
>
>  .../bindings/media/mediatek-mdp.txt           |   3 -
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 268 +++++++++++++++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  34 +--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 282 ++++++++++++------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
>  drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
>  8 files changed, 470 insertions(+), 145 deletions(-)
>
> --
> 2.32.0.554.ge1b32706d8-goog
>
