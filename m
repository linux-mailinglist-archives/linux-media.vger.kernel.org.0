Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD59943E301
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 16:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhJ1OFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 10:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhJ1OFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 10:05:37 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C8EC061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:03:10 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id s13so3240291wrb.3
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vgg+r20XOehojRhcth+JIEaW1ADOMhaccuChVGNRQEg=;
        b=RXL3dfyWzLNbJYiQJSz1vssbwYC2ytuIt6f4SRCQbQOB9rLcHC+KHMzRAL3wZKcfIB
         fQXasl9ACpcsxvG1Vb4GbkiJ07Qf0TsZ5p9KIDjDlk4TXOUN8wYSKSyHGX2WlDwl2QQw
         5XE3WgSDr/jshbRfujNUhXZ+zM+XveHEC5Lo9zyhFvOgaw4odcH5EChfXN4yKeGVyFeA
         dTQrbr4n3eGG25aP4tHxlTldZLYksfZo/gWottd6skm7RVzqINEy8GRoacnC3Ow34yQC
         zBIlbCqRtmmeScnIZq5DNnu+sDg6/wKMmc4jdXZ+AKj6jobjwos2rCe9+EF7PNrQUM6r
         WmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vgg+r20XOehojRhcth+JIEaW1ADOMhaccuChVGNRQEg=;
        b=lsC69Wt1du1hOpClD6d6P9jIe/tzvUCd8FdSyoUKF+eBcLebHD7IAYtPly2kD7w690
         yVy+pi/haSR+tUnrRxoNjVYvY0keyaXqW9jTDTuAKaE/5qrGjqlR8VLjl/i48IoZPrE/
         POr0YSQoVm0XtsKL+w2twl7l0EXPht4kU4KuVLqVN+QQelkSsrA1Nk+OTVF5ca1kvc8b
         Y7mQIoVTV65oSF0K9rbdXUUlJztSbRuMUA/IIXVjCM6ewKCDqoU0rJj77Mm1HnR8nh9/
         tlimrBKCXcs/ZleRJe4DAqll37bTsiQZmxlN3AEoWCC2hkzauuvo0D4kkhD3cx155Y6o
         3cVA==
X-Gm-Message-State: AOAM530n9uUNxCyGaZy0MTXhLk4x/tJ9kMByBKmqstX4nPHtvKf/RvXq
        nttUrwk+iKYy8LykBs/LB70=
X-Google-Smtp-Source: ABdhPJxPNQKeMbHisUoDd04JbNh6TxgQdClti7nVzPYVqNd2hC91Qyp0WDgy+Hy3snXvvQm8JBR/OA==
X-Received: by 2002:a5d:538c:: with SMTP id d12mr6095409wrv.420.1635429788984;
        Thu, 28 Oct 2021 07:03:08 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id g7sm4210566wrd.81.2021.10.28.07.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 07:03:08 -0700 (PDT)
Subject: Re: [PATCH v3 14/16] media: i2c: Use dev_err_probe() in ov8865
To:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20211021214331.1188787-1-djrscally@gmail.com>
 <20211021214331.1188787-15-djrscally@gmail.com>
 <071668ce-f990-9658-d234-c046f1816063@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <1ccda0f4-9bc4-313a-b209-8451cc2c261a@gmail.com>
Date:   Thu, 28 Oct 2021 15:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <071668ce-f990-9658-d234-c046f1816063@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 28/10/2021 15:01, Hans de Goede wrote:
> Hi Dan,
>
> On 10/21/21 23:43, Daniel Scally wrote:
>> There is a chance that regulator_get() returns -EPROBE_DEFER, in which
>> case printing an error message is undesirable. To avoid spurious messages
>> in dmesg in the event that -EPROBE_DEFER is returned, use dev_err_probe()
>> on error paths for regulator_get().
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>
>
>> ---
>> Changes in v3:
>>
>> 	- None
>>
>>  drivers/media/i2c/ov8865.c | 46 +++++++++++++++++---------------------
>>  1 file changed, 20 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index 572b9818e950..685539744041 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -2955,6 +2955,26 @@ static int ov8865_probe(struct i2c_client *client)
>>  	sensor->dev = dev;
>>  	sensor->i2c_client = client;
>>  
>> +	/* Regulators */
>> +
>> +	/* DVDD: digital core */
>> +	sensor->dvdd = devm_regulator_get(dev, "dvdd");
>> +	if (IS_ERR(sensor->dvdd))
>> +		return dev_err_probe(dev, PTR_ERR(sensor->dvdd),
>> +				     "cannot get DVDD regulator\n");
>> +
>> +	/* DOVDD: digital I/O */
>> +	sensor->dovdd = devm_regulator_get(dev, "dovdd");
>> +	if (IS_ERR(sensor->dovdd))
>> +		return dev_err_probe(dev, PTR_ERR(sensor->dovdd),
>> +				     "cannot get DOVDD regulator\n");
>> +
>> +	/* AVDD: analog */
>> +	sensor->avdd = devm_regulator_get(dev, "avdd");
>> +	if (IS_ERR(sensor->avdd))
>> +		return dev_err_probe(dev, PTR_ERR(sensor->avdd),
>> +				     "cannot get AVDD (analog) regulator\n");
>> +
>>  	/* Graph Endpoint */
>>  
>>  	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>> @@ -2985,32 +3005,6 @@ static int ov8865_probe(struct i2c_client *client)
>>  		goto error_endpoint;
>>  	}
>>  
>> -	/* Regulators */
>> -
>> -	/* DVDD: digital core */
>> -	sensor->dvdd = devm_regulator_get(dev, "dvdd");
>> -	if (IS_ERR(sensor->dvdd)) {
>> -		dev_err(dev, "cannot get DVDD (digital core) regulator\n");
>> -		ret = PTR_ERR(sensor->dvdd);
>> -		goto error_endpoint;
>> -	}
>> -
>> -	/* DOVDD: digital I/O */
>> -	sensor->dovdd = devm_regulator_get(dev, "dovdd");
>> -	if (IS_ERR(sensor->dovdd)) {
>> -		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
>> -		ret = PTR_ERR(sensor->dovdd);
>> -		goto error_endpoint;
>> -	}
>> -
>> -	/* AVDD: analog */
>> -	sensor->avdd = devm_regulator_get(dev, "avdd");
>> -	if (IS_ERR(sensor->avdd)) {
>> -		dev_err(dev, "cannot get AVDD (analog) regulator\n");
>> -		ret = PTR_ERR(sensor->avdd);
>> -		goto error_endpoint;
>> -	}
>> -
>>  	/* External Clock */
>>  
> This line:
>
>>  	sensor->extclk = devm_clk_get(dev, "tps68470-clk");
> Does not exist in the upstream repos, instead it is:
>
> 	sensor->extclk = devm_clk_get(dev, NULL);
>
> I guess you still had your hack to deal with the clk issues we've
> been working on in place in your tree on which you based this series.
>
> Unfortunately this means that this patch (and thus this series)
> will not apply cleanly.
>
> Can you send a v4 fixing this?
>

Oops! My bad, sorry about that. I'll post a v4 later to clean that up

