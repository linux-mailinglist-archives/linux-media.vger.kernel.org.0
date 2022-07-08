Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E92956B7AE
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237799AbiGHKtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237642AbiGHKtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:49:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D1084EF8
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:49:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2ECD262420
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 10:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05080C341C0;
        Fri,  8 Jul 2022 10:49:09 +0000 (UTC)
Message-ID: <f7b9da14-0478-b34c-6308-e56986fa60ef@xs4all.nl>
Date:   Fri, 8 Jul 2022 12:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 8/8] vivid: add pixel_array test control
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-9-hverkuil-cisco@xs4all.nl>
 <YsgKbQsqsCiAVpJB@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <YsgKbQsqsCiAVpJB@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/8/22 12:43, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Tue, Jun 28, 2022 at 02:05:23PM +0200, Hans Verkuil wrote:
>> This control will change dimensions according to the source resolution.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/test-drivers/vivid/vivid-core.h    |  1 +
>>  drivers/media/test-drivers/vivid/vivid-ctrls.c   | 14 ++++++++++++++
>>  drivers/media/test-drivers/vivid/vivid-vid-cap.c |  4 ++++
>>  3 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
>> index 176b72cb143b..e7b23ebc705e 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-core.h
>> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
>> @@ -227,6 +227,7 @@ struct vivid_dev {
>>  	struct v4l2_ctrl		*bitmask;
>>  	struct v4l2_ctrl		*int_menu;
>>  	struct v4l2_ctrl		*ro_int32;
>> +	struct v4l2_ctrl		*pixel_array;
>>  	struct v4l2_ctrl		*test_pattern;
>>  	struct v4l2_ctrl		*colorspace;
>>  	struct v4l2_ctrl		*rgb_range_cap;
>> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> index a78d676575bc..f98a651842ce 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> @@ -35,6 +35,7 @@
>>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
>>  #define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
>> +#define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
>>  
>>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
>> @@ -228,6 +229,18 @@ static const struct v4l2_ctrl_config vivid_ctrl_u8_4d_array = {
>>  	.dims = { 2, 3, 4, 5 },
>>  };
>>  
>> +static const struct v4l2_ctrl_config vivid_ctrl_u8_pixel_array = {
>> +	.ops = &vivid_user_gen_ctrl_ops,
>> +	.id = VIVID_CID_U8_PIXEL_ARRAY,
>> +	.name = "U8 Pixel Array",
>> +	.type = V4L2_CTRL_TYPE_U8,
>> +	.def = 0x80,
>> +	.min = 0x00,
>> +	.max = 0xff,
>> +	.step = 1,
>> +	.dims = { 640, 360 },
>> +};
>> +
>>  static const char * const vivid_ctrl_menu_strings[] = {
>>  	"Menu Item 0 (Skipped)",
>>  	"Menu Item 1",
>> @@ -1642,6 +1655,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
>> +	dev->pixel_array = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_pixel_array, NULL);
>>  
>>  	if (dev->has_vid_cap) {
>>  		/* Image Processing Controls */
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> index b9caa4b26209..6dc4091fcabb 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> @@ -381,6 +381,7 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
>>  void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
>>  {
>>  	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
>> +	u32 dims[V4L2_CTRL_MAX_DIMS] = {};
>>  	unsigned size;
>>  	u64 pixelclock;
>>  
>> @@ -459,6 +460,9 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
>>  	tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
>>  	tpg_s_pixel_aspect(&dev->tpg, vivid_get_pixel_aspect(dev));
>>  	tpg_update_mv_step(&dev->tpg);
>> +	dims[0] = dev->src_rect.width;
>> +	dims[1] = dev->src_rect.height;
>> +	v4l2_ctrl_modify_dimensions(dev->pixel_array, dims);
> 
> The implementation looks fine, but calling the init function (twice) on
> each element will make vivid_update_format_cap() pretty slow. How about
> going for a downsampled resolution here ?

Good point.

> 
> Also, this made me wonder if v4l2_ctrl_modify_dimensions() should return
> without doing anything if the new dimensions are identical to the
> current ones.

I think this should be a driver decision: if it calls v4l2_ctrl_modify_dimensions()
then I think it should expect that function to reset the array to default values.

If it doesn't want to do that if the dimensions are unchanged, then it can
test for that and simply not call this function.

Regards,

	Hans

> 
>>  }
>>  
>>  /* Map the field to something that is valid for the current input */
> 
