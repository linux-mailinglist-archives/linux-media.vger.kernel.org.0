Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39071192CB3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 16:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgCYPhI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 11:37:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:42216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727598AbgCYPhH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 11:37:07 -0400
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7E3F207FC;
        Wed, 25 Mar 2020 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585150627;
        bh=oFXULYKX2minzKx5vxHtI63XAdjYTOaBbYv6XpZTy8U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EmXJ2ROEV4uIH8BVYnhJow+4A1BNHgFJhRUt9XQCD6kAaBxpBQ9HUZgP/XrSHK5bj
         h411zoPSO8xwuCbPMBajeLkGTqC6LflkOK0k89zrhsMNcNwB79zSWQ8gkX1NCxcuMl
         UqyaakkDQgHMStjvRjvEPxTPWKjs7WOVKBmfOH8Y=
Received: by mail-ed1-f51.google.com with SMTP id de14so2921639edb.4;
        Wed, 25 Mar 2020 08:37:06 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2B6uIAJpvwbNRha58/NuFm5VlXCKDbgu5vvcB5/RS7aFH/4A1p
        DyGGDf1Arg9V3t+2FrsEm2zNB5UlbiHqWXnaZg==
X-Google-Smtp-Source: ADFU+vvSoNJiU20ECt+7uu1vArut7MOjxMslvG/4PUR+3ZtOhd8DgCxmMnQcFYZJdkJa/fK+7IMDcrBp7ZaC6D/3Es4=
X-Received: by 2002:a50:9f07:: with SMTP id b7mr3556024edf.148.1585150625023;
 Wed, 25 Mar 2020 08:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-4-enric.balletbo@collabora.com> <158474603935.125146.14986079780178656133@swboyd.mtv.corp.google.com>
In-Reply-To: <158474603935.125146.14986079780178656133@swboyd.mtv.corp.google.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Wed, 25 Mar 2020 23:36:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8jPkOrdUx7iH=q7kTH2+nPE8igX5-p6ZzwC7aHkQwF+A@mail.gmail.com>
Message-ID: <CAAOTY_8jPkOrdUx7iH=q7kTH2+nPE8igX5-p6ZzwC7aHkQwF+A@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        David Airlie <airlied@linux.ie>, CK Hu <ck.hu@mediatek.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>, mturquette@baylibre.com,
        p.zabel@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
        ulrich.hecht+renesas@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        James Liao <jamesjj.liao@mediatek.com>,
        hat.com@freedesktop.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Fabien Parent <fparent@baylibre.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
        Allison Randal <allison@lohutok.net>,
        mtk01761 <wendell.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
        sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        matthias.bgg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stephen Boyd <sboyd@kernel.org> =E6=96=BC 2020=E5=B9=B43=E6=9C=8821=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=887:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Quoting Enric Balletbo i Serra (2020-03-11 09:53:20)
> > From: Matthias Brugger <mbrugger@suse.com>
> >
> > There is no strong reason for this to use CLK_OF_DECLARE instead of
> > being a platform driver. Plus, MMSYS provides clocks but also a shared
> > register space for the mediatek-drm and the mediatek-mdp
> > driver. So move the MMSYS clocks to a new platform driver and also
> > create a new MMSYS platform driver in drivers/soc/mediatek that
> > instantiates the clock driver.
> >
> > Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>
> Unless you want me to pick this up by itself?

I would like Matthias to pick up this series together.

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
