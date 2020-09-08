Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9B2261DE2
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbgIHTna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730882AbgIHPwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:52:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3F1C06137D
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:53:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F1F01243;
        Tue,  8 Sep 2020 14:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599569495;
        bh=1fuidRjC0DHM6T/NBZMDlo/GZMtzQ+7b9XcuIyeMLI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K3ZsFdUr89sW8xGa8vxofTTX3vKejPVma0nq+9g2sXP7gq43+kdgJ+E1pmRN3ztnj
         7d3ZDwr/NALQxr5xVqCD8+AkgWjVfROosXvE6O4vGzo3hMayb9aXpp344Q4YjtlF/I
         kYAyHQ59v1abukiOJQR+HWYkrG88M95D7N9Wh51I=
Date:   Tue, 8 Sep 2020 15:51:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: Re: [PATCH 3/3] v4l2-fwnode: Document changes usage patterns of
 v4l2_fwnode_endpoint_parse
Message-ID: <20200908125107.GK6047@pendragon.ideasonboard.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
 <20200908085121.864-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200908085121.864-4-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Sep 08, 2020 at 11:51:21AM +0300, Sakari Ailus wrote:
> Document that it is possible to provide defaults for multiple bus types to
> v4l2_fwnode_endpoint_parse and v4l2_fwnode_endpoint_alloc_parse. Also
> underline the fact that detecting the bus type without bus-type property
> is only for the old drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-fwnode.h | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index d04f39b60096..ccaa5693df14 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -226,11 +226,10 @@ struct v4l2_fwnode_connector {
>   * call this function once the correct type is found --- with a default
>   * configuration valid for that type.
>   *
> - * As a compatibility means guessing the bus type is also supported by setting
> - * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
> - * configuration in this case as the defaults are specific to a given bus type.
> - * This functionality is deprecated and should not be used in new drivers and it
> - * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.
> + * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> + * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> + * guessing @vep.bus_type between CSI-2 D-PHY, parallel and Bt.656 busses is

While at it, s/Bt/BT/.

> + * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!

That's fairly clear :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wonder if, as a further improvement, we should turn the enum
v4l2_mbus_type into a bitfield, to let drivers tell which bus types they
support. The helpers could then return an error if the bus type reported
by the firmware doesn't match.

>   *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
> @@ -269,11 +268,10 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   * call this function once the correct type is found --- with a default
>   * configuration valid for that type.
>   *
> - * As a compatibility means guessing the bus type is also supported by setting
> - * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
> - * configuration in this case as the defaults are specific to a given bus type.
> - * This functionality is deprecated and should not be used in new drivers and it
> - * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.
> + * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> + * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> + * guessing @vep.bus_type between CSI-2 D-PHY, parallel and Bt.656 busses is
> + * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
>   *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *

-- 
Regards,

Laurent Pinchart
