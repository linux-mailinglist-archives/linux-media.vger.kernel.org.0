Return-Path: <linux-media+bounces-3425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7244828B39
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 18:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C081F25533
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869F13B799;
	Tue,  9 Jan 2024 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OX7Jt3DC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A162C3B797
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86027922;
	Tue,  9 Jan 2024 18:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704821245;
	bh=1xpZmzKAUeiboM+ny+vFq+ZuNvIwYElVlrgiRNBGovU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OX7Jt3DCSBFiZYU+SCtT+E3ErYv34PNG2iTmDx+lYgDcIis4Lp4H/oXOQjRJyvqaC
	 MRhbhOwjFu2JBsdgXX8hwRM+XZyPXPCli9luYQC/MBdYMmugI98B7iAQ1tGzRFJgG7
	 2z0ubhsY1EKzB49nGfjAWf1yxaMpmqyy45QOR18c=
Date: Tue, 9 Jan 2024 19:28:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dean@sensoray.com
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl
Subject: Re: [PATCHv3] media: usb: s2255: add serial number V4L2_CID
Message-ID: <20240109172838.GC27655@pendragon.ideasonboard.com>
References: <20231215191421.36686-1-dean@sensoray.com>
 <ZZvwHA2_Y4Jt65B0@valkosipuli.retiisi.eu>
 <20240108132550.GA12563@pendragon.ideasonboard.com>
 <9b29f98b53f794010d3804d215da5225@sensoray.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b29f98b53f794010d3804d215da5225@sensoray.com>

Hi Dean,

On Mon, Jan 08, 2024 at 04:49:21PM -0600, dean@sensoray.com wrote:
> On 2024-01-08 07:25, Laurent Pinchart wrote:
> > On Mon, Jan 08, 2024 at 12:52:44PM +0000, Sakari Ailus wrote:
> >> On Fri, Dec 15, 2023 at 11:14:21AM -0800, Dean Anderson wrote:
> >> > Adding V4L2 read-only control id for serial number as hardware
> >> > does not support embedding the serial number in the USB device descriptors.
> >> > Comment added noting v4l2_ctrl_handler_setup is not needed for this driver.
> >> >
> >> > Signed-off-by: Dean Anderson <dean@sensoray.com>
> >> >
> >> > ---
> >> >  drivers/media/usb/s2255/s2255drv.c | 52 +++++++++++++++++++++++++++++-
> >> >  1 file changed, 51 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
> >> > index 3c2627712fe9..1f3961835711 100644
> >> > --- a/drivers/media/usb/s2255/s2255drv.c
> >> > +++ b/drivers/media/usb/s2255/s2255drv.c
> >> 
> >> I'd document a new standardised control for this purpose. Any other
> >> opinions?
> > 
> > How about reporting the serial number through struct
> > media_device_info.serial instead ?
> 
> This is a great idea. My only concern is the CONFIG_MEDIA_CONTROLLER 
> requirement, but most distros have that defined. I'll re-implement this 
> patch with media_device_info.
> 
> FYI, visl-core.c is missing several CONFIG_MEDIA_CONTROLLER ifdefs for 
> media_device calls.

VIDEO_VISL select MEDIA_CONTROLLER, so the driver shouldn't need
#ifdef's.

