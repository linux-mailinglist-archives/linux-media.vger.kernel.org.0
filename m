Return-Path: <linux-media+bounces-860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6D7F4ECC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 18:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13544281318
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFD658AA3;
	Wed, 22 Nov 2023 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="gsS8MmDh"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 91 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 09:55:24 PST
Received: from omta033.useast.a.cloudfilter.net (omta033.useast.a.cloudfilter.net [44.202.169.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F431AB
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 09:55:23 -0800 (PST)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id 5qJ6raA2UjtZ35rQCroM5O; Wed, 22 Nov 2023 17:53:56 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id 5rQ7ra4DP11XZ5rQ7rM6x3; Wed, 22 Nov 2023 17:53:51 +0000
X-Authority-Analysis: v=2.4 cv=Z+v/oVdA c=1 sm=1 tr=0 ts=655e402f
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10 a=BNY50KLci1gA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8
 a=2AF0q0MM-X3ldzQa3PMA:9 a=CjuIK1q_8ugA:10 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aO4DrqNbP6wT3JpaNS/R0MeEe/AQYazbw/lBQY7MyTc=; b=gsS8MmDh0OGfAfDe5gSKTz784s
	vUW6LItmYY3r5FkTpqXx3bgArh9a/eiKKSHvExvG2knbZogT/CCQqShDA3xEAyGR3Zs5zvTKV2vx6
	0wr5CDfbW0AIEVBqEDjaSHDE8yrJcqg0b+VqEwxAf85/0eRtzigkNh4dIlLoZJhk4IUo=;
Received: from gator3086.hostgator.com ([50.87.144.121]:24018)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1r5rQ6-003GxQ-Fu;
	Wed, 22 Nov 2023 11:53:50 -0600
Received: from mail.thomaswright.com ([50.126.89.90])
 by www.sensoray.com
 with HTTP (HTTP/1.1 POST); Wed, 22 Nov 2023 11:53:50 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 11:53:50 -0600
From: dean@sensoray.com
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-dev@sensoray.com
Subject: Re: [PATCH] media: usb: s2255: custom V4L2_CIDs
In-Reply-To: <294ee172-d0f4-4ce0-b086-82e84464643c@xs4all.nl>
References: <20231121215323.462427-1-dean@sensoray.com>
 <294ee172-d0f4-4ce0-b086-82e84464643c@xs4all.nl>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <d35642ef3d49ff39fd1a31a830d77655@sensoray.com>
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
X-Exim-ID: 1r5rQ6-003GxQ-Fu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator3086.hostgator.com [50.87.144.121]:24018
X-Source-Auth: dean@sensoray.com
X-Email-Count: 6
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMg7czQI0+KGUDbRlvJsoPiBRx1nCvAhP1dTBMWIigx7fi4nK9DXV+YkgaJl9Bg9RSajxwhKFNCrq/GrRntGuXB6I65YBFF7K1LGcpPF6NbCIe3nsyAv
 SfOX4IBzo9P/1GpeHFvPhOBkup6Fyv8/V3ddgp4sqK1Fq4dtZQR3n4izdWcnzoeXCwrW1yPrZ599MzIR3OV8TTKaahL0stiwSLU=

On 2023-11-22 04:18, Hans Verkuil wrote:
> Hi Dean,
> 
> Thank you for the patch, but I have some question about this patch:
> 
> On 21/11/2023 22:53, Dean Anderson wrote:
>> Adding read-only V4L2 control ids for device-id and on-board
>> firmware versions.
>> 
>> base-commit: 3e238417254bfdcc23fe207780b59cbb08656762
>> 
>> Signed-off-by: Dean Anderson <dean@sensoray.com>
>> 
>> ---
>>  drivers/media/usb/s2255/s2255drv.c | 98 
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>> 
>> diff --git a/drivers/media/usb/s2255/s2255drv.c 
>> b/drivers/media/usb/s2255/s2255drv.c
>> index 3c2627712fe9..1c7cb1d37353 100644
>> --- a/drivers/media/usb/s2255/s2255drv.c
>> +++ b/drivers/media/usb/s2255/s2255drv.c
>> @@ -262,6 +262,7 @@ struct s2255_dev {
>>  	int                     chn_ready;
>>  	/* dsp firmware version (f2255usb.bin) */
>>  	int                     dsp_fw_ver;
>> +	int                     usb_fw_ver;
>>  	u16                     pid; /* product id */
>>  #define S2255_CMDBUF_SIZE 512
>>  	__le32                  *cmdbuf;
>> @@ -323,6 +324,9 @@ struct s2255_buffer {
>>  #define S2255_V4L2_YC_ON  1
>>  #define S2255_V4L2_YC_OFF 0
>>  #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
>> +#define V4L2_CID_S2255_DEVICEID (V4L2_CID_USER_S2255_BASE + 1)
>> +#define V4L2_CID_S2255_DSPFWVER (V4L2_CID_USER_S2255_BASE + 2)
>> +#define V4L2_CID_S2255_USBFWVER (V4L2_CID_USER_S2255_BASE + 3)
> 
> Why do you want to expose this as controls? Usually such information
> is output to the kernel log during probe since it shouldn't be needed
> by userspace. At minimum the commit log should explain the reason for
> adding these controls.
> 


The deviceid is essentially the serial number. There are some users that 
have requested it. Ideally, it would be in the USB descriptors, but this 
wasn't possible with the hardware as is.

I agree the others aren't usually needed, but some customers may want to 
verify programmatically the loaded firmware is up to date instead of 
grepping the kernel log.


>> 
>>  /* frame prefix size (sent once every frame) */
>>  #define PREFIX_SIZE		512
>> @@ -1232,6 +1236,56 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	return 0;
>>  }
>> 
>> +static int s2255_read_reg_burst(struct s2255_dev *dev, u8 dev_addr,
>> +				u16 reg_addr, u8 *data, u8 datalen)
>> +{
>> +	int rc;
>> +
>> +	rc = s2255_vendor_req(dev, 0x22, reg_addr, dev_addr >> 1, data, 
>> datalen, 0);
>> +	return rc;
> 
> Just do 'return s2255_...', no need for the rc variable.
> 
>> +}
>> +
>> +static int s2255_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> 
> These controls are definitely not volatile controls. Just
> read out the registers during probe and create these read-only
> controls with the correct initial value. No need to do anything
> else. Unless these versions/device IDs dynamically change, which
> is very unlikely.


Correct, they aren't volatile.


> 
>> +{
>> +	u8 *outbuf;
>> +	int rc;
>> +	struct s2255_vc *vc =
>> +		container_of(ctrl->handler, struct s2255_vc, hdl);
>> +	struct s2255_dev *dev = vc->dev;
>> +
>> +	if (ctrl->id == V4L2_CID_S2255_DSPFWVER) {
>> +		ctrl->val = dev->dsp_fw_ver;
>> +		return 0;
>> +	}
>> +	if (ctrl->id == V4L2_CID_S2255_USBFWVER) {
>> +		ctrl->val = dev->usb_fw_ver;
>> +		return 0;
>> +	}
>> +	if (ctrl->id != V4L2_CID_S2255_DEVICEID)
>> +		return -EINVAL;
>> +	if (dev == NULL)
>> +		return -EINVAL;
>> +#define S2255_I2C_SIZE     16
>> +	outbuf = kzalloc(S2255_I2C_SIZE * sizeof(u8), GFP_KERNEL);
>> +	if (outbuf == NULL)
>> +		return -ENOMEM;
>> +#define S2255_I2C_SNDEV    0xa2
>> +#define S2255_I2C_SNOFFSET 0x1ff0
>> +	rc = s2255_read_reg_burst(dev, S2255_I2C_SNDEV, S2255_I2C_SNOFFSET, 
>> outbuf, S2255_I2C_SIZE);
>> +	if (rc < 0) {
>> +		kfree(outbuf);
>> +		return rc;
>> +	}
>> +	// verify marker code
>> +	if (*(unsigned int *)outbuf != 0xddccbbaa) {
> 
> The 'media: usb: s2255: endian fix' patch fixes a bug introduced here. 
> Just fold
> that fix into this patch instead.
> 
>> +		kfree(outbuf);
>> +		return -EFAULT;
>> +	}
>> +	ctrl->val = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] << 
>> 8) + outbuf[15];
>> +	kfree(outbuf);
>> +	return 0;
>> +}
>> +
>>  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>>  			 struct v4l2_jpegcompression *jc)
>>  {
>> @@ -1569,6 +1623,7 @@ static const struct video_device template = {
>> 
>>  static const struct v4l2_ctrl_ops s2255_ctrl_ops = {
>>  	.s_ctrl = s2255_s_ctrl,
>> +	.g_volatile_ctrl = s2255_g_volatile_ctrl,
>>  };
>> 
>>  static const struct v4l2_ctrl_config color_filter_ctrl = {
>> @@ -1581,6 +1636,42 @@ static const struct v4l2_ctrl_config 
>> color_filter_ctrl = {
>>  	.def = 1,
>>  };
>> 
>> +static const struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
>> +	.ops = &s2255_ctrl_ops,
>> +	.name = "Device ID",
>> +	.id = V4L2_CID_S2255_DEVICEID,
>> +	.type = V4L2_CTRL_TYPE_INTEGER,
>> +	.max = 0xffffffff,
>> +	.min = 0,
>> +	.step = 1,
>> +	.def = 0,
>> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
>> +};
>> +
>> +static const struct v4l2_ctrl_config v4l2_ctrl_dspfwver = {
>> +	.ops = &s2255_ctrl_ops,
>> +	.name = "DSP Firmware",
>> +	.id = V4L2_CID_S2255_DSPFWVER,
>> +	.type = V4L2_CTRL_TYPE_INTEGER,
>> +	.max = 0xffffffff,
>> +	.min = 0,
>> +	.step = 1,
>> +	.def = 0,
>> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
>> +};
>> +
>> +static const struct v4l2_ctrl_config v4l2_ctrl_usbfwver = {
>> +	.ops = &s2255_ctrl_ops,
>> +	.name = "USB Firmware",
>> +	.id = V4L2_CID_S2255_USBFWVER,
>> +	.type = V4L2_CTRL_TYPE_INTEGER,
>> +	.max = 0xffffffff,
>> +	.min = 0,
>> +	.step = 1,
>> +	.def = 0,
>> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
>> +};
>> +
>>  static int s2255_probe_v4l(struct s2255_dev *dev)
>>  {
>>  	int ret;
>> @@ -1615,6 +1706,12 @@ static int s2255_probe_v4l(struct s2255_dev 
>> *dev)
>>  		    (dev->pid != 0x2257 || vc->idx <= 1))
>>  			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
>>  					     NULL);
>> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_deviceid,
>> +				NULL);
>> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_usbfwver,
>> +				NULL);
>> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_dspfwver,
>> +				NULL);
>>  		if (vc->hdl.error) {
>>  			ret = vc->hdl.error;
>>  			v4l2_ctrl_handler_free(&vc->hdl);
>> @@ -1983,6 +2080,7 @@ static int s2255_board_init(struct s2255_dev 
>> *dev)
>>  	}
>>  	/* query the firmware */
>>  	fw_ver = s2255_get_fx2fw(dev);
>> +	dev->usb_fw_ver = fw_ver;
>> 
>>  	pr_info("s2255: usb firmware version %d.%d\n",
>>  		(fw_ver >> 8) & 0xff,
> 
> Regards,
> 
> 	Hans

