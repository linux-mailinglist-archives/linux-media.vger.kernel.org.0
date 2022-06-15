Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D217D54C7EC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 13:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241494AbiFOLyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 07:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347706AbiFOLyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 07:54:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17115400B;
        Wed, 15 Jun 2022 04:53:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EDB2749;
        Wed, 15 Jun 2022 13:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655294031;
        bh=BJeReJ5HzZqJ14zQWwHkPYHAYRMPtPin5nHacf0z5X4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=czQ3Wb3cqdVjZkqXuG8OmD2U9qQoAsaEaWSa9GARjAYV15jiqLME8AuS5RcjScqzi
         j3V+8N9YTdGlwDBEk238WnjBFPOUFhp0iogrWsYvNqvQGSu/5RtkwLFbBV7aL/4Jwv
         V4nf55UubPqVUnHGjwGqy8QpS3ZkrSDwfcRAfNI8=
Date:   Wed, 15 Jun 2022 14:53:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/9] vivid: add dynamic array test control
Message-ID: <YqnIRWtyjtyz4gzj@pendragon.ideasonboard.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-4-xavier.roumegue@oss.nxp.com>
 <Yqj20J9QaAV6ZNes@pendragon.ideasonboard.com>
 <b508597d-3da5-5e1f-66a5-a9f7d6a2c352@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b508597d-3da5-5e1f-66a5-a9f7d6a2c352@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 15, 2022 at 11:14:43AM +0200, Hans Verkuil wrote:
> Hi Laurent, Xavier,
> 
> Ignore what I wrote before, I read it with the HEVC patch series in mind, not the dw100
> series.
> 
> So let me try again :-)
> 
> On 6/14/22 23:00, Laurent Pinchart wrote:
> > Hi Xavier and Hans,
> > 
> > Thank you for the patch.
> > 
> > On Tue, May 03, 2022 at 11:39:19AM +0200, Xavier Roumegue wrote:
> >> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> Add a dynamic array test control to help test support for this
> >> feature.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> >> index e7516dc1227b..7267892dc18a 100644
> >> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> >> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> >> @@ -34,6 +34,7 @@
> >>  #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
> >>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
> >>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
> >> +#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
> >>  
> >>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
> >>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> >> @@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
> >>  	.dims = { 1 },
> >>  };
> >>  
> >> +static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
> >> +	.ops = &vivid_user_gen_ctrl_ops,
> >> +	.id = VIVID_CID_U32_DYN_ARRAY,
> >> +	.name = "U32 Dynamic Array",
> >> +	.type = V4L2_CTRL_TYPE_U32,
> >> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> >> +	.def = 50,
> >> +	.min = 10,
> >> +	.max = 90,
> >> +	.step = 1,
> >> +	.dims = { 100 },
> >> +};
> > 
> > To meaningfully test this, don't we need the vivid driver to change the
> > dimension ? Or is it meant to only test changes made by the application
> > ?
> 
> As I understand it the dw100 driver needs a 2 dimensional array control.
> The size is fixed for each resolution, but if the resolution changes, then
> this control changes size as well, and it makes sense that when that happens
> it is also reset to default values.
> 
> So this isn't a dynamic array at all. It is a standard 2 dimensional array.
> 
> What is missing in the control framework is a function similar to
> v4l2_ctrl_modify_range() that can resize an array.
> 
> v4l2_ctrl_modify_dimensions() would be a good name.
> 
> I can make something for that if you both agree with this proposal.

From a userspace point of view, we only need to be able to set the
control after setting the format. There's no need for control change
events (but I don't mind if they're there of course, even if I think
they won't be very usable in practice).

From an API point of view, I'd like a clear and documented behaviour for
what happens to the control value when the format is changed. It can be
a global behaviour, or a control-specific behaviour, I don't mind much.

> >> +
> >>  static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
> >>  	.ops = &vivid_user_gen_ctrl_ops,
> >>  	.id = VIVID_CID_U16_MATRIX,
> >> @@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
> >>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
> >>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> >>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
> >> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
> >>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
> >>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
> >>  

-- 
Regards,

Laurent Pinchart
