Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFE43E3E3C
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 05:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbhHIDXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Aug 2021 23:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhHIDXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Aug 2021 23:23:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A3AC06175F
        for <linux-media@vger.kernel.org>; Sun,  8 Aug 2021 20:23:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p38so3479255lfa.0
        for <linux-media@vger.kernel.org>; Sun, 08 Aug 2021 20:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mxoe8ehx2Vi2y4afm7gLthqvb5ao6MbjaelzeHBMKik=;
        b=q/Zl/iRSG6c/YsgaY48vbGEN4c/w8jgzqDkmTLGeAD/ceUoxEHEV0of9v0CfFN4sYp
         /jQhut2BLnjKmy6ddXsA10qPQDJMcrQJY5PKNPChLVZCH29Tm4tiUWCL3CbHW6VDKbwg
         xuzKN73tQPqLuA4lHVClUCcueQyvJgX6YYcEagQ63LxV1LUdQOzEuBUCMGRlSYHpmDGl
         zoCFc844we/Ko56ys3bmodpP5EkXbX2fSFtBKeu9B2ABgwQTCEf6zseqC0SpawMLt3pM
         6fwaiLb700kqRIoywGMqEzWt1X6MxF5u3zxXTHJzIpGVNpbYHrztTQIv9904UDgLAj8E
         8JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mxoe8ehx2Vi2y4afm7gLthqvb5ao6MbjaelzeHBMKik=;
        b=GQ8nz8ZpGw64bLROvHwF8OoTuGotXIKWaGqaF+9bLN4GOewEAEYRsl82z+CmfeRq9D
         2Df5DsZZtKWLsf2aviJtj/4AEy+ECtyzyzv22vEnEIy4pgd3+/btat/1pkvKwnmfbORe
         vRSCjxsWehpkTBofyT/zsuC4P3G30/07ny6M7XD78rHx5rd04bGLrTUVaWE796tBPz34
         8sW/7wMwG4sVbuhyMXYSSUVQpkbzm3h4XlygreDaHQ4XYbLouvekTwjBYondw60+6d6k
         Q3WN7TqXDs6YgOuRp/AhinxZYMONUL1uvdgTkV4NqGH43g82o/1/mqSvR3XthQeG8/mV
         A8og==
X-Gm-Message-State: AOAM530gybnI5mjnIFBU7sAA/tSCjnya+fqXj4Nrd0pTYnshrvdve3RY
        qXG1j5jmpPy+KsZJ9vOG+YJP62aHbDLa4snI2ERyiQ==
X-Google-Smtp-Source: ABdhPJyF5d28CUqPE1qLCZjGKLbJzgTLfTykog6rlo7Obra6pUgcXcZSei8APEftxH0BfOw8s8nvQbvyRxvAdceRU0c=
X-Received: by 2002:a19:da01:: with SMTP id r1mr6694335lfg.437.1628479401416;
 Sun, 08 Aug 2021 20:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
 <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
In-Reply-To: <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
From:   Eizan Miyamoto <eizan@google.com>
Date:   Mon, 9 Aug 2021 13:23:04 +1000
Message-ID: <CAOak1e_xw84Q+ikAn7TEqie00Sbv4Qpaax==jZ5MJVfPP1pf0Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-kernel@vger.kernel.org, wenst@chromium.org,
        houlong.wei@mediatek.com, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        chunkuang.hu@kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna, thank you very much for spending time to review the patch,
your time spent is very much appreciated.

On Thu, Aug 5, 2021 at 4:06 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> > +err_clk_prepare_enable:
> > +     for (--i; i >= 0; i--) {
> > +             if (IS_ERR(comp->clk[i]))
> > +                     continue;
> > +             clk_disable_unprepare(comp->clk[i]);
> >       }
> > +
> > +     return status;
>
> There is an API function clk_bulk_prepare_enable to prepare and enable an array of clks
> so you can just use it.

As per Enric's suggestion earlier in this email thread, are you OK
with me making this change in a follow-up patch, particularly since
the logic as it is was preserved from previous functionality?

> > -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> > +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> >   {
> > -     struct device *dev = &mdp->pdev->dev;
> >       struct mtk_mdp_comp *comp_node;
> > +     int status;
> > +     struct device *dev = &mdp->pdev->dev;
> > +     int err;
> >
> > -     list_for_each_entry(comp_node, &mdp->comp_list, node)
> > -             mtk_mdp_comp_clock_on(dev, comp_node);
> > +     list_for_each_entry(comp_node, &mdp->comp_list, node) {
> > +             err = mtk_mdp_comp_clock_on(dev, comp_node);
> > +             if (err) {
> > +                     status = err;
>
> You can get rid of the new var 'status' and just return ret in case of error

This seems like a nit (please let me know if you disagree), and it's
also cleaned up in a follow-on patch in the series ("don't
pm_run_time_get/put for master comp in clock_on"). Is making the
change you are suggesting here something that should require uploading
a new series version?

Eizan
