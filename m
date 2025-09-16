Return-Path: <linux-media+bounces-42636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C2B5A13F
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 21:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38986524981
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 19:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD492DCC08;
	Tue, 16 Sep 2025 19:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="le81Am8p"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EFBA4A;
	Tue, 16 Sep 2025 19:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050354; cv=none; b=gJLXcSaMvaFtvZZ1g1IoclndoxQ7p83AMFkIpuBCDcfl5cncC0adLmhSPNMt8PHJNdReoXqt4ZvxlBKUepk6e1qXxnEExVpUuW8zj8JvYiRPWUO+hzDX98ohW1CR01rrRK2tV/IJ3n/NThPW7tCVdnpMGE4xJkrngnk5IY1u/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050354; c=relaxed/simple;
	bh=1FFIc0vpeVt9VXVXNY5ecNtYOj5Qrah6JBWoxuGwpiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRa67SlySMozKGCglbJ3Kg0wja/bNwy69kbekTizcTLygny0K9P6ysqG3TR/Q04t3lp64UDcUNHGMfU7xxwZ8yY7zOyYXrAku8VlDfvLEhVulTtRMrY6cKS+N8HSPFyA+6+l8eUMjuV6eGOI4V4rcSIrGX42m/dABd7FvVZvOnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=le81Am8p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758050348;
	bh=1FFIc0vpeVt9VXVXNY5ecNtYOj5Qrah6JBWoxuGwpiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=le81Am8pWXav/+PnA7BenD+9p1jTZ8O5TlfigdH2DK3P0T01gKhEiPUn/40BeHwku
	 FAjWOhdAq7QMrv1zw0LyRZInYVCxzM7N5/j3OUXXwwJaTlI/2uGTA9MjmGiiMc7KjA
	 4zkmQc9I1Llcae/J3jlewZUSETGGKwWVX4hVSkkeLqKA+Gxwg8BNQyokK3H7skHxRZ
	 AUURGbSbVGohTY6fGnDRLB0894KYq7WknX9Dj/lcCzkImUzJ2lCaCsHW4YPZ8MnlwO
	 x314oe3Bm6ErLiVJGUZqPXiDNSko0cG3uHAo2QPqLnKixHsYD7VN/0hkYJDRuAlytb
	 UoxX7+B0EJuVg==
Received: from [IPV6:2a05:1141:1fb:db00:1bb0:aff4:8ef4:466] (unknown [IPv6:2a05:1141:1fb:db00:1bb0:aff4:8ef4:466])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6643017E12AE;
	Tue, 16 Sep 2025 21:19:07 +0200 (CEST)
Message-ID: <ead8edf7-6ae3-46ab-ba3a-4b354e0491f7@collabora.com>
Date: Tue, 16 Sep 2025 21:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/13] media: rockchip: add a driver for the rockchip
 camera interface
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com>
 <3b4173cb-655d-48ea-b86a-a036f666cf40@linaro.org>
 <23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com>
 <82f447d1-89ae-450f-813e-02c3d8228895@linaro.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <82f447d1-89ae-450f-813e-02c3d8228895@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 8/28/25 16:08, Bryan O'Donoghue wrote:
> On 28/08/2025 12:03, Michael Riesch wrote:
>> Hi Bryan,
>>
>> Thanks for your comments :-)
>>
>> On 8/26/25 08:21, Bryan O'Donoghue wrote:
>>> On 19/08/2025 00:25, Michael Riesch via B4 Relay wrote:
>>
>> [...]
>>
>>>> +
>>>> +static void rkcif_dvp_stop_streaming(struct rkcif_stream *stream)
>>>> +{
>>>> +    struct rkcif_device *rkcif = stream->rkcif;
>>>> +    u32 val;
>>>> +
>>>> +    val = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
>>>
>>> This dvp_read stuff looks a bit funny to me, you have a lookup which can
>>> return 0 for unknown registers.
>>>
>>> Probably not the case with a control register like this one but, for
>>> argument sake if RKCIF_DVP_CTRL was not a valid register i.e.
>>> rkcif_dvp_read() would return 0 and you'd still act on that data to
>>> write back to an unkown register.
>>
>> ...which would then hit the same check in rkcif_dvp_write and simply
>> return without writing anything. Also, the WARN_ON_ONCE in the lookup
>> would complain and indicate that the driver developer made some mistake.
>> I hope that the driver developer is thus nudged towards fixing the code
>> they wrote.
>>
>>> Would you not be better off having say callbacks to contain cases where
>>> registers are potentially not present
>>>
>>> ops->update_maybe_not_present_reg();
>>>
>>> followed by writes to registers that would alawys be there ?
>>
>> I'll think about that in more detail, but right now my thoughts are that
>> if any of the registers below are not valid, this piece of hardware is
>> pretty useless and there is something rotten in the driver. Thus, we
>> complain loudly to the developer.
> The developer is you though :)
> 
> Anyway seems a bit weird to me to return invalid registers, you trust
> yourself right ?

First of all: no, not one bit :-)

But really this is just the consequence of having a lookup table (and we
need this to account for the different variants). There is a chance that
some invalid value comes along, and this assertion should warn about it,
even if the chances of that happening are small.

If we converted everything to HW variant specific callbacks, we would
check whether the callback was NULL, right? Maybe consider this validity
check as pendant to that.

I gave this some thought as promised, but I still feel that looking up
the register values but having the same code is more readable than
having callbacks with the same code in principle but with different
define names.

