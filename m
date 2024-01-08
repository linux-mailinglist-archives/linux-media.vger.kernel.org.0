Return-Path: <linux-media+bounces-3325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140C826F03
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 13:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5272839FA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 12:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512D044C98;
	Mon,  8 Jan 2024 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="LiSSaXJW"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1E45940
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4T7v9T6508zyVF;
	Mon,  8 Jan 2024 14:52:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1704718366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvBVBLQzThskPs9kfUp1FgqVqnXzBgqymiGmnU9m2EU=;
	b=LiSSaXJWUR91f42drftOECw+EyV/xeQQ0N9Kh1ba8uH4sGnCP0dPHrclK6GXWJB9o0uthB
	daFnHR/X4l+PcK/6EcXYI+GxzltGRf1aNotaxo3mFzzcFI5e4FS5UkuLxOqDRc+nIWWMzE
	kJU+HIxhpqTDI8geJzDXcPs9jVieskY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1704718366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvBVBLQzThskPs9kfUp1FgqVqnXzBgqymiGmnU9m2EU=;
	b=xjqv0q+sE/Ah1yCJ1gHChgC/tTvn/qQi9uJk8K7VBhYz9htCc5oJjwfAUxAH3242Krl3WX
	G4go0FdBgF4wOj10hxCxKobUr4jQwJc+J4GJ3Ki/FyyzNfP+NphWat8AUyswr/9s7D+liQ
	XwkjMYODJuDknNBg6x3BPQlL7bx+4Ug=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1704718366; a=rsa-sha256; cv=none;
	b=Jm6hUD1PTKWQMeZeL5F2ymcA0xXoBligcQn1y9B+V34jyXXrFq8G42C3gLGLtZ6v6i7+J9
	PX4J4nS9KdSYysIftkTWuNuOTWzJlPFZDHfu+TSsWVqPqknxWFpfU2bSWZmS+wqQBGpsh2
	AngB50SI82LaKpRQOtQVmEKbI2ce3Xk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E4DF6634C94;
	Mon,  8 Jan 2024 14:52:44 +0200 (EET)
Date: Mon, 8 Jan 2024 12:52:44 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dean Anderson <dean@sensoray.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: Re: [PATCHv3] media: usb: s2255: add serial number V4L2_CID
Message-ID: <ZZvwHA2_Y4Jt65B0@valkosipuli.retiisi.eu>
References: <20231215191421.36686-1-dean@sensoray.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215191421.36686-1-dean@sensoray.com>

Hi Dean,

Thanks for the patch.

On Fri, Dec 15, 2023 at 11:14:21AM -0800, Dean Anderson wrote:
> Adding V4L2 read-only control id for serial number as hardware
> does not support embedding the serial number in the USB device descriptors.
> Comment added noting v4l2_ctrl_handler_setup is not needed for this driver.
> 
> Signed-off-by: Dean Anderson <dean@sensoray.com>
> 
> ---
>  drivers/media/usb/s2255/s2255drv.c | 52 +++++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
> index 3c2627712fe9..1f3961835711 100644
> --- a/drivers/media/usb/s2255/s2255drv.c
> +++ b/drivers/media/usb/s2255/s2255drv.c
> @@ -60,6 +60,7 @@
>  #define S2255_MIN_BUFS          2
>  #define S2255_SETMODE_TIMEOUT   500
>  #define S2255_VIDSTATUS_TIMEOUT 350
> +#define S2255_MARKER_FIRMWARE	cpu_to_le32(0xDDCCBBAAL)

It'd be nicer to convert the value obtained from the device to CPU
endianness rather than the other way around. But as this seems to be a
pattern already used in the driver, I'm fine with it here.

Given that the serial number itself is big endian, I wonder if the driver
is just implemented in a funny way and happens to work?

