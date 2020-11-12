Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABA72AFF5B
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbgKLFcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgKLE04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 23:26:56 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273C4C0613D4
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 20:26:54 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id cw8so5782544ejb.8
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 20:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrJGFWR5LfPadBQJXtxR3X13DiYJSukzmCqstyB653Y=;
        b=HWhp+x5nR3T+EuumQWwhx5XTPD7QV5SlMbprd7oGYb7NT1tsUS8M5b4CCExQirLXf1
         n6xB1vMrsTHoCd3FbJvdOGzMuDQtsl1hs78cs62DjPqqlEQe7GQ0p/ZW5fyjKOmsxAtD
         iRHM55F9z6oGEmav+yyjAu5YCy5KSCZCidFCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrJGFWR5LfPadBQJXtxR3X13DiYJSukzmCqstyB653Y=;
        b=ZVITjXK+tEKaBqxqfG3LrYXKbRbWF8z/xZ52sRF8kazUhlUaEIOz+Jr6cy0TQH8767
         DW5aMjx/wx/chn6iB2DdcSqXwg3DSgpG0Dpdk2s5m2Idvc7qddWU9G2Yakx1UANANhIe
         ELqdhHAx7AUHTKmhyDRDmFDko5hJZ2k7WjKq6C9lDWLKnM3tG4xpK3LW8GVsQwCTjl/E
         XF/9wPptEwkXkJBNZ97Mm+X/ywHJnMLsReLFlSApMlpJvTvVZft60mOBp0swY3VbqURb
         5tK6eSjpd0hjOyRWU5HIrzTOX4qLIGW5lig38ax73Ie+EO1Hjnt3hRHuDXGyAqm7hpqM
         amgg==
X-Gm-Message-State: AOAM531h+1kZ/9ZV16fHpbDghTcUgNefkBBHRCRC5RqQLVP2u3w9I8ab
        o4F/r6ixEzlcLhcbzWb4jTSRex2/Upq2UA==
X-Google-Smtp-Source: ABdhPJxP09dUCisd/eXmV3fgAUbwtqyXQWOI1wJphbNSjYMlvkBt04+Q5n37oMChDHKHDhYBCmQTfA==
X-Received: by 2002:a17:906:2490:: with SMTP id e16mr27818722ejb.17.1605155212626;
        Wed, 11 Nov 2020 20:26:52 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id og19sm1565865ejb.7.2020.11.11.20.26.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 20:26:51 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id l1so4559455wrb.9
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 20:26:50 -0800 (PST)
X-Received: by 2002:adf:e54f:: with SMTP id z15mr32685970wrm.159.1605155209811;
 Wed, 11 Nov 2020 20:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07> <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org> <1593526253.29676.28.camel@mtksdccf07>
 <20200630171912.GE1212092@chromium.org> <1605095509.28992.7.camel@mtksdccf07>
In-Reply-To: <1605095509.28992.7.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 12 Nov 2020 13:26:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
Message-ID: <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
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

On Wed, Nov 11, 2020 at 8:51 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2020-07-01 at 01:19 +0800, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> > > Hi Tomasz,
> > >
> > > On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > > > Hi Jerry,
> > > > >
> > > > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Laurent, Tomasz, Matthias,
> > > > > >
> > > > > > gentle ping for this patch set,
> > > > > > If no new comments, I would like to send a newer version.
> > > > > >
> > > > >
> > > > > Sorry, I still haven't had a chance to look at the series, so feel
> > > > > free to send a new version and I will take a look at the new one.
> > > > >
> > > >
> > > > Finally found some time to review the series. Again sorry for the delay
> > > > and thanks for your patience.
> > > >
> > > > Some general comments:
> > > > 1) The metadata format FourCC should be added in a separate patch,
> > > > together with documentation for it.
> > > > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > > > a header under include/uapi/linux.
> > > >
> > > > Please also check my replies to particular patches for further comments.
> > > >
> > > > Best regards,
> > > > Tomasz
> > >
> > > Appreciate for your reply,
> > >
> > > So far, I've locally created an uapi header:
> > > include/uapi/linux/mtk_fd_40.h
> > > which provides some values, control ids, and the definitions of
> > > structures that would be needed by user of mtk_fd_40 driver.
> > > In addition, I also provide a MACRO as example in comments that can
> > > extract the struct member with bit length and offset
> > > definitions(eliminate the bit-fields).
> > >
> > > Also, I would like to rename struct fd_user_output with struct
> > > mtk_fd_hw_result. I worry fd_user_output would be a confusing name.
> >
> > The change sounds good to me.
> >
> > > I will add them in a separate patch in next version.
> > >
> >
> > Okay.
> >
> > > I am still working on the documentation, which might be
> > > Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> > > Refering the other pixfmt-*.rst files, I will try to provide the
> > > flat-table of the metadata with the structure of the mtk_fd_hw_result.
> > >
> >
> > Sounds good to me.
> >
> > > I am confusing that should I remain the name with -40 in the tail of rst
> > > file?
> >
> > The header and documentation file names should match the driver name.  I
> > just noticed there is some inconsistency in the naming, though. The
> > driver seems to be located under drivers/media/platform/mtk-isp/fd, but
> > the driver name in the platform driver struct and as reported by
> > VIDIOC_QUERYCAP seems to be "mtk-fd-4.0".
>
> > Since we have many mtk-* drivers in the tree currently, I think it might
> > make sense to consolidate them under drivers/media/platform/mediatek,
> > similarly to drivers/media/platform/qcom or /rockchip. But it could be
> > done later, as a follow-up.
> >
> > My suggestion would be to place the driver under
> > drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
> > symbol to include the _40 suffix.
> >
> > What do you think?
> >
>
> I Appreciate your comments,
> Sorry for the late reply.
>
> Would it be possible for me to replace the driver as drivers/media/platform/mtk_fd/mtk-fd-40?(Just like mtk-isp/isp_50)
>

I'm not a big fan of duplicating "mtk fd" in the path. How about just
making it drivers/media/platform/mtk-fd-40?

Best regards,
Tomasz
