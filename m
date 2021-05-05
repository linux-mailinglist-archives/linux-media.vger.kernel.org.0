Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442F7373CA6
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 15:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbhEENrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 09:47:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230159AbhEENru (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 09:47:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A044610FB;
        Wed,  5 May 2021 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620222413;
        bh=f2HvundY/v8CdCUmWlDh+pnal+3mUV1iWqzpr2EOCMA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EjY9SLA8HDPK0DvF0y+Jr96DIoEJFOULCNyYDAhEh2vzk9A8L9Uirup/H81xby0Sx
         l0ped0vM+QDqjEzShUDgfjr9NL9X4LaVvoyY4mw5xJGmlDvMdJI7SIKo2X8Iq9gxss
         oJF4879n2tXmw+iarHnVKbm/3j3FMf63g6pJ+XvrMh//jolSYJV/j4eZCPo/dy8Gqz
         t13kermK4ZNSFaFswgJaqfameakMwYxSG3Th2Is+Bglj/M4OW6ZskctAG8lao8S987
         +0NQ+saAX+StNskg5k6gz8TyfxMQbLh0985/xdVX2x9hgUg6LRa1lW1ukH1iLrntnp
         hlssLhxPN3F8w==
Date:   Wed, 5 May 2021 15:46:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 09/25] media: hantro: do a PM resume earlier
Message-ID: <20210505154647.62784bf7@coco.lan>
In-Reply-To: <11c24f97ef71b16c2e7b3ba40ca66a28c12df692.camel@collabora.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
        <11c24f97ef71b16c2e7b3ba40ca66a28c12df692.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 05 May 2021 10:22:03 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Hi Mauro,
> 
> Thanks for working on this.
> 
> On Wed, 2021-05-05 at 11:41 +0200, Mauro Carvalho Chehab wrote:
> > The device_run() first enables the clock and then
> > tries to resume PM runtime, checking for errors.
> > 
> > Well, if for some reason the pm_runtime can not resume,
> > it would be better to detect it beforehand.
> > 
> > So, change the order inside device_run().
> > 
> > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> It seems this is wrong now, as this series doesn't have
> 
> https://lore.kernel.org/linux-media/803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org/
> 
> I don't fully understand why all the back and forth
> happening on this series, but the former Hantro patches
> looked good (despite perhaps unclear commit messages).

There was a request to break the original /79 series into smaller ones,
to make easier for reviewers. So, I opted to split it into (probably)
3 series:

1. Fixes (this series);
2. "use pm_runtime_resume_and_get" for the I2C drivers;
3. "use pm_runtime_resume_and_get" for remaining ones.

Before flooding everybody's email's with series (2) and (3), better
to focus at the fixes first. I'll probably send the other two series
by tomorrow.

> Any issues just squashing these two commits from "[PATCH v4 00/79] Address some issues with PM runtime at media subsystem":
> 
>   media: hantro: use pm_runtime_resume_and_get()
>   media: hantro: do a PM resume earlier

The problem is that pm_runtime_resume_and_get() was added only
recently (Kernel v5.10). 

So, I opted to place the fix patches before the changes, as this
way, most (all?) patches can be easily be backported to legacy Kernels
as needed.

Thanks,
Mauro
