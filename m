Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0454F5F6579
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbiJFL5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiJFL5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:57:16 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5879C234
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:57:15 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 25D5120010;
        Thu,  6 Oct 2022 11:57:12 +0000 (UTC)
Date:   Thu, 6 Oct 2022 13:57:11 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 09/16] media: i2c: ov9282: Add the properties from fwnode
Message-ID: <20221006115711.rpnay2zrx2olfgz3@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-10-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-10-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:28:02PM +0100, Dave Stevenson wrote:
> Use v4l2_ctrl_new_fwnode_properties to add V4L2_CID_CAMERA_ORIENTATION
> and V4L2_CID_CAMERA_SENSOR_ROTATION.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Seems like I forgot this patch
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/ov9282.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 334b31af34a4..183283d191b1 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -989,10 +989,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  {
>  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
>  	const struct ov9282_mode *mode = ov9282->cur_mode;
> +	struct v4l2_fwnode_device_properties props;
>  	u32 lpfr;
>  	int ret;
>
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 6);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>  	if (ret)
>  		return ret;
>
> @@ -1050,7 +1051,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	if (ov9282->hblank_ctrl)
>  		ov9282->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -	if (ctrl_hdlr->error) {
> +	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> +	if (!ret) {
> +		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> +		v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov9282_ctrl_ops,
> +						&props);
> +	}
> +
> +	if (ctrl_hdlr->error || ret) {
>  		dev_err(ov9282->dev, "control init failed: %d",
>  			ctrl_hdlr->error);
>  		v4l2_ctrl_handler_free(ctrl_hdlr);
> --
> 2.34.1
>
