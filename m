Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F6D29DC00
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 01:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbgJ2ASu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 20:18:50 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38202 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731822AbgJ1Wpf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:45:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id m20so1004605ljj.5;
        Wed, 28 Oct 2020 15:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0KdWq/UxN3mZhg6059eXgPkPMEcpbLJswGfi0We+PWc=;
        b=rSfXFJknFVoxv43JnKa5/7X3mTSgIyRunsFllASNsF4/fFO86GFhjUdJToHZv3mD14
         hsqCj8YVAE7DISGkiYY3A2lZa+LogRjpdEgaU1WeyCnUTAnUZ/QU/P298s81BRptU4Dj
         VB2hPyJ+QykAUbsxvx5yVRaEfnelXbZTuLmEZVIAFOT5GLZd6ybhEdTS09hDtbJ8bx5R
         2B0+wFknXaAWFKgupVtHHEpfaVC18V/tIxx+WScfufqJbs9yup4Xewhx/MPJdj4l6uUk
         A8yqGzh0FqDFbwL9eGVjwLFcog1hctBeF7Q44M5ArHDWkh8hcNhIXR6R1odrU75/7h4M
         Z0kg==
X-Gm-Message-State: AOAM531U6+/NqZkdUmx3xOwh/0+WFX/pCIyMRgvgJb8lkISb9bveEvFS
        3ub+DajbUn+f8XGZu9d9sU2CxTnEtXhVyw==
X-Google-Smtp-Source: ABdhPJyTZZn/hiZL9z3amMCBlQLOPc1jM+itYrAWR+4C77rc0U05V//ar61daSU/u7T8N2GlkIKFKA==
X-Received: by 2002:aa7:c2d8:: with SMTP id m24mr6918956edp.90.1603877027501;
        Wed, 28 Oct 2020 02:23:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id j3sm2557214edh.25.2020.10.28.02.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 02:23:45 -0700 (PDT)
Date:   Wed, 28 Oct 2020 10:23:43 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx258: validate rotation only if it is
 provided
Message-ID: <20201028092343.GA100461@kozik-lap>
References: <20201005151559.12003-1-krzk@kernel.org>
 <20201005151559.12003-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201005151559.12003-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 05, 2020 at 05:15:59PM +0200, Krzysztof Kozlowski wrote:
> The sensor supports rotation by 180 degrees however the value of
> "rotation" property should be validated only if it exists.  If
> "rotation" is missing, do not fail the probe:
> 
>     imx258: probe of 3-001a failed with error -22
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This is actually a fix, so these should be added:
Fixes: 17121d12a5c1 ("media: imx258: Check the rotation property has a value of 180")
Cc: <stable@vger.kernel.org>

Best regards,
Krzysztof

> ---
>  drivers/media/i2c/imx258.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index aedf8e7c6165..c52932e5b881 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -1284,7 +1284,7 @@ static int imx258_probe(struct i2c_client *client)
>  	 * supports a single pixel order right now.
>  	 */
>  	ret = device_property_read_u32(&client->dev, "rotation", &val);
> -	if (ret || val != 180)
> +	if (!ret && val != 180)
>  		return -EINVAL;
>  
>  	/* Initialize subdev */
> -- 
> 2.17.1
> 
