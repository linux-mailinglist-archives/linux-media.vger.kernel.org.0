Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D2B72B98C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 10:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjFLIBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 04:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjFLIAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 04:00:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECF32D46
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:00:12 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3978C547;
        Mon, 12 Jun 2023 09:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686556750;
        bh=GOTRubbB4huwgIsz6keyWCVrvNOj3UVS53NjE2efwik=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=OJyt3rrlOrdS0aMn0mHKWxV04bqjL6SPRxJ0xkSFQMirD2yz9BMQM8GFxbPdPEa+4
         ABgK/SlSjLwMYsjfPh4f7o1j+Itx4nMq0NgKBzM6Dfk3ReRbVDiEQ0/nNAXgCVsyhW
         4aNkgVtp63Fu43ZKYryUaWLnaP/trSOvC75yZ4B4=
Message-ID: <0e24ca78-31bf-a394-2134-3fcca1f5d379@ideasonboard.com>
Date:   Mon, 12 Jun 2023 08:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-2-hdegoede@redhat.com>
 <8575dadf-7db6-5c97-7fbb-1822c1fab0ee@ideasonboard.com>
 <c7d90ea3-6a87-4dba-5c53-d62d95a3bef9@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 01/28] media: ov2680: Remove auto-gain and auto-exposure
 controls
In-Reply-To: <c7d90ea3-6a87-4dba-5c53-d62d95a3bef9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 12/06/2023 08:44, Hans de Goede wrote:
> Hi Dan,
>
> On 6/12/23 08:53, Dan Scally wrote:
>> Morning Hans - thanks for the set
>>
>> On 07/06/2023 17:46, Hans de Goede wrote:
>>> Quoting the OV2680 datasheet:
>>>
>>> "3.2 exposure and gain control
>>>
>>> In the OV2680, the exposure time and gain are set manually from an external
>>> controller. The OV2680 supports manual gain and exposure control only for
>>> normal applications, no auto mode."
>>>
>>> And indeed testing with the atomisp_ov2680 fork of ov2680.c has shown that
>>> auto-exposure and auto-gain do not work.
>>>
>>> Note that the code setting the auto-exposure flag was broken, callers
>>> of ov2680_exposure_set() were directly passing !!ctrls->auto_exp->val as
>>> "bool auto_exp" value, but ctrls->auto_exp is a menu control with:
>>>
>>> enum  v4l2_exposure_auto_type {
>>>           V4L2_EXPOSURE_AUTO = 0,
>>>           V4L2_EXPOSURE_MANUAL = 1,
>>>      ...
>>>
>>> So instead of passing !!ctrls->auto_exp->val they should have been passing
>>> ctrls->auto_exp->val == V4L2_EXPOSURE_AUTO, iow the passed value was
>>> inverted of what it should have been.
>>>
>>> Also remove ov2680_g_volatile_ctrl() since without auto support the gain
>>> and exposure controls are not volatile.
>>>
>>> This also fixes the control values not being properly applied in
>>> ov2680_mode_set(). The 800x600 mode register-list also sets gain,
>>> exposure and vflip overriding the last set ctrl values.
>>>
>>> ov2680_mode_set() does call ov2680_gain_set() and ov2680_exposure_set()
>>> but did this before writing the mode register-list, so these values
>>> would still be overridden by the mode register-list.
>>>
>>> Add a v4l2_ctrl_handler_setup() call after writing the mode register-list
>>> to restore all ctrl values. Also remove the ctrls->gain->is_new check from
>>> ov2680_gain_set() so that the gain always gets restored properly.
>>>
>>> Last since ov2680_mode_set() now calls v4l2_ctrl_handler_setup(), remove
>>> the v4l2_ctrl_handler_setup() call after ov2680_mode_restore() since
>>> ov2680_mode_restore() calls ov2680_mode_set().
>>>
>>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>    drivers/media/i2c/ov2680.c | 162 ++++---------------------------------
>>>    1 file changed, 17 insertions(+), 145 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>>> index 54153bf66bdd..02204e185e2f 100644
>>> --- a/drivers/media/i2c/ov2680.c
>>> +++ b/drivers/media/i2c/ov2680.c
>>> @@ -85,15 +85,8 @@ struct ov2680_mode_info {
>>>      struct ov2680_ctrls {
>>>        struct v4l2_ctrl_handler handler;
>>> -    struct {
>>> -        struct v4l2_ctrl *auto_exp;
>>> -        struct v4l2_ctrl *exposure;
>>> -    };
>>> -    struct {
>>> -        struct v4l2_ctrl *auto_gain;
>>> -        struct v4l2_ctrl *gain;
>>> -    };
>>> -
>>> +    struct v4l2_ctrl *exposure;
>>> +    struct v4l2_ctrl *gain;
>>>        struct v4l2_ctrl *hflip;
>>>        struct v4l2_ctrl *vflip;
>>>        struct v4l2_ctrl *test_pattern;
>>> @@ -143,6 +136,7 @@ static const struct reg_value ov2680_setting_30fps_QUXGA_800_600[] = {
>>>        {0x380e, 0x02}, {0x380f, 0x84}, {0x3811, 0x04}, {0x3813, 0x04},
>>>        {0x3814, 0x31}, {0x3815, 0x31}, {0x3820, 0xc0}, {0x4008, 0x00},
>>>        {0x4009, 0x03}, {0x4837, 0x1e}, {0x3501, 0x4e}, {0x3502, 0xe0},
>>> +    {0x3503, 0x03},
>>
>> I'm confused why this was added to this mode but not the other two; according to the datasheet it's setting the AGC/AEC into manual but I can't see why it's only needed here?
> The original driver uses the 800x600 mode to also store "init_mode" registers,
> no matter what mode is set, first all 800x600 registers are written and then
> the other mode's registers are written over that.


Ah yeah I see it now. Looks good to me then: Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>
> This ugliness goes away later in the series when this gets renamed to
> ov2680_global_setting[] and all the mode specific registers are dropped
> because they are calculated based on crop + binning.
>
> When switching to calculating the mode registers the register poke also gets some docs :)
>
>          /* R MANUAL set exposure (0x01) and gain (0x02) to manual (hw does not do auto) */
>          {0x3503, 0x03},


That sounds like it will be much better

>
> Regards,
>
> Hans
>
