Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB5D373924
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhEELSc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:18:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232580AbhEELSa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 07:18:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57710611AD;
        Wed,  5 May 2021 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620213454;
        bh=6bWQBkyrtcoK6PbWPlqLcwI7QzrahpA09bOWsUzwsC0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H1skVirY1eMlbe3Cnm8EoDLq0eLg1YRq5YJDGvwUYpXAL51KopxAMqglG2tq0FIoZ
         wAlADhbbyZoLAuxfrsQV5BXIvTrh3f7tAHPzNrQG8CR5FssNULrb93GkQ99NYr063a
         WQQ8TpBoZtcz0T6BG3l80gx6Ys3dMoCVvnhZ2zRZ+8Q5D9DUO2tl40VW9zV/1v/R96
         3qmAxUPjnyb7bJbBGR5hpeeNXv31oQDil9EVstYYaKyo/tVJjobR73c0sVFO1lsMeA
         fF962HqWcl1ZEE/SUG3dCYwCEXH7xXSHVTn94IbJ331OkJn8n8RxkkOi/MHA69d8vn
         PTQhw3ePVwsfQ==
Date:   Wed, 5 May 2021 13:17:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 02/25] staging: media: imx7-mipi-csis: fix
 pm_runtime_get_sync() usage count
Message-ID: <20210505131727.6c07e3b0@coco.lan>
In-Reply-To: <20210505120652.00001236@Huawei.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <793a5806a63b6313606fd1c344b9eec41e61a440.1620207353.git.mchehab+huawei@kernel.org>
        <20210505120652.00001236@Huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 5 May 2021 12:06:52 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 5 May 2021 11:41:52 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The pm_runtime_get_sync() internally increments the
> > dev->power.usage_count without decrementing it, even on errors.
> > Replace it by the new pm_runtime_resume_and_get(), introduced by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > in order to properly decrement the usage counter, avoiding
> > a potential PM usage counter leak.
> > 
> > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Not a fix as far as I can see, just a cleanup - so perhaps not this set?

Yeah, will move it to the non-error patch pile and change the comments.

> 
> Jonathan
> 
> 
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > index 025fdc488bd6..1dc680d94a46 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -695,11 +695,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
> >  
> >  		mipi_csis_clear_counters(state);
> >  
> > -		ret = pm_runtime_get_sync(&state->pdev->dev);
> > -		if (ret < 0) {
> > -			pm_runtime_put_noidle(&state->pdev->dev);
> > +		ret = pm_runtime_resume_and_get(&state->pdev->dev);
> > +		if (ret < 0)
> >  			return ret;
> > -		}
> > +
> >  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
> >  		if (ret < 0 && ret != -ENOIOCTLCMD)
> >  			goto done;  
> 



Thanks,
Mauro
