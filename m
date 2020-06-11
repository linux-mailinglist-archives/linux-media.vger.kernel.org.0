Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E741F605B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 05:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgFKDMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 23:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgFKDMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 23:12:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2089DC08C5C1;
        Wed, 10 Jun 2020 20:12:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FD9D26A;
        Thu, 11 Jun 2020 05:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591845167;
        bh=b7njhgVrraw19z6ke0PFnKBACKM/4JdgJ9/u4XUznMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vqt5wsYlYe0O+U2Nt0I0ynIp7el+tUGHlOAX7tXMoXUWR2kw9uE/Fjm5q79BzfIHk
         462A9q6f8NmuE0c96G3zGOE8YhZ2UFXfCLtwq0FJlLNmi5gAyjn6PGRy7CI29D7fdM
         +Q+LHcjs1ag239fHXtR+AzkQiNyz4MEo5S3oQNpE=
Date:   Thu, 11 Jun 2020 06:12:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] uapi/linux/media.h: add flags field to struct
 media_v2_topology
Message-ID: <20200611031226.GE13598@pendragon.ideasonboard.com>
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
 <20200610230541.1603067-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610230541.1603067-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Jun 11, 2020 at 01:05:37AM +0200, Niklas Söderlund wrote:
> Add a flags field to the media_v2_topology structure by taking one
> of the reserved u32 fields. Also define a flag to carry information
> about if the graph is complete. The use-case is to have a way to report
> to user-space if the media graph contains all subdevices.
> 
> The other bits in the flags field are unused for now, but could be
> claimed to carry other type of information in the future.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/mc/mc-device.c | 2 +-
>  include/uapi/linux/media.h   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index da8088351135298a..c2ef5bb512a5fba0 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -242,6 +242,7 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
>  	int ret = 0;
>  
>  	topo->topology_version = mdev->topology_version;
> +	topo->flags = 0;
>  
>  	/* Get entities and number of entities */
>  	i = 0;
> @@ -269,7 +270,6 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
>  		uentity++;
>  	}
>  	topo->num_entities = i;
> -	topo->reserved1 = 0;
>  
>  	/* Get interfaces and number of interfaces */
>  	i = 0;
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 383ac7b7d8f07eca..7c07b9939252c768 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -351,7 +351,7 @@ struct media_v2_topology {
>  	__u64 topology_version;
>  
>  	__u32 num_entities;
> -	__u32 reserved1;
> +	__u32 flags;
>  	__u64 ptr_entities;
>  
>  	__u32 num_interfaces;
> @@ -367,6 +367,8 @@ struct media_v2_topology {
>  	__u64 ptr_links;
>  } __attribute__ ((packed));
>  
> +#define MEDIA_TOPOLOGY_FLAG_COMPLETE	(1 << 0)
> +

Missing documentation :-)

Should we use the BIT() macro ?

>  /* ioctls */
>  
>  #define MEDIA_IOC_DEVICE_INFO	_IOWR('|', 0x00, struct media_device_info)

-- 
Regards,

Laurent Pinchart
