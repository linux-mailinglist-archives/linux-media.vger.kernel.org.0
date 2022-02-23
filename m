Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17FDD4C12A6
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239950AbiBWMWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237783AbiBWMWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:22:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B237B4ECEF
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:21:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44B0CDD;
        Wed, 23 Feb 2022 13:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645618905;
        bh=xzZvwZmUXWAvOrXhW1Rd16e0V9N18fzHxk5DPre/ExI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GClABu5NPCLvkPiuRuQw9J0EFvXx9Y3k2IwKp33uHLqG7tm/1Dm/CWyN1b//sa4hK
         dSDqvk12w8iktla6kESU565zNjLDuUP6MZs48fvPQnX9WjJXUThKSkSEPzK+L0QX2E
         2h4Jhsh4RwTWAod07qWYbVZiUCNolNmWEaVZAqlA=
Date:   Wed, 23 Feb 2022 14:21:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] v4l: fwnode: Drop redunant -ENODATA check in
 property reference parsing
Message-ID: <YhYmz6Wzw+BflnYx@pendragon.ideasonboard.com>
References: <20220223115434.21316-1-sakari.ailus@linux.intel.com>
 <20220223115434.21316-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223115434.21316-2-sakari.ailus@linux.intel.com>
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

On Wed, Feb 23, 2022 at 01:54:33PM +0200, Sakari Ailus wrote:
> The check of -ENODATA return value from
> fwnode_property_get_reference_args() was made redundant by commit
> c343bc2ce2c6 ("ACPI: properties: Align return codes of
> __acpi_node_get_property_reference()"). -ENOENT remains to be used to
> signal there are no further entries.
> 
> Remove the check for -ENODATA.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 71dcc9a96535..ae140443847b 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -903,11 +903,7 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
>  	if (!index)
>  		return -ENOENT;
>  
> -	/*
> -	 * Note that right now both -ENODATA and -ENOENT may signal
> -	 * out-of-bounds access. Return the error in cases other than that.
> -	 */
> -	if (ret != -ENOENT && ret != -ENODATA)
> +	if (ret != -ENOENT)
>  		return ret;
>  
>  	for (index = 0;

-- 
Regards,

Laurent Pinchart
