Return-Path: <linux-media+bounces-49646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C262CE6F8B
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 15:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD3DF300BBB7
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865A424169D;
	Mon, 29 Dec 2025 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="hrWWJpK3"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster4-host2-snip4-10.eps.apple.com [57.103.78.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605261D5ADE
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017142; cv=none; b=WKxQwxY9mJERsdxD5Ukyt4031Bi7sdV/x0q5DSj4a2VRhStR4SqSl+3duIbW8ZlU+GVnYguKnAcCuCMZ/VR2e82ni0hYar5RLtH0e+T1p8kcxwVpCC6uUYv+9KQuNrsPXIssie2pTP/vew2dQQ5DXIj3U0WjkUA4K1qJDBGR4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017142; c=relaxed/simple;
	bh=v49BKDHvBwrpbQeTzD0LZH63/h1waVx1nc4AX48IrDY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fxdamwH0fotyaSKQfvhQtFXJ3kIyB2pvX1vYarapZhVsatt5yrPySWPUXBKoqBySftAObwyBAdyFjiEmyrV/JVnMz1TFFXfufD20gBL5badi6f0P6U7zB3s2E6dXtzUxCwFlDx6O4HdGTPKSDWKCwHHdNtI8//uTqA5L4MFW6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=hrWWJpK3; arc=none smtp.client-ip=57.103.78.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPS id 0DAF51800723;
	Mon, 29 Dec 2025 14:05:39 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=+Jq0Bv9StPcUfj56JjXYkDedslmRRBJkb+w2OUA5mRI=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=hrWWJpK3VlCFW9wSyCIGU6VrwW+lFj2E4ShgcX4dCGaDY41kgDIMZAoX9I3K4l/cQBHNP+0yeomGHZbMUDGKGWYLX95oYtkqdwQjHl6Sb4JdZqbmtbvxhLicMyG6nwd3PgmsfR78KGbxHdMIKvkOfhT6LuMI8hLShIRlX89gXPdh2UyDZNmqJL0lI0hVqsVLCnW46O0j82uk6Nzv/wlmxkaqvXQ+Y4uvWws3YbUdVzEojGPci5FAvd/NeBKcfp/U6IYHdbNCHaodS42fV0azr10u2sSTs64drttKJmlVeIgoDqEwC572g5VoRfGj7oE6bBFR2QFNh0R30RNZJuCemg==
Received: from smtpclient.apple (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPSA id 3806518001DC;
	Mon, 29 Dec 2025 14:05:38 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
From: Oliver Collyer <ovcollyer@mac.com>
In-Reply-To: <20251229093651.GA6598@pendragon.ideasonboard.com>
Date: Mon, 29 Dec 2025 14:05:26 +0000
Cc: hansg@kernel.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C10854E0-CEF6-4813-B3AF-7F3C3E898371@mac.com>
References: <20251227104858.GC4094@pendragon.ideasonboard.com>
 <80A19C25-C42F-4FBF-AA12-B8F230F8734E@mac.com>
 <20251229093651.GA6598@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEzMSBTYWx0ZWRfX4bpsj38DXFvT
 q208uWtwIwgMmLvkgMwPrMQ8mvhHi5FNr8RccrMuuzlaP8PJXic5oqBXyfcBA3sBOcfcWBbyTZK
 nvJD2kf9kuenUF/8eDGDkHnRPbUsQUoDBdYg5o+vTBMZEZeGSaSbSyE62TuTDFGpIWYPoYgfVt/
 GKPHJc0y+J03cS7lvykNGkQTHPDKlt07HCyDJIEpRSztECykvHM1npigSvmQha37UDfoGlePM7q
 eul6CrD/eWHECDThalHekRFkCkN70Y8bDjMjRGONlw4bKNGHjI2QACMTfT0W4LVo/PRIb/6x75s
 Tq6Q/jsT7px1jCVQ6E+
X-Proofpoint-GUID: VLr-R4Lw5g_rOHU6ICSM0gDcGkiOgK2f
X-Proofpoint-ORIG-GUID: VLr-R4Lw5g_rOHU6ICSM0gDcGkiOgK2f
X-Authority-Info: v=2.4 cv=eoXSD4pX c=1 sm=1 tr=0 ts=69528ab3 cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=x7bEGLp0ZPQA:10 a=_fXtljRHFhkA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=P1BnusSwAAAA:8
 a=n-kJSqksAAAA:8 a=ENlWZkRf7WroA_yYMDIA:9 a=QEXdDO2ut3YA:10 a=TucxLVmUXSYA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=fMAGXkzVR7cRuVcbbVfL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512290131
X-JNJ: AAAAAAAB7cvH0jfpYyOpvGw9QloYtmLFS5JtJtiAKx+ab13zk6P6EKy9s6/ecFQsGe7O+ZkEuckrUbJbfDZcn8BV4fxDc3XRpXVTdcJcan8yzpzki5TiQ1FpbHK7PZhJjxoUCFoS58kwdaCjSzpQHHJY/aa3I2gz01JhdQ+/Jn0H/mXPhCvb6OktXmLvn6NE3tiqbFoMuA4yIDOk3noFznb2yy1LmoLbNEUQRr1xBl51IwcElCNGds7xTxB7l7E6QOw/PCF7XoosfV8+u6/K6R3e1i/CLd2ukTyZgBxgk8JaT3AYyJyiiURC/68fdRpADO3qfSZCaiH/tgK1yymMPsLt7SUavil8M8Ee3hBJSMNuddktVfB7zPjzpUs+g7O7gDSEIaPQ6Vx5SOqAu3RgTJ2JUsZXxlQCSX3L3FHj8dkuMXXboW7hFFHixK91BC8bizMM62mN26oN0ynk2ZxefZxos5KsVPZ7mSXLOPQLpAXXzBiQut9/vN1eL6zc+gu+Acgw1k58x8y9flN67bNM89fBU7NN+WHgUTIL3qOEAA/vpwDPv2qCADo/mhbAG2IjXishExmRuo7yyi7dmWzzFsNQY2AjIQZLycgQ78ijNF12Jo7b1Fo7VmBld+BKAMP+4ktp07TgJjryY7w+0fHWSeA7/i8I

Hi Laurent

The dodgy link can be dropped - I think it is just trying to reference =
the previously failed patch submission (v1) which the bot rejected for =
some sort of formatting issue.

Kind Regards

Oliver

> On 29 Dec 2025, at 09:36, Laurent Pinchart =
<laurent.pinchart@ideasonboard.com> wrote:
>=20
> Hi Oliver,
>=20
> On Mon, Dec 29, 2025 at 06:38:25AM +0000, Oliver Collyer wrote:
>> Hi Laurent
>>=20
>> Thank you for that, I understand; I would probably use the web patch
>> submission method if there was a next time - however, do I need to
>> submit this patch again or are we good?
>=20
> I can fix the commit message if you provide the correct link.
>=20
>>> On 27 Dec 2025, at 10:49, Laurent Pinchart wrote:
>>>=20
>>> =EF=BB=BFHi Oliver,
>>>=20
>>>> On Fri, Dec 26, 2025 at 10:26:50PM +0000, Oliver Collyer wrote:
>>>> Hello Laurent
>>>>=20
>>>> Please find attached the relevant output from =E2=80=98lsusb -v=E2=80=
=99 for the device.
>>>=20
>>> Thank you.
>>>=20
>>>> I=E2=80=99m not sure what is wrong with my email setup or what =
exactly you=E2=80=99re
>>>> seeing but I=E2=80=99ll try and figure it out, sorry!
>>>=20
>>> Something somewhere replaced the message ID in the Link: trailer =
with
>>> "[email protected]":
>>>=20
>>> Link: https://lore.kernel.org/linux-media/[email protected]/
>>>=20
>>> The vger.kernel.org server doesn't do that, so it must be on your =
side.
>>> Given that you seem to have used git-send-email (based on the =
"X-Mailer:
>>> git-send-email 2.43.0" mail header in your patch), I assume it must =
have
>>> happened somewhere on icloud. I don't know if the behaviour can be
>>> configured, if not you may need to consider switching to a different
>>> e-mail provider that doesn't mangle with the content of patches. =
Another
>>> option would be to submit patches using the b4 web submission =
endpoint,
>>> see https://b4.docs.kernel.org/en/latest/contributor/send.html.
>>>=20
>>> [snip]
>>>=20
>>>>>> On 26 Dec 2025, at 20:42, Laurent Pinchart wrote:
>>>>> On Fri, Dec 26, 2025 at 06:57:18AM +0000, Oliver Collyer wrote:
>>>>>> Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
>>>>>> uvcvideo driver. This format is exposed by USB capture devices =
such as
>>>>>> the Magewell USB Capture HDMI 4K Pro when capturing HDR10 =
content.
>>>>>=20
>>>>> Could you pelase provide the 'lsusb -v' output for that device ?
>>>>>=20
>>>>>> P010 stores 10-bit Y and interleaved UV samples in 16-bit =
little-endian
>>>>>> words, with data in the upper 10 bits and zeros in the lower 6 =
bits.
>>>>>> This requires 2 bytes per sample, so bytesperline is wWidth * 2.
>>>>>>=20
>>>>>> V4L2_PIX_FMT_P010 was added to the V4L2 core in commit =
5374d8fb75f3
>>>>>> ("media: Add P010 video format").
>>>>>>=20
>>>>>> Based on the community DKMS patch from awawa-dev/P010_for_V4L2.
>>>>>>=20
>>>>>> Link: https://lore.kernel.org/linux-media/[email protected]/
>>>>>=20
>>>>> Please fix your e-mail setup to avoid this.
>>>>>=20
>>>>>> Link: https://github.com/awawa-dev/P010_for_V4L2
>>>>>> Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
>>>>>> ---
>>>>>> drivers/media/common/uvc.c       | 4 ++++
>>>>>> drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
>>>>>> include/linux/usb/uvc.h          | 3 +++
>>>>>> 3 files changed, 10 insertions(+)
>>>>>>=20
>>>>>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
>>>>>> --- a/include/linux/usb/uvc.h
>>>>>> +++ b/include/linux/usb/uvc.h
>>>>>> @@ -109,6 +109,9 @@
>>>>>> #define UVC_GUID_FORMAT_M420 \
>>>>>>   { 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
>>>>>>    0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>>>>>> +#define UVC_GUID_FORMAT_P010 \
>>>>>> +    { 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
>>>>>> +     0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>>>>>>=20
>>>>>> #define UVC_GUID_FORMAT_H264 \
>>>>>>   { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
>>>>>> diff --git a/drivers/media/common/uvc.c =
b/drivers/media/common/uvc.c
>>>>>> --- a/drivers/media/common/uvc.c
>>>>>> +++ b/drivers/media/common/uvc.c
>>>>>> @@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] =
=3D {
>>>>>>       .guid        =3D UVC_GUID_FORMAT_M420,
>>>>>>       .fcc        =3D V4L2_PIX_FMT_M420,
>>>>>>   },
>>>>>> +    {
>>>>>> +        .guid        =3D UVC_GUID_FORMAT_P010,
>>>>>> +        .fcc        =3D V4L2_PIX_FMT_P010,
>>>>>> +    },
>>>>>>   {
>>>>>>       .guid        =3D UVC_GUID_FORMAT_UYVY,
>>>>>>       .fcc        =3D V4L2_PIX_FMT_UYVY,
>>>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c =
b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>>> @@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const =
struct uvc_format *format,
>>>>>>   case V4L2_PIX_FMT_M420:
>>>>>>       return frame->wWidth;
>>>>>>=20
>>>>>> +    case V4L2_PIX_FMT_P010:
>>>>>> +        return frame->wWidth * 2;
>>>>>> +
>>>>>>   default:
>>>>>>       return format->bpp * frame->wWidth / 8;
>>>>>>   }
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20


