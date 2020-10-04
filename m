Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9562829A4
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 10:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgJDIgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 04:36:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 04:36:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90F4F2A2;
        Sun,  4 Oct 2020 10:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601800571;
        bh=A9WNi4JRjUcAqg1PTcdYJAHcI2Q+uBwBwILSgY+FHL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=anrGiQyuIWSuokYrC4Vo3u9O4fwbT/AOPZsQiZ6xniefhxFWU7+UXQtQIVVqOXIiC
         1NR0kZBS+1jYbZtS43ktUVRQ28Zh2t6TmFIxJjVQNOUW6Y5oRbXY5SPf9+KQfoC/WY
         CnkkLehH+yxD11VMozj8uNEGLR3ccDyeWzkDlIfw=
Date:   Sun, 4 Oct 2020 11:35:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 2/5] v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must
 init vep argument
Message-ID: <20201004083533.GC3938@pendragon.ideasonboard.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930144811.16612-3-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Sep 30, 2020 at 05:48:08PM +0300, Sakari Ailus wrote:
> Document that the caller of v4l2_fwnode_endpoint_parse() must init the
> fields of struct v4l2_fwnode_endpoint (vep argument) fields.
> 
> It used to be that the fields were zeroed by v4l2_fwnode_endpoint_parse
> when bus type was set to V4L2_MBUS_UNKNOWN but with commit bb4bba9232fc
> that no longer makes sense.
> 
> Fixes: bb4bba9232fc ("media: v4l2-fwnode: Make bus configuration a struct")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-fwnode.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index c09074276543..0f9a768b1a8d 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -231,6 +231,8 @@ struct v4l2_fwnode_connector {
>   * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
>   * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
>   *
> + * The caller is required to initialise all fields of @vep.

Would it make sense to explicitly state that fields should be zeroed if
no specific value is desired ? Maybe

 * The caller is required to initialise all fields of @vep, either with
 * explicitly values, or by zeroing them.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
>   * NOTE: This function does not parse properties the size of which is variable
> @@ -273,6 +275,8 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
>   * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
>   *
> + * The caller is required to initialise all fields of @vep.
> + *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
>   * v4l2_fwnode_endpoint_alloc_parse() has two important differences to

-- 
Regards,

Laurent Pinchart
