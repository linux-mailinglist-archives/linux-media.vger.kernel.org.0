Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639E620FA63
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 19:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387957AbgF3RTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 13:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731386AbgF3RTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 13:19:16 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE84C03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 10:19:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r12so20914335wrj.13
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J/fm1XsvHQHkOySPHkGUug98e3SYGWgCY9AAaLKVZAQ=;
        b=bJkUoNua09zlOC1u0e1zfwrzzR3BlFgsZzvLyrPx7iKB9UMjYxOAgi5D+PgXGbaoSV
         PPVkdjX69MpUQkdVBG2LrLCCGbzhbUOGtAQelEgmqgui7MXJijIFXrTsMvj0MsuJxaW4
         oDoLCqNj+tDh5hG6KksbS8zBU6u56iyfdC3jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J/fm1XsvHQHkOySPHkGUug98e3SYGWgCY9AAaLKVZAQ=;
        b=U8aNEWaSHyDF68TZHnitO8xi5oFTo+2qHn23V5Brh3AQGAeKyGa/MM6lGaD6Uo16Qq
         aBtb+ht68oeQk8JXK5Pw8mkRFit7R/6dOSjKtIhrAwllvy2coIKU3tyYO+7ykJXx5YX4
         X2XR0xJIzoHsuM4kyIQg7mv8XK5PxZ88hT9zsZ80OhRbbseU0dylQOJHpI8e2Ls5yshV
         JhOh+LL7J0iqcy8Bgf19x3bSwVHgWIL8FxY6B8fyIYEY8MLYRM4gx3vlEr+FTxkxm8bu
         aZwd3jdX6jlN82nreGOhK/xGsU2AK4OcUjaaYAZkDrtF8jm+eFvFAC6UHwdSmvUMHYlf
         d0mQ==
X-Gm-Message-State: AOAM532+KfVFdqQbUVQMjN+gR1m7ic44vl1VNVvYofkgAEcGmJuBzTZg
        5nA2KpYFw9a5kZER28UOF+MO0g==
X-Google-Smtp-Source: ABdhPJxZGumxEKs37+tBL3WHbXUBqjCD//HM9vnehmqQikLZO8H3zt5/qVFES+cnZvDCkAwI7sObXA==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr22826755wrv.155.1593537554628;
        Tue, 30 Jun 2020 10:19:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id g14sm4158291wrm.93.2020.06.30.10.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:19:13 -0700 (PDT)
Date:   Tue, 30 Jun 2020 17:19:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
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
        Sean Cheng =?utf-8?B?KOmEreaYh+W8mCk=?= 
        <Sean.Cheng@mediatek.com>,
        Sj Huang =?utf-8?B?KOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        Christie Yu =?utf-8?B?KOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?utf-8?B?KOmZs+S/iuWFgyk=?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?utf-8?B?KOael+aYjuS/iik=?= <jungo.lin@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
Message-ID: <20200630171912.GE1212092@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org>
 <1593526253.29676.28.camel@mtksdccf07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593526253.29676.28.camel@mtksdccf07>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jerry,

On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> Hi Tomasz,
> 
> On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > Hi Jerry,
> > 
> > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > Hi Jerry,
> > > 
> > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > >
> > > > Hi Laurent, Tomasz, Matthias,
> > > >
> > > > gentle ping for this patch set,
> > > > If no new comments, I would like to send a newer version.
> > > >
> > > 
> > > Sorry, I still haven't had a chance to look at the series, so feel
> > > free to send a new version and I will take a look at the new one.
> > > 
> > 
> > Finally found some time to review the series. Again sorry for the delay
> > and thanks for your patience.
> > 
> > Some general comments:
> > 1) The metadata format FourCC should be added in a separate patch,
> > together with documentation for it.
> > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > a header under include/uapi/linux.
> > 
> > Please also check my replies to particular patches for further comments.
> > 
> > Best regards,
> > Tomasz
> 
> Appreciate for your reply,
> 
> So far, I've locally created an uapi header:
> include/uapi/linux/mtk_fd_40.h
> which provides some values, control ids, and the definitions of
> structures that would be needed by user of mtk_fd_40 driver.
> In addition, I also provide a MACRO as example in comments that can
> extract the struct member with bit length and offset
> definitions(eliminate the bit-fields).
> 
> Also, I would like to rename struct fd_user_output with struct
> mtk_fd_hw_result. I worry fd_user_output would be a confusing name.

The change sounds good to me.

> I will add them in a separate patch in next version.
> 

Okay.

> I am still working on the documentation, which might be
> Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> Refering the other pixfmt-*.rst files, I will try to provide the
> flat-table of the metadata with the structure of the mtk_fd_hw_result.
> 

Sounds good to me.

> I am confusing that should I remain the name with -40 in the tail of rst
> file?

The header and documentation file names should match the driver name.  I
just noticed there is some inconsistency in the naming, though. The
driver seems to be located under drivers/media/platform/mtk-isp/fd, but
the driver name in the platform driver struct and as reported by
VIDIOC_QUERYCAP seems to be "mtk-fd-4.0". 

Since we have many mtk-* drivers in the tree currently, I think it might
make sense to consolidate them under drivers/media/platform/mediatek,
similarly to drivers/media/platform/qcom or /rockchip. But it could be
done later, as a follow-up.

My suggestion would be to place the driver under
drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
symbol to include the _40 suffix.

What do you think?

> Since I think the layout of metadata might be different in the future
> mtk fd drivers. Maybe they create a new one or should they update the
> rst file when they are upstreaming?
> 

I think we'll decide what to do when that happens. Depending on whether
there is more face detection hardware available, we might be able to
migrate to standard controls and metadata buffer formats at that time.

> Other comments are almost fixed, I will inform you by this mail thread
> as soon as I finish the documentation of fd metadata format.

Okay, thanks.

Best regards,
Tomasz
