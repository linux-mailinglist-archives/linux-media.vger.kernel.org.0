Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820841B3411
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgDVAk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:40:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgDVAk1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:40:27 -0400
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D47A2076B;
        Wed, 22 Apr 2020 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587516026;
        bh=JrE4SFb3uJdJn6w4bpKQFbHrGjxfDltzodlDIbB/g8s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EtgbIUyrKaCGuMhfjQUJP7iDIVSWVQN030NoF/zHtDVjirajFdK7intfO+Efdeqdn
         ZwWKwe+7SuatM6epm7i7rE/Dg3Jp9v5fQY5vaMgbjQx7eX3X9CGN+vqp0bjC1vL034
         tCbc9PDfKupqLgSxRYKWl891P2zFgJWqbvOn30bk=
Received: by mail-ej1-f51.google.com with SMTP id e2so466756eje.13;
        Tue, 21 Apr 2020 17:40:26 -0700 (PDT)
X-Gm-Message-State: AGi0PuZF3wTkGnxmF+lgCnTKgqjUj09Q4E9JUhDm2EX5QaX3TBNVTG6k
        n1+NMeZs7W0QGPFRzziGt5jwtON03JnR1i6+QA==
X-Google-Smtp-Source: APiQypK7cdCKjli8HuUiA28l0aQv0sLbTXWgBnvZw+Qy1aWczSZMJuwiLUBEsh2xe4WaVZor6AsjcT7aHjEYSSesgns=
X-Received: by 2002:a17:906:7717:: with SMTP id q23mr28916ejm.38.1587516024861;
 Tue, 21 Apr 2020 17:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com> <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41> <f3c2926a-ef92-b004-9786-5be1645af497@suse.com>
 <1585234277.12089.3.camel@mtksdaap41> <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
 <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com> <c809233f-6d96-8871-e6a4-b66ed5cc535f@suse.com>
In-Reply-To: <c809233f-6d96-8871-e6a4-b66ed5cc535f@suse.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Wed, 22 Apr 2020 08:40:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Nyu3AckQf==aKuiGZQ6t7xsKhCrwoa0oxq5qySOo_KQ@mail.gmail.com>
Message-ID: <CAAOTY_8Nyu3AckQf==aKuiGZQ6t7xsKhCrwoa0oxq5qySOo_KQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To:     Matthias Brugger <mbrugger@suse.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>,
        sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        matthias.bgg@kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Matthias:

Matthias Brugger <mbrugger@suse.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
>
> On 4/16/20 6:22 PM, Chun-Kuang Hu wrote:
> > Hi, Matthias:
> >
> > Matthias Brugger <mbrugger@suse.com> =E6=96=BC 2020=E5=B9=B43=E6=9C=882=
6=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >>
> >>
> >>
> >> On 26/03/2020 15:51, CK Hu wrote:
> >>> Hi, Matthias:
> >>>
> >>> On Thu, 2020-03-26 at 12:54 +0100, Matthias Brugger wrote:
> >>>> Hi CK,
> >>>>
> >>>> On 26/03/2020 00:05, CK Hu wrote:
> >>>>> Hi, Matthias:
> >>>>>
> >>>>> On Wed, 2020-03-25 at 17:16 +0100, Matthias Brugger wrote:
> >>>>>>
> >>>>>> On 11/03/2020 17:53, Enric Balletbo i Serra wrote:
> >>>>>>> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() func=
tions to
> >>>>>>> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_p=
ath().
> >>>>>>> Those functions will allow DRM driver and others to control the d=
ata
> >>>>>>> path routing.
> >>>>>>>
> >>>>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.c=
om>
> >>>>>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >>>>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >>>>>>> Acked-by: CK Hu <ck.hu@mediatek.com>
> >>>>>>
> >>>>>> This patch does not apply against v5.6-rc1.
> >>>>>> Please rebase as this is a quite big patch and it won't be easy to=
 do that by hand.
> >>>>>
> >>>>> I think this patch depends on [1] which has been acked by me and I =
have
> >>>>> not picked it. The simple way is that you pick [1] first and then p=
ick
> >>>>> this series.
> >>>>>
> >>>>> [1]
> >>>>> https://patchwork.kernel.org/patch/11406227/
> >>>>>
> >>>>
> >>>> You would need to provide a stable tag for me that I can merge into =
my tree. You
> >>>> can also try to merge my for-next [1] which has the newest version f=
rom Enric.
> >>>> If you see any merge conflict, then we have to do something about it=
 :)
> >>>>
> >>>> Regards,
> >>>> Matthias
> >>>>
> >>>> [1]
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.g=
it/log/?h=3Dfor-next
> >>>>
> >>>
> >>> You have applied this series, so I would not apply other patches whic=
h
> >>> would conflict with this series. After this series land on main strea=
m
> >>> (wish it happen in this merge window), I would rebase other patch on
> >>> main stream.
> >>>
> >>
> >> I haven't (yet) send the pull request. If you want to bring in your pa=
tches in
> >> v5.7 as well we can find a solution to that. Shall I provide you with =
a stable
> >> branch which you can merge? This way you can add all your patches in t=
he pull
> >> request as well and we don't have to wait for v5.8 to get things into =
mainline.
> >>
> >> Let me know and I'll provide you with a stable branch.
> >
> > This series is in linux-next but does not in main stream. So would you
> > please provide a stable branch so I could pull this series?
> >
>
> Please find the pull request below:
>
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>
> are available in the Git repository at:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v5.7-next-drm-stable
>
> for you to fetch changes up to 667c769246b01c53ad0925d603d2a2531abd3ef2:
>
>   soc / drm: mediatek: Fix mediatek-drm device probing (2020-04-13
> 13:01:16 +0200)
>
> ----------------------------------------------------------------
> Enric Balletbo i Serra (3):
>       dt-bindings: mediatek: Update mmsys binding to reflect it is a
> system controller
>       soc / drm: mediatek: Move routing control to mmsys device
>       soc / drm: mediatek: Fix mediatek-drm device probing
>
> Matthias Brugger (2):
>       drm/mediatek: Omit warning on probe defers
>       clk / soc: mediatek: Move mt8173 MMSYS to platform driver
>
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt |   7 =
+--
>  drivers/clk/mediatek/Kconfig                                      |   7 =
+++
>  drivers/clk/mediatek/Makefile                                     |   1 =
+
>  drivers/clk/mediatek/clk-mt8173-mm.c                              | 146
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8173.c                                 | 104
> ------------------------------------------
>  drivers/gpu/drm/mediatek/Kconfig                                  |   1 =
+
>  drivers/gpu/drm/mediatek/mtk_disp_color.c                         |   5 =
++-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c                           |   5 =
++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c                          |   5 =
++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                                |  12
> +++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c                           |  19
> ++++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c                            | 259
> +------------------------------------------------------------------------=
--------------------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h                            |   7 =
---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                            |  45
> ++++++++++---------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h                            |   2 =
+-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                                |   8
> +++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                               |   4 =
+-
>  drivers/soc/mediatek/Kconfig                                      |   8
> ++++
>  drivers/soc/mediatek/Makefile                                     |   1 =
+
>  drivers/soc/mediatek/mtk-mmsys.c                                  | 337
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h                            |  20
> +++++++++
>  21 files changed, 592 insertions(+), 411 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h

Pulled into mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
>
>
> > Regards,
> > Chun-Kuang.
> >
> >>
> >> Regards,
> >> Matthias
> >>
> >>> Regards,
> >>> CK
> >>>
> >>>>> Regards,
> >>>>> CK
> >>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>> Matthias
> >>>>>>
> >>>>>>> ---
> >>>>>>>
