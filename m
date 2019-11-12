Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D64AF8C37
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfKLJur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:50:47 -0500
Received: from gofer.mess.org ([88.97.38.141]:35051 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbfKLJur (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:50:47 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 796BEC633D; Tue, 12 Nov 2019 09:50:46 +0000 (GMT)
Date:   Tue, 12 Nov 2019 09:50:46 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        syzbot+ec869945d3dde5f33b43@syzkaller.appspotmail.com
Subject: Re: [PATCH 3/5] dvb-usb/vp7045: initialize br[]
Message-ID: <20191112095046.GB19449@gofer.mess.org>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
 <20191112092228.15800-4-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112092228.15800-4-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 10:22:26AM +0100, Hans Verkuil wrote:
> The br[] array was uninitialized, leading to a syzbot error.
> 
> Syzbot link:
> 
> https://syzkaller.appspot.com/bug?extid=ec869945d3dde5f33b43
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: syzbot+ec869945d3dde5f33b43@syzkaller.appspotmail.com
> CC: Sean Young <sean@mess.org>
> ---

The value is unintialized because the usb transfer failed. My solution
actually returns an error.

https://patchwork.linuxtv.org/patch/59985/

Note that in both cases the error won't be fatal, but should be reported.

Sean

>  drivers/media/usb/dvb-usb/vp7045.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/vp7045.c b/drivers/media/usb/dvb-usb/vp7045.c
> index 80c1cf05384b..3e87adca5be9 100644
> --- a/drivers/media/usb/dvb-usb/vp7045.c
> +++ b/drivers/media/usb/dvb-usb/vp7045.c
> @@ -116,7 +116,7 @@ static int vp7045_rc_query(struct dvb_usb_device *d)
>  static int vp7045_read_eeprom(struct dvb_usb_device *d,u8 *buf, int len, int offset)
>  {
>  	int i = 0;
> -	u8 v,br[2];
> +	u8 v, br[2] = { 0 };
>  	for (i=0; i < len; i++) {
>  		v = offset + i;
>  		vp7045_usb_op(d,GET_EE_VALUE,&v,1,br,2,5);
> -- 
> 2.24.0
