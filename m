Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5A729867
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 14:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391359AbfEXM6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 08:58:55 -0400
Received: from casper.infradead.org ([85.118.1.10]:52652 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391124AbfEXM6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 08:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Uu9Fmh5pwSkk63A/ozGUPFdWVQX5yOpI9xs85fZyEQA=; b=jxRC9/nxBNjuwCaVymHPBJAC1G
        h0h2yiTY+lQ92E0Kji4sDWnj6Rrg6S0W7LqqjU+6oSVVgsrt3Fgi7a/HYNVesz7M7TgpT2/GoAbOO
        O3Tw454tu7FVIGbRiYKSbHBkRsfo3b3cy4ZWZoKwb+of0bzwyVFsgLEDyU5A5hdohM98R0F3KeebD
        QDDkL93Pl8xFPvSWf5PyR2dU44oT4MKfKTbBXYfmw0a8xknNWwfD+Eh4La5y9kIRG/H2bJVagGplz
        7q3YdgpX+6t1L1y/rNMtPYqjpXeE5rUTj87UBcMv6rZoNMFXM3RYnXkVcdgcOWFxmgz0kjoCG0V6w
        sx849M4Q==;
Received: from 177.97.63.247.dynamic.adsl.gvt.net.br ([177.97.63.247] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hU9mc-0006sj-E0; Fri, 24 May 2019 12:58:51 +0000
Date:   Fri, 24 May 2019 09:58:45 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH next 15/25] media: platform: Use dev_get_drvdata()
Message-ID: <20190524095845.26ef82fd@coco.lan>
In-Reply-To: <20190423075020.173734-16-wangkefeng.wang@huawei.com>
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
        <20190423075020.173734-16-wangkefeng.wang@huawei.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 23 Apr 2019 15:50:10 +0800
Kefeng Wang <wangkefeng.wang@huawei.com> escreveu:

> Using dev_get_drvdata directly.

Patch looks ok to me. Assuming that this will be applied via some
other tree:

Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/media/platform/cros-ec-cec/cros-ec-cec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> index 7bc4d8a9af28..2e218c7a3a1f 100644
> --- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> +++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> @@ -174,8 +174,7 @@ static const struct cec_adap_ops cros_ec_cec_ops = {
>  #ifdef CONFIG_PM_SLEEP
>  static int cros_ec_cec_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct cros_ec_cec *cros_ec_cec = dev_get_drvdata(&pdev->dev);
> +	struct cros_ec_cec *cros_ec_cec = dev_get_drvdata(dev);
>  
>  	if (device_may_wakeup(dev))
>  		enable_irq_wake(cros_ec_cec->cros_ec->irq);
> @@ -185,8 +184,7 @@ static int cros_ec_cec_suspend(struct device *dev)
>  
>  static int cros_ec_cec_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct cros_ec_cec *cros_ec_cec = dev_get_drvdata(&pdev->dev);
> +	struct cros_ec_cec *cros_ec_cec = dev_get_drvdata(dev);
>  
>  	if (device_may_wakeup(dev))
>  		disable_irq_wake(cros_ec_cec->cros_ec->irq);



Thanks,
Mauro
