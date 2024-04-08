Return-Path: <linux-media+bounces-8850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125B89C777
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 16:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBF61C21735
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 14:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DFA13F42B;
	Mon,  8 Apr 2024 14:47:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E150913F428
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712587676; cv=none; b=Qk1XJ8mCI0SN4qbvX9/V+ddpsiy6wmi2+0NDzSQ5jp6kd9HuGSW8XlJHm2FxcD8XDVcA9L6K17SDAI06eOVn68oKS10SKInla2enwCWwg6vvB61XyWC55yyvIbUCijaNd1kWADypFfLmv+FLmiEEPecg8cLTAlRptPwnUTCVEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712587676; c=relaxed/simple;
	bh=LiLALYE37ilkesnHeuXLREglcDMwOIJZ2TAjYMYPNeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhSG7zEWtfI2hZ409AsgZwc/JMWQUuEJ6Kc6KlM70Ond1axVdPMMI/ztnDR2ZSKRnZjjvfYr69cWf4D7Myf9N+Nm6i2yyF4EulzzAyWuF3pW2H7vKnAMRVSMlamUWj5v83nsWfkeraGdZ3BgMJMNIADOdAk58shF5O2a4up6fQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B954C433C7;
	Mon,  8 Apr 2024 14:47:55 +0000 (UTC)
Message-ID: <2da4bcf4-e4ce-4870-9d6d-84b9e8bf850a@xs4all.nl>
Date: Mon, 8 Apr 2024 16:47:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] media: ttpci: checkpatch fixes: braces
Content-Language: en-US, nl
To: Stefan Herdler <herdler@nurfuerspam.de>
Cc: linux-media@vger.kernel.org, smoch@web.de, tmn505@gmail.com,
 vinschen@redhat.com
References: <20240328020522.50995-1-herdler@nurfuerspam.de>
 <20240328020522.50995-5-herdler@nurfuerspam.de>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240328020522.50995-5-herdler@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 03:05, Stefan Herdler wrote:
