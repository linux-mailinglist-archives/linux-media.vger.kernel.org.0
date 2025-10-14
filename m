Return-Path: <linux-media+bounces-44399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078FBD8E07
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C721424CBD
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDFB1D7E4A;
	Tue, 14 Oct 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSxnVfVQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A52FE566;
	Tue, 14 Oct 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439792; cv=none; b=Gjses00qXpqkCnji95NAhcF+XCEyiuYE6MqI+sfcC7LUiQo0c1GHMNDi+jeCztA2kaCCC5PcVdsI4X5VteWJs6i1CXi6L0mzIrSsJlczp/OzCm812odp8WGkA31Nrobpr1b60db014GB3n/9s1CB0SIYI0bPBDU33mHgyJqVGos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439792; c=relaxed/simple;
	bh=Ft+QUhp4GEql2Vv7pwZhfod9Y5RmF9GxI4x25ijGMbU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ermN62bvg+IANBSARor+j3iEW7/DyKv5JB3+hyjTge3Vk1pTsgswY8+nOCe0S+VsDEkKQ5jfJucbWhlUmyyo9Ue7zTlGtnOwkHGtPeIuzCMT/xn9FUZUxNW26R2yd3gGeC4rrMWWSJI/gj8wyco5b3zr9cZ9VJjZProyD5TJWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSxnVfVQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE63C4CEE7;
	Tue, 14 Oct 2025 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760439792;
	bh=Ft+QUhp4GEql2Vv7pwZhfod9Y5RmF9GxI4x25ijGMbU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ZSxnVfVQP5WNnXg45rAaeaBZsEcvcgYyO3ThVyjv+e5LRWJc+h7wrKZs7GbXURvxU
	 6qkmUNB8EWNA11k6x4n2sAspdgPNk9JgMBQPN3haU8UiCCia5s19ueZouSxg2nssTl
	 iIhx0JWR0J5yzlYVACgopFAR105i/gbNLZxR9TH72cY3oy5hF8wZ6p+FXVrJwuwIwp
	 s1W6S4uxc+tMTHVZZyzz3jyUFPcaxWKicm6TaNUjO/htds/2yEAp8KR6cXwN/MM4zA
	 ztfuOVyD/eSZ5l8AJSCgF5qMpDxK+Juz/eL8pR2QYXZo31vUu+8kyfDNxOBzg1Fffk
	 ODfe021fNkWFg==
Message-ID: <73945f29-7b1e-4738-ae50-1ae2a9c5c1df@kernel.org>
Date: Tue, 14 Oct 2025 13:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v2 1/2] media: az6007: fix out-of-bounds in
 az6007_i2c_xfer()
To: Jeongjun Park <aha310510@gmail.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
References: <20250908150730.24560-1-aha310510@gmail.com>
 <20250908150730.24560-2-aha310510@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250908150730.24560-2-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/09/2025 17:07, Jeongjun Park wrote:
