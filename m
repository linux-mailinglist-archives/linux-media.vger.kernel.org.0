Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605F935479C
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 22:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240937AbhDEUhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 16:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237073AbhDEUhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 16:37:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FA2C061788;
        Mon,  5 Apr 2021 13:37:32 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so6180435wmj.2;
        Mon, 05 Apr 2021 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zSdJzo4zoszwh3Ropy9vcijZc4A27t1uaB8gJuuiu4g=;
        b=hmVYR+JY6euACjuRwMjEvkG0WrRGtN9CAFdInTC2M0Vl9ezJsRsiyqHtMXYe7kQmMO
         Yyk4bABlSI+X8WQmYS8WsbhxJiaRCZrXyTsu32jw0N4qO8M5lu0srht25bZJvJFAn2r5
         JXqbnEChpJxkUohqQGqWEHBdchlFlpupZZB4jLmaWbO7+q+XgctquRjn+j8OaLkhMNAY
         Souxwwno2tEy0NrmCHzJ82ciFqmlF8SlfJWiXXZd+V/j5z7XI5IQO334BjUjml16yRQ4
         9TYeflMTWDIjld/UXHbJwIZQeecU5leg3uJMZRf2IMf7nRzRYCkIbONYwEUwpxk9UvaZ
         r5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zSdJzo4zoszwh3Ropy9vcijZc4A27t1uaB8gJuuiu4g=;
        b=JNAG63dgWW72qOfwRePELqqMA5EqWiSVL3fxevJETRmwhvAc/uVlSy1abIgUbRT3pf
         kEb5Q+nz2bKR/480/E2357tDMe2jD/7QGXHvcU7IiQKa59VXHKplE7V8aQrs9rQxOC57
         x7xwt7PixdKQooCJyVHf9nbLw4bh5IfOuoGUrna7GttnRhVeiHlFuZ1uiSUzNkKxjrYk
         xxoHfs7OhQGonHCBZU0mZ0//cPWfP1urEk9T6BhdxhBoAnXbRPKlM86JLEwXGur8r2q1
         7XpsVym74l7B0zP+/1SVy+nxGiKKNpoajqV07Go4c/Oeyc5l8l+0NRfSzKFggDb0ROxe
         4aSQ==
X-Gm-Message-State: AOAM533nbfg5MbvwLFAjkD5Nbg8DMKH0koDE9rwkYrypZjCpJrWxxIIQ
        U9OkN3NL6UMss7aEN9JPHj0=
X-Google-Smtp-Source: ABdhPJxLvu1nDd41bm0vAQpJa/jWZ5c+AmGLkoqj2+wngMdm3FzMnHaMKgrH9TLW1Z+BZthq4sf80g==
X-Received: by 2002:a05:600c:2947:: with SMTP id n7mr777816wmd.61.1617655051662;
        Mon, 05 Apr 2021 13:37:31 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.21])
        by smtp.gmail.com with ESMTPSA id v3sm679284wmj.25.2021.04.05.13.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:37:31 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Fix referece counting when
 looping over ACPI devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210404181409.1451026-1-andy.shevchenko@gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <1ab48622-be85-f1d7-caa4-8b04a4727d5d@gmail.com>
Date:   Mon, 5 Apr 2021 21:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210404181409.1451026-1-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 04/04/2021 19:14, Andy Shevchenko wrote:
> When we continue, due to device is disabled, loop we have to drop reference count.
> When we have an array full of devices we have to also drop the reference count.
> Note, in this case the cio2_bridge_unregister_sensors() is called by the caller.
>
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>


Ah; thanks for catching those, I'm annoyed to have missed the
acpi_dev_put() calls in particular

Reviewed-by: Daniel Scally <djrscally@gmail.com>

