Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EFF563F11
	for <lists+linux-media@lfdr.de>; Sat,  2 Jul 2022 10:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiGBIPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jul 2022 04:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiGBIPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jul 2022 04:15:02 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDC313DF3
        for <linux-media@vger.kernel.org>; Sat,  2 Jul 2022 01:15:01 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 29FC110006C; Sat,  2 Jul 2022 09:14:59 +0100 (BST)
Date:   Sat, 2 Jul 2022 09:14:59 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <Yr/+g/j20kb5kzki@gofer.mess.org>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrqfTnY4Azqt44e4@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Jun 28, 2022 at 09:27:26AM +0300, Marko Mäkelä wrote:
> Mon, Jun 27, 2022 at 11:53:52AM +0100, Sean Young wrote:
> > Hi Marko,
> > 
> > On Sun, Jun 26, 2022 at 03:33:47PM +0300, Marko Mäkelä wrote:
> > > I finally took the time to get a deeper understanding of the infrared remote
> > > control subsystem. I think that I now understand the translation into
> > > key-down, key-up, and key-repeat events. For the RC5 protocol, rc_repeat()
> > > will not be called by ir-rc5-decoder.c but instead, ir_do_keydown() will
> > > handle the repeat. For lirc_scancode_event() it will never set the
> > > LIRC_SCANCODE_FLAG_REPEAT bit, even if !new_event and the protocol does
> > > support the toggle bit. That might qualify as a bug.
> > 
> > You are right, this was missed. Patches welcome.
> 
> Attached (for 5.19.0-rc3, on top of the two commits of this patch series).
> 
> I thought that it would be the least amount of trouble to slightly change
> the interpretation of the "toggle" parameter of
> rc_keydown(). My intention was to use the values 1 and 2 when the toggle
> flag is present. Any nonzero values would work.

I don't understand why this is needed.

> I am not that familiar with updating the modules, and I suspect that instead
> of actually testing this code, I was testing the "ring buffer" patch that I
> posted yesterday. I could not use the rmmod/insmod approach for testing this
> change, because the rc_core module was in use by the display driver. So, I
> can only say that the patch compiled for me. A few FIXME places are
> indicated where I am not sure that a correct (nonzero) toggle value would be
> computed.

A patch needs to be tested. Just rebuild the entire kernel and boot from that.

> An alternative approach would be to use the value toggle=1 for the case when
> the toggle bit is set, and toggle>1 for the case when it is not set.
> Basically, change things like 1+!!x to 1+!x in the callers, and change the
> condition toggle > 1 to toggle == 1 in rc-main.c. In that way, any old
> driver that would use the toggle values 0 and 1 would still generate
> LIRC_SCANCODE_FLAG_TOGGLE. But then, the repeat_event logic would only work
> half the time (when toggle!=0).
> 
> 	Marko

