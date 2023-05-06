Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C4F6F9184
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 13:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbjEFLcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 07:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjEFLcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 07:32:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E387A76A5
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 04:32:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BE01C85;
        Sat,  6 May 2023 13:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683372726;
        bh=LZPvKdI5+JhOYsEH1MgKjNdLwsElcKhLrbNjSnPpKTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tIOoLoBJsSCM+vvpova+Ry1Zdym0hrp0OMnaDWzBghg7mkNhhunR9eyPOwzC/ZO4l
         iC5WDBlOu5S35yJlfOxd1q8ZlUrQB1zH290f+6wOH2dQEOWg28wWfDHzfQXeT2rIvR
         eT2xNBIJre5bBFDGk7uYN+3I6S+juPBSgtn0Vmag=
Date:   Sat, 6 May 2023 14:32:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use unsigned int values for assigning
 bits in u32 fields
Message-ID: <20230506113223.GC17474@pendragon.ideasonboard.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505205101.54569-4-sakari.ailus@linux.intel.com>
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

On Fri, May 05, 2023 at 11:51:01PM +0300, Sakari Ailus wrote:
> Use unsigned int values annoted by "U" for u32 fields. While this is a
> good practice, there doesn't appear to be a bug that this patch would fix.
> 
> The patch has been generated using the following command:
> 
> 	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h

How about using the _BITUL() macro from include/uapi/linux/const.h ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/uapi/linux/media.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 3ddadaea849f..edb8dfef9eba 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -140,8 +140,8 @@ struct media_device_info {
>  #define MEDIA_ENT_F_DV_ENCODER			(MEDIA_ENT_F_BASE + 0x6002)
>  
>  /* Entity flags */
> -#define MEDIA_ENT_FL_DEFAULT			(1 << 0)
> -#define MEDIA_ENT_FL_CONNECTOR			(1 << 1)
> +#define MEDIA_ENT_FL_DEFAULT			(1U << 0)
> +#define MEDIA_ENT_FL_CONNECTOR			(1U << 1)
>  
>  /* OR with the entity id value to find the next entity */
>  #define MEDIA_ENT_ID_FLAG_NEXT			(1U << 31)
> @@ -205,9 +205,9 @@ struct media_entity_desc {
>  	};
>  };
>  
> -#define MEDIA_PAD_FL_SINK			(1 << 0)
> -#define MEDIA_PAD_FL_SOURCE			(1 << 1)
> -#define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
> +#define MEDIA_PAD_FL_SINK			(1U << 0)
> +#define MEDIA_PAD_FL_SOURCE			(1U << 1)
> +#define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */
> @@ -216,14 +216,14 @@ struct media_pad_desc {
>  	__u32 reserved[2];
>  };
>  
> -#define MEDIA_LNK_FL_ENABLED			(1 << 0)
> -#define MEDIA_LNK_FL_IMMUTABLE			(1 << 1)
> -#define MEDIA_LNK_FL_DYNAMIC			(1 << 2)
> +#define MEDIA_LNK_FL_ENABLED			(1U << 0)
> +#define MEDIA_LNK_FL_IMMUTABLE			(1U << 1)
> +#define MEDIA_LNK_FL_DYNAMIC			(1U << 2)
>  
>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
> -#  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
> -#  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
> -#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
> +#  define MEDIA_LNK_FL_DATA_LINK		(0U << 28)
> +#  define MEDIA_LNK_FL_INTERFACE_LINK		(1U << 28)
> +#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2U << 28)
>  
>  struct media_link_desc {
>  	struct media_pad_desc source;
> @@ -293,7 +293,7 @@ struct media_links_enum {
>   * struct media_device_info.
>   */
>  #define MEDIA_V2_ENTITY_HAS_FLAGS(media_version) \
> -	((media_version) >= ((4 << 16) | (19 << 8) | 0))
> +	((media_version) >= ((4U << 16) | (19U << 8) | 0))
>  
>  struct media_v2_entity {
>  	__u32 id;
> @@ -328,7 +328,7 @@ struct media_v2_interface {
>   * struct media_device_info.
>   */
>  #define MEDIA_V2_PAD_HAS_INDEX(media_version) \
> -	((media_version) >= ((4 << 16) | (19 << 8) | 0))
> +	((media_version) >= ((4U << 16) | (19U << 8) | 0))
>  
>  struct media_v2_pad {
>  	__u32 id;
> @@ -432,7 +432,7 @@ struct media_v2_topology {
>  #define MEDIA_INTF_T_ALSA_TIMER                (MEDIA_INTF_T_ALSA_BASE + 7)
>  
>  /* Obsolete symbol for media_version, no longer used in the kernel */
> -#define MEDIA_API_VERSION			((0 << 16) | (1 << 8) | 0)
> +#define MEDIA_API_VERSION			((0U << 16) | (1U << 8) | 0)
>  
>  #endif
>  

-- 
Regards,

Laurent Pinchart
