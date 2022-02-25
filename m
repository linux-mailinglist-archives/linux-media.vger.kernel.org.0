Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983834C5100
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 22:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbiBYVyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 16:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiBYVyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 16:54:10 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FB21B30B5
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 13:53:37 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r10so6394509wrp.3
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T8pQohFj+tLrLAwzF8XXn9yvxetYdFX/77kvsIvih0s=;
        b=PlXQr4zdLPvNeTbt4NjOHxjBBSonP0C8AA1Tqi+tO/9YP8u8BwpdNPG+IvMF/79S7a
         42VeTFItQY/ua/PU5BK4CkseARurrgEzdB4YvAcPgnGEh2mUUwtbqQh3OotTF4tiVKd3
         n7zLPqYzug/wmLdhYGHu3PGIGx7Pcnc/PMcku4GRDIKLxTkrl1OjxuOEq70zMgXBOtbj
         8W2wU1AWo961o3ITM3OYmhn56gtERO5uNeeOtJgvT3Db+MRCGjoXIvb9cMFq1BUR2Uq5
         LAcXJLHrnzXwdLppc413qW8U3bKPVXclen9C1cvmGUCO1MUaMbbmleVp4nOicoaw6QaH
         5f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T8pQohFj+tLrLAwzF8XXn9yvxetYdFX/77kvsIvih0s=;
        b=26YbVB3iTI/E5OzqiTjSMLOBIQBjChnoEPEPUTWUA+gA/ZyujRXoEZR89ClBa7L26T
         +qtIBkzvn0Whd4lm5SHDfdqpsUvYcB4WdBzGsKvtzfWXpzARBh+zj5fVfBbog3IKo4Wi
         7TclcvE5n2PEjkKR61uHk+1jLVioY8LvRIai1+J5WhDc9QbSUwyt/MQ4eW1mwnMsgn/9
         triRMy0LRRjIEuCEckw4Zmm4QyJOGhH8Ecx2YOBJ/b1H9wZfZqdvHv667DIxTqvxN979
         PyRpaop5RhVJJ27KwDOFdWNH4L7jpQilEIiiVx6gzA8YYpF/IQT8lwKcyRFEk9wXWFf1
         0Fmw==
X-Gm-Message-State: AOAM5301ws1uJvj6U4Hcp83D3SkBUp1J8hm4lyrhzn+Ulmg2NWliBaVt
        tsb6v5xysEPXmpcswjU7WZY=
X-Google-Smtp-Source: ABdhPJwmXseO2WvGesoJZW1sDgepmrmtSwA+0PYLxQvYYC+yN0O0lwCf5ddUbyKXRmuSv2k8pKZlDw==
X-Received: by 2002:a5d:64af:0:b0:1ef:6070:2297 with SMTP id m15-20020a5d64af000000b001ef60702297mr4013978wrp.609.1645826015608;
        Fri, 25 Feb 2022 13:53:35 -0800 (PST)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id x2-20020a7bc762000000b00380fd1ba4ebsm10473232wmk.9.2022.02.25.13.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:53:35 -0800 (PST)
Message-ID: <309b8f89-dc13-4b00-ded6-8ac6038cfc64@gmail.com>
Date:   Fri, 25 Feb 2022 21:53:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/11] media: i2c: Provide ov7251_check_hwcfg()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-5-djrscally@gmail.com>
 <YhkLX/OgI+PSIkBg@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YhkLX/OgI+PSIkBg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 25/02/2022 17:01, Andy Shevchenko wrote:
> On Fri, Feb 25, 2022 at 12:07:46AM +0000, Daniel Scally wrote:
>> Move the endpoint checking from .probe() to a dedicated function,
>> and additionally check that the firmware provided link frequencies
>> are a match for those supported by the driver. Store the index to the
>> matching link frequency so it can be easily identified later.
> ...
>
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>> +	fwnode_handle_put(endpoint);
>> +	if (ret)
>> +		return dev_err_probe(ov7251->dev, ret,
>> +				     "parsing endpoint node failed\n");
>> +
>> +	if (!bus_cfg.nr_of_link_frequencies) {
>> +		dev_err(ov7251->dev, "no link frequencies defined\n");
>> +		ret = -EINVAL;
> It's also fine to use dev_err_probe() here.


Yup will switch to that.

>
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
>> +		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
>> +			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
>> +				freq_found = true;
>> +				break;
>> +			}
>> +
>> +		if (freq_found)
>> +			break;
> freq_found may be replaced by the
>
> 		if (j < ARRAY_SIZE(link_freq))
>
> here.


Huh oh yeah. I don't know why that never occurred to me...I was 
originally even using a goto and swapped it because it was ugly. Thanks!

>
>> +	}
>> +
>> +	if (i == bus_cfg.nr_of_link_frequencies) {
>> +		dev_err(ov7251->dev, "no supported link freq found\n");
>> +		ret = -EINVAL;
> dev_err_probe()
>
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	ov7251->link_freq_idx = i;
>> +
>> +out_free_bus_cfg:
>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>> +
>> +	return ret;
>> +}
