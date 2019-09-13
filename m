Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B464EB187A
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 08:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfIMGxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 02:53:01 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37527 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbfIMGxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 02:53:01 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8fRwiDub6QUjz8fRziAQl0; Fri, 13 Sep 2019 08:53:00 +0200
Subject: Re: [PATCH v2 6/6] smiapp: Avoid fall-through in switch
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190819124728.10511-7-sakari.ailus@linux.intel.com>
 <20190913064722.11415-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c4d6cde2-b290-0fb0-b256-69a1cda1cb89@xs4all.nl>
Date:   Fri, 13 Sep 2019 08:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913064722.11415-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOwPr5+UCZGbgJ05c8SA8dDpTuLhw89FRip/foZn1b3O7QoPu9PNG8VnO0A0SgAuWeb+ZEXWu3TcR7WZmFg/l+zxqYeel8ANbmh36KqoXasZEOs+yZRX
 5QRAuPjGOsPNU/y0PUjZZLhFvZYp19ZvNkiv2A7oMetcUDdOWPwud47cTbod2ZZY1DIs8oAFvRdxD3ZI74qaFi9R0TiBRHI02Fzd0WZQne5KYGJVIu3YDXHm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/13/19 8:47 AM, Sakari Ailus wrote:
> Remove switch fall-through cases in the driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/i2c/smiapp/smiapp-core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
> index 76d7d204ec17..c6202f3a4015 100644
> --- a/drivers/media/i2c/smiapp/smiapp-core.c
> +++ b/drivers/media/i2c/smiapp/smiapp-core.c
> @@ -1674,13 +1674,14 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
>  				sensor->binning_vertical = 1;
>  			}
>  		}
> -		/* Fall through */
> +		break;
>  	case V4L2_SEL_TGT_COMPOSE:
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
> @@ -2062,7 +2063,7 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
>  		    && sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
>  		    != SMIAPP_SCALING_CAPABILITY_NONE)
>  			return 0;
> -		/* Fall through */
> +		return -EINVAL;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -2716,7 +2717,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
>  		case 180:
>  			hwcfg->module_board_orient =
>  				SMIAPP_MODULE_BOARD_ORIENT_180;
> -			/* Fall through */
> +			break;
>  		case 0:
>  			break;
>  		default:
> 

