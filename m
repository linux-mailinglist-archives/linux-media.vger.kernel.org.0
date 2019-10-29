Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D9EE8941
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388286AbfJ2NS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:18:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33441 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388166AbfJ2NS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:18:58 -0400
Received: by mail-ot1-f66.google.com with SMTP id u13so9724582ote.0;
        Tue, 29 Oct 2019 06:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KgGwGRvW59wo170wBmWQwSOb4wH65WjoenOVt8nMGdo=;
        b=qDyMuWMVJXXXIrgz0KnXFwOhttSXH6mvk75FrzSuq9ENp63Vn8Uuhx102QsHJdS6Kq
         in/6dGYELHrqk/EEVQPmGtHhBV0SthfDAaSIshta+QWjvBLdf4t7nkIEAwuJVIXAoZHN
         C4v6tQueeUO7/zeW3srIykSXjfca95PDlcQabE0NQvb8QVOcVKV6YOf4dU52TJ7MyPq9
         kzVjjmpVUNbp3YkKnEZpHSBveT6rbivwBIPM/F5ohPdQWoBmy+sK/CmoSDHXcz7tWdTJ
         F1H9baveOZj72ncuc+fjetZSVFi0fZtx+ZRwM1x7vunXomIgIJ5X0x04tjb4+Mg47WP6
         gRjg==
X-Gm-Message-State: APjAAAU54JfKJ1m9knrVIlmakjsYR/N2pmHHF8wJ78QEaUEr1kJc0y4M
        sD/g4Bfc056WYyIaGCrfjg==
X-Google-Smtp-Source: APXvYqw4wN7kGouxDpyefGMQr86JcQUC3wwIXeuWO1EbgTtORg18+oSv2PhgVLjeG4DUS4g/gwDAjw==
X-Received: by 2002:a05:6830:ca:: with SMTP id x10mr17158606oto.221.1572355137088;
        Tue, 29 Oct 2019 06:18:57 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 88sm4797322otb.63.2019.10.29.06.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:18:56 -0700 (PDT)
Date:   Tue, 29 Oct 2019 08:18:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 03/19] media: ti-vpe: cal: Add per platform data support
Message-ID: <20191029131855.GA27597@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-4-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-4-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 18, 2019 at 10:34:21AM -0500, Benoit Parrot wrote:
> First this patch adds a method to access the CTRL_CORE_CAMERRX_CONTROL
> register to use the syscon mechanism. For backward compatibility we also
> handle using the existing camerrx_control "reg" entry if a syscon node
> is not found.
> 
> In addition the register bit layout for the CTRL_CORE_CAMERRX_CONTROL
> changes depending on the device. In order to support this we need to use
> a register access scheme based on data configuration instead of using
> static macro.
> 
> In this case we make use of the regmap facility and create data set
> based on the various device and phy available.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 281 +++++++++++++++++++++-------
>  1 file changed, 212 insertions(+), 69 deletions(-)


> @@ -1816,6 +1911,18 @@ static int cal_probe(struct platform_device *pdev)
>  	if (!dev)
>  		return -ENOMEM;
>  
> +	match = of_match_device(of_match_ptr(cal_of_match), &pdev->dev);

Use of_device_get_match_data() instead.

> +	if (!match)
> +		return -ENODEV;
> +
> +	if (match->data) {
> +		dev->data = (struct cal_data *)match->data;
> +		dev->flags = dev->data->flags;
> +	} else {
> +		dev_err(&pdev->dev, "Could not get feature data based on compatible version\n");
> +		return -ENODEV;
> +	}
> +
>  	/* set pseudo v4l2 device name so we can use v4l2_printk */
>  	strscpy(dev->v4l2_dev.name, CAL_MODULE_NAME,
>  		sizeof(dev->v4l2_dev.name));
> @@ -1823,6 +1930,43 @@ static int cal_probe(struct platform_device *pdev)
>  	/* save pdev pointer */
>  	dev->pdev = pdev;
>  
> +	if (parent && of_property_read_bool(parent, "syscon-camerrx")) {
> +		syscon_camerrx =
> +			syscon_regmap_lookup_by_phandle(parent,
> +							"syscon-camerrx");
> +		if (IS_ERR(syscon_camerrx)) {
> +			dev_err(&pdev->dev, "failed to get syscon-camerrx regmap\n");
> +			return PTR_ERR(syscon_camerrx);
> +		}
> +
> +		if (of_property_read_u32_index(parent, "syscon-camerrx", 1,
> +					       &syscon_camerrx_offset)) {

Kind of odd to read the property twice and using functions that don't 
match the type. We have functions to retrieve phandle and args.

> +			dev_err(&pdev->dev, "failed to get syscon-camerrx offset\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		/*
> +		 * Backward DTS compatibility.
> +		 * If syscon entry is not present then check if the
> +		 * camerrx_control resource is present.
> +		 */
> +		syscon_camerrx = cal_get_camerarx_regmap(dev);
> +		if (IS_ERR(syscon_camerrx)) {
> +			dev_err(&pdev->dev, "failed to get camerrx_control regmap\n");
> +			return PTR_ERR(syscon_camerrx);
> +		}
> +		/* In this case the base already point to the direct
> +		 * CM register so no need for an offset
> +		 */
> +		syscon_camerrx_offset = 0;
> +	}
> +
> +	dev->syscon_camerrx = syscon_camerrx;
> +	dev->syscon_camerrx_offset = syscon_camerrx_offset;
> +	ret = cal_camerarx_regmap_init(dev);
> +	if (ret)
> +		return ret;
> +
>  	dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>  						"cal_top");
>  	dev->base = devm_ioremap_resource(&pdev->dev, dev->res);

