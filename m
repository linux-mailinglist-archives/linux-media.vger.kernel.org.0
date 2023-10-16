Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40CAB7CA859
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 14:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjJPMrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 08:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbjJPMrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 08:47:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65792F3
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 05:47:05 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507a29c7eefso2340927e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697460423; x=1698065223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6qlswPv1xYuo23Eivhw9YGnLAMdr4T3bJoXkm2ZqKu0=;
        b=wr+I54bx9Ul3ic/ReeHe5mldHrI7A7iwVEfn0BrrrqVf9xhsG3m1UgArv1KenBjPKB
         DfeRoINOFPOqsQUdmHoC4VuyRf3X/x61dxgtxqSoZIHuS5G7QyRgrX+GDbMRX+hMMyUy
         ASMkQZboTW1Uq+D2TSbkC1ykPEEpVZX/OBwOnfn4JUiOp9g35C0kx83AgqAgWlrB+D1J
         3ofQH8ip4C3hMRxXlYa0NZvoA0HlcA4wAa+/w8VYWZLSbOzyoLy2B+MVF1WcaWRMhjr3
         lJp3CPNTTnuJ9j5qiOB8ju25ibHmaRg1XdkE3Yu6a1hEQ8yhhJ8Bdxk5iL4tbbjaGGOG
         JVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460423; x=1698065223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qlswPv1xYuo23Eivhw9YGnLAMdr4T3bJoXkm2ZqKu0=;
        b=qTLAr6YYK36R2YD7lD5Qbhg+dp+r+MqI/UaWZVqvCPYEmf4MeQJB6BBV6MizKHUlDG
         DtWwVfKK7TMjqcJ5CKs4bPmf/mf4/LECJbSkO3K6X6/7Qe2KeBpZQxXcJ+4UdM2V4xaG
         ldGcsthFiDk1E6HNWj2IdMNXP54NHfVhOajUZ/3ytr9dIg7p8L1z48a9/6zf1FngX5Aj
         QdsVKVcIPgCVGishkU9+7fALUarY53IMZxG2sNGvzmwcKfqxGQZxRwS+UHee4I/xLS13
         WZIQty22+dWkLB8z7PCGitPkjppyo7p0Kt7k1rKUS0yujnmZhIK1lNK0K7q5jbs/5KiJ
         UMBA==
X-Gm-Message-State: AOJu0YwscOwgo30HQTF4YcvvzzH7VlUJnu9dx+xTRfoEc7pemB5IAYlk
        t8wuZC66w8eMvpUn8/+Y2Cin4vB29tQLJYbtpks=
X-Google-Smtp-Source: AGHT+IEfwP8Ny2CwS5u9o3Y03kbQA8zl0t+JymNxTJZnFAbynfJOWtpPhq+AvNPWML0qNRbwl2S3YQ==
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id cf43-20020a056512282b00b005057371ec83mr33967223lfb.48.1697460423511;
        Mon, 16 Oct 2023 05:47:03 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512070400b00502e2ab7118sm734431lfs.50.2023.10.16.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:47:03 -0700 (PDT)
Date:   Mon, 16 Oct 2023 14:47:02 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     ihor.matushchak@foobox.net
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: max96712: fix copy-paste error
Message-ID: <ZS0wxi7SUhJcVh5Y@oden.dyn.berto.se>
References: <ZSq4-7W_ke5XKsrE@oden.dyn.berto.se>
 <20231015212447.7072-1-ihor.matushchak@foobox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231015212447.7072-1-ihor.matushchak@foobox.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Ihor,

Thanks for your work.

Maybe use a more descriptive commit title? The idea is to describe the 
issue a patch addresses in the title. Not the reason why the issue was 
introduced, this goes into the commit message. Imagine another 
copy-paste error is found in the driver, then we would have two commits 
with the same title.

How about?

  'media: staging: max96712: Fix device name in description'

On 2023-10-15 22:24:47 +0100, ihor.matushchak@foobox.net wrote:
> From: Ihor Matushchak <ihor.matushchak@foobox.net>
> 
> Fix the device model name in driver description,
> which appears to be a copy-paste error

Super-nit: Missing trailing dot.

> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
> ---
>  Changes in v2:
>  Add commit message describing the change;
> 
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..ea67bcf69c9d 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Maxim MAX9286 Quad GMSL2 Deserializer Driver
> + * Maxim MAX96712 Quad GMSL2 Deserializer Driver
>   *
>   * Copyright (C) 2021 Renesas Electronics Corporation
>   * Copyright (C) 2021 Niklas Söderlund
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
