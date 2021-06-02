Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA15398979
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 14:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhFBM2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 08:28:06 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52677 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229967AbhFBM2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 08:28:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oPwvlEZNQEXL0oPwzly1EE; Wed, 02 Jun 2021 14:26:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622636781; bh=N85VKtn9wJonVlgYeXdvu3m47bpTaH/6hh+Zm+d32zs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cDjWmYHTks9YR/k8X93AUTmPvKd0TFCrzBj8U41g/pL7h3DPCmD0LiO3F/d3687U1
         DjY4HoQJtvq9323WPFFWSSNlubIWMVMHjAsxQdDsjS+0xVBn+P8iA3J/gKnONCOV1j
         Ltz/6YCiqLF/J1iOkKZyJol7z3QYgylziobDrstsX1gEqRfAP05xxhIhFxCs/KMaLp
         Mw1xbldCE0z+wQ6faKCbBP2/jN71DrMIQeJ43MG6nZvi+JKnlsUtIN4n76mIJWxRCh
         MeT1RrraKtwpQYvrYJml7TuARAKVq+ysuXqoCTA9+YYgzCWhWLaByBsxHunstc6694
         Nu+w3JSItigRw==
Subject: Re: [PATCH 7/9] media: v4l2-dv-timings: Add more CEA/CTA-861 video
 format timings
To:     Nelson Costa <Nelson.Costa@synopsys.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <6a0dcbd4f6dae00c664e5ef80cde3f1eb530c382.1622631488.git.nelson.costa@synopsys.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d4b681b1-7bac-7b6f-fd44-5beb68d3f820@xs4all.nl>
Date:   Wed, 2 Jun 2021 14:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6a0dcbd4f6dae00c664e5ef80cde3f1eb530c382.1622631488.git.nelson.costa@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGNtO+FKyU4pELbPrH45srN95DITL2+zf0PnlJNSqDTN9yHmdUDkgfLkEAjX1WIIYKyZGt5Tm683TBfcwTc6jraZr3AXiM5F9tNJdfP0ktW12/lZbjjY
 mHOrow3kT0mR5JQXn6MQeAKseEo5nyq5fIkWVrDGHTNDOBPG80suSHzKutOspLIgqpAnwJBSQ3dgdg3vdHkUO2eXw3Xna8lMtqFDyQVbrQ7EXj+43H30nNSR
 7tiKmExSlx9ZR/x5CuN0FESWqI3J3xsZQYBoFuk4sLdTtc+ie7nV9xoi0k3hLyZXpVJ6EQnNt0jfEEc+RmL4kyOUwATwqOeqbxL7Ktm1dKQ0Kxzx2dq3mP3R
 W3HPynlnRXTkj88wTHONNjUkaWWJ+EjAaY1ipeHDRvO4YlgXmfX9s/3xAmeJdaY2S8zif4bAg5cXkglTuXtWRm953MtorxaLqHVveTx+cUDDX03U5Vnl+CGS
 B3BhBawXWfcjU8BTjIZAKyFeNrAkO9EqIfLkwlUtiUsYONVK3IHnggi28kg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nelson,

On 02/06/2021 13:24, Nelson Costa wrote:
> This extends the support for more video format timings based
> on SPECs CEA-861-F and CTA-861-G.
> 
> NOTE: For the newer SPECs the CEA was unified to the CTA.
> The CTA-861-G then includes the CEA-861-F timings besides
> the new timings that are specified.
> 
> CEA-861-F: Specifies the Video timings for VICs 1-107.
> CTA-861-G: Specifies the Video timings for VICs 1-107, 108-127, 193-219.
> 
> With this patch, the array v4l2_dv_timings_presets has support for
> all video timings specified in CTA-861-G.
> 
> Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
> ---
>  drivers/media/v4l2-core/v4l2-dv-timings.c |  139 +++
>  include/uapi/linux/v4l2-dv-timings.h      | 1595 ++++++++++++++++++++++++++++-

I prefer to split this up in two patches, one for each header.

The v4l2-dv-timings.h changes look good (my compliments for all the
work you put into that!).

I am more concerned about adding all these timings to v4l2_dv_timings_presets.

There are really two different things going on here: the v4l2_dv_timings_presets
array is used both by v4l2_enum_dv_timings_cap() to list supported commonly used
timings, or to match against timings parameters (v4l2_find_dv_timings_cap()), and
as a lookup table when receiving a specific VIC code (v4l2_find_dv_timings_cea861_vic()).

All the new timings you added are really only relevant in the last case when you
have the vic code.

I think it is better to create a second array v4l2_dv_timings_non_square_vics[]
(or a better name!) that contains these timings.

Then if v4l2_find_dv_timings_cea861_vic() can't find the vic in the presets table
it will look for it in the new table.

