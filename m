Return-Path: <linux-media+bounces-1935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B68809D3A
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 08:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46D91F21144
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 07:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E33C107A7;
	Fri,  8 Dec 2023 07:37:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FD10799
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6951AC433CD;
	Fri,  8 Dec 2023 07:37:19 +0000 (UTC)
Message-ID: <f0bfe979-8b54-4605-a2d5-e7ad2c70113d@xs4all.nl>
Date: Fri, 8 Dec 2023 08:37:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: usb: s2255: device-id custom V4L2_CID
Content-Language: en-US, nl
To: dean@sensoray.com
Cc: linux-media@vger.kernel.org
References: <20231122194838.13285-1-dean@sensoray.com>
 <479c1d97-6df6-4a97-9542-c8819bd03d27@xs4all.nl>
 <22f5d529d3f25b61b3bce7611140469a@sensoray.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <22f5d529d3f25b61b3bce7611140469a@sensoray.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/12/2023 01:03, dean@sensoray.com wrote:
> Hi Hans,
> 
>>> +static struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
>>> +    .ops = &s2255_ctrl_ops,
>>> +    .name = "Device ID",
>>> +    .id = V4L2_CID_S2255_DEVICEID,
>>> +    .type = V4L2_CTRL_TYPE_INTEGER,
>>
>> Please note that TYPE_INTEGER is a signed integer.
>>
>> If you need an unsigned integer, then use TYPE_U32.
> 
> 
> It is unsigned, but it doesn't need to be. The max value should not run into a signed value. I can change the maximum value from 0xffffffff to 0x7fffffff.
> 
> Is it acceptable to not use TYPE_U32 in order to simplify the user space calls?

Certainly!

	Hans