> This patch fixes the following checkpatch warnings and errors:
> 
> WARNING:BRACES: braces {} are not necessary for any arm of this statement
> WARNING:BRACES: braces {} are not necessary for single statement blocks
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> 
> 
> Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
> ---
> 
>  drivers/media/pci/ttpci/budget-av.c | 31 ++++++++++-------------------
>  drivers/media/pci/ttpci/budget-ci.c | 17 ++++++----------
>  drivers/media/pci/ttpci/budget.c    |  9 +++------
>  3 files changed, 20 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
> index dbd4ef40e..2faea2861 100644
> --- a/drivers/media/pci/ttpci/budget-av.c
> +++ b/drivers/media/pci/ttpci/budget-av.c
> @@ -309,16 +309,14 @@ static int ciintf_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int open
>  	/* read from attribute memory in reset/ready state to know when the CAM is ready */
>  	if (budget_av->slot_status == SLOTSTATUS_RESET) {
>  		result = ciintf_read_attribute_mem(ca, slot, 0);
> -		if (result == 0x1d) {
> +		if (result == 0x1d)
>  			budget_av->slot_status = SLOTSTATUS_READY;
> -		}
>  	}
> 
>  	/* work out correct return code */
>  	if (budget_av->slot_status != SLOTSTATUS_NONE) {
> -		if (budget_av->slot_status & SLOTSTATUS_READY) {
> +		if (budget_av->slot_status & SLOTSTATUS_READY)
>  			return DVB_CA_EN50221_POLL_CAM_PRESENT | DVB_CA_EN50221_POLL_CAM_READY;
> -		}
>  		return DVB_CA_EN50221_POLL_CAM_PRESENT;
>  	}
>  	return 0;
> @@ -1237,15 +1235,13 @@ static void frontend_init(struct budget_av *budget_av)
>  		if (saa->pci->subsystem_vendor == 0x1894) {
>  			fe = dvb_attach(stv0299_attach, &cinergy_1200s_1894_0010_config,
>  					     &budget_av->budget.i2c_adap);
> -			if (fe) {
> +			if (fe)
>  				dvb_attach(tua6100_attach, fe, 0x60, &budget_av->budget.i2c_adap);
> -			}
>  		} else {
>  			fe = dvb_attach(stv0299_attach, &typhoon_config,
>  					     &budget_av->budget.i2c_adap);
> -			if (fe) {
> +			if (fe)
>  				fe->ops.tuner_ops.set_params = philips_su1278_ty_ci_tuner_set_params;
> -			}
>  		}
>  		break;
> 
> @@ -1257,19 +1253,17 @@ static void frontend_init(struct budget_av *budget_av)
>  	case SUBID_DVBS_EASYWATCH_2:
>  		fe = dvb_attach(stv0299_attach, &philips_sd1878_config,
>  				&budget_av->budget.i2c_adap);
> -		if (fe) {
> +		if (fe)
>  			dvb_attach(dvb_pll_attach, fe, 0x60,
>  				   &budget_av->budget.i2c_adap,
>  				   DVB_PLL_PHILIPS_SD1878_TDA8261);
> -		}
>  		break;
> 
>  	case SUBID_DVBS_TYPHOON:
>  		fe = dvb_attach(stv0299_attach, &typhoon_config,
>  				    &budget_av->budget.i2c_adap);
> -		if (fe) {
> +		if (fe)
>  			fe->ops.tuner_ops.set_params = philips_su1278_ty_ci_tuner_set_params;
> -		}
>  		break;
>  	case SUBID_DVBS2_KNC1:
>  	case SUBID_DVBS2_KNC1_OEM:
> @@ -1282,9 +1276,8 @@ static void frontend_init(struct budget_av *budget_av)
>  	case SUBID_DVBS_CINERGY1200:
>  		fe = dvb_attach(stv0299_attach, &cinergy_1200s_config,
>  				    &budget_av->budget.i2c_adap);
> -		if (fe) {
> +		if (fe)
>  			fe->ops.tuner_ops.set_params = philips_su1278_ty_ci_tuner_set_params;
> -		}
>  		break;
> 
>  	case SUBID_DVBC_KNC1:
> @@ -1300,9 +1293,8 @@ static void frontend_init(struct budget_av *budget_av)
>  			fe = dvb_attach(tda10021_attach, &philips_cu1216_config_altaddress,
>  					     &budget_av->budget.i2c_adap,
>  					     read_pwm(budget_av));
> -		if (fe) {
> +		if (fe)
>  			fe->ops.tuner_ops.set_params = philips_cu1216_tuner_set_params;
> -		}
>  		break;
> 
>  	case SUBID_DVBC_EASYWATCH_MK3:
> @@ -1316,9 +1308,8 @@ static void frontend_init(struct budget_av *budget_av)
>  			&philips_cu1216_tda10023_config,
>  			&budget_av->budget.i2c_adap,
>  			read_pwm(budget_av));
> -		if (fe) {
> +		if (fe)
>  			fe->ops.tuner_ops.set_params = philips_cu1216_tuner_set_params;
> -		}
>  		break;
> 
>  	case SUBID_DVBT_EASYWATCH:
> diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
> index ebf340417..047b1f07e 100644
> --- a/drivers/media/pci/ttpci/budget-ci.c
> +++ b/drivers/media/pci/ttpci/budget-ci.c
> @@ -412,24 +412,20 @@ static int ciintf_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int open
>  	flags = ttpci_budget_debiread(&budget_ci->budget, DEBICICTL, DEBIADDR_CICONTROL, 1, 1, 0);
>  	if (flags & CICONTROL_CAMDETECT) {
>  		// mark it as present if it wasn't before
> -		if (budget_ci->slot_status & SLOTSTATUS_NONE) {
> +		if (budget_ci->slot_status & SLOTSTATUS_NONE)
>  			budget_ci->slot_status = SLOTSTATUS_PRESENT;
> -		}
> 
>  		// during a RESET, we check if we can read from IO memory to see when CAM is ready
>  		if (budget_ci->slot_status & SLOTSTATUS_RESET) {
> -			if (ciintf_read_attribute_mem(ca, slot, 0) == 0x1d) {
> +			if (ciintf_read_attribute_mem(ca, slot, 0) == 0x1d)
>  				budget_ci->slot_status = SLOTSTATUS_READY;
> -			}
>  		}
> -	} else {
> +	} else
>  		budget_ci->slot_status = SLOTSTATUS_NONE;
> -	}
> 
>  	if (budget_ci->slot_status != SLOTSTATUS_NONE) {
> -		if (budget_ci->slot_status & SLOTSTATUS_READY) {
> +		if (budget_ci->slot_status & SLOTSTATUS_READY)
>  			return DVB_CA_EN50221_POLL_CAM_PRESENT | DVB_CA_EN50221_POLL_CAM_READY;
> -		}
>  		return DVB_CA_EN50221_POLL_CAM_PRESENT;
>  	}
> 
> @@ -494,11 +490,10 @@ static int ciintf_init(struct budget_ci *budget_ci)
>  	// Setup CI slot IRQ
>  	if (budget_ci->ci_irq) {
>  		tasklet_setup(&budget_ci->ciintf_irq_tasklet, ciintf_interrupt);
> -		if (budget_ci->slot_status != SLOTSTATUS_NONE) {
> +		if (budget_ci->slot_status != SLOTSTATUS_NONE)
>  			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQLO);
> -		} else {
> +		else
>  			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQHI);
> -		}
>  		SAA7146_IER_ENABLE(saa, MASK_03);
>  	}
> 
> diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/budget.c
> index 9fe087add..79b34c909 100644
> --- a/drivers/media/pci/ttpci/budget.c
> +++ b/drivers/media/pci/ttpci/budget.c
> @@ -229,8 +229,7 @@ static int alps_bsrv2_tuner_set_params(struct dvb_frontend *fe)
>  	return 0;
>  }
> 
> -static struct ves1x93_config alps_bsrv2_config =
> -{
> +static struct ves1x93_config alps_bsrv2_config = {
>  	.demod_address = 0x08,
>  	.xin = 90100000UL,
>  	.invert_pwm = 0,
> @@ -678,8 +677,7 @@ static void frontend_init(struct budget *budget)
>  					tt1600_stv090x_config.tuner_set_refclk	  = ctl->tuner_set_refclk;
>  					tt1600_stv090x_config.tuner_get_status	  = ctl->tuner_get_status;
> 
> -					/*
> -					 * call the init function once to initialize
> +					/* call the init function once to initialize
>  					 * tuner's clock output divider and demod's
>  					 * master clock
>  					 */

This change is unrelated to braces, and also the original looks fine to me.

Is this a mistake?

Regards,

	Hans

> @@ -786,9 +784,8 @@ static int budget_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_d
>  	int err;
> 
>  	budget = kmalloc(sizeof(struct budget), GFP_KERNEL);
> -	if (NULL == budget) {
> +	if (NULL == budget)
>  		return -ENOMEM;
> -	}
> 
>  	dprintk(2, "dev:%p, info:%p, budget:%p\n", dev, info, budget);
> 
> --
> 2.34.0
> 
> 


