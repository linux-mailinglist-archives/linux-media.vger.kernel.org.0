Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5083554BC68
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 23:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351655AbiFNVAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 17:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353110AbiFNVAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 17:00:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2CB50076;
        Tue, 14 Jun 2022 14:00:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEF822E4;
        Tue, 14 Jun 2022 23:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655240410;
        bh=vq7W3LM3Q8tusI6NcOOaLPQi6HWdPmkVmI+E3atWtkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c1rr8WHS7C/QDJ/0iy5Cf8OPF+IOa4Iq2bJJba0lilrOsg2nxGaM9ZwagIqCcH1R9
         c4Qui9E4vriCzWwA7rJ1sHrqR/l3BUH9EaiYTu9vRzlkDHkUAqqykW825GMMp6ja/y
         6N3wzJ6xM6xxB823DxK3Yt2wSt1HRYmCXAYLpSSw=
Date:   Wed, 15 Jun 2022 00:00:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/9] vivid: add dynamic array test control
Message-ID: <Yqj20J9QaAV6ZNes@pendragon.ideasonboard.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-4-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220503093925.876640-4-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier and Hans,

Thank you for the patch.

On Tue, May 03, 2022 at 11:39:19AM +0200, Xavier Roumegue wrote:
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Add a dynamic array test control to help test support for this
> feature.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index e7516dc1227b..7267892dc18a 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -34,6 +34,7 @@
>  #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
> +#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
>  	.dims = { 1 },
>  };
>  
> +static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_U32_DYN_ARRAY,
> +	.name = "U32 Dynamic Array",
> +	.type = V4L2_CTRL_TYPE_U32,
> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +	.def = 50,
> +	.min = 10,
> +	.max = 90,
> +	.step = 1,
> +	.dims = { 100 },
> +};

To meaningfully test this, don't we need the vivid driver to change the
dimension ? Or is it meant to only test changes made by the application
?

> +
>  static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
>  	.ops = &vivid_user_gen_ctrl_ops,
>  	.id = VIVID_CID_U16_MATRIX,
> @@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
>  

-- 
Regards,

Laurent Pinchart
