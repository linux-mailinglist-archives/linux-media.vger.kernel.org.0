Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D63A6FA383
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 11:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjEHJlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 05:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbjEHJlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 05:41:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE294233
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 02:40:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net [126.90.219.15])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A07C755;
        Mon,  8 May 2023 11:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683538844;
        bh=QG+h8Y9Pn/m4QMEq33jnPrUsaIQR09h6DWjTcdanGoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u4om92YdZ0UBeNUMAXmlS5T1BcykokrER24lFilcQlnZujIK1z53O6FikT4OqZOR+
         KY8WXLJM93E+frK3AxndLgbQyeZoR1FjVmNSjsGQL6YmzoeNBAkHe2TGnVqzD5oy7C
         yXZXCdDFe+wb6ynhAXKoSiJFmGsO0QpwEzAxjbEM=
Date:   Mon, 8 May 2023 12:41:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use _BITUL macro for assigning bits in
 u32 fields
Message-ID: <20230508094102.GW23514@pendragon.ideasonboard.com>
References: <20230508091753.80803-1-sakari.ailus@linux.intel.com>
 <20230508091753.80803-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230508091753.80803-4-sakari.ailus@linux.intel.com>
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

On Mon, May 08, 2023 at 12:17:53PM +0300, Sakari Ailus wrote:
> Use _BITUL macro for assigning bits in u32 fields. While this is a good
> practice, there doesn't appear to be a bug that this patch would fix. For
> multi-bit fields, use U notation (for unsigned int).
> 
> The patch has been generated using the following command:
> 
> 	perl -i -pe 's/\([0-9]+\K <</U <</g;
> 		s/\(1U\s*<<\s*([0-9]+)\)$/_BITUL($1)/
> 			if ! /MEDIA_LNK_FL_INTERFACE_LINK/
> 		s/\|\s*0\K\)/U\)/' --
> 		include/uapi/linux/media.h
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This could have been two patches are you make two unrelated
modifications, but I don't mind much.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/uapi/linux/media.h | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 3ddadaea849f..370d0135780a 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -140,11 +140,11 @@ struct media_device_info {
>  #define MEDIA_ENT_F_DV_ENCODER			(MEDIA_ENT_F_BASE + 0x6002)
>  
>  /* Entity flags */
> -#define MEDIA_ENT_FL_DEFAULT			(1 << 0)
> -#define MEDIA_ENT_FL_CONNECTOR			(1 << 1)
> +#define MEDIA_ENT_FL_DEFAULT			_BITUL(0)
> +#define MEDIA_ENT_FL_CONNECTOR			_BITUL(1)
>  
>  /* OR with the entity id value to find the next entity */
> -#define MEDIA_ENT_ID_FLAG_NEXT			(1U << 31)
> +#define MEDIA_ENT_ID_FLAG_NEXT			_BITUL(31)
>  
>  struct media_entity_desc {
>  	__u32 id;
> @@ -205,9 +205,9 @@ struct media_entity_desc {
>  	};
>  };
>  
> -#define MEDIA_PAD_FL_SINK			(1 << 0)
> -#define MEDIA_PAD_FL_SOURCE			(1 << 1)
> -#define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
> +#define MEDIA_PAD_FL_SINK			_BITUL(0)
> +#define MEDIA_PAD_FL_SOURCE			_BITUL(1)
> +#define MEDIA_PAD_FL_MUST_CONNECT		_BITUL(2)
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
> +#define MEDIA_LNK_FL_ENABLED			_BITUL(0)
> +#define MEDIA_LNK_FL_IMMUTABLE			_BITUL(1)
> +#define MEDIA_LNK_FL_DYNAMIC			_BITUL(2)
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
> +	((media_version) >= ((4U << 16) | (19U << 8) | 0U))
>  
>  struct media_v2_entity {
>  	__u32 id;
> @@ -328,7 +328,7 @@ struct media_v2_interface {
>   * struct media_device_info.
>   */
>  #define MEDIA_V2_PAD_HAS_INDEX(media_version) \
> -	((media_version) >= ((4 << 16) | (19 << 8) | 0))
> +	((media_version) >= ((4U << 16) | (19U << 8) | 0U))
>  
>  struct media_v2_pad {
>  	__u32 id;
> @@ -432,7 +432,7 @@ struct media_v2_topology {
>  #define MEDIA_INTF_T_ALSA_TIMER                (MEDIA_INTF_T_ALSA_BASE + 7)
>  
>  /* Obsolete symbol for media_version, no longer used in the kernel */
> -#define MEDIA_API_VERSION			((0 << 16) | (1 << 8) | 0)
> +#define MEDIA_API_VERSION			((0U << 16) | (1U << 8) | 0U)
>  
>  #endif
>  

-- 
Regards,

Laurent Pinchart
