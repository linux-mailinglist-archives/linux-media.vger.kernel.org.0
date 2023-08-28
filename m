Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9283978B225
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 15:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjH1NlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 09:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbjH1Nkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 09:40:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A592B0
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 06:40:44 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-240.net.vodafone.it [5.91.19.240])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89FB52D8;
        Mon, 28 Aug 2023 15:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693229961;
        bh=YBtMlFzIXt4RT2pAaPiIZWcuXqIDxIcspY+IaeAUQX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oISNejo7pEdEgTnksZ2BlA+ilm4gB65pP4WDpoRZgagX5J4xkYd4sAf3sHHGDUpUU
         4lP0E/njJcOw2SU2IeXRq+TkXvfCeRS+CZZ8iQWnITtqXa6XCqqF2qbnFxdln/Wtog
         U5kf1VysLTAUZ2kt//68hE5rmhexHJfK5YPEGXWk=
Date:   Mon, 28 Aug 2023 15:40:38 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 10/18] media: i2c: imx219: Access height from active
 format in imx219_set_ctrl
Message-ID: <5ojkvvp3fdayhs6oenkdmfdv7ujz5rcjl5sw5nzduqty6ry5vc@gphjg4giojwg>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-11-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230821223001.28480-11-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, Aug 22, 2023 at 01:29:53AM +0300, Laurent Pinchart wrote:
> Use the active format height instead of the mode height in
> imx219_set_ctrl(). This prepares for dropping the mode field from the
> imx219 structure.
>
> The state is retrieved using v4l2_subdev_get_locked_active_state() as
> the subdev active state and the control handler share the same lock.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 0c26cbfe58f3..4e9a50117a0a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -401,13 +401,18 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct imx219 *imx219 =
>  		container_of(ctrl->handler, struct imx219, ctrl_handler);
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> +	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
>  	int ret = 0;
>
> +	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> +	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
> +
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		int exposure_max, exposure_def;
>
>  		/* Update max exposure while meeting expected vblanking */
> -		exposure_max = imx219->mode->height + ctrl->val - 4;
> +		exposure_max = format->height + ctrl->val - 4;
>  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>  			exposure_max : IMX219_EXPOSURE_DEFAULT;
>  		__v4l2_ctrl_modify_range(imx219->exposure,
> @@ -447,7 +452,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_VBLANK:
>  		cci_write(imx219->regmap, IMX219_REG_VTS,
> -			  imx219->mode->height + ctrl->val, &ret);
> +			  format->height + ctrl->val, &ret);
>  		break;
>  	case V4L2_CID_TEST_PATTERN_RED:
>  		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> --
> Regards,
>
> Laurent Pinchart
>
