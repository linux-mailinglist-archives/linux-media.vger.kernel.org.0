Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98231DD696
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 21:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgEUTGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 15:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgEUTGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 15:06:18 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFAFC061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 12:06:18 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s21so10199806ejd.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UqwEmbeOGGl5axCIs5ejLFLJkH/v9z3WmODPpOgQhPw=;
        b=ctQ6SI0E7ok+GU+8Ex3LjacXwtrRve+ePuCEcSI/JDcGOh6Bp1+Pw/A6KoAtjV59F2
         z+5NwYvl+gbitSQKeu7ZlBFIhO5ZeBNaIg/x6qgzUh/ARMapWSn6guWiuKv17MDKIHa4
         hpfKR6y5Gzk//on7cJenwGp+e9HRXublre33g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UqwEmbeOGGl5axCIs5ejLFLJkH/v9z3WmODPpOgQhPw=;
        b=cFc7pHYfVkae1adb3c9tXQNCn9DszYJBMa9T/ulhDd62J7dGh01O2MXoQiz5LGyl9h
         Zdbul5u1a6xQYWZKvTJAN+x/NMgny6XSzmUjd4usX5Yq8xctagKEcRzs0GKMlc6qFvwT
         XrKT1XhLunoE0PKN31L3pu1SLlsxpKnJC8wtX1tmuoFA/TU3Y5eitQzrw6DuEy2Pd98T
         taw+8zdc1p5/BhZO8QuLJrIXiNqcJm6IzvCBUkzHdaUGqf5sgDn7dbqxlHphPX2d3qaM
         SCwdfBuLV5nUmoKjF/ConmxInP0hkAfpg3dqWqpZ94TWXkk4Wktd9uuXt8gToKokn0GP
         PXYQ==
X-Gm-Message-State: AOAM531x4B2mMTyF93PoXGENXPIYKmWc0kfmwnc8z+Eh6ppDkUBNhPWY
        Qm0thVj5fBwfroA19vqitbz0XrfdW4Hmlg==
X-Google-Smtp-Source: ABdhPJw9ZrI8Ij48YwAQsrJ6w1Nqq7lrMdciArJ+4BrhHDKlhddH7orNmr58jZN3YFAawIFA6ZJ9+g==
X-Received: by 2002:a17:906:5695:: with SMTP id am21mr4792034ejc.223.1590087976473;
        Thu, 21 May 2020 12:06:16 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id cf7sm142985edb.17.2020.05.21.12.06.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 12:06:16 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id be9so7453156edb.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 12:06:16 -0700 (PDT)
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr42592wrx.105.1590087609172;
 Thu, 21 May 2020 12:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com> <20200511160207.GA32476@bogus>
 <1589251221.8804.289.camel@mhfsdcap03>
In-Reply-To: <1589251221.8804.289.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 May 2020 20:59:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
Message-ID: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun, Rob,

On Tue, May 12, 2020 at 4:41 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> On Mon, 2020-05-11 at 11:02 -0500, Rob Herring wrote:
> > On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
[snip]
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    data-lanes = <1>;
> >
> > This doesn't match the schema which says this should be 4 entries.
> >
>
> Property "data-lanes" shows the number of lanes that sensor supports.
> If this property is omitted, four-lane operation is assumed.
> For OV02A10, it is one-lane operation, so the property is supposed to be
> set to <1>.
>

To clarify on this, the ov02a10 sensor supports only 1 lane. It's not
a driver limitation.

Best regards,
Tomasz