> >> >  /* frame prefix size (sent once every frame) */
> >> >  #define PREFIX_SIZE		512
> >> > @@ -1232,6 +1234,36 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
> >> >  	return 0;
> >> >  }
> >> >
> >> > +/*
> >> > + * serial number is not used in usb device descriptors.
> >> > + * returns serial number from device, 0 if none found.
> >> > + */
> >> > +
> >> > +static int s2255_g_serialnum(struct s2255_dev *dev)
> >> > +{
> >> > +#define S2255_SERIALNUM_NONE 0
> >> 
> >> No need for such a definition, just assign it to zero.
> >> 
> >> > +#define S2255_I2C_SIZE     16
> >> > +#define S2255_I2C_SERIALNUM 0xa2
> >> > +#define S2255_I2C_SERIALNUM_OFFSET 0x1ff0
> >> > +#define S2255_VENDOR_READREG 0x22
> >> > +
> >> > +	u8 *buf;
> >> > +	int serialnum = S2255_SERIALNUM_NONE;
> >> 
> >> u32?
> >> 
> >> > +
> >> > +	buf = kzalloc(S2255_I2C_SIZE, GFP_KERNEL);
> >> 
> >> Could this reside in the stack instead? It's just 16 bytes.
> >> 
> >> > +	if (!buf)
> >> > +		return serialnum;
> >> > +
> >> > +	s2255_vendor_req(dev, S2255_VENDOR_READREG, S2255_I2C_SERIALNUM_OFFSET,
> >> > +			 S2255_I2C_SERIALNUM >> 1, buf, S2255_I2C_SIZE, 0);
> >> 
> >> It'd be nice to check for errors here.
> >> 
> >> > +
> >> > +	/* verify marker code */
> >> > +	if (*(__le32 *)buf == S2255_MARKER_FIRMWARE)
> >> > +		serialnum = (buf[12] << 24) + (buf[13] << 16) + (buf[14] << 8) + buf[15];
> >> 
> >> Maybe:
> >> 
> >> 	serialnum = be32_to_cpu(*(__be32 *)(buf + 12));
> 
> yes
> 
> >> You could add a reference to the serial number as a function argument and
> >> just return the error if one happens. This isn't exactly the same thing as
> >> having serial number 0.
> >> 
> >> > +	kfree(buf);
> >> > +	return serialnum;
> >> > +}
> >> > +
> >> >  static int vidioc_g_jpegcomp(struct file *file, void *priv,
> >> >  			 struct v4l2_jpegcompression *jc)
> >> >  {
> >> > @@ -1581,6 +1613,17 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
> >> >  	.def = 1,
> >> >  };
> >> >
> >> > +static const struct v4l2_ctrl_config v4l2_ctrl_serialnum = {
> >> > +	.ops = &s2255_ctrl_ops,
> >> > +	.name = "Serial Number",
> >> > +	.id = V4L2_CID_S2255_SERIALNUM,
> >> > +	.type = V4L2_CTRL_TYPE_INTEGER,
> >> > +	.max = 0x7fffffff,
> >> > +	.min = 0,
> >> > +	.step = 1,
> >> > +	.flags = V4L2_CTRL_FLAG_READ_ONLY,
> >> > +};
> >> > +
> >> >  static int s2255_probe_v4l(struct s2255_dev *dev)
> >> >  {
> >> >  	int ret;
> >> > @@ -1588,6 +1631,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
> >> >  	int cur_nr = video_nr;
> >> >  	struct s2255_vc *vc;
> >> >  	struct vb2_queue *q;
> >> > +	struct v4l2_ctrl_config tmp = v4l2_ctrl_serialnum;
> >> >
> >> >  	ret = v4l2_device_register(&dev->interface->dev, &dev->v4l2_dev);
> >> >  	if (ret)
> >> > @@ -1598,7 +1642,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
> >> >  		vc = &dev->vc[i];
> >> >  		INIT_LIST_HEAD(&vc->buf_list);
> >> >
> >> > -		v4l2_ctrl_handler_init(&vc->hdl, 6);
> >> > +		v4l2_ctrl_handler_init(&vc->hdl, 7);
> >> >  		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
> >> >  				V4L2_CID_BRIGHTNESS, -127, 127, 1, DEF_BRIGHT);
> >> >  		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
> >> > @@ -1615,6 +1659,8 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
> >> >  		    (dev->pid != 0x2257 || vc->idx <= 1))
> >> >  			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
> >> >  					     NULL);
> >> > +		tmp.def = s2255_g_serialnum(dev);
> >> > +		v4l2_ctrl_new_custom(&vc->hdl, &tmp, NULL);
> >> >  		if (vc->hdl.error) {
> >> >  			ret = vc->hdl.error;
> >> >  			v4l2_ctrl_handler_free(&vc->hdl);
> >> > @@ -2306,6 +2352,10 @@ static int s2255_probe(struct usb_interface *interface,
> >> >  	retval = s2255_board_init(dev);
> >> >  	if (retval)
> >> >  		goto errorBOARDINIT;
> >> > +	/*
> >> > +	 * v4l2_ctrl_handler_setup is not required.
> >> > +	 * V4L2 controls initialized when firmware is loaded.
> >> > +	 */
> >> 
> >> I'd drop the comment.
> >> 
> >> >  	s2255_fwload_start(dev);
> >> >  	/* loads v4l specific */
> >> >  	retval = s2255_probe_v4l(dev);

-- 
Regards,

Laurent Pinchart

