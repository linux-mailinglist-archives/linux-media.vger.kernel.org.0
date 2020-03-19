Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2D4818AABD
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCSChv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:37:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSChv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:37:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEA375F;
        Thu, 19 Mar 2020 03:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584585470;
        bh=sT4PAGbDAPZh+gbemxf1ikcC8JZRbPkDAp53r9Yp+3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hBd78NtqyTWT3uFRw5m/9mkQyJ2cOs4IuduXDp00luKrMuSDOLOpznD1TQ+J1Q3rJ
         NtMEdaB6RkaG91dlpvIkCMbFegvq1Gq5cmvrrc/G6i2nr7e7RP7b0lE03ZCyi84HjC
         s93bxDhX+7WyEOA2QY2i3TjeAyeZwnPOvJKRsE94=
Date:   Thu, 19 Mar 2020 04:37:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 1/5] uapi/linux/media.h: add flag field to struct
 media_device_info
Message-ID: <20200319023744.GC27375@pendragon.ideasonboard.com>
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318213051.3200981-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318213051.3200981-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Mar 18, 2020 at 10:30:47PM +0100, Niklas Söderlund wrote:
> Add a flags field to the media_device_info structure by taking one
> of the reserved u32 fields. The use-case is to have a way to
> (optionally) report to user-space if the media graph is complete or not.
> 
> Also define two flags to carry information about if the graph is
> complete or not. If neither of the two flags are set the
> media device does not support reporting its graph status. The other bits
> in the flags field are unused for now, but could be claimed to carry
> other type of information in the future.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  include/uapi/linux/media.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 383ac7b7d8f07eca..9b37ed8b41d0d866 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -34,9 +34,16 @@ struct media_device_info {
>  	__u32 media_version;
>  	__u32 hw_revision;
>  	__u32 driver_version;
> -	__u32 reserved[31];
> +	__u32 flags;
> +	__u32 reserved[30];

I think this information should be added to media_v2_topology, not
media_device_info, otherwise you'll have a race condition between
retrieving the media device information and the topology.
media_device_info is really supposed to be static.

>  };
>  
> +/*
> + * Graph flags
> + */
> +#define MEDIA_INFO_FLAG_INCOMPLETE	(1 << 0)
> +#define MEDIA_INFO_FLAG_COMPLETE	(1 << 1)
> +
>  /*
>   * Base number ranges for entity functions
>   *

-- 
Regards,

Laurent Pinchart
