Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D667268E5D
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 16:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgINOwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 10:52:20 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:30015 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgINOvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 10:51:49 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8B1A2240007;
        Mon, 14 Sep 2020 14:51:46 +0000 (UTC)
Date:   Mon, 14 Sep 2020 16:55:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se
Subject: Re: [PATCH 3/3] v4l2-fwnode: Document changes usage patterns of
 v4l2_fwnode_endpoint_parse
Message-ID: <20200914145537.f3vqq7l72rlt32kr@uno.localdomain>
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
> + * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!

As per the discussion in:
[PATCH v4 1/3] media: i2c: ov772x: Parse endpoint properties
this leaves a bit of gray area on how to address cases where older dts
do not report any "bus-type" property, as in the case of PARALLEL vs
BT.656 Prabhakar has, it gets impossible to detect mis-configurations.

I have suggested him two different behaviours, depending if 'bus-type'
is present in the fwnode or not, but I'm not sure that's the best way
forward. What do you think ?

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
> --
> 2.27.0
>
