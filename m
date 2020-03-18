Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833EA189D87
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 15:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgCROD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 10:03:58 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43929 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgCROD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 10:03:58 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 859276000D;
        Wed, 18 Mar 2020 14:03:54 +0000 (UTC)
Date:   Wed, 18 Mar 2020 15:06:50 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/5] media: i2c: max9286: Put of node on error
Message-ID: <20200318140650.jehzd77tocgxjbw2@uno.localdomain>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-2-jacopo+renesas@jmondi.org>
 <09e74f7c-932b-fe63-c234-166b6ebe89f6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <09e74f7c-932b-fe63-c234-166b6ebe89f6@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Mar 18, 2020 at 09:32:45AM +0000, Kieran Bingham wrote:
> Hi Jacopo
>
> On 16/03/2020 20:27, Jacopo Mondi wrote:
> > Put the device of node in case of dt parsing error.
> >
>
> Ooops, it does look like this probably leaks - but isn't it also leaking
> in other code paths in this function too?

I checked and got confused by the very last
        of_node_put(node);

which should be coupled with and additional
        of_node_put(dev->of_node);

I don't see any additional leak, am I mistaken ?

>
> If we fix here, we should fix all leaks of this usage. (and perhaps
> identify if there are leaks of other refcnts too ;-S )
>
>
> > Fixes: 9eed4185c7a0 ("media: i2c: Add MAX9286 driver")
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index a20829297ef6..06edd8bd3e82 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -1046,6 +1046,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
> >  	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> >  	if (!i2c_mux) {
> >  		dev_err(dev, "Failed to find i2c-mux node\n");
> > +		of_node_put(dev->of_node);
> >  		return -EINVAL;
> >  	}
> >
> >
>
