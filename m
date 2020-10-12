Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D187728AD6E
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 06:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgJLE7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 00:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgJLE7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 00:59:07 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB06C0613CE
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 21:59:06 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id o184so183632ooo.8
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dvhj8etlXC9fqFjkAY4fQ7hAbMGIocwO3uGycBo0fr0=;
        b=BlxmN0UjWMwXHMdPjJAZej2pYRJgMpzyWP7M5T5nSWhhR8pQ17xeLnzQ/lIKoln0N0
         /QtRs/wvTaZe1hbVkTRtyZReGKiAILQjskLkrERO+NEZZrZr4KWteleYa4lW6IMxBA4X
         ddshUn4FW9UnEboaxtHKRKkDN///JjV9QXFQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dvhj8etlXC9fqFjkAY4fQ7hAbMGIocwO3uGycBo0fr0=;
        b=RFYxkMUyxCrM7Ozb/U8yyl628BDiryVEPedEQiLz05OB5o/RRvRWhZThiZQUlIQmzt
         X82Pebj0uRO67Qxl3pKpIIh2IfiT5o3+wuD3DYYCnR6Aix42hgZ46XQ6sTrAjqZHlZ4W
         MRLpz2LFRAwuM3d6ZyBMZYeEauldxy1dOLsDEtB3xXoBmHMoiyRcPIH/nfqO5fOikbQA
         Uj849jHWmjsZn2RRajHUA1AWqvWU1sw8UMqvnbgE4EpThZXd49npRMdmEDXnKaE5vrME
         EajWZ/rYFV3nF+Er6wrb22r+bWfHlXLs4pCkMUb41OlTIP8zyqh5CcvA6NjWgPtDrHG1
         SLbw==
X-Gm-Message-State: AOAM532JV6IWbHwPVathPpV31Pe5mvB6GtTlp7cwxBXmofy8SnRzQxdo
        F37+GqNJ89DZf/iKtx8wrVbjTS3PWInWbA==
X-Google-Smtp-Source: ABdhPJweQ66rUXQ9V05P6yC5dM+VCZBw1sp0pvlUdVlLtMkX+UER1yt5fwu1j9b7s1PfPcFkgNXDwQ==
X-Received: by 2002:a4a:a844:: with SMTP id p4mr17356671oom.59.1602478744690;
        Sun, 11 Oct 2020 21:59:04 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id b7sm622005oic.36.2020.10.11.21.59.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2020 21:59:03 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id m13so14720988otl.9
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 21:59:03 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr16959312otl.36.1602478742864;
 Sun, 11 Oct 2020 21:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl> <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
 <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
 <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl> <CAPBb6MWf7bWkigMPUwx7g6dXjwMkttGhHwC9X_=e6=cz1K5J0w@mail.gmail.com>
 <20201009083350.6c2e5a6a@coco.lan>
In-Reply-To: <20201009083350.6c2e5a6a@coco.lan>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 12 Oct 2020 13:58:51 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXjEZB1N0vgTMGk28_qPpAqX87XFfkwor-9Yge0_uejsg@mail.gmail.com>
Message-ID: <CAPBb6MXjEZB1N0vgTMGk28_qPpAqX87XFfkwor-9Yge0_uejsg@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support
        <linux-mediatek@lists.infradead.org>, Randy Dunlap" 
        <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, Oct 9, 2020 at 3:34 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 9 Oct 2020 13:30:06 +0900
> Alexandre Courbot <acourbot@chromium.org> escreveu:
>
> > On Fri, Oct 9, 2020 at 1:13 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> > > >>> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> > > >>> to y, and then it won't be able to find the scp_ functions.
> > > >>>
> > > >>> To be honest, I'm not sure how to solve this.
> > > >>
> > > >> Found it. Add this:
> > > >>
> > > >>         depends on MTK_SCP || !MTK_SCP
> > > >>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> > > >>
> > > >> Ugly as hell, but it appears to be the correct incantation for this.
>
> While the above does the job, I'm wondering if the better wouldn't
> be to have this spit into 3 config dependencies. E. g. something like:
>
> config VIDEO_MEDIATEK_CODEC
>         depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
>
> config VIDEO_MEDIATEK_VPU
>         depends on VIDEO_DEV && VIDEO_V4L2
>         depends on ARCH_MEDIATEK || COMPILE_TEST
>         tristate "support for Mediatek Video Processor Unit without SCP"
>         help
>             ...
>
> config VIDEO_MEDIATEK_VPU_SCP
>         depends on VIDEO_DEV && VIDEO_V4L2
>         depends on ARCH_MEDIATEK || COMPILE_TEST
>         tristate "support for Mediatek Video Processor Unit with SCP"
>         help
>             ...

Doing so would introduce two extra choices to enable the driver, so
I'm a bit concerned this may be a bit confusing?

Also I have experimented with this, and it appears that
VIDEO_MEDIATEK_CODEC won't be automatically enabled if one of the new
options is selected. So this means that after setting e.g.
VIDEO_MEDIATEK_VPU_SCP, one still needs to manually enable
VIDEO_MEDIATEK_CODEC otherwise the driver won't be compiled at all.

>
> And split the board-specific data for each variant on separate files,
> doing something like this at the Makefile:
>
>         obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
>                                        mtk-vcodec-enc.o \
>                                        mtk-vcodec-common.o
>
>         ifneq ($(VIDEO_MEDIATEK_VPU_SCP),)
>         obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-fw-scp.o
>         endif
>
>         ifneq ($(VIDEO_MEDIATEK_VPU),)
>         obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-fw-vpu.o
>         endif
>
> This will avoid the ugly ifdefs in the middle of mtk_vcodec_fw.c,
> and the ugly "depends on FOO || !FOO" usage.
>
> It should also be simpler to add future variants of it in the
> future, if needed.

Indeed, the split makes sense regardless of the selection mechanism
adopted. I will try to do it in the next revision.
