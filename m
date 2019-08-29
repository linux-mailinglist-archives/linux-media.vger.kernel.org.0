Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1B3A191B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 13:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfH2Lnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 07:43:55 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33221 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726379AbfH2Lny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 07:43:54 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3IqDiRLcaDqPe3IqGiNo4C; Thu, 29 Aug 2019 13:43:52 +0200
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     Matthew Michilot <matthew.michilot@gmail.com>, lars@metafoo.de
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20190827215539.1286-1-mmichilot@gateworks.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl>
Date:   Thu, 29 Aug 2019 13:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827215539.1286-1-mmichilot@gateworks.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBP5gVIkT4EzSUeDh8L+uViMpjIZy24XwL5b54yXH8ordNIc3uJ5k01IjGFumEJrkdXUydOuHRs2G1EiTNVwHb9313a84NPWhDB4O0U3BcUPr/32OzjV
 vPVqnsImdMv8Cas9uBF0a74MPqJZkIMkGXDFf7iaVxPw+Lidd6YaBhNNyDqz6c/bYslb3dCTICWmKyHb1IaMhoLYjLDJc+xpjane7xt/TF5RU7g4pjcxvK10
 Ck8LljuLIfJNbKpVKWer1pVqHMhPKtklev8hLSjM6Zpwe+FJOMTyk6e3qYQVwV3MnjB90VWxy3GfD4h74ojYkDOc0/xQXeThCnKDpPaIXuUSj/wMOrv0PphO
 OOnKTLfw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding Niklas.

Niklas, can you take a look at this?

Regards,

	Hans

On 8/27/19 11:55 PM, Matthew Michilot wrote:
> From: Matthew Michilot <matthew.michilot@gmail.com>
> 
> Captured video would be out of sync when using the adv7280 with
> the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) had to
> be configured properly to ensure BT.656-4 compatibility.
> 
> An error in the adv7280 reference manual suggested that EAV/SAV mode
> was enabled by default, however upon inspecting register 0x31, it was
> determined to be disabled by default.
> 
> Signed-off-by: Matthew Michilot <matthew.michilot@gmail.com>
> Reviewed-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  drivers/media/i2c/adv7180.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 99697baad2ea..27da424dce76 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -94,6 +94,7 @@
>  #define ADV7180_REG_SHAP_FILTER_CTL_1	0x0017
>  #define ADV7180_REG_CTRL_2		0x001d
>  #define ADV7180_REG_VSYNC_FIELD_CTL_1	0x0031
> +#define ADV7180_VSYNC_FIELD_CTL_1_NEWAV 0x12
>  #define ADV7180_REG_MANUAL_WIN_CTL_1	0x003d
>  #define ADV7180_REG_MANUAL_WIN_CTL_2	0x003e
>  #define ADV7180_REG_MANUAL_WIN_CTL_3	0x003f
> @@ -935,10 +936,20 @@ static int adv7182_init(struct adv7180_state *state)
>  		adv7180_write(state, ADV7180_REG_EXTENDED_OUTPUT_CONTROL, 0x57);
>  		adv7180_write(state, ADV7180_REG_CTRL_2, 0xc0);
>  	} else {
> -		if (state->chip_info->flags & ADV7180_FLAG_V2)
> +		if (state->chip_info->flags & ADV7180_FLAG_V2) {
> +			/* ITU-R BT.656-4 compatible */
>  			adv7180_write(state,
>  				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> -				      0x17);
> +				      ADV7180_EXTENDED_OUTPUT_CONTROL_NTSCDIS);
> +			/* Manually set NEWAVMODE */
> +			adv7180_write(state,
> +				      ADV7180_REG_VSYNC_FIELD_CTL_1,
> +				      ADV7180_VSYNC_FIELD_CTL_1_NEWAV);
> +			/* Manually set V bit end position in NTSC mode */
> +			adv7180_write(state,
> +				      ADV7180_REG_NTSC_V_BIT_END,
> +				      ADV7180_NTSC_V_BIT_END_MANUAL_NVEND);
> +		}
>  		else
>  			adv7180_write(state,
>  				      ADV7180_REG_EXTENDED_OUTPUT_CONTROL,
> 

