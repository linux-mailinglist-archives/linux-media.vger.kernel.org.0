Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B386C13CB0E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 18:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgAORc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 12:32:29 -0500
Received: from gofer.mess.org ([88.97.38.141]:59357 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbgAORc3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 12:32:29 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DD9FE11A001; Wed, 15 Jan 2020 17:32:26 +0000 (GMT)
Date:   Wed, 15 Jan 2020 17:32:26 +0000
From:   Sean Young <sean@mess.org>
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de,
        syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        glider@google.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: check return value digitv_ctrl_msg
Message-ID: <20200115173226.GA24471@gofer.mess.org>
References: <0000000000004f3d820596d8c51c@google.com>
 <20191203004138.21223-1-tranmanphong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203004138.21223-1-tranmanphong@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Dec 03, 2019 at 07:41:38AM +0700, Phong Tran wrote:
> For fixing syzbot "KMSAN: uninit-value in digitv_rc_query"
> 
> In scenario testing for syzbot, failure reading from
> digitv_ctrl_msg() [1].
> 
> Eg:
> [   91.846657][ T3844] dvb-usb: bulk message failed: -22 (7/0)
> 
> digitv_rc_query() always return 0. But in this case a wrong thing happens.
> 
> Reported-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
> Tested-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com

A fix for this was already merged I'm afraid, see commit eecc70d22ae5
("media: digitv: don't continue if remote control state can't be read").

> [1]: https://syzkaller.appspot.com/text?tag=CrashLog&x=16860a63600000
> [2]: https://groups.google.com/d/msg/syzkaller-bugs/-TXIJAZ0J9Q/T4PEUQoeAQAJ
> 
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/digitv.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
> index dd5bb230cec1..61bc8945e6b9 100644
> --- a/drivers/media/usb/dvb-usb/digitv.c
> +++ b/drivers/media/usb/dvb-usb/digitv.c
> @@ -231,17 +231,21 @@ static struct rc_map_table rc_map_digitv_table[] = {
>  static int digitv_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
>  {
>  	int i;
> -	u8 key[5];
> +	u8 key[5] = { 0 };

The merged commit does not change this line. Why was this changed?

Thanks

Sean

>  	u8 b[4] = { 0 };
> +	int ret;
>  
>  	*event = 0;
>  	*state = REMOTE_NO_KEY_PRESSED;
>  
> -	digitv_ctrl_msg(d,USB_READ_REMOTE,0,NULL,0,&key[1],4);
> -
> +	ret = digitv_ctrl_msg(d, USB_READ_REMOTE, 0, NULL, 0, &key[1], 4);
> +	if (ret < 0)
> +		return ret;
>  	/* Tell the device we've read the remote. Not sure how necessary
>  	   this is, but the Nebula SDK does it. */
> -	digitv_ctrl_msg(d,USB_WRITE_REMOTE,0,b,4,NULL,0);
> +	ret = digitv_ctrl_msg(d, USB_WRITE_REMOTE, 0, b, 4, NULL, 0);
> +	if (ret < 0)
> +		return ret;
>  
>  	/* if something is inside the buffer, simulate key press */
>  	if (key[1] != 0)
> -- 
> 2.20.1
