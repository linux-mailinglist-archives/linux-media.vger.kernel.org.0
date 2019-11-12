Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2F9F8C2F
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfKLJtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:49:06 -0500
Received: from gofer.mess.org ([88.97.38.141]:44023 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfKLJtF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:49:05 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A3787C633D; Tue, 12 Nov 2019 09:49:04 +0000 (GMT)
Date:   Tue, 12 Nov 2019 09:49:04 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/5] dvb-usb/af9005: initialize act_len
Message-ID: <20191112094904.GA19449@gofer.mess.org>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
 <20191112092228.15800-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112092228.15800-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 10:22:25AM +0100, Hans Verkuil wrote:
> The act_len variable was uninitialized, leading to a syzbot
> error.
> 
> Syzbot link:
> 
> https://syzkaller.appspot.com/bug?extid=9d42b7773d2fecd983ab
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-and-tested-by: syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com
> CC: Sean Young <sean@mess.org>

This is the same as:

https://patchwork.linuxtv.org/patch/59986/

Sean

> ---
>  drivers/media/usb/dvb-usb/af9005.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
> index ac93e88d7038..89b4b5d84cdf 100644
> --- a/drivers/media/usb/dvb-usb/af9005.c
> +++ b/drivers/media/usb/dvb-usb/af9005.c
> @@ -554,7 +554,7 @@ static int af9005_boot_packet(struct usb_device *udev, int type, u8 *reply,
>  			      u8 *buf, int size)
>  {
>  	u16 checksum;
> -	int act_len, i, ret;
> +	int act_len = 0, i, ret;
>  
>  	memset(buf, 0, size);
>  	buf[0] = (u8) (FW_BULKOUT_SIZE & 0xff);
> -- 
> 2.24.0
