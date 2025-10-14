Return-Path: <linux-media+bounces-44389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E162BD8C57
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A80F1922A9A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F7B2F6193;
	Tue, 14 Oct 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqHNndW3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA22EA720;
	Tue, 14 Oct 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437782; cv=none; b=b6aN3RcKG0mjcXESY3ro4iX1ALSWov7HBOH7lVWl6BPnyo8WnjlMzJU9CMlOlFHzaehHoHwSs2vf39fk1EZd//Sn5Bt1N3oZddJclUf/0fB59jEN96cwhHOuYSZ6NmBUQD8z3HTtmKjVkWAcPRrQIeBioOrQKZT5GglyQYBX1mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437782; c=relaxed/simple;
	bh=E1jd3FCeCJCpobMOmX+i/2X+14vARAFZp8J4A6jMGJ8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HZHGBESvAxCjM7B1lOFP6EzdzxecxVCdbmSDEDc4X3GZ6RG8XonlzmkafLTB9z3lnbWiPLl3rBk5omHiv8/nExCjQeARjP8i48Y6KlQE6VL3V3D3o9pJX2rKWfBU3rJdKnEm1I0iVHVeQAmFYgA87Fp9prcv7hXeh72inbl6zi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqHNndW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449FCC4CEE7;
	Tue, 14 Oct 2025 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760437781;
	bh=E1jd3FCeCJCpobMOmX+i/2X+14vARAFZp8J4A6jMGJ8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=EqHNndW3oDYfNAjZxmu4zy4pjGTsKJqKMOkLC+GEwJFHDuzwjpzRia+uHELkhzCnZ
	 GfxMx2/s9CDWnht7EWpyq0p4y5QgjQvCFxnnrLBFSBtCPi/Gd1Aoo6NRhRjvFC7bKo
	 ACoLf7gqPnwdlOcyJ8ff0wP43IK2rWnXeEEOU2GUJDsUsT1EvoSbrXeeHvrxE1RmZt
	 GXj4QGmFHLG8xreW6wiwxhPx2U26tSj9/ifLqxcguxaqQd1Pxw1ST7ZcXbjJVc973u
	 KqmEET9LWIJoMwZ53cy/s5Ww9HRJsSvksavo0eWKTIayTH20FIwUqIMEAsZTDLjNy6
	 GQi1xpOqgH4BA==
Message-ID: <1b41205e-9af2-487f-889c-d6fb328dfbb2@kernel.org>
Date: Tue, 14 Oct 2025 12:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: dvb-usb: az6027: fix out-of-bounds in
 az6027_i2c_xfer()
To: Jeongjun Park <aha310510@gmail.com>, mchehab@kernel.org,
 hverkuil@kernel.org
