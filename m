Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8E3442448
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhKAXsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhKAXsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:48:22 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCD1C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:45:48 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d5so15240808wrc.1
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=we7MK4HoxJBSscbXlpqnD9ZS8iWcONaA633Zd7mUrCw=;
        b=JrUCnCFv+p0lw6I69ifNIR/ZXE3tgjsAyjI3ZQ4/kGh5Kyo9dq22sJmFsCq5lZAP+P
         OLKtWVOIy+pF8EKLPu46aRFAj62z87bvmUlqpZU7xXLzvlNHhLVTMqr6wXktWrqixna8
         /+MPzaUjPMA3OXghYQ42XFTLKEIssH/NwZqs+tG8doB+C7TC9+/eW6yx324uWPgnFWBz
         70oj0T9hyXXNywN4FWKP1Xj3+WRUUC5f31GOfiZoSbGaQozse75EMt0rpoojh06xuP/J
         k4E+uV9d4a/1v5IV+EcLaEOweq0Pwuh1R+LhaGbtkr3vws0GBZIikxsvZaQ5mPaxfFlg
         21rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=we7MK4HoxJBSscbXlpqnD9ZS8iWcONaA633Zd7mUrCw=;
        b=g05CHgHhJZdYWshUzpXVTQQ+8Jcf/V9u+JfSEgPIzO6YDmkSJAKCyA/iY5WvH+qTRw
         Efl3zsm6yrBSek5gHGP64zRFR0owe+xa0Tq3tpTRqdAlgBWrRvnnqy15n3g03sUyil7I
         Yyv3fyguttiNru6n2GgUwZM0tO1NnNGrmRrUx30+XfqBKucd5BO3i1B1VPJGBx+UHSWC
         h6fUhjZWJVkX7QtVmDMKm8xardPF3tmlh7o4draen6FD6jAPxl7UX6gKKT133bIN10dO
         d3/2fImjLoYX3IINA/cSG0nRXheT37a6SPgcZcahRs10OEUkYGl80rR/lHggzRHFCG0y
         4AaQ==
X-Gm-Message-State: AOAM5332mbp5632nB1E63i5rtsK5jC1aZCFXeDSiD4KU5PEfQFCkgvy2
        Ny+4UxZtpZ/uyaZ0bzpSz2M=
X-Google-Smtp-Source: ABdhPJyKZmb81FWtJIqEjtwK5mkUU/o1fU7DGTx3DM8BhQXM7w9xoNwFF1w/gGzXfRSyJVdNSSCuCQ==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr16926203wru.388.1635810347118;
        Mon, 01 Nov 2021 16:45:47 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id c15sm14951041wrs.19.2021.11.01.16.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 16:45:46 -0700 (PDT)
Subject: Re: [PATCH v4 07/16] media: i2c: Add vblank control to ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-8-djrscally@gmail.com>
 <YX//lBBlskOv+37i@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <fbf8f587-9532-d657-a030-0a84b14eaa49@gmail.com>
Date:   Mon, 1 Nov 2021 23:45:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YX//lBBlskOv+37i@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 01/11/2021 14:54, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Nov 01, 2021 at 12:11:10AM +0000, Daniel Scally wrote:
>> Add a V4L2_CID_VBLANK control to the ov8865 driver.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index a832938c33b6..f741c0713ca4 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -183,6 +183,8 @@
>>  #define OV8865_VTS_H(v)				(((v) & GENMASK(11, 8)) >> 8)
>>  #define OV8865_VTS_L_REG			0x380f
>>  #define OV8865_VTS_L(v)				((v) & GENMASK(7, 0))
>> +#define OV8865_TIMING_MAX_VTS			0xffff
>> +#define OV8865_TIMING_MIN_VTS			0x04
>>  #define OV8865_OFFSET_X_H_REG			0x3810
>>  #define OV8865_OFFSET_X_H(v)			(((v) & GENMASK(15, 8)) >> 8)
>>  #define OV8865_OFFSET_X_L_REG			0x3811
>> @@ -675,6 +677,7 @@ struct ov8865_state {
>>  struct ov8865_ctrls {
>>  	struct v4l2_ctrl *link_freq;
>>  	struct v4l2_ctrl *pixel_rate;
>> +	struct v4l2_ctrl *vblank;
>>  
>>  	struct v4l2_ctrl_handler handler;
>>  };
>> @@ -2225,6 +2228,20 @@ static int ov8865_test_pattern_configure(struct ov8865_sensor *sensor,
>>  			    ov8865_test_pattern_bits[index]);
>>  }
>>  
>> +/* Blanking */
>> +
>> +static int ov8865_vts_configure(struct ov8865_sensor *sensor, u32 vblank)
>> +{
>> +	u16 vts = sensor->state.mode->output_size_y + vblank;
>> +	int ret;
>> +
>> +	ret = ov8865_write(sensor, OV8865_VTS_H_REG, OV8865_VTS_H(vts));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return ov8865_write(sensor, OV8865_VTS_L_REG, OV8865_VTS_L(vts));
>> +}
>> +
>>  /* State */
>>  
>>  static int ov8865_state_mipi_configure(struct ov8865_sensor *sensor,
>> @@ -2476,6 +2493,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	case V4L2_CID_TEST_PATTERN:
>>  		index = (unsigned int)ctrl->val;
>>  		return ov8865_test_pattern_configure(sensor, index);
>> +	case V4L2_CID_VBLANK:
>> +		return ov8865_vts_configure(sensor, ctrl->val);
>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -2492,6 +2511,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>  	struct ov8865_ctrls *ctrls = &sensor->ctrls;
>>  	struct v4l2_ctrl_handler *handler = &ctrls->handler;
>>  	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
>> +	const struct ov8865_mode *mode = sensor->state.mode;
>> +	unsigned int vblank_max, vblank_def;
>>  	int ret;
>>  
>>  	v4l2_ctrl_handler_init(handler, 32);
>> @@ -2528,6 +2549,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>  				     ARRAY_SIZE(ov8865_test_pattern_menu) - 1,
>>  				     0, 0, ov8865_test_pattern_menu);
>>  
>> +	/* Blanking */
>> +	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
>> +	vblank_def = mode->vts - mode->output_size_y;
>> +	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
>> +					  OV8865_TIMING_MIN_VTS, vblank_max, 1,
>> +					  vblank_def);
>> +
>>  	/* MIPI CSI-2 */
>>  
>>  	ctrls->link_freq =
>> @@ -2708,6 +2736,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
>>  		 sensor->state.mbus_code != mbus_code)
>>  		ret = ov8865_state_configure(sensor, mode, mbus_code);
>>  
>> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV8865_TIMING_MIN_VTS,
>> +				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
>> +				 1, mode->vts - mode->output_size_y);
>> +
>>  complete:
>>  	mutex_unlock(&sensor->mutex);
>>  
>> @@ -3035,6 +3067,8 @@ static int ov8865_probe(struct i2c_client *client)
>>  
>>  	/* Sensor */
>>  
>> +	sensor->state.mode =  &ov8865_modes[0];
> This seems to be an unrelated change. Does it belong here?


In ov8865_ctrls_init() I'm using sensor->state.mode to initialise the
new vblank control. I guess instead of


+	const struct ov8865_mode *mode = sensor->state.mode;

I could have

+	const struct ov8865_mode *mode = &ov8865_modes[0];


in that function though

>
>> +
>>  	ret = ov8865_ctrls_init(sensor);
>>  	if (ret)
>>  		goto error_mutex;
