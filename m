Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA94F071B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 21:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfKEUiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 15:38:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEUiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 15:38:13 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA4CF559;
        Tue,  5 Nov 2019 21:38:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572986291;
        bh=8wo2WhhDfRNdKPwp2/4aFiK6s2vExDG8hIxxqyvYU8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K3lY1k98LBmxLN7yonMLuDxTh61l5T97nxbvEQWHPxGMb/rB3S78zgwvrjhGq3pFr
         cIUuqhDyno6fSRSzxYJfhP8RSglHk8p7tQYW0WOXVrDdT2/wkT6URd/aFdZF1lj0cq
         FgoBI5J4rjJQhRsOLMq+lO57jVTPKbQ4DgTNjLGQ=
Date:   Tue, 5 Nov 2019 22:38:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191105203800.GF4869@pendragon.ideasonboard.com>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191101145246.GA13101@Mani-XPS-13-9360>
 <20191104134206.GC4913@pendragon.ideasonboard.com>
 <20191105150355.GA674@Mani-XPS-13-9360>
 <20191105172414.GA14607@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191105172414.GA14607@kekkonen.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 05, 2019 at 07:24:15PM +0200, Sakari Ailus wrote:
> On Tue, Nov 05, 2019 at 08:33:55PM +0530, Manivannan Sadhasivam wrote:
> ...
> > > > > +static int imx296_remove(struct i2c_client *client)
> > > > > +{
> > > > > +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > > +	struct imx296 *imx = to_imx296(subdev);
> > > > > +
> > > > > +	v4l2_async_unregister_subdev(subdev);
> > > > > +	media_entity_cleanup(&subdev->entity);
> > > > > +	v4l2_ctrl_handler_free(&imx->ctrls);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +#if IS_ENABLED(CONFIG_OF)
> > 
> > I think you don't need this guard if of_match_ptr is used.
> 
> There's also need for of_match_ptr, it should be removed.

I'll fix both.

-- 
Regards,

Laurent Pinchart
