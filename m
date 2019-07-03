Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4439E5E9CA
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfGCQy4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:54:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40180 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCQy4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 12:54:56 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so1560976pfp.7
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SAY0amyE2Le4CyRf/M2v6oYWQ4N8iwUB+uF3qxE7p4s=;
        b=LxW0O6NASNYmXqS6GCTjlREr+OW2pCXAUJdGE6E11w8Tzy+2UfI3pzLLQqhJR74lXP
         IuvuAI11249k4LCnN6teUmOqhgDzx/MS86qvjZOSnek52xlE0Z1WdBZvLb56kkE6MAhe
         SBukzwUj7S54usIaWbExAJPEsxipeviTlbdRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAY0amyE2Le4CyRf/M2v6oYWQ4N8iwUB+uF3qxE7p4s=;
        b=RVEAWlsS7CyrC7b3eEdDx4IpxvxLuiFCHpkC6/K6cwc1qeSZvP04qGlkRfOfFYplRg
         LVl3CgcPy1atYXiB/Jt1Rf81Ona5vcEfn+XFRjlRyrv8OJ1zYo/QmvrndE19B5eSG7Aw
         y8KRvWRoPBUYwYuY4E8y0yCRgkyYDOw13fmVRkz92AJcqKwCIP2vmLGyyA+fectjCwe0
         yabpNSIcE0hsSE+UvwnSJmYXjjDjIljiIXDmwzL9Q94rAuRQR0njGy90P2peukHx8msD
         /y0+rRYgRC1x2uuztCyBhmuUVkAjRoQZoFMqvBlt7BdP2zxjNMhTchZHVEKb1DVq4xYK
         wqkA==
X-Gm-Message-State: APjAAAVNrNBDiyJDUixQkLkbQYlZpDD4pKUXlDLkq2nT8uwxFP8iY2NR
        KeNFsZv3k9bwZZ0EYAjDsG72jA==
X-Google-Smtp-Source: APXvYqyLgi9krRt3ZPCrgU/i7YIqugVukRVgfDkFQ1hvSYQ/MFSgnwX6+macNWXOWe/veIvW2qu+gg==
X-Received: by 2002:a17:90a:bf08:: with SMTP id c8mr13856470pjs.75.1562172895803;
        Wed, 03 Jul 2019 09:54:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h26sm7705332pfq.64.2019.07.03.09.54.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 09:54:54 -0700 (PDT)
Date:   Wed, 3 Jul 2019 09:54:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sean Young <sean@mess.org>
Cc:     syzbot <syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com,
        Phong Tran <tranmanphong@gmail.com>
Subject: Re: [PATCH] media: technisat-usb2: break out of loop at end of buffer
Message-ID: <201907030953.BD9D84DF0@keescook>
References: <000000000000089d7f058683115e@google.com>
 <20190703145239.ridwf2jegipnoxfz@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703145239.ridwf2jegipnoxfz@gofer.mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 03, 2019 at 03:52:39PM +0100, Sean Young wrote:
> Ensure we do not access the buffer beyond the end if no 0xff byte
> is encountered.
> 
> Reported-by: syzbot+eaaaf38a95427be88f4b@syzkaller.appspotmail.com
> Signed-off-by: Sean Young <sean@mess.org>

Both you and Phong Tran appear to be working on fixing this. At a
glance, this patch appears to be more complete in that it makes the code
flow more sane too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..676d233d46d5 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -608,10 +608,9 @@ static int technisat_usb2_frontend_attach(struct dvb_usb_adapter *a)
>  static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  {
>  	struct technisat_usb2_state *state = d->priv;
> -	u8 *buf = state->buf;
> -	u8 *b;
> -	int ret;
>  	struct ir_raw_event ev;
> +	u8 *buf = state->buf;
> +	int i, ret;
>  
>  	buf[0] = GET_IR_DATA_VENDOR_REQUEST;
>  	buf[1] = 0x08;
> @@ -647,26 +646,25 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  		return 0; /* no key pressed */
>  
>  	/* decoding */
> -	b = buf+1;
>  
>  #if 0
>  	deb_rc("RC: %d ", ret);
> -	debug_dump(b, ret, deb_rc);
> +	debug_dump(buf + 1, ret, deb_rc);
>  #endif
>  
>  	ev.pulse = 0;
> -	while (1) {
> -		ev.pulse = !ev.pulse;
> -		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
> -		ir_raw_event_store(d->rc_dev, &ev);
> -
> -		b++;
> -		if (*b == 0xff) {
> +	for (i = 1; i < ARRAY_SIZE(state->buf); i++) {
> +		if (buf[i] == 0xff) {
>  			ev.pulse = 0;
>  			ev.duration = 888888*2;
>  			ir_raw_event_store(d->rc_dev, &ev);
>  			break;
>  		}
> +
> +		ev.pulse = !ev.pulse;
> +		ev.duration = (buf[i] * FIRMWARE_CLOCK_DIVISOR *
> +			       FIRMWARE_CLOCK_TICK) / 1000;
> +		ir_raw_event_store(d->rc_dev, &ev);
>  	}
>  
>  	ir_raw_event_handle(d->rc_dev);
> -- 
> 2.21.0
> 

-- 
Kees Cook