>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
>>>> +            val & (~RKCIF_CTRL_ENABLE_CAPTURE));
>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
>>>> +
>>>> +    stream->stopping = false;
>>>> +}
>>>> +
>>>> +static void rkcif_dvp_reset_stream(struct rkcif_device *rkcif)
>>>> +{
>>>> +    u32 ctl = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
>>>> +
>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
>>>> +            ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl |
>>>> RKCIF_CTRL_ENABLE_CAPTURE);
>>>> +}
>>>> +
>>>> +static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left,
>>>> u16 top)
>>>> +{
>>>> +    struct rkcif_device *rkcif = stream->rkcif;
>>>> +    u32 val;
>>>> +
>>>> +    val = RKCIF_XY_COORD(left, top);
>>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
>>>> +}
>>>> +
>>>> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
>>>> +{
>>>> +    struct device *dev = ctx;
>>>> +    struct rkcif_device *rkcif = dev_get_drvdata(dev);
>>>> +    struct rkcif_stream *stream;
>>>> +    u32 intstat, lastline, lastpix, cif_frmst;
>>>> +    irqreturn_t ret = IRQ_NONE;
>>>> +
>>>> +    if (!rkcif->match_data->dvp)
>>>> +        return ret;
>>>
>>> Wouldn't you be better off conditionally registering your ISR if
>>> match_data->dvp is true instead ?
>>
>> As you have surely seen, the ISR is shared between all interfaces, i.e.,
>> DVP and MIPI. Now the currently supported models all have a DVP and your
>> suggestion would work. However, I think the RK3562 VICAP can be easily
>> supported by this driver but does not feature a DVP (several MIPI
>> interfaces, though). In this case match_data->dvp evaluates to false but
>> still there is the need to register the ISR.
> 
> Why not have separate ISRs then with shared code calling into a function ?
> 
> An ISR in my mind should fire for hardware we have a clear idea about
> and only do so in exceptional (pun intended) circumstances.
> 
> So I'd suggest two ISRs calling into whatever shared code you deem
> necessary as opposed to NULL checking in your ISR.

I could imagine some nice code that calls devm_request_irq() several
times with different callbacks, but that would be for the same IRQ, as
there is exactly one hardware interrupt line for the VICAP including its
IOMMU.

The devm_request_irq() calls would be moved to rkcif_capture_{mipi,dvp}
then and the base interface struct underneath the respective MIPI or DVP
interface will be passed as argument to the ISR callback.

Are you sure that we'll want to call devm_request_irq() several times
for the very same HW IRQ?

>>>> +
>>>> +    intstat = rkcif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
>>>> +    cif_frmst = rkcif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
>>>> +    lastline = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif,
>>>> RKCIF_DVP_LAST_LINE));
>>>> +    lastpix = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif,
>>>> RKCIF_DVP_LAST_PIX));
>>>> +
>>>> +    if (intstat & RKCIF_INTSTAT_FRAME_END) {
>>>> +        rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
>>>> +                RKCIF_INTSTAT_FRAME_END_CLR |
>>>> +                RKCIF_INTSTAT_LINE_END_CLR);
>>>> +
>>>> +        stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
>>>> +
>>>> +        if (stream->stopping) {
>>>> +            rkcif_dvp_stop_streaming(stream);
>>>> +            wake_up(&stream->wq_stopped);
>>>> +            ret = IRQ_HANDLED;
>>>> +            goto out;
>>>> +        }
>>>> +
>>>> +        if (lastline != stream->pix.height) {
>>>> +            v4l2_err(&rkcif->v4l2_dev,
>>>> +                 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
>>>> +                 intstat, cif_frmst, lastpix, lastline);
>>>> +
>>>> +            rkcif_dvp_reset_stream(rkcif);
>>>> +        }
>>>> +
>>>> +        rkcif_stream_pingpong(stream);
>>>> +
>>>> +        ret = IRQ_HANDLED;
>>>> +    }
>>>> +out:
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +int rkcif_dvp_register(struct rkcif_device *rkcif)
>>>> +{
>>>> +    struct rkcif_interface *interface;
>>>> +    unsigned int streams_num;
>>>> +    int ret;
>>>> +
>>>> +    if (!rkcif->match_data->dvp)
>>>> +        return 0;
>>>
>>> If you don't register the device when match_data->dvp is false, then I
>>> think you can relax the carry-on checks elsewhere on match_data->dvp,
>>> not including dvp_unregister
>>
>> +1 I'll review all instances of this check.
>>
>>> The rest of the file as I breifly skim it looks OK to me, its a bit big
>>> though.
>>>
>>> Would it be possible to break this patch up a little bit ? Might make it
>>> easier for other reviewers to give an SoB for smaller chunks.
>>
>> I suppose what I could do is split this up into five patches, as the
>> commit message already outlines:
>>
>> 1) add a basic driver (no-op skeleton only)
>> 2) abstraction for the ping-pong scheme to allow for future extensions
>> 3) abstraction for the INTERFACE and CROP parts to allow for future
>>     extensions
>> 4) support for the PX30 VIP
>> 5) support for the RK3568 VICAP DVP
>>
>> Please note that in this case I would rework the patch for a final
>> (this-time-really-final) time and drop this elaborate co-developed-by
>> list, as the patch in question will then have nothing to do it all with
>> anything what was before v2 of this series.
> 
> I'll leave that up to you, I'll still review your v11 but, a slightly
> smaller single patch to digest would be appreciated.

Working on that.

Thanks and best regards,
Michael

> 
> ---
> bod


