Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C118776E589
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 12:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbjHCKXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbjHCKVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 06:21:40 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9575D30FD
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 03:20:22 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RGlGH2mLjz49Q3P;
        Thu,  3 Aug 2023 13:20:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1691058008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UFlV9LD3IycUiW4qcU5Xq83XAYPggnSzN8z9jeQGFv4=;
        b=Lm9sn1JbYhTtkaIZwZQ4uhyq9m02WLHaIZRpqALOwfc0BX2jX4zXlCrTJdDx/rES5KqKmj
        /2Xt4KVTcygcCvE9H5R1UglPD37bcZwn94EGJ1jd4sMm0pKWEdIkKmMyKgeudm2KwNQPBo
        T3cpHxex++v3bBMjbBa3WbZ/IyQNmH1/7G5Dq6XwUo8jsLsTa08Dh9eYEo5kuKNYoOVeLw
        TxU73dwBN0W/3BvjpdBmN0YQ4UjcBvn5Q0QNL3nOtvKjo2h8nv60aQfwLIke8GeYe2J++d
        hFn1+rWofOIKEmCF9A469A2Al6vfRv52NmsTEZFgd/1zgKskrxXH7rDAhcDGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1691058008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UFlV9LD3IycUiW4qcU5Xq83XAYPggnSzN8z9jeQGFv4=;
        b=lJMXZhtLwlk4Tu7yzBTR/xCGWJ2BQ0bHYptqhDUIEhQ4w9O772UoYxy0UJ/Q8jGibQhng7
        GIuTfPX7v09U7LqqZB7v3/5kTOQ2BNWFB/rwdi89egivW8Vx6aZcLjAPZWWGqZFSU11w9q
        x/+X9MX8TRHn+4sWd+g+XDvKwQDchcsfSWLiwpcTM/WcNl1yXCMw7fSDrdWKSZjVq5kLQO
        jaidGBLiRa1BWluw1iq7gZW21jDFFIXpf9LZLgnzh6b6RgmOoOubU/zb4uaNcFMo0mtab/
        P/x9udHK0NOMUFp4ffPnFT527T6noC9d+28H1rzyG8xC/X0elu2zMA3qaOokMw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1691058008; a=rsa-sha256;
        cv=none;
        b=gM/P7/WI4zLBcDPaFdJMCIeLSOwaoucAC1907UApNVAmYzuQZndS6xL1WQjEq3VcbxvuUg
        cMB4j9gpwbVovWmUVHyY96nHBHo2uvN9vOHuuoaqs9+NQiOGlAJ6iaqaXEdBCFcuWGh9dd
        SgMKV3owIEKvzUFZiRZvsxc7+walKc+cgtrzRDhOwNv04fdRI4Le2SbHXFW0HqGQ2sXodd
        hnvD25OUGyzDXuwnYvUZduIFsjx4xVpQcJqQA4G1Fs+wypkxsNrjkhka9tDCs0VVSoW2Rs
        FjQrRX9LDfC+p66Ky39FgpG5BCn1ZBxStkJPQ4CrgnP0eqpttKn8B8ZjghXGSw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E753F634C23;
        Thu,  3 Aug 2023 13:20:06 +0300 (EEST)
Date:   Thu, 3 Aug 2023 10:20:06 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ruan Jinjie <ruanjinjie@huawei.com>, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH -next] media: platform: ti: fix the return value handle
 for platform_get_irq()
Message-ID: <ZMt/Vh5ZYjozZ9Ef@valkosipuli.retiisi.eu>
References: <20230731120212.2017996-1-ruanjinjie@huawei.com>
 <20230802210444.GF29718@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802210444.GF29718@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 03, 2023 at 12:04:44AM +0300, Laurent Pinchart wrote:
> Hi Ruan,
> 
> Thank you for the patch.
> 
> On Mon, Jul 31, 2023 at 08:02:12PM +0800, Ruan Jinjie wrote:
> > There is no possible for platform_get_irq() to return 0,
> > and the return value of platform_get_irq() is more sensible
> > to show the error reason.
> > 
> > Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> > ---
> >  drivers/media/platform/ti/am437x/am437x-vpfe.c | 4 +---
> >  drivers/media/platform/ti/omap3isp/isp.c       | 4 +---
> >  2 files changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> > index 81a63a3865cf..a85b97107de7 100644
> > --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> > @@ -2420,10 +2420,8 @@ static int vpfe_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	ret = platform_get_irq(pdev, 0);
> > -	if (ret <= 0) {
> > -		ret = -ENODEV;
> > +	if (ret < 0)
> >  		goto probe_out_cleanup;
> > -	}
> >  	vpfe->irq = ret;
> >  
> >  	ret = devm_request_irq(vpfe->pdev, vpfe->irq, vpfe_isr, 0,
> > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > index f3aaa9e76492..226db75221cd 100644
> > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > @@ -2398,10 +2398,8 @@ static int isp_probe(struct platform_device *pdev)
> >  
> >  	/* Interrupt */
> >  	ret = platform_get_irq(pdev, 0);
> > -	if (ret <= 0) {
> > -		ret = -ENODEV;
> > +	if (ret < 0)
> >  		goto error_iommu;
> > -	}
> >  	isp->irq_num = ret;
> >  
> >  	if (devm_request_irq(isp->dev, isp->irq_num, isp_isr, IRQF_SHARED,
> 
> The changes look fine to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Sakari, would you like to merge this through your tree ?

Done, thanks. I'll push it this afternoon to my git.linuxtv.org tree.

-- 
Sakari Ailus
