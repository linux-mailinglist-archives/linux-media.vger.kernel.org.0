Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A4C3CD261
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 12:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbhGSKAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 06:00:21 -0400
Received: from foss.arm.com ([217.140.110.172]:55210 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235621AbhGSKAP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 06:00:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BBD16D;
        Mon, 19 Jul 2021 03:40:55 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B0AC3F73D;
        Mon, 19 Jul 2021 03:40:53 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] media: rc: meson-ir-tx: document device tree
 bindings
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
        jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
References: <20210716144508.6058-1-viktor.prutyanov@phystech.edu>
 <20210716144508.6058-2-viktor.prutyanov@phystech.edu>
 <CAFBinCBpxcHHDs2cr+V4gDVk48G3+T7V-Lde2CkY6xvVrqixmA@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <a60c3706-fb11-f66c-6c17-d0f960241e03@arm.com>
Date:   Mon, 19 Jul 2021 11:40:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBpxcHHDs2cr+V4gDVk48G3+T7V-Lde2CkY6xvVrqixmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

(just reading this patch out of passing curiosity...)

On 2021-07-17 20:57, Martin Blumenstingl wrote:
> Hi Viktor,
> 
> On Fri, Jul 16, 2021 at 4:45 PM Viktor Prutyanov
> <viktor.prutyanov@phystech.edu> wrote:
> [...]
>> +  amlogic,fifo-threshold:
>> +    description: TX FIFO threshold
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 127
> I tried to make sense of this property but I don't understand it yet
> (even after reading the second patch in this series).
> A "FIFO" (in my own words) is some physical property of the IR
> transmitter in these Amlogic SoCs.
> So for one specific SoC there can only be one FIFO size, not a range (0..127).
> 
> What about a value of 0: my understanding is that this means that
> there's no FIFO. Will this hardware still work in that case?
> 
>  From reading the driver code it seems to me that the FIFO size is 128.
> The driver can use fewer FIFO entries if it wants, but this must not
> affect the dt-bindings (as these describe the hardware - they don't
> "configure" the driver).
> If you look at arch/arm64/boot/dts/amlogic/meson-g12.dtsi you'll find
> toddr_a, toddr_b and toddr_c there:
> All three of them use identical circuitry internally, except that
> toddr_a has a bigger FIFO size than the other two. Using a FIFO size
> of 256 for toddr_a is not correct as it's an improper description of
> the toddr_a hardware (that said, the driver can still decide that it
> only wants to use 256 FIFO entries).

In general, a FIFO threshold is not about how much of the FIFO you use 
overall, but how often and/or urgently you tend to it. If the only thing 
that matters is minimising CPU overhead then the optimum choice is to 
wait until the FIFO is entirely full/empty before taking action to 
drain/refill it. However, that necessarily creates a pause in 
reception/transmission for the time it takes to respond to the 
empty/full interrupt, hence why many FIFOs also implement a threshold 
interrupt for cases when uninterrupted communication is more desirable 
than absolutely minimising interrupts. Typically those are set to fire 
at some point shortly *before* the FIFO becomes completely full/empty, 
to leave enough remaining buffer for communication to continue during 
that time window until the ISR actually gets to respond.

That said, I'm also doubtful about this particular case. If the physical 
FIFO depth does actually vary between SoCs, that should be known by the 
driver and implicit in the compatible string, definitely not hidden in a 
tangential property. Otherwise, it's not apparent how this makes sense 
to configure statically on a per-SoC or per-board basis. If anything it 
would depend on the transmission rate of whatever IR protocol the user 
wishes to use at any given time AFAICS. If it's not sufficient for the 
driver to simply assume, say, an 80% threshold as "good enough", then 
presumably it has enough information about the clock rate and/or the 
parameters of the given Tx request to implement a slightly cleverer 
heuristic. If it's desirable to tweak the specific driver behaviour in 
cases where the user does know better, then by all means make that a 
module parameter, but it's not something which belongs in DT.

Cheers,
Robin.
