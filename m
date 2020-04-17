Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F21AD6BA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgDQHB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgDQHB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:01:26 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473FBC061A0C;
        Fri, 17 Apr 2020 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=HVLDZVgokzWLzBs8K61qPV5biQljs7Uy59BS0iqfE0Q=; b=YO7SX7phIzs9cV/Zpf/QAQy6HD
        fB/L442Hz6q/J8L44pykzCYyA7ekbxWv6YGEzwv1vvxmAkWOpRUV5cnR74lIH//lNIR3dfwppS5T8
        K69yNUkJC0S+pBqWd9pCx7p6+0IhyOVd0XMlnsHBOEoGc+4TKcstgQdqNGYN5pfawgc6VHWvq8umF
        W1q7GrbvLSCBbX+SKWQ83NXeIJi1Ay1KmB6dA2+rnXTZjAEAxwbqAbwiBMXPd6qgpf9YyI/gIMlvG
        wUEdnR9xsMm5TK6+mI20dAXjIdSz/GJmP+UstscLOfjgTO1hnC4AdcjFht8wwDfTa+NQKQ6RWS2m4
        zM0ApeQQ==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jPL05-000664-4K; Fri, 17 Apr 2020 07:01:21 +0000
Date:   Fri, 17 Apr 2020 09:01:15 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20200417090115.3cccc9bd@coco.lan>
In-Reply-To: <7faaec92dc9b5870b33c6dbb440de0698b5a70e7.camel@collabora.com>
References: <20200417102226.11d54815@canb.auug.org.au>
        <7faaec92dc9b5870b33c6dbb440de0698b5a70e7.camel@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 17 Apr 2020 02:13:47 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Hi Stephen,
> 
> On Fri, 2020-04-17 at 10:22 +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the v4l-dvb tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> > 
> > WARNING: unmet direct dependencies detected for MEDIA_CONTROLLER_REQUEST_API
> >   Depends on [n]: MEDIA_SUPPORT [=m] && MEDIA_CONTROLLER [=y] && STAGING_MEDIA [=n]
> >   Selected by [m]:
> >   - VIDEO_VIVID [=m] && MEDIA_SUPPORT [=m] && MEDIA_TEST_SUPPORT [=y] && V4L_TEST_DRIVERS [=y] && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && !SPARC32 &&
> > !SPARC64 && FB [=y] && HAS_DMA [=y]
> >   
> 
> Ugh, my bad. MEDIA_CONTROLLER_REQUEST_API can't
> depend on staging, after this recently merged commit:
> 
> "media: Kconfig: Don't expose the Request API option"
> 
> So, we should fix that with:
> 
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 7c9628f37196..4815b9dde9af 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -14,7 +14,7 @@ config MEDIA_CONTROLLER_DVB
>  
>  config MEDIA_CONTROLLER_REQUEST_API
>         bool
> -       depends on MEDIA_CONTROLLER && STAGING_MEDIA
> +       depends on MEDIA_CONTROLLER
>         help
>           DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
>  
> Mauro what do you think?

Dropped the dependency and applied on media.

I also addressed the "select PCI" issue, with causes troubles on
s390 random configs (due to HAS_PCI=n on s390).

Thanks,
Mauro