For the 'variable vertical total lines timings' there probably should be a new
arg added to the v4l2_find_dv_timings_cea861_vic() parameter list with the
detected number of lines, and v4l2_find_dv_timings_cea861_vic() can use that
to find the correct VTOT variant.

Another issue I have is that I am unsure about the pixel repetition support in
current HDMI receiver drivers. I've never tested this, and so I am not sure
what will happen if you transmit such a format. Have you tested this yourself?

I wonder if support for such VICs should be optional, perhaps again through
an argument to v4l2_find_dv_timings_cea861_vic() so drivers can decide to
support such formats or not.

Regards,

	Hans

>  2 files changed, 1733 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
> index 230d65a..0766e0c 100644
> --- a/drivers/media/v4l2-core/v4l2-dv-timings.c
> +++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
> @@ -133,6 +133,145 @@ const struct v4l2_dv_timings v4l2_dv_timings_presets[] = {
>  	V4L2_DV_BT_CEA_4096X2160P50,
>  	V4L2_DV_BT_DMT_4096X2160P59_94_RB,
>  	V4L2_DV_BT_CEA_4096X2160P60,
> +	V4L2_DV_BT_CEA_720X480P60_PA16_9,
> +	V4L2_DV_BT_CEA_720X480I60_PA16_9,
> +	V4L2_DV_BT_CEA_720X240P60_VTOT262_PA4_3,
> +	V4L2_DV_BT_CEA_720X240P60_VTOT263_PA4_3,
> +	V4L2_DV_BT_CEA_720X240P60_VTOT262_PA16_9,
> +	V4L2_DV_BT_CEA_720X240P60_VTOT263_PA16_9,
> +	V4L2_DV_BT_CEA_2880X480I60_PA4_3,
> +	V4L2_DV_BT_CEA_2880X480I60_PA16_9,
> +	V4L2_DV_BT_CEA_2880X240P60_VTOT262_PA4_3,
> +	V4L2_DV_BT_CEA_2880X240P60_VTOT263_PA4_3,
> +	V4L2_DV_BT_CEA_2880X240P60_VTOT262_PA16_9,
> +	V4L2_DV_BT_CEA_2880X240P60_VTOT263_PA16_9,
> +	V4L2_DV_BT_CEA_1440X480P60_PA4_3,
> +	V4L2_DV_BT_CEA_1440X480P60_PA16_9,
> +	V4L2_DV_BT_CEA_720X576P50_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080I50_PA16_9,
> +	V4L2_DV_BT_CEA_720X576I50_PA16_9,
> +	V4L2_DV_BT_CEA_720X288P50_VTOT312_PA4_3,
> +	V4L2_DV_BT_CEA_720X288P50_VTOT313_PA4_3,
> +	V4L2_DV_BT_CEA_720X288P50_VTOT314_PA4_3,
> +	V4L2_DV_BT_CEA_720X288P50_VTOT312_PA16_9,
> +	V4L2_DV_BT_CEA_720X288P50_VTOT313_PA16_9,
> +	V4L2_DV_BT_CEA_720X288P50_VTOT314_PA16_9,
> +	V4L2_DV_BT_CEA_2880X576I50_PA4_3,
> +	V4L2_DV_BT_CEA_2880X576I50_PA16_9,
> +	V4L2_DV_BT_CEA_2880X288P50_VTOT312_PA4_3,
> +	V4L2_DV_BT_CEA_2880X288P50_VTOT313_PA4_3,
> +	V4L2_DV_BT_CEA_2880X288P50_VTOT314_PA4_3,
> +	V4L2_DV_BT_CEA_2880X288P50_VTOT312_PA16_9,
> +	V4L2_DV_BT_CEA_2880X288P50_VTOT313_PA16_9,
> +	V4L2_DV_BT_CEA_2880X288P50_VTOT314_PA16_9,
> +	V4L2_DV_BT_CEA_1440X576P50_PA4_3,
> +	V4L2_DV_BT_CEA_1440X576P50_PA16_9,
> +	V4L2_DV_BT_CEA_2880X480P60_PA4_3,
> +	V4L2_DV_BT_CEA_2880X480P60_PA16_9,
> +	V4L2_DV_BT_CEA_2880X576P50_PA4_3,
> +	V4L2_DV_BT_CEA_2880X576P50_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080I50_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080I100_PA16_9,
> +	V4L2_DV_BT_CEA_1280X720P100_PA16_9,
> +	V4L2_DV_BT_CEA_720X576P100_PA4_3,
> +	V4L2_DV_BT_CEA_720X576P100_PA16_9,
> +	V4L2_DV_BT_CEA_1440X576I100_PA4_3,
> +	V4L2_DV_BT_CEA_1440X576I100_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080I120_PA16_9,
> +	V4L2_DV_BT_CEA_1280X720P120_PA16_9,
> +	V4L2_DV_BT_CEA_720X480P120_PA4_3,
> +	V4L2_DV_BT_CEA_720X480P120_PA16_9,
> +	V4L2_DV_BT_CEA_1440X480I120_PA4_3,
> +	V4L2_DV_BT_CEA_1440X480I120_PA16_9,
> +	V4L2_DV_BT_CEA_720X576P200_PA4_3,
> +	V4L2_DV_BT_CEA_720X576P200_PA16_9,
> +	V4L2_DV_BT_CEA_1440X576I200_PA4_3,
> +	V4L2_DV_BT_CEA_1440X576I200_PA16_9,
> +	V4L2_DV_BT_CEA_720X480P240_PA4_3,
> +	V4L2_DV_BT_CEA_720X480P240_PA16_9,
> +	V4L2_DV_BT_CEA_1440X480I240_PA4_3,
> +	V4L2_DV_BT_CEA_1440X480I240_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080P120_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080P100_PA16_9,
> +	V4L2_DV_BT_CEA_1280X720P24_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P25_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P30_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P50_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P60_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P100_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P120_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P24_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P25_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P30_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P50_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P60_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P100_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P120_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P24_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P25_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P30_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P50_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P60_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P100_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P120_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P24_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P25_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P30_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P50_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P60_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P100_PA64_27,
> +	V4L2_DV_BT_CEA_2560X1080P120_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P24_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P25_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P30_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P50_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P60_PA64_27,
> +	V4L2_DV_BT_CEA_1280X720P48_PA16_9,
> +	V4L2_DV_BT_CEA_1280X720P48_PA64_27,
> +	V4L2_DV_BT_CEA_1680X720P48_PA64_27,
> +	V4L2_DV_BT_CEA_1920X1080P48_PA16_9,
> +	V4L2_DV_BT_CEA_1920X1080P48_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P48_PA16_9,
> +	V4L2_DV_BT_CEA_4096X2160P48_PA256_135,
> +	V4L2_DV_BT_CEA_3840X2160P48_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P100_PA16_9,
> +	V4L2_DV_BT_CEA_3840X2160P120_PA16_9,
> +	V4L2_DV_BT_CEA_3840X2160P100_PA64_27,
> +	V4L2_DV_BT_CEA_3840X2160P120_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P24_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P25_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P30_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P48_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P50_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P60_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P100_PA64_27,
> +	V4L2_DV_BT_CEA_5120X2160P120_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P24_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P25_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P30_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P48_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P50_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P60_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P100_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P120_PA16_9,
> +	V4L2_DV_BT_CEA_7680X4320P24_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P25_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P30_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P48_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P50_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P60_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P100_PA64_27,
> +	V4L2_DV_BT_CEA_7680X4320P120_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P24_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P25_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P30_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P48_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P50_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P60_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P100_PA64_27,
> +	V4L2_DV_BT_CEA_10240X4320P120_PA64_27,
> +	V4L2_DV_BT_CEA_4096X2160P100_PA256_135,
> +	V4L2_DV_BT_CEA_4096X2160P120_PA256_135,
>  	{ }
>  };
>  EXPORT_SYMBOL_GPL(v4l2_dv_timings_presets);
> diff --git a/include/uapi/linux/v4l2-dv-timings.h b/include/uapi/linux/v4l2-dv-timings.h
> index b52b67c..900530b 100644
> --- a/include/uapi/linux/v4l2-dv-timings.h
> +++ b/include/uapi/linux/v4l2-dv-timings.h
> @@ -29,7 +29,14 @@
>  	.bt = { _width , ## args }
>  #endif
>  
> -/* CEA-861-F timings (i.e. standard HDTV timings) */
> +/* CEA-861-F timings (i.e. standard HDTV timings)
> + * NOTE: For the newer SPECs the CEA was unified to the CTA.
> + * The CTA-861-G includes the CEA-861-F timings besides the
> + * new timings that are specified.
> + *
> + * CEA-861-F: Specifies the Video timings for VICs 1-107
> + * CTA-861-G: Specifies the Video timings for VICs 1-107, 108-127, 193-219
> + */
>  
>  #define V4L2_DV_BT_CEA_640X480P59_94 { \
>  	.type = V4L2_DV_BT_656_1120, \
> @@ -297,6 +304,1592 @@
>  		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 102) \
>  }
>  
> +/* VIC=3 */
> +#define V4L2_DV_BT_CEA_720X480P60_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 480, 0, 0, \
> +		27000000, 16, 62, 60, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 3) \
> +}
> +
> +/* VIC=7 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X480I60_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 480, 1, 0, \
> +		13500000, 19, 62, 57, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 7) \
> +}
> +
> +/* VIC=8 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X240P60_VTOT262_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 240, 0, 0, \
> +		13500000, 19, 62, 57, 4, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 8) \
> +}
> +
> +/* VIC=8 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X240P60_VTOT263_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 240, 0, 0, \
> +		13500000, 19, 62, 57, 5, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 8) \
> +}
> +
> +/* VIC=9 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X240P60_VTOT262_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 240, 0, 0, \
> +		13500000, 19, 62, 57, 4, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 9) \
> +}
> +
> +/* VIC=9 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X240P60_VTOT263_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 240, 0, 0, \
> +		13500000, 19, 62, 57, 5, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 9) \
> +}
> +
> +/* VIC=10 */
> +#define V4L2_DV_BT_CEA_2880X480I60_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 480, 1, 0, \
> +		54000000, 76, 248, 228, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 10) \
> +}
> +
> +/* VIC=11 */
> +#define V4L2_DV_BT_CEA_2880X480I60_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 480, 1, 0, \
> +		54000000, 76, 248, 228, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 11) \
> +}
> +
> +/* VIC=12 */
> +#define V4L2_DV_BT_CEA_2880X240P60_VTOT262_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 240, 0, 0, \
> +		54000000, 76, 248, 228, 4, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 12) \
> +}
> +
> +/* VIC=12 */
> +#define V4L2_DV_BT_CEA_2880X240P60_VTOT263_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 240, 0, 0, \
> +		54000000, 76, 248, 228, 5, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 12) \
> +}
> +
> +/* VIC=13 */
> +#define V4L2_DV_BT_CEA_2880X240P60_VTOT262_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 240, 0, 0, \
> +		54000000, 76, 248, 228, 4, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 13) \
> +}
> +
> +/* VIC=13 */
> +#define V4L2_DV_BT_CEA_2880X240P60_VTOT263_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 240, 0, 0, \
> +		54000000, 76, 248, 228, 5, 3, 15, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 13) \
> +}
> +
> +/* VIC=14 */
> +#define V4L2_DV_BT_CEA_1440X480P60_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 480, 0, 0, \
> +		54000000, 32, 124, 120, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 14) \
> +}
> +
> +/* VIC=15 */
> +#define V4L2_DV_BT_CEA_1440X480P60_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 480, 0, 0, \
> +		54000000, 32, 124, 120, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 15) \
> +}
> +
> +/* VIC=18 */
> +#define V4L2_DV_BT_CEA_720X576P50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 576, 0, 0, \
> +		27000000, 12, 64, 68, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 18) \
> +}
> +
> +/* VIC=22 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X576I50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 576, 1, 0, \
> +		13500000, 12, 63, 69, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 22) \
> +}
> +
> +/* VIC=23 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X288P50_VTOT312_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 288, 0, 0, \
> +		13500000, 12, 63, 69, 2, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 23) \
> +}
> +
> +/* VIC=23 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X288P50_VTOT313_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 288, 0, 0, \
> +		13500000, 12, 63, 69, 3, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 23) \
> +}
> +
> +/* VIC=23 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X288P50_VTOT314_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 288, 0, 0, \
> +		13500000, 12, 63, 69, 4, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 23) \
> +}
> +
> +/* VIC=24 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X288P50_VTOT312_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 288, 0, 0, \
> +		13500000, 12, 63, 69, 2, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 24) \
> +}
> +
> +/* VIC=24 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X288P50_VTOT313_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 288, 0, 0, \
> +		13500000, 12, 63, 69, 3, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 24) \
> +}
> +
> +/* VIC=24 */
> +/* Note: these are the nominal timings, for HDMI links this format is typically
> + * double-clocked to meet the minimum pixelclock requirements.
> + */
> +#define V4L2_DV_BT_CEA_720X288P50_VTOT314_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 288, 0, 0, \
> +		13500000, 12, 63, 69, 4, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 24) \
> +}
> +
> +/* VIC=25 */
> +#define V4L2_DV_BT_CEA_2880X576I50_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 576, 1, 0, \
> +		54000000, 48, 252, 276, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 25) \
> +}
> +
> +/* VIC=26 */
> +#define V4L2_DV_BT_CEA_2880X576I50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 576, 1, 0, \
> +		54000000, 48, 252, 276, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 26) \
> +}
> +
> +/* VIC=27 */
> +#define V4L2_DV_BT_CEA_2880X288P50_VTOT312_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 288, 0, 0, \
> +		54000000, 48, 252, 276, 2, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 27) \
> +}
> +
> +/* VIC=27 */
> +#define V4L2_DV_BT_CEA_2880X288P50_VTOT313_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 288, 0, 0, \
> +		54000000, 48, 252, 276, 3, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 27) \
> +}
> +
> +/* VIC=27 */
> +#define V4L2_DV_BT_CEA_2880X288P50_VTOT314_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 288, 0, 0, \
> +		54000000, 48, 252, 276, 4, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 27) \
> +}
> +
> +/* VIC=28 */
> +#define V4L2_DV_BT_CEA_2880X288P50_VTOT312_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 288, 0, 0, \
> +		54000000, 48, 252, 276, 2, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 28) \
> +}
> +
> +/* VIC=28 */
> +#define V4L2_DV_BT_CEA_2880X288P50_VTOT313_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 288, 0, 0, \
> +		54000000, 48, 252, 276, 3, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 28) \
> +}
> +
> +/* VIC=28 */
> +#define V4L2_DV_BT_CEA_2880X288P50_VTOT314_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 288, 0, 0, \
> +		54000000, 48, 252, 276, 4, 3, 19, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 28) \
> +}
> +
> +/* VIC=29 */
> +#define V4L2_DV_BT_CEA_1440X576P50_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 576, 0, 0, \
> +		54000000, 24, 128, 136, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 29) \
> +}
> +
> +/* VIC=30 */
> +#define V4L2_DV_BT_CEA_1440X576P50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 576, 0, 0, \
> +		54000000, 24, 128, 136, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 30) \
> +}
> +
> +/* VIC=35 */
> +#define V4L2_DV_BT_CEA_2880X480P60_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 480, 0, 0, \
> +		108000000, 64, 248, 240, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 35) \
> +}
> +
> +/* VIC=36 */
> +#define V4L2_DV_BT_CEA_2880X480P60_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 480, 0, 0, \
> +		108000000, 64, 248, 240, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 36) \
> +}
> +
> +/* VIC=37 */
> +#define V4L2_DV_BT_CEA_2880X576P50_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 576, 0, 0, \
> +		108000000, 48, 256, 272, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 37) \
> +}
> +
> +/* VIC=38 */
> +#define V4L2_DV_BT_CEA_2880X576P50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2880, 576, 0, 0, \
> +		108000000, 48, 256, 272, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 38) \
> +}
> +
> +/* VIC=39 */
> +#define V4L2_DV_BT_CEA_1920X1080I50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, V4L2_DV_HSYNC_POS_POL, \
> +		72000000, 32, 168, 184, 23, 5, 57, 23, 5, 58, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 39) \
> +}
> +
> +/* VIC=40 */
> +#define V4L2_DV_BT_CEA_1920X1080I100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 528, 44, 148, 2, 5, 15, 2, 5, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 40) \
> +}
> +
> +/* VIC=41 */
> +#define V4L2_DV_BT_CEA_1280X720P100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 440, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 41) \
> +}
> +
> +/* VIC=42 */
> +#define V4L2_DV_BT_CEA_720X576P100_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 576, 0, 0, \
> +		54000000, 12, 64, 68, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 42) \
> +}
> +
> +/* VIC=43 */
> +#define V4L2_DV_BT_CEA_720X576P100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 576, 0, 0, \
> +		54000000, 12, 64, 68, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 43) \
> +}
> +
> +/* VIC=44 */
> +#define V4L2_DV_BT_CEA_1440X576I100_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 576, 1, 0, \
> +		54000000, 24, 126, 138, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 44) \
> +}
> +
> +/* VIC=45 */
> +#define V4L2_DV_BT_CEA_1440X576I100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 576, 1, 0, \
> +		54000000, 24, 126, 138, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 45) \
> +}
> +
> +/* VIC=46 */
> +#define V4L2_DV_BT_CEA_1920X1080I120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 88, 44, 148, 2, 5, 15, 2, 5, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 46) \
> +}
> +
> +/* VIC=47 */
> +#define V4L2_DV_BT_CEA_1280X720P120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 110, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 47) \
> +}
> +
> +/* VIC=48 */
> +#define V4L2_DV_BT_CEA_720X480P120_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 480, 0, 0, \
> +		54000000, 16, 62, 60, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 48) \
> +}
> +
> +/* VIC=49 */
> +#define V4L2_DV_BT_CEA_720X480P120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 480, 0, 0, \
> +		54000000, 16, 62, 60, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 49) \
> +}
> +
> +/* VIC=50 */
> +#define V4L2_DV_BT_CEA_1440X480I120_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 480, 1, 0, \
> +		54000000, 38, 124, 114, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 50) \
> +}
> +
> +/* VIC=51 */
> +#define V4L2_DV_BT_CEA_1440X480I120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 480, 1, 0, \
> +		54000000, 38, 124, 114, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 51) \
> +}
> +
> +/* VIC=52 */
> +#define V4L2_DV_BT_CEA_720X576P200_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 576, 0, 0, \
> +		108000000, 12, 64, 68, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 52) \
> +}
> +
> +/* VIC=53 */
> +#define V4L2_DV_BT_CEA_720X576P200_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 576, 0, 0, \
> +		108000000, 12, 64, 68, 5, 5, 39, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 53) \
> +}
> +
> +/* VIC=54 */
> +#define V4L2_DV_BT_CEA_1440X576I200_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 576, 1, 0, \
> +		108000000, 24, 126, 138, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 54) \
> +}
> +
> +/* VIC=55 */
> +#define V4L2_DV_BT_CEA_1440X576I200_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 576, 1, 0, \
> +		108000000, 24, 126, 138, 2, 3, 19, 2, 3, 20, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_HALF_LINE | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 55) \
> +}
> +
> +/* VIC=56 */
> +#define V4L2_DV_BT_CEA_720X480P240_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 480, 0, 0, \
> +		108000000, 16, 62, 60, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 4, 3 }, 56) \
> +}
> +
> +/* VIC=57 */
> +#define V4L2_DV_BT_CEA_720X480P240_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(720, 480, 0, 0, \
> +		108000000, 16, 62, 60, 9, 6, 30, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 57) \
> +}
> +
> +/* VIC=58 */
> +#define V4L2_DV_BT_CEA_1440X480I240_PA4_3 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 480, 1, 0, \
> +		108000000, 38, 124, 114, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 4, 3 }, 58) \
> +}
> +
> +/* VIC=59 */
> +#define V4L2_DV_BT_CEA_1440X480I240_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1440, 480, 1, 0, \
> +		108000000, 38, 124, 114, 4, 3, 15, 4, 3, 16, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_HALF_LINE | \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 59) \
> +}
> +
> +/* VIC=63 */
> +#define V4L2_DV_BT_CEA_1920X1080P120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 88, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 63) \
> +}
> +
> +/* VIC=64 */
> +#define V4L2_DV_BT_CEA_1920X1080P100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 528, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 64) \
> +}
> +
> +/* VIC=65 */
> +#define V4L2_DV_BT_CEA_1280X720P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		59400000, 1760, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 65) \
> +}
> +
> +/* VIC=66 */
> +#define V4L2_DV_BT_CEA_1280X720P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 2420, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 66) \
> +}
> +
> +/* VIC=67 */
> +#define V4L2_DV_BT_CEA_1280X720P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 1760, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 67) \
> +}
> +
> +/* VIC=68 */
> +#define V4L2_DV_BT_CEA_1280X720P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 440, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 68) \
> +}
> +
> +/* VIC=69 */
> +#define V4L2_DV_BT_CEA_1280X720P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 110, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 69) \
> +}
> +
> +/* VIC=70 */
> +#define V4L2_DV_BT_CEA_1280X720P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 440, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 70) \
> +}
> +
> +/* VIC=71 */
> +#define V4L2_DV_BT_CEA_1280X720P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 110, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 71) \
> +}
> +
> +/* VIC=72 */
> +#define V4L2_DV_BT_CEA_1920X1080P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 72) \
> +}
> +
> +/* VIC=73 */
> +#define V4L2_DV_BT_CEA_1920X1080P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 528, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 73) \
> +}
> +
> +/* VIC=74 */
> +#define V4L2_DV_BT_CEA_1920X1080P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 88, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 74) \
> +}
> +
> +/* VIC=75 */
> +#define V4L2_DV_BT_CEA_1920X1080P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 528, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 75) \
> +}
> +
> +/* VIC=76 */
> +#define V4L2_DV_BT_CEA_1920X1080P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 88, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 76) \
> +}
> +
> +/* VIC=77 */
> +#define V4L2_DV_BT_CEA_1920X1080P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 528, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 77) \
> +}
> +
> +/* VIC=78 */
> +#define V4L2_DV_BT_CEA_1920X1080P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 88, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 78) \
> +}
> +
> +/* VIC=79 */
> +#define V4L2_DV_BT_CEA_1680X720P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		59400000, 1360, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 79) \
> +}
> +
> +/* VIC=80 */
> +#define V4L2_DV_BT_CEA_1680X720P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		59400000, 1228, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 80) \
> +}
> +
> +/* VIC=81 */
> +#define V4L2_DV_BT_CEA_1680X720P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		59400000, 700, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 81) \
> +}
> +
> +/* VIC=82 */
> +#define V4L2_DV_BT_CEA_1680X720P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		82500000, 260, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 82) \
> +}
> +
> +/* VIC=83 */
> +#define V4L2_DV_BT_CEA_1680X720P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		99000000, 260, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 83) \
> +}
> +
> +/* VIC=84 */
> +#define V4L2_DV_BT_CEA_1680X720P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		165000000, 60, 40, 220, 5, 5, 95, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 84) \
> +}
> +
> +/* VIC=85 */
> +#define V4L2_DV_BT_CEA_1680X720P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		198000000, 60, 40, 220, 5, 5, 95, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 85) \
> +}
> +
> +/* VIC=86 */
> +#define V4L2_DV_BT_CEA_2560X1080P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		99000000, 998, 44, 148, 4, 5, 11, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 86) \
> +}
> +
> +/* VIC=87 */
> +#define V4L2_DV_BT_CEA_2560X1080P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		90000000, 448, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 87) \
> +}
> +
> +/* VIC=88 */
> +#define V4L2_DV_BT_CEA_2560X1080P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		118800000, 768, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 88) \
> +}
> +
> +/* VIC=89 */
> +#define V4L2_DV_BT_CEA_2560X1080P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		185625000, 548, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 89) \
> +}
> +
> +/* VIC=90 */
> +#define V4L2_DV_BT_CEA_2560X1080P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		198000000, 248, 44, 148, 4, 5, 11, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 90) \
> +}
> +
> +/* VIC=91 */
> +#define V4L2_DV_BT_CEA_2560X1080P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		371250000, 218, 44, 148, 4, 5, 161, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 91) \
> +}
> +
> +/* VIC=92 */
> +#define V4L2_DV_BT_CEA_2560X1080P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2560, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		495000000, 548, 44, 148, 4, 5, 161, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 92) \
> +}
> +
> +/* VIC=103 */
> +#define V4L2_DV_BT_CEA_3840X2160P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 103) \
> +}
> +
> +/* VIC=104 */
> +#define V4L2_DV_BT_CEA_3840X2160P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 1056, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 104) \
> +}
> +
> +/* VIC=105 */
> +#define V4L2_DV_BT_CEA_3840X2160P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		297000000, 176, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 105) \
> +}
> +
> +/* VIC=106 */
> +#define V4L2_DV_BT_CEA_3840X2160P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1056, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 106) \
> +}
> +
> +/* VIC=107 */
> +#define V4L2_DV_BT_CEA_3840X2160P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 176, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 107) \
> +}
> +
> +/* VIC=108 */
> +#define V4L2_DV_BT_CEA_1280X720P48_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		90000000, 960, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 108) \
> +}
> +
> +/* VIC=109 */
> +#define V4L2_DV_BT_CEA_1280X720P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1280, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		90000000, 960, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 109) \
> +}
> +
> +/* VIC=110 */
> +#define V4L2_DV_BT_CEA_1680X720P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1680, 720, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		99000000, 810, 40, 220, 5, 5, 20, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 110) \
> +}
> +
> +/* VIC=111 */
> +#define V4L2_DV_BT_CEA_1920X1080P48_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 111) \
> +}
> +
> +/* VIC=112 */
> +#define V4L2_DV_BT_CEA_1920X1080P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 112) \
> +}
> +
> +/* VIC=114 */
> +#define V4L2_DV_BT_CEA_3840X2160P48_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 114) \
> +}
> +
> +/* VIC=115 */
> +#define V4L2_DV_BT_CEA_4096X2160P48_PA256_135 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1020, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 256, 135 }, 115) \
> +}
> +
> +/* VIC=116 */
> +#define V4L2_DV_BT_CEA_3840X2160P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 116) \
> +}
> +
> +/* VIC=117 */
> +#define V4L2_DV_BT_CEA_3840X2160P100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 1056, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 117) \
> +}
> +
> +/* VIC=118 */
> +#define V4L2_DV_BT_CEA_3840X2160P120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 176, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 118) \
> +}
> +
> +/* VIC=119 */
> +#define V4L2_DV_BT_CEA_3840X2160P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 1056, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 119) \
> +}
> +
> +/* VIC=120 */
> +#define V4L2_DV_BT_CEA_3840X2160P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 176, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 120) \
> +}
> +
> +/* VIC=121 */
> +#define V4L2_DV_BT_CEA_5120X2160P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		396000000, 1996, 88, 296, 8, 10, 22, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 121) \
> +}
> +
> +/* VIC=122 */
> +#define V4L2_DV_BT_CEA_5120X2160P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		396000000, 1696, 88, 296, 8, 10, 22, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 122) \
> +}
> +
> +/* VIC=123 */
> +#define V4L2_DV_BT_CEA_5120X2160P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		396000000, 664, 88, 296, 8, 10, 22, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 123) \
> +}
> +
> +/* VIC=124 */
> +#define V4L2_DV_BT_CEA_5120X2160P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		742500000, 746, 88, 296, 8, 10, 297, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 124) \
> +}
> +
> +/* VIC=125 */
> +#define V4L2_DV_BT_CEA_5120X2160P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		742500000, 1096, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 125) \
> +}
> +
> +/* VIC=126 */
> +#define V4L2_DV_BT_CEA_5120X2160P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		742500000, 164, 88, 128, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 126) \
> +}
> +
> +/* VIC=127 */
> +#define V4L2_DV_BT_CEA_5120X2160P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1485000000, 1096, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 127) \
> +}
> +
> +/* VIC=193 */
> +#define V4L2_DV_BT_CEA_5120X2160P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(5120, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1485000000, 154, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 193) \
> +}
> +
> +/* VIC=194 */
> +#define V4L2_DV_BT_CEA_7680X4320P24_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 2552, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 194) \
> +}
> +
> +/* VIC=195 */
> +#define V4L2_DV_BT_CEA_7680X4320P25_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 2352, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 195) \
> +}
> +
> +/* VIC=196 */
> +#define V4L2_DV_BT_CEA_7680X4320P30_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 552, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 196) \
> +}
> +
> +/* VIC=197 */
> +#define V4L2_DV_BT_CEA_7680X4320P48_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2376000000ULL, 2552, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 197) \
> +}
> +
> +/* VIC=198 */
> +#define V4L2_DV_BT_CEA_7680X4320P50_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2376000000ULL, 2352, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 198) \
> +}
> +
> +/* VIC=199 */
> +#define V4L2_DV_BT_CEA_7680X4320P60_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2376000000ULL, 552, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 199) \
> +}
> +
> +/* VIC=200 */
> +#define V4L2_DV_BT_CEA_7680X4320P100_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		4752000000ULL, 2112, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 16, 9 }, 200) \
> +}
> +
> +/* VIC=201 */
> +#define V4L2_DV_BT_CEA_7680X4320P120_PA16_9 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		4752000000ULL, 352, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 16, 9 }, 201) \
> +}
> +
> +/* VIC=202 */
> +#define V4L2_DV_BT_CEA_7680X4320P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 2552, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 202) \
> +}
> +
> +/* VIC=203 */
> +#define V4L2_DV_BT_CEA_7680X4320P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 2352, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 203) \
> +}
> +
> +/* VIC=204 */
> +#define V4L2_DV_BT_CEA_7680X4320P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 552, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 204) \
> +}
> +
> +/* VIC=205 */
> +#define V4L2_DV_BT_CEA_7680X4320P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2376000000ULL, 2552, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 205) \
> +}
> +
> +/* VIC=206 */
> +#define V4L2_DV_BT_CEA_7680X4320P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2376000000ULL, 2352, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 206) \
> +}
> +
> +/* VIC=207 */
> +#define V4L2_DV_BT_CEA_7680X4320P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2376000000ULL, 552, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 207) \
> +}
> +
> +/* VIC=208 */
> +#define V4L2_DV_BT_CEA_7680X4320P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		4752000000ULL, 2112, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 208) \
> +}
> +
> +/* VIC=209 */
> +#define V4L2_DV_BT_CEA_7680X4320P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(7680, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		4752000000ULL, 352, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 209) \
> +}
> +
> +/* VIC=210 */
> +#define V4L2_DV_BT_CEA_10240X4320P24_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1485000000, 1492, 176, 592, 16, 20, 594, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 210) \
> +}
> +
> +/* VIC=211 */
> +#define V4L2_DV_BT_CEA_10240X4320P25_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1485000000, 2492, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 211) \
> +}
> +
> +/* VIC=212 */
> +#define V4L2_DV_BT_CEA_10240X4320P30_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1485000000, 288, 176, 296, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 212) \
> +}
> +
> +/* VIC=213 */
> +#define V4L2_DV_BT_CEA_10240X4320P48_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2970000000ULL, 1492, 176, 592, 16, 20, 594, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 213) \
> +}
> +
> +/* VIC=214 */
> +#define V4L2_DV_BT_CEA_10240X4320P50_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2970000000ULL, 2492, 176, 592, 16, 20, 44, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 214) \
> +}
> +
> +/* VIC=215 */
> +#define V4L2_DV_BT_CEA_10240X4320P60_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		2970000000ULL, 288, 176, 296, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 215) \
> +}
> +
> +/* VIC=216 */
> +#define V4L2_DV_BT_CEA_10240X4320P100_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		5940000000ULL, 2192, 176, 592, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 64, 27 }, 216) \
> +}
> +
> +/* VIC=217 */
> +#define V4L2_DV_BT_CEA_10240X4320P120_PA64_27 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(10240, 4320, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		5940000000ULL, 288, 176, 296, 16, 20, 144, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 64, 27 }, 217) \
> +}
> +
> +/* VIC=218 */
> +#define V4L2_DV_BT_CEA_4096X2160P100_PA256_135 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 800, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_IS_CE_VIDEO | V4L2_DV_FL_HAS_PICTURE_ASPECT | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 256, 135 }, 218) \
> +}
> +
> +/* VIC=219 */
> +#define V4L2_DV_BT_CEA_4096X2160P120_PA256_135 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		1188000000, 88, 88, 128, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_PICTURE_ASPECT | V4L2_DV_FL_HAS_CEA861_VIC, \
> +		{ 256, 135 }, 219) \
> +}
>  
>  /* VESA Discrete Monitor Timings as per version 1.0, revision 12 */
>  
> 

