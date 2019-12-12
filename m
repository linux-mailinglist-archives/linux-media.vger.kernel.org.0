Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 988D811CBC6
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 12:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbfLLLDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 06:03:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:52980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728613AbfLLLDv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 06:03:51 -0500
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E722122B48;
        Thu, 12 Dec 2019 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576148630;
        bh=RlQYE4ISnB8w71cVPWrVxWmmiBw1vv7db6O06zPNTEg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qNHGjkNNfqbO/iMeXj8vAZpZYJ8k+Y0WPRnnKuM4Pf8VuXrW7AhgfhGO4LUE6HiOu
         blPA7D7ic9Ty1uJUHM5vCOuzfgCP28aU3Pa87e9a2XhCQ7xXOShup8BjrRdhR14jtU
         +ZblW4z0tyJeNYEmpZ0RB+p5B5Jkv/7nrfYLUgM4=
Received: by mail-lf1-f43.google.com with SMTP id b15so1373439lfc.4;
        Thu, 12 Dec 2019 03:03:49 -0800 (PST)
X-Gm-Message-State: APjAAAUEWlCU5DXCXKu1M4vfAIaVNFhORK/RiPhAHEsMJ1gWYQbgkfd8
        sqduhwSq1/wl+2XBlONreAGQFIPklV2gNmjp8e8=
X-Google-Smtp-Source: APXvYqxdSYzPggRDnt0KWf86ulCn6elVREWxE1DfX8yzjxQqmOd7sEsDF55jGJFa+FUUT8TXBVfOjvz0/2nUFepPM/I=
X-Received: by 2002:ac2:5dc7:: with SMTP id x7mr5301381lfq.24.1576148628033;
 Thu, 12 Dec 2019 03:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20191104154942.8935-1-hslester96@gmail.com> <29590e4f-cb9e-c9ac-608c-b7b72c308d25@xs4all.nl>
In-Reply-To: <29590e4f-cb9e-c9ac-608c-b7b72c308d25@xs4all.nl>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 12 Dec 2019 12:03:36 +0100
X-Gmail-Original-Message-ID: <CAJKOXPctbuM_vZJPLORiyOh_8884Q3SEeEBmOmm7ON8xOp7m3w@mail.gmail.com>
Message-ID: <CAJKOXPctbuM_vZJPLORiyOh_8884Q3SEeEBmOmm7ON8xOp7m3w@mail.gmail.com>
Subject: Re: [PATCH] media: exynos4-is: add missed clk_disable_unprepare in remove
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Chuhong Yuan <hslester96@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 Dec 2019 at 11:39, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/4/19 4:49 PM, Chuhong Yuan wrote:
> > This driver forgets to disable and unprepare clock when remove.
> > Add a call to clk_disable_unprepare to fix it.
>
> I'd like an Ack from Samsung before I apply this. I see this in the probe() in fimc-lite.c:
>
>        if (!pm_runtime_enabled(dev)) {
>                 ret = clk_prepare_enable(fimc->clock);
>                 if (ret < 0)
>                         goto err_sd;
>         }
>
> So is it right to always call clk_disable_unprepare in the remove()?
>
> I suspect it is correct, but I would like someone else to take a look as well.
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> >  drivers/media/platform/exynos4-is/fimc-lite.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> > index e87c6a09205b..6748bd96aada 100644
> > --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> > +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> > @@ -1614,6 +1614,7 @@ static int fimc_lite_remove(struct platform_device *pdev)
> >       struct fimc_lite *fimc = platform_get_drvdata(pdev);
> >       struct device *dev = &pdev->dev;
> >
> > +     clk_disable_unprepare(fimc->clock);
> >       pm_runtime_disable(dev);
> >       pm_runtime_set_suspended(dev);
> >       fimc_lite_unregister_capture_subdev(fimc);

No, it is wrong. The clock is enabled in probe only if
!pm_runtime_enabled(). This will matter only if PM is disabled but now
it leads to unbalanced disables. This was clearly not tested because I
believe any test would trigger error. In such case, please mark the
patches as RFT.

There is some tendency to post small "fixes" like this without
testing... ok, not everyone has hardware but then just mark it as
not-tested or RFT...

Best regards,
Krzysztof
