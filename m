Return-Path: <linux-media+bounces-66719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MfviE615S2o8SAEAu9opvQ
	(envelope-from <linux-media+bounces-66719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 11:47:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F770EC09
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 11:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b="SIhSov/L";
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66719-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66719-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72BE43122923
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 09:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7DD42CAED;
	Mon,  6 Jul 2026 09:24:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96683D16F9;
	Mon,  6 Jul 2026 09:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329836; cv=none; b=lF28saDBM9CuVeHs6O41U+bco52vGHuuF4Ocpe+UOoO24K4hVdX6COZGi4Q0RKB9S3UIyN3utQM+zQkz1MaX3d/G2lxuq1ORujIZrVqhMLUNm317qoqeOp+Dmw2eWiRqTbtOanff/z7YHoRICux43QNm+nwFQhoKM0xREpjFqIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329836; c=relaxed/simple;
	bh=/8784x9imFmGeatCVHRqpOQchNLfWZCJAGlRTvpfNnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qE7q84mgMVJy2sDdauutus7IwVF6wDCUuPMlf7mNXCpTX5mP5bMPArC1yX7EVhRRBIWyWyJJ3d1gbKzL9XErCiAmA4DVLM+wIwhNIRS/JFx+ZSAfRfofH3c9HR9sTW0pCJyPmoHUsLiPQuw/mWJnuFPXFJRSNW4AzsV8U7J6GDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SIhSov/L; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 141431596;
	Mon,  6 Jul 2026 02:23:45 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F3913F7B4;
	Mon,  6 Jul 2026 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783329829; bh=/8784x9imFmGeatCVHRqpOQchNLfWZCJAGlRTvpfNnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SIhSov/LSIap90aAtJb6Pq45vQY8/8zymoH1/kl8YVk5IXX9MrhhHn+3k2wd0+52/
	 LtEh4jQznQvqKfA9wxQgR7MelOJtAgH62x9fAijv3yshtwS3IIhjfuTaQnytA6RQMJ
	 edreVt9G3rmuEWQNyeAJGUt4RlWVAeDScOqaigrY=
Message-ID: <dd3430e2-2620-44e7-99c3-e17003be7c71@arm.com>
Date: Mon, 6 Jul 2026 11:23:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <309f6601-2358-4a2d-9696-0849d69ade52@arm.com> <akgKeqUhWWThWKco@suesslenovo>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <akgKeqUhWWThWKco@suesslenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66719-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:dkim,arm.com:mid,gitlab.com:url,linux-sunxi.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51F770EC09

Hi Justin,

On 7/3/26 21:47, Justin Suess wrote:
> On Fri, Jul 03, 2026 at 11:11:59AM +0200, Andre Przywara wrote:
>> On Thu,  2 Jul 2026 17:47:48 -0400
>> Justin Suess <utilityemal77@gmail.com> wrote:
>>
>> Hi Justin,
>>
>> many thanks for sending this!
>>
>>> The A523 (sun55i) has a newer revision of the CIR receiver IP. Two
>>> register fields that do not exist on older SoCs must be programmed
>>> for reception to work:
>>>
>>>   - CTL bits [7:6] select which pulse polarities are captured into the
>>>     RX FIFO. The reset value of 0 captures nothing, so program "both
>>>     pulse" mode, which captures regardless of header polarity.
>>
>> Are you sure about that? The manual says that *both* the 0b00 (reset
>> default) and 0b01 values capture both edges, and actually the H6, A133
>> and H616 have the same bits, and it apparently works there.
>>
> No, actually. I literally just live dumped the registers on the vendor
> kernel, (my android tv came pre-rooted for some reason) and interpreted
> the purpose from the BSP source.
> 
> I am actually unaware there was such a manual. If you could point me to
> it that'd be great.
>> I don't see those bits documented in the A64 (and earlier), but haven't
>> checked yet whether they exist there regardless or have an effect.
>> So I think we should force those bits either to 0 or to 1, depending on how
>> those bits behave on A64 and before, and how compatible this is with H6,
>> A133, H616. I will try to run some experiments on the weekend.
>>
> Appreciate it!
> 
> I'll wait for the results of that experiment, I don't feel confident
> enough that I wouldn't break things by even forcing the register to zero
> without hardware to test on. So I preserved the existing behavior for the non
> X98qpro+ board to be safe.

So I tested IR on an H5 and H616 board, both are happy with those bits 
being either 0b00 or 0b01. Setting bit 7 however broke things, I 
sometimes got error messages that indicate it missed a pulse, so bit 7 
selecting one of the single-pulse-only settings would make sense. Even 
on the H5, where this isn't documented in the manual, but behaves the 
same as in the later chips.

AND I also tested on the X96QPro+, and it worked there without any 
driver changes: just with the A31 fallback compatible!

Can you confirm this? This would render this whole patch here moot:
- We don't need a special "both pulse" setting, as the 0b00 setting 
already selects that, and we force those bits to 0 already by 
initialising the variable to REG_CTL_MD, which just sets bits [5:4].
- As mentioned, I think setting the clock-frequency property in the DT 
is misleading: we don't need to do that, and then it just works.

I actually question the usefulness of this property at all: first it 
shouldn't be the CIR input clock frequency, but the sample frequency (so 
125 KHz, for instance). And secondly I wonder if the DT is the right 
place to set this frequency in the first place, if anything, I would 
expect the specific IR protocol to have some minimum sample rate 
requirement. So I wonder if we should deprecate this property in the DT 
bindings altogether.

