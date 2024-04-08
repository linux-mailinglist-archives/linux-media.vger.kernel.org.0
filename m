Return-Path: <linux-media+bounces-8851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3E89C786
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 16:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5387F1F233CC
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 14:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3340413F014;
	Mon,  8 Apr 2024 14:53:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173613F003
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712588006; cv=none; b=RB0jVWaszv2IfMq2VXz9pVM8P0upRJu4zsyRUseqxSJ2ygO09NTk5u9rEZ7EUV846cnC52enDJjtWW5WyhszQjhgqsZc/5JFHtRwBA1AF6JKnsmQ1+h/5jBGOtPKXGvGO93cwXO/yk9+x3Pq8fHd+iDXXCH6jkU6ZyAoiRi45Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712588006; c=relaxed/simple;
	bh=ph/9LfXM4qDfAvjiB9IdEo9km8ilbKCsyImh8QtdBjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMQFz+aegdE3x1RTSYJt5PrwFTnME7a1I4k77ANJfuk4qjQGH5LNWEcXuHmFHcKSZFZc0SjPcmDT1EOESaKn93Pfe3OpsbE/NO6Qd5BEqQCiwE8sKUjKSZlgAgyUuN+ANcj2QnessU20YamzFTWfSI5VjdZZEb/LdqeA2dFCGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9F7C433F1;
	Mon,  8 Apr 2024 14:53:25 +0000 (UTC)
Message-ID: <a34d5d29-bbfc-48b3-b391-9b7a7a0734e6@xs4all.nl>
Date: Mon, 8 Apr 2024 16:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] media: ttpci: checkpatch fixes: msleep
Content-Language: en-US, nl
To: Stefan Herdler <herdler@nurfuerspam.de>
Cc: linux-media@vger.kernel.org, smoch@web.de, tmn505@gmail.com,
 vinschen@redhat.com
References: <20240328020522.50995-1-herdler@nurfuerspam.de>
 <20240328020522.50995-12-herdler@nurfuerspam.de>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240328020522.50995-12-herdler@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 03:05, Stefan Herdler wrote:
> This patch fixes the following checkpatch warnings:
> 
> WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> 
> 
> The driver is working with this behaviour since years. Just replacing
> all msleep < 20ms with msleep 20ms to silence the warning.
> Add a comment to indicate the time choice was not hardware related.

I would drop this patch. It is just a warning indicating that msleep with a
value < 20 can sleep up to 20 ms. In other words, that the code should be
checked that the msleep is actually appropriate.

An alternative to msleep is usleep_range: there you can be more precise.

In this case I would just leave it as-is.

Regards,

	Hans

