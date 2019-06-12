Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B63BC42A28
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 17:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405677AbfFLPBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 11:01:34 -0400
Received: from gofer.mess.org ([88.97.38.141]:51411 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfFLPBe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 11:01:34 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A3614601BD; Wed, 12 Jun 2019 16:01:32 +0100 (BST)
Date:   Wed, 12 Jun 2019 16:01:32 +0100
From:   Sean Young <sean@mess.org>
To:     Takashi Kanamaru <neuralassembly@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: The restricted number (LIRCBUF_SIZE) of pulse-spaces in IR
 sequences is too small
Message-ID: <20190612150132.iemhbronjjaonpt2@gofer.mess.org>
References: <CAKL8oB_qPGVXd3MCj=f1Lzh02ifGzYTS2YAD77s2MY2LAnc+1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKL8oB_qPGVXd3MCj=f1Lzh02ifGzYTS2YAD77s2MY2LAnc+1A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Takashi Kanamaru,

On Wed, Jun 12, 2019 at 11:08:34PM +0900, Takashi Kanamaru wrote:
> Dear all,
> 
> When using kernel 4.19.X and sending IR commands with LIRC,
> the number of  pulse-spaces of IR sequence is restricted to be smaller than 256.
> 
> In kernel 4.19, this restriction is caused by the following line in
> media/rc/lirc_dev.c,
> which did not exist kernel 4.14.
> https://github.com/torvalds/linux/blob/v4.19/drivers/media/rc/lirc_dev.c

Indeed this file did not exist in 4.14. In 4.14, it was called:

https://github.com/torvalds/linux/blob/v4.14/drivers/media/rc/ir-lirc-codec.c

> #define LIRCBUF_SIZE 256
> 
> An IR sequences of a remote controller of my air conditioner has 439
> pulse-spaces
> with about 250ms duration, so, it cannot be sent with kernel 4.19.

There are a lot of IR drivers/hardware that can send more than 256
pulse/spaces. This limit exists in rc-core because it was always there;
however some old lirc drivers did not have a limit.

I don't see any reason why it can't be increased. For the record, it would
be interesting to know what your air conditioner model is and what the
IR signal looks like. I have not seen such a signal before.

> The max duration of IR sequence is detemined as 500ms by IR_MAX_DURATION.
> Therefore,  I think signals with about 1000 pulse-spaces should be allowed.
> 
> So, could you please set LIRCBUF_SIZE to the value 1024?

I don't see any reason not to.

> I built a kernel 4.19.46 with LIRCBUF_SIZE=1024,
> and I confirmed that IR sequences  with 439 pulse-spaces
> could be sent correctly.

That's great.

Thanks,

Sean
