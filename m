Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D958871FD47
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbjFBJM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbjFBJM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:12:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017EEE48
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:11:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A86E94DA;
        Fri,  2 Jun 2023 11:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685697044;
        bh=t80oncref0OtQB0sEoAAOd0cRgQGuhw3OdMxYTkzLlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DTelII4AjVd5UB7w0RJDwHBqdLrRNYMiXYdAfEUY1de5Mb2UNPXys0ScwpNdOYYjp
         x0VSpfa6YAaVyhW2MzydiaQwzxTxCBYsu7B5lDjcvVh2eaayVZCazw3pJaszPhS0wu
         AdxJwvgQ+x24x8Ff2tsNlbfMrLiMzNkhgLiN2KDU=
Date:   Fri, 2 Jun 2023 12:11:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH 1/2] media: uapi: Make media_entity_get_fwnode_pad()
 fwnode argument const
Message-ID: <20230602091104.GA23701@pendragon.ideasonboard.com>
References: <20230505205416.55002-1-sakari.ailus@linux.intel.com>
 <20230505205416.55002-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505205416.55002-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, May 05, 2023 at 11:54:15PM +0300, Sakari Ailus wrote:
> fwnode_graph_parse_endpoint() fwnode argument is now const, therefore make
> media_entity_get_fwnode_pad() fwnode argument const as well.

"now", since 2017 :-) I'd phrase the commit message as

The media_entity_get_fwnode_pad() function never modifies its fwnode
argument. Make it const to allow usage of the function in contexts where
the fwnode pointer is const.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/mc/mc-entity.c | 2 +-
>  include/media/media-entity.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index c1bc48c4d239..5ea9d3e5d59b 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1426,7 +1426,7 @@ struct media_pad *media_pad_remote_pad_unique(const struct media_pad *pad)
>  EXPORT_SYMBOL_GPL(media_pad_remote_pad_unique);
>  
>  int media_entity_get_fwnode_pad(struct media_entity *entity,
> -				struct fwnode_handle *fwnode,
> +				const struct fwnode_handle *fwnode,
>  				unsigned long direction_flags)
>  {
>  	struct fwnode_endpoint endpoint;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index e4f556911c3f..2b6cd343ee9e 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1079,7 +1079,7 @@ struct media_pipeline *media_pad_pipeline(struct media_pad *pad);
>   * Return: returns the pad number on success or a negative error code.
>   */
>  int media_entity_get_fwnode_pad(struct media_entity *entity,
> -				struct fwnode_handle *fwnode,
> +				const struct fwnode_handle *fwnode,
>  				unsigned long direction_flags);
>  
>  /**

-- 
Regards,

Laurent Pinchart
