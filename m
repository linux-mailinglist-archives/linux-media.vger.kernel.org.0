Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF5410238F
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfKSLtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:49:01 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45311 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfKSLtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:49:01 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iX20A-0001XC-U5; Tue, 19 Nov 2019 12:48:58 +0100
Message-ID: <409e5b53516fbf5daa752211d90f1fbba2f1c3b2.camel@pengutronix.de>
Subject: Re: [PATCH 5/5] input/rmi4/rmi_smbus.c: don't increment rmiaddr in
 rmi_smb_read_block()
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Date:   Tue, 19 Nov 2019 12:48:58 +0100
In-Reply-To: <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
         <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
> This increment of rmi_smbus causes garbage to be returned.
> The first read of SMB_MAX_COUNT bytes is fine, but after that
> it is nonsense. Trial-and-error showed that by dropping the
> increment of rmiaddr everything is fine and the F54 function
> properly works.
> 
> Even going back to the original code when F54 was added, I
> could not make it work without this patch. So I do not understand
> how this ever worked.

My guess is that F54 has mostly been tested with touchscreens that are
connected to a regular i2c bus, not smbus. i2c has a separate transport
implementation in rmi4. Most of the other functions are probably
reading much smaller block data than F54.

Regards,
Lucas

> My guess is that the same change is needed in rmi_smb_write_block,
> but I wouldn't know how to test this.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/input/rmi4/rmi_smbus.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
> index 2407ea43de59..79ecea5edacc 100644
> --- a/drivers/input/rmi4/rmi_smbus.c
> +++ b/drivers/input/rmi4/rmi_smbus.c
> @@ -215,7 +215,6 @@ static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,
>  		/* prepare to read next block of bytes */
>  		cur_len -= SMB_MAX_COUNT;
>  		databuff += SMB_MAX_COUNT;
> -		rmiaddr += SMB_MAX_COUNT;
>  	}
>  
>  	retval = 0;

