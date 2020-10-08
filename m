Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0384287595
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 16:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbgJHOCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 10:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730346AbgJHOCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 10:02:24 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EBAC0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 07:02:24 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id c25so821650ooe.13
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yenzkprhIaKxWbr2VJ0f4x7nZ8oedYumsvtw0Q63bhc=;
        b=T/F+9ugs9rwmmfHmsaWXgPVU+ZLZGE7aRbGo6abeIkJ2KlStetQV5E3qMEneK1KC5g
         aa/PUFFCgJ+HfO2PctHrEeUPIE9FkviDtYwHjalO75CiSYhhkqK2cHBK0PNraeB2KTT1
         XUwmePtJrsHx9PaegeUiHttSPqq/IlFZBVR1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yenzkprhIaKxWbr2VJ0f4x7nZ8oedYumsvtw0Q63bhc=;
        b=QP0mSD91/rg9MNjWvUfBApylZsXH7pphvqlo3WwWDoLCItf2mn6EnEKzhJH1oDVUbO
         xQs3mYhbjsHtCePwGrKUD+GIT2d8NSNgEE62u6it/1balzquxKGc6WRcQj3tNxkPCKZc
         006NjxxWH3pOoky/Fa7a1VmmAI/g9vXJiyMSeOlZrMeE3yrYKcWWBWvUbNDYBqh4t733
         GrJ6gtHluXEctS6REplwhjaRqchcFG7k9QkABQpbePhcAAxmr8RFZgKMPZX50VTqSipH
         sBl/wtGIZrfr4CtU7g6w9+pAJ7ahS/BgANjefcn9JOnrazP3rUBLpg4+IF5hq15UPYt1
         CNoA==
X-Gm-Message-State: AOAM532bFBWMzptQKePY7cIl03Few/K4Bs8DhG9t0na3He7yfHuHKVhr
        nW5r7mbjwC+dUJOrV3cIGSgEu3qWDRJZbg==
X-Google-Smtp-Source: ABdhPJxd/Y5GNpUCDyOM1Hp5EF/5oJv3kGH6olfi/h1DxkAe/UUz7aetwB60frIP162xy/OJ253KJw==
X-Received: by 2002:a4a:4c92:: with SMTP id a140mr5579737oob.32.1602165743217;
        Thu, 08 Oct 2020 07:02:23 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id g11sm4093961otl.12.2020.10.08.07.02.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 07:02:22 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id c4so1482353oou.6
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 07:02:21 -0700 (PDT)
X-Received: by 2002:a4a:da53:: with SMTP id f19mr5590822oou.38.1602165741077;
 Thu, 08 Oct 2020 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl> <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
In-Reply-To: <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 8 Oct 2020 23:02:08 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
Message-ID: <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, thanks for taking the time to look at this!

On Thu, Oct 8, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 08/10/2020 15:07, Hans Verkuil wrote:
> > Hi Alexandre,
> >
> > On 04/10/2020 14:22, Alexandre Courbot wrote:
> >> The addition of MT8183 support added a dependency on the SCP remoteproc
> >> module. However the initial patch used the "select" Kconfig directive,
> >> which may result in the SCP module to not be compiled if remoteproc was
> >> disabled. In such a case, mtk-vcodec would try to link against
> >> non-existent SCP symbols. "select" was clearly misused here as explained
> >> in kconfig-language.txt.
> >>
> >> Replace this by a "depends" directive on at least one of the VPU and
> >> SCP modules, to allow the driver to be compiled as long as one of these
> >> is enabled, and adapt the code to support this new scenario.
> >>
> >> Also adapt the Kconfig text to explain the extra requirements for MT8173
> >> and MT8183.
> >>
> >> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> >> ---
> >>  drivers/media/platform/Kconfig                | 10 +--
> >>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
> >>  2 files changed, 54 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> >> index a3cb104956d5..98eb62e49ec2 100644
> >> --- a/drivers/media/platform/Kconfig
> >> +++ b/drivers/media/platform/Kconfig
> >> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
> >>      depends on MTK_IOMMU || COMPILE_TEST
> >>      depends on VIDEO_DEV && VIDEO_V4L2
> >>      depends on ARCH_MEDIATEK || COMPILE_TEST
> >> +    depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> >
> > Close, but no cigar.
> >
> > If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> > to y, and then it won't be able to find the scp_ functions.
> >
> > To be honest, I'm not sure how to solve this.
>
> Found it. Add this:
>
>         depends on MTK_SCP || !MTK_SCP
>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>
> Ugly as hell, but it appears to be the correct incantation for this.

But doesn't it mean that the driver can be compiled if !MTK_SCP and
!VIDEO_MEDIATEK_VPU? That's the one case we want to avoid.
