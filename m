Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED7E189CFF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgCRNaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:30:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:46231 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726730AbgCRNaK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:30:10 -0400
IronPort-SDR: 4OfQKWiqbzYrpxuvF6QDvpurpcxpecilFLvJAZlxKNpL7P1XBxx2FPiyZ7qPPeVhDW4VjWiL95
 4L2CHr42VrCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 06:30:10 -0700
IronPort-SDR: kjlwCfxj/t6QVkzUakcRI8BcLTjt11EVE6+kkl6tEwzVrSZ1GiZubNxhtjGbKZQi5lXz/bswFY
 iKFB6knDQF1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,567,1574150400"; 
   d="scan'208";a="244824269"
Received: from thoyle-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.45.52])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2020 06:30:08 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 6CED721F46; Wed, 18 Mar 2020 15:30:01 +0200 (EET)
Date:   Wed, 18 Mar 2020 15:30:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] vimc: Make use of V4L2_CAP_IO_MC
Message-ID: <20200318133001.GC15448@kekkonen.localdomain>
References: <20200318132513.3089234-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318132513.3089234-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318132513.3089234-5-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan,

On Wed, Mar 18, 2020 at 02:25:13PM +0100, Niklas Söderlund wrote:
> Set the V4L2_CAP_IO_MC capability flag to report this vimc
> inputs/outputs are controlled by the media graph.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/vimc/vimc-capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 747ea9cc1bd7cb12..1aaa24d1cf258d42 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -450,7 +450,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  
>  	/* Initialize the video_device struct */
>  	vdev = &vcap->vdev;
> -	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;

Please wrap. Then, for this as the 2nd patch,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  	vdev->entity.ops = &vimc_cap_mops;
>  	vdev->release = video_device_release_empty;
>  	vdev->fops = &vimc_cap_fops;

-- 
Hälsningar,

Sakari Ailus
