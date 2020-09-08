Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBA0261846
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732168AbgIHRvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 13:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731632AbgIHQNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 12:13:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC38C061372
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:44:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C27A239;
        Tue,  8 Sep 2020 14:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599568851;
        bh=WIA0Rdncklw7PEnnn4MSQttOJJ3UsJJY226KgryHRhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nic2hwxWm4qp0rPOT28GorrbKclXiyGwNi+G2pkOzmMkhc5MBzfNqaio8a2MAMiPh
         59BdQzdXhWGvTg5Vb4HjvTgwmAoOLOi3004+UNQNmbiFv/FiVdZ40kSavSMPC5J4uq
         +YBsOnczuZf7IKyCz66X+Xi0cQzWqW9uSlTu3hdM=
Date:   Tue, 8 Sep 2020 15:40:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: Re: [PATCH 1/3] v4l2-fwnode: Make number of data lanes a character
Message-ID: <20200908124026.GH6047@pendragon.ideasonboard.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
 <20200908085121.864-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200908085121.864-2-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Sep 08, 2020 at 11:51:19AM +0300, Sakari Ailus wrote:
> The maximum is currently four (4). No short is needed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-fwnode.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index c47b70636e42..81e7eb123294 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -40,7 +40,7 @@ struct v4l2_fwnode_bus_mipi_csi2 {
>  	unsigned int flags;
>  	unsigned char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
>  	unsigned char clock_lane;
> -	unsigned short num_data_lanes;
> +	unsigned char num_data_lanes;
>  	bool lane_polarities[1 + V4L2_FWNODE_CSI2_MAX_DATA_LANES];

That's a 4 bytes gain, it's useful.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };

-- 
Regards,

Laurent Pinchart
