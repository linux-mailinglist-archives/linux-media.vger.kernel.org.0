Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAB572B942
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 09:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbjFLHy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 03:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbjFLHyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 03:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84C630F1
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686556266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EiKHz6cpdG+DPDZO2auj8XjpsWMdDISs3mmCykyGm/s=;
        b=XC+nNDFkcJg0uhISCbXC6zfwPpAtsqxT8uPv2WlSzeD4/+9Q7SigQnRk2R1A8JI1aygRQG
        0ecgSXf1U2s36wp3etTPc2awRS7IiBnO7bKKpzYUf/NUg4717femjfM1xihCe0+rccNyMk
        2CHi8seyr85HYNHl1eXRso4s0egkDes=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-AsbQcqoAMAOjkZ9l8go9Ug-1; Mon, 12 Jun 2023 03:44:29 -0400
X-MC-Unique: AsbQcqoAMAOjkZ9l8go9Ug-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bf847b267so3573236a12.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 00:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555868; x=1689147868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiKHz6cpdG+DPDZO2auj8XjpsWMdDISs3mmCykyGm/s=;
        b=KFATN3sLyRRhpi7vVKHwoD4TF4yGOM93A/xidNMTCoMV6NnNSwkiQgDbiXIYpHA4FY
         I33/pWPxp8lqc/rU67dbUIGaOlQTK4ZsL8j0KUaGGkkRrD6ZroZOubeUzZOVVIBfPHpl
         pTDNWljC4qbar+uSJ9Vxp/xmCdVeTBbAVb7SM6lHpS46/wW2ZNwQaUZz4duh8ANIs6rb
         sE6hyEdyoPb+3vn9c/j9IewD2FpRQJzBel7pYQmtcoJ4RM+CHLlsJscoNUHY6DeYRTeb
         INkLUfai8dxhAmdexG3iRbn7Vrq5Wv0gVlvbzeNZFDn/F52rSI+B9vaiu8Q0T4yTUAWQ
         4DKg==
X-Gm-Message-State: AC+VfDw929BdptXuPSu5HBqAfijphRJKe56WkUGM1OFZCw7khe0xCUlR
        vcRzefwSY/2gnw9JHo/lqP3OoCGnK+AgdZtgllQHKjQg3vdQkrSRwL5FSz7yHxx5cotMK5DPu/V
        9RDHZbmiXeKM2aBwl7y445kQ=
X-Received: by 2002:aa7:d449:0:b0:504:8014:1554 with SMTP id q9-20020aa7d449000000b0050480141554mr4761804edr.28.1686555868578;
        Mon, 12 Jun 2023 00:44:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lvXEiPrVhXd/lYHLWXetQ6Tm6ZCUBuClNIhktshWtQkvyxwv+IRHd7KeJEUY7ROSjHU7B6A==
X-Received: by 2002:aa7:d449:0:b0:504:8014:1554 with SMTP id q9-20020aa7d449000000b0050480141554mr4761796edr.28.1686555868234;
        Mon, 12 Jun 2023 00:44:28 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o26-20020a17090637da00b009745e1b6226sm4717201ejc.125.2023.06.12.00.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 00:44:27 -0700 (PDT)
Message-ID: <c7d90ea3-6a87-4dba-5c53-d62d95a3bef9@redhat.com>
Date:   Mon, 12 Jun 2023 09:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 01/28] media: ov2680: Remove auto-gain and auto-exposure
 controls
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-2-hdegoede@redhat.com>
 <8575dadf-7db6-5c97-7fbb-1822c1fab0ee@ideasonboard.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8575dadf-7db6-5c97-7fbb-1822c1fab0ee@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 6/12/23 08:53, Dan Scally wrote:
