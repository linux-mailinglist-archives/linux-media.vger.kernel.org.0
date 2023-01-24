Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 853AC679697
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbjAXL2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233953AbjAXL2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:28:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FF7B74D
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Zkae+FgVlE7g6XLQPiu3EfFAeSDxJ80lJZYiQevrd0=;
        b=YxdX9vctdAXLbMSeigIUn3uLJ/6JkPjnREdiIfpLd1CpgvFaLr/c+bKkkeTqZRw2bhFs46
        1kZ/43G1jcwqd/vFv6BtZcRYiIar+MOZFgXGco3acgFU6+sZFoHSHB28wZ9ib21y5TJlkW
        fct00DZfU4km7WY9SH38NWLaCGSxhaQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-ogOuseObMpGV61lGCkdNxQ-1; Tue, 24 Jan 2023 06:27:59 -0500
X-MC-Unique: ogOuseObMpGV61lGCkdNxQ-1
Received: by mail-ej1-f69.google.com with SMTP id nb4-20020a1709071c8400b0084d4712780bso9708999ejc.18
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zkae+FgVlE7g6XLQPiu3EfFAeSDxJ80lJZYiQevrd0=;
        b=fSPkT7a93fOb0MJcgKNnwUNlayhkwNOmcrlw2pH9OuJpXt+YbuS/VY3gNmKQNSdKnO
         JXlfBl/xwU4+UgHv8WMPpKurRL5eM7SjxumdZVUIGl7qTtN5Jy5e17e19PXxYJZUP6i+
         XNJis1VJ6VGRgpgqC4+VFNMUoW5+8CpcTOX2l9XhDXcGl1x3jaxZddPdCgsdNHTv/GS2
         jX61sdPPq8Ice02yoAjC3dwFLVzcmIjqsLe5ZsRCCkbuigAKYZ2MPZgOr+63xqmOU478
         FV/sIYCQ8u5cKmrtuFprIjUYu5HUKvcIoAV89I/B9P9VdRbW8WC13SXfeSGMLG5Hjpye
         MZUQ==
X-Gm-Message-State: AFqh2krLiu+qz9GcsNr9AhHyG4aBqv6f393BUI/kx0UClXimTVBCqiuX
        0JB1D+0etMOHEEw3uISEGR8vphQ4YQuTuM+wwLZ1C3rcQmmEvkYt/CoivlHzVGoXzNt7SiPs1+z
        +EcyjsIKBAugXtxoT2lWqpeI=
X-Received: by 2002:a17:907:3f24:b0:86e:f629:6c9b with SMTP id hq36-20020a1709073f2400b0086ef6296c9bmr36823003ejc.42.1674559676743;
        Tue, 24 Jan 2023 03:27:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUUhTR9SRUdyg/OuJDhJkQSG9osf6ZmlYWD/1hMCG3R19kdz4Iwvwk3+Jfp00h+IgXB9g1IQ==
X-Received: by 2002:a17:907:3f24:b0:86e:f629:6c9b with SMTP id hq36-20020a1709073f2400b0086ef6296c9bmr36822985ejc.42.1674559676556;
        Tue, 24 Jan 2023 03:27:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709065fcb00b0087190b46ab0sm766241ejv.76.2023.01.24.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:27:56 -0800 (PST)
Message-ID: <ed0aa535-d4c5-5d5a-1964-991cbd1d8d45@redhat.com>
Date:   Tue, 24 Jan 2023 12:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 33/57] media: atomisp: ov2680: Add test pattern control
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-34-hdegoede@redhat.com>
 <Y87WBHnxz7atGdge@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87WBHnxz7atGdge@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/23/23 19:46, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:41PM +0100, Hans de Goede wrote:
>> Add a test pattern control. This is a 1:1 copy of the test pattern
>> control in the main drivers/media/i2c/ov2680.c driver.
> 
> Hmm... I'm not sure I understand the trend of the changes.
> We have two drivers of the same sensor, correct?
> So, the idea is to move the AtomISP-specific one to be like
> the generic and then kill it eventually?

The goal is to kill one eventually yes. I'm not sure which
one to kill yet though. I have actually found a whole bunch
of bugs in the main drivers/media/i2c/ov2680.c code and
given its buggy-ness I wonder if anyone is actually using it.

I need to start an email thread about this (and a couple of
other open questions which I have), I have a bunch of notes
which I need to turn into emails for this.

> If so, why do we add something here?

Because I suspect that the atomisp version might eventually
be the one we want to keep (and move to drivers/media/i2c).

Regards,

Hans


> Code-wise it's okay change, but see above.
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/i2c/atomisp-ov2680.c        | 33 +++++++++++++++++++
>>  drivers/staging/media/atomisp/i2c/ov2680.h    |  3 ++
>>  2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> index 14002a1c22d2..6ca2a5bb0700 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> @@ -127,6 +127,24 @@ static int ov2680_gain_set(struct ov2680_device *sensor, u32 gain)
>>  	return ovxxxx_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
>>  }
>>  
>> +static int ov2680_test_pattern_set(struct ov2680_device *sensor, int value)
>> +{
>> +	int ret;
>> +
>> +	if (!value)
>> +		return ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), 0);
>> +
>> +	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, 0x03, value - 1);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>  static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>>  {
>>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>> @@ -151,6 +169,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	case V4L2_CID_GAIN:
>>  		ret = ov2680_gain_set(sensor, ctrl->val);
>>  		break;
>> +	case V4L2_CID_TEST_PATTERN:
>> +		ret = ov2680_test_pattern_set(sensor, ctrl->val);
>> +		break;
>>  	default:
>>  		ret = -EINVAL;
>>  	}
>> @@ -644,6 +665,13 @@ static const struct v4l2_subdev_ops ov2680_ops = {
>>  
>>  static int ov2680_init_controls(struct ov2680_device *sensor)
>>  {
>> +	static const char * const test_pattern_menu[] = {
>> +		"Disabled",
>> +		"Color Bars",
>> +		"Random Data",
>> +		"Square",
>> +		"Black Image",
>> +	};
>>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>> @@ -658,6 +686,11 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
>>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
>>  					    0, exp_max, 1, exp_max);
>>  	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
>> +	ctrls->test_pattern =
>> +		v4l2_ctrl_new_std_menu_items(hdl,
>> +					     &ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
>> +					     ARRAY_SIZE(test_pattern_menu) - 1,
>> +					     0, 0, test_pattern_menu);
>>  
>>  	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>  	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
>> index e3ad20a7ffd5..45526477b612 100644
>> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
>> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
>> @@ -120,6 +120,8 @@
>>  #define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
>>  #define OV2680_MWB_GAIN_MAX				0x0fff
>>  
>> +#define OV2680_REG_ISP_CTRL00			0x5080
>> +
>>  #define OV2680_START_STREAMING			0x01
>>  #define OV2680_STOP_STREAMING			0x00
>>  
>> @@ -171,6 +173,7 @@ struct ov2680_device {
>>  		struct v4l2_ctrl *vflip;
>>  		struct v4l2_ctrl *exposure;
>>  		struct v4l2_ctrl *gain;
>> +		struct v4l2_ctrl *test_pattern;
>>  	} ctrls;
>>  };
>>  
>> -- 
>> 2.39.0
>>
> 

