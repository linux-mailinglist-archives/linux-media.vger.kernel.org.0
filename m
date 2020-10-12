Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDD328AF0B
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 09:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgJLH3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 03:29:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:53546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727169AbgJLH3B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 03:29:01 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0910A20790;
        Mon, 12 Oct 2020 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602487740;
        bh=CqucX5umZXAk2mfaaFWtuiDQTu1ZigAWjGzPOnNTZP8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0fCqrqfoaJJ7EGP/SUkouauvz/ASQKA8LLJ3U6lTjsQTBuBS4CTOm9f8pXhHI5hXj
         uIoK3DRNJ+QoOVhe3tpJMyI4MkJPFOYaxSO5gUZwcqXR+ijNviFgH1emmpG+0Y6+8Z
         ZLAq4Qr+KSb2zUBqgXPYpYb27z+fNJGSedmvitAg=
Date:   Mon, 12 Oct 2020 09:28:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>
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
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Message-ID: <20201012092854.3c43b9bd@coco.lan>
In-Reply-To: <CAPBb6MXjEZB1N0vgTMGk28_qPpAqX87XFfkwor-9Yge0_uejsg@mail.gmail.com>
References: <20201004122234.802044-1-acourbot@chromium.org>
        <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
        <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
        <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
        <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
        <CAPBb6MWf7bWkigMPUwx7g6dXjwMkttGhHwC9X_=e6=cz1K5J0w@mail.gmail.com>
        <20201009083350.6c2e5a6a@coco.lan>
        <CAPBb6MXjEZB1N0vgTMGk28_qPpAqX87XFfkwor-9Yge0_uejsg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 12 Oct 2020 13:58:51 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

> Hi Mauro,
> 
> On Fri, Oct 9, 2020 at 3:34 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Fri, 9 Oct 2020 13:30:06 +0900
> > Alexandre Courbot <acourbot@chromium.org> escreveu:
> >  
> > > On Fri, Oct 9, 2020 at 1:13 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:  
> >  
> > > > >>> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> > > > >>> to y, and then it won't be able to find the scp_ functions.
> > > > >>>
> > > > >>> To be honest, I'm not sure how to solve this.  
> > > > >>
> > > > >> Found it. Add this:
> > > > >>
> > > > >>         depends on MTK_SCP || !MTK_SCP
> > > > >>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> > > > >>
> > > > >> Ugly as hell, but it appears to be the correct incantation for this.  
> >
> > While the above does the job, I'm wondering if the better wouldn't
> > be to have this spit into 3 config dependencies. E. g. something like:
> >
> > config VIDEO_MEDIATEK_CODEC
> >         depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
> >
> > config VIDEO_MEDIATEK_VPU
> >         depends on VIDEO_DEV && VIDEO_V4L2
> >         depends on ARCH_MEDIATEK || COMPILE_TEST
> >         tristate "support for Mediatek Video Processor Unit without SCP"
> >         help
> >             ...
> >
> > config VIDEO_MEDIATEK_VPU_SCP
> >         depends on VIDEO_DEV && VIDEO_V4L2
> >         depends on ARCH_MEDIATEK || COMPILE_TEST
> >         tristate "support for Mediatek Video Processor Unit with SCP"
> >         help
> >             ...  
> 
> Doing so would introduce two extra choices to enable the driver, so
> I'm a bit concerned this may be a bit confusing?

The Kconfig name for "SCP" is already confusing:

	config MTK_SCP
		tristate "Mediatek SCP support"

Only looking at the helper messages one would understand what SCP
actually means ;-)

	help
	  Say y here to support Mediatek's System Companion Processor (SCP) via
	  the remote processor framework.

IMO, the way to make it less confusing would be to change the Kconfig
message (probably both here and at remoteproc) to make it easier for
people to understand.

For example, I would use something similar to this for MTK_SCP prompt:

	tristate "Use remoteproc with Mediatek companion processor (SCP)"

There would be other ways of producing the same result using multiple
config entries and just one that would be prompted, but, IMHO, with
multiple entries, it t is clearer for the user to understand what
what kind of support was selected. 

This also allows one to look at the produced .config in order to 
check if SCP was enabled for Mediatek VPU or not.

> Also I have experimented with this, and it appears that
> VIDEO_MEDIATEK_CODEC won't be automatically enabled if one of the new
> options is selected. So this means that after setting e.g.
> VIDEO_MEDIATEK_VPU_SCP, one still needs to manually enable
> VIDEO_MEDIATEK_CODEC otherwise the driver won't be compiled at all.

Actually, the codec config option would need a default line too,
e. g. either:

	config VIDEO_MEDIATEK_CODEC
	         depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
		 default y

or:

	config VIDEO_MEDIATEK_CODEC
	         depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
		 default VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU

Both should produce exactly the same result. I usually prefer the
first, as it is easier to read.

> 
> >
> > And split the board-specific data for each variant on separate files,
> > doing something like this at the Makefile:
> >
> >         obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
> >                                        mtk-vcodec-enc.o \
> >                                        mtk-vcodec-common.o
> >
> >         ifneq ($(VIDEO_MEDIATEK_VPU_SCP),)
> >         obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-fw-scp.o
> >         endif
> >
> >         ifneq ($(VIDEO_MEDIATEK_VPU),)
> >         obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-fw-vpu.o
> >         endif
> >
> > This will avoid the ugly ifdefs in the middle of mtk_vcodec_fw.c,
> > and the ugly "depends on FOO || !FOO" usage.
> >
> > It should also be simpler to add future variants of it in the
> > future, if needed.  
> 
> Indeed, the split makes sense regardless of the selection mechanism
> adopted. I will try to do it in the next revision.

Agreed.

Thanks,
Mauro
