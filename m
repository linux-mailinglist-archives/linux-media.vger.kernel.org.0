Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27162EBA03
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 07:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAFGb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 01:31:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbhAFGbz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 01:31:55 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AFFC06134C
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 22:31:15 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id q22so3735250eja.2
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 22:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mptNvhPterwZlvJV3HW2du5Mit0CvbqweKKKV8wxyoE=;
        b=LqGHKEL5dxWpfoeoiDz7CLCNL6rSPL7GdW7c/o8VbDMH0KLXJ4e8ppsFdMO28aQ95U
         A9KLWNhhz4ODK2egCn2AQL6bdmOR9PrjUxjMl/sGbd5h7lpB2WvvRl+kxCtsMpkWwXIH
         XfW5BZvM6soQ4QcEJ2Aqk7Ddu5J19hq79izgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mptNvhPterwZlvJV3HW2du5Mit0CvbqweKKKV8wxyoE=;
        b=hnsveVKkP/WtdK1UsI4S+/Nj7cGyFWiyY9WM+5CdVoa28NJqIfuk+KBCtugm+CEJ8J
         gqu8cV0uYAFXDefSowxCf93vh0ZMzmLiaKy2aGwHZ3zpM1qBE9PJorDxKOHUCRxo+N2m
         qjf9HIrLHKMwTgARbY+W88hwBWtbVQp6hMc06LyQBOg0JBqgjSxGJU/X3kdkuq0xwFDa
         H5ftPgW/6JagKXWjpAxLQQiTt2NDkjPiGJfkKeaiFJFZkjHXMTOWrzCmECKyQEjY/WfR
         CByVs4xeXJz6U7h6BMxREd+PK6dLhxg+jacPRs6mxBuBMztgSi4mJggft4D4MUPtq4IF
         tfpg==
X-Gm-Message-State: AOAM530W9qvK8Qrc8sy4qSTj202z5o5jsAJWgHykS+MYJrVcrQFUbQtV
        iB6REeB2r7LCPck7Hf403QSEEZKXrpbq2w==
X-Google-Smtp-Source: ABdhPJwGYbVDbXjFQk2WK5Q1zASfC7hL7cB8YS1fakbNTA6ohKJD0nWazZthbzLIVicWtstATl2DGA==
X-Received: by 2002:a17:906:c310:: with SMTP id s16mr1942237ejz.186.1609914673237;
        Tue, 05 Jan 2021 22:31:13 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id cc8sm908061edb.17.2021.01.05.22.31.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 22:31:11 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id r7so1403299wrc.5
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 22:31:11 -0800 (PST)
X-Received: by 2002:a5d:6209:: with SMTP id y9mr2713348wru.197.1609914670850;
 Tue, 05 Jan 2021 22:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07> <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org> <1593526253.29676.28.camel@mtksdccf07>
 <20200630171912.GE1212092@chromium.org> <1605095509.28992.7.camel@mtksdccf07>
 <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
 <1605182733.28992.12.camel@mtksdccf07> <1609174942.3068.9.camel@mtksdccf07>
