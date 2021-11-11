Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E152E44D093
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 05:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbhKKEDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 23:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhKKEDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 23:03:36 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A475EC061767
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 20:00:47 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 1so9411257ljv.2
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 20:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yH8ja7VP8p1VDclBmMvhEHUQneOCn8LZqdo+2OSyMiI=;
        b=eIzx/Cbomp+USxMUIAGgS7bftEgwznfBZbwgi6p4YI3FRo9gi/vdaBoUWKoHxfuyPB
         mw/y2pXpzxA6+5/d3+P7aH4bDsvbQSASCDLhGn5I2TrT5CpqK6ecRSNkPQN28wcFGADP
         9k8FnQxcE8jpHpctExcK3AVkY4qB7d6gviJy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yH8ja7VP8p1VDclBmMvhEHUQneOCn8LZqdo+2OSyMiI=;
        b=1oZOpf/Y5hr8R5eUK2zIImX55eHNmPmIUAxZyu7hG8u/Pfg7epsMNMXVuLuegQs0qd
         4rtxsMGTbiGwplcQrY4b01mYZ41OtVgeQXexQsk3rNfStrmT0xWOAPD8oale+nP5XjP+
         1aTkrDBqwxYTIGBq6vFFZrVugAMBDkE7rUW8w83P+fT+OdpjX/XL+JjTNFajZ8DHtQGs
         BBdTVswK4LFNUPzi8RWH3wb5q6t+bej/Iuqc2X0mi7WFrTaxfoNl2PquWM2DaFrSA7fs
         X6UgW8dCZTnQ7+dLe3Rxa7tE577WOfRjBQbFXqw7kKiuy+0kGfcoFbjsoKUOJKArnMli
         hrgA==
X-Gm-Message-State: AOAM533TtRJFgPACqR6Ndq/h/C0erDvG3g7MIcixb3yIqDIrlZKXTxUR
        PrzncREowryqvitvSe+C0eSKarUYLJ02S5ZT4QdQAg==
X-Google-Smtp-Source: ABdhPJxlV4gGg9kn82P4bK9eQigBUtH7JDNyQemvY5ujecR55RWBtQDaP9XzaDlfxT0NgRx3QJkfO5CE0wqzHMnZrAc=
X-Received: by 2002:a2e:9ed3:: with SMTP id h19mr4294059ljk.392.1636603245859;
 Wed, 10 Nov 2021 20:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-7-yunfei.dong@mediatek.com> <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
 <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
In-Reply-To: <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 11 Nov 2021 12:00:34 +0800
Message-ID: <CAGXv+5GYLSxrmqMEpDx0aE1N1Wp7vHdDFDp9Ly0c=2f+njVpGQ@mail.gmail.com>
Subject: Re: [PATCH v9, 06/19] media: mtk-vcodec: Manage multi hardware information
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 11:49 AM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Tzung-Bi,
>
> Thanks for your suggestion.
> On Wed, 2021-11-10 at 18:30 +0800, Tzung-Bi Shih wrote:
> > On Tue, Nov 09, 2021 at 08:50:17PM +0800, Yunfei Dong wrote:
> > > Manage each hardware information which includes irq/power/clk.
> > > The hardware includes LAT0, LAT1 and CORE.
> >
> > The commit message doesn't explain the code.  Could you provide some
> > explanations about how the async mechanism works?  (e.g. A bitmap for
> > all sub-devices' readiness ...)
> >
> add more detail description for commit message.
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > Apparently wrong tag.
> >
> Remove
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > index b7a51e96d4ba..eb2af42aa102 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > @@ -18,19 +18,49 @@
> > >
> > >  #include "mtk_vcodec_drv.h"
> > >  #include "mtk_vcodec_dec.h"
> > > +#include "mtk_vcodec_dec_hw.h"
> > >  #include "mtk_vcodec_dec_pm.h"
> > >  #include "mtk_vcodec_intr.h"
> > > -#include "mtk_vcodec_util.h"
> >
> > Why does mtk_vcodec_util.h need to remove?
> >
> Put #include "mtk_vcodec_util.h" in mtk_vcodec_dec_hw.h.

If this file directly uses anything from that header file, it should
include it directly, instead of depending on some transitive inclusion.

This would avoid having to deal with breakage if/when the includes from
header files change beneath you.


ChenYu