>>>   - SPLCFG (the sample configuration register) bits [1:0] select the
>>>     sample clock as a division of the module clock, replacing the
>>>     fixed module clock / 64 sample rate of the older IP.
>>
>> That's not fully correct: even the A20(!) has these two bits, actually
>> there is a third bit, held in bit 24 (because reasons). All those bits
>> reset to 0, which is encoded as /64, so this is where the rate comes
>> from. And sunxi_ir_probe() sets the IR clock to 8MHz, which should end
>> up as 24MHz / 3, on all chips, including the A523.
>>
>> So what is going on here? Is the manual wrong, about those bits, or the
>> clock sources?
>> Can you point to the BSP sources, if you used those?
>>
> 
> Actually I relied on a script running sunxi-dump on the vendor
> kernel and dumping the registers for an initial implementation.
> 
> It didn't work, and I was getting stuck. (probably my sampling script
> didn't dump the registers fast enough and didn't include all of the ones
> needed).
> 
> Then I found https://github.com/chainsx/linux-sun55iw3-vendor
> 
> And saw this
> 
>    #define IR_SAMPLE_DEV		(0x2 << 0)	/* 24MHz/256 =93750Hz (~10.7us)*/
> 
> for the clock rate.
> 
> And then this one:
> 
>    #define IR_BOTH_PULSE		(0x1 << 6)
> 
> As and saw it being used as the pulse polarity.
> 
> (above are in bsp/drivers/ir-rx/sunxi-ir-rx.c)
> 
> And figured to give this one a try because everything I tried before
> messing with the existing constants in mainline failed, and this was
> the primary construct that didn't match up with mainline.
 >
> Those two things were enough to get it working perfectly on my hardware.

Interesting, so can you double check that it works for you without any 
driver changes? Or revert your changes one-by-one, so selecting the 
default 8 MHz clock, while keeping the /64 divider, then using
(0x0 << 6) for the pulse detection bits.
Because this is what effectively worked for me.

> So this is more based on "this is what worked on the hardware" + a
> cursory read of the vendor source than based on any hardware technical
> document or manual... I should have been more upfront about that.

That's fine, if you confirm things by experiements, that's a proper 
approach, as the BSP code contains quite some nonsense at times. What I 
typically add to my experiments to be more confident is trying to break 
things again: so set a bit which you think should be clear, and see if 
it stops working.
You can even mess around with the register bits on a live system, by 
using my peekpoke tool[1], for instance. To dump SUNXI_IR_CIR_REG, then 
set bit 7 in SUNXI_IR_CTL_REG:
# peekpoke -b 0x07040000 r.l 0x34 s.l 0x0 7

[1] https://github.com/apritzel/peekpoke

> So please point me to this manual and I can revise and figure out WHY
> this works and improve this patch series.

Just for the records (as responded on IRC), we keep links to the manuals 
in our wiki: https://linux-sunxi.org/A523#Documentation
Those are just the early A523 manuals, though, there are more floating 
around:
https://gitlab.com/tina5.0_aiot/product/docs/-/tree/product-aiot-stable?ref_type=heads

