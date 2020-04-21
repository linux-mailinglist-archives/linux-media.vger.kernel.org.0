Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054FB1B2009
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 09:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDUHlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 03:41:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:47740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbgDUHlF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 03:41:05 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A4C02073A;
        Tue, 21 Apr 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587454865;
        bh=tEnS9GBsLYWXaQ65syL/1sOeywCqfiO4IxuBM9rNvmY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JwkTd/RuB3UayxsH7qYtY5iYnLQmWOAtBRP9oOTZyW97/JdZOgxyjfLJXLXCSnHvJ
         gWFXyKiXd2iuEBJAgBZQOKesD0FNboUyfQ8aHPac4dXd/26514j4vKo23qCpfB3E6Y
         x9GsLuurowjWB23nyGUgKraTKOMGKZMS38CS40AY=
Date:   Tue, 21 Apr 2020 09:40:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] media: staging: rkisp1 Kconfig: depends on OF
Message-ID: <20200421094059.1ea66ee8@coco.lan>
In-Reply-To: <CAAEAJfD=UtEDb4cgM_kqm7fJuwpDm3rMN+O1GuNY+NcBupzqwA@mail.gmail.com>
References: <56aaef4ea1c26d90952841fa32b2a14bcc27582a.1587401141.git.mchehab+huawei@kernel.org>
        <CAAEAJfD=UtEDb4cgM_kqm7fJuwpDm3rMN+O1GuNY+NcBupzqwA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 21 Apr 2020 00:17:08 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> escreveu:

> Hi Mauro, Randy,
> 
> On Mon, 20 Apr 2020 at 13:45, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > building it with a random config causes a warning:
> >
> > WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
> >   Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && OF [=n]
> >   Selected by [y]:
> >   - VIDEO_ROCKCHIP_ISP1 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && VIDEO_V4L2 [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])
> >
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Thanks for the patch. Please note this warning (plus another one),
> is already fixed by a couple patches in this series:
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=2094

I actually merged the patches yesterday, in order to have a cleaner
linux-next today.

There were too much Kconfig noise those days.

So, could you please rebase your patches on the top of media upstream?


Thanks,
Mauro
