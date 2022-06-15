Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D1854C2BB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 09:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343910AbiFOHjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 03:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235299AbiFOHjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 03:39:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ABB38DB0;
        Wed, 15 Jun 2022 00:39:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 646C5B81C77;
        Wed, 15 Jun 2022 07:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470EEC34115;
        Wed, 15 Jun 2022 07:39:12 +0000 (UTC)
Message-ID: <be0db6d8-b205-f8a9-8674-8c1e01c3a3a0@xs4all.nl>
Date:   Wed, 15 Jun 2022 09:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 3/9] vivid: add dynamic array test control
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, stanimir.varbanov@linaro.org,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-4-xavier.roumegue@oss.nxp.com>
 <Yqj20J9QaAV6ZNes@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Yqj20J9QaAV6ZNes@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/14/22 23:00, Laurent Pinchart wrote:
> Hi Xavier and Hans,
> 
> Thank you for the patch.
> 
> On Tue, May 03, 2022 at 11:39:19AM +0200, Xavier Roumegue wrote:
>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Add a dynamic array test control to help test support for this
>> feature.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> index e7516dc1227b..7267892dc18a 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> @@ -34,6 +34,7 @@
>>  #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
>>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
>> +#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
>>  
>>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
>> @@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
>>  	.dims = { 1 },
>>  };
>>  
>> +static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
>> +	.ops = &vivid_user_gen_ctrl_ops,
>> +	.id = VIVID_CID_U32_DYN_ARRAY,
>> +	.name = "U32 Dynamic Array",
>> +	.type = V4L2_CTRL_TYPE_U32,
>> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>> +	.def = 50,
>> +	.min = 10,
>> +	.max = 90,
>> +	.step = 1,
>> +	.dims = { 100 },
>> +};
> 
> To meaningfully test this, don't we need the vivid driver to change the
> dimension ? Or is it meant to only test changes made by the application
> ?

dims[0] is the maximum number of elements allowed, it is not the actual
size of the control. The application sets the control to a size between
1 and dims[0] (100 in this case) elements.

When the control is created it will have just 1 element containing the
default control value.

Regards,

	Hans

> 
>> +
>>  static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
>>  	.ops = &vivid_user_gen_ctrl_ops,
>>  	.id = VIVID_CID_U16_MATRIX,
>> @@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
>> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
>>  
> 
