Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141AB699B2A
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 18:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjBPRXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 12:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjBPRXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 12:23:01 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2034C6D5
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 09:23:00 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id v11so3129189edx.12
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CgujHaHXUR9rsoL7c92bZNN7/8k5pOu6iNqvBQ5bLj4=;
        b=lBP7D2RChfckbpLKqiJvNWKcJ9clSqSYv8bnizeDEmQluv6xMIOnbtFGrHei1W+ZZN
         rRm946SwdJjWXjawN2Tj5ny2Zj+g+ytsVyfAhZotJJEK6eSsb4TOzf5ub0uAbARG/SAn
         1gzQgAu8GFO7HRTd74gwpL+Jmhcve2n5bWkWBESO9S8uLMDtvxhHsWoWCLBZ4rGQ/RQV
         yOkohcxhrzcJBNe0lef3a+AISNeXnq9NKYbxMsBXG6uVQh2fSKMRPWkYrUaUEZlN2bVn
         2kKsStvuQxmeuwpmV33GLYfvi6shxe3UZV8IVUPhGgP2wWVsm9ozDVshDkR9MqxmsEnM
         x8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgujHaHXUR9rsoL7c92bZNN7/8k5pOu6iNqvBQ5bLj4=;
        b=4Lxizk31vyJ59g2o7RGv5BxEV+lr3CGjOJGLaqepXhD5QATB1XiL6Aq/PL61TuDslq
         rU79es3hjOj2mGK3glKXvDBEzWKhJY0ZC/YuinxljHJUDgwG4wuTR0XitvDtLabg8Hfm
         md2+7xfKKXjujdVx/ImeKkvMZGZA3NbzxKcnvw80UQNL1l3sWrdAsDJ0h9E8Fl8hAXkd
         xHtDe38Grer/4q+VW3KAnJIvTUdnnHhDzf0tPh/jfh/S8k6MKbma/Tsx7i0mcU0nGmzR
         CXpoSh/Ag8oOif9J1AZEGJTzT6HsuH0xU6WpSQ6sx8muvutZIXzB9MFQZxADXcgsAxGt
         41hA==
X-Gm-Message-State: AO0yUKVC55AHo6Esw4N0ADP+OHAaX2nUe/K948mlpe/QYxL9pSyiWPtq
        ZzTWnSoUVGDT6ldcnEXZlpQK8CvDxstIMyQLmB59hycdBvVAP6dp
X-Google-Smtp-Source: AK7set8WtPrjRgcSyrVQo+ZpdoncG6QN25IVOlwDMY0eXKiuWBP53zX28TlFTLNWpPB4OJ2SCaKg/2mpehtwFG+pACQ=
X-Received: by 2002:a17:906:3b10:b0:886:4b7e:c1dc with SMTP id
 g16-20020a1709063b1000b008864b7ec1dcmr3261650ejf.6.1676568178457; Thu, 16 Feb
 2023 09:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20230215214724.3798917-1-linux@roeck-us.net>
In-Reply-To: <20230215214724.3798917-1-linux@roeck-us.net>
From:   Joe Tessler <jrt@google.com>
Date:   Thu, 16 Feb 2023 12:22:21 -0500
Message-ID: <CAJPkMDTDU-UK35hrx4=c26VmBVSuZO6usr9Omiq2dtyTjHsZLg@mail.gmail.com>
Subject: Re: [PATCH v2] media: cec: i2c: ch7322: Drop of_match_ptr
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joshua Pius <joshuapius@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Guenter,

Thank you for this fix.

On Wed, Feb 15, 2023 at 4:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The driver does not instantiate on ACPI based systems if OF is disabled.
> Fix the problem by dropping of_match_ptr.
>
> Cc: Joshua Pius <joshuapius@google.com>
> Tested-by: Joshua Pius <joshuapius@google.com>
> Fixes: 21b9a47e0ec7 ("media: cec: i2c: ch7322: Add ch7322 CEC controller driver")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Joe Tessler <jrt@google.com>

> ---
> v2: Added Joshua's Tested-by: tag
>
>  drivers/media/cec/i2c/ch7322.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
> index 34fad7123704..3c6e6496a001 100644
> --- a/drivers/media/cec/i2c/ch7322.c
> +++ b/drivers/media/cec/i2c/ch7322.c
> @@ -589,7 +589,7 @@ MODULE_DEVICE_TABLE(of, ch7322_of_match);
>  static struct i2c_driver ch7322_i2c_driver = {
>         .driver = {
>                 .name = "ch7322",
> -               .of_match_table = of_match_ptr(ch7322_of_match),
> +               .of_match_table = ch7322_of_match,
>         },
>         .probe_new      = ch7322_probe,
>         .remove         = ch7322_remove,
> --
> 2.39.1
>

Joe