> Morning Hans - thanks for the set
> 
> On 07/06/2023 17:46, Hans de Goede wrote:
>> Quoting the OV2680 datasheet:
>>
>> "3.2 exposure and gain control
>>
>> In the OV2680, the exposure time and gain are set manually from an external
>> controller. The OV2680 supports manual gain and exposure control only for
>> normal applications, no auto mode."
>>
>> And indeed testing with the atomisp_ov2680 fork of ov2680.c has shown that
>> auto-exposure and auto-gain do not work.
>>
>> Note that the code setting the auto-exposure flag was broken, callers
>> of ov2680_exposure_set() were directly passing !!ctrls->auto_exp->val as
>> "bool auto_exp" value, but ctrls->auto_exp is a menu control with:
>>
>> enum  v4l2_exposure_auto_type {
>>          V4L2_EXPOSURE_AUTO = 0,
>>          V4L2_EXPOSURE_MANUAL = 1,
>>     ...
>>
>> So instead of passing !!ctrls->auto_exp->val they should have been passing
>> ctrls->auto_exp->val == V4L2_EXPOSURE_AUTO, iow the passed value was
>> inverted of what it should have been.
>>
>> Also remove ov2680_g_volatile_ctrl() since without auto support the gain
>> and exposure controls are not volatile.
>>
>> This also fixes the control values not being properly applied in
>> ov2680_mode_set(). The 800x600 mode register-list also sets gain,
>> exposure and vflip overriding the last set ctrl values.
>>
>> ov2680_mode_set() does call ov2680_gain_set() and ov2680_exposure_set()
>> but did this before writing the mode register-list, so these values
>> would still be overridden by the mode register-list.
>>
>> Add a v4l2_ctrl_handler_setup() call after writing the mode register-list
>> to restore all ctrl values. Also remove the ctrls->gain->is_new check from
>> ov2680_gain_set() so that the gain always gets restored properly.
>>
>> Last since ov2680_mode_set() now calls v4l2_ctrl_handler_setup(), remove
>> the v4l2_ctrl_handler_setup() call after ov2680_mode_restore() since
>> ov2680_mode_restore() calls ov2680_mode_set().
>>
>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/ov2680.c | 162 ++++---------------------------------
>>   1 file changed, 17 insertions(+), 145 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 54153bf66bdd..02204e185e2f 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -85,15 +85,8 @@ struct ov2680_mode_info {
>>     struct ov2680_ctrls {
>>       struct v4l2_ctrl_handler handler;
>> -    struct {
>> -        struct v4l2_ctrl *auto_exp;
>> -        struct v4l2_ctrl *exposure;
>> -    };
>> -    struct {
>> -        struct v4l2_ctrl *auto_gain;
>> -        struct v4l2_ctrl *gain;
>> -    };
>> -
>> +    struct v4l2_ctrl *exposure;
>> +    struct v4l2_ctrl *gain;
>>       struct v4l2_ctrl *hflip;
>>       struct v4l2_ctrl *vflip;
>>       struct v4l2_ctrl *test_pattern;
>> @@ -143,6 +136,7 @@ static const struct reg_value ov2680_setting_30fps_QUXGA_800_600[] = {
>>       {0x380e, 0x02}, {0x380f, 0x84}, {0x3811, 0x04}, {0x3813, 0x04},
>>       {0x3814, 0x31}, {0x3815, 0x31}, {0x3820, 0xc0}, {0x4008, 0x00},
>>       {0x4009, 0x03}, {0x4837, 0x1e}, {0x3501, 0x4e}, {0x3502, 0xe0},
>> +    {0x3503, 0x03},
> 
> 
> I'm confused why this was added to this mode but not the other two; according to the datasheet it's setting the AGC/AEC into manual but I can't see why it's only needed here?

The original driver uses the 800x600 mode to also store "init_mode" registers,
no matter what mode is set, first all 800x600 registers are written and then
the other mode's registers are written over that.

This ugliness goes away later in the series when this gets renamed to
ov2680_global_setting[] and all the mode specific registers are dropped
because they are calculated based on crop + binning.

When switching to calculating the mode registers the register poke also gets some docs :)

        /* R MANUAL set exposure (0x01) and gain (0x02) to manual (hw does not do auto) */
        {0x3503, 0x03},

Regards,

Hans

