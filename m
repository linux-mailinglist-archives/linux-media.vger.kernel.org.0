Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BB2382A9F
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 13:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbhEQLLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 07:11:32 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:52196 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236651AbhEQLLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 07:11:32 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HB1c3k009108;
        Mon, 17 May 2021 13:10:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EKOIUbX1y29itg1jYefnksaqL8GhgGWV9RXQZFgcTyw=;
 b=aqmjFNnQkqYk8L5tXuoBPZKT0/o/bl531K3Ix2Nvc4AXYMdOAbXTolVPjMTcgNpzWXir
 PqzzclKI7E7GOhP0l/R6PQkrOenGbEQtUaOYkqTk/UcYI//A0tGnpAOuN3u5ZH2nKPpf
 RQz5QopXSIDuga9XNpESy/7ttcye+Q1PriagyeV8hb1xDsEcjcgYsyG9ECto37p40EA1
 0WRlrqYiwxdnkVDBGKa4vgRtxKg4Fhs5+dQEkpsmrh0ra3+KURbezMI0iUMVWECgdC4T
 EWHncUho/5mEbWxT6YNYos/FjtQayiFLSg7HLnLz6CxHx8dXbNm5ENtWa92ZNNzXghxs Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38k5dq4d9k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 May 2021 13:10:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F62A100038;
        Mon, 17 May 2021 13:09:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7920722871C;
        Mon, 17 May 2021 13:09:59 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 13:09:58 +0200
Subject: Re: [PATCH] media: st_rc: Handle errors of clk_prepare_enable()
To:     Evgeny Novikov <novikov@ispras.ru>
CC:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ldv-project@linuxtesting.org>
References: <20210515123909.5638-1-novikov@ispras.ru>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <7dfaeeae-04e5-68d1-0949-991b0a7d6640@foss.st.com>
Date:   Mon, 17 May 2021 13:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210515123909.5638-1-novikov@ispras.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-17_04:2021-05-17,2021-05-17 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Avgeny

On 5/15/21 2:39 PM, Evgeny Novikov wrote:
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
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
