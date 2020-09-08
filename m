Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB2E261883
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 19:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731634AbgIHRxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 13:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731603AbgIHQNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 12:13:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965F3C061378
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:49:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A92C91234;
        Tue,  8 Sep 2020 14:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599569252;
        bh=PgGVSy9lrwrjcYPWs2aXswJoh6hHPywFByyBn9i48po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fnVfwrhryZBuMe8Gql19CUnLplWZ+FZZl4lS6DAfslO52lZ4REGAauSUFIaJrpaKn
         h7tNPzsipRF3PjQQATa5A1i1ZZBGcCGcokHHsnXKXkaj3RoCpMo2RfF37q2kUIK1C/
         GxZ08qiPf5PUTKlSodNGTB8F1fV3CXbHhUWY0e5c=
Date:   Tue, 8 Sep 2020 15:47:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: Re: [PATCH 2/3] v4l2-fwnode: Make bus configuration a struct
Message-ID: <20200908124706.GJ6047@pendragon.ideasonboard.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
 <20200908085121.864-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200908085121.864-3-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Sep 08, 2020 at 11:51:20AM +0300, Sakari Ailus wrote:
> The bus specific parameters were an union. This made providing bus
> specific defaults impossible as the memory used to store the defaults for
> multiple different busses was the same.
> 
> Make it struct instead. It's not large so the size isn't really an issue.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-fwnode.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 81e7eb123294..d04f39b60096 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -78,7 +78,7 @@ struct v4l2_fwnode_bus_mipi_csi1 {
>   * struct v4l2_fwnode_endpoint - the endpoint data structure
>   * @base: fwnode endpoint of the v4l2_fwnode
>   * @bus_type: bus type
> - * @bus: union with bus configuration data structure
> + * @bus: bus configuration data structure
>   * @bus.parallel: embedded &struct v4l2_fwnode_bus_parallel.
>   *		  Used if the bus is parallel.
>   * @bus.mipi_csi1: embedded &struct v4l2_fwnode_bus_mipi_csi1.
> @@ -99,7 +99,7 @@ struct v4l2_fwnode_endpoint {
>  	 * v4l2_fwnode_endpoint_parse()
>  	 */
>  	enum v4l2_mbus_type bus_type;
> -	union {
> +	struct {
>  		struct v4l2_fwnode_bus_parallel parallel;
>  		struct v4l2_fwnode_bus_mipi_csi1 mipi_csi1;
>  		struct v4l2_fwnode_bus_mipi_csi2 mipi_csi2;

-- 
Regards,

Laurent Pinchart
