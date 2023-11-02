Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6602A7DE9F3
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 02:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjKBBWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 21:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbjKBBWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 21:22:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636C583;
        Wed,  1 Nov 2023 18:22:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FB5A7E2;
        Thu,  2 Nov 2023 02:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698888114;
        bh=qdbMgBs52Q5FWNeH18btMEz6KCC7SW8GqNt9GXwQMIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sjIYaesTodnDaP3pQ9uCNPIvEgEt68vNCfQLv+f29q76R+evzH5Ef8v51pck67xHl
         eg+ppAMMeVoAvs2cbc1B2uONfcSLyXjggEaEYYLfcvkyDBpDiJJUCtmEs365wpVf99
         febwwygck9dxFf8rK8HpsSEm8hDTjAsoPpk+0D3U=
Date:   Thu, 2 Nov 2023 03:22:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Message-ID: <20231102012217.GC5933@pendragon.ideasonboard.com>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
 <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> Some sensors, e.g. Sony, are using little-endian registers. Add support for

I would write Sony IMX290 here, as there are Sony sensors that use big
endian.

> those by encoding the endianess into Bit 20 of the register address.
> 
> Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
>  include/media/v4l2-cci.h           |  5 ++++
>  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> index bc2dbec019b04..673637b67bf67 100644
> --- a/drivers/media/v4l2-core/v4l2-cci.c
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -18,6 +18,7 @@
>  
>  int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>  {
> +	bool little_endian;
>  	unsigned int len;
>  	u8 buf[8];
>  	int ret;
> @@ -25,6 +26,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> +	little_endian = reg & CCI_REG_LE;

You could initialize the variable when declaring it. Same below.

>  	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>  	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
>  
> @@ -40,16 +42,28 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>  		*val = buf[0];
>  		break;
>  	case 2:
> -		*val = get_unaligned_be16(buf);
> +		if (little_endian)
> +			*val = get_unaligned_le16(buf);
> +		else
> +			*val = get_unaligned_be16(buf);

Unrelated to this patch, isn't buf aligned to a 4 bytes boundary ?

>  		break;
>  	case 3:
> -		*val = get_unaligned_be24(buf);
> +		if (little_endian)
> +			*val = get_unaligned_le24(buf);
> +		else
> +			*val = get_unaligned_be24(buf);
>  		break;
>  	case 4:
> -		*val = get_unaligned_be32(buf);
> +		if (little_endian)
> +			*val = get_unaligned_le32(buf);
> +		else
> +			*val = get_unaligned_be32(buf);
>  		break;
>  	case 8:
> -		*val = get_unaligned_be64(buf);
> +		if (little_endian)
> +			*val = get_unaligned_le64(buf);
> +		else
> +			*val = get_unaligned_be64(buf);
>  		break;
>  	default:
>  		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
> @@ -68,6 +82,7 @@ EXPORT_SYMBOL_GPL(cci_read);
>  
>  int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  {
> +	bool little_endian;
>  	unsigned int len;
>  	u8 buf[8];
>  	int ret;
> @@ -75,6 +90,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> +	little_endian = reg & CCI_REG_LE;
>  	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>  	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
>  
> @@ -83,16 +99,28 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
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

I would put CCI_REG_LE first, to match the bits order.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  /**
>   * cci_read() - Read a value from a single CCI register

-- 
Regards,

Laurent Pinchart
