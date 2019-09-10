Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B13AE5C9
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 10:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732994AbfIJInH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 04:43:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40026 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfIJInH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 04:43:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so18362963wru.7;
        Tue, 10 Sep 2019 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=nfdC2GGtaooPtZtmidwW3K7yrWTHhue1SpTbAz123sM=;
        b=jKHppvFkO5Gt5906dogykoF3lYe9HZbBaPvbhIUFyv+x7WW/g8Sdj17t4VhfEqZpEB
         q4k4j3WBTG90HOZP1t2HW994ApnivdCukvcifEY+8RQbGxHF4oTeiUeCH1ywXaT/bcZT
         GTxMMZ5NKWsd1gCNCOZ25vYup9pxunGCqnTVnrJ6EOLCk5U328VUNYDCrrYSymggX6On
         18z3mD1KH5AyFou6teiXOU/rPf+/P6ZIrWLNzyBIJC6FMQKDcIrAqyOc6YAdmgDej+2F
         7T49SC1PwKbY8Uyz1vvf3trKAh/IHBpzSKvh6uUF2YuTxi9OlJq4A3CrPj483kpYWcUr
         4Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=nfdC2GGtaooPtZtmidwW3K7yrWTHhue1SpTbAz123sM=;
        b=tvz0D22PzhvMRWQSk/3OUMW1Byn4i86Y7I5Z5EHcvv65NJyHUemPrQ7RjG5MDZzk1f
         grqThqlZxyqIJZdJYWxDqpNhmLiqtnAQTA+1fPQ7fRR6LT1p+9Ux+Ma4VcIIywvjKlG9
         5BBXU/lPWd5FTltWSnI+vInSEIZnzYNmXvnRnJJD3brmtEoZcYF9TgY+scBtfeFhSMNN
         jCJHSrCtQsgnHZpFkFwMXIdYiI+37RLI7n/+I6z9CTGiiHpMkbMVcvGVIZVmQlsZdVvJ
         LQthHhSonBmk8pIh8ndmZKvdzMvHA06+Vg2s9NLhHxRC/x1Eet23zNpWsbeyvY0R1U6a
         PfDA==
X-Gm-Message-State: APjAAAW5ofdmbFG9FBa5XlP3mJ3nfu+omEbAm6XoRIwo15BpHpk/K5/N
        u6NXTzZ69qQWhiS+MiB/7Oc8VoQ6z5g=
X-Google-Smtp-Source: APXvYqydvCw8RjIL5trT9vYV+h75kxjAAQgjOhtgr/ThwUm0YuVUtshKI2bG//L18ev46IW1+a6HAA==
X-Received: by 2002:a5d:6604:: with SMTP id n4mr24405862wru.267.1568104984503;
        Tue, 10 Sep 2019 01:43:04 -0700 (PDT)
Received: from arch-late ([148.69.85.38])
        by smtp.gmail.com with ESMTPSA id n8sm3473721wma.7.2019.09.10.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 01:43:03 -0700 (PDT)
References: <20190906150823.30859-1-colin.king@canonical.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx7-mipi-csis: make array 'registers' static const, makes object smaller
In-reply-to: <20190906150823.30859-1-colin.king@canonical.com>
Date:   Tue, 10 Sep 2019 09:43:01 +0100
Message-ID: <m3y2ywley2.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Colin,
Thanks for the patch.

On Fri 06 Sep 2019 at 16:08, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the array 'registers' on the stack but instead make it
> static const. Makes the object code smaller by 10 bytes.
>
>
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   20138	   5196	    128	  25462	   6376	staging/media/imx/imx7-mipi-csis.o
>
> After:
>    text	   data	    bss	    dec	    hex	filename
>   20032	   5292	    128	  25452	   636c	staging/media/imx/imx7-mipi-csis.o
>
> (gcc version 9.2.1, amd64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks very good to me.
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 73d8354e618c..f8a97b7e2535 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -293,7 +293,7 @@ static int mipi_csis_dump_regs(struct csi_state *state)
>  	struct device *dev = &state->pdev->dev;
>  	unsigned int i;
>  	u32 cfg;
> -	struct {
> +	static const struct {
>  		u32 offset;
>  		const char * const name;
>  	} registers[] = {

