Return-Path: <linux-media+bounces-38208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA09B0D5B5
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 11:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB25AA2CF6
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01CE2CCC1;
	Tue, 22 Jul 2025 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5Tr6YSl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1978F1DE2B5;
	Tue, 22 Jul 2025 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175963; cv=none; b=UcnC7uBagwJHR/7rd8sWJdZFdui+1sGF/oDkGMspbJmrrkzvZMHJPv/A243Tiw8//O53zhVdDWAPJMT9CekYSZY4gaANbYUxnbWvSFk8D4WLfUWOt14J37+XnrBvgATtDk7GJSZX35FtKyIK+fPPwpoSb5T6cqggtcz2wMuerPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175963; c=relaxed/simple;
	bh=Nwdkj1kr2rK/j77XUJHH7vixRUv2FJO1h9CH+6r1NUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yfrkkeaf8ruayM5hcACDcl36JpyPKgWMwlxyz+S/xxO6wbfz5UHb3ojDO6T6ASQozGYuBHLPbDc6rArkxDXm1v6Qx+OjgFW0mXyrXeSqjoTJzjgemWBoP/fFavxFhqzD6jfIriZKTcOrOPbkX7LHo6odR/lmcjaQZFXR+11P5Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5Tr6YSl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9831C4CEEB;
	Tue, 22 Jul 2025 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753175962;
	bh=Nwdkj1kr2rK/j77XUJHH7vixRUv2FJO1h9CH+6r1NUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V5Tr6YSl7tQB2eeE5109l/f/dsAgAyA2miZ04Ekj2t2cZX3K126/0/oTKaSdr1MF+
	 RhlObg1mcDij1c1rQJ8EqAldA0lPyWf3z+wg86rFUXW8MzYeLXn+OUvDwFvBvtLRlK
	 p3fOm+/uTs+o+A8y0O7WVKZ6y1RyRcLMGafG5HJyZAC5JLj7RUmGWa8c8wSDXxH8Sl
	 wcySvX3I+Ech1Rys4TPx26PChUiHxQ2eOqrF8+RKO5EUA9sWxgpGBBJYTUEjePU1CF
	 xhQGA3SGgPZpZLkuUEWh0cyxldjxB6e72tb3Sjdyy7mN6GuYhKUag+qeCXiX/golr1
	 OqNZEjn4MtF2g==
Message-ID: <2ea2202c-d9bf-4fc1-a33f-2565ebe1d425@kernel.org>
Date: Tue, 22 Jul 2025 11:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov8865: Preserve hflip in
 ov8865_mode_binning_configure
To: Allen Ballway <ballway@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250717-su-v1-1-0f740fd8bfb6@chromium.org>
 <7ebb8be3-ce67-4989-bae6-8459aef74528@kernel.org>
 <CAEs41JAt5Hjp7G6LPr36e+BT0dp6RU5p25kzCwnwBpBfF-3dJw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAEs41JAt5Hjp7G6LPr36e+BT0dp6RU5p25kzCwnwBpBfF-3dJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 21-Jul-25 7:46 PM, Allen Ballway wrote:
> Hello,
> 
> On Mon, Jul 21, 2025 at 4:51 AM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 17-Jul-25 11:07 PM, Allen Ballway wrote:
>>> Prevents ov8865_mode_binning_configure from overwriting the hflip
>>> register values. Allows programs to configure the hflip.
>>>
>>> Signed-off-by: Allen Ballway <ballway@chromium.org>
>>
>> Thank you for your patch.
>>
>>> ---
>>>  drivers/media/i2c/ov8865.c | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>>> index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..40a852d31f13aff960acfd09b378d71525e19332 100644
>>> --- a/drivers/media/i2c/ov8865.c
>>> +++ b/drivers/media/i2c/ov8865.c
>>> @@ -1746,7 +1746,13 @@ static int ov8865_mode_binning_configure(struct ov8865_sensor *sensor,
>>>       if (ret)
>>>               return ret;
>>>
>>> -     value = OV8865_FORMAT2_HSYNC_EN;
>>> +     ret = ov8865_read(sensor, OV8865_FORMAT2_REG, &value);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     value &= OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
>>> +               OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
>>> +     value |= OV8865_FORMAT2_HSYNC_EN;
>>>
>>>       if (mode->binning_x)
>>>               value |= OV8865_FORMAT2_FST_HBIN_EN;
>>
>> this change should not be necessary. Lets assume we start
>> with the sensor runtime-suspended, then ov8865_resume()
>> will call:
>>
>> ov8865_sensor_power(true)
>> ov8865_sensor_init()
>>   ov8865_state_configure()
>>     ov8865_mode_configure()
>>       ov8865_mode_binning_configure()
>> __v4l2_ctrl_handler_setup()
>>
>> Where the __v4l2_ctrl_handler_setup() call will apply
>> all control settings including hflip.
>>
>> So unless you manage to hit a code-path where somehow
>> ov8865_state_configure() gets called without calling
>> __v4l2_ctrl_handler_setup() afterwards then this should
>> not be necessary.
> 
> ov8865_state_configure() is also being called from ov8865_set_fmt(),
> and makes no calls to __v4l2_ctrl_handler_setup(). I'm not sure if
> calling __v4l2_ctrl_handler_setup() here as well is the right fix, but
> the driver ov8865 seems to be based upon, ov5648, seems to avoid
> this issue by preserving the flip values when setting the binning
> register values in ov5648_mode_configure by using
> ov5648_update_bits() rather than ov5648_write(). I believe that we
> just need to preserve the register values unrelated to binning inside
> ov8865_mode_binning_configure, possibly by just using
> ov8865_update_bits() instead of ov8865_write().

But you cannot call ov8865_set_fmt() while streaming, since
it has :

        if (sensor->state.streaming) {
                ret = -EBUSY;
                goto complete;
        }

in there.

And when not streaming the sensor is off. So inside ov8865_state_configure()
the ov8865_mode_configure() and thus ov8865_mode_binning_configure()
will be skipped since that is protected by if (!pm_runtime_suspended())
as mentioned before this is all a bit messy in this driver and it would
be good to untangle this a bit, I think the ov8865_mode_configure()
should be moved out of ov8865_state_configure() and instead done
separately on power-up.

Regards,

Hans


