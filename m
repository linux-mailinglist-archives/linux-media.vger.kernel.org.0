Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5210634A19F
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 07:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhCZGSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 02:18:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:56371 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230093AbhCZGRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 02:17:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Pfmrl3FfJ43ycPfmvl2u0d; Fri, 26 Mar 2021 07:17:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616739465; bh=5uOZIZSOTqAvz07Fk5GkxoN/Wo8q8GF86EaWZYMIhDM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WMWOh6uuBSxa/NdjZkLqOl48/8Tuqk/pw6I7t2NiZtFrTeN5/4Qit56l+VFgEAYxs
         som4Yi0Ft8KJ4qxipbBWK58BXw0P5eFOobiyJkRUe4h1Ttbxr/kbboOhoUNN5Xf1Dv
         Z0YkQt5Fe7vKEbjI3TarYnb4wUaWADra6AaVy9WZWesBpw6Ee/lJmE5vmo7Odv4fUT
         sS8JkxMkbwO5NNG1REYcsizTOW5stD1muZJkRvZefDthcbZkMT+iXUA3Z32XoDkGX7
         xwH2Q4yOC4K49BSEE1CItrequNECyqZRfqakzngtbmXd4w08ke6WKGNSydFReyIkWf
         Q++CRae5Do7vw==
Subject: Re: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Archit Taneja <architt@codeaurora.org>
References: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
 <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <043b5662-d134-4b92-8be3-73c01feeee2a@xs4all.nl>
Date:   Fri, 26 Mar 2021 07:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLz5AoAcv1bcXIiZT8TWYOQKJbgSD64fA+7tZg7US5I1u6jHSOX4c3f7ZgsAPkrutw9ifsQIYRJI0st2C6KvyQz/JAHWK6TKJJB0bN8eJY1QVtwfzvxj
 rynJrq9LyLNmDeJXhkM0CiU13eMFtomZg1Afx0CT6Z3F5wIpqPclwBWpZIoI0wMPyIxcSUd6OlJrNT/pPpu8SELrx4OCLxdjcDjcYhucKs2/pEE2nNx7g0n6
 mkDVDP5iBCE63T4MDdcdDPfxV9wjg6ZeScjycRfZ7PfAGjzQZFbiDLyUI/2tixN96Mg+rBOHfyFn41YUrqWjBITYCb2Fs8MB0wpLrJqctDLZZB2QARwMWUKN
 xnt0JaPM+9gRZIJREA4SD6wUc5JDCg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On 26/03/2021 02:00, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, Mar 24, 2021 at 09:53:32AM +0100, Hans Verkuil wrote:
>> While testing support for large (> 256 bytes) EDIDs on the Renesas
>> Koelsch board I noticed that the adv7511 bridge driver only read the
>> first two blocks.
>>
>> The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
>> handled this correctly.
>>
>> Besides a simple bug when setting the segment register (it was set to the
>> block number instead of block / 2), the logic of the code was also weird.
>> In particular reading the DDC_STATUS is odd: this is unrelated to EDID
>> reading.
> 
> Bits 3:0 of DDC_STATUS report the DDC controller state, which can be
> used to wait until the DDC controller is idle (it reports, among other
> possible states, if an EDID read is in progress). Other options are
> possible of course, including waiting for ADV7511_INT0_EDID_READY as
> done in adv7511_wait_for_edid(), but I wonder if the !irq case in
> adv7511_wait_for_edid() wouldn't be better of busy-looping on the DDC
> status instead of running the interrupt handler manually. That's
> unrelated to this patch though.
> 
>> The reworked code just waits for any EDID segment reads to finish (this
>> does nothing if the a segment is already read), checks if the desired
>> segment matches the read segment, and if not, then it requests the new
>> segment and waits again for the EDID segment to be read.
>>
>> Finally it checks if the currently buffered EDID segment contains the
>> desired EDID block, and if not it will update the EDID buffer from
>> the adv7511.
>>
>> Tested with my Koelsch board and with EDIDs of 1, 2, 3 and 4 blocks.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> Testing on the Renesas board also requires these two adv7604 patches
>> if you want to test with an HDMI cable between the HDMI input and output:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/00882808-472a-d429-c565-a701da579ead@xs4all.nl/
>> https://patchwork.linuxtv.org/project/linux-media/patch/c7093e76-ffb4-b19c-f576-b264f935a3ce@xs4all.nl/
>> ---
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> index 76555ae64e9c..9e8db1c60167 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -328,6 +328,7 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,
>>  static void __adv7511_power_on(struct adv7511 *adv7511)
>>  {
>>  	adv7511->current_edid_segment = -1;
>> +	adv7511->edid_read = false;
>>
>>  	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
>>  			   ADV7511_POWER_POWER_DOWN, 0);
>> @@ -529,29 +530,35 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>>  	struct adv7511 *adv7511 = data;
>>  	struct i2c_msg xfer[2];
>>  	uint8_t offset;
>> +	unsigned int cur_segment;
>>  	unsigned int i;
>>  	int ret;
>>
>>  	if (len > 128)
>>  		return -EINVAL;
>>
>> -	if (adv7511->current_edid_segment != block / 2) {
>> -		unsigned int status;
>> +	/* wait for any EDID segment reads to finish */
>> +	adv7511_wait_for_edid(adv7511, 200);
> 
> Why do we need to wait for the EDID read to complete here ? Does the
> ADV7511 initiate an EDID read by itself that we need to wait for it to
> complete ?

Yes. When powered on it will automatically start to read the first segment.

> 
>>
>> -		ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
>> -				  &status);
>> +	ret = regmap_read(adv7511->regmap, ADV7511_REG_EDID_SEGMENT, &cur_segment);
>> +	if (ret < 0)
>> +		return ret;
> 
> Do we need to read this from the device, can't we instead use
> current_edid_segment ?

We can, provided we take into account that after poweron current_edid_segment is -1,
and in that case we must not set ADV7511_REG_EDID_SEGMENT again.

I'll make that change.

> 
>> +
>> +	/*
>> +	 * If the current read segment does not match what we need, then
>> +	 * write the new segment and wait for it to be read.
>> +	 */
>> +	if (cur_segment != block / 2) {
>> +		adv7511->edid_read = false;
>> +		cur_segment = block / 2;
>> +		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
>> +			     cur_segment);
>> +		ret = adv7511_wait_for_edid(adv7511, 200);
>>  		if (ret < 0)
>>  			return ret;
>> +	}
>>
>> -		if (status != 2) {
>> -			adv7511->edid_read = false;
>> -			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
>> -				     block);
>> -			ret = adv7511_wait_for_edid(adv7511, 200);
>> -			if (ret < 0)
>> -				return ret;
>> -		}
>> -
>> +	if (adv7511->current_edid_segment != cur_segment) {
> 
> Do you need to test this condition separately from the previous one ?

Yes, again for the initial power on case where segment 0 has been read
without ADV7511_REG_EDID_SEGMENT being written by us, and so we still
need to read out segment 0 from the adv7511.

I'll add some comments in v2.

> 
>>  		/* Break this apart, hopefully more I2C controllers will
>>  		 * support 64 byte transfers than 256 byte transfers
>>  		 */
>> @@ -579,7 +586,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>>  			offset += 64;
>>  		}
>>
>> -		adv7511->current_edid_segment = block / 2;
>> +		adv7511->current_edid_segment = cur_segment;
>>  	}
>>
>>  	if (block % 2 == 0)
> 

Regards,

	Hans
