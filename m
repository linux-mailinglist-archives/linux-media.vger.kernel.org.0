Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C76A52433
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 09:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfFYHRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 03:17:55 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40453 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726661AbfFYHRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 03:17:55 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ffi6hOBa9F85OffiAhckq4; Tue, 25 Jun 2019 09:17:53 +0200
Subject: Re: [PATCH 1/1] staging: media: fix style problem
To:     Aliasgar Surti <aliasgar.surti500@gmail.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <1561099192-19638-1-git-send-email-aliasgar.surti500@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6536b57d-fea2-e16d-2092-e9e27c51c0f1@xs4all.nl>
Date:   Tue, 25 Jun 2019 09:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561099192-19638-1-git-send-email-aliasgar.surti500@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFSLZTilMRg48ay4S06h8lKaxnNMeKtWBgoxiLCEN52Iocq8ZPUUrYyonWGG7QOqNwZdiIYnXLm2GIdRMsnRp3Z6Kii2JzVujiRdii7MH4RG1Ss/Oqmt
 7tohfhZmPwWmBiPz3adw/ILzO5bmVQDdi2l0TieHZxCj33WyvtDAAb4GDwAS1j242Dp645dNJoVwlFny2RKGdv2RWOUGu2+v3STSmO362WZXKrYTxhLx8J37
 hwb1eOI3qfHkVI2WigOct7oEn03GklCKSDyFls3OQCW9l7TcQDayQyqViElAwYHKY/YWdUEpDSN7O9bEP6fdqQMIs3ktRyGN7tpsZ9qjI4A4QtXj53dUMcGU
 JSOMaqYoiSZHozH9I5k1BEy12Xjgo4tTlLPM4DK4ftLRdJevdwqxW0giDtae+2MQ7SkY1XSc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/21/19 8:39 AM, Aliasgar Surti wrote:
> From: Aliasgar Surti <aliasgar.surti500@gmail.com>
> 
> checkpatch reported "WARNING: line over 80 characters".
> This patch fixes the warning for file soc_camera/soc_ov5642.c

FYI: we're not accepting patches for staging/media/soc_camera: these
are obsolete and broken drivers.

Regards,

	Hans

> 
> Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
> ---
>  drivers/staging/media/soc_camera/soc_ov5642.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/soc_camera/soc_ov5642.c b/drivers/staging/media/soc_camera/soc_ov5642.c
> index 94696d7..39ae24dc 100644
> --- a/drivers/staging/media/soc_camera/soc_ov5642.c
> +++ b/drivers/staging/media/soc_camera/soc_ov5642.c
> @@ -687,7 +687,8 @@ static int reg_write16(struct i2c_client *client, u16 reg, u16 val16)
>  }
>  
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
> -static int ov5642_get_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
> +static int ov5642_get_register(struct v4l2_subdev *sd,
> +			       struct v4l2_dbg_register *reg)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret;
> @@ -705,7 +706,8 @@ static int ov5642_get_register(struct v4l2_subdev *sd, struct v4l2_dbg_register
>  	return ret;
>  }
>  
> -static int ov5642_set_register(struct v4l2_subdev *sd, const struct v4l2_dbg_register *reg)
> +static int ov5642_set_register(struct v4l2_subdev *sd,
> +			       const struct v4l2_dbg_register *reg)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  
> 

