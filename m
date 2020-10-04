Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DD42829AB
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 10:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJDIm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 04:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 04:42:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C01DC0613CE
        for <linux-media@vger.kernel.org>; Sun,  4 Oct 2020 01:42:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 615D02A2;
        Sun,  4 Oct 2020 10:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601800946;
        bh=mWqRu5GhNfStYGdAHYYaDhBTWfjISH90HPLkeF27rZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JhRVBug+pBFxuLmilNr+SfJidprDr08m2Z5ggOAB0tH1Y5obSkftEJ4/4BYZFnR31
         KZKWQXKo48PG2ff1XScQrTElafeqXktjjteWG79TKCvr3sKS9EbvlfwOzuQ/KKeBRb
         Ih7W73SvSN/JkBKYEiyKfuEv8y049UivrbBGIqS0=
Date:   Sun, 4 Oct 2020 11:41:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 5/5] v4l2-fwnode: Say it's fine to use
 v4l2_fwnode_endpoint_parse
Message-ID: <20201004084148.GF3938@pendragon.ideasonboard.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930144811.16612-6-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Sep 30, 2020 at 05:48:11PM +0300, Sakari Ailus wrote:
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
> ---
>  include/media/v4l2-fwnode.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 0c28dc11e829..cbd872e59f8e 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -245,8 +245,8 @@ struct v4l2_fwnode_connector {
>   * The function does not change the V4L2 fwnode endpoint state if it fails.
>   *
>   * NOTE: This function does not parse properties the size of which is variable
> - * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() in
> - * new drivers instead.
> + * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() if
> + * you need properties of variable size.

Shouldn't we explicitly mention link-frequencies ? "properties the size
of which is variable without a low fixed limit" is not very clear for a
casual reader.

>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure

-- 
Regards,

Laurent Pinchart
