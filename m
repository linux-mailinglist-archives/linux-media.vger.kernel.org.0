Return-Path: <linux-media+bounces-1907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FA8096DE
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 01:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BE7282179
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 00:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6313371;
	Fri,  8 Dec 2023 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="DeJxlAO6"
X-Original-To: linux-media@vger.kernel.org
Received: from omta039.useast.a.cloudfilter.net (omta039.useast.a.cloudfilter.net [44.202.169.38])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225131713
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 16:03:33 -0800 (PST)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id BMpSrLAjT6nOZBOL7rZfgK; Fri, 08 Dec 2023 00:03:33 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id BOL5r1TFiqkaTBOL6rvjIC; Fri, 08 Dec 2023 00:03:32 +0000
X-Authority-Analysis: v=2.4 cv=bY547cDB c=1 sm=1 tr=0 ts=65725d54
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10 a=e2cXIFwxEfEA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8
 a=FnjLlJzlEcOYaycGDHYA:9 a=CjuIK1q_8ugA:10 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hKeDHJQzB5CjG2U534F4I6vilf1ulPTrpgUcrYnLSN4=; b=DeJxlAO6gNoLdUQcvItb/X2Otc
	UomIboV15eeWbd7IPCPitqOPDKwPcBOyC/vOCw7MuzE2WhYngieYKEHwYhXbYObEP2YHoEZYFq05f
	nVTVMIeQuv+lf2RO7r7MYffbaftc/eUlywnDQ55tWH43w2Bz5BjuGuDwW+6P428uxavw=;
Received: from gator3086.hostgator.com ([50.87.144.121]:28536)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1rBOL5-001LvI-LJ;
	Thu, 07 Dec 2023 18:03:31 -0600
Received: from mail.thomaswright.com ([50.126.89.90])
 by www.sensoray.com
 with HTTP (HTTP/1.1 POST); Thu, 07 Dec 2023 18:03:31 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 07 Dec 2023 18:03:31 -0600
From: dean@sensoray.com
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: usb: s2255: device-id custom V4L2_CID
In-Reply-To: <479c1d97-6df6-4a97-9542-c8819bd03d27@xs4all.nl>
References: <20231122194838.13285-1-dean@sensoray.com>
 <479c1d97-6df6-4a97-9542-c8819bd03d27@xs4all.nl>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <22f5d529d3f25b61b3bce7611140469a@sensoray.com>
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
X-Exim-ID: 1rBOL5-001LvI-LJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator3086.hostgator.com [50.87.144.121]:28536
X-Source-Auth: dean@sensoray.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNgXN7DTrt3bKJsNZ1ngFvWJaIImNa6qBt5dikSMk1ZS6LuMig09Wi93KfYpUTsR2EV5WladR/dTcKJifmDFM1sQgQtJbsbdqYqPOuqDGjmZJ1o5WG0R
 SqD7uwK6w0n9bTp5B8woIzfxL79r4wDB48AAX3d9qzWFDxkQeZ+f5lBgea2nP7bqKQIfoRKZAdLHe1tOjW5I9CYNyx+t56rZ428=

Hi Hans,

>> +static struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
>> +	.ops = &s2255_ctrl_ops,
>> +	.name = "Device ID",
>> +	.id = V4L2_CID_S2255_DEVICEID,
>> +	.type = V4L2_CTRL_TYPE_INTEGER,
> 
> Please note that TYPE_INTEGER is a signed integer.
> 
> If you need an unsigned integer, then use TYPE_U32.


It is unsigned, but it doesn't need to be. The max value should not run 
into a signed value. I can change the maximum value from 0xffffffff to 
0x7fffffff.

Is it acceptable to not use TYPE_U32 in order to simplify the user space 
calls?

TYPE_U32 is a compound type. My understanding is VIDIOC_G_CTRL will not 
work with compound types and some V4L user programs may not implement 
the compound type queries.

Best regards,

Dean




