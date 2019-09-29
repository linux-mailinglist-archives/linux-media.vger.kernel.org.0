Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDA0C19A1
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 23:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbfI2VkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 17:40:24 -0400
Received: from jp.dhs.org ([62.251.46.73]:59936 "EHLO jpvw.nl"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726390AbfI2VkY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 17:40:24 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1iEgvQ-0001uO-6a; Sun, 29 Sep 2019 23:40:16 +0200
Subject: Re: [PATCH 1/1] media: dvbsky: use a single mutex and state buffers
 for all R/W ops
To:     Andrei Koshkosh <andreykosh000@mail.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        =?UTF-8?Q?Stefan_Br=c3=bcns?= <stefan.bruens@rwth-aachen.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
References: <1569744245-23030-1-git-send-email-andreykosh000@mail.ru>
From:   JP <jp@jpvw.nl>
Message-ID: <fa7cfdba-42b3-bcc2-7e61-f4108c07529d@jpvw.nl>
Date:   Sun, 29 Sep 2019 23:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569744245-23030-1-git-send-email-andreykosh000@mail.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This works very well for me.
(and please see unrelated comment below)

On 9/29/19 10:04 AM, Andrei Koshkosh wrote:
> Signed-off-by: Andrei Koshkosh <andreykosh000@mail.ru>
> ---
>   drivers/media/usb/dvb-usb-v2/dvbsky.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> index c41e10b..6a118a0 100644
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> @@ -22,7 +22,6 @@ MODULE_PARM_DESC(disable_rc, "Disable inbuilt IR receiver.");
>   DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>   
>   struct dvbsky_state {
> -	struct mutex stream_mutex;
>   	u8 ibuf[DVBSKY_BUF_LEN];
>   	u8 obuf[DVBSKY_BUF_LEN];
>   	u8 last_lock;
> @@ -61,16 +60,18 @@ static int dvbsky_stream_ctrl(struct dvb_usb_device *d, u8 onoff)
>   {
>   	struct dvbsky_state *state = d_to_priv(d);
>   	int ret;
> -	u8 obuf_pre[3] = { 0x37, 0, 0 };
> -	u8 obuf_post[3] = { 0x36, 3, 0 };
> +	static u8 obuf_pre[3] = { 0x37, 0, 0 };
> +	static u8 obuf_post[3] = { 0x36, 3, 0 };
>   
> -	mutex_lock(&state->stream_mutex);
> -	ret = dvbsky_usb_generic_rw(d, obuf_pre, 3, NULL, 0);
> +	mutex_lock(&d->usb_mutex);
> +	memcpy(state->obuf, obuf_pre, 3);
> +	ret = dvb_usbv2_generic_write_locked(d, state->obuf, 3);
>   	if (!ret && onoff) {
>   		msleep(20);
> -		ret = dvbsky_usb_generic_rw(d, obuf_post, 3, NULL, 0);
> +		memcpy(state->obuf, obuf_post, 3);
> +		ret = dvb_usbv2_generic_write_locked(d, state->obuf, 3);
>   	}
> -	mutex_unlock(&state->stream_mutex);
> +	mutex_unlock(&d->usb_mutex);
>   	return ret;
>   }
>   
> @@ -599,7 +600,6 @@ static int dvbsky_init(struct dvb_usb_device *d)
>   	if (ret)
>   		return ret;
>   	*/
commented-out code has call to non-existing function.

> -	mutex_init(&state->stream_mutex);
>   
>   	state->last_lock = 0;
>   
Thanks,
Jan Pieter.
