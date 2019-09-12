Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87FA3B0FB0
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 15:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731820AbfILNSA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 09:18:00 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38149 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731667AbfILNSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 09:18:00 -0400
Received: from [IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985] ([IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8OywiQ0FVV17O8Oz0iypA2; Thu, 12 Sep 2019 15:17:58 +0200
Subject: Re: [PATCH 6/6] smiapp: Avoid fall-through in switch
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
 <20190819124728.10511-7-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <74b049a8-9f03-c7c0-94db-0a1e5db4d07a@xs4all.nl>
Date:   Thu, 12 Sep 2019 15:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819124728.10511-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJxfwB4KgOut3MSNlmck5iem9KJ+d/zLFlS7dvGNa7rGA7rg39SQ42J+DmosxoI/L6g5nQ0WzHYDpsnD/qNM8ZIp8aRYL51yECZcQaVPLCgt8I2iKv4L
 ZuMJlzPwaGnAv5jaxDK+EVotCLePzTyDvtV0sBOOace8wKQMpcK5WQZ+qV6Un5Jl3Yub6P2RDo4LVuC72g2m8oYXzF5hP5Om4545LBVAHtcxIx1No6i+WcBa
 PidS7vQzAyEouw/fzjT5PSknaXDaFrQ+dUBWoEzCJTgbAzzcUIqeTJICEokovIEIzcdZyRcREAnCDYWvUXDaqKJyJ1T7/5XIQ1AJNdgPpdA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 2:47 PM, Sakari Ailus wrote:
> Remove switch fall-through cases in the driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/smiapp/smiapp-core.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
> index 76d7d204ec17..61de8cdccc4b 100644
> --- a/drivers/media/i2c/smiapp/smiapp-core.c
> +++ b/drivers/media/i2c/smiapp/smiapp-core.c
> @@ -1674,13 +1674,12 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
>  				sensor->binning_vertical = 1;
>  			}
>  		}
> -		/* Fall through */
> -	case V4L2_SEL_TGT_COMPOSE:

This doesn't look right: for this target you now enter the default case.

You probably want to do:

		break;
	case V4L2_SEL_TGT_COMPOSE:
		break;

Regards,

	Hans

> -		*crops[SMIAPP_PAD_SRC] = *comp;
>  		break;
>  	default:
> -		BUG();
> +		WARN_ON(1);
> +		return;
>  	}
> +	*crops[SMIAPP_PAD_SRC] = *comp;
>  }
>  
>  static const struct smiapp_csi_data_format
> @@ -2062,7 +2061,7 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
>  		    && sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
>  		    != SMIAPP_SCALING_CAPABILITY_NONE)
>  			return 0;
> -		/* Fall through */
> +		return -EINVAL;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -2716,7 +2715,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
>  		case 180:
>  			hwcfg->module_board_orient =
>  				SMIAPP_MODULE_BOARD_ORIENT_180;
> -			/* Fall through */
> +			break;
>  		case 0:
>  			break;
>  		default:
> 

