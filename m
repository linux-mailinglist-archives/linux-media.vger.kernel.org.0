Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3489D18AACA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgCSCnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:43:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSCnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:43:23 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D92005F;
        Thu, 19 Mar 2020 03:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584585802;
        bh=J4TmfBhv+ieAq1Cd40HN34ZWkCEOUbITKJU103LofDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PyuZjzbho0EO4D2s/+C4AEoIWaGJPoTgI6niV9hsy340TTR4NQ+GA+1YrU0t6GTnw
         fiI/46Eua25/cK/W0XCiaMkNENK0yeseSEo+Wxxn2g91yodVjlviNIGIhIIA9mKm0S
         l1pyLleJm8mgysdGzs61rVXSRoVPnUdprYBCoGbw=
Date:   Thu, 19 Mar 2020 04:43:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 5/5] rcar-vin: Do not unregister video device when a
 subdevice is unbound
Message-ID: <20200319024316.GG27375@pendragon.ideasonboard.com>
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318213051.3200981-6-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318213051.3200981-6-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Mar 18, 2020 at 10:30:51PM +0100, Niklas Söderlund wrote:
> If the v4l2-async notifier have once been complete and the video
> device(s) have been register, do not unregister them if one subdevice is
> unbound. Depending on which subdevice is unbound other parts of the
> pipeline could still be functional. For example if one of multiple
> sensors connected to a CSI-2 transmitter is unbound other sensors in
> that pipeline are still useable.
> 
> This problem is extra critical for R-Car VIN which registers two
> independent CSI-2 receivers in the same media graph as they can both be
> used by the same dma-engines. If one of the CSI-2 receivers are unbound
> the other CSI-2 receiver pipeline is still fully functional.

I like this, but shouldn't you also move registration of the video nodes
to probe time then ?

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 21ce3de8168c3224..d51ffe75c34c97c5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -533,7 +533,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
>  
>  static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
>  {
> -	rvin_v4l2_unregister(vin);
>  	vin->parallel->subdev = NULL;
>  
>  	if (!vin->info->use_mc) {
> @@ -758,10 +757,6 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
>  	unsigned int i;
>  
> -	for (i = 0; i < RCAR_VIN_NUM; i++)
> -		if (vin->group->vin[i])
> -			rvin_v4l2_unregister(vin->group->vin[i]);
> -
>  	mutex_lock(&vin->group->lock);
>  
>  	for (i = 0; i < RVIN_CSI_MAX; i++) {

-- 
Regards,

Laurent Pinchart
