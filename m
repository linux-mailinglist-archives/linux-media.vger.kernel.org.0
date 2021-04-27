Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CA736C1BA
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 11:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbhD0Jbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 05:31:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:37318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230316AbhD0Jbv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 05:31:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6658613BC;
        Tue, 27 Apr 2021 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619515862;
        bh=wwdocN+FFNO7ugt/9z3SiJCzGGGQpkTsBljNkYzdRsc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dR+eRUUcFpK7r3Qo3uMIc89WSn+V7tyH+0fKhATah0oY8qwXPKKIcMoDR0TqWJxTs
         4OuaQI7kmex4sPg8XSzBZ73DSWcXLaaRm+6dF3BuoWLDeGMO49BFvieaqwl4fBViot
         hgpZveuEPLA9kiaLDEEz/3Sdqk4ofewrIDhYu7EZJqilkKf6143HgVByg5YHRM22kN
         ItCWCT0uoAQYx56BlKs2SDX1QRKLKAFX3MT/jJiqoz/Fkjo59cE8XGjtix1OpbTGga
         mG1W746ovMPtbkkyxUbKWBWApKyoHXBdn6sUdh87o1J7Mj04R3JL/In/U8JfHfjVZQ
         VXliqcie3Qa3A==
Date:   Tue, 27 Apr 2021 11:30:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 58/78] media: exynos-gsc: use
 pm_runtime_resume_and_get()
Message-ID: <20210427113055.745d0560@coco.lan>
In-Reply-To: <ee7b580a-d5bc-bdbf-3efc-c9d8f43316db@samsung.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <CGME20210424064556eucas1p1e89378837c377168c9782b4172e70482@eucas1p1.samsung.com>
        <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
        <ee7b580a-d5bc-bdbf-3efc-c9d8f43316db@samsung.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Apr 2021 10:18:12 +0200
Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:

> On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> > 
> > Use the new API, in order to cleanup the error check logic.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/platform/exynos-gsc/gsc-core.c | 3 +--
> >  drivers/media/platform/exynos-gsc/gsc-m2m.c  | 2 +-
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> > index 9f41c2e7097a..9d5841194f6b 100644
> > --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> > +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> > @@ -1210,7 +1210,7 @@ static int gsc_remove(struct platform_device *pdev)
> >  	struct gsc_dev *gsc = platform_get_drvdata(pdev);
> >  	int i;
> >  
> > -	pm_runtime_get_sync(&pdev->dev);
> > +	pm_runtime_resume_and_get(&pdev->dev);
> >  
> >  	gsc_unregister_m2m_device(gsc);
> >  	v4l2_device_unregister(&gsc->v4l2_dev);
> > @@ -1219,7 +1219,6 @@ static int gsc_remove(struct platform_device *pdev)
> >  	for (i = 0; i < gsc->num_clocks; i++)
> >  		clk_disable_unprepare(gsc->clock[i]);
> >  
> > -	pm_runtime_put_noidle(&pdev->dev);  
> 
> If we do this then the device usage count will not get decremented
> after the pm_runtime_resume_and_get() call above and after driver
> unload/load cycle it will not be possible to suspend the device.
> I wouldn't be changing anything in gsc_remove(), pm_runtime_get_sync()
> works better in that case.

Good point.

Actually, I don't see any reason why to call a PM resume
function - either being pm_runtime_get_sync() or
pm_runtime_resume_and_get().

The code there could simply be:

    static int gsc_remove(struct platform_device *pdev)
    {
        struct gsc_dev *gsc = platform_get_drvdata(pdev);
        int i;

        gsc_unregister_m2m_device(gsc);
        v4l2_device_unregister(&gsc->v4l2_dev);

        vb2_dma_contig_clear_max_seg_size(&pdev->dev);
        for (i = 0; i < gsc->num_clocks; i++)
                clk_disable_unprepare(gsc->clock[i]);

        pm_runtime_disable(&pdev->dev);

        dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
        return 0;
    }

Eventually also adding:
	pm_runtime_suspended(&pdev->dev);

just after pm_runtime_disable().

Regards,
Mauro
