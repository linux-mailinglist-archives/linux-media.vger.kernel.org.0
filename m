Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21BF26E74E5
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 10:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjDSIVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 04:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjDSIVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 04:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A465272C
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681892423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YpdLR0mVocKsL1tqmNRSUEG+Hk3JH3ac6gIQcIprmMM=;
        b=HPuDOQPojSu26Mszsac6pyGcRrwJNYx8C84PSPDEM9BTWU1+KBLRAT4WPRHTjnBZIc13wt
        gkFXDc3L0Z3E0heBVugYyelL106PbemKxrnrVsAOq5imVwwaBpGgbM1SPLrQ4F+YyYJJL7
        kWvAFRE6PzhR3jIcsJILGAMmxntOkkM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-sggTmxETN6u6Lc3AhTAN2A-1; Wed, 19 Apr 2023 04:20:20 -0400
X-MC-Unique: sggTmxETN6u6Lc3AhTAN2A-1
Received: by mail-ed1-f70.google.com with SMTP id d2-20020a50f682000000b0050503f2097aso11302635edn.14
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 01:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892419; x=1684484419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpdLR0mVocKsL1tqmNRSUEG+Hk3JH3ac6gIQcIprmMM=;
        b=Az54wMWct8ee+RMwjYP628USFzpNCKhrRSS7iIkP2qdCdQr2fVeyr9c5LeIbqOguk+
         xgA76qcvoML0CsaGeMfDURepJEBFYKfH2zRBGgqhJXjtt9lHFnWNY7bL6CjnbCLdMX8q
         7Mv1oZ2LNTT5uNJOPJGitc3RV8fcaxW0E3QlFPJUziwlW5mx9Xz7MhfnUbRa0tVq1oxy
         1YvVzxE+W5sGFVnh/YtppFBLGhnQ7e/oyfkkjh3bcfbKVFihMIex2mkaaXR0BIWZKK+0
         fYWEEmbmu3ATja1yv7O0u/WId4ZElYfny9DDBKw0lF+nUptKV6aanaZ+WQ7s5b97TbOb
         Gqhw==
X-Gm-Message-State: AAQBX9e5VwNpZrxnE0njF8tjvNb5elga3ZzH/uayJvM4o+Uqy3Ffxxmn
        5kWIim/7LX1bCg2rNeDpseE5JUOoLT1xhakW8FBigCDuXPtv8ErVAVug8WOKp1DUQq98JgJJPmF
        l/jpuxZciEPvEl4V09ptNbrI5bYQBVs0=
X-Received: by 2002:a17:906:7fd0:b0:94e:eab3:9e86 with SMTP id r16-20020a1709067fd000b0094eeab39e86mr15713569ejs.33.1681892418843;
        Wed, 19 Apr 2023 01:20:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKpnAtFw9QSiVzOShC3II30+HGsaaC0gje6ZCeXKkN1AEBVFOKn6xNsEaVUy45WENV3pPIcQ==
X-Received: by 2002:a17:906:7fd0:b0:94e:eab3:9e86 with SMTP id r16-20020a1709067fd000b0094eeab39e86mr15713539ejs.33.1681892418448;
        Wed, 19 Apr 2023 01:20:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l8-20020a1709061c4800b0094f0025983fsm6760387ejg.84.2023.04.19.01.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 01:20:17 -0700 (PDT)
Message-ID: <df2272ca-88c9-8bdf-a727-d4199061568e@redhat.com>
Date:   Wed, 19 Apr 2023 10:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] staging: media: atomisp: init high & low vars
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <5406825f-9b67-a59e-de62-b446ad316b96@xs4all.nl>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5406825f-9b67-a59e-de62-b446ad316b96@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


On 4/19/23 09:06, Hans Verkuil wrote:
> Fix a compiler warning:
> 
> include/linux/dev_printk.h: In function 'ov2680_probe':
> include/linux/dev_printk.h:144:31: warning: 'high' may be used uninitialized [-Wmaybe-uninitialized]
>   144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |                               ^~~~~~~~
> In function 'ov2680_detect',
>     inlined from 'ov2680_s_config' at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:468:8,
>     inlined from 'ov2680_probe' at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:647:8:
> drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:376:13: note: 'high' was declared here
>   376 |         u32 high, low;
>       |             ^~~~
> 
> 'high' is indeed uninitialized after the ov_read_reg8() call failed, so there is no
> point showing the value. Just say that the read failed. But low can also be used
> uninitialized later, so just make it more robust and properly zero the high and low
> variables.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> ---
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 63de214916f5..c079368019e8 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -373,7 +373,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>  static int ov2680_detect(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
> -	u32 high, low;
> +	u32 high = 0, low = 0;
>  	int ret;
>  	u16 id;
>  	u8 revision;
> @@ -383,7 +383,7 @@ static int ov2680_detect(struct i2c_client *client)
> 
>  	ret = ov_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_H, &high);
>  	if (ret) {
> -		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
> +		dev_err(&client->dev, "sensor_id_high read failed (%d)\n", ret);
>  		return -ENODEV;
>  	}
>  	ret = ov_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_L, &low);
> 