On 2023-12-06 03:43, Hans Verkuil wrote:
> Hi Dean,
> 
> Some comments below:
> 
> On 22/11/2023 20:48, Dean Anderson wrote:
>> Adding V4L2 read-only control id for device id as hardware
>> does not support embedding the device-id in the USB device 
>> descriptors.
>> 
>> base-commit: 3e238417254bfdcc23fe207780b59cbb08656762
> 
> Just drop this line, it doesn't belong in a commit message.
> 
>> 
>> Signed-off-by: Dean Anderson <dean@sensoray.com>
>> 
>> ---
>>  drivers/media/usb/s2255/s2255drv.c | 49 
>> +++++++++++++++++++++++++++++-
>>  1 file changed, 48 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/media/usb/s2255/s2255drv.c 
>> b/drivers/media/usb/s2255/s2255drv.c
>> index 3c2627712fe9..c2248bbc7840 100644
>> --- a/drivers/media/usb/s2255/s2255drv.c
>> +++ b/drivers/media/usb/s2255/s2255drv.c
>> @@ -40,7 +40,7 @@
>>  #include <media/v4l2-ctrls.h>
>>  #include <media/v4l2-event.h>
>> 
>> -#define S2255_VERSION		"1.25.1"
>> +#define S2255_VERSION		"1.26.1"
>>  #define FIRMWARE_FILE_NAME "f2255usb.bin"
>> 
>>  /* default JPEG quality */
>> @@ -60,6 +60,7 @@
>>  #define S2255_MIN_BUFS          2
>>  #define S2255_SETMODE_TIMEOUT   500
>>  #define S2255_VIDSTATUS_TIMEOUT 350
>> +#define S2255_MARKER_FIRMWARE	cpu_to_le32(0xDDCCBBAAL)
>>  #define S2255_MARKER_FRAME	cpu_to_le32(0x2255DA4AL)
>>  #define S2255_MARKER_RESPONSE	cpu_to_le32(0x2255ACACL)
>>  #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
>> @@ -323,6 +324,7 @@ struct s2255_buffer {
>>  #define S2255_V4L2_YC_ON  1
>>  #define S2255_V4L2_YC_OFF 0
>>  #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
>> +#define V4L2_CID_S2255_DEVICEID (V4L2_CID_USER_S2255_BASE + 1)
>> 
>>  /* frame prefix size (sent once every frame) */
>>  #define PREFIX_SIZE		512
>> @@ -1232,6 +1234,37 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	return 0;
>>  }
>> 
>> +/* deviceid/serial number is not used in usb device descriptors.
>> + * returns device-id/serial number from device, 0 if none found.
> 
> Please put the '/*' on a line by itself, that's consistent with the
> coding style for multi-line comments.
> 
> Also run the patch through 'checkpatch.pl --strict'. I get several
> warnings.
> 
> returns -> Returns
> 
> One question about this comment: is the Device ID the same as a serial
> number? "Device ID" can mean either the ID of a device model, or a 
> unique
> ID for each device. If it is the latter, should it perhaps be called
> "Device S/N" or just "Serial Number"?
> 
>> + */
>> +#define S2255_DEVICEID_NONE 0
>> +static int s2255_g_deviceid(struct s2255_dev *dev)
>> +{
>> +	u8 *outbuf;
>> +	int rc;
>> +	int deviceid = S2255_DEVICEID_NONE;
>> +#define S2255_I2C_SIZE     16
>> +	outbuf = kzalloc(S2255_I2C_SIZE * sizeof(u8), GFP_KERNEL);
> 
> Drop the "* sizeof(u8)", it serves no purpose.
> 
>> +	if (outbuf == NULL)
>> +		return deviceid;
>> +#define S2255_I2C_SNDEV    0xa2
>> +#define S2255_I2C_SNOFFSET 0x1ff0
>> +#define S2255_USBVENDOR_READREG 0x22
>> +	rc = s2255_vendor_req(dev, S2255_USBVENDOR_READREG, 
>> S2255_I2C_SNOFFSET,
>> +			S2255_I2C_SNDEV >> 1, outbuf, S2255_I2C_SIZE, 0);
>> +	if (rc < 0)
>> +		goto exit_g_deviceid;
>> +
>> +	/* verify marker code */
>> +	if (*(__le32 *)outbuf != S2255_MARKER_FIRMWARE)
>> +		goto exit_g_deviceid;
>> +
>> +	deviceid = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] << 
>> 8) + outbuf[15];
>> +exit_g_deviceid:
>> +	kfree(outbuf);
>> +	return deviceid;
> 
> This is overly complicated. How about this:
> 
> 	/* verify marker code */
> 	if (*(__le32 *)outbuf == S2255_MARKER_FIRMWARE)
> 		deviceid = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] <<
> 8) + outbuf[15];
> 	kfree(outbuf);
> 	return deviceid;
> 
>> +}
>> +
>>  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>>  			 struct v4l2_jpegcompression *jc)
>>  {
>> @@ -1581,6 +1614,17 @@ static const struct v4l2_ctrl_config 
>> color_filter_ctrl = {
>>  	.def = 1,
>>  };
>> 
>> +static struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
>> +	.ops = &s2255_ctrl_ops,
>> +	.name = "Device ID",
>> +	.id = V4L2_CID_S2255_DEVICEID,
>> +	.type = V4L2_CTRL_TYPE_INTEGER,
> 
> Please note that TYPE_INTEGER is a signed integer.
> 
> If you need an unsigned integer, then use TYPE_U32.
> 
>> +	.max = 0xffffffff,
>> +	.min = 0,
>> +	.step = 1,
>> +	.flags = V4L2_CTRL_FLAG_READ_ONLY,
>> +};
>> +
>>  static int s2255_probe_v4l(struct s2255_dev *dev)
>>  {
>>  	int ret;
>> @@ -1615,6 +1659,9 @@ static int s2255_probe_v4l(struct s2255_dev 
>> *dev)
>>  		    (dev->pid != 0x2257 || vc->idx <= 1))
>>  			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
>>  					     NULL);
>> +		v4l2_ctrl_deviceid.def = s2255_g_deviceid(dev);
>> +		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_deviceid,
>> +					NULL);
>>  		if (vc->hdl.error) {
>>  			ret = vc->hdl.error;
>>  			v4l2_ctrl_handler_free(&vc->hdl);
> 
> Regards,
> 
> 	Hans

