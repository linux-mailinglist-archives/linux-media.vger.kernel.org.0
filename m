Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B3D6A1892
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 10:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBXJQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 04:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBXJQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 04:16:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E58551F80
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 01:16:02 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 109C82E4;
        Fri, 24 Feb 2023 10:15:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677230160;
        bh=lecPq54icUABVMD65IuWggvwVCCZvBGW8B9+5c5/PSk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hRg7hVR1mpfvB2zJ9Wjppx8biIVBhPQZCUkuSOZwoxM8mQpU/YUYtEvWozmZd3Vui
         FMu2m3OsQv+ebLSJgo09mge3Gc7hr4EwC9KuXXB2bdTEmj091aT6yTvlcl9q+LNmli
         64jdD4/L5eW7JMAoQosjplpkUXwPxZhCU008Sg38=
Message-ID: <5a924e06-c056-a88e-614a-85df7c44a97d@ideasonboard.com>
Date:   Fri, 24 Feb 2023 11:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/3] media: ti: cal: Use subdev state
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-3-tomi.valkeinen@ideasonboard.com>
 <20230223173254.tjuq5odusrhjzw5b@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230223173254.tjuq5odusrhjzw5b@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/02/2023 19:32, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Wed, Feb 22, 2023 at 02:56:29PM +0200, Tomi Valkeinen wrote:
>> Change TI CAL driver to use subdev state. No functional changes
>> (intended).
>>
>> This allows us to get rid of the 'formats' field, as the formats are
>> kept in the state, and also the 'mutex' as we already have state locking.
> 
> I'm not sure I fully get how the ctrl_handler is used here, but
> shouldn't the state->lock be set to the ctrl_handler.lock so that
> controls and state interaction are guaranteed to be protected ?

Hmm, interesting point... As I mentioned in the other email, the ctrls 
are used in the non-MC mode, and they're the sensor subdev's controls. 
But the sensor is not visible to the userspace... Still, some locking is 
needed. But doesn't the sensor subdevice already add locking for its 
controls. Does it apply here, when the controls are exposed by the CAL. 
It's rather confusing, I need to look at this in more detail.

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti/cal/cal-camerarx.c | 134 ++++++-------------
>>   drivers/media/platform/ti/cal/cal-video.c    |  27 +++-
>>   drivers/media/platform/ti/cal/cal.h          |   8 --
>>   3 files changed, 60 insertions(+), 109 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
>> index 16ae52879a79..faafbd0e9240 100644
>> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
>> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
>> @@ -50,10 +50,16 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>>   	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>>   	u32 num_lanes = mipi_csi2->num_data_lanes;
>>   	const struct cal_format_info *fmtinfo;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *fmt;
>>   	u32 bpp;
>>   	s64 freq;
>>
>> -	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
>> +	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
>> +
>> +	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
>> +
>> +	fmtinfo = cal_format_by_code(fmt->code);
>>   	if (!fmtinfo)
>>   		return -EINVAL;
>>
>> @@ -620,34 +626,20 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct cal_camerarx, subdev);
>>   }
>>
>> -static struct v4l2_mbus_framefmt *
>> -cal_camerarx_get_pad_format(struct cal_camerarx *phy,
>> -			    struct v4l2_subdev_state *state,
>> -			    unsigned int pad, u32 which)
>> -{
>> -	switch (which) {
>> -	case V4L2_SUBDEV_FORMAT_TRY:
>> -		return v4l2_subdev_get_try_format(&phy->subdev, state, pad);
>> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
>> -		return &phy->formats[pad];
>> -	default:
>> -		return NULL;
>> -	}
>> -}
>> -
>>   static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> +	struct v4l2_subdev_state *state;
>>   	int ret = 0;
>>
>> -	mutex_lock(&phy->mutex);
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>
>>   	if (enable)
>>   		ret = cal_camerarx_start(phy);
>>   	else
>>   		cal_camerarx_stop(phy);
>>
>> -	mutex_unlock(&phy->mutex);
>> +	v4l2_subdev_unlock_state(state);
>>
>>   	return ret;
>>   }
>> @@ -657,62 +649,44 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>>   					  struct v4l2_subdev_mbus_code_enum *code)
>>   {
>>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
>> -	int ret = 0;
>> -
>> -	mutex_lock(&phy->mutex);
>>
>>   	/* No transcoding, source and sink codes must match. */
>>   	if (cal_rx_pad_is_source(code->pad)) {
>>   		struct v4l2_mbus_framefmt *fmt;
>>
>> -		if (code->index > 0) {
>> -			ret = -EINVAL;
>> -			goto out;
>> -		}
>> +		if (code->index > 0)
>> +			return -EINVAL;
>>
>> -		fmt = cal_camerarx_get_pad_format(phy, state,
>> -						  CAL_CAMERARX_PAD_SINK,
>> -						  code->which);
>> +		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
>> +						 CAL_CAMERARX_PAD_SINK);
> 
> By removing the lock here and in cal_camerarx_sd_set_fmt() don't we
> risk that the format on the sink pad is updated while we fetch it
> here? I know it's a very tiny window, but should we lock the state
> just to be safe ?

For a state aware subdev, any subdev ops that get the state as a 
parameter, the state is already locked. So we don't need any locking 
here anymore.

  Tomi

