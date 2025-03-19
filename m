Return-Path: <linux-media+bounces-28497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCFCA692CE
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09D2B8A7242
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101301D61A5;
	Wed, 19 Mar 2025 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZKAJYoth"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297171BD9C9
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396379; cv=none; b=URy0XeBUj6TtaIHVLhox6OWbXXZyHQ8EOV56Q/6n+Tzk5grqh1KRlr0y2v5UKOgKWX56Ibh6fdHrujk1d2zywsp6iBAfLPsq2/0lMfrcuMJdwkSO3IX9cBey6InNLfolEN9TUKH/y71CeXz5qxOj1d5SQd6ribNyhz6emcwzAeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396379; c=relaxed/simple;
	bh=o0r34JYdkQHirwKUjCJGJQp3CMt9KfARq+du8usxv14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kItR/UCW/LILUxLAY4VpsREORQEljI+Q+n5suUrBsNPJKOOnf9tPg8giqN90klKFYsF7fXrwiUXgukEYRqPHxTDtorcwi2SZDyp8N05JyKK0ratjxQLLts33lYm2AVEfGR3+eeWENE6ayLg87zdKLEOJJf23lh2YgxwiyiN304o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZKAJYoth; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742396376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wPoNDAfO0Cmp+8U1jcyLsho4cKi/6IUswe3DktWbQ0=;
	b=ZKAJYothRi4DRU3cPKUxRiKRrVaQq6ubh01zhQm3MUfQ/7EXpok+o2Ja3DivHOjbwEkNXg
	CeksqlmwUR2JwlkzuVmKIaP60QcEqvh8nbYVyCdr1N1MkUuR/OKB+xDdmJ0ZfSf63YWwwh
	8V7nedzDZkInlx8JX12mlonpB0V1pbE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-G6-TTaCNOIeivut3KM_L-A-1; Wed, 19 Mar 2025 10:59:34 -0400
X-MC-Unique: G6-TTaCNOIeivut3KM_L-A-1
X-Mimecast-MFC-AGG-ID: G6-TTaCNOIeivut3KM_L-A_1742396373
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac297c7a0c2so540105366b.3
        for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 07:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396373; x=1743001173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wPoNDAfO0Cmp+8U1jcyLsho4cKi/6IUswe3DktWbQ0=;
        b=ljy5iFe4HawH1Vy7W91+vP/k3HeHCDIHHtTDiY4oMheMKNpdP2tqDfbbbyzzaHJ1nG
         CiiOv0eaEkLpRWufwX63Z6Q7Zb+/dEXLypL7nh/8GlAWOF0ujXCfG/DaUvbgpuK7YHpa
         OsEOdkLMcfYfgrYxc9Rsib3NBvo3sjxUpAqGFy43Z4ClN1AAST6uPkSnh93Ndwu3znA6
         bPuSpbFKIiRB5Pq1THPvxRKAiUOSzf/W3KqAHdc5yjqiXKnO0Mvd05mcwcUhvFzizVgA
         fkvM57w+LXKfpDuecWB43gLb6Zc4458uKRizZxcllCd3/+WITkkjyS1axdA5LRPB8vMM
         nbmg==
X-Forwarded-Encrypted: i=1; AJvYcCWs45qcYJctCrBbgtJa2BXBnZ3ndeHZnleRrleeVCCWU7RNY3sHGflVssnY3ou058RHWxZ9PdNXU/IhEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrql1Kv3Z/0XMB+ZWOcFSS0mHnxf9zch5mLo4PSqQ45/ZD7HVF
	SNGV4L9f2hj8LeOIDdF11eFGvyl0Xzm4kUbq4PSHQJptg7vbmrhODq4YKR7Q+R951luL4w8xpNY
	BnAiG6mc5QF9HQFyrvyot1e2mdwaaZpeXIZ/Kt3ftYqmBD6O75Wj7KQozG0MT
X-Gm-Gg: ASbGncvxYARg/aRpjzvZpwB67LIXKY9eRu8UI61ptx0yx6qT5gCgDHa4L9iFDD4Frd0
	8sbg9sKV8JmF9uIxizC8pqB3yg4lr6yzxBDi+wWu86N2bQnTEMKP/U04F1BIw+Y7eNq6Ui2sQVR
	NOOiXMReE6WaA3qSerNnrvHhJd30egzjd+NHmCpbDMo+UVgATT93k9qyQ1XqaBvyeoCZMAcuZRD
	1tO0A66SqEO3A0M6dBVp4/ayuU9wuBrO6T5bs/IS/AeTyyn5/SpXzWBQLhCavvwWTAlZxhUHDy1
	YAsx2fxBCqkv9mPA0Tkhrcf0pw9dvq8EisY756tHZv5Xl3teCR4s9oB4O0C60550wXp0JGCoTGM
	OpfJUL+B/20/yt392Ez6pNgwWT4LQB0eEs2VnosfgJB44QajTmQQeBI7pCcYECusIMQ==
