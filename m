Return-Path: <linux-media+bounces-55926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMVJHa0SuGk7YwEAu9opvQ
	(envelope-from <linux-media+bounces-55926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:24:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BB29B48D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC8F0300C831
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD58B279336;
	Mon, 16 Mar 2026 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZkFmnNt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302826E173
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671074; cv=none; b=M6ARRIwwjcvEsRmTsB14dRH8otSv+0oawYm67N0VAqRw6q6+iQVRbKZ5T/lvSHQNwDGTnVTLAGtegY1A6Hv7O2BzMkH5li+kemMyDTAy+N33Wc5otadFlPFtCliKGuupLl31OhIumjMP83G1P1VLONNNLSFkCC8fUz/z0batIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671074; c=relaxed/simple;
	bh=0lvPuHqN3wottLMl0XhPd0LSDP46dxN97+ltaMsHLGM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hPYKTZF7R755r6UIuNkef3wot8vcF5oi95k7f0mpSzgKzQQL3glJ8ofswYdrBR14ZzCjaWjJ4CK2MaxoPVR2fpg57TDpWh6A2rOVm2FEez2Q0ZdiW2KevPn998a9hRWHUJt6GCoeoyvTsQvX4tfhfK7qDi7Ap/YrdZyXrVY4hgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZkFmnNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8735BC19421;
	Mon, 16 Mar 2026 14:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671073;
	bh=0lvPuHqN3wottLMl0XhPd0LSDP46dxN97+ltaMsHLGM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=bZkFmnNt6cHSouLfBFH4UbYqnnqRkeQbfgD6HDzmQTU8FY2C4b+BLtBT1TOCthhLX
	 uSdiR0a7+JfuJ/Xf03A5TcpMxjEtfhu6b7F73KerWtT3Xf/AZHHp7w4Mr2CAXrsaWa
	 RaX5YaNifOllmSVbs9PW6Znftr/yhoZ8WGpl8YeA+x/wkIFc1db+5tOFc0WZr4J2YU
	 un1al5ALe4WJdgER3PVM3JFR7I+zVVYlcRZyTn02YHO8x7RDCjRkDJ7cOMjDN8ou8U
	 H6Dn1ocoAOlw+r2KS985LdeHJfAEAg1Q4d/WHBjlLfveZcULzu7eoRwTdwgLIYTUai
	 3S3jLksJFPF3Q==
Message-ID: <0c1ee67c-953b-48a9-a8c0-3242bf7b14c7@kernel.org>
Date: Mon, 16 Mar 2026 15:24:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: hdmirx: snps, rk: Fix EDID injection with proper
 HPD toggle on RK3588
To: Ross Cawston <ross@r-sc.ca>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
 ezequiel@collabora.com, benjamin.gaignard@collabora.com
References: <20260209061654.54757-1-ross@r-sc.ca>
Content-Language: en-US, nl
In-Reply-To: <20260209061654.54757-1-ross@r-sc.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55926-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,r-sc.ca:email]
X-Rspamd-Queue-Id: CA7BB29B48D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/02/2026 07:16, Ross Cawston wrote:
> The existing VIDIOC_S_EDID implementation writes EDID data but does not
> properly trigger source renegotiation on RK3588 boards. This results in
> no visible change to the source device despite the ioctl succeeding.
> 
> Even re-plugging the HDMI cable does not trigger renegotiation on previous
> versions of the driver. This version reliably triggers renegotiation on
> EDID injection on tested hardware.
> 
> Fix by mirroring the vendor BSP behavior:
> - Disable HDMI and DMA IRQs to avoid races.
> - Simulate plugout if 5V power is present.
> - Toggle HPD low before write.
> - Schedule a delayed hotplug workqueue (1000ms) to re-enable HPD and
>   force renegotiation.
> 
> Bump WAIT_SIGNAL_LOCK_TIME from 300ms to 600ms to ensure lock.
> 
> This ensures custom EDIDs take effect reliably, allowing userspace to
> force specific resolutions/timings.
> 
> Tested on Orange Pi 5 Ultra and Radxa Rock 5B — sources now correctly
> re-detect and lock to the new EDID modes.
> 
> Signed-off-by: Ross Cawston <ross@r-sc.ca>
> 
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 43 +++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index abc123..def456 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -88,6 +88,10 @@
>  	HDMIRX_NUM_RST,
>  };
>  
> +#define WAIT_SIGNAL_LOCK_TIME		600
> +#define NO_LOCK_CFG_RETRY_TIME		300
> +#define WAIT_LOCK_STABLE_TIME		20
> +
>  static const char *const pix_fmt_str[] = {
>  	"RGB888",
>  	"YUV422",
> @@ -620,6 +624,7 @@
>  
>  	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED, 0);
>  	hdmirx_interrupts_setup(hdmirx_dev, false);
> +	hdmirx_hpd_ctrl(hdmirx_dev, false);
>  	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
>  	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
>  			   LINE_FLAG_INT_EN |
> @@ -680,16 +685,32 @@
>  	 */
>  	mutex_lock(&hdmirx_dev->work_lock);
>  
> +	/*
> +	 * Some sources won't re-read EDID unless we avoid IRQ races and
> +	 * force a full plugout/HPD low sequence. On several tested devices,
> +	 * leaving IRQs enabled or skipping plugout kept the old EDID cached.
> +	 */

