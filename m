Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DAC7AC45A
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 20:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbjIWSLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 14:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbjIWSLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 14:11:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C04FE
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 11:11:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 177DF4DB;
        Sat, 23 Sep 2023 20:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695492578;
        bh=8KCgcZLPedP7gNA6FAEfYbxfQ+n1FkZ7FjWr6pvRpIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rKrMPmr8AIvtfBAqntRQmhlLpgsG8NK1+J9pAtPNUSCAb6HW2ZebEQw/l9n/Cm2Eg
         7D2+Vdfqh5A6apEf7kJh9CGlCj9xQIYZuyjbIYHqLyPyLrlXqMEYnzdivfEQ6/gQUW
         BdT4MJjU2E3j32Qxr/zzidDzxkDUc9Qa58R+v6MU=
Date:   Sat, 23 Sep 2023 21:11:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCHv2 12/23] media: v4l2-subdev.h: increase struct
 v4l2_subdev name size
Message-ID: <20230923181128.GA22193@pendragon.ideasonboard.com>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-13-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230923152107.283289-13-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Sat, Sep 23, 2023 at 05:20:56PM +0200, Hans Verkuil wrote:
> This resolves a lot of the string truncate compiler warnings.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/omap4iss/iss_csi2.c | 2 +-
>  include/media/v4l2-subdev.h               | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
> index 04ce0e7eb557..d2844414de4f 100644
> --- a/drivers/staging/media/omap4iss/iss_csi2.c
> +++ b/drivers/staging/media/omap4iss/iss_csi2.c
> @@ -1260,7 +1260,7 @@ static int csi2_init_entities(struct iss_csi2_device *csi2, const char *subname)
>  	struct media_pad *pads = csi2->pads;
>  	struct media_entity *me = &sd->entity;
>  	int ret;
> -	char name[V4L2_SUBDEV_NAME_SIZE];
> +	char name[32];
>  
>  	v4l2_subdev_init(sd, &csi2_ops);
>  	sd->internal_ops = &csi2_internal_ops;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5f59ff0796b7..5711354056b9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -951,7 +951,7 @@ struct v4l2_subdev_internal_ops {
>  	void (*release)(struct v4l2_subdev *sd);
>  };
>  
> -#define V4L2_SUBDEV_NAME_SIZE 32
> +#define V4L2_SUBDEV_NAME_SIZE 52

Can we allocate it dynamically instead ?

>  
>  /* Set this flag if this subdev is a i2c device. */
>  #define V4L2_SUBDEV_FL_IS_I2C			(1U << 0)

-- 
Regards,

Laurent Pinchart
