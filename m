Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329067DE050
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 12:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbjKAL2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 07:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbjKAL2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 07:28:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C37115
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698838116; x=1730374116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q7WWYee10ZlGDxXKt7zmDSzieHbLuYnPT0+e9NC5eeg=;
  b=iwmmY8npE47DFmrwEfiNEdJzKQxd5uX3W4njE5lkPGUw8+pjZpWNF51V
   7kK5+IVZ6N3J6LiZtJSTTzGAQ00JHsxKUvPHyApmq4crN4WT35WYResHG
   uuvnKuDn1P8zhgBLI5QSx+rJyJ0jsza3SB211MkuyzUb3jFyeby0yY0Jr
   DxCUX8hoUJ1zwpA5MwKUyfwMtTuIAHWlou/lMQhl4m4rK+LVRC2AtoJqE
   KuwGJiP2TdQysUSDmhdcvsvcGBpC7sIIE/i+TFClcETG6UygaVrOlYTYX
   iuTgjiaEnwPBzE6eApnXUzAZlrlF+GvefKvEJNnJrGIeMu8slUGWQCrAl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="373519391"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="373519391"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 04:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="884534116"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="884534116"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 04:28:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C8ECF1207A3;
        Wed,  1 Nov 2023 13:28:30 +0200 (EET)
Date:   Wed, 1 Nov 2023 11:28:30 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Message-ID: <ZUI2Xuqc_GR6MazP@kekkonen.localdomain>
References: <20231101111747.252072-1-alexander.stein@ew.tq-group.com>
 <20231101111747.252072-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101111747.252072-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Wed, Nov 01, 2023 at 12:17:46PM +0100, Alexander Stein wrote:
> Some sensors, e.g. Sony, are using little-endian registers. Add support for
> those by encoding the endianess into Bit 20 of the register address.

Thank you for the patchset. The set seems good to me except that I think
you're missing the corresponding cci_read() changes here.

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/v4l2-core/v4l2-cci.c | 22 ++++++++++++++++++----
>  include/media/v4l2-cci.h           |  5 +++++
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> index bc2dbec019b04..ea33cfd77d895 100644
> --- a/drivers/media/v4l2-core/v4l2-cci.c
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -68,6 +68,7 @@ EXPORT_SYMBOL_GPL(cci_read);
>  
>  int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  {
> +	bool little_endian;
>  	unsigned int len;
>  	u8 buf[8];
>  	int ret;
> @@ -75,6 +76,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> +	little_endian = reg & CCI_REG_LE;
>  	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>  	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
>  
> @@ -83,16 +85,28 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  		buf[0] = val;
>  		break;
>  	case 2:
> -		put_unaligned_be16(val, buf);
> +		if (little_endian)
> +			put_unaligned_le16(val, buf);
> +		else
> +			put_unaligned_be16(val, buf);
>  		break;
>  	case 3:
> -		put_unaligned_be24(val, buf);
> +		if (little_endian)
> +			put_unaligned_le24(val, buf);
> +		else
> +			put_unaligned_be24(val, buf);
>  		break;
>  	case 4:
> -		put_unaligned_be32(val, buf);
> +		if (little_endian)
> +			put_unaligned_le32(val, buf);
> +		else
> +			put_unaligned_be32(val, buf);
>  		break;
>  	case 8:
> -		put_unaligned_be64(val, buf);
> +		if (little_endian)
> +			put_unaligned_le64(val, buf);
> +		else
> +			put_unaligned_be64(val, buf);
>  		break;
>  	default:
>  		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index 0f6803e4b17e9..ef3faf0c9d44d 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -32,12 +32,17 @@ struct cci_reg_sequence {
>  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
>  #define CCI_REG_WIDTH_SHIFT		16
>  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> +#define CCI_REG_LE			BIT(20)
>  
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
> +#define CCI_REG16_LE(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> +#define CCI_REG24_LE(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> +#define CCI_REG32_LE(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> +#define CCI_REG64_LE(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
>  
>  /**
>   * cci_read() - Read a value from a single CCI register

-- 
Regards,

Sakari Ailus