This is weird. There seem to be two (or more) different issues here: IRQ races
and HPD low->high toggle.

When updating the EDID the HPD must go low before updating the EDID, and
go high at least 100 ms after it went low. Experience shows that 'HZ / 7'
is a good value for HDMI receivers. 1000 ms as you are using below is overkill.

So the HPD toggle is required, otherwise video sources won't re-read the EDID.

The IRQ races must be something else, I'm not sure what.

I would recommend splitting this up: first add the HPD toggle since without it
video sources will not detect the EDID update at all.

Then follow up with other patches fixing whatever else is needed to make it
work reliable. Video sources will know nothing about enabling/disabling the
IRQ, so if that matters, then it is more likely that somehow keeping the IRQs
interferes with updating the EDID.

I think you need to better understand what is going on here :-)

Regards,

	Hans

> +	disable_irq(hdmirx_dev->hdmi_irq);
> +	disable_irq(hdmirx_dev->dma_irq);
> +
> +	if (tx_5v_power_present(hdmirx_dev))
> +		hdmirx_plugout(hdmirx_dev);
> +
>  	hdmirx_hpd_ctrl(hdmirx_dev, false);
>  
>  	if (edid->blocks) {
>  		hdmirx_write_edid(hdmirx_dev, edid);
> -		hdmirx_hpd_ctrl(hdmirx_dev, true);
>  	} else {
>  		cec_phys_addr_invalidate(hdmirx_dev->cec->adap);
>  		hdmirx_dev->edid_blocks_written = 0;
>  	}
>  
> +	enable_irq(hdmirx_dev->dma_irq);
> +	enable_irq(hdmirx_dev->hdmi_irq);
> +
> +	queue_delayed_work(system_unbound_wq, &hdmirx_dev->delayed_work_hotplug,
> +			   msecs_to_jiffies(1000));
> +
>  	mutex_unlock(&hdmirx_dev->work_lock);
>  
>  	return 0;
> @@ -2082,9 +2103,9 @@
>  {
>  	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
>  	u32 mu_status, scdc_status, dma_st10, cmu_st;
> -	u32 i;
> +	u32 i, j = 0;
>  
> -	for (i = 0; i < 300; i++) {
> +	for (i = 1; i < WAIT_SIGNAL_LOCK_TIME; i++) {
>  		mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
>  		scdc_status = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS3);
>  		dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
> @@ -2093,8 +2114,16 @@
>  		if ((mu_status & TMDSVALID_STABLE_ST) &&
>  		    (dma_st10 & HDMIRX_LOCK) &&
>  		    (cmu_st & TMDSQPCLK_LOCKED_ST))
> +			j++;
> +		else
> +			j = 0;
> +
> +		if (j > WAIT_LOCK_STABLE_TIME)
>  			break;
>  
> +		if (i % NO_LOCK_CFG_RETRY_TIME == 0)
> +			hdmirx_phy_config(hdmirx_dev);
> +
>  		if (!tx_5v_power_present(hdmirx_dev)) {
>  			v4l2_dbg(1, debug, v4l2_dev,
>  				 "%s: HDMI pull out, return\n", __func__);
> @@ -2104,7 +2133,7 @@
>  		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
>  	}
>  
> -	if (i == 300) {
> +	if (i == WAIT_SIGNAL_LOCK_TIME) {
>  		v4l2_err(v4l2_dev, "%s: signal not lock, tmds_clk_ratio:%d\n",
>  			 __func__, hdmirx_dev->tmds_clk_ratio);
>  		v4l2_err(v4l2_dev, "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x\n",
> @@ -2127,7 +2156,8 @@
>  				   PKTDEC_AVIIF_RCV_IRQ, 0);
>  	}
>  
> -	msleep(50);
> +	hdmirx_reset_dma(hdmirx_dev);
> +	msleep(500);
>  	hdmirx_format_change(hdmirx_dev);
>  
>  	return 0;
> @@ -2141,6 +2171,7 @@
>  	hdmirx_submodule_init(hdmirx_dev);
>  	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
>  			   POWERPROVIDED);
> +	hdmirx_hpd_ctrl(hdmirx_dev, true);
>  	hdmirx_phy_config(hdmirx_dev);
>  	hdmirx_interrupts_setup(hdmirx_dev, true);
>  
> 