In-Reply-To: <1609174942.3068.9.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 6 Jan 2021 15:30:58 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ApnMhMNLOzwi-EUTm=Kfswfhy6vyQ17rLui1RhFR1vSA@mail.gmail.com>
Message-ID: <CAAFQd5ApnMhMNLOzwi-EUTm=Kfswfhy6vyQ17rLui1RhFR1vSA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        HansVerkuil <hverkuil@xs4all.nl>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "pihsun@chromium.org" <pihsun@chromium.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 29, 2020 at 2:02 AM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Thu, 2020-11-12 at 20:05 +0800, Jerry-ch Chen wrote:
> > Hi Tomasz,
> >
> > On Thu, 2020-11-12 at 13:26 +0900, Tomasz Figa wrote:
> > > On Wed, Nov 11, 2020 at 8:51 PM Jerry-ch Chen
> > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > On Wed, 2020-07-01 at 01:19 +0800, Tomasz Figa wrote:
> > > > > Hi Jerry,
> > > > >
> > > > > On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> > > > > > Hi Tomasz,
> > > > > >
> > > > > > On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > > > > > > Hi Jerry,
> > > > > > >
> > > > > > > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > > > > > > Hi Jerry,
> > > > > > > >
> > > > > > > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Laurent, Tomasz, Matthias,
> > > > > > > > >
> > > > > > > > > gentle ping for this patch set,
> > > > > > > > > If no new comments, I would like to send a newer version.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Sorry, I still haven't had a chance to look at the series, so feel
> > > > > > > > free to send a new version and I will take a look at the new one.
> > > > > > > >
> > > > > > >
> > > > > > > Finally found some time to review the series. Again sorry for the delay
> > > > > > > and thanks for your patience.
> > > > > > >
> > > > > > > Some general comments:
> > > > > > > 1) The metadata format FourCC should be added in a separate patch,
> > > > > > > together with documentation for it.
> > > > > > > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > > > > > > a header under include/uapi/linux.
> > > > > > >
> > > > > > > Please also check my replies to particular patches for further comments.
> > > > > > >
> > > > > > > Best regards,
> > > > > > > Tomasz
> > > > > >
> > > > > > Appreciate for your reply,
> > > > > >
> > > > > > So far, I've locally created an uapi header:
> > > > > > include/uapi/linux/mtk_fd_40.h
> > > > > > which provides some values, control ids, and the definitions of
> > > > > > structures that would be needed by user of mtk_fd_40 driver.
> > > > > > In addition, I also provide a MACRO as example in comments that can
> > > > > > extract the struct member with bit length and offset
> > > > > > definitions(eliminate the bit-fields).
> > > > > >
> > > > > > Also, I would like to rename struct fd_user_output with struct
> > > > > > mtk_fd_hw_result. I worry fd_user_output would be a confusing name.
> > > > >
> > > > > The change sounds good to me.
> > > > >
> > > > > > I will add them in a separate patch in next version.
> > > > > >
> > > > >
> > > > > Okay.
> > > > >
> > > > > > I am still working on the documentation, which might be
> > > > > > Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> > > > > > Refering the other pixfmt-*.rst files, I will try to provide the
> > > > > > flat-table of the metadata with the structure of the mtk_fd_hw_result.
> > > > > >
> > > > >
> > > > > Sounds good to me.
> > > > >
> > > > > > I am confusing that should I remain the name with -40 in the tail of rst
> > > > > > file?
> > > > >
> > > > > The header and documentation file names should match the driver name.  I
> > > > > just noticed there is some inconsistency in the naming, though. The
> > > > > driver seems to be located under drivers/media/platform/mtk-isp/fd, but
> > > > > the driver name in the platform driver struct and as reported by
> > > > > VIDIOC_QUERYCAP seems to be "mtk-fd-4.0".
> > > >
> > > > > Since we have many mtk-* drivers in the tree currently, I think it might
> > > > > make sense to consolidate them under drivers/media/platform/mediatek,
> > > > > similarly to drivers/media/platform/qcom or /rockchip. But it could be
> > > > > done later, as a follow-up.
> > > > >
> > > > > My suggestion would be to place the driver under
> > > > > drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
> > > > > symbol to include the _40 suffix.
> > > > >
> > > > > What do you think?
> > > > >
> > > >
> > > > I Appreciate your comments,
> > > > Sorry for the late reply.
> > > >
> > > > Would it be possible for me to replace the driver as drivers/media/platform/mtk_fd/mtk-fd-40?(Just like mtk-isp/isp_50)
> > > >
> > >
> > > I'm not a big fan of duplicating "mtk fd" in the path. How about just
> > > making it drivers/media/platform/mtk-fd-40?
> > >
> >
> > Ok, I will make it drivers/media/platform/mtk-fd-40,
> > and also rename the related Kconfig symbol to include the _40 suffix.
> >
> > Thanks and Best Regards,
> > Jerry.
> >
> > > Best regards,
> > > Tomasz
> >
>
>
> I've finish the document of FD driver, describing the structure of the
> mtk_fd_hw_result. Could I send the new version of the driver? would the
> folder path replacement must be included in the new version?

Thanks Jerry and Happy New Year.

Since the driver should be in a good shape after addressing the last
comments, perhaps it would make sense to update the path as well, so
that it can be merged if no other issues are found?

Best regards,
Tomasz
