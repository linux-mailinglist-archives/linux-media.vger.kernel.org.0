Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8745A931
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 17:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbhKWQto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 11:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbhKWQtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 11:49:41 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36029C06173E;
        Tue, 23 Nov 2021 08:46:33 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v1so61000263edx.2;
        Tue, 23 Nov 2021 08:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T8hJVvhjj03aAS4wCWYZ0NqxD8bQ/6nHp3n3m7zAEZI=;
        b=Zj+3CJZE0XsYGYGYbsDr0DYBjiqHXd2f5fMTK9cVdyGyjRri79BNak1r1pO4TvaLRq
         mXZmqKqev8CBnsCUgrxk9ldLOGcCt+98Zl8LEoBmAjcyYtC5zMdWRyXrPTsAw/f0O8L2
         LWM44mrZbsV3vwrGKU4wEZUHwpi+wFVuJuUGSsweQYx2oosoEKyQM08lqHYnmtGiQJ4f
         Ui31KKYZUDpQFsWrFqHw4mOlEefSQotTLs8oQmJbfMgife4lHzVd3PTnekWATc6MxcfB
         w0IgRVV9uqOZaKtwJKRnQVP22fX1wu90+z9sL3FPB0ApnrmY5t8hhg5+Q/33ZuSMjJgZ
         4P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T8hJVvhjj03aAS4wCWYZ0NqxD8bQ/6nHp3n3m7zAEZI=;
        b=jm3JJigYnsR1nQ6XAQyzhnHcqBCGcALEdx3m9g1EktdaCwHOnfQdKanjCW0JTAastl
         jDqnCo0sdwwaVNFo0DZG9vV4Go+yPVu4k92Xbpz/gOLVBq7SwQrd7SUn6gqhU8Y1/G5V
         SLnCV8tvY/VGu/lnwIki/yHLPK1XN9xKCax0TgaTdgufBJt7nadubbd2c4EtArLePbre
         geg5SYx/B8vK0KHzhSaqj54eFViJuq+vUIgbVHBWma4FwdWJl2Cm9HxEY/MvNu+HMEOX
         rYjDPVQ72ScQ047QJ5aIzeTSCORflQ8HOEnEB68qcEXI5lkfC2MZys+Hb4oTs7JT8EYi
         u+KQ==
X-Gm-Message-State: AOAM530lOI8YqaIeLaxjxj7rnHw9Yqqw6MKn4ngRAJlrgVSh5Hb+M/ln
        QP1mAUJ7eK96Tow1BbuN/y4=
X-Google-Smtp-Source: ABdhPJyLUBFkleYwLguLP2uuKkGq/+WQboEpjtMa960SFj6OrZVxonrXlQIEc9ZoEK9pemmQ0f6bkQ==
X-Received: by 2002:a17:906:eb8a:: with SMTP id mh10mr9243839ejb.198.1637685991743;
        Tue, 23 Nov 2021 08:46:31 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id w23sm6127157edr.19.2021.11.23.08.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 08:46:31 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
        nicolas.dufresne@collabora.com, mchehab@kernel.org,
        robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: Re: [PATCH 1/7] media: hantro: add support for reset lines
Date:   Tue, 23 Nov 2021 17:46:30 +0100
Message-ID: <9986998.nUPlyArG6x@kista>
In-Reply-To: <c474e2b5-8900-a7ca-620d-e03a284cf0fb@collabora.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com> <20211123145933.GD6514@kadam> <c474e2b5-8900-a7ca-620d-e03a284cf0fb@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Dne torek, 23. november 2021 ob 17:36:57 CET je Andrzej Pietrasiewicz 
napisal(a):
> Hi Dan, hi Jernej,
> 
> W dniu 23.11.2021 o 15:59, Dan Carpenter pisze:
> > On Tue, Nov 23, 2021 at 12:09:03PM +0100, Andrzej Pietrasiewicz wrote:
> >>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/
media/hantro/hantro_drv.c
> >>> index ab2467998d29..8c3de31f51b3 100644
> >>> --- a/drivers/staging/media/hantro/hantro_drv.c
> >>> +++ b/drivers/staging/media/hantro/hantro_drv.c
> >>> @@ -905,6 +905,10 @@ static int hantro_probe(struct platform_device 
*pdev)
> >>>    			return PTR_ERR(vpu->clocks[0].clk);
> >>>    	}
> >>> +	vpu->resets = devm_reset_control_array_get(&pdev->dev, false, 
true);
> >>> +	if (IS_ERR(vpu->resets))
> >>> +		return PTR_ERR(vpu->resets);
> >>> +
> >>>    	num_bases = vpu->variant->num_regs ?: 1;
> >>>    	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
> >>>    				      sizeof(*vpu->reg_bases), 
GFP_KERNEL);
> >>> @@ -978,10 +982,16 @@ static int hantro_probe(struct platform_device 
*pdev)
> >>>    	pm_runtime_use_autosuspend(vpu->dev);
> >>>    	pm_runtime_enable(vpu->dev);
> >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > It looks like this is the pm stuff that we have to unwind on error
> > 
> >>> +	ret = reset_control_deassert(vpu->resets);
> >>> +	if (ret) {
> >>> +		dev_err(&pdev->dev, "Failed to deassert resets\n");
> >>> +		return ret;
> >                  ^^^^^^^^^^
> > So this return should be a goto undo_pm_stuff
> > 
> > 
> >>> +	}
> >>> +
> >>>    	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
> >>>    	if (ret) {
> >>>    		dev_err(&pdev->dev, "Failed to prepare clocks\n");
> >>> -		return ret;
> > 
> > And this return should also have been a goto so it's a bug in the
> > original code.
> 
> So we probably want a separate patch addressing that first, and then
> the series proper on top of that.

I was just about to suggest that.

Other drivers usually enable PM last, so they don't have PM calls in unwind 
code. However, I think current approach is just as valid (with a fix).

Best regards,
Jernej

> 
> Regards,
> 
> Andrzej
> 
> > 
> >>> +		goto err_rst_assert;
> >>
> >> Before your patch is applied if clk_bulk_prepare() fails, we
> >> simply return on the spot. After the patch is applied not only
> >> do you...
> >>
> >>>    	}
> >>>    	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
> >>> @@ -1037,6 +1047,8 @@ static int hantro_probe(struct platform_device 
*pdev)
> >>>    	v4l2_device_unregister(&vpu->v4l2_dev);
> >>>    err_clk_unprepare:
> >>>    	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> >>> +err_rst_assert:
> >>> +	reset_control_assert(vpu->resets);
> >>
> >> ...revert the effect of reset_control_deassert(), you also...
> >>
> >>>    	pm_runtime_dont_use_autosuspend(vpu->dev);
> >>>    	pm_runtime_disable(vpu->dev);
> >>
> >> ... do pm_*() stuff. Is there any reason why this is needed?
> > 
> > So, yes, it's needed, but you're correct to spot that it's not
> > consistent.
> > 
> > regards,
> > dan carpenter
> > 
> 
> 