Cc: christophe.jaillet@wanadoo.fr, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250907135335.308595-1-aha310510@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250907135335.308595-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2025 15:53, Jeongjun Park wrote:
> msg[i].len is a user-controlled value, the current implementation easily
> causes out-of-bounds errors in az6027_i2c_xfer().
> 
> Therefore, to prevent this, we need to strengthen bounds checking through
> a comprehensive refactoring of az6027_usb_in_op/az6027_usb_out_op/
> az6027_i2c_xfer.
> 
> Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v2: Change to fix the root cause of oob
> - Link to v1: https://lore.kernel.org/all/20250421115045.81394-1-aha310510@gmail.com/
> ---
>  drivers/media/usb/dvb-usb/az6027.c | 105 ++++++++++++++++++++---------
>  1 file changed, 72 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
> index 056935d3cbd6..c021362e9b8a 100644
> --- a/drivers/media/usb/dvb-usb/az6027.c
> +++ b/drivers/media/usb/dvb-usb/az6027.c
> @@ -296,12 +296,19 @@ static struct stb6100_config az6027_stb6100_config = {
>  
>  /* check for mutex FIXME */
>  static int az6027_usb_in_op(struct dvb_usb_device *d, u8 req,
> -			    u16 value, u16 index, u8 *b, int blen)
> +			    u16 value, u16 index, u8 *b, int blen, int buf_size)
>  {
>  	int ret = -1;
>  	if (mutex_lock_interruptible(&d->usb_mutex))
>  		return -EAGAIN;
>  
> +	if (blen > buf_size) {
> +		err("usb in %d bytes, but max size is %d bytes\n",
> +			blen, buf_size);
> +		ret = -EOPNOTSUPP;
> +		goto end_unlock;
> +	}
> +
>  	ret = usb_control_msg(d->udev,
>  			      usb_rcvctrlpipe(d->udev, 0),
>  			      req,
> @@ -321,6 +328,7 @@ static int az6027_usb_in_op(struct dvb_usb_device *d, u8 req,
>  	deb_xfer("in: req. %02x, val: %04x, ind: %04x, buffer: ", req, value, index);
>  	debug_dump(b, blen, deb_xfer);
>  
> +end_unlock:
>  	mutex_unlock(&d->usb_mutex);
>  	return ret;
>  }
> @@ -330,16 +338,24 @@ static int az6027_usb_out_op(struct dvb_usb_device *d,
>  			     u16 value,
>  			     u16 index,
>  			     u8 *b,
> -			     int blen)
> +			     int blen,
> +			     int buf_size)
>  {
>  	int ret;
>  
> -	deb_xfer("out: req. %02x, val: %04x, ind: %04x, buffer: ", req, value, index);
> -	debug_dump(b, blen, deb_xfer);
> -
>  	if (mutex_lock_interruptible(&d->usb_mutex))
>  		return -EAGAIN;
>  
> +	if (blen > buf_size) {
> +		err("usb out %d bytes, but max size is %d bytes\n",
> +			blen, buf_size);
> +		ret = -EOPNOTSUPP;
> +		goto end_unlock;
> +	}
> +
> +	deb_xfer("out: req. %02x, val: %04x, ind: %04x, buffer: ", req, value, index);
> +	debug_dump(b, blen, deb_xfer);
> +
>  	ret = usb_control_msg(d->udev,
>  			      usb_sndctrlpipe(d->udev, 0),
>  			      req,
> @@ -350,6 +366,7 @@ static int az6027_usb_out_op(struct dvb_usb_device *d,
>  			      blen,
>  			      2000);
>  
> +end_unlock:
>  	if (ret != blen) {
>  		warn("usb out operation failed. (%d)", ret);
>  		mutex_unlock(&d->usb_mutex);
> @@ -375,7 +392,7 @@ static int az6027_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
>  	index = 0;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
>  	if (ret != 0)
>  		warn("usb out operation failed. (%d)", ret);
>  
> @@ -399,7 +416,7 @@ static int az6027_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
>  int az6027_power_ctrl(struct dvb_usb_device *d, int onoff)
>  {
>  	u8 v = onoff;
> -	return az6027_usb_out_op(d,0xBC,v,3,NULL,1);
> +	return az6027_usb_out_op(d,0xBC,v,3,NULL,1,0);

Hmm, this will now just fail, right? Since 1 > 0. I wonder if this is a bug and the '1' should
be '0'? Or if the USB core will just ignore the length if the buffer is NULL.

I'm not familiar enough with that to be sure.

>  }
>  */
>  
> @@ -431,7 +448,7 @@ static int az6027_ci_read_attribute_mem(struct dvb_ca_en50221 *ca,
>  	index = 0;
>  	blen = 1;
>  
> -	ret = az6027_usb_in_op(d, req, value, index, b, blen);
> +	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
>  	if (ret < 0) {
>  		warn("usb in operation failed. (%d)", ret);
>  		ret = -EINVAL;
> @@ -468,7 +485,7 @@ static int az6027_ci_write_attribute_mem(struct dvb_ca_en50221 *ca,
>  	index = value;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen);
> +	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen, 0);
>  	if (ret != 0)
>  		warn("usb out operation failed. (%d)", ret);
>  
> @@ -504,7 +521,7 @@ static int az6027_ci_read_cam_control(struct dvb_ca_en50221 *ca,
>  	index = 0;
>  	blen = 2;
>  
> -	ret = az6027_usb_in_op(d, req, value, index, b, blen);
> +	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
>  	if (ret < 0) {
>  		warn("usb in operation failed. (%d)", ret);
>  		ret = -EINVAL;
> @@ -544,7 +561,7 @@ static int az6027_ci_write_cam_control(struct dvb_ca_en50221 *ca,
>  	index = value;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen);
> +	ret = az6027_usb_out_op(d, req, value1, index, NULL, blen, 0);
>  	if (ret != 0) {
>  		warn("usb out operation failed. (%d)", ret);
>  		goto failed;
> @@ -575,7 +592,7 @@ static int CI_CamReady(struct dvb_ca_en50221 *ca, int slot)
>  	index = 0;
>  	blen = 1;
>  
> -	ret = az6027_usb_in_op(d, req, value, index, b, blen);
> +	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
>  	if (ret < 0) {
>  		warn("usb in operation failed. (%d)", ret);
>  		ret = -EIO;
> @@ -604,7 +621,7 @@ static int az6027_ci_slot_reset(struct dvb_ca_en50221 *ca, int slot)
>  	index = 0;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(d, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(d, req, value, index, NULL, blen, 0);
>  	if (ret != 0) {
>  		warn("usb out operation failed. (%d)", ret);
>  		goto failed;
> @@ -616,7 +633,7 @@ static int az6027_ci_slot_reset(struct dvb_ca_en50221 *ca, int slot)
>  	index = 0;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(d, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(d, req, value, index, NULL, blen, 0);
>  	if (ret != 0) {
>  		warn("usb out operation failed. (%d)", ret);
>  		goto failed;
> @@ -660,7 +677,7 @@ static int az6027_ci_slot_ts_enable(struct dvb_ca_en50221 *ca, int slot)
>  	index = 0;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(d, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(d, req, value, index, NULL, blen, 0);
>  	if (ret != 0) {
>  		warn("usb out operation failed. (%d)", ret);
>  		goto failed;
> @@ -692,7 +709,7 @@ static int az6027_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
>  	index = 0;
>  	blen = 1;
>  
> -	ret = az6027_usb_in_op(d, req, value, index, b, blen);
> +	ret = az6027_usb_in_op(d, req, value, index, b, blen, 12);
>  	if (ret < 0) {
>  		warn("usb in operation failed. (%d)", ret);
>  		ret = -EIO;
> @@ -771,7 +788,7 @@ static int az6027_ci_init(struct dvb_usb_adapter *a)
>  /*
>  static int az6027_read_mac_addr(struct dvb_usb_device *d, u8 mac[6])
>  {
> -	az6027_usb_in_op(d, 0xb7, 6, 0, &mac[0], 6);
> +	az6027_usb_in_op(d, 0xb7, 6, 0, &mac[0], 6, 6);
>  	return 0;
>  }
>  */
> @@ -831,7 +848,7 @@ static int az6027_frontend_poweron(struct dvb_usb_adapter *adap)
>  	index = 3;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
>  	if (ret != 0)
>  		return -EIO;
>  
> @@ -851,7 +868,7 @@ static int az6027_frontend_reset(struct dvb_usb_adapter *adap)
>  	index = 3;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
>  	if (ret != 0)
>  		return -EIO;
>  
> @@ -861,7 +878,7 @@ static int az6027_frontend_reset(struct dvb_usb_adapter *adap)
>  	blen = 0;
>  	msleep_interruptible(200);
>  
> -	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
>  	if (ret != 0)
>  		return -EIO;
>  
> @@ -872,7 +889,7 @@ static int az6027_frontend_reset(struct dvb_usb_adapter *adap)
>  	index = 3;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
>  	if (ret != 0)
>  		return -EIO;
>  
> @@ -894,7 +911,7 @@ static int az6027_frontend_tsbypass(struct dvb_usb_adapter *adap, int onoff)
>  	index = 0;
>  	blen = 0;
>  
> -	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen);
> +	ret = az6027_usb_out_op(adap->dev, req, value, index, NULL, blen, 0);
>  	if (ret != 0)
>  		return -EIO;
>  
> @@ -955,6 +972,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
>  	u16 index;
>  	u16 value;
>  	int length;
> +	int ret;
>  	u8 req;
>  	u8 *data;
>  
> @@ -981,7 +999,12 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
>  			}
>  			value = msg[i].buf[0] & 0x00ff;
>  			length = 1;
> -			az6027_usb_out_op(d, req, value, index, data, length);
> +			ret = az6027_usb_out_op(d, req, value, index,
> +						data, length, 256);
> +			if (ret != 0) {
> +				i = ret;
> +				break;
> +			}
>  		}
>  
>  		if (msg[i].addr == 0xd0) {
> @@ -995,7 +1018,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
>  				index = (((msg[i].buf[0] << 8) & 0xff00) | (msg[i].buf[1] & 0x00ff));
>  				value = msg[i].addr + (msg[i].len << 8);
>  				length = msg[i + 1].len + 6;
> -				az6027_usb_in_op(d, req, value, index, data, length);
> +				ret = az6027_usb_in_op(d, req, value, index,
> +							data, length, 256);
> +				if (ret != 0) {
> +					i = ret;
> +					break;
> +				}
> +
>  				len = msg[i + 1].len;
>  				for (j = 0; j < len; j++)
>  					msg[i + 1].buf[j] = data[j + 5];
> @@ -1013,9 +1042,12 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
>  				value = msg[i].addr + (2 << 8);
>  				length = msg[i].len - 2;
>  				len = msg[i].len - 2;
> -				for (j = 0; j < len; j++)
> -					data[j] = msg[i].buf[j + 2];
> -				az6027_usb_out_op(d, req, value, index, data, length);
> +				ret = az6027_usb_out_op(d, req, value, index,
> +							&msg[i].buf[2], length, 256);
> +				if (ret != 0) {
> +					i = ret;
> +					break;
> +				}
>  			}
>  		}
>  
> @@ -1026,7 +1058,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
>  				index = 0x0;
>  				value = msg[i].addr;
>  				length = msg[i].len + 6;
> -				az6027_usb_in_op(d, req, value, index, data, length);
> +				ret = az6027_usb_in_op(d, req, value, index,
> +							data, length, 256);
> +				if (ret != 0) {
> +					i = ret;
> +					break;
> +				}
> +
>  				len = msg[i].len;
>  				for (j = 0; j < len; j++)
>  					msg[i].buf[j] = data[j + 5];
> @@ -1042,11 +1080,12 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
>  				value = msg[i].addr + (1 << 8);
>  				length = msg[i].len - 1;
>  				len = msg[i].len - 1;
> -
> -				for (j = 0; j < len; j++)
> -					data[j] = msg[i].buf[j + 1];
> -
> -				az6027_usb_out_op(d, req, value, index, data, length);
> +				ret = az6027_usb_out_op(d, req, value, index,
> +							&msg[i].buf[1], length, 256);
> +				if (ret != 0) {
> +					i = ret;
> +					break;
> +				}
>  			}
>  		}
>  	}
> --
> 

Regards,

	Hans

