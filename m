Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E352835EC
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 14:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgJEMsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 08:48:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJEMsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 08:48:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 851663B;
        Mon,  5 Oct 2020 14:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601902095;
        bh=rBZCbmcjqCr9oWrDnt670SPbK5lUTHVX0tF50X4wLoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L8h2rwRnePF3wD1prmn90KbIjnuiSnHs+9cIo9uiP1gbyABGs0HlYz62CMndr7/w7
         k6rTqWL0vlUIhsA2WnKuN2fv+skTBhxUhlfQ25LVsHNzOGDpdpEkCQ5R7XvUt8aa+I
         Dc22MPxlkSkMF9WOd4ieV6YiG4fmImSTMNhb8els=
Date:   Mon, 5 Oct 2020 15:47:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org,
        niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 5/5] v4l2-fwnode: Say it's fine to use
 v4l2_fwnode_endpoint_parse
Message-ID: <20201005124736.GQ3931@pendragon.ideasonboard.com>
References: <20201005080115.8875-1-sakari.ailus@linux.intel.com>
 <20201005080115.8875-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005080115.8875-6-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Oct 05, 2020 at 11:01:15AM +0300, Sakari Ailus wrote:
> Earlier it was expected that there would be more variable size endpoint
> properties and that most if not all drivers would need them. For that
> reason it was expected also that v4l2_fwnode_endpoint_parse would no
> longer be needed.
> 
> What actually happened that not all drivers require "link-frequencies",
> the only variable size media endpoint property without a small upper
> limit. Therefore drivers that do not need that information are fine using
> v4l2_fwnode_endpoint_parse. So don't tell drivers to use
> v4l2_fwnode_endpoint_alloc_parse in all cases.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/media/v4l2-fwnode.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 20b30d770944..be30e066c621 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -245,9 +245,9 @@ struct v4l2_fwnode_connector {
>   *
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
> - * NOTE: This function does not parse properties the size of which is variable
> - * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() in
> - * new drivers instead.
> + * NOTE: This function does not parse "link-frequencies" property as its size is
> + * not known in advance. Please use v4l2_fwnode_endpoint_alloc_parse() if you
> + * need properties of variable size.
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure

-- 
Regards,

Laurent Pinchart
