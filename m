Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C7F36C888
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 17:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238622AbhD0PT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 11:19:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60450 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237656AbhD0PTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 11:19:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 132381F4265E
Message-ID: <95ea572e201545b27ff9f48313f7aaea157d4764.camel@collabora.com>
Subject: Re: [PATCH v3 79/79] media: hantro: document the usage of
 pm_runtime_get_sync()
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Tue, 27 Apr 2021 12:18:32 -0300
In-Reply-To: <02948673-9572-a570-d28e-03a7208f39e1@arm.com>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
         <230f22170db7fa57b49cff4570cef15bf11b2ad5.1619519080.git.mchehab+huawei@kernel.org>
         <02948673-9572-a570-d28e-03a7208f39e1@arm.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-04-27 at 16:08 +0100, Robin Murphy wrote:
> On 2021-04-27 11:27, Mauro Carvalho Chehab wrote:
> > Despite other *_get()/*_put() functions, where usage count is
> > incremented only if not errors, the pm_runtime_get_sync() has
> > a different behavior, incrementing the counter *even* on
> > errors.
> > 
> > That's an error prone behavior, as people often forget to
> > decrement the usage counter.
> > 
> > However, the hantro driver depends on this behavior, as it
> > will decrement the usage_count unconditionally at the m2m
> > job finish time, which makes sense.
> > 
> > So, intead of using the pm_runtime_resume_and_get() that
> > would decrement the counter on error, keep the current
> > API, but add a documentation explaining the rationale for
> > keep using pm_runtime_get_sync().
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >   drivers/staging/media/hantro/hantro_drv.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 595e82a82728..96f940c1c85c 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -155,6 +155,13 @@ static void device_run(void *priv)
> >         ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> >         if (ret)
> >                 goto err_cancel_job;
> 
> ..except this can also cause the same pm_runtime_put_autosuspend() call 
> without even reaching the "matching" get below, so rather than some kind 
> of cleverness it seems more like it's just broken :/
> 

Indeed, I was trying to find time to cook a quick patch, but kept
getting preempted.

Feel free to submit a fix for this, otherwise, I'll try to find
time later this week.

Thanks,
Ezequiel

