Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17C53FD5C5
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241652AbhIAImF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:42:05 -0400
Received: from mx21.baidu.com ([220.181.3.85]:33194 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241500AbhIAImE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 04:42:04 -0400
Received: from BJHW-Mail-Ex01.internal.baidu.com (unknown [10.127.64.11])
        by Forcepoint Email with ESMTPS id 278B7CF8B30229C813F5;
        Wed,  1 Sep 2021 16:41:05 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 16:41:05 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 1
 Sep 2021 16:41:04 +0800
Date:   Wed, 1 Sep 2021 16:41:03 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: sti/c8sectpfe: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Message-ID: <20210901084103.GB31100@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210901055631.7829-1-caihuoqing@baidu.com>
 <91245ea5-215f-5e60-0a97-7c29ceb7c3a9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91245ea5-215f-5e60-0a97-7c29ceb7c3a9@xs4all.nl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex16.internal.baidu.com (172.31.51.56) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01 Sep 21 10:20:26, Hans Verkuil wrote:
> On 01/09/2021 07:56, Cai Huoqing wrote:
> > Use the devm_platform_ioremap_resource_byname() helper instead of
> > calling platform_get_resource_byname() and devm_ioremap_resource()
> > separately
> > 
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> >  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> > index 02dc78bd7fab..9f05984f711a 100644
> > --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> > +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> > @@ -665,7 +665,6 @@ static int c8sectpfe_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *child, *np = dev->of_node;
> >  	struct c8sectpfei *fei;
> > -	struct resource *res;
> >  	int ret, index = 0;
> >  	struct channel_info *tsin;
> >  
> > @@ -676,14 +675,11 @@ static int c8sectpfe_probe(struct platform_device *pdev)
> >  
> >  	fei->dev = dev;
> >  
> > -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "c8sectpfe");
> > -	fei->io = devm_ioremap_resource(dev, res);
> > +	fei->io = devm_platform_ioremap_resource_byname(pdev, "c8sectpfe");
> >  	if (IS_ERR(fei->io))
> >  		return PTR_ERR(fei->io);
> >  
> > -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > -					"c8sectpfe-ram");
> > -	fei->sram = devm_ioremap_resource(dev, res);
> > +	fei->sram = devm_platform_ioremap_resource_byname(pdev, "c8sectpfe-ram");
> >  	if (IS_ERR(fei->sram))
> >  		return PTR_ERR(fei->sram);
> >  
> > 
> 
> Compile error:
> 
> drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: In function ‘c8sectpfe_probe’:
> drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:686:33: error: ‘res’ undeclared (first use in this function); did you mean ‘ret’?
>   686 |  fei->sram_size = resource_size(res);
>       |                                 ^~~
>       |                                 ret
> drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:686:33: note: each undeclared identifier is reported only once for each function it appears in
> 
> Regards,
> 
> 	Hans
I'm very sorry for it, please forget this patch-sti/c8sectpfe.

I have deleted the "struct resource *res;", if 'res' is used
anywhere, compiler will complain,then I should fix it.
But, in this case, I miss sti/c8sectpfe

Cai
