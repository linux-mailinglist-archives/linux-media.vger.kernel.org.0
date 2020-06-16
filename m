Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000641FA64F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 04:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgFPCKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 22:10:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39738 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgFPCKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 22:10:21 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1224EF9;
        Tue, 16 Jun 2020 04:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592273419;
        bh=AcTUj0kR0QEuHzxBF4e7RX1bAoFLoeUE1yAmNqDbdgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/hKs8fZ1G/O+P7tUaHHzKrkVeP1NsoWaS8rX8UR2SQMKCbeY5pddtHXoymJhgvrm
         D7esNu/1aT7mmPKo2+r/WgSfjf2wdRaj77uFp8pOZwYrPzt7D1TCPunXLdtuSsLB/4
         u3kU2141L0BDmbVxj8BfbjGZKRMXbELiU+ljJ6vY=
Date:   Tue, 16 Jun 2020 05:09:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     wu000273@umn.edu
Cc:     kjlu@umn.edu,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Fix a reference count leak.
Message-ID: <20200616020956.GL1629@pendragon.ideasonboard.com>
References: <20200613232357.18155-1-wu000273@umn.edu>
 <20200616020732.GK1629@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200616020732.GK1629@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 16, 2020 at 05:07:34AM +0300, Laurent Pinchart wrote:
> Hi Qiushi,
> 
> (CC'ing Rafael and Geert)
> 
> Thank you for the patch.
> 
> On Sat, Jun 13, 2020 at 06:23:57PM -0500, wu000273@umn.edu wrote:
> > From: Qiushi Wu <wu000273@umn.edu>
> > 
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code, causing incorrect ref count if
> > pm_runtime_put_noidle() is not called in error handling paths.
> > Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.
> > 
> > Fixes: 1e6af546ee66 ("[media] v4l: vsp1: Implement runtime PM support")
> > Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> 
> https://lore.kernel.org/dri-devel/20200614134655.GA5960@pendragon.ideasonboard.com/
> 
> I really wonder if mass-patching all drivers is the best way forward.

Also,

https://lore.kernel.org/linux-media/20200608052919.4984-1-dinghao.liu@zju.edu.cn/

> > ---
> >  drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> > index c650e45bb0ad..222c9e1261a0 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -846,8 +846,10 @@ static int vsp1_probe(struct platform_device *pdev)
> >  	pm_runtime_enable(&pdev->dev);
> >  
> >  	ret = pm_runtime_get_sync(&pdev->dev);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		pm_runtime_put_noidle(&pdev->dev);
> >  		goto done;
> > +	}
> >  
> >  	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> >  	pm_runtime_put_sync(&pdev->dev);

-- 
Regards,

Laurent Pinchart
