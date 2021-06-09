Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9D33A1475
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 14:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhFIMcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 08:32:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:22990 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232149AbhFIMcD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 08:32:03 -0400
IronPort-SDR: yJJY+fWoFGNFu4eqXNUDLtb2o0wMJJf74YqPFhCBcCW0WKNNkPg9/Og8rDdb25WidIVDO857b2
 xSZYDxa/R39Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="266214664"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="266214664"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 05:30:07 -0700
IronPort-SDR: 2iydn6WkjYWXR6HaWYwiWSVyP20jPeysBtnHqN96AH1sEYuEbLehtFs/+xqX1Y26HMb7WePlC3
 fb4nuBvfuZMw==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="482363247"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 05:30:05 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 523D9205B3;
        Wed,  9 Jun 2021 15:30:03 +0300 (EEST)
Date:   Wed, 9 Jun 2021 15:30:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] media: v4l2-subdev: Fix documentation of the
 subdev_notifier member
Message-ID: <20210609123003.GF3@paasikivi.fi.intel.com>
References: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Jun 09, 2021 at 01:54:56PM +0200, Paul Kocialkowski wrote:
> Fix the name of the function that registers the subdev_notifier member
> of the v4l2_subdev structure.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  include/media/v4l2-subdev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..f3b657dfe304 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -854,7 +854,7 @@ struct v4l2_subdev_platform_data {
>   * @asd: Pointer to respective &struct v4l2_async_subdev.
>   * @notifier: Pointer to the managing notifier.
>   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
> - *		     device using v4l2_device_register_sensor_subdev().
> + *		     device using v4l2_async_register_subdev_sensor_common().

I agree in principle, but the function is nowadays called
v4l2_async_register_subdev_sensor().

I can fix this while applying.

-- 
Regards,

Sakari Ailus
