Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEA7394DD4
	for <lists+linux-media@lfdr.de>; Sat, 29 May 2021 21:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhE2TXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 May 2021 15:23:14 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40599 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229718AbhE2TXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 May 2021 15:23:14 -0400
Received: (qmail 1507723 invoked by uid 1000); 29 May 2021 15:21:36 -0400
Date:   Sat, 29 May 2021 15:21:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eero <fin4478@hotmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Fw: USB: core: WARN if pipe direction != setup packet direction
Message-ID: <20210529192136.GA1507406@rowland.harvard.edu>
References: <HE1PR0602MB32762856D2728450104CE1C6A1219@HE1PR0602MB3276.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0602MB32762856D2728450104CE1C6A1219@HE1PR0602MB3276.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Once again, please always send these emails to the mailing list as well 
as to me.  If this means sending from your gmail address instead of the 
hotmail address, so be it.

On Sat, May 29, 2021 at 09:56:05PM +0300, Eero wrote:
> Hi,
> 
> The patch removed the warning, but the usb dvb-t stick does not work
> because of looping messages in dmesg:
> [  418.485387] mxl5005s I2C write failed
> [  418.658410] mxl5005s I2C write failed
> 
> Those messages come from:
> 
> linux-next-next-20210528/drivers/media/tuners/mxl5005s.c
> 
> static int mxl5005s_writereg(struct dvb_frontend *fe, u8 reg, u8 val,
> int latch) {
> 	struct mxl5005s_state *state = fe->tuner_priv;
> 	u8 buf[3] = { reg, val, MXL5005S_LATCH_BYTE };
> 	struct i2c_msg msg = { .addr = state->config->i2c_address,
> .flags = 0, .buf = buf, .len = 3 };
> 
> 	if (latch == 0)
> 		msg.len = 2;
> 
> 	dprintk(2, "%s(0x%x, 0x%x, 0x%x)\n", __func__, reg, val,
> 	msg.addr);
> 
> 	if (i2c_transfer(state->i2c, &msg, 1) != 1) {
> 		printk(KERN_WARNING "mxl5005s I2C write failed\n");
> 		return -EREMOTEIO;
> 	}
> 	return 0;
> }

This is a completely different error.  It should be reported to the 
maintainers of the media drivers (CC'ed).

Does the same problem occur if you don't apply Johan's rtl28xxu patch 
and you revert commit 5cc59c418fde from 5.13.rc3-next?

Alan Stern
