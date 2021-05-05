Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6256373CDC
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhEEOCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbhEEOCm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 10:02:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCC3C06174A;
        Wed,  5 May 2021 07:01:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 978881F42DFA
Message-ID: <735925557d7fde1c11affeea703f8486febc825d.camel@collabora.com>
Subject: Re: [PATCH 09/25] media: hantro: do a PM resume earlier
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Date:   Wed, 05 May 2021 11:01:35 -0300
In-Reply-To: <20210505154647.62784bf7@coco.lan>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
         <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
         <11c24f97ef71b16c2e7b3ba40ca66a28c12df692.camel@collabora.com>
         <20210505154647.62784bf7@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-05-05 at 15:46 +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 05 May 2021 10:22:03 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > Hi Mauro,
> > 
> > Thanks for working on this.
> > 
> > On Wed, 2021-05-05 at 11:41 +0200, Mauro Carvalho Chehab wrote:
> > > The device_run() first enables the clock and then
> > > tries to resume PM runtime, checking for errors.
> > > 
> > > Well, if for some reason the pm_runtime can not resume,
> > > it would be better to detect it beforehand.
> > > 
> > > So, change the order inside device_run().
> > > 
> > > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> > 
> > It seems this is wrong now, as this series doesn't have
> > 
> > https://lore.kernel.org/linux-media/803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org/
> > 
> > I don't fully understand why all the back and forth
> > happening on this series, but the former Hantro patches
> > looked good (despite perhaps unclear commit messages).
> 
> There was a request to break the original /79 series into smaller ones,
> to make easier for reviewers. So, I opted to split it into (probably)
> 3 series:
> 
> 1. Fixes (this series);
> 2. "use pm_runtime_resume_and_get" for the I2C drivers;
> 3. "use pm_runtime_resume_and_get" for remaining ones.
> 
> Before flooding everybody's email's with series (2) and (3), better
> to focus at the fixes first. I'll probably send the other two series
> by tomorrow.
> 
> > Any issues just squashing these two commits from "[PATCH v4 00/79] Address some issues with PM runtime at media subsystem":
> > 
> >   media: hantro: use pm_runtime_resume_and_get()
> >   media: hantro: do a PM resume earlier
> 
> The problem is that pm_runtime_resume_and_get() was added only
> recently (Kernel v5.10). 
> 
> So, I opted to place the fix patches before the changes, as this
> way, most (all?) patches can be easily be backported to legacy Kernels
> as needed.
> 

Got it.

Maybe the better fix would be the squash of [PATCH v4 78/79] media: hantro: use pm_runtime_resume_and_get()
and [PATCH v4 79/79] media: hantro: do a PM resume earlier but keeping pm_runtime_get_sync.

And then you can replace the pm_runtime_get_sync with pm_runtime_resume_and_get.

Thanks,
Ezequiel