> >From 29a5c2a00653f49c854109b2f2c8f99b4431430f Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
> Date: Tue, 28 Jun 2022 07:59:17 +0300
> Subject: [PATCH] rc_keydown(): Report LIRC_SCANCODE_FLAG_REPEAT based on
>  toggle bit
> 
> Drivers that will not call rc_repeat() will let rc_keydown()
> create repeat events. For the LIRC interface, the repeat flag
> would only be set by rc_repeat(), never by rc_keydown().
> 
> We change the meaning of the toggle parameter: Drivers that
> invoke rc_repeat() by themselves should always pass toggle=0,
> while protocols that include a toggle bit should pass toggle>0,
> with the value 1 meaning that the toggle bit is clear.
> 
> This is largely untested code. See FIXME comments.
> Also, an interface change for bpf_rc_keydown() might have to be
> documented.
> ---
>  drivers/media/cec/platform/seco/seco-cec.c  |  3 +-
>  drivers/media/i2c/ir-kbd-i2c.c              |  4 +-
>  drivers/media/pci/bt8xx/bttv-input.c        |  2 +-
>  drivers/media/pci/ttpci/budget-ci.c         |  4 +-
>  drivers/media/rc/bpf-lirc.c                 |  2 +-
>  drivers/media/rc/img-ir/img-ir-rc5.c        |  2 +-
>  drivers/media/rc/img-ir/img-ir-rc6.c        |  2 +-
>  drivers/media/rc/imon.c                     |  2 +-
>  drivers/media/rc/ir-jvc-decoder.c           |  3 +-
>  drivers/media/rc/ir-rc5-decoder.c           |  2 +-
>  drivers/media/rc/ir-rc6-decoder.c           |  4 +-
>  drivers/media/rc/ir-rcmm-decoder.c          |  2 +-
>  drivers/media/rc/rc-main.c                  |  9 ++--
>  drivers/media/usb/dvb-usb-v2/az6007.c       |  2 +-
>  drivers/media/usb/dvb-usb-v2/dvbsky.c       |  2 +-
>  drivers/media/usb/dvb-usb-v2/rtl28xxu.c     | 48 ++++-----------------
>  drivers/media/usb/dvb-usb-v2/rtl28xxu.h     |  1 +
>  drivers/media/usb/dvb-usb/dib0700_core.c    |  2 +-
>  drivers/media/usb/dvb-usb/dib0700_devices.c |  2 +-
>  drivers/media/usb/dvb-usb/ttusb2.c          |  3 +-
>  drivers/media/usb/em28xx/em28xx-input.c     |  4 +-
>  drivers/staging/media/av7110/av7110_ir.c    |  2 +-
>  22 files changed, 40 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
> index a056412883b9..6aa889add090 100644
> --- a/drivers/media/cec/platform/seco/seco-cec.c
> +++ b/drivers/media/cec/platform/seco/seco-cec.c
> @@ -416,7 +416,8 @@ static int secocec_ir_rx(struct secocec_data *priv)
>  	addr = (val & SECOCEC_IR_ADDRESS_MASK) >> SECOCEC_IR_ADDRESS_SHL;
>  	toggle = (val & SECOCEC_IR_TOGGLE_MASK) >> SECOCEC_IR_TOGGLE_SHL;
>  
> -	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key), toggle);
> +	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key),
> +		   1 + toggle);

You can't change the toggle value because you want a repeat flag. This makes
no sense.

-snip-

> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -782,18 +782,19 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
>  {
>  	bool new_event = (!dev->keypressed		 ||
>  			  dev->last_protocol != protocol ||
> -			  dev->last_scancode != scancode ||
> -			  dev->last_toggle   != toggle);
> +			  dev->last_scancode != scancode);
> +	bool repeat_event = !new_event && toggle && dev->last_toggle == toggle;

Why this change?

>  	struct lirc_scancode sc = {
>  		.scancode = scancode, .rc_proto = protocol,
> -		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
> +		.flags = (toggle > 1 ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
> +			 (repeat_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),

Why not simply (!new_event ? LIRC_SCANCODE_FLAG_REPEAT : 0) and be done with it?

>  		.keycode = keycode
>  	};
>  
>  	if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
>  		lirc_scancode_event(dev, &sc);
>  
> -	if (new_event && dev->keypressed)
> +	if (!repeat_event && dev->keypressed)
>  		ir_do_keyup(dev, false);
>  
>  	if (scancode <= U32_MAX)
> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> index 62ee09f28a0b..cc218c0d71a8 100644
> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> @@ -224,7 +224,7 @@ static int az6007_rc_query(struct dvb_usb_device *d)
>  		proto = RC_PROTO_NEC32;
>  	}
>  
> -	rc_keydown(d->rc_dev, proto, code, st->data[5]);
> +	rc_keydown(d->rc_dev, proto, code, 1 + st->data[5]); /* FIXME */

I still have no idea what you are trying to achieve with this.


Sean
