Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84AA42CECE
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 00:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhJMWnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 18:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhJMWn0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 18:43:26 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FA1C061746;
        Wed, 13 Oct 2021 15:41:22 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k7so13143522wrd.13;
        Wed, 13 Oct 2021 15:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sHa7mUQcHOXPtd83ipXEUE5aNuvEdNtFQHzuxVianM4=;
        b=ZsOiV9UXctlmyCDtxU0V9dSXTqOm1H5EAcOBySQOL27UuG2JhfhqJxqxfWmJdjBun3
         YRYyhSxSdIqYo82Ev82Q+wk4KvHxQPVdb4MrbMh/Rh7R62kq4VjRaQnPQJ+vUV7/227B
         4R+GHCVaoHWXcrJq4KjsnpoFfntZqDHTBsE5SPb8dvaaJHgfXJYLHnc6o5QLoJVExuVo
         iI01UCzPM+ht3vR9zqiiq+XBhsW3dbFBeCMbDHQ1ynvYmPh7+NmeT78zHll+naOC68lJ
         8vsrE/reLqnFFt6zGviI9atZeI5SLLlWr+StfNS0aAbphmcSYW6JR8nLt7jeZ1wcs0Z5
         rD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sHa7mUQcHOXPtd83ipXEUE5aNuvEdNtFQHzuxVianM4=;
        b=UmuXqF/2UdzfiXVCABzyn6NRVB4+HafUQyybQ00PEN036RInGD3HsiJzWxf3mhaLWW
         TlylY3q0NGoBXs9wxAZssaG8yIXb5KEj/BnhZpcAa7bdduA1dBz1q5CKNQu86gecnYpJ
         eFizmb+quYfHwo/deD0eHmkjGlZkGkvqgdBLxLD3yQ0RBwjGR4RVoGOquMyIkPZhQDGT
         DZoMqVooS6ZtyZ0znC8jIAb2ifC76j8drJYwGYoFhSXVlIBsbGsQ2YtfhbZwcazmGhm0
         /i9tYFN8N6VhRD8uZc7Kmx6+r0N4dODqsenRBkuWgOw8VRYpnJ0oqwnhO/l01CGz2zYX
         o0LQ==
X-Gm-Message-State: AOAM533PdSGaYvgvpJX1GlFXgK0LkfPt32KEtll0rcdXR+a0YTWvnq0E
        xvGdXYIrsbGGMSlMXgKdbO2XJlQq9cs=
X-Google-Smtp-Source: ABdhPJwvVcg84aeYFhzB9lFcqYYWuT+A7VqvfveWNpzOGIK4hhJMe0U6ZM6DfK0ot6qnyHAQ1Yjx7Q==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr2224720wrt.149.1634164880569;
        Wed, 13 Oct 2021 15:41:20 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v3sm776456wrg.23.2021.10.13.15.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:41:20 -0700 (PDT)
Subject: Re: [PATCH] media: ipu3-cio2: fix error code in
 cio2_bridge_connect_sensor()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Yong Zhi <yong.zhi@intel.com>,
        =?UTF-8?Q?Fabian_W=c3=bcthrich?= <me@fabwu.ch>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20211013075319.GA6010@kili>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e3880fc8-6189-ccca-e50b-d1bca27633dc@gmail.com>
Date:   Wed, 13 Oct 2021 23:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013075319.GA6010@kili>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On 13/10/2021 08:53, Dan Carpenter wrote:
> Return -ENODEV if acpi_get_physical_device_location() fails.  Don't
> return success.
>
> Fixes: 485aa3df0dff ("media: ipu3-cio2: Parse sensor orientation and rotation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Thanks for catching that.


Reviewed-by: Daniel Scally <djrscally@gmail.com>

> ---
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index 67c467d3c81f..0b586b4e537e 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -238,8 +238,10 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  			goto err_put_adev;
>  
>  		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
> -		if (ACPI_FAILURE(status))
> +		if (ACPI_FAILURE(status)) {
> +			ret = -ENODEV;
>  			goto err_put_adev;
> +		}
>  
>  		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
>  			dev_err(&adev->dev,
