Return-Path: <linux-media+bounces-772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E037F437F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C701C20863
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B341320300;
	Wed, 22 Nov 2023 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1380D3D970
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 10:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52ABC433C9;
	Wed, 22 Nov 2023 10:18:45 +0000 (UTC)
Message-ID: <294ee172-d0f4-4ce0-b086-82e84464643c@xs4all.nl>
Date: Wed, 22 Nov 2023 11:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: usb: s2255: custom V4L2_CIDs
Content-Language: en-US, nl
To: Dean Anderson <dean@sensoray.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-dev@sensoray.com
References: <20231121215323.462427-1-dean@sensoray.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231121215323.462427-1-dean@sensoray.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dean,

Thank you for the patch, but I have some question about this patch:

On 21/11/2023 22:53, Dean Anderson wrote:
> Adding read-only V4L2 control ids for device-id and on-board
> firmware versions.
> 
> base-commit: 3e238417254bfdcc23fe207780b59cbb08656762
> 
> Signed-off-by: Dean Anderson <dean@sensoray.com>
> 
> ---
>  drivers/media/usb/s2255/s2255drv.c | 98 ++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
> index 3c2627712fe9..1c7cb1d37353 100644
> --- a/drivers/media/usb/s2255/s2255drv.c
> +++ b/drivers/media/usb/s2255/s2255drv.c
> @@ -262,6 +262,7 @@ struct s2255_dev {
>  	int                     chn_ready;
>  	/* dsp firmware version (f2255usb.bin) */
>  	int                     dsp_fw_ver;
> +	int                     usb_fw_ver;
>  	u16                     pid; /* product id */
>  #define S2255_CMDBUF_SIZE 512
>  	__le32                  *cmdbuf;
> @@ -323,6 +324,9 @@ struct s2255_buffer {
>  #define S2255_V4L2_YC_ON  1
>  #define S2255_V4L2_YC_OFF 0
>  #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
> +#define V4L2_CID_S2255_DEVICEID (V4L2_CID_USER_S2255_BASE + 1)
> +#define V4L2_CID_S2255_DSPFWVER (V4L2_CID_USER_S2255_BASE + 2)
> +#define V4L2_CID_S2255_USBFWVER (V4L2_CID_USER_S2255_BASE + 3)

Why do you want to expose this as controls? Usually such information
is output to the kernel log during probe since it shouldn't be needed
by userspace. At minimum the commit log should explain the reason for
adding these controls.

>  
>  /* frame prefix size (sent once every frame) */
>  #define PREFIX_SIZE		512
> @@ -1232,6 +1236,56 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int s2255_read_reg_burst(struct s2255_dev *dev, u8 dev_addr,
> +				u16 reg_addr, u8 *data, u8 datalen)
> +{
> +	int rc;
> +
> +	rc = s2255_vendor_req(dev, 0x22, reg_addr, dev_addr >> 1, data, datalen, 0);
> +	return rc;

Just do 'return s2255_...', no need for the rc variable.

> +}
> +
> +static int s2255_g_volatile_ctrl(struct v4l2_ctrl *ctrl)

These controls are definitely not volatile controls. Just
read out the registers during probe and create these read-only
controls with the correct initial value. No need to do anything
else. Unless these versions/device IDs dynamically change, which
is very unlikely.

> +{
> +	u8 *outbuf;
> +	int rc;
> +	struct s2255_vc *vc =
> +		container_of(ctrl->handler, struct s2255_vc, hdl);
> +	struct s2255_dev *dev = vc->dev;
> +
> +	if (ctrl->id == V4L2_CID_S2255_DSPFWVER) {
> +		ctrl->val = dev->dsp_fw_ver;
> +		return 0;
> +	}
> +	if (ctrl->id == V4L2_CID_S2255_USBFWVER) {
> +		ctrl->val = dev->usb_fw_ver;
> +		return 0;
> +	}
> +	if (ctrl->id != V4L2_CID_S2255_DEVICEID)
> +		return -EINVAL;
> +	if (dev == NULL)
> +		return -EINVAL;
> +#define S2255_I2C_SIZE     16
> +	outbuf = kzalloc(S2255_I2C_SIZE * sizeof(u8), GFP_KERNEL);
> +	if (outbuf == NULL)
> +		return -ENOMEM;
> +#define S2255_I2C_SNDEV    0xa2
> +#define S2255_I2C_SNOFFSET 0x1ff0
> +	rc = s2255_read_reg_burst(dev, S2255_I2C_SNDEV, S2255_I2C_SNOFFSET, outbuf, S2255_I2C_SIZE);
> +	if (rc < 0) {
> +		kfree(outbuf);
> +		return rc;
> +	}
> +	// verify marker code
> +	if (*(unsigned int *)outbuf != 0xddccbbaa) {

The 'media: usb: s2255: endian fix' patch fixes a bug introduced here. Just fold
that fix into this patch instead.

> +		kfree(outbuf);
> +		return -EFAULT;
> +	}
> +	ctrl->val = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] << 8) + outbuf[15];
> +	kfree(outbuf);
> +	return 0;
> +}
> +
>  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>  			 struct v4l2_jpegcompression *jc)
>  {
> @@ -1569,6 +1623,7 @@ static const struct video_device template = {
>  
>  static const struct v4l2_ctrl_ops s2255_ctrl_ops = {
>  	.s_ctrl = s2255_s_ctrl,
> +	.g_volatile_ctrl = s2255_g_volatile_ctrl,
>  };
>  
>  static const struct v4l2_ctrl_config color_filter_ctrl = {
> @@ -1581,6 +1636,42 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
>  	.def = 1,
>  };
>  
> +static const struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
> +	.ops = &s2255_ctrl_ops,
> +	.name = "Device ID",
> +	.id = V4L2_CID_S2255_DEVICEID,
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.max = 0xffffffff,
> +	.min = 0,
> +	.step = 1,
> +	.def = 0,
> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config v4l2_ctrl_dspfwver = {
> +	.ops = &s2255_ctrl_ops,
> +	.name = "DSP Firmware",
> +	.id = V4L2_CID_S2255_DSPFWVER,
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.max = 0xffffffff,
> +	.min = 0,
> +	.step = 1,
> +	.def = 0,
> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config v4l2_ctrl_usbfwver = {
> +	.ops = &s2255_ctrl_ops,
> +	.name = "USB Firmware",
> +	.id = V4L2_CID_S2255_USBFWVER,
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.max = 0xffffffff,
> +	.min = 0,
> +	.step = 1,
> +	.def = 0,
> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
>  static int s2255_probe_v4l(struct s2255_dev *dev)
>  {
>  	int ret;
> @@ -1615,6 +1706,12 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>  		    (dev->pid != 0x2257 || vc->idx <= 1))
>  			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
>  					     NULL);
> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_deviceid,
> +				NULL);
> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_usbfwver,
> +				NULL);
> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_dspfwver,
> +				NULL);
>  		if (vc->hdl.error) {
>  			ret = vc->hdl.error;
>  			v4l2_ctrl_handler_free(&vc->hdl);
> @@ -1983,6 +2080,7 @@ static int s2255_board_init(struct s2255_dev *dev)
>  	}
>  	/* query the firmware */
>  	fw_ver = s2255_get_fx2fw(dev);
> +	dev->usb_fw_ver = fw_ver;
>  
>  	pr_info("s2255: usb firmware version %d.%d\n",
>  		(fw_ver >> 8) & 0xff,

Regards,

	Hans

