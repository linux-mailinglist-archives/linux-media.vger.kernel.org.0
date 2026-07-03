Return-Path: <linux-media+bounces-66438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9N6MCPx8R2psZQAAu9opvQ
	(envelope-from <linux-media+bounces-66438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:12:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED647007EA
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:12:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=vlSBnBf9;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66438-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66438-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2B98300F459
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737AD39EF27;
	Fri,  3 Jul 2026 09:12:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80C62AEE4;
	Fri,  3 Jul 2026 09:12:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069943; cv=none; b=GbG38n6ABZEIKZEr7jBdNnK5Afzhkg4CIRkvl1ptBk3aZbpOhtD83CpgECiMzdW1ELKOx+ZuOQzV/S2e22r8TcRZ8FAwnrmYVHj2E6HQrd/GxkZn96CkVW18UdK0nitbyBVfBky2uFLA3IzWousqZ8u7MgUt0oZ7IGWzk80r9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069943; c=relaxed/simple;
	bh=ogKT6UzIakU/vA266BsUE23UYnuAgFvohMJvJXX05js=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a7qMKuMGRXo3w3na9duaXO2w4FBphPi5ztXvHt/ipTaKlgKcflR27r5zFghUCKRtCmo1yw5KdIYDC+cVxT2UDwrhMQuUx51GBfAb9J81LKQ3WWQ18Oj/Kvi9LsKkAmFGLp4a19jXh8yU7P5YWIJjz6YBneSQvfocNN8zrpm9HFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vlSBnBf9; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE8951EDB;
	Fri,  3 Jul 2026 02:12:15 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4425D3F673;
	Fri,  3 Jul 2026 02:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783069940; bh=ogKT6UzIakU/vA266BsUE23UYnuAgFvohMJvJXX05js=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=vlSBnBf9HKUKCMCUqzfXw/cFuco+HvQo9COX0TpxmMkwjIz3U8TLACxaHcQfZ1Rof
	 waZLpndWvklcLilx0+EHImIuymbpQwN+DTSNt3J6TvIwudki4bG9cmCMRXbUr5IvAJ
	 SRBWhNSoqdUULA29A3JQVxxaPmKqWAFhesB6CqrY=
Message-ID: <309f6601-2358-4a2d-9696-0849d69ade52@arm.com>
Date: Fri, 3 Jul 2026 11:11:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 2/4] media: rc: sunxi-cir: add support for the A523
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-3-utilityemal77@gmail.com>
Content-Language: en-GB
In-Reply-To: <20260702214750.3428694-3-utilityemal77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66438-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:utilityemal77@gmail.com,m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andre.przywara@arm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[mess.org,kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AED647007EA

On Thu,  2 Jul 2026 17:47:48 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hi Justin,

many thanks for sending this!

> The A523 (sun55i) has a newer revision of the CIR receiver IP. Two
> register fields that do not exist on older SoCs must be programmed
> for reception to work:
> 
>  - CTL bits [7:6] select which pulse polarities are captured into the
>    RX FIFO. The reset value of 0 captures nothing, so program "both
>    pulse" mode, which captures regardless of header polarity.

Are you sure about that? The manual says that *both* the 0b00 (reset
default) and 0b01 values capture both edges, and actually the H6, A133
and H616 have the same bits, and it apparently works there.

I don't see those bits documented in the A64 (and earlier), but haven't 
checked yet whether they exist there regardless or have an effect.
So I think we should force those bits either to 0 or to 1, depending on 
how those bits behave on A64 and before, and how compatible this is with 
H6, A133, H616. I will try to run some experiments on the weekend.

>  - SPLCFG (the sample configuration register) bits [1:0] select the
>    sample clock as a division of the module clock, replacing the
>    fixed module clock / 64 sample rate of the older IP.

That's not fully correct: even the A20(!) has these two bits, actually
there is a third bit, held in bit 24 (because reasons). All those bits
reset to 0, which is encoded as /64, so this is where the rate comes
from. And sunxi_ir_probe() sets the IR clock to 8MHz, which should end
up as 24MHz / 3, on all chips, including the A523.

So what is going on here? Is the manual wrong, about those bits, or the 
clock sources?
Can you point to the BSP sources, if you used those?

>    module clock / 256, which together with the 24 MHz module clock

Why is the A523 mod clock set to 24 MHz? You seem to do this in the DT, 
overriding the 8MHz default? The driver clearly has a clk_set_rate() 
call with that default 8MHz as an argument, and I don't think we should 
deviate from that, unless there are good reasons. The sample clock 
should be more of a driver/subsystem decision, not a a device one.

>    used on the A523 gives a 10.7 μs sample period, close to the 8 μs
>    of the previous 8 MHz / 64 configuration, and keeps the default
>    125 ms idle timeout representable in the 8-bit idle threshold

This is some good info that helps people understand the reasoning behind 
those timing values. Please put this in a comment near the top of the file.
But actually: how does this compute? With an 8us sample clock period, 
the 8-bit ATHR field only covers 2 ms. And I don't see us setting the 
ATHC bit to bump this by 128.

Cheers,
Andre

>    field.
> 
> Parameterize the sample divisor in the resolution/timeout
> calculations, which older SoCs keep at the fixed 64, and add the
> A523 quirks and compatible.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  drivers/media/rc/sunxi-cir.c | 76 ++++++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index cb4c56bf0752..82ada9dc0347 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -31,6 +31,11 @@
>  /* CIR mode */
>  #define REG_CTL_MD			(BIT(4) | BIT(5))
>  
> +/* Pulse mode selector (bits [7:6]) */
> +#define REG_CTL_PMD(m)			((m) << 6)
> +/* Capture both pulse polarities */
> +#define REG_CTL_PMD_BOTH		REG_CTL_PMD(1)
> +
>  /* Rx Config */
>  #define SUNXI_IR_RXCTL_REG    0x10
>  /* Pulse Polarity Invert flag */
> @@ -66,6 +71,13 @@
>  
>  /* IR Sample Config */
>  #define SUNXI_IR_CIR_REG      0x34
> +/*
> + * Sample clock divider select (bits [1:0]), present on newer IP revisions
> + * (e.g. sun55i). Selects the sample clock as a fraction of the module clock;
> + * must be programmed for the sampler to run. Older SoCs lack the field and
> + * use a fixed module-clock/64 sample rate, so they leave it 0.
> + */
> +#define REG_CIR_SDIV(val)    ((val) & GENMASK(1, 0))
>  /* CIR_REG register noise threshold */
>  #define REG_CIR_NTHR(val)    (((val) << 2) & (GENMASK(7, 2)))
>  /* CIR_REG register idle threshold */
> @@ -73,6 +85,8 @@
>  
>  /* Required frequency for IR0 or IR1 clock in CIR mode (default) */
>  #define SUNXI_IR_BASE_CLK     8000000
> +/* Default sample clock divisor: module clock / 64 (legacy fixed rate) */
> +#define SUNXI_IR_SAMPLE_DIV   64
>  /* Noise threshold in samples  */
>  #define SUNXI_IR_RXNOISE      1
>  
> @@ -81,10 +95,18 @@
>   *
>   * @has_reset: SoC needs reset deasserted.
>   * @fifo_size: size of the fifo.
> + * @both_pulse: program the CTRL pulse-mode field (newer IP revisions).

As mentioned above, those bits exist in earlier IP as well. Typically 
non-implemented bits in Allwinner IP as RES0, so I think we can program 
them unconditionally (and should on H6/A133/H616) and don't need a 
quirks flag.

> + * @sample_div_sel: value for the SPLCFG sample-clock divider field (0 on
> + *		    legacy SoCs that lack the field).

Same here: those bits exist back to the A20, even. And their meaning 
didn't change, if I see this correctly. So no quirk needed, instead we 
should program them explicitly to the value we want (probably 0).

> + * @sample_divisor: module-clock divisor that yields the sample clock; matches
> + *		    @sample_div_sel on newer IP, or the fixed /64 on legacy SoCs.

That looks odd: why do we have that value in the first place? Following 
the things I mention above, the divisor shouldn't be different on the 
A523. And also, I think we should just do the math in the driver, and 
calculate the divisor, based on some timing requirement. Which could be 
something like: aim for a clock period of 8us. Though all the parameters 
seem to be stable: the 24 MHz OSC input, the dividers in the mod clock, 
and the post dividers in register 0x34. So there wouldn't be much of a 
calculation, really. But I still think the driver can figure this out 
itself, and doesn't need explicit telling of a divisor.

So I think we would need a separate patch to fix up driver operation 
before A523. Then the A523 bits should go on top of this. And maybe make 
this two patches, one for the edge sample bits, one for the clock 
calculation.

Cheers,
Andre

>   */
>  struct sunxi_ir_quirks {
>  	bool		has_reset;
>  	int		fifo_size;
> +	bool		both_pulse;
> +	u8		sample_div_sel;
> +	u32		sample_divisor;
>  };
>  
>  struct sunxi_ir {
> @@ -92,6 +114,9 @@ struct sunxi_ir {
>  	void __iomem    *base;
>  	int             irq;
>  	int		fifo_size;
> +	bool		both_pulse;
> +	u8		sample_div_sel;
> +	u32		sample_divisor;
>  	struct clk      *clk;
>  	struct clk      *apb_clk;
>  	struct reset_control *rst;
> @@ -140,17 +165,19 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
>  }
>  
>  /* Convert idle threshold to usec */
> -static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
> +static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int div,
> +				       unsigned int ithr)
>  {
>  	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
> -				 base_clk / (128 * 64));
> +				 base_clk / (128 * div));
>  }
>  
>  /* Convert usec to idle threshold */
> -static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
> +static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int div,
> +				       unsigned int usec)
>  {
>  	/* make sure we don't end up with a timeout less than requested */
> -	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
> +	return DIV_ROUND_UP((base_clk / (128 * div)) * usec,  USEC_PER_SEC) - 1;
>  }
>  
>  static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
> @@ -158,15 +185,17 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
>  	struct sunxi_ir *ir = rc_dev->priv;
>  	unsigned int base_clk = clk_get_rate(ir->clk);
>  
> -	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
> +	unsigned int ithr = sunxi_usec_to_ithr(base_clk, ir->sample_divisor,
> +					       timeout);
>  
>  	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
>  
> -	/* Set noise threshold and idle threshold */
> -	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
> +	/* Set sample clock divider, noise threshold and idle threshold */
> +	writel(REG_CIR_SDIV(ir->sample_div_sel) |
> +	       REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
>  	       ir->base + SUNXI_IR_CIR_REG);
>  
> -	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
> +	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ir->sample_divisor, ithr);
>  
>  	return 0;
>  }
> @@ -193,8 +222,14 @@ static int sunxi_ir_hw_init(struct device *dev)
>  		goto exit_disable_apb_clk;
>  	}
>  
> -	/* Enable CIR Mode */
> -	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
> +	/*
> +	 * Enable CIR Mode. On newer IP revisions the pulse-mode field must
> +	 * also be set, otherwise no pulses are captured into the RX FIFO.
> +	 */
> +	tmp = REG_CTL_MD;
> +	if (ir->both_pulse)
> +		tmp |= REG_CTL_PMD_BOTH;
> +	writel(tmp, ir->base + SUNXI_IR_CTL_REG);
>  
>  	/* Set noise threshold and idle threshold */
>  	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
> @@ -271,6 +306,9 @@ static int sunxi_ir_probe(struct platform_device *pdev)
>  	}
>  
>  	ir->fifo_size = quirks->fifo_size;
> +	ir->both_pulse = quirks->both_pulse;
> +	ir->sample_div_sel = quirks->sample_div_sel;
> +	ir->sample_divisor = quirks->sample_divisor ?: SUNXI_IR_SAMPLE_DIV;
>  
>  	/* Clock */
>  	ir->apb_clk = devm_clk_get(dev, "apb");
> @@ -325,10 +363,10 @@ static int sunxi_ir_probe(struct platform_device *pdev)
>  	ir->rc->dev.parent = dev;
>  	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>  	/* Frequency after IR internal divider with sample period in us */
> -	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
> +	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / ir->sample_divisor));
>  	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
> -	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
> -	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
> +	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 0);
> +	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 255);
>  	ir->rc->s_timeout = sunxi_ir_set_timeout;
>  	ir->rc->driver_name = SUNXI_IR_DEV;
>  
> @@ -395,6 +433,14 @@ static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
>  	.fifo_size = 64,
>  };
>  
> +static const struct sunxi_ir_quirks sun55i_a523_ir_quirks = {
> +	.has_reset = true,
> +	.fifo_size = 64,
> +	.both_pulse = true,
> +	.sample_div_sel = 2,	/* sample clock = module clock / 256 */
> +	.sample_divisor = 256,
> +};
> +
>  static const struct of_device_id sunxi_ir_match[] = {
>  	{
>  		.compatible = "allwinner,sun4i-a10-ir",
> @@ -408,6 +454,10 @@ static const struct of_device_id sunxi_ir_match[] = {
>  		.compatible = "allwinner,sun6i-a31-ir",
>  		.data = &sun6i_a31_ir_quirks,
>  	},
> +	{
> +		.compatible = "allwinner,sun55i-a523-ir",
> +		.data = &sun55i_a523_ir_quirks,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_ir_match);


