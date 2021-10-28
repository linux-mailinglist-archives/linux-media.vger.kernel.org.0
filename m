Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57CE43E2FD
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 16:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhJ1OD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 10:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31552 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230070AbhJ1OD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 10:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635429690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iR+2taaJn6FEYK50GhTLem7agAdrw9vJwViOvJ9EAKY=;
        b=ckUfjN7cEJqiYaR9jt9fh1TIKua4pbHKD/MVLLEf3b+tGgQnZ+/UcT+iwrZvZxqw7z6fgV
        zvC2AUCOYCGiBAv+rUM81uaO6n6EhUXgj6RoXNXpYRJ2vDfSs0kP77/B48c5mbiWoxozZb
        qhBhTRI6lovcboouQWws1695D4Wlsh8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-hh7n4b6HNZGrbu-Ebl8AEg-1; Thu, 28 Oct 2021 10:01:28 -0400
X-MC-Unique: hh7n4b6HNZGrbu-Ebl8AEg-1
Received: by mail-ed1-f69.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so5699013edv.10
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iR+2taaJn6FEYK50GhTLem7agAdrw9vJwViOvJ9EAKY=;
        b=os1z3RX1xnYqXQb4H1hP/NbJvaYG0DJl9nUhP/DakppzTweOEG0mLanixcsuuDfjxj
         G87/SrVFNsoE2TYSJngWSzrSROkxAycK+dP/OMX3PlMmbL+yZmCIatEoJkd6ZoZywd5D
         YB3JYBr9AQj49WYD/FQtTgNTtzIOjyIeNB0TzCKTsoruLKMOQMLPpiBh7WPC3um9zcaq
         ECo8J9R5xi3u+kHAHdm9Iy8Hic2A0ihDvwx2xEpizP/N14DplCw/n1jL8oapZ6pF6kad
         SsEt9jtr0aW0PhdcwHuxVSpGI6hvSpEJDmLY+cPKibZ6/Nwl1c0zVKeqsN7BGPCXoDiU
         xwvQ==
X-Gm-Message-State: AOAM533C7YLOp+ORMFljhsKZsYJTKxoeIw5xD7b9xiUa4QqWJCPSmHo8
        bohQg5BMj+q80Q0WNmWusiWP1zunKRzA567WkV5lvQvBk/IWhIbFWx75Y5LOdaHnJw87Q5Qm6dc
        saWcnzWHDPF8lVy/iQiEckXw=
X-Received: by 2002:a17:906:39b:: with SMTP id b27mr5607911eja.568.1635429681151;
        Thu, 28 Oct 2021 07:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLT8CSgXlJJ4b1Tw2WuS4dCYcel5g+miPZsXzU2outh6KclJ0yQ877Qz7I1KtOIAQ2PD8hzA==
X-Received: by 2002:a17:906:39b:: with SMTP id b27mr5607816eja.568.1635429680352;
        Thu, 28 Oct 2021 07:01:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id be9sm1771646edb.61.2021.10.28.07.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 07:01:19 -0700 (PDT)
Message-ID: <071668ce-f990-9658-d234-c046f1816063@redhat.com>
Date:   Thu, 28 Oct 2021 16:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 14/16] media: i2c: Use dev_err_probe() in ov8865
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20211021214331.1188787-1-djrscally@gmail.com>
 <20211021214331.1188787-15-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211021214331.1188787-15-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 10/21/21 23:43, Daniel Scally wrote:
> There is a chance that regulator_get() returns -EPROBE_DEFER, in which
> case printing an error message is undesirable. To avoid spurious messages
> in dmesg in the event that -EPROBE_DEFER is returned, use dev_err_probe()
> on error paths for regulator_get().
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>



> ---
> Changes in v3:
> 
> 	- None
> 
>  drivers/media/i2c/ov8865.c | 46 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 572b9818e950..685539744041 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2955,6 +2955,26 @@ static int ov8865_probe(struct i2c_client *client)
>  	sensor->dev = dev;
>  	sensor->i2c_client = client;
>  
> +	/* Regulators */
> +
> +	/* DVDD: digital core */
> +	sensor->dvdd = devm_regulator_get(dev, "dvdd");
> +	if (IS_ERR(sensor->dvdd))
> +		return dev_err_probe(dev, PTR_ERR(sensor->dvdd),
> +				     "cannot get DVDD regulator\n");
> +
> +	/* DOVDD: digital I/O */
> +	sensor->dovdd = devm_regulator_get(dev, "dovdd");
> +	if (IS_ERR(sensor->dovdd))
> +		return dev_err_probe(dev, PTR_ERR(sensor->dovdd),
> +				     "cannot get DOVDD regulator\n");
> +
> +	/* AVDD: analog */
> +	sensor->avdd = devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(sensor->avdd))
> +		return dev_err_probe(dev, PTR_ERR(sensor->avdd),
> +				     "cannot get AVDD (analog) regulator\n");
> +
>  	/* Graph Endpoint */
>  
>  	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> @@ -2985,32 +3005,6 @@ static int ov8865_probe(struct i2c_client *client)
>  		goto error_endpoint;
>  	}
>  
> -	/* Regulators */
> -
> -	/* DVDD: digital core */
> -	sensor->dvdd = devm_regulator_get(dev, "dvdd");
> -	if (IS_ERR(sensor->dvdd)) {
> -		dev_err(dev, "cannot get DVDD (digital core) regulator\n");
> -		ret = PTR_ERR(sensor->dvdd);
> -		goto error_endpoint;
> -	}
> -
> -	/* DOVDD: digital I/O */
> -	sensor->dovdd = devm_regulator_get(dev, "dovdd");
> -	if (IS_ERR(sensor->dovdd)) {
> -		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
> -		ret = PTR_ERR(sensor->dovdd);
> -		goto error_endpoint;
> -	}
> -
> -	/* AVDD: analog */
> -	sensor->avdd = devm_regulator_get(dev, "avdd");
> -	if (IS_ERR(sensor->avdd)) {
> -		dev_err(dev, "cannot get AVDD (analog) regulator\n");
> -		ret = PTR_ERR(sensor->avdd);
> -		goto error_endpoint;
> -	}
> -
>  	/* External Clock */
>  

This line:

>  	sensor->extclk = devm_clk_get(dev, "tps68470-clk");

Does not exist in the upstream repos, instead it is:

	sensor->extclk = devm_clk_get(dev, NULL);

I guess you still had your hack to deal with the clk issues we've
been working on in place in your tree on which you based this series.

Unfortunately this means that this patch (and thus this series)
will not apply cleanly.

Can you send a v4 fixing this?

Regards,

Hans

