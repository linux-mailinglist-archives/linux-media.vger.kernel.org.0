Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 491293576F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 09:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfFEHH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 03:07:57 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41766 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFEHH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 03:07:56 -0400
Received: by mail-pl1-f193.google.com with SMTP id s24so9211163plr.8
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G5DT3HSkNGcPA0+dfVoxLXiX+ckkiJmmC8Hx3I63JHY=;
        b=gNR5LPmQnR+iaGYVj4CZkWZIgkFnzTrmOi9QoqaJa6kzwvTi4l+sYqtFT4iunqTaQA
         0YEnLkwypWIHbTkf1wFlWT9ZwNFvKZ7RSz6CickyFFw7AO+S/LeIVfKO3Kch7x6rb//q
         F+uGrZAyzJNayN4zGFJZudtjJtehiRcmFv+HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G5DT3HSkNGcPA0+dfVoxLXiX+ckkiJmmC8Hx3I63JHY=;
        b=JDfqVC2kUCkL5S8U09pWwkJ1J34JsP//6Dh5CRdda9YxVaJfmYbp5gTazWV6A8w0CD
         7EChPojXBrJrjw/+D2KVmTRxjQ0MhGBo9V5AK4inMOCG7RKnMtxy5RSzT4+tAE8wG8VS
         lKYTzBfrAtSs/vaST1U90VumxRXowlZxuleuER7d/lIURhj2rZeKpdLSajZErDaZbRIC
         4mUE1i/0x9/NilxHSF3Wl2U5p7hcJCRsHDyoH19tZszuuxYfxCj91cxjIQjd6rrT9yj5
         RQR7azH1CJ43yjhRDs6yefMH9izab6jODLqOlvS2OmFNrvfnlhB5OQ+FmpeitT2AUcBO
         mFKg==
X-Gm-Message-State: APjAAAXOo1LYXPkeHXTXtZweGdZNzJymwlI6oWIJPg9vlkSTEvgnWLo0
        +loeu7seJHednZ05vw4jxejFCrzxucCEyw==
X-Google-Smtp-Source: APXvYqzcz1ThSD30uSaDaWhLBJCiLOp6xkp6jmkaZ3blNklDtJmEZ5md6LyBbclcX1UZoIh1B9C+gg==
X-Received: by 2002:a17:902:e582:: with SMTP id cl2mr26609826plb.60.1559718476180;
        Wed, 05 Jun 2019 00:07:56 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id l3sm17947773pgl.3.2019.06.05.00.07.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 00:07:55 -0700 (PDT)
Date:   Wed, 5 Jun 2019 16:07:52 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, rajmohan.mani@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] ov5670: Support probe whilst the device is off
Message-ID: <20190605070752.GA126683@chromium.org>
References: <20190510100930.14641-1-sakari.ailus@linux.intel.com>
 <20190510100930.14641-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510100930.14641-4-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, May 10, 2019 at 01:09:28PM +0300, Sakari Ailus wrote:
> Tell ACPI device PM code that the driver supports the device being powered
> off when the driver's probe function is entered.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov5670.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 041fcbb4eebdf..57e8b92f90e09 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2444,6 +2444,7 @@ static int ov5670_probe(struct i2c_client *client)
>  	struct ov5670 *ov5670;
>  	const char *err_msg;
>  	u32 input_clk = 0;
> +	bool powered_off;
>  	int ret;
>  
>  	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> @@ -2460,11 +2461,14 @@ static int ov5670_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
>  
> -	/* Check module identity */
> -	ret = ov5670_identify_module(ov5670);
> -	if (ret) {
> -		err_msg = "ov5670_identify_module() error";
> -		goto error_print;
> +	powered_off = acpi_dev_powered_off_for_probe(&client->dev);
> +	if (!powered_off) {
> +		/* Check module identity */
> +		ret = ov5670_identify_module(ov5670);
> +		if (ret) {
> +			err_msg = "ov5670_identify_module() error";
> +			goto error_print;
> +		}
>  	}

I don't like the fact that we can't detect any hardware connection issue
here anymore and we would actually get some obscure failure when we
actually start streaming.

Wouldn't it be possible to still keep this behavior of not powering on
the device at boot-up if no driver is bound and then have this driver
built as a module and loaded later when the camera is to be used for the
first time after the system boots?

Best regards,
Tomasz
