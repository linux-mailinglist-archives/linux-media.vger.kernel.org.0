Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDB718BF08
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 19:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgCSSGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 14:06:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50420 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCSSGW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 14:06:22 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2134A53;
        Thu, 19 Mar 2020 19:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584641180;
        bh=VVvaLIWzHjPnx7c9DWjDC6foO+LDj42e8xSFQBar0P4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UimCi9VH4MJ4LH+9sfUT3icjCjPFW6O/NFih77tIZyeAKixwX3eS6m7f7ZewK8Zet
         iF6Qhg931tJqVp0tbmVvBFRy2vQJeCANnTFOfjaVdgsMuIfoynUAKBh7xSLxuw783x
         D52R5yQdOPmXEsfCl3yBOwhdZwTXqUynZlF/+f7c=
Date:   Thu, 19 Mar 2020 20:06:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 03/10] media: adv748x: reduce amount of code for
 bitwise modifications of device registers
Message-ID: <20200319180614.GL14585@pendragon.ideasonboard.com>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <099ebaa317156ec8edab973d0445851337139e6b.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <099ebaa317156ec8edab973d0445851337139e6b.1584639664.git.alexander.riesen@cetitec.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Thank you for the patch.

On Thu, Mar 19, 2020 at 06:41:53PM +0100, Alex Riesen wrote:
> The regmap provides a convenient utility for this.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c |  6 ++++++
>  drivers/media/i2c/adv748x/adv748x.h      | 15 ++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 345f009de121..36164a254d7b 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -133,6 +133,12 @@ static int adv748x_write_check(struct adv748x_state *state, u8 page, u8 reg,
>  	return *error;
>  }
>  
> +int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg, u8 mask,
> +			u8 value)
> +{
> +	return regmap_update_bits(state->regmap[page], reg, mask, value);
> +}
> +
>  /* adv748x_write_block(): Write raw data with a maximum of I2C_SMBUS_BLOCK_MAX
>   * size to one or more registers.
>   *
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 09aab4138c3f..c5245464fffc 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -393,25 +393,34 @@ int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
>  int adv748x_write_block(struct adv748x_state *state, int client_page,
>  			unsigned int init_reg, const void *val,
>  			size_t val_len);
> +int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
> +			u8 mask, u8 value);
>  
>  #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
>  #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
> -#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
> +#define io_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
> +#define io_update(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)

Those two are identical. Do we need both ? I would standardize on either
*_update or *_clrset for all the functions here. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
>  #define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, (r)+1)) & (m))
>  #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
> +#define hdmi_update(s, r, m, v) \
> +	adv748x_update_bits(s, ADV748X_PAGE_HDMI, r, m, v)
> +
> +#define dpll_read(s, r) adv748x_read(s, ADV748X_PAGE_DPLL, r)
> +#define dpll_update(s, r, m, v) \
> +	adv748x_update_bits(s, ADV748X_PAGE_DPLL, r, m, v)
>  
>  #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
>  #define repeater_write(s, r, v) adv748x_write(s, ADV748X_PAGE_REPEATER, r, v)
>  
>  #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
>  #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
> -#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~(m)) | (v))
> +#define sdp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_SDP, r, m, v)
>  
>  #define cp_read(s, r) adv748x_read(s, ADV748X_PAGE_CP, r)
>  #define cp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_CP, r, v)
> -#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~(m)) | (v))
> +#define cp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_CP, r, m, v)
>  
>  #define tx_read(t, r) adv748x_read(t->state, t->page, r)
>  #define tx_write(t, r, v) adv748x_write(t->state, t->page, r, v)

-- 
Regards,

Laurent Pinchart