X-Received: by 2002:a17:907:2d14:b0:ac1:fb60:2269 with SMTP id a640c23a62f3a-ac3b7c67512mr331467166b.27.1742396373185;
        Wed, 19 Mar 2025 07:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqREbNMkDcG8nF1+7LEQ0MUftR3JYUTijz3tpnauyqe4Tk7Bo1aUGapgAd6pOgabXPXIofvg==
X-Received: by 2002:a17:907:2d14:b0:ac1:fb60:2269 with SMTP id a640c23a62f3a-ac3b7c67512mr331462366b.27.1742396372559;
        Wed, 19 Mar 2025 07:59:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefa2sm1015794366b.5.2025.03.19.07.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 07:59:31 -0700 (PDT)
Message-ID: <20d55eba-d802-46c1-a08e-d836eea2717f@redhat.com>
Date: Wed, 19 Mar 2025 15:59:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/1] media: i2c: Add Omnivision OV02C10 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Ingvar Hagelund <ingvar@redpill-linpro.com>,
 Joachim Reichel <joachim.reichel@posteo.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hao Yao <hao.yao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250314101125.9853-2-hdegoede@redhat.com>
 <Z9QlNEP8aL1XdlAv@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z9QlNEP8aL1XdlAv@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 14-Mar-25 1:46 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the update.
> 
> On Fri, Mar 14, 2025 at 11:11:25AM +0100, Hans de Goede wrote:
>> From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>>
>> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
>> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
>>
>> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
>> driver and the libcamera software ISP code.
>>
>> Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com>
>> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

<snip>

>> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
>> new file mode 100644
>> index 000000000000..5626aa2fe62c
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov02c10.c
>> @@ -0,0 +1,1012 @@

<snip>

>> +static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
> 
> Could you use struct cci_reg_sequence for this?
> 
>> +	{0x0301, 0x08},
> 
> { CCI_REG8(0x0301), 0x08 },
> 
> etc.
> 
> That would also enable using human-readable names in this list.

TBH I would rather not, adding the CCI_REGx everywhere will make
it harder to keep the out of tree code in sync with this, using
raw struct reg_sequence combined with regmap_multi_reg_write()
is sort of the norm for drivers converted to the CCI helpers.

Also while using symbolic register names (defines) greatly
improves the readability of other code accessing the registers,
I find it unhelpful for these large just send a bunch of
register values to the sensor cases, especially since for many
of the addresses we've no clue what we're sending / what 
the register does.

> 
>> +	{0x0303, 0x06},
>> +	{0x0304, 0x01},
>> +	{0x0305, 0xe0},

<snip>

>> +};
>> +
>> +static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
>> +	{0x301b, 0xd2},
>> +	{0x3027, 0xe1},
>> +	{0x380c, 0x08},
>> +	{0x380d, 0xe8},
>> +	{0x380e, 0x04},
>> +	{0x380f, 0x8c},
>> +	{0x394e, 0x0b},
>> +	{0x4800, 0x24},
>> +	{0x5000, 0xf5},
>> +	/* plls */
>> +	{0x0303, 0x05},
>> +	{0x0305, 0x90},
>> +	{0x0316, 0x90},
>> +	{0x3016, 0x12},
>> +};
>> +
>> +static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
>> +	{0x301b, 0xf0},
>> +	{0x3027, 0xf1},
>> +	{0x380c, 0x04},
>> +	{0x380d, 0x74},
>> +	{0x380e, 0x09},
>> +	{0x380f, 0x18},
>> +	{0x394e, 0x0a},
>> +	{0x4041, 0x20},
>> +	{0x4884, 0x04},
>> +	{0x4800, 0x64},
>> +	{0x4d00, 0x03},
>> +	{0x4d01, 0xd8},
>> +	{0x4d02, 0xba},
>> +	{0x4d03, 0xa0},
>> +	{0x4d04, 0xb7},
>> +	{0x4d05, 0x34},
>> +	{0x4d0d, 0x00},
>> +	{0x5000, 0xfd},
>> +	{0x481f, 0x30},
> 
> It's surprising to have more registers when the number of lanes is 2. I
> guess for 1 lane case it's using defaults?

