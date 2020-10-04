Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215A22829A6
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 10:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDIkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 04:40:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 04:40:53 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D806B2A2;
        Sun,  4 Oct 2020 10:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601800852;
        bh=Qeo5gmyB9R1jBo0KmhVegGk2RLOrvia8g9u/Pf0cvto=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TuOP3nQmrgSoJRc7pak/6Y5ECOKfqjwz9VIGBqAR5ZAGFJKbltW+M7WMH3DDHIDpp
         /NVFvemV/u7xzWp2ZhGBC5p3P3y6PUBDrlKtgk/zrBrQcvavl5R+bzW81+2UIG4MDk
         UazZOtyFpx5T+SX6s9/PtcgWyQwWBy/UIhG6bzgk=
Date:   Sun, 4 Oct 2020 11:40:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 4/5] v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse
 documentation
Message-ID: <20201004084013.GE3938@pendragon.ideasonboard.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930144811.16612-5-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Sep 30, 2020 at 05:48:10PM +0300, Sakari Ailus wrote:
> Rework the documentation of v4l2_fwnode_endpoint_parse for better
> readability, usefulness and correctness.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-fwnode.h | 62 ++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 0f9a768b1a8d..0c28dc11e829 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -219,17 +219,26 @@ struct v4l2_fwnode_connector {
>   * @vep: pointer to the V4L2 fwnode data structure
>   *
>   * This function parses the V4L2 fwnode endpoint specific parameters from the
> - * firmware. The caller is responsible for assigning @vep.bus_type to a valid
> - * media bus type. The caller may also set the default configuration for the
> - * endpoint --- a configuration that shall be in line with the DT binding
> - * documentation. Should a device support multiple bus types, the caller may
> - * call this function once the correct type is found --- with a default
> - * configuration valid for that type.
> - *
> - * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> - * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> - * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
> - * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
> + * firmware. There are two ways to use this function, either by letting it
> + * obtain the type of the bus (by setting the @vep.bus_type field to
> + * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
> + * v4l2_mbus_type types.
> + *
> + * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
> + * property to determine the type when it is available. The caller is
> + * responsible for validating the contents of @vep.bus_type field after the call
> + * returns.

As an additional improvement, I wonder if it would make sense to turn
the bus types into a bit flag, to let the caller tell which bus types it
supports. Or maybe that would be overkill ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *
> + * As a deprecated functionality to support older DT bindings without "bus-type"
> + * property for devices that support multiple types, if the "bus-type" property
> + * does not exist, the function will attempt to guess the type based on the
> + * endpoint properties available. NEVER RELY ON GUESSING THE BUS TYPE IN NEW
> + * DRIVERS OR BINDINGS.
> + *
> + * It is also possible to set @vep.bus_type corresponding to an actual bus. In
> + * this case the function will only attempt to parse properties related to this
> + * bus, and it will return an error if the value of the "bus-type" property
> + * corresponds to a different bus.
>   *
>   * The caller is required to initialise all fields of @vep.
>   *
> @@ -263,17 +272,26 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   * @vep: pointer to the V4L2 fwnode data structure
>   *
>   * This function parses the V4L2 fwnode endpoint specific parameters from the
> - * firmware. The caller is responsible for assigning @vep.bus_type to a valid
> - * media bus type. The caller may also set the default configuration for the
> - * endpoint --- a configuration that shall be in line with the DT binding
> - * documentation. Should a device support multiple bus types, the caller may
> - * call this function once the correct type is found --- with a default
> - * configuration valid for that type.
> - *
> - * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> - * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> - * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
> - * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
> + * firmware. There are two ways to use this function, either by letting it
> + * obtain the type of the bus (by setting the @vep.bus_type field to
> + * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
> + * v4l2_mbus_type types.
> + *
> + * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
> + * property to determine the type when it is available. The caller is
> + * responsible for validating the contents of @vep.bus_type field after the call
> + * returns.
> + *
> + * As a deprecated functionality to support older DT bindings without "bus-type"
> + * property for devices that support multiple types, if the "bus-type" property
> + * does not exist, the function will attempt to guess the type based on the
> + * endpoint properties available. NEVER RELY ON GUESSING THE BUS TYPE IN NEW
> + * DRIVERS OR BINDINGS.
> + *
> + * It is also possible to set @vep.bus_type corresponding to an actual bus. In
> + * this case the function will only attempt to parse properties related to this
> + * bus, and it will return an error if the value of the "bus-type" property
> + * corresponds to a different bus.
>   *
>   * The caller is required to initialise all fields of @vep.
>   *

-- 
Regards,

Laurent Pinchart
