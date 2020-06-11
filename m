Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1258B1F605E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 05:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgFKDNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 23:13:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45494 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgFKDNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 23:13:39 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1B9726A;
        Thu, 11 Jun 2020 05:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591845218;
        bh=gf2kFlEYfBFMvXqcwPSuWvy4Vc8G7zTgDOxH3ob7YPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D97W/Gq7kJTcWik8t2w6Q5KZ5uDAZiK8RX5DupR/1+Bk2FU3+Tj13ZQhyE9crDQrr
         14EvDC8tAu1G2SRNl+FqOdrKA+KBvA+8l6xlC3mg/nkqRJpRNcxu6w2e4t+NSkgEjW
         l7p5OqXqpYzlitOS8/7rOC9o5YZg5FDafQNe4Y1A=
Date:   Thu, 11 Jun 2020 06:13:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] media-device: Add a complete flag to struct
 media_device
Message-ID: <20200611031316.GF13598@pendragon.ideasonboard.com>
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
 <20200610230541.1603067-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610230541.1603067-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Jun 11, 2020 at 01:05:38AM +0200, Niklas Söderlund wrote:
> Add a complete flag to indicate if the media graph is complete or not.
> The use-case is for v4l2-async to set the flag when all subdevices are
> bound and that the flag be reported to user-space so it can learn when a
> graph is completely populated.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  include/media/media-device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index fa089543072052cf..cd685c3a791c6c04 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -83,6 +83,7 @@ struct media_device_ops {
>   * @serial:	Device serial number (optional)
>   * @bus_info:	Unique and stable device location identifier
>   * @hw_revision: Hardware device revision
> + * @complete:	Graph completed flag

This requires more documentation too.

>   * @topology_version: Monotonic counter for storing the version of the graph
>   *		topology. Should be incremented each time the topology changes.
>   * @id:		Unique ID used on the last registered graph object
> @@ -151,6 +152,7 @@ struct media_device {
>  	char serial[40];
>  	char bus_info[32];
>  	u32 hw_revision;
> +	bool complete;
>  
>  	u64 topology_version;
>  

-- 
Regards,

Laurent Pinchart
