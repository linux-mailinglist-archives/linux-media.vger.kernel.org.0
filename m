Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF855AD9A1
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 21:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbiIET2c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 15:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiIET2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 15:28:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8458C3D591
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 12:28:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94BA16DF;
        Mon,  5 Sep 2022 21:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662406107;
        bh=mac/XPSYHHzb5FTJCxLanrGwbHs0jKeiIwpNOURK7aQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VBS0FYlWc8uAZBUraZZ+O27ZNbGBrDCtwMyRvJlS7OL9bd472v5QI8xmryYbaYuLg
         mI3gVlXDJed0D1tvpHZR6I4L0NvE0g/LIJOZhNkf11EDS50BfThGJ1AYrLoxI4MZet
         OlHqKC9cd0htH8g7pzwPs29DAnXIFMlatyj88DjQ=
Date:   Mon, 5 Sep 2022 22:28:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: Remove incorrect comment from struct
 v4l2_fwnode_endpoint
Message-ID: <YxZNzHWpenIm/fZh@pendragon.ideasonboard.com>
References: <20220905123712.3259589-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220905123712.3259589-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 05, 2022 at 03:37:12PM +0300, Sakari Ailus wrote:
> struct v4l2_fwnode_endpoint was zeroed previously apart from the endpoint
> information itself when the endpoint properties were parsed. Now this
> hasn't been the case for a few years so remove the comment.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/media/v4l2-fwnode.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 15e4ab6722232..394d798f3dfa4 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -45,10 +45,6 @@ struct v4l2_async_subdev;
>   */
>  struct v4l2_fwnode_endpoint {
>  	struct fwnode_endpoint base;
> -	/*
> -	 * Fields below this line will be zeroed by
> -	 * v4l2_fwnode_endpoint_parse()
> -	 */
>  	enum v4l2_mbus_type bus_type;
>  	struct {
>  		struct v4l2_mbus_config_parallel parallel;

-- 
Regards,

Laurent Pinchart
