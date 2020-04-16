Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0F61ACD92
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 18:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406087AbgDPQXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 12:23:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729633AbgDPQXG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 12:23:06 -0400
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A03322250;
        Thu, 16 Apr 2020 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587054185;
        bh=dYe0L8knPjq4V+e3C0CynMr68uvk2h/61C1ujyYiF70=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m92+j7PyJJqSdIZDHDYxGpMk1MSTdEN3OfxmyZ5uDz3gYONFBBkjqZfnO2V19s6L3
         uWSFke5h6gqhJSuJUX/v4SaHaHZp1FcOjeDRIRraalXi9n50/SXBviV2xU4LGfnrd5
         Ek5R1e51qljTWjy8yVonj+VDn0jnnD+E/Zrj+BWE=
Received: by mail-ej1-f41.google.com with SMTP id s9so1713435eju.1;
        Thu, 16 Apr 2020 09:23:05 -0700 (PDT)
X-Gm-Message-State: AGi0Pub+htmOBUicEH+5GKsykiMe17NI6O3zbKw5fJhuoYhKKWaSnVMl
        iiyvH0OSeZ6gsKPZPhfJWdV5hJ+GlP/+Qprujw==
X-Google-Smtp-Source: APiQypJY17+s5/o0+wlz0famZC0WrI5UI7Klts8JPoOZRnB9zgY8QO2uzy/FBMWzeg9CvxriYGO6Q1j1IF4pKi5aPZw=
X-Received: by 2002:a17:906:2ad4:: with SMTP id m20mr10975923eje.324.1587054183934;
 Thu, 16 Apr 2020 09:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com> <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41> <f3c2926a-ef92-b004-9786-5be1645af497@suse.com>
 <1585234277.12089.3.camel@mtksdaap41> <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
In-Reply-To: <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Fri, 17 Apr 2020 00:22:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Message-ID: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To:     Matthias Brugger <mbrugger@suse.com>
Cc:     CK Hu <ck.hu@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        David Airlie <airlied@linux.ie>,
        Michael Turquette <mturquette@baylibre.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Richard Fontana <rfontana@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ulrich.hecht+renesas@gmail.com,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        wens@csie.org, Allison Randal <allison@lohutok.net>,
        mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Frank Wunderlich <frank-w@public-files.de>,
        Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
        Houlong Wei <houlong.wei@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rdunlap@infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, matthias.bgg@kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Matthias:

Matthias Brugger <mbrugger@suse.com> =E6=96=BC 2020=E5=B9=B43=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:45=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
>
>
> On 26/03/2020 15:51, CK Hu wrote:
> > Hi, Matthias:
> >
> > On Thu, 2020-03-26 at 12:54 +0100, Matthias Brugger wrote:
> >> Hi CK,
> >>
> >> On 26/03/2020 00:05, CK Hu wrote:
> >>> Hi, Matthias:
> >>>
> >>> On Wed, 2020-03-25 at 17:16 +0100, Matthias Brugger wrote:
> >>>>
> >>>> On 11/03/2020 17:53, Enric Balletbo i Serra wrote:
> >>>>> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functi=
ons to
> >>>>> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_pat=
h().
> >>>>> Those functions will allow DRM driver and others to control the dat=
a
> >>>>> path routing.
> >>>>>
> >>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com=
>
> >>>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >>>>> Acked-by: CK Hu <ck.hu@mediatek.com>
> >>>>
> >>>> This patch does not apply against v5.6-rc1.
> >>>> Please rebase as this is a quite big patch and it won't be easy to d=
o that by hand.
> >>>
> >>> I think this patch depends on [1] which has been acked by me and I ha=
ve
> >>> not picked it. The simple way is that you pick [1] first and then pic=
k
> >>> this series.
> >>>
> >>> [1]
> >>> https://patchwork.kernel.org/patch/11406227/
> >>>
> >>
> >> You would need to provide a stable tag for me that I can merge into my=
 tree. You
> >> can also try to merge my for-next [1] which has the newest version fro=
m Enric.
> >> If you see any merge conflict, then we have to do something about it :=
)
> >>
> >> Regards,
> >> Matthias
> >>
> >> [1]
> >> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git=
/log/?h=3Dfor-next
> >>
> >
> > You have applied this series, so I would not apply other patches which
> > would conflict with this series. After this series land on main stream
> > (wish it happen in this merge window), I would rebase other patch on
> > main stream.
> >
>
> I haven't (yet) send the pull request. If you want to bring in your patch=
es in
> v5.7 as well we can find a solution to that. Shall I provide you with a s=
table
> branch which you can merge? This way you can add all your patches in the =
pull
> request as well and we don't have to wait for v5.8 to get things into mai=
nline.
>
> Let me know and I'll provide you with a stable branch.

This series is in linux-next but does not in main stream. So would you
please provide a stable branch so I could pull this series?

Regards,
Chun-Kuang.

>
> Regards,
> Matthias
>
> > Regards,
> > CK
> >
> >>> Regards,
> >>> CK
> >>>
> >>>>
> >>>> Regards,
> >>>> Matthias
> >>>>
> >>>>> ---
> >>>>>
