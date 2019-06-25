Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8505754EDF
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 14:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFYM3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 08:29:50 -0400
Received: from gofer.mess.org ([88.97.38.141]:51013 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727661AbfFYM3u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 08:29:50 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 122E160E3B; Tue, 25 Jun 2019 13:29:49 +0100 (BST)
Date:   Tue, 25 Jun 2019 13:29:48 +0100
From:   Sean Young <sean@mess.org>
To:     Andrei Koshkosh <andreykosh000@mail.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvbsky: use a single mutex and state buffers for
 all R/W ops
Message-ID: <20190625122948.3ktliary5towfxym@gofer.mess.org>
References: <1560584848-10278-1-git-send-email-andreykosh000@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560584848-10278-1-git-send-email-andreykosh000@mail.ru>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 15, 2019 at 10:47:28AM +0300, Andrei Koshkosh wrote:
> ---
>  drivers/media/usb/dvb-usb-v2/dvbsky.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 

Missing signed-off-by. Please read:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> index c41e10b..0b5da891 100644
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> @@ -22,7 +22,7 @@ MODULE_PARM_DESC(disable_rc, "Disable inbuilt IR receiver.");
>  DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  
>  struct dvbsky_state {
> -	struct mutex stream_mutex;
> +	//struct mutex stream_mutex;

Please remove rather comment out.


>  	u8 ibuf[DVBSKY_BUF_LEN];
>  	u8 obuf[DVBSKY_BUF_LEN];
>  	u8 last_lock;
> @@ -61,16 +61,18 @@ static int dvbsky_stream_ctrl(struct dvb_usb_device *d, u8 onoff)
>  {
>  	struct dvbsky_state *state = d_to_priv(d);
>  	int ret;
> -	u8 obuf_pre[3] = { 0x37, 0, 0 };
> -	u8 obuf_post[3] = { 0x36, 3, 0 };
> +	static u8 obuf_pre[3] = { 0x37, 0, 0 };
> +	static u8 obuf_post[3] = { 0x36, 3, 0 };

Can these be const?
>
> -	mutex_lock(&state->stream_mutex);
> -	ret = dvbsky_usb_generic_rw(d, obuf_pre, 3, NULL, 0);
> +	mutex_lock(&d->usb_mutex);
> +	memcpy(state->obuf, obuf_pre, 3);
> +	ret = dvb_usbv2_generic_write_locked(d, state->obuf, 3);
>  	if (!ret && onoff) {
>  		msleep(20);
> -		ret = dvbsky_usb_generic_rw(d, obuf_post, 3, NULL, 0);
> +		memcpy(state->obuf, obuf_post, 3);
> +		ret = dvb_usbv2_generic_write_locked(d, state->obuf, 3);
>  	}
> -	mutex_unlock(&state->stream_mutex);
> +	mutex_unlock(&d->usb_mutex);
>  	return ret;
>  }
>  
> @@ -599,7 +601,7 @@ static int dvbsky_init(struct dvb_usb_device *d)
>  	if (ret)
>  		return ret;
>  	*/
> -	mutex_init(&state->stream_mutex);
> +	//mutex_init(&state->stream_mutex);

Remove.

>  
>  	state->last_lock = 0;
>  
> -- 
> 2.7.4

Thanks,
Sean