> 
> There are only a few of these msleep in a row, the extra sleep time
> won't add up to much.
> 
> 
> Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
> ---
> 
> Warning:
> I'm not able to test this changes properly. None of my cards are affected
> directly and I don't have a operational CAM.
> 
> I think, we have 3 options to deal with this warnings:
> * Ignore them.
>   This is save, but will keep the warnings.
> * Use usleep_range.
>   Probably dangerous, it may break the driver.
> * Rise all shorter msleep to 20ms.
>   This should be pretty save.
>   Many of this msleep are in a row with much longer msleeps anyway and
>   there are only less of 2 of these in a function.
>   Most of the affected functions are init functions only.
>   The most time critical msleeps I have spotted are tuning related. So
>   tuning a new transponder may take up to 20ms longer on some frontends,
>   in the worst case.
> Nevertheless, please consider this patch as a proposal and optional.
> 
>  drivers/media/pci/ttpci/budget-av.c |  8 ++++----
>  drivers/media/pci/ttpci/budget-ci.c | 10 +++++-----
>  drivers/media/pci/ttpci/budget.c    |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
> index fd5a88e64..680e46cf1 100644
> --- a/drivers/media/pci/ttpci/budget-av.c
> +++ b/drivers/media/pci/ttpci/budget-av.c
> @@ -211,7 +211,7 @@ static int ciintf_slot_reset(struct dvb_ca_en50221 *ca, int slot)
>  	saa7146_setgpio(saa, 2, SAA7146_GPIO_OUTHI); /* disable card */
> 
>  	saa7146_setgpio(saa, 0, SAA7146_GPIO_OUTHI); /* Vcc off */
> -	msleep(2);
> +	msleep(20); // Was 2, but msleep would have slept up to 20ms nevertheless.
>  	saa7146_setgpio(saa, 0, SAA7146_GPIO_OUTLO); /* Vcc on */
>  	msleep(20); /* 20 ms Vcc settling time */
> 
> @@ -637,7 +637,7 @@ static int philips_cu1216_tuner_set_params(struct dvb_frontend *fe)
>  			fe->ops.i2c_gate_ctrl(fe, 1);
>  		if (i2c_transfer(&budget->i2c_adap, &msg, 1) == 1 && (buf[0] & 0x40))
>  			break;
> -		msleep(10);
> +		msleep(20); // Was 10, but msleep would have slept up to 20ms nevertheless.
>  	}
> 
>  	/* switch the charge pump to the lower current */
> @@ -679,7 +679,7 @@ static int philips_tu1216_tuner_init(struct dvb_frontend *fe)
>  		fe->ops.i2c_gate_ctrl(fe, 1);
>  	if (i2c_transfer(&budget->i2c_adap, &tuner_msg, 1) != 1)
>  		return -EIO;
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
> 
>  	return 0;
>  }
> @@ -764,7 +764,7 @@ static int philips_tu1216_tuner_set_params(struct dvb_frontend *fe)
>  	if (i2c_transfer(&budget->i2c_adap, &tuner_msg, 1) != 1)
>  		return -EIO;
> 
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
>  	return 0;
>  }
> 
> diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
> index d821710bb..066eba67f 100644
> --- a/drivers/media/pci/ttpci/budget-ci.c
> +++ b/drivers/media/pci/ttpci/budget-ci.c
> @@ -308,7 +308,7 @@ static int ciintf_slot_reset(struct dvb_ca_en50221 *ca, int slot)
>  	}
>  	budget_ci->slot_status = SLOTSTATUS_RESET;
>  	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL, 1, 0, 1, 0);
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
>  	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL, 1,
>  			       CICONTROL_RESET, 1, 0);
> 
> @@ -534,7 +534,7 @@ static void ciintf_deinit(struct budget_ci *budget_ci)
> 
>  	// reset interface
>  	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL, 1, 0, 1, 0);
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
>  	ttpci_budget_debiwrite(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL, 1,
>  			       CICONTROL_RESET, 1, 0);
> 
> @@ -706,7 +706,7 @@ static int philips_tdm1316l_tuner_init(struct dvb_frontend *fe)
>  		fe->ops.i2c_gate_ctrl(fe, 1);
>  	if (i2c_transfer(&budget_ci->budget.i2c_adap, &tuner_msg, 1) != 1)
>  		return -EIO;
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
> 
>  	// disable the mc44BC374c (do not check for errors)
>  	tuner_msg.addr = 0x65;
> @@ -805,7 +805,7 @@ static int philips_tdm1316l_tuner_set_params(struct dvb_frontend *fe)
>  	if (i2c_transfer(&budget_ci->budget.i2c_adap, &tuner_msg, 1) != 1)
>  		return -EIO;
> 
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
>  	return 0;
>  }
> 
> @@ -910,7 +910,7 @@ static int dvbc_philips_tdm1316l_tuner_set_params(struct dvb_frontend *fe)
>  	if (i2c_transfer(&budget_ci->budget.i2c_adap, &tuner_msg, 1) != 1)
>  		return -EIO;
> 
> -	msleep(1);
> +	msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
> 
>  	return 0;
>  }
> diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/budget.c
> index 3842bad8d..10599037c 100644
> --- a/drivers/media/pci/ttpci/budget.c
> +++ b/drivers/media/pci/ttpci/budget.c
> @@ -630,9 +630,9 @@ static void frontend_init(struct budget *budget)
> 
>  		// gpio2 is connected to CLB - reset it + leave it high
>  		saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTLO);
> -		msleep(1);
> +		msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
>  		saa7146_setgpio(budget->dev, 2, SAA7146_GPIO_OUTHI);
> -		msleep(1);
> +		msleep(20); // Was 1, but msleep would have slept up to 20ms nevertheless.
> 
>  		fe = dvb_attach(tda10086_attach, &tda10086_config, &budget->i2c_adap);
>  		if (fe) {
> --
> 2.34.0
> 
> 


