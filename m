Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788FA1C634E
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 23:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgEEVpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 17:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729159AbgEEVpx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 17:45:53 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D346C061A0F;
        Tue,  5 May 2020 14:45:53 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id o10so3412445qtr.6;
        Tue, 05 May 2020 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=YNpbBjGMQGno/rDabyBqawqt1qQvH/iqDbutI5P6nj4=;
        b=WvbZEr1W8/FYBVw6Arjjou8Ey1U1yseqYlLBP3FioiU9RfD0Gq05iBaSmRRtWOZ8rU
         bTGo3tXD0frjhBJPwDPVmoJ9hOfqbrVHDs2vwFykQmjXdt/2LriAlvE5ltkDtt9VB4kW
         bWLbKP5YLik0ruz8JWY44WbHXlqeD1eVk4AviEdTLs5340fHW1VNOhpzkttgVjO8mb71
         c4d7T+oY8167UZ4JvcUtnpkqfcOfwbzksmDwxmXwTY1zg/m/X2/C8j/Q761zko4N6Zvh
         yvIT3QqLxrVXjxyyI4hOcPe0i0KnqzEqlx4Hbp+8L5vmlhr5M7h+38eBacpSOWCwQRLG
         nCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=YNpbBjGMQGno/rDabyBqawqt1qQvH/iqDbutI5P6nj4=;
        b=XXjCIeMvDnjVALvSscdJxvQTJcl7jSSUnkUdgRINSwXoQR4wFo9A6ApRxFPY+mZ0B5
         ICINl6tnqrqeJfLEVVP5k10pJ/OVQUclMI3mq1lTyYnsVpXd1l19YMBd6uoxPa/OCvc2
         xecOfE72Ss417nM01PKGPXmw/rroPUF9rXiub6gsTnuqFCKDYvVTKhlSkLoabRwlvFFz
         I3k7GJmOfML0r7XIYqzLanII5cz/4f9SV6FRuIbKNZ9zh3rJnc21mSlHuCdBIxCdBQTN
         9U1uD/1lBp/eXCW8a7Lq9KcjnLc6+iEqlzZgWhvxjm3tQTvCBOx3/2VuMiY711PpaYX3
         8PnA==
X-Gm-Message-State: AGi0PubREzip8R8hUXcGuqKI0fODLBvhTF4Qu4w28RxiKFV+JKVvwu8d
        fg3xl3F7AHq6p4mpikWil/7OC9FCGR87Cbv7uXs=
X-Google-Smtp-Source: APiQypKsjUJF2gul+5ouiC2552dVTBCGixukQdN5ecLOk/2yh+D+Odr/lqdxg8xu7ngwsUbGAtR33z7v62vk5eMX3Hk=
X-Received: by 2002:aed:24ee:: with SMTP id u43mr4964921qtc.178.1588715152435;
 Tue, 05 May 2020 14:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200505040048.132493-1-eizan@google.com> <20200505125042.v1.1.If0cdd88c5399a38cff7163298cc8794f8c40a401@changeid>
In-Reply-To: <20200505125042.v1.1.If0cdd88c5399a38cff7163298cc8794f8c40a401@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 5 May 2020 23:45:41 +0200
Message-ID: <CAFqH_53f_ehyvHDPTYRigjkPFxpVQyKsdghS06fQ+BVqYMjy5w@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
To:     Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Eizan Miyamoto <eizan@google.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch. One trivial comment below ...

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dt., 5 de maig
2020 a les 6:01:
>
> These fields are not used and can be removed.
>
> Signed-off-by: eizan@chromium.org

Malformatted Signed-off-by tag. Drop it.

> Signed-off-by: Eizan Miyamoto <eizan@google.com>

Note that the author/seder should match the Signed-off-by, so you
should use your chromium.org account here. Other than that the patch
looks good to me, so

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>



> ---
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 14991685adb7..facc6104b91f 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -106,7 +106,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>         comp->dev_node = of_node_get(node);
>         comp->id = comp_id;
>         comp->type = mtk_mdp_matches[comp_id].type;
> -       comp->regs = of_iomap(node, 0);
>
>         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 998a4b953025..3b83bd6e0d8b 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -38,7 +38,6 @@ enum mtk_mdp_comp_id {
>   * struct mtk_mdp_comp - the MDP's function component data
>   * @dev_node:  component device node
>   * @clk:       clocks required for component
> - * @regs:      Mapped address of component registers.
>   * @larb_dev:  SMI device required for component
>   * @type:      component type
>   * @id:                component ID
> @@ -46,7 +45,6 @@ enum mtk_mdp_comp_id {
>  struct mtk_mdp_comp {
>         struct device_node      *dev_node;
>         struct clk              *clk[2];
> -       void __iomem            *regs;
>         struct device           *larb_dev;
>         enum mtk_mdp_comp_type  type;
>         enum mtk_mdp_comp_id    id;
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
