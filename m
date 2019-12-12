Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB9011D6D6
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 20:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730295AbfLLTJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 14:09:05 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35982 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730096AbfLLTJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 14:09:05 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so3826747wma.1;
        Thu, 12 Dec 2019 11:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IxK9FtGpYJeOUfvnF7MggY9vmvu7+uyxyDOUYBGOZPw=;
        b=XShq7tcKoeE+Txh1DEN5WhLp0eR/w69ZPSSfE+iXxHgHs0gOju6ZXq+p1U1RcRKBWV
         Pf+WEL7yhcSNaso+niPZhq2I8ig9HcwcmRZj7C4V/UAuLNCRpAZKF9uNqdj4kI6+qitF
         wssJMmQKMq541gCc68PXUiZilDMwnSycahaOS/M8D87+Jx+RGR+vA4bDuWm2rJNcMcaI
         XYnurMLbUaQz1lQ1tReQLskTknW118Rbuf61l+6gaoVBCXcTiXVGR8QggDfpmKcnGAiY
         ScpzgnYUw8E4wE6BVOB7oojAGJ256kAey11+LG3HL4J6s1/0DZfZmQKGk6BLrKGcA65Q
         lHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IxK9FtGpYJeOUfvnF7MggY9vmvu7+uyxyDOUYBGOZPw=;
        b=dTox4/e4DGPRi1pJN8BrU3elvLkqFT9/RiBO8nKIcmR5zHY57tRFtI9raea+9Vng9J
         i2cOklihcLc+TA9jtpx2+LUG4uuw288NWqJhlL7igcSlEoK1N3VzIVG8jKukSOBViTLO
         jJgEJSi/kZUF9miJIwIHy95VVYHJHPrX0ZzcbtacLcq1edaxiny83IrH9dp9gT4ZzEc/
         Pdgjz3phHDdv0hzmH7E32cL2mjXxvXLusjAdDHCZMq4jrbQLSI0uQeqbx6JG91to7Egj
         FnB0/QQPEK8VfvN1bkozNwtdgdulXeajj0YQZIqhBSdB8GYiC2G/8JEsfunRw2qbn4LK
         JX6g==
X-Gm-Message-State: APjAAAU9rs6mev720pdAvkzWLaT8Ncd89LIPOAQRk+++gy6N5yLxoaQS
        MkmlY+Ov1PVMjRwh7Pj2eF4=
X-Google-Smtp-Source: APXvYqwsF9/+E9ejZwZFR/MJTQSnIfDekPVMn7yz+SlJiFAcLzJ1ytlyj48O3iuSD4HZvW680PcnvQ==
X-Received: by 2002:a1c:2705:: with SMTP id n5mr8858556wmn.68.1576177742710;
        Thu, 12 Dec 2019 11:09:02 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o66sm3322584wmo.20.2019.12.12.11.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:09:01 -0800 (PST)
Date:   Thu, 12 Dec 2019 19:08:58 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Chuhong Yuan <hslester96@gmail.com>, devel@driverdev.osuosl.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx7-mipi-csis: Add the missed
 v4l2_async_notifier_cleanup in remove
Message-ID: <20191212190858.nslwdcjpbjnrfvq2@arch-thunder.localdomain>
References: <20191209085828.16183-1-hslester96@gmail.com>
 <20191212115134.GA1895@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212115134.GA1895@kadam>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,
Thanks for the inputs.
On Thu, Dec 12, 2019 at 02:51:34PM +0300, Dan Carpenter wrote:
> On Mon, Dec 09, 2019 at 04:58:28PM +0800, Chuhong Yuan wrote:
> > All drivers in imx call v4l2_async_notifier_cleanup() after
> > unregistering the notifier except this driver.  This should be a
> > miss and we need to add the call to fix it.
> > 
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com> ---
> > drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c
> > b/drivers/staging/media/imx/imx7-mipi-csis.c index
> > 99166afca071..2bfa85bb84e7 100644 ---
> > a/drivers/staging/media/imx/imx7-mipi-csis.c +++
> > b/drivers/staging/media/imx/imx7-mipi-csis.c @@ -1105,6 +1105,7 @@
> > static int mipi_csis_remove(struct platform_device *pdev)
> > mipi_csis_debugfs_exit(state);
> > v4l2_async_unregister_subdev(&state->mipi_sd);
> > v4l2_async_notifier_unregister(&state->subdev_notifier); +
> > v4l2_async_notifier_cleanup(&state->subdev_notifier);
> >  
> 
> In this case the "state->subdev_notifier" was never initialized or
> used so both v4l2_async_notifier_unregister() and
> v4l2_async_notifier_cleanup() are no-ops.

I have applied this patch on top of Steve's series [0], since by the
timeline I was expecting to be applied before this one, that series
adds a bound notifier, even though, it is not named the same, eheh.

That trigged me to think that this cleanup was correct since a
notifier was initialized in probe.

But as you say, it is a no-ops in the end.

@Steve, that said, it looks that in [0], you will need to add some
unregister and cleanup for the notifiers that you are adding in
several places.

A patch to fix this will follow.

------
Cheers,
     Rui



[0]: https://patchwork.kernel.org/project/linux-media/list/?series=207517

> 
> We should just delete "subdev_notifier".
> 
> regards, dan carpenter
> 
> _______________________________________________ devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