I guess so. At your request I split the registers which were
different for the 1 / 2 lane cases into 2 separate registerlists
and some register writes where only in the long 2 lane register list
of the previous version.

> 
>> +	/* plls */
>> +	{0x0303, 0x05},
>> +	{0x0305, 0x90},
>> +	{0x0316, 0x90},
>> +	{0x3016, 0x32},
>> +};
>> +

<snip>

>> +static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!pattern)
>> +		return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> +				       BIT(7), 0, NULL);
>> +
>> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> +			0x03, pattern - 1, &ret);
>> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> +			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
> 
> I'd do here:
> 
> 	return cci_update_bits(...);

Since we are relying on the error preserving / propagating
behavior of the CCI helpers here that feels weird / inconsistent,
I would expect either:

	ret = cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
			      0x03, pattern - 1, NULL);
	if (ret)
		return ret;

	return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
			       BIT(7), OV02C10_TEST_PATTERN_ENABLE, NULL);
}

or:

	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
			0x03, pattern - 1, &ret);
	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
	return ret;
}

not a mix of the 2, with my preference going to the latter.

<snip>

>> +static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>> +{
>> +	struct v4l2_ctrl_handler *ctrl_hdlr;
>> +	const struct ov02c10_mode *cur_mode;
>> +	s64 exposure_max, h_blank, pixel_rate;
>> +	u32 vblank_min, vblank_max, vblank_default, vts_def;
>> +	int ret = 0;
>> +
>> +	ctrl_hdlr = &ov02c10->ctrl_handler;
>> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>> +	if (ret)
>> +		return ret;
> 
> v4l2_ctrl_handler_init() sets the handler's error state so you can omit
> this check.

Ok, that is good to know, will fix.

<snip>


>> +static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
>> +	const struct reg_sequence *reg_sequence;
>> +	int sequence_length;
>> +	int ret = 0;
>> +
>> +	reg_sequence = ov02c10->cur_mode->reg_sequence;
>> +	sequence_length = ov02c10->cur_mode->sequence_length;
>> +	ret = regmap_multi_reg_write(ov02c10->regmap,
>> +				     reg_sequence, sequence_length);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to set mode\n");
>> +		return ret;
>> +	}
>> +
>> +	reg_sequence = ov02c10->cur_mode->lane_settings[ov02c10->mipi_lanes - 1];
>> +	sequence_length = ov02c10->cur_mode->lane_settings_length[ov02c10->mipi_lanes - 1];
>> +	ret = regmap_multi_reg_write(ov02c10->regmap,
>> +				     reg_sequence, sequence_length);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to write lane settings\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_handler);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
>> +}
>> +
>> +static void ov02c10_stop_streaming(struct ov02c10 *ov02c10)
>> +{
>> +	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
>> +}
>> +
>> +static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_state *state,
>> +				  u32 pad, u64 streams_mask)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(&client->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov02c10_start_streaming(ov02c10);
> 
> I'd move the code from ov02c10_start_streaming() here. Up to you.

done for v10.

>> +	if (ret)
>> +		pm_runtime_put(&client->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov02c10_disable_streams(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state,
>> +				   u32 pad, u64 streams_mask)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +
>> +	ov02c10_stop_streaming(ov02c10);
> 
> I'd just do the register write here.

done for v10.

>> +	pm_runtime_put(&client->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +/* This function tries to get power control resources */
>> +static int ov02c10_get_pm_resources(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +
>> +	ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ov02c10->reset))
>> +		return dev_err_probe(dev, PTR_ERR(ov02c10->reset),
>> +				     "failed to get reset gpio\n");
>> +	if (ov02c10->reset)
>> +		fsleep(1000);
> 
> Is there a need to sleep here?

The idea was to ensure reset is asserted for at least 1 ms
(actually needs to be 2) when called from probe() immediately
after requesting the GPIO.

As discussed in wrt Bryan's reset handling patches, we also
need to ensure reset is asserted for 2ms on back to back power-off
power-on calls, so for v10 this has moved to power_on().

>> +
>> +	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
>> +	if (IS_ERR(ov02c10->img_clk))
>> +		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
>> +				     "failed to get imaging clock\n");
>> +
>> +	ov02c10->avdd = devm_regulator_get(dev, "avdd");
>> +	if (IS_ERR(ov02c10->avdd))
>> +		return dev_err_probe(dev, PTR_ERR(ov02c10->avdd),
>> +				     "failed to get avdd regulator\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov02c10_power_off(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +	int ret = 0;
>> +
>> +	gpiod_set_value_cansleep(ov02c10->reset, 1);
>> +
>> +	if (ov02c10->avdd)
>> +		ret = regulator_disable(ov02c10->avdd);
>> +
>> +	clk_disable_unprepare(ov02c10->img_clk);
>> +
>> +	return ret;
> 
> I'd return 0 always but complain if disabling the regulator fails.

Bryan's bulk regulator API changes already have made
this change for v10.

>> +}
>> +
>> +static int ov02c10_power_on(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(ov02c10->img_clk);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (ov02c10->avdd) {
>> +		ret = regulator_enable(ov02c10->avdd);
>> +		if (ret < 0) {
>> +			dev_err(dev, "failed to enable avdd: %d", ret);
>> +			clk_disable_unprepare(ov02c10->img_clk);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	gpiod_set_value_cansleep(ov02c10->reset, 0);
>> +	usleep_range(1500, 1800);
> 
> Accoding to the datasheet the minimum time from lifting reset is 5 ms +
> 8192 xclk cycles before the first SCCB transaction may proceed.

Ack, also fixed by Bryan.

>> +
>> +	return 0;
>> +}
>> +
>> +static int ov02c10_set_format(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *sd_state,
>> +			      struct v4l2_subdev_format *fmt)
>> +{
>> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>> +	const struct ov02c10_mode *mode;
>> +	s32 vblank_def, h_blank;
>> +
>> +	mode = v4l2_find_nearest_size(supported_modes,
>> +				      ARRAY_SIZE(supported_modes), width,
>> +				      height, fmt->format.width,
>> +				      fmt->format.height);
>> +
>> +	ov02c10_update_pad_format(mode, &fmt->format);
>> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
>> +
>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return 0;
>> +
>> +	ov02c10->cur_mode = mode;
> 
> You don't really need cur_mode, do you? The driver supports a single mode
> and selecting the mode would ideally be based on sub-device state so I
> think it'd be better to just remove cur_mode.

Ok, I've removed this for the upcoming v10.

>> +	/* Update limits and set FPS to default */
>> +	vblank_def = mode->vts_min * ov02c10->mipi_lanes - mode->height;
>> +	__v4l2_ctrl_modify_range(ov02c10->vblank, mode->vts_min - mode->height,
>> +				 OV02C10_VTS_MAX - mode->height, 1, vblank_def);
>> +	__v4l2_ctrl_s_ctrl(ov02c10->vblank, vblank_def);
>> +	h_blank = mode->hts - mode->width;
>> +	__v4l2_ctrl_modify_range(ov02c10->hblank, h_blank, h_blank, 1, h_blank);
>> +
>> +	return 0;
>> +}
>> +

<snip>

>> +static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
>> +{
>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY
>> +	};
>> +	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
>> +	unsigned long link_freq_bitmap;
>> +	u32 mclk;
>> +	int ret;
>> +
>> +	/*
>> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
>> +	 * wait for this.
>> +	 */
>> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
>> +	if (!ep)
>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>> +				     "waiting for fwnode graph endpoint\n");
>> +
>> +	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> 
> The driver accesses a clock besides this, too. The frequency should be
> obtained from the clock if one exists. Meanwhile Mehdi has been working on
> <URL:https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/T/#u>.

Ack fixed for v10 (by a squashed patch from Bryan)

>> +	if (ret) {
>> +		fwnode_handle_put(ep);
>> +		return dev_err_probe(dev, ret,
>> +				     "reading clock-frequency property\n");
>> +	}
>> +
>> +	if (mclk != OV02C10_MCLK) {
>> +		fwnode_handle_put(ep);
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "external clock %u is not supported\n",
>> +				     mclk);
>> +	}
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>> +	fwnode_handle_put(ep);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
>> +
>> +	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>> +				       bus_cfg.nr_of_link_frequencies,
>> +				       link_freq_menu_items,
>> +				       ARRAY_SIZE(link_freq_menu_items),
>> +				       &link_freq_bitmap);
>> +	if (ret)
>> +		goto check_hwcfg_error;
>> +
>> +	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
>> +	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
>> +
>> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
>> +	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
>> +		ret = dev_err_probe(dev, -EINVAL,
>> +				    "number of CSI2 data lanes %u is not supported\n",
>> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
>> +		goto check_hwcfg_error;
>> +	}
>> +
>> +	ov02c10->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>> +
>> +check_hwcfg_error:
>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>> +	return ret;
>> +}
>> +
>> +static void ov02c10_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +
>> +	v4l2_async_unregister_subdev(sd);
>> +	v4l2_subdev_cleanup(sd);
>> +	media_entity_cleanup(&sd->entity);
>> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
>> +	pm_runtime_disable(&client->dev);
>> +	if (!pm_runtime_status_suspended(&client->dev)) {
>> +		ov02c10_power_off(&client->dev);
>> +		pm_runtime_set_suspended(&client->dev);
>> +	}
>> +}
>> +
>> +static int ov02c10_probe(struct i2c_client *client)
>> +{
>> +	struct ov02c10 *ov02c10;
>> +	int ret = 0;
> 
> The initialisation is redundant.

ack, fixed for v10.

>> +
>> +	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
>> +	if (!ov02c10)
>> +		return -ENOMEM;
>> +
>> +	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
>> +
>> +	/* Check HW config */
>> +	ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov02c10_get_pm_resources(&client->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +	if (IS_ERR(ov02c10->regmap))
>> +		return PTR_ERR(ov02c10->regmap);
>> +
>> +	ret = ov02c10_power_on(&client->dev);
>> +	if (ret) {
>> +		dev_err_probe(&client->dev, ret, "failed to power on\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = ov02c10_identify_module(ov02c10);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to find sensor: %d", ret);
>> +		goto probe_error_power_off;
>> +	}
>> +
>> +	ov02c10->cur_mode = &supported_modes[0];
>> +
>> +	ret = ov02c10_init_controls(ov02c10);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to init controls: %d", ret);
>> +		goto probe_error_v4l2_ctrl_handler_free;
>> +	}
>> +
>> +	ov02c10->sd.internal_ops = &ov02c10_internal_ops;
>> +	ov02c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	ov02c10->sd.entity.ops = &ov02c10_subdev_entity_ops;
>> +	ov02c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +	ov02c10->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ret = media_entity_pads_init(&ov02c10->sd.entity, 1, &ov02c10->pad);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to init entity pads: %d", ret);
>> +		goto probe_error_v4l2_ctrl_handler_free;
>> +	}
>> +
>> +	ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock;
>> +	ret = v4l2_subdev_init_finalize(&ov02c10->sd);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "failed to init subdev: %d", ret);
>> +		goto probe_error_media_entity_cleanup;
>> +	}
>> +
>> +	pm_runtime_set_active(&client->dev);
>> +	pm_runtime_enable(&client->dev);
>> +
>> +	ret = v4l2_async_register_subdev_sensor(&ov02c10->sd);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
>> +			ret);
>> +		goto probe_error_v4l2_subdev_cleanup;
>> +	}
>> +
>> +	pm_runtime_idle(&client->dev);
>> +	return 0;
>> +
>> +probe_error_v4l2_subdev_cleanup:
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_set_suspended(&client->dev);
>> +	v4l2_subdev_cleanup(&ov02c10->sd);
>> +
>> +probe_error_media_entity_cleanup:
>> +	media_entity_cleanup(&ov02c10->sd.entity);
>> +
>> +probe_error_v4l2_ctrl_handler_free:
>> +	v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);
>> +
>> +probe_error_power_off:
>> +	ov02c10_power_off(&client->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static DEFINE_RUNTIME_DEV_PM_OPS(ov02c10_pm_ops, ov02c10_power_off,
>> +				 ov02c10_power_on, NULL);
>> +
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id ov02c10_acpi_ids[] = {
>> +	{"OVTI02C1"},
> 
> Spaces inside braces, please.

Ack, fixed for v10.

> 
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
>> +#endif
>> +
>> +static struct i2c_driver ov02c10_i2c_driver = {
>> +	.driver = {
>> +		.name = "ov02c10",
>> +		.pm = pm_sleep_ptr(&ov02c10_pm_ops),
>> +		.acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
>> +	},
>> +	.probe = ov02c10_probe,
>> +	.remove = ov02c10_remove,
>> +};
>> +
>> +module_i2c_driver(ov02c10_i2c_driver);
>> +
>> +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
> 
> Shouldn't this include you / Heimir as well?

Ack, added MODULE_AUTHOR() lines for both Heimir and myself.

>> +MODULE_DESCRIPTION("OmniVision OV02C10 sensor driver");
>> +MODULE_LICENSE("GPL");

Regards,

Hans