> Because the blen is not properly bounds-checked in __az6007_read/write,
> it is easy to get out-of-bounds errors in az6007_i2c_xfer later.
> 
> Therefore, we need to add bounds-checking to __az6007_read/write to
> resolve this.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
> Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v2: Change to fix the root cause of oob
> - Link to v1: https://lore.kernel.org/all/20250421105555.34984-1-aha310510@gmail.com/
> ---
>  drivers/media/usb/dvb-usb-v2/az6007.c | 62 +++++++++++++++------------
>  1 file changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> index 65ef045b74ca..4202042bdb55 100644
> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> @@ -97,11 +97,17 @@ static struct mt2063_config az6007_mt2063_config = {
>  	.refclock = 36125000,
>  };
>  
> -static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
> -			    u16 index, u8 *b, int blen)
> +static int __az6007_read(struct usb_device *udev, struct az6007_device_state *st,
> +			    u8 req, u16 value, u16 index, u8 *b, int blen)
>  {
>  	int ret;
>  
> +	if (blen > sizeof(st->data)) {
> +		pr_err("az6007: tried to read %d bytes, but I2C max size is %lu bytes\n",
> +		       blen, sizeof(st->data));
> +		return -EOPNOTSUPP;
> +	}
> +

Hmm, but the pointer 'b' doesn't always point to st->data, so it makes no sense to
check against it.

>  	ret = usb_control_msg(udev,
>  			      usb_rcvctrlpipe(udev, 0),
>  			      req,
> @@ -125,24 +131,30 @@ static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
>  static int az6007_read(struct dvb_usb_device *d, u8 req, u16 value,
>  			    u16 index, u8 *b, int blen)
>  {
> -	struct az6007_device_state *st = d->priv;
> +	struct az6007_device_state *st = d_to_priv(d);
>  	int ret;
>  
>  	if (mutex_lock_interruptible(&st->mutex) < 0)
>  		return -EAGAIN;
>  
> -	ret = __az6007_read(d->udev, req, value, index, b, blen);
> +	ret = __az6007_read(d->udev, st, req, value, index, b, blen);
>  
>  	mutex_unlock(&st->mutex);
>  
>  	return ret;
>  }
>  
> -static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
> -			     u16 index, u8 *b, int blen)
> +static int __az6007_write(struct usb_device *udev, struct az6007_device_state *st,
> +			    u8 req, u16 value, u16 index, u8 *b, int blen)
>  {
>  	int ret;
>  
> +	if (blen > sizeof(st->data)) {
> +		pr_err("az6007: tried to write %d bytes, but I2C max size is %lu bytes\n",
> +		       blen, sizeof(st->data));
> +		return -EOPNOTSUPP;
> +	}
> +

This makes no sense...

>  	if (az6007_xfer_debug) {
>  		printk(KERN_DEBUG "az6007: OUT req: %02x, value: %04x, index: %04x\n",
>  		       req, value, index);
> @@ -150,12 +162,6 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
>  				     DUMP_PREFIX_NONE, b, blen);
>  	}
>  
> -	if (blen > 64) {
> -		pr_err("az6007: tried to write %d bytes, but I2C max size is 64 bytes\n",
> -		       blen);
> -		return -EOPNOTSUPP;
> -	}
> -

...since it is capped at 64 bytes anyway. So just keep this check since it is more stringent
than sizeof(st->data).

Also, 'b' doesn't always point to st->data, so it makes no sense.

I think this is all overkill.

There are only a few places in this driver where you are reading or writing to/from a
buffer. In most cases the length is hardcoded and clearly fits inside the buffer.

Only is a few places do you need to check that the length <= sizeof(st->data), and
that should just be added as an extra check.

Note that the msg buffers (msg[i].buf) passed to az6007_i2c_xfer are guaranteed to
have the right size for the length (msg[i].len). So you only need to check when
using st->data as the buffer.

Sorry for basically going back to the first patch (almost).

Regards,

	Hans

>  	ret = usb_control_msg(udev,
>  			      usb_sndctrlpipe(udev, 0),
>  			      req,
> @@ -172,13 +178,13 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
>  static int az6007_write(struct dvb_usb_device *d, u8 req, u16 value,
>  			    u16 index, u8 *b, int blen)
>  {
> -	struct az6007_device_state *st = d->priv;
> +	struct az6007_device_state *st = d_to_priv(d);
>  	int ret;
>  
>  	if (mutex_lock_interruptible(&st->mutex) < 0)
>  		return -EAGAIN;
>  
> -	ret = __az6007_write(d->udev, req, value, index, b, blen);
> +	ret = __az6007_write(d->udev, st, req, value, index, b, blen);
>  
>  	mutex_unlock(&st->mutex);
>  
> @@ -775,7 +781,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			value = addr | (1 << 8);
>  			length = 6 + msgs[i + 1].len;
>  			len = msgs[i + 1].len;
> -			ret = __az6007_read(d->udev, req, value, index,
> +			ret = __az6007_read(d->udev, st, req, value, index,
>  					    st->data, length);
>  			if (ret >= len) {
>  				for (j = 0; j < len; j++)
> @@ -788,7 +794,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			if (az6007_xfer_debug)
>  				printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
>  				       addr, msgs[i].len);
> -			if (msgs[i].len < 1) {
> +			if (msgs[i].len < 1 && msgs[i].len > 64) {
>  				ret = -EIO;
>  				goto err;
>  			}
> @@ -796,11 +802,8 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			index = msgs[i].buf[0];
>  			value = addr | (1 << 8);
>  			length = msgs[i].len - 1;
> -			len = msgs[i].len - 1;
> -			for (j = 0; j < len; j++)
> -				st->data[j] = msgs[i].buf[j + 1];
> -			ret =  __az6007_write(d->udev, req, value, index,
> -					      st->data, length);
> +			ret =  __az6007_write(d->udev, st, req, value, index,
> +					      &msgs[i].buf[1], length);
>  		} else {
>  			/* read bytes */
>  			if (az6007_xfer_debug)
> @@ -815,10 +818,12 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			value = addr;
>  			length = msgs[i].len + 6;
>  			len = msgs[i].len;
> -			ret = __az6007_read(d->udev, req, value, index,
> +			ret = __az6007_read(d->udev, st, req, value, index,
>  					    st->data, length);
> -			for (j = 0; j < len; j++)
> -				msgs[i].buf[j] = st->data[j + 5];
> +			if (ret >= len) {
> +				for (j = 0; j < len; j++)
> +					msgs[i].buf[j] = st->data[j + 5];
> +			}
>  		}
>  		if (ret < 0)
>  			goto err;
> @@ -845,6 +850,7 @@ static const struct i2c_algorithm az6007_i2c_algo = {
>  
>  static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
>  {
> +	struct az6007_device_state *state = d_to_priv(d);
>  	int ret;
>  	u8 *mac;
>  
> @@ -855,7 +861,7 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
>  		return -ENOMEM;
>  
>  	/* Try to read the mac address */
> -	ret = __az6007_read(d->udev, AZ6007_READ_DATA, 6, 0, mac, 6);
> +	ret = __az6007_read(d->udev, state, AZ6007_READ_DATA, 6, 0, mac, 6);
>  	if (ret == 6)
>  		ret = WARM;
>  	else
> @@ -864,9 +870,9 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
>  	kfree(mac);
>  
>  	if (ret == COLD) {
> -		__az6007_write(d->udev, 0x09, 1, 0, NULL, 0);
> -		__az6007_write(d->udev, 0x00, 0, 0, NULL, 0);
> -		__az6007_write(d->udev, 0x00, 0, 0, NULL, 0);
> +		__az6007_write(d->udev, state, 0x09, 1, 0, NULL, 0);
> +		__az6007_write(d->udev, state, 0x00, 0, 0, NULL, 0);
> +		__az6007_write(d->udev, state, 0x00, 0, 0, NULL, 0);
>  	}
>  
>  	pr_debug("Device is on %s state\n",
> --
> 


