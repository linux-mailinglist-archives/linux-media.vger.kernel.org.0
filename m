Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD323958C4
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 12:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhEaKLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 06:11:44 -0400
Received: from gofer.mess.org ([88.97.38.141]:52311 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231164AbhEaKLU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 06:11:20 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CB3F7C6480; Mon, 31 May 2021 11:09:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1622455777; bh=mezJQ2zSZ5F3S3oVCVDOVoKisZsAT+1OBctCiLkeiLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lj3TKLHMHU37ZDnjeuw/+ZKPeEpBZLrBfFV/gNF1PzE7XJ+dwF7IQdXn2HqCM9H5V
         TpIdNLoA8FlEMjYDhBPmh9p52YWa8+irbphnAI+Fn5MJQnn2yqOgkfNavwAB3j03ZU
         XTsFuttmaB02VvUmhVN0wTjVV/jcY5C1g7FIeM2efxpg8eRHpXbnDawaHYu1bhg6fQ
         rmZQZVslB+gVaJDHSKzlGswO9mPjV1tBHTR/FIeMQ/LHXMQo0hWjlAkbbpbZhahDR3
         D/ySyD2Za3Z65aZFFXdMfA6fZbfTknAsPYYzHQJX2/HN9FSGKrC3XQ3OtOKKSfQ8iG
         olAfQj9R9gDvQ==
Date:   Mon, 31 May 2021 11:09:37 +0100
From:   Sean Young <sean@mess.org>
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: st_rc: Handle errors of clk_prepare_enable()
Message-ID: <20210531100937.GA30390@gofer.mess.org>
References: <20210515123909.5638-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515123909.5638-1-novikov@ispras.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 15, 2021 at 03:39:09PM +0300, Evgeny Novikov wrote:
> Hadle errors of clk_prepare_enable() in st_rc_hardware_init() and its
> callers.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> ---
>  drivers/media/rc/st_rc.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
> index 3237fef5d502..f524fcf55acf 100644
> --- a/drivers/media/rc/st_rc.c
> +++ b/drivers/media/rc/st_rc.c
> @@ -157,8 +157,9 @@ static irqreturn_t st_rc_rx_interrupt(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static void st_rc_hardware_init(struct st_rc_device *dev)
> +static int st_rc_hardware_init(struct st_rc_device *dev)
>  {
> +	int ret;
>  	int baseclock, freqdiff;
>  	unsigned int rx_max_symbol_per = MAX_SYMB_TIME;
>  	unsigned int rx_sampling_freq_div;
> @@ -166,7 +167,10 @@ static void st_rc_hardware_init(struct st_rc_device *dev)
>  	/* Enable the IP */
>  	reset_control_deassert(dev->rstc);
>  
> -	clk_prepare_enable(dev->sys_clock);
> +	ret = clk_prepare_enable(dev->sys_clock);
> +	if (ret)
> +		return ret;

Now if probe or resume fails because of clk_prepare_enable() failing, no
error is logged. Please add a dev_err().

Thanks

Sean

> +
>  	baseclock = clk_get_rate(dev->sys_clock);
>  
>  	/* IRB input pins are inverted internally from high to low. */
> @@ -184,6 +188,8 @@ static void st_rc_hardware_init(struct st_rc_device *dev)
>  	}
>  
>  	writel(rx_max_symbol_per, dev->rx_base + IRB_MAX_SYM_PERIOD);
> +
> +	return 0;
>  }
>  
>  static int st_rc_remove(struct platform_device *pdev)
> @@ -287,7 +293,9 @@ static int st_rc_probe(struct platform_device *pdev)
>  
>  	rc_dev->dev = dev;
>  	platform_set_drvdata(pdev, rc_dev);
> -	st_rc_hardware_init(rc_dev);
> +	ret = st_rc_hardware_init(rc_dev);
> +	if (ret)
> +		goto err;
>  
>  	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>  	/* rx sampling rate is 10Mhz */
> @@ -359,6 +367,7 @@ static int st_rc_suspend(struct device *dev)
>  
>  static int st_rc_resume(struct device *dev)
>  {
> +	int ret;
>  	struct st_rc_device *rc_dev = dev_get_drvdata(dev);
>  	struct rc_dev	*rdev = rc_dev->rdev;
>  
> @@ -367,7 +376,10 @@ static int st_rc_resume(struct device *dev)
>  		rc_dev->irq_wake = 0;
>  	} else {
>  		pinctrl_pm_select_default_state(dev);
> -		st_rc_hardware_init(rc_dev);
> +		ret = st_rc_hardware_init(rc_dev);
> +		if (ret)
> +			return ret;
> +
>  		if (rdev->users) {
>  			writel(IRB_RX_INTS, rc_dev->rx_base + IRB_RX_INT_EN);
>  			writel(0x01, rc_dev->rx_base + IRB_RX_EN);
> -- 
> 2.26.2