>  #define S2255_MARKER_FRAME	cpu_to_le32(0x2255DA4AL)
>  #define S2255_MARKER_RESPONSE	cpu_to_le32(0x2255ACACL)
>  #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
> @@ -323,6 +324,7 @@ struct s2255_buffer {
>  #define S2255_V4L2_YC_ON  1
>  #define S2255_V4L2_YC_OFF 0
>  #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
> +#define V4L2_CID_S2255_SERIALNUM (V4L2_CID_USER_S2255_BASE + 1)

I'd document a new standardised control for this purpose. Any other
opinions?

>  
>  /* frame prefix size (sent once every frame) */
>  #define PREFIX_SIZE		512
> @@ -1232,6 +1234,36 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +/*
> + * serial number is not used in usb device descriptors.
> + * returns serial number from device, 0 if none found.
> + */
> +
> +static int s2255_g_serialnum(struct s2255_dev *dev)
> +{
> +#define S2255_SERIALNUM_NONE 0

No need for such a definition, just assign it to zero.

> +#define S2255_I2C_SIZE     16
> +#define S2255_I2C_SERIALNUM 0xa2
> +#define S2255_I2C_SERIALNUM_OFFSET 0x1ff0
> +#define S2255_VENDOR_READREG 0x22
> +
> +	u8 *buf;
> +	int serialnum = S2255_SERIALNUM_NONE;

u32?

> +
> +	buf = kzalloc(S2255_I2C_SIZE, GFP_KERNEL);

Could this reside in the stack instead? It's just 16 bytes.

> +	if (!buf)
> +		return serialnum;
> +
> +	s2255_vendor_req(dev, S2255_VENDOR_READREG, S2255_I2C_SERIALNUM_OFFSET,
> +			 S2255_I2C_SERIALNUM >> 1, buf, S2255_I2C_SIZE, 0);

It'd be nice to check for errors here.

> +
> +	/* verify marker code */
> +	if (*(__le32 *)buf == S2255_MARKER_FIRMWARE)
> +		serialnum = (buf[12] << 24) + (buf[13] << 16) + (buf[14] << 8) + buf[15];

Maybe:

	serialnum = be32_to_cpu(*(__be32 *)(buf + 12));

You could add a reference to the serial number as a function argument and
just return the error if one happens. This isn't exactly the same thing as
having serial number 0.

> +	kfree(buf);
> +	return serialnum;
> +}
> +
>  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>  			 struct v4l2_jpegcompression *jc)
>  {
> @@ -1581,6 +1613,17 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
>  	.def = 1,
>  };
>  
> +static const struct v4l2_ctrl_config v4l2_ctrl_serialnum = {
> +	.ops = &s2255_ctrl_ops,
> +	.name = "Serial Number",
> +	.id = V4L2_CID_S2255_SERIALNUM,
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.max = 0x7fffffff,
> +	.min = 0,
> +	.step = 1,
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
>  static int s2255_probe_v4l(struct s2255_dev *dev)
>  {
>  	int ret;
> @@ -1588,6 +1631,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>  	int cur_nr = video_nr;
>  	struct s2255_vc *vc;
>  	struct vb2_queue *q;
> +	struct v4l2_ctrl_config tmp = v4l2_ctrl_serialnum;
>  
>  	ret = v4l2_device_register(&dev->interface->dev, &dev->v4l2_dev);
>  	if (ret)
> @@ -1598,7 +1642,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>  		vc = &dev->vc[i];
>  		INIT_LIST_HEAD(&vc->buf_list);
>  
> -		v4l2_ctrl_handler_init(&vc->hdl, 6);
> +		v4l2_ctrl_handler_init(&vc->hdl, 7);
>  		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
>  				V4L2_CID_BRIGHTNESS, -127, 127, 1, DEF_BRIGHT);
>  		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
> @@ -1615,6 +1659,8 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>  		    (dev->pid != 0x2257 || vc->idx <= 1))
>  			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
>  					     NULL);
> +		tmp.def = s2255_g_serialnum(dev);
> +		v4l2_ctrl_new_custom(&vc->hdl, &tmp, NULL);
>  		if (vc->hdl.error) {
>  			ret = vc->hdl.error;
>  			v4l2_ctrl_handler_free(&vc->hdl);
> @@ -2306,6 +2352,10 @@ static int s2255_probe(struct usb_interface *interface,
>  	retval = s2255_board_init(dev);
>  	if (retval)
>  		goto errorBOARDINIT;
> +	/*
> +	 * v4l2_ctrl_handler_setup is not required.
> +	 * V4L2 controls initialized when firmware is loaded.
> +	 */

I'd drop the comment.

>  	s2255_fwload_start(dev);
>  	/* loads v4l specific */
>  	retval = s2255_probe_v4l(dev);

-- 
Regards,

Sakari Ailus

