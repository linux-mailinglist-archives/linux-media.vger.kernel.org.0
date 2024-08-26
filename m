Return-Path: <linux-media+bounces-16776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B495EEA6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6553E1C217B3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 10:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D910D14B06E;
	Mon, 26 Aug 2024 10:40:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E9D14A4E1;
	Mon, 26 Aug 2024 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668856; cv=none; b=Wyxcj8EZDjqy4KR8ccCLd2ylN+x8DVUJortQgG+wgAUwAYpF7HHlfMSM/esbmFPEg0DFdWzCZkP74adONvj/DvgzVdfHAr7QRorR4JgwEefkgPBA+xKQbRZx+GbtD/lkKVY+JJsEalW+isRzNmV8UyAd3ZPBk38DW793DVuAkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668856; c=relaxed/simple;
	bh=afyYNouRafrI1PVLHdus6keUfhP3xJW8Q5A0kSWXOIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NiS/U7mDPB1PfkOpitr+KcDpnj+wSrtdwzTGHiuHu5it0BJCqqqVqDU2Fz8PvFP21f0KRDzZWafOcrtG1lNwD5E5kaTglajQ1gQ+Exq2qqWWx1v2D5bQJ/BLTMoYJ7wvnaoTx86b34rOVsPcjO9U27SYf2zd5OV1fb6+D30mAYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 26 Aug
 2024 13:39:39 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Aug
 2024 13:39:38 +0300
Message-ID: <2417bf98-424b-4d37-ae36-8f5affaffb24@fintech.ru>
Date: Mon, 26 Aug 2024 03:39:35 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dvb-frontends: dib3000mb: fix uninit-value in
 dib3000_write_reg
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Patrick Boettcher <pb@linuxtv.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com>,
	<n.zhandarovich@fintech.ru>
References: <20240517155800.9881-1-n.zhandarovich@fintech.ru>
Content-Language: en-US
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <20240517155800.9881-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

On 5/17/24 08:58, Nikita Zhandarovich wrote:
> Syzbot reports [1] an uninitialized value issue found by KMSAN in
> dib3000_read_reg().
> 
> Local u8 rb[2] is used in i2c_transfer() as a read buffer; in case
> that call fails, the buffer may end up with some undefined values.
> 
> Since no elaborate error handling is expected in dib3000_write_reg(),
> simply zero out rb buffer to mitigate the problem.
> 
> [1] Syzkaller report
> dvb-usb: bulk message failed: -22 (6/0)
> =====================================================
> BUG: KMSAN: uninit-value in dib3000mb_attach+0x2d8/0x3c0 drivers/media/dvb-frontends/dib3000mb.c:758
>  dib3000mb_attach+0x2d8/0x3c0 drivers/media/dvb-frontends/dib3000mb.c:758
>  dibusb_dib3000mb_frontend_attach+0x155/0x2f0 drivers/media/usb/dvb-usb/dibusb-mb.c:31
>  dvb_usb_adapter_frontend_init+0xed/0x9a0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
>  dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:90 [inline]
>  dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:186 [inline]
>  dvb_usb_device_init+0x25a8/0x3760 drivers/media/usb/dvb-usb/dvb-usb-init.c:310
>  dibusb_probe+0x46/0x250 drivers/media/usb/dvb-usb/dibusb-mb.c:110
> ...
> Local variable rb created at:
>  dib3000_read_reg+0x86/0x4e0 drivers/media/dvb-frontends/dib3000mb.c:54
>  dib3000mb_attach+0x123/0x3c0 drivers/media/dvb-frontends/dib3000mb.c:758
> ...
> 
> Fixes: 74340b0a8bc6 ("V4L/DVB (4457): Remove dib3000-common-module")
> Reported-by: syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/media/dvb-frontends/dib3000mb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/dib3000mb.c b/drivers/media/dvb-frontends/dib3000mb.c
> index c598b2a63325..7c452ddd9e40 100644
> --- a/drivers/media/dvb-frontends/dib3000mb.c
> +++ b/drivers/media/dvb-frontends/dib3000mb.c
> @@ -51,7 +51,7 @@ MODULE_PARM_DESC(debug, "set debugging level (1=info,2=xfer,4=setfe,8=getfe (|-a
>  static int dib3000_read_reg(struct dib3000_state *state, u16 reg)
>  {
>  	u8 wb[] = { ((reg >> 8) | 0x80) & 0xff, reg & 0xff };
> -	u8 rb[2];
> +	u8 rb[2] = {};
>  	struct i2c_msg msg[] = {
>  		{ .addr = state->config.demod_address, .flags = 0,        .buf = wb, .len = 2 },
>  		{ .addr = state->config.demod_address, .flags = I2C_M_RD, .buf = rb, .len = 2 },


Gentle ping...

Regards,
Nikita

