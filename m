Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7C91F1142
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 03:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbgFHB6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 21:58:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49732 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgFHB6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 21:58:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0236850E;
        Mon,  8 Jun 2020 03:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591581494;
        bh=kcSGifrZH0vrfhOepIzNiPEXoGz1SBN5lXlZ12cYQpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cc6QbwlbOTUwp4EbGm6u9dFm9iIWITUC2ld5fSq5Faw3hfSwfhk8KZYhBE0ggL/Cn
         m77xIz3INTQRio8IlFIlYVncxu+v9QorTJURet8GCIwSlpo+RGqSpFJkP+ab1DeGKw
         qmULqOiagpVXiVbziheoQOeMkG+IVqxkx/qt1bB0=
Date:   Mon, 8 Jun 2020 04:57:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Fix runtime PM imbalance in vsp1_probe
Message-ID: <20200608015753.GK22208@pendragon.ideasonboard.com>
References: <20200523115426.19285-1-dinghao.liu@zju.edu.cn>
 <20200608015456.GJ22208@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200608015456.GJ22208@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 08, 2020 at 04:54:57AM +0300, Laurent Pinchart wrote:
> Hi Dinghao,
> 
> Thank you for the patch.
> 
> On Sat, May 23, 2020 at 07:54:26PM +0800, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code. Thus a pairing decrement is needed on
> > the error handling path to keep the counter balanced.
> 
> I wonder how many bugs we have today, and how many bugs will keep
> appearing in the future, due to this historical design mistake :-( 
> 
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> > index c650e45bb0ad..017a54f2fdd8 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -846,8 +846,10 @@ static int vsp1_probe(struct platform_device *pdev)
> >  	pm_runtime_enable(&pdev->dev);
> >  
> >  	ret = pm_runtime_get_sync(&pdev->dev);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		pm_runtime_put_sync(&pdev->dev);
> >  		goto done;
> > +	}
> 
> This change looks good to me, but we also need a similar change in the
> vsp1_device_get() function if I'm not mistaken. Could you combine both
> in the same patch ?

And actually, after fixing vsp1_device_get(), we should replace the
pm_runtime_get_sync() call here with vsp1_device_get(), and the
pm_runtime_put_sync() below with vsp1_device_put(), so there would be no
need to call pm_runtime_put_sync() manually in the error path here.

> >  
> >  	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> >  	pm_runtime_put_sync(&pdev->dev);

-- 
Regards,

Laurent Pinchart
