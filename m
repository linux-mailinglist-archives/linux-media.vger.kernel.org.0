Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C378432107
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 00:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfFAW3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 18:29:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:24291 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbfFAW3m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Jun 2019 18:29:42 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jun 2019 15:29:41 -0700
X-ExtLoop1: 1
Received: from mczarkow-mobl2.ger.corp.intel.com (HELO mara.localdomain) ([10.249.140.11])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2019 15:29:39 -0700
Received: from sailus by mara.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1hXCVP-00049t-Vd; Sun, 02 Jun 2019 01:29:42 +0300
Date:   Sun, 2 Jun 2019 01:29:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] media: ov6650: Add .init_cfg() pad operation
 callback
Message-ID: <20190601222938.bonoowmbfs6cpctp@mara.localdomain>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
 <20190526204758.1904-6-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526204758.1904-6-jmkrzyszt@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Sun, May 26, 2019 at 10:47:58PM +0200, Janusz Krzysztofik wrote:
> The driver now supports V4L2_SUBDEV_FORMAT_TRY operation mode only in
> .get/set_fmt() pad operation callbacks.  That means only .try_format
> member of pad config is maintained.  As a consequence, active crop
> rectangle is used as a referece while V4L2_SUBDEV_FORMAT_TRY requests
> are processed.  In order to fix that, a method for initialization of
> .try_crop pad config member is needed.
> 
> Implement .init_cfg() pad operation callback which initializes the pad
> config from current active format and selection settings.  From now on,

The values set by init_cfg should be the defaults and not reflect the
current configuration. Apart from that the patch seems fine.

> and before the driver V4L2_SUBDEV_FORMAT_TRY support is further
> modified, host interface drivers should call .init_cfg() on a pad
> config before passing it to V4L2_SUBDEV_FORMAT_TRY operations.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  drivers/media/i2c/ov6650.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index cc70d8952999..c3d4c1f598b2 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -447,6 +447,26 @@ static int ov6650_s_power(struct v4l2_subdev *sd, int on)
>  	return ret;
>  }
>  
> +static int ov6650_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct ov6650 *priv = to_ov6650(client);
> +	struct v4l2_mbus_framefmt *mf;
> +	struct v4l2_rect *rect;
> +
> +	mf = &cfg->try_fmt;
> +	*mf = ov6650_def_fmt;
> +	mf->width = priv->rect.width >> priv->half_scale;
> +	mf->height = priv->rect.height >> priv->half_scale;
> +	mf->code = priv->code;
> +
> +	rect = &cfg->try_crop;
> +	*rect = priv->rect;
> +
> +	return 0;
> +}
> +
>  static int ov6650_get_selection(struct v4l2_subdev *sd,
>  		struct v4l2_subdev_pad_config *cfg,
>  		struct v4l2_subdev_selection *sel)
> @@ -959,6 +979,7 @@ static const struct v4l2_subdev_video_ops ov6650_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> +	.init_cfg	= ov6650_init_cfg,
>  	.enum_mbus_code = ov6650_enum_mbus_code,
>  	.get_selection	= ov6650_get_selection,
>  	.set_selection	= ov6650_set_selection,
> -- 
> 2.21.0
> 

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
