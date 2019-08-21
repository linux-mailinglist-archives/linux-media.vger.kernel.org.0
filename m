Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4F5097779
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 12:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfHUKoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 06:44:12 -0400
Received: from gofer.mess.org ([88.97.38.141]:56295 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727091AbfHUKoL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 06:44:11 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CE6D660628; Wed, 21 Aug 2019 11:44:08 +0100 (BST)
Date:   Wed, 21 Aug 2019 11:44:08 +0100
From:   Sean Young <sean@mess.org>
To:     Hui Peng <benquike@gmail.com>
Cc:     security@kernel.org, Mathias Payer <mathias.payer@nebelwelt.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kees Cook <keescook@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix an OOB access bug in technisat_usb2_get_ir
Message-ID: <20190821104408.w7krumcglxo6fz5q@gofer.mess.org>
References: <20190820181921.7921-1-benquike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820181921.7921-1-benquike@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 20, 2019 at 02:19:16PM -0400, Hui Peng wrote:
> In the while loop of technisat_usb2_get_ir, it scans through
> a fix-sized buffer read from the device side, the termination
> condition of the loop is `*b == 0xff`. If no `0xff` byte is read
> from the device side, OOB access happens.
> 
> This patch fixes the bug by adding an upper bound in the while loop.

This issue was fixed in:

 https://git.linuxtv.org/media_tree.git/commit/drivers/media/usb/dvb-usb/technisat-usb2.c?id=0c4df39e504bf925ab666132ac3c98d6cbbe380b

Note this limits the loop to the size of the buffer; using the ret
return value might be better.


Sean


> 
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..181f5f97af45 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -612,6 +612,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  	u8 *b;
>  	int ret;
>  	struct ir_raw_event ev;
> +	int i = 0;
>  
>  	buf[0] = GET_IR_DATA_VENDOR_REQUEST;
>  	buf[1] = 0x08;
> @@ -656,11 +657,15 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  
>  	ev.pulse = 0;
>  	while (1) {
> +		// only `ret` bytes are read from the device side
> +		if (i >= ret)
> +			break;
>  		ev.pulse = !ev.pulse;
>  		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>  		ir_raw_event_store(d->rc_dev, &ev);
>  
>  		b++;
> +		i++;
>  		if (*b == 0xff) {
>  			ev.pulse = 0;
>  			ev.duration = 888888*2;
> -- 
> 2.23.0