> 
> TYPE_U32 is a compound type. My understanding is VIDIOC_G_CTRL will not work with compound types and some V4L user programs may not implement the compound type queries.
> 
> Best regards,
> 
> Dean
> 
> 
> 
> 
> On 2023-12-06 03:43, Hans Verkuil wrote:
>> Hi Dean,
>>
>> Some comments below:
>>
>> On 22/11/2023 20:48, Dean Anderson wrote:
>>> Adding V4L2 read-only control id for device id as hardware
>>> does not support embedding the device-id in the USB device descriptors.
>>>
>>> base-commit: 3e238417254bfdcc23fe207780b59cbb08656762
>>
>> Just drop this line, it doesn't belong in a commit message.
>>
>>>
>>> Signed-off-by: Dean Anderson <dean@sensoray.com>
>>>
>>> ---
>>>  drivers/media/usb/s2255/s2255drv.c | 49 +++++++++++++++++++++++++++++-
>>>  1 file changed, 48 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
>>> index 3c2627712fe9..c2248bbc7840 100644
>>> --- a/drivers/media/usb/s2255/s2255drv.c
>>> +++ b/drivers/media/usb/s2255/s2255drv.c
>>> @@ -40,7 +40,7 @@
>>>  #include <media/v4l2-ctrls.h>
>>>  #include <media/v4l2-event.h>
>>>
>>> -#define S2255_VERSION        "1.25.1"
>>> +#define S2255_VERSION        "1.26.1"
>>>  #define FIRMWARE_FILE_NAME "f2255usb.bin"
>>>
>>>  /* default JPEG quality */
>>> @@ -60,6 +60,7 @@
>>>  #define S2255_MIN_BUFS          2
>>>  #define S2255_SETMODE_TIMEOUT   500
>>>  #define S2255_VIDSTATUS_TIMEOUT 350
>>> +#define S2255_MARKER_FIRMWARE    cpu_to_le32(0xDDCCBBAAL)
>>>  #define S2255_MARKER_FRAME    cpu_to_le32(0x2255DA4AL)
>>>  #define S2255_MARKER_RESPONSE    cpu_to_le32(0x2255ACACL)
>>>  #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
>>> @@ -323,6 +324,7 @@ struct s2255_buffer {
>>>  #define S2255_V4L2_YC_ON  1
>>>  #define S2255_V4L2_YC_OFF 0
>>>  #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
>>> +#define V4L2_CID_S2255_DEVICEID (V4L2_CID_USER_S2255_BASE + 1)
>>>
>>>  /* frame prefix size (sent once every frame) */
>>>  #define PREFIX_SIZE        512
>>> @@ -1232,6 +1234,37 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>>>      return 0;
>>>  }
>>>
>>> +/* deviceid/serial number is not used in usb device descriptors.
>>> + * returns device-id/serial number from device, 0 if none found.
>>
>> Please put the '/*' on a line by itself, that's consistent with the
>> coding style for multi-line comments.
>>
>> Also run the patch through 'checkpatch.pl --strict'. I get several
>> warnings.
>>
>> returns -> Returns
>>
>> One question about this comment: is the Device ID the same as a serial
>> number? "Device ID" can mean either the ID of a device model, or a unique
>> ID for each device. If it is the latter, should it perhaps be called
>> "Device S/N" or just "Serial Number"?
>>
>>> + */
>>> +#define S2255_DEVICEID_NONE 0
>>> +static int s2255_g_deviceid(struct s2255_dev *dev)
>>> +{
>>> +    u8 *outbuf;
>>> +    int rc;
>>> +    int deviceid = S2255_DEVICEID_NONE;
>>> +#define S2255_I2C_SIZE     16
>>> +    outbuf = kzalloc(S2255_I2C_SIZE * sizeof(u8), GFP_KERNEL);
>>
>> Drop the "* sizeof(u8)", it serves no purpose.
>>
>>> +    if (outbuf == NULL)
>>> +        return deviceid;
>>> +#define S2255_I2C_SNDEV    0xa2
>>> +#define S2255_I2C_SNOFFSET 0x1ff0
>>> +#define S2255_USBVENDOR_READREG 0x22
>>> +    rc = s2255_vendor_req(dev, S2255_USBVENDOR_READREG, S2255_I2C_SNOFFSET,
>>> +            S2255_I2C_SNDEV >> 1, outbuf, S2255_I2C_SIZE, 0);
>>> +    if (rc < 0)
>>> +        goto exit_g_deviceid;
>>> +
>>> +    /* verify marker code */
>>> +    if (*(__le32 *)outbuf != S2255_MARKER_FIRMWARE)
>>> +        goto exit_g_deviceid;
>>> +
>>> +    deviceid = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] << 8) + outbuf[15];
>>> +exit_g_deviceid:
>>> +    kfree(outbuf);
>>> +    return deviceid;
>>
>> This is overly complicated. How about this:
>>
>>     /* verify marker code */
>>     if (*(__le32 *)outbuf == S2255_MARKER_FIRMWARE)
>>         deviceid = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] <<
>> 8) + outbuf[15];
>>     kfree(outbuf);
>>     return deviceid;
>>
>>> +}
>>> +
>>>  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>>>               struct v4l2_jpegcompression *jc)
>>>  {
>>> @@ -1581,6 +1614,17 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
>>>      .def = 1,
>>>  };
>>>
>>> +static struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
>>> +    .ops = &s2255_ctrl_ops,
>>> +    .name = "Device ID",
>>> +    .id = V4L2_CID_S2255_DEVICEID,
>>> +    .type = V4L2_CTRL_TYPE_INTEGER,
>>
>> Please note that TYPE_INTEGER is a signed integer.
>>
>> If you need an unsigned integer, then use TYPE_U32.
>>
>>> +    .max = 0xffffffff,
>>> +    .min = 0,
>>> +    .step = 1,
>>> +    .flags = V4L2_CTRL_FLAG_READ_ONLY,
>>> +};
>>> +
>>>  static int s2255_probe_v4l(struct s2255_dev *dev)
>>>  {
>>>      int ret;
>>> @@ -1615,6 +1659,9 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>>>              (dev->pid != 0x2257 || vc->idx <= 1))
>>>              v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
>>>                           NULL);
>>> +        v4l2_ctrl_deviceid.def = s2255_g_deviceid(dev);
>>> +        v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_deviceid,
>>> +                    NULL);
>>>          if (vc->hdl.error) {
>>>              ret = vc->hdl.error;
>>>              v4l2_ctrl_handler_free(&vc->hdl);
>>
>> Regards,
>>
>>     Hans


