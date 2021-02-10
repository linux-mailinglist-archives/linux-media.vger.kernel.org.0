Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D441E316A3A
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 16:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhBJPba (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 10:31:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:47720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229888AbhBJPb2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 10:31:28 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0EB864E45;
        Wed, 10 Feb 2021 15:30:47 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1l9rS1-00DMb5-Nz; Wed, 10 Feb 2021 15:30:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Feb 2021 15:30:45 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
In-Reply-To: <20210210144043.s4plyc7ekwnnu7k4@gilmour>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: maxime@cerno.tech, dave.stevenson@raspberrypi.com, tglx@linutronix.de, eric@anholt.net, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, daniel.vetter@intel.com, airlied@linux.ie, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, mchehab@kernel.org, linux-media@vger.kernel.org, f.fainelli@gmail.com, nsaenzjulienne@suse.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On 2021-02-10 14:40, Maxime Ripard wrote:
> Hi Dave,
> 
> On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
>> On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>> >
>> > The BSC controllers used for the HDMI DDC have an interrupt controller
>> > shared between both instances. Let's add it to avoid polling.
>> 
>> This seems to have unintended side effects.
>> GIC interrupt 117 is shared between the standard I2C controllers
>> (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.
>> 
>> Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
>> doesn't appear to be an option for l2-intc registering as an interrupt
>> controller. i2c-bcm2835 therefore loses out and fails to register for
>> the interrupt.
>> 
>> Is there an equivalent flag that an interrupt controller can add to
>> say that the parent interrupt is shared? Is that even supported?
> 
> Indeed, it looks like setting an equivalent to IRQF_SHARED would be the
> solution, but I couldn't find anything that would allow us to in the
> irqchip code.
> 
> Marc, Thomas, is it something that is allowed?

No, not really. That's because the chained handler is actually an
interrupt flow, and not a normal handler. IRQF_SHARED acts at the wrong
level for that.

I can see two possibilities:

- the l2-intc gets turned into a normal handler, and does the demux
   from there. Horrible stuff.

- the i2c controller gets parented to the l2c-int as a fake interrupt,
   and gets called from there. Horrible stuff.

Pick your poison... :-/

         M.
-- 
Jazz is not dead. It just smells funny...
