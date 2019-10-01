Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC21C4111
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 21:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfJATdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 15:33:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41782 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfJATdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 15:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=M2686iCZDbGByhU1Xj0t3yqq1XUWSbDScCHoAjLveG4=; b=fvPRAisdUrEL4lty1lGDNeOBV
        8v86arxhgN2oOtTWaeRPd7lXD/+JF+f3clCYzY05NQzuUVMiGbYNqLos+zHoV8nbc/xmZAJ7moIRI
        E0uCsuoyeC35brjkFr7fFN8NdfEZPEKAG47sUyXFspPHjKgr8ERTdW0mej6cin2oGlLshJfEECKw7
        19UA5/rTyhiD6Tcxw1GTi9E19WHjdp2+FkhmIW+XRKOiSwOfx+nFlUIhH8svB3apZunYU5hnAnCGq
        pjCn6/M2PBUu89yrG1NLqpCOi0jDJ7vIiq36nZCIpNFTvIy0nH33nYHecN6A/K3X7YkXiJNg6vDRO
        u6984mXrQ==;
Received: from 177.157.127.95.dynamic.adsl.gvt.net.br ([177.157.127.95] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFNtq-0000sM-B6; Tue, 01 Oct 2019 19:33:30 +0000
Date:   Tue, 1 Oct 2019 16:33:26 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [GIT PULL FOR v5.5] am437x-vpfe: overdue maintenance
Message-ID: <20191001163326.37d665bb@coco.lan>
In-Reply-To: <95a1c6a9-636f-66f4-0360-66105f22af57@xs4all.nl>
References: <95a1c6a9-636f-66f4-0360-66105f22af57@xs4all.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 27 Sep 2019 16:27:00 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> Various fixes for am437x-vpfe.
> 
> One special note: the last three patches adds new macros to be able to
> print a V4L2 fourcc in a standard way, both for kernel and userspace,
> and uses them in v4l2-ioctl.c and am437x.
> 
> If you have concerns about this and do not want to merge those patches
> without discussing this some more, then please just drop these last three
> patches.

I looked at the patch with introduced the fourcc. While I like the idea,
IMHO, the implementation should be improved. Instead of adding obscure
subsystem-specific magic strings to be added at printk() lines, it should,
instead, add a new macro to be handled by printk, properly documenting
it at:

	Documentation/core-api/printk-formats.rst

There are other subsystems with macros there, like the network subsystem.
So, I suspect that it shouldn't be hard to add something like "%pCC"
with would properly print the fourcc.

So, I'm dropping the last 3 patches on this series applying the
remaining ones.

Regards,
Mauro

> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:
> 
>   media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5c2
> 
> for you to fetch changes up to 743d13880c0749ca61a40ec4c57ebeb60d06f9c6:
> 
>   media: am437x-vpfe: Remove print_fourcc helper (2019-09-27 16:24:49 +0200)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Benoit Parrot (12):
>       media: am437x-vpfe: Fix missing first line
>       media: am437x-vpfe: Rework ISR routine for clarity
>       media: am437x-vpfe: Wait for end of frame before tear-down
>       media: am437x-vpfe: fix start streaming error path
>       media: am437x-vpfe: Streamlined vb2 buffer cleanup
>       media: am437x-vpfe: Setting STD to current value is not an error
>       media: am437x-vpfe: Use a per instance format array instead of a static one
>       media: am437x-vpfe: fix function trace debug log
>       media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
>       media: am437x-vpfe: Remove per bus width static data
>       media: am437x-vpfe: Switch to SPDX Licensing
>       media: am437x-vpfe: Remove print_fourcc helper
> 
> Dave Gerlach (1):
>       media: am437x-vpfe: Fix suspend path to always handle pinctrl config
> 
> Hans Verkuil (1):
>       v4l2-ioctl.c: use new v4l2_fourcc_conv/args macros
> 
> Sakari Ailus (1):
>       v4l: Add macros for printing V4L fourcc values
> 
>  Documentation/media/videodev2.h.rst.exceptions   |   2 +
>  drivers/media/platform/am437x/am437x-vpfe.c      | 880 +++++++++++++++++++++++++----------------------------------
>  drivers/media/platform/am437x/am437x-vpfe.h      |  43 ++-
>  drivers/media/platform/am437x/am437x-vpfe_regs.h |  10 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c             |  58 ++--
>  include/uapi/linux/videodev2.h                   |  27 ++
>  6 files changed, 453 insertions(+), 567 deletions(-)



Thanks,
Mauro
