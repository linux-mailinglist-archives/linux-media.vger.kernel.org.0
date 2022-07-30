Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F20585A2C
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbiG3KtM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiG3KtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:49:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F3B17A8B;
        Sat, 30 Jul 2022 03:49:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 89748B80139;
        Sat, 30 Jul 2022 10:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFEAC433C1;
        Sat, 30 Jul 2022 10:49:04 +0000 (UTC)
Message-ID: <5fdb62df-da1a-2c68-aaed-18a394f5f4ba@xs4all.nl>
Date:   Sat, 30 Jul 2022 12:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 7/8] media: dw100: Add i.MX8MP dw100 dewarper driver
Content-Language: en-US
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
 <20220730102413.547698-8-xavier.roumegue@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220730102413.547698-8-xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

On 30/07/2022 12:24, Xavier Roumegue wrote:
> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
> core found on i.MX8MP SoC.
> 
> The processor core applies a programmable geometrical transformation on
> input images to correct distorsion introduced by lenses.
> The transformation function is exposed as a grid map with 16x16 pixel
> macroblocks indexed using X, Y vertex coordinates.
> 
> The dewarping map can be set from application through a dedicated v4l2
> control. If not set or invalid, the driver computes an identity map
> prior to starting the processing engine.
> 
> The driver supports scaling, cropping and pixel format conversion.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/Kconfig            |    1 +
>  drivers/media/platform/nxp/Makefile           |    1 +
>  drivers/media/platform/nxp/dw100/Kconfig      |   17 +
>  drivers/media/platform/nxp/dw100/Makefile     |    3 +
>  drivers/media/platform/nxp/dw100/dw100.c      | 1712 +++++++++++++++++
>  drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
>  6 files changed, 1851 insertions(+)
>  create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
>  create mode 100644 drivers/media/platform/nxp/dw100/Makefile
>  create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
>  create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
> 

<snip>

> +/*
> + * Initialize the dewarping map with an identity mapping.
> + *
> + * A 16 pixels cell size grid is mapped on the destination image.
> + * The last cells width/height might be lesser than 16 if the destination image
> + * width/height is not divisible by 16. This dewarping grid map specifies the
> + * source image pixel location (x, y) on each grid intersection point.
> + * Bilinear interpolation is used to compute inner cell points locations.
> + *
> + * The coordinates are saved in UQ12.4 fixed point format.
> + */
> +static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
> +					  u32 from_idx, u32 elems,
> +					  union v4l2_ctrl_ptr ptr)
> +{
> +	struct dw100_ctx *ctx =
> +		container_of(ctrl->handler, struct dw100_ctx, hdl);
> +
> +	u32 sw, sh, dw, dh, mw, mh, i, j;
> +	u16 qx, qy, qdx, qdy, qsh, qsw;
> +	u32 *map = ctrl->p_cur.p_u32;
> +
> +	sw = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width;
> +	dw = ctx->q_data[DW100_QUEUE_DST].pix_fmt.width;
> +	sh = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.height;
> +	dh = ctx->q_data[DW100_QUEUE_DST].pix_fmt.height;
> +
> +	mw = dw100_get_n_vertices_from_length(dw);
> +	mh = dw100_get_n_vertices_from_length(dh);

Note that ctrl->dims[] contains the array dimensions: use that rather than
calculating from dw/dh since using dims[] is more robust.

> +
> +	qsw = dw100_map_convert_to_uq12_4(sw);
> +	qsh = dw100_map_convert_to_uq12_4(sh);
> +	qdx = qsw / (mw - 1);
> +	qdy = qsh / (mh - 1);
> +
> +	ctx->map_width = mw;
> +	ctx->map_height = mh;
> +	ctx->map_size = mh * mw * sizeof(u32);
> +
> +	for (i = 0, qy = 0; i < mh; i++, qy += qdy) {

This isn't correct: you actually start from 'from_idx', which is almost always 0,
except if userspace only sets the first N elements of an array, in that case
those N elements are copied to the control array and the remainder is initialized.

I admit that it doesn't make much sense in this particular case, but you still
need to take it into account.

I also would rename i and j to y and x, that makes more sense here.

> +		if (qy > qsh)
> +			qy = qsh;
> +		for (j = 0, qx = 0; j < mw; j++, qx += qdx) {
> +			if (qx > qsw)
> +				qx = qsw;
> +			*map++ = dw100_map_format_coordinates(qx, qy);
> +		}
> +	}
> +
> +	ctx->user_map_is_set = false;
> +}

Regards,

	Hans

> +
> +static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
> +	.init = dw100_ctrl_dewarping_map_init,
> +	.validate = v4l2_ctrl_type_op_validate,
> +	.log = v4l2_ctrl_type_op_log,
> +	.equal = v4l2_ctrl_type_op_equal,
> +};
> +
> +static const struct v4l2_ctrl_config controls[] = {
> +	[DW100_CTRL_DEWARPING_MAP] = {
> +		.ops = &dw100_ctrl_ops,
> +		.type_ops = &dw100_ctrl_type_ops,
> +		.id = V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP,
> +		.name = "Dewarping Vertex Map",
> +		.type = V4L2_CTRL_TYPE_U32,
> +		.min = 0x00000000,
> +		.max = 0xffffffff,
> +		.step = 1,
> +		.def = 0,
> +		.dims = { DW100_DEF_LUT_W, DW100_DEF_LUT_H },
> +	},
> +};

Regards,

	Hans
