Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A256385EA
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 10:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiKYJMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 04:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKYJMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 04:12:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A39E218B
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 01:12:29 -0800 (PST)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB455496;
        Fri, 25 Nov 2022 10:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669367547;
        bh=GxITz8a8I5D5RlqjEfOPw2ALCXkNCfFVqi+wBOywdXY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hw0poncC+7tyYZhQdD5XQUW3L5tkmQyERadBjsSg4+t4Ibew9YsRYTjFHq1E4LWYh
         7fBwbbOxrX8EHrGR3fN70AItnsjjYbBG83ZcZ/8UhNOWf9fx2Fl75nfQ7fMArjjGVh
         8eRD1xav4av8jtLLa8nxzmKhIgrYzTAVRLr9pii8=
Date:   Fri, 25 Nov 2022 10:12:24 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com, eddy.khan@vergesense.com,
        paul.kocialkowski@bootlin.com, eugen.hristev@microchip.com
Subject: Re: [PATCH] media: ov5640: Fix analogue gain control
Message-ID: <20221125091224.a6llcciylnz5rfg5@uno.localdomain>
References: <20221123095407.2393-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123095407.2393-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, Nov 23, 2022 at 11:54:07AM +0200, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> The ov5640 driver incorrectly uses V4L2_CID_GAIN for the analogue gain.
> V4L2 has a specific control for analogue gain, V4L2_CID_ANALOGUE_GAIN.
> Use it.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

It's a bit of a shame we cannot report here your analysis of the gain
control handling on ov5640, so I'll link it here for reference

https://lists.libcamera.org/pipermail/libcamera-devel/2022-November/035655.html

I agree with the above conclusions, until proven differently we can
consider 0x350a/b to control the analogue gain, as there's a separate
digital gain register, hence the below change makes sense to me.

I've expanded the cc-list to who has been recently involved in ov5640
developments. If required by any user, we should try to map
CID_GAIN on CID_ANALOGUE_GAIN for compatibility.

From my side it's good the way it is:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2d740397a5d4..c65c391bc1eb 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3458,7 +3458,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	/* Auto/manual gain */
>  	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
>  					     0, 1, 1, 1);
> -	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
>  					0, 1023, 1, 0);
>
>  	ctrls->saturation = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION,
> --
> Regards,
>
> Laurent Pinchart
>
