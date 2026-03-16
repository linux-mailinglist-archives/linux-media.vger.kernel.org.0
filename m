Return-Path: <linux-media+bounces-55940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II9zLdUguGmdZQEAu9opvQ
	(envelope-from <linux-media+bounces-55940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:25:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661429C41B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B3A53028B0E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EC439FCC7;
	Mon, 16 Mar 2026 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vq42ySJC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729638D00A;
	Mon, 16 Mar 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674674; cv=none; b=GDw1oyWrS94VkIxE9LzxJKjVbKTlJAzCLC5J4VXANzAYghejCB8fDLMRT2cOMsr8NlXRkwhtI6kx8x77euRcax5uaxawrBVc66AnNZa2JWr3fa3JkhWjZJGarYXB7okbVoCQBLjm3UGOCJTKEKi+tYGs7U32UaRKN80Dnex1kRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674674; c=relaxed/simple;
	bh=nzuiFZGtQM3/38oQTvbUrQG4QsvPP9R/oG8rAcvQZSE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=si4F5K8aKdNKN8sLss1WT5lnJGav5xMlijevzrbpvgDwWdWyv6Ex2V335Loa6ORf945ESc6AfFaZv9H8jzy0cRH9tPF2GJeTRxxq+Y5cPwLG6+CGRwU9DBVzfidmqgA/Lmu8WBptneGNyCBSJxnIoD61YGs/37ahkiN3bd7rxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vq42ySJC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19863C2BC9E;
	Mon, 16 Mar 2026 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773674674;
	bh=nzuiFZGtQM3/38oQTvbUrQG4QsvPP9R/oG8rAcvQZSE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Vq42ySJCGslVErOp0uzkuneETFDLRPtq7JxqrKd0hG6TWpJpKWGfwfobmJyCGkBDE
	 fCaPLniZaUW8h8yihV+srI1ElXC6qQhK1X1j2ASf+SaDK73vtJ92/caf0qrFc6/xWu
	 J0N03DI8j3aOh2ewLbmfaNaFwwShlgfinkB0g4hj16xMeFkzMcFmMLW2Fe6j/RlKdA
	 wcfnNpOojl6RSzfaOFldQR1BIi7sgxir0Gx5ocsPte1A5BbwnYTjoD1e+DhPrN6Gyk
	 dmySTtVERZ6BexvL9KOdYBbIfj1TfADCEer31FfT1lYBpvyO2F+To1Fk4XabAmKBZW
	 QXk0klVm/8ZNQ==
Message-ID: <7147803a-0b35-459e-bb18-b7c9cbaa3afb@kernel.org>
Date: Mon, 16 Mar 2026 16:24:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
To: Tomasz Unger <tomasz.unger@yahoo.pl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9.ref@yahoo.pl>
 <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>
Content-Language: en-US, nl
In-Reply-To: <20260314-sp8870-cleanup-v3-1-3ec367f13aa9@yahoo.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[yahoo.pl,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55940-lists,linux-media=lfdr.de,cisco];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5661429C41B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tomasz,

Since C99 comments are allowed these days I'm not going to apply this patch.
It's not worth the effort.

Sorry,

	Hans

On 14/03/2026 08:47, Tomasz Unger wrote:
> Replace C++ style comments (//) with C style comments (/* */) in
> sp8870.c to conform to the kernel coding style.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v3:
> - Convert two consecutive single-line comments to a multi-line comment as suggested by Ethan Tidmore
> - Link to v2: https://lore.kernel.org/r/20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl
> 
> Changes in v2:
> - Add changelog text to commit message as requested by Greg Kroah-Hartman
> - Link to v1: https://lore.kernel.org/r/20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl
> ---
>  drivers/staging/media/av7110/sp8870.c | 54 ++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
> index 29fb4934c039..73500f8702d3 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -109,21 +109,21 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
>  	if (fw->size < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET)
>  		return -EINVAL;
>  
> -	// system controller stop
> +	/* system controller stop */
>  	sp8870_writereg(state, 0x0F00, 0x0000);
>  
> -	// instruction RAM register hiword
> +	/* instruction RAM register hiword */
>  	sp8870_writereg(state, 0x8F08, ((SP8870_FIRMWARE_SIZE / 2) & 0xFFFF));
>  
> -	// instruction RAM MWR
> +	/* instruction RAM MWR */
>  	sp8870_writereg(state, 0x8F0A, ((SP8870_FIRMWARE_SIZE / 2) >> 16));
>  
> -	// do firmware upload
> +	/* do firmware upload */
>  	fw_pos = SP8870_FIRMWARE_OFFSET;
>  	while (fw_pos < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET) {
>  		tx_len = (fw_pos <= SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - 252) ? 252 :
>  			 SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - fw_pos;
> -		// write register 0xCF0A
> +		/* write register 0xCF0A */
>  		tx_buf[0] = 0xCF;
>  		tx_buf[1] = 0x0A;
>  		memcpy(&tx_buf[2], fw_buf + fw_pos, tx_len);
> @@ -149,7 +149,7 @@ static void sp8870_microcontroller_stop(struct sp8870_state *state)
>  	sp8870_writereg(state, 0x0F08, 0x000);
>  	sp8870_writereg(state, 0x0F09, 0x000);
>  
> -	// microcontroller STOP
> +	/* microcontroller STOP */
>  	sp8870_writereg(state, 0x0F00, 0x000);
>  }
>  
> @@ -158,10 +158,12 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
>  	sp8870_writereg(state, 0x0F08, 0x000);
>  	sp8870_writereg(state, 0x0F09, 0x000);
>  
> -	// microcontroller START
> +	/* microcontroller START */
>  	sp8870_writereg(state, 0x0F00, 0x001);
> -	// not documented but if we don't read 0x0D01 out here
> -	// we don't get a correct data valid signal
> +	/*
> +	 * not documented but if we don't read 0x0D01 out here
> +	 * we don't get a correct data valid signal
> +	 */
>  	sp8870_readreg(state, 0x0D01);
>  }
>  
> @@ -243,7 +245,7 @@ static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
>  
>  static int sp8870_wake_up(struct sp8870_state *state)
>  {
> -	// enable TS output and interface pins
> +	/* enable TS output and interface pins */
>  	return sp8870_writereg(state, 0xC18, 0x00D);
>  }
>  
> @@ -258,29 +260,29 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
>  	if (err)
>  		return err;
>  
> -	// system controller stop
> +	/* system controller stop */
>  	sp8870_microcontroller_stop(state);
>  
> -	// set tuner parameters
> +	/* set tuner parameters */
>  	if (fe->ops.tuner_ops.set_params) {
>  		fe->ops.tuner_ops.set_params(fe);
>  		if (fe->ops.i2c_gate_ctrl)
>  			fe->ops.i2c_gate_ctrl(fe, 0);
>  	}
>  
> -	// sample rate correction bit [23..17]
> +	/* sample rate correction bit [23..17] */
>  	sp8870_writereg(state, 0x0319, 0x000A);
>  
> -	// sample rate correction bit [16..0]
> +	/* sample rate correction bit [16..0] */
>  	sp8870_writereg(state, 0x031A, 0x0AAB);
>  
> -	// integer carrier offset
> +	/* integer carrier offset */
>  	sp8870_writereg(state, 0x0309, 0x0400);
>  
> -	// fractional carrier offset
> +	/* fractional carrier offset */
>  	sp8870_writereg(state, 0x030A, 0x0000);
>  
> -	// filter for 6/7/8 Mhz channel
> +	/* filter for 6/7/8 Mhz channel */
>  	if (p->bandwidth_hz == 6000000)
>  		sp8870_writereg(state, 0x0311, 0x0002);
>  	else if (p->bandwidth_hz == 7000000)
> @@ -288,7 +290,7 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
>  	else
>  		sp8870_writereg(state, 0x0311, 0x0000);
>  
> -	// scan order: 2k first = 0x0000, 8k first = 0x0001
> +	/* scan order: 2k first = 0x0000, 8k first = 0x0001 */
>  	if (p->transmission_mode == TRANSMISSION_MODE_2K)
>  		sp8870_writereg(state, 0x0338, 0x0000);
>  	else
> @@ -296,12 +298,12 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
>  
>  	sp8870_writereg(state, 0xc05, reg0xc05);
>  
> -	// read status reg in order to clear pending irqs
> +	/* read status reg in order to clear pending irqs */
>  	err = sp8870_readreg(state, 0x200);
>  	if (err < 0)
>  		return err;
>  
> -	// system controller start
> +	/* system controller start */
>  	sp8870_microcontroller_start(state);
>  
>  	return 0;
> @@ -337,16 +339,16 @@ static int sp8870_init(struct dvb_frontend *fe)
>  	/* enable TS output and interface pins */
>  	sp8870_writereg(state, 0xc18, 0x00d);
>  
> -	// system controller stop
> +	/* system controller stop */
>  	sp8870_microcontroller_stop(state);
>  
> -	// ADC mode
> +	/* ADC mode */
>  	sp8870_writereg(state, 0x0301, 0x0003);
>  
> -	// Reed Solomon parity bytes passed to output
> +	/* Reed Solomon parity bytes passed to output */
>  	sp8870_writereg(state, 0x0C13, 0x0001);
>  
> -	// MPEG clock is suppressed if no valid data
> +	/* MPEG clock is suppressed if no valid data */
>  	sp8870_writereg(state, 0x0C14, 0x0001);
>  
>  	/* bit 0x010: enable data valid signal */
> @@ -490,7 +492,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
>  			return err;
>  
>  		for (check_count = 0; check_count < MAXCHECKS; check_count++) {
> -//			valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0);
> +			/* valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0); */
>  			valid = sp8870_read_data_valid_signal(state);
>  			if (valid) {
>  				dprintk("delay = %i usec\n", check_count * 10);
> @@ -526,7 +528,7 @@ static int sp8870_sleep(struct dvb_frontend *fe)
>  {
>  	struct sp8870_state *state = fe->demodulator_priv;
>  
> -	// tristate TS output and disable interface pins
> +	/* tristate TS output and disable interface pins */
>  	return sp8870_writereg(state, 0xC18, 0x000);
>  }
>  
> 
> ---
> base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
> change-id: 20260313-sp8870-cleanup-c6552094e4c9
> 
> Best regards,


