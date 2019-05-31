Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E899B30D72
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 13:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEaLnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 07:43:03 -0400
Received: from retiisi.org.uk ([95.216.213.190]:48320 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726158AbfEaLnC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 07:43:02 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 538F7634C7B;
        Fri, 31 May 2019 14:42:58 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hWfw2-0000Ju-F9; Fri, 31 May 2019 14:42:58 +0300
Date:   Fri, 31 May 2019 14:42:58 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] media: ov6650: Fix frame scaling not reset on
 crop
Message-ID: <20190531114258.6bvsqzlexqnelu5u@valkosipuli.retiisi.org.uk>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
 <20190526204758.1904-5-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526204758.1904-5-jmkrzyszt@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Sun, May 26, 2019 at 10:47:57PM +0200, Janusz Krzysztofik wrote:
> According to V4L2 subdevice interface specification, frame scaling
> factors should be reset to default values on modification of input frame
> format.  Assuming that requirement also applies in case of crop
> rectangle modification unless V4L2_SEL_FLAG_KEEP_CONFIG is requested,
> the driver now does not respect it.
> 
> The KEEP_CONFIG case is already implemented, fix the other path.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  drivers/media/i2c/ov6650.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 47590cd51190..cc70d8952999 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -472,6 +472,8 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
>  	}
>  }
>  
> +static int ov6650_s_fmt(struct v4l2_subdev *sd, u32 code, bool half_scale);
> +

Would it be possible to rearrange the functions in the file so you wouldn't
need extra prototypes? Preferrably that'd be a new patch.

>  static int ov6650_set_selection(struct v4l2_subdev *sd,
>  		struct v4l2_subdev_pad_config *cfg,
>  		struct v4l2_subdev_selection *sel)
> @@ -515,7 +517,13 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
>  	}
>  	if (!ret)
>  		priv->rect.height = sel->r.height;
> +	else
> +		return ret;

if (ret)
	return ret;

...

>  
> +	if (priv->half_scale) {
> +		/* turn off half scaling, preserve media bus format */
> +		ret = ov6650_s_fmt(sd, priv->code, false);
> +	}
>  	return ret;
>  }
>  

-- 
Regards,

Sakari Ailus
