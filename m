Return-Path: <linux-media+bounces-3349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB15827AE3
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 23:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D161C22FF1
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 22:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC23E52F67;
	Mon,  8 Jan 2024 22:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="D/p5Q8XI"
X-Original-To: linux-media@vger.kernel.org
Received: from omta035.useast.a.cloudfilter.net (omta035.useast.a.cloudfilter.net [44.202.169.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ADCB672
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 22:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sensoray.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sensoray.com
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id MxEmrQWsw8uLRMyQtrQV9z; Mon, 08 Jan 2024 22:49:23 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id MyQsrllGMBnVCMyQsrx3zg; Mon, 08 Jan 2024 22:49:23 +0000
X-Authority-Analysis: v=2.4 cv=H+TIfsUi c=1 sm=1 tr=0 ts=659c7bf3
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10 a=dEuoMetlWLkA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8
 a=aI3tMORL9DMeiFqmlCsA:9 a=CjuIK1q_8ugA:10 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pFNPLJnX4VCPXl7c3GO491nxHx2/kcAvQQh3v5dClZY=; b=D/p5Q8XIHlw+Z3Kbm57aUI2Fyi
	y/k3VVl4JgH91E51WPhufb/xW1lKP09JBEsUKtIy3suQH/4a/vOC367styS+VbXsbeEhq80X/qSd0
	akXC7nY+W+0qRBxRpGfJ3Gm2fZ0uFxJ287ojwQJU63nsJzI/9VkByeI5aKh8jtEphwt8=;
Received: from gator3086.hostgator.com ([50.87.144.121]:33196)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1rMyQs-00215F-5H;
	Mon, 08 Jan 2024 16:49:22 -0600
Received: from mail.thomaswright.com ([50.126.89.90])
 by www.sensoray.com
 with HTTP (HTTP/1.1 POST); Mon, 08 Jan 2024 16:49:21 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 08 Jan 2024 16:49:21 -0600
From: dean@sensoray.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
 hverkuil@xs4all.nl
Subject: Re: [PATCHv3] media: usb: s2255: add serial number V4L2_CID
In-Reply-To: <20240108132550.GA12563@pendragon.ideasonboard.com>
References: <20231215191421.36686-1-dean@sensoray.com>
 <ZZvwHA2_Y4Jt65B0@valkosipuli.retiisi.eu>
 <20240108132550.GA12563@pendragon.ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <9b29f98b53f794010d3804d215da5225@sensoray.com>
X-Sender: dean@sensoray.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.87.144.121
X-Source-L: Yes
X-Exim-ID: 1rMyQs-00215F-5H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator3086.hostgator.com [50.87.144.121]:33196
X-Source-Auth: dean@sensoray.com
X-Email-Count: 12
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE2QAzXLqF7ZzpSiuF5G6DaDfNtSPvU7nJpg4HcFsxIizMEzYlMonumBg9HXeEYIuGx+9mijTStVC00eFhIsTLM50xMaRcsKqYk5T6vxnBU0sRgdxDz9
 ZChmgU9whPBhramn26lj8BD1yj4b0tG+kGEzoDbbI0Q9X8rDFOS5Q+7tDehx4Ek2SBecbQOtolAdEGRCB3/aahAmfajF7INM9jc=

On 2024-01-08 07:25, Laurent Pinchart wrote:
> On Mon, Jan 08, 2024 at 12:52:44PM +0000, Sakari Ailus wrote:
>> Hi Dean,
>> 
>> Thanks for the patch.
>> 
>> On Fri, Dec 15, 2023 at 11:14:21AM -0800, Dean Anderson wrote:
>> > Adding V4L2 read-only control id for serial number as hardware
>> > does not support embedding the serial number in the USB device descriptors.
>> > Comment added noting v4l2_ctrl_handler_setup is not needed for this driver.
>> >
>> > Signed-off-by: Dean Anderson <dean@sensoray.com>
>> >
>> > ---
>> >  drivers/media/usb/s2255/s2255drv.c | 52 +++++++++++++++++++++++++++++-
>> >  1 file changed, 51 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
>> > index 3c2627712fe9..1f3961835711 100644
>> > --- a/drivers/media/usb/s2255/s2255drv.c
>> > +++ b/drivers/media/usb/s2255/s2255drv.c

>> 
>> I'd document a new standardised control for this purpose. Any other
>> opinions?
> 
> How about reporting the serial number through struct
> media_device_info.serial instead ?

This is a great idea. My only concern is the CONFIG_MEDIA_CONTROLLER 
requirement, but most distros have that defined. I'll re-implement this 
patch with media_device_info.

FYI, visl-core.c is missing several CONFIG_MEDIA_CONTROLLER ifdefs for 
media_device calls.

> 
>> >
>> >  /* frame prefix size (sent once every frame) */
>> >  #define PREFIX_SIZE		512
>> > @@ -1232,6 +1234,36 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>> >  	return 0;
>> >  }
>> >
>> > +/*
>> > + * serial number is not used in usb device descriptors.
>> > + * returns serial number from device, 0 if none found.
>> > + */
>> > +
>> > +static int s2255_g_serialnum(struct s2255_dev *dev)
>> > +{
>> > +#define S2255_SERIALNUM_NONE 0
>> 
>> No need for such a definition, just assign it to zero.
>> 
>> > +#define S2255_I2C_SIZE     16
>> > +#define S2255_I2C_SERIALNUM 0xa2
>> > +#define S2255_I2C_SERIALNUM_OFFSET 0x1ff0
>> > +#define S2255_VENDOR_READREG 0x22
>> > +
>> > +	u8 *buf;
>> > +	int serialnum = S2255_SERIALNUM_NONE;
>> 
>> u32?
>> 
>> > +
>> > +	buf = kzalloc(S2255_I2C_SIZE, GFP_KERNEL);
>> 
>> Could this reside in the stack instead? It's just 16 bytes.
>> 
>> > +	if (!buf)
>> > +		return serialnum;
>> > +
>> > +	s2255_vendor_req(dev, S2255_VENDOR_READREG, S2255_I2C_SERIALNUM_OFFSET,
>> > +			 S2255_I2C_SERIALNUM >> 1, buf, S2255_I2C_SIZE, 0);
>> 
>> It'd be nice to check for errors here.
>> 
>> > +
>> > +	/* verify marker code */
>> > +	if (*(__le32 *)buf == S2255_MARKER_FIRMWARE)
>> > +		serialnum = (buf[12] << 24) + (buf[13] << 16) + (buf[14] << 8) + buf[15];
>> 
>> Maybe:
>> 
>> 	serialnum = be32_to_cpu(*(__be32 *)(buf + 12));

yes

>> 
>> You could add a reference to the serial number as a function argument 
>> and
>> just return the error if one happens. This isn't exactly the same 
>> thing as
>> having serial number 0.
>> 
>> > +	kfree(buf);
>> > +	return serialnum;
>> > +}
>> > +
>> >  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>> >  			 struct v4l2_jpegcompression *jc)
>> >  {
>> > @@ -1581,6 +1613,17 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
>> >  	.def = 1,
>> >  };
>> >
>> > +static const struct v4l2_ctrl_config v4l2_ctrl_serialnum = {
>> > +	.ops = &s2255_ctrl_ops,
>> > +	.name = "Serial Number",
>> > +	.id = V4L2_CID_S2255_SERIALNUM,
>> > +	.type = V4L2_CTRL_TYPE_INTEGER,
>> > +	.max = 0x7fffffff,
>> > +	.min = 0,
>> > +	.step = 1,
>> > +	.flags = V4L2_CTRL_FLAG_READ_ONLY,
>> > +};
>> > +
>> >  static int s2255_probe_v4l(struct s2255_dev *dev)
>> >  {
>> >  	int ret;
>> > @@ -1588,6 +1631,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>> >  	int cur_nr = video_nr;
>> >  	struct s2255_vc *vc;
>> >  	struct vb2_queue *q;
>> > +	struct v4l2_ctrl_config tmp = v4l2_ctrl_serialnum;
>> >
>> >  	ret = v4l2_device_register(&dev->interface->dev, &dev->v4l2_dev);
>> >  	if (ret)
>> > @@ -1598,7 +1642,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>> >  		vc = &dev->vc[i];
>> >  		INIT_LIST_HEAD(&vc->buf_list);
>> >
>> > -		v4l2_ctrl_handler_init(&vc->hdl, 6);
>> > +		v4l2_ctrl_handler_init(&vc->hdl, 7);
>> >  		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
>> >  				V4L2_CID_BRIGHTNESS, -127, 127, 1, DEF_BRIGHT);
>> >  		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
>> > @@ -1615,6 +1659,8 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>> >  		    (dev->pid != 0x2257 || vc->idx <= 1))
>> >  			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
>> >  					     NULL);
>> > +		tmp.def = s2255_g_serialnum(dev);
>> > +		v4l2_ctrl_new_custom(&vc->hdl, &tmp, NULL);
>> >  		if (vc->hdl.error) {
>> >  			ret = vc->hdl.error;
>> >  			v4l2_ctrl_handler_free(&vc->hdl);
>> > @@ -2306,6 +2352,10 @@ static int s2255_probe(struct usb_interface *interface,
>> >  	retval = s2255_board_init(dev);
>> >  	if (retval)
>> >  		goto errorBOARDINIT;
>> > +	/*
>> > +	 * v4l2_ctrl_handler_setup is not required.
>> > +	 * V4L2 controls initialized when firmware is loaded.
>> > +	 */
>> 
>> I'd drop the comment.
>> 
>> >  	s2255_fwload_start(dev);
>> >  	/* loads v4l specific */
>> >  	retval = s2255_probe_v4l(dev);
> 
> --
> Regards,
> 
> Laurent Pinchart

Regards,

Dean

