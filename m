Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA65C18AAC4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgCSCk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:40:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSCk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:40:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F392D5F;
        Thu, 19 Mar 2020 03:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584585625;
        bh=+xx6tGusxpIlN365QsnOwyDPEVrhuSCTZc2KAoX6uGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vnXJ6uDo0MzsiT1hZxdgVIrkBRuAD6KoMV/oKG9a+NW15XG/u0jgZGkYTccOYTe3a
         LAU8anYbfiklFNNaHKKFz0ojxTJOstC2xRjIL3jnMWrKHBnoJH+MTtuVnTE4yYxqQq
         spS8KxJzTTXQ4yC6xP46VCb0pZajSWyQ8bsKCd6Q=
Date:   Thu, 19 Mar 2020 04:40:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 2/5] media-device: Add a graph_complete callback to struct
 media_device_ops
Message-ID: <20200319024019.GE27375@pendragon.ideasonboard.com>
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318213051.3200981-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318213051.3200981-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Mar 18, 2020 at 10:30:48PM +0100, Niklas Söderlund wrote:
> Add a new graph_complete operation to struct media_device_ops. The
> callback is optional to implement. If it's implemented it shall return
> the status about the media graphs completes. If all entities that the
> media device could contain is registered in the graph it shall return
> true, otherwise false.

I'd rather do it the other way around, implement a function that drivers
can call to signal completion. It will store the flag internally in
media_device, and will also be able to send an event to notify
userspace (once we get MC events).

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  include/media/media-device.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index fa089543072052cf..f637ad2eee38f456 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -61,6 +61,8 @@ struct media_entity_notify {
>   *	       request (and thus the buffer) must be available to the driver.
>   *	       And once a buffer is queued, then the driver can complete
>   *	       or delete objects from the request before req_queue exits.
> + * @graph_complete: Check if the media device graph is complete and all entries
> + *		    have been added to the graph.
>   */
>  struct media_device_ops {
>  	int (*link_notify)(struct media_link *link, u32 flags,
> @@ -69,6 +71,7 @@ struct media_device_ops {
>  	void (*req_free)(struct media_request *req);
>  	int (*req_validate)(struct media_request *req);
>  	void (*req_queue)(struct media_request *req);
> +	bool (*graph_complete)(struct media_device *mdev);
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