Cheers,
Andre

>>>     module clock / 256, which together with the 24 MHz module clock
>>
>> Why is the A523 mod clock set to 24 MHz? You seem to do this in the DT,
>> overriding the 8MHz default? The driver clearly has a clk_set_rate() call
>> with that default 8MHz as an argument, and I don't think we should deviate
>> from that, unless there are good reasons. The sample clock should be more of
>> a driver/subsystem decision, not a a device one.
>>
> 
> See above. This is just what worked on the hardware, and what the vendor
> set. And it worked so I sent it. I didn't have access to the manual...
> 
> but agreed this needs justification and not just a handwaving "works on
> my machine".
> 
>>>     used on the A523 gives a 10.7 μs sample period, close to the 8 μs
>>>     of the previous 8 MHz / 64 configuration, and keeps the default
>>>     125 ms idle timeout representable in the 8-bit idle threshold
>>
>> This is some good info that helps people understand the reasoning behind
>> those timing values. Please put this in a comment near the top of the file.
>> But actually: how does this compute? With an 8us sample clock period, the
>> 8-bit ATHR field only covers 2 ms. And I don't see us setting the ATHC bit
>> to bump this by 128.
>>
> I'll include it and anything else I can glean from your testing, and if
> you can point me to the manual.
> 
> Thanks for the swift review, sorry should have made more obvious up
> front this was a "tweaking until it works" implementation, not a ground
> up spec based implementation.
> 
>> Cheers,
>> Andre
>>
>>>     field.
>>>
>>> Parameterize the sample divisor in the resolution/timeout
>>> calculations, which older SoCs keep at the fixed 64, and add the
>>> A523 quirks and compatible.
>>>
>>> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
>>> ---
>>>   drivers/media/rc/sunxi-cir.c | 76 ++++++++++++++++++++++++++++++------
>>>   1 file changed, 63 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
>>> index cb4c56bf0752..82ada9dc0347 100644
>>> --- a/drivers/media/rc/sunxi-cir.c
>>> +++ b/drivers/media/rc/sunxi-cir.c
>>> @@ -31,6 +31,11 @@
>>>   /* CIR mode */
>>>   #define REG_CTL_MD			(BIT(4) | BIT(5))
>>> +/* Pulse mode selector (bits [7:6]) */
>>> +#define REG_CTL_PMD(m)			((m) << 6)
>>> +/* Capture both pulse polarities */
>>> +#define REG_CTL_PMD_BOTH		REG_CTL_PMD(1)
>>> +
>>>   /* Rx Config */
>>>   #define SUNXI_IR_RXCTL_REG    0x10
>>>   /* Pulse Polarity Invert flag */
>>> @@ -66,6 +71,13 @@
>>>   /* IR Sample Config */
>>>   #define SUNXI_IR_CIR_REG      0x34
>>> +/*
>>> + * Sample clock divider select (bits [1:0]), present on newer IP revisions
>>> + * (e.g. sun55i). Selects the sample clock as a fraction of the module clock;
>>> + * must be programmed for the sampler to run. Older SoCs lack the field and
>>> + * use a fixed module-clock/64 sample rate, so they leave it 0.
>>> + */
>>> +#define REG_CIR_SDIV(val)    ((val) & GENMASK(1, 0))
>>>   /* CIR_REG register noise threshold */
>>>   #define REG_CIR_NTHR(val)    (((val) << 2) & (GENMASK(7, 2)))
>>>   /* CIR_REG register idle threshold */
>>> @@ -73,6 +85,8 @@
>>>   /* Required frequency for IR0 or IR1 clock in CIR mode (default) */
>>>   #define SUNXI_IR_BASE_CLK     8000000
>>> +/* Default sample clock divisor: module clock / 64 (legacy fixed rate) */
>>> +#define SUNXI_IR_SAMPLE_DIV   64
>>>   /* Noise threshold in samples  */
>>>   #define SUNXI_IR_RXNOISE      1
>>> @@ -81,10 +95,18 @@
>>>    *
>>>    * @has_reset: SoC needs reset deasserted.
>>>    * @fifo_size: size of the fifo.
>>> + * @both_pulse: program the CTRL pulse-mode field (newer IP revisions).
>>
>> As mentioned above, those bits exist in earlier IP as well. Typically
>> non-implemented bits in Allwinner IP as RES0, so I think we can program them
>> unconditionally (and should on H6/A133/H616) and don't need a quirks flag.
>>
> Yeah, probably just setting them to zero is *fine* for the non-a523
> hardware, but I didn't want to send patches for hardware I can't test.
> 
> Last thing I want to do is make someones TV remote stop working.
> 
> If your experiments reveal forcing zero is OK, than I'll default to
> that.
> 
>>> + * @sample_div_sel: value for the SPLCFG sample-clock divider field (0 on
>>> + *		    legacy SoCs that lack the field).
>>
>> Same here: those bits exist back to the A20, even. And their meaning didn't
>> change, if I see this correctly. So no quirk needed, instead we should
>> program them explicitly to the value we want (probably 0).
>>
> Sounds good
>>> + * @sample_divisor: module-clock divisor that yields the sample clock; matches
>>> + *		    @sample_div_sel on newer IP, or the fixed /64 on legacy SoCs.
>>
>> That looks odd: why do we have that value in the first place? Following the
>> things I mention above, the divisor shouldn't be different on the A523. And
>> also, I think we should just do the math in the driver, and calculate the
>> divisor, based on some timing requirement. Which could be something like:
>> aim for a clock period of 8us. Though all the parameters seem to be stable:
>> the 24 MHz OSC input, the dividers in the mod clock, and the post dividers
>> in register 0x34. So there wouldn't be much of a calculation, really. But I
>> still think the driver can figure this out itself, and doesn't need explicit
>> telling of a divisor.
>>
> This is just what worked for me; and what the vendor did. But you're
> right, we shouldn't trust it if the quality of the bsp code is anything
> to go off of.
> 
>> So I think we would need a separate patch to fix up driver operation before
>> A523. Then the A523 bits should go on top of this. And maybe make this two
>> patches, one for the edge sample bits, one for the clock calculation.
>>
> Easy enough. I'll wait on your experiments, please send whatever you
> found here while I prepare the seperate patches, and I'll adjust before
> resending (no rush on the results, all I'd need is you forcing the
> register to zero and verifying it works)
> 
> (and please if you could drop me this manual, would have saved me a lot of time!
> I couldn't find it anywhere!)
> 
> Justin
>> Cheers,
>> Andre
>>
>>>    */
>>>   struct sunxi_ir_quirks {
>>>   	bool		has_reset;
>>>   	int		fifo_size;
>>> +	bool		both_pulse;
>>> +	u8		sample_div_sel;
>>> +	u32		sample_divisor;
>>>   };
>>>   struct sunxi_ir {
>>> @@ -92,6 +114,9 @@ struct sunxi_ir {
>>>   	void __iomem    *base;
>>>   	int             irq;
>>>   	int		fifo_size;
>>> +	bool		both_pulse;
>>> +	u8		sample_div_sel;
>>> +	u32		sample_divisor;
>>>   	struct clk      *clk;
>>>   	struct clk      *apb_clk;
>>>   	struct reset_control *rst;
>>> @@ -140,17 +165,19 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
>>>   }
>>>   /* Convert idle threshold to usec */
>>> -static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int ithr)
>>> +static unsigned int sunxi_ithr_to_usec(unsigned int base_clk, unsigned int div,
>>> +				       unsigned int ithr)
>>>   {
>>>   	return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
>>> -				 base_clk / (128 * 64));
>>> +				 base_clk / (128 * div));
>>>   }
>>>   /* Convert usec to idle threshold */
>>> -static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int usec)
>>> +static unsigned int sunxi_usec_to_ithr(unsigned int base_clk, unsigned int div,
>>> +				       unsigned int usec)
>>>   {
>>>   	/* make sure we don't end up with a timeout less than requested */
>>> -	return DIV_ROUND_UP((base_clk / (128 * 64)) * usec,  USEC_PER_SEC) - 1;
>>> +	return DIV_ROUND_UP((base_clk / (128 * div)) * usec,  USEC_PER_SEC) - 1;
>>>   }
>>>   static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
>>> @@ -158,15 +185,17 @@ static int sunxi_ir_set_timeout(struct rc_dev *rc_dev, unsigned int timeout)
>>>   	struct sunxi_ir *ir = rc_dev->priv;
>>>   	unsigned int base_clk = clk_get_rate(ir->clk);
>>> -	unsigned int ithr = sunxi_usec_to_ithr(base_clk, timeout);
>>> +	unsigned int ithr = sunxi_usec_to_ithr(base_clk, ir->sample_divisor,
>>> +					       timeout);
>>>   	dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", ithr);
>>> -	/* Set noise threshold and idle threshold */
>>> -	writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
>>> +	/* Set sample clock divider, noise threshold and idle threshold */
>>> +	writel(REG_CIR_SDIV(ir->sample_div_sel) |
>>> +	       REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
>>>   	       ir->base + SUNXI_IR_CIR_REG);
>>> -	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ithr);
>>> +	rc_dev->timeout = sunxi_ithr_to_usec(base_clk, ir->sample_divisor, ithr);
>>>   	return 0;
>>>   }
>>> @@ -193,8 +222,14 @@ static int sunxi_ir_hw_init(struct device *dev)
>>>   		goto exit_disable_apb_clk;
>>>   	}
>>> -	/* Enable CIR Mode */
>>> -	writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
>>> +	/*
>>> +	 * Enable CIR Mode. On newer IP revisions the pulse-mode field must
>>> +	 * also be set, otherwise no pulses are captured into the RX FIFO.
>>> +	 */
>>> +	tmp = REG_CTL_MD;
>>> +	if (ir->both_pulse)
>>> +		tmp |= REG_CTL_PMD_BOTH;
>>> +	writel(tmp, ir->base + SUNXI_IR_CTL_REG);
>>>   	/* Set noise threshold and idle threshold */
>>>   	sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
>>> @@ -271,6 +306,9 @@ static int sunxi_ir_probe(struct platform_device *pdev)
>>>   	}
>>>   	ir->fifo_size = quirks->fifo_size;
>>> +	ir->both_pulse = quirks->both_pulse;
>>> +	ir->sample_div_sel = quirks->sample_div_sel;
>>> +	ir->sample_divisor = quirks->sample_divisor ?: SUNXI_IR_SAMPLE_DIV;
>>>   	/* Clock */
>>>   	ir->apb_clk = devm_clk_get(dev, "apb");
>>> @@ -325,10 +363,10 @@ static int sunxi_ir_probe(struct platform_device *pdev)
>>>   	ir->rc->dev.parent = dev;
>>>   	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>>>   	/* Frequency after IR internal divider with sample period in us */
>>> -	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
>>> +	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / ir->sample_divisor));
>>>   	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
>>> -	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, 0);
>>> -	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, 255);
>>> +	ir->rc->min_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 0);
>>> +	ir->rc->max_timeout = sunxi_ithr_to_usec(b_clk_freq, ir->sample_divisor, 255);
>>>   	ir->rc->s_timeout = sunxi_ir_set_timeout;
>>>   	ir->rc->driver_name = SUNXI_IR_DEV;
>>> @@ -395,6 +433,14 @@ static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
>>>   	.fifo_size = 64,
>>>   };
>>> +static const struct sunxi_ir_quirks sun55i_a523_ir_quirks = {
>>> +	.has_reset = true,
>>> +	.fifo_size = 64,
>>> +	.both_pulse = true,
>>> +	.sample_div_sel = 2,	/* sample clock = module clock / 256 */
>>> +	.sample_divisor = 256,
>>> +};
>>> +
>>>   static const struct of_device_id sunxi_ir_match[] = {
>>>   	{
>>>   		.compatible = "allwinner,sun4i-a10-ir",
>>> @@ -408,6 +454,10 @@ static const struct of_device_id sunxi_ir_match[] = {
>>>   		.compatible = "allwinner,sun6i-a31-ir",
>>>   		.data = &sun6i_a31_ir_quirks,
>>>   	},
>>> +	{
>>> +		.compatible = "allwinner,sun55i-a523-ir",
>>> +		.data = &sun55i_a523_ir_quirks,
>>> +	},
>>>   	{}
>>>   };
>>>   MODULE_DEVICE_TABLE(of, sunxi_ir_match);
>>


