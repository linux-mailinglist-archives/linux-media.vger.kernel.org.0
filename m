Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F715B61F4
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 13:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfIRLA4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 18 Sep 2019 07:00:56 -0400
Received: from unicorn.mansr.com ([81.2.72.234]:38946 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfIRLAz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 07:00:55 -0400
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id CD3A91538A; Wed, 18 Sep 2019 12:00:53 +0100 (BST)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH] media: rc: Use devm_platform_ioremap_resource() in tango_ir_probe()
References: <04df8450-1b15-55ec-91e7-7d72ffbedac7@web.de>
Date:   Wed, 18 Sep 2019 12:00:53 +0100
In-Reply-To: <04df8450-1b15-55ec-91e7-7d72ffbedac7@web.de> (Markus Elfring's
        message of "Wed, 18 Sep 2019 12:37:24 +0200")
Message-ID: <yw1xk1a56f8a.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Markus Elfring <Markus.Elfring@web.de> writes:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 12:30:18 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Mans Rullgard <mans@mansr.com>

> ---
>  drivers/media/rc/tango-ir.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/rc/tango-ir.c b/drivers/media/rc/tango-ir.c
> index 451ec4e9dcfa..b8eb5bc4d9be 100644
> --- a/drivers/media/rc/tango-ir.c
> +++ b/drivers/media/rc/tango-ir.c
> @@ -157,20 +157,10 @@ static int tango_ir_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct rc_dev *rc;
>  	struct tango_ir *ir;
> -	struct resource *rc5_res;
> -	struct resource *rc6_res;
>  	u64 clkrate, clkdiv;
>  	int irq, err;
>  	u32 val;
>
> -	rc5_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!rc5_res)
> -		return -EINVAL;
> -
> -	rc6_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!rc6_res)
> -		return -EINVAL;
> -
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0)
>  		return -EINVAL;
> @@ -179,11 +169,11 @@ static int tango_ir_probe(struct platform_device *pdev)
>  	if (!ir)
>  		return -ENOMEM;
>
> -	ir->rc5_base = devm_ioremap_resource(dev, rc5_res);
> +	ir->rc5_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ir->rc5_base))
>  		return PTR_ERR(ir->rc5_base);
>
> -	ir->rc6_base = devm_ioremap_resource(dev, rc6_res);
> +	ir->rc6_base = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(ir->rc6_base))
>  		return PTR_ERR(ir->rc6_base);
>
> --
> 2.23.0
>

-- 
Måns Rullgård
