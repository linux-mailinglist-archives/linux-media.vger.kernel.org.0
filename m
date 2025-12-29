Return-Path: <linux-media+bounces-49628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777BCE60A9
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C2AA30062E0
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198CC2D062F;
	Mon, 29 Dec 2025 06:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="Ko1Mrp5+"
X-Original-To: linux-media@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster5-host3-snip4-10.eps.apple.com [57.103.79.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74C4770FE
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990321; cv=none; b=Vubm7t/tdVHFJHJTINk8h4FAKRDh4nQ6dglFxDhbVBnADEhQgBMJt7kQRWjA729mOK1zSolpUDW0G36w3JI4eKdenucbHaTkJQ1asT1BlFdDclIL6gySLgf1+4vTbqEG9RCB+s/3pRnfM02gggai+/1fUZsVQX4IB3/GfL4bgns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990321; c=relaxed/simple;
	bh=zrNPlnYun0UBOn5MQxPfrWeyRwhDbDaeRdwbiFI2Rr0=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=f6NBQcYQKFLRN+11o0TmP3r8zUOPZzLX2bBfQf3Pr2CzapTOHvCLH3heZ4bKJqz3rePz8cPq9TSRGiAHC11AwynHvJW8RJybY4kS2O5aAq6XJtC03fFV5P7T+AvQW1IRjG2vSLuxgGf7oaSeMXTw6yU2F2yyc5Z3smL2WgLp7AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=Ko1Mrp5+; arc=none smtp.client-ip=57.103.79.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-1 (Postfix) with ESMTPS id A7478180011E;
	Mon, 29 Dec 2025 06:38:37 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=AojBZ/eUuz+eA1aLH5lSn9dODE6VfqZqr8NP94TKjxI=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=Ko1Mrp5+oSxkt5a2Z3hHGadohU+GKpyNM+DZvncDcFQurqVdGltt4OTMw4E5oQXPAdtc0UW1/j4BjIdSgnBsSNCItFzi2B7BtWzpAOhvSWZY9i7UDU8Qe9n+U3WIhQ/EvFN5Q5CU/GT4hoQGUoxHzudvwUAi4PeVvP6DP0AOHsBT1h+ATwazszq0My25Bh9rNZ9BNaTmmVPbBSwbXFu9yFEAWI+C5oolb5PayZiuBMzJM0Q240XGuTr08hSNvKea3xjGyuEbjR0oSoPdXLxvRMLOBHIml5ugiJbXvmASfJzDO/aE7m34JWsuv+fhCj9X5SduJVYdeNjH2ymKbdomYQ==
Received: from smtpclient.apple (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-1 (Postfix) with ESMTPSA id F0FB7180012C;
	Mon, 29 Dec 2025 06:38:36 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Oliver Collyer <ovcollyer@mac.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
Date: Mon, 29 Dec 2025 06:38:25 +0000
Message-Id: <80A19C25-C42F-4FBF-AA12-B8F230F8734E@mac.com>
References: <20251227104858.GC4094@pendragon.ideasonboard.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20251227104858.GC4094@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: iPhone Mail (23C55)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA2MCBTYWx0ZWRfXzXAlMe9gI7B4
 VaLNMBO2czhim38MBJOwvVXRcL1T/+lpVW704SVVE4n7L40wqlwC1uv3gH3no0NiT5YW48ufYAZ
 0gNjKuI3+zTe1/lKen/a/Am9OJ8wGwyjD98Y35qqQGpuokTa+7TMBacgGBF7Ii3+LPQmaKSq1Aq
 iKdSt9acUJZ7AJREfP5T7QxwveRihj1WG7vhM6RvCscf/qRNMVPfWeBV2KKceMgjqGg4nrs26kY
 g/KcnSj9R60yTGZ26u2rjTnkNJjfu1Su/E4V0zRCcpxJ9ignwC/PW4XGUxVbHPhZHfeRPxMJJur
 ou6XSxFC5xekRb+++sr
X-Proofpoint-GUID: aR-YRUcp0KDJNEz-8k1blyU0DnBDtZeI
X-Authority-Info: v=2.4 cv=a8A9NESF c=1 sm=1 tr=0 ts=695221ee cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=x7bEGLp0ZPQA:10 a=_fXtljRHFhkA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=P1BnusSwAAAA:8
 a=n-kJSqksAAAA:8 a=dtZPiwcHvGOI1zKuAVcA:9 a=QEXdDO2ut3YA:10 a=TucxLVmUXSYA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=fMAGXkzVR7cRuVcbbVfL:22
X-Proofpoint-ORIG-GUID: aR-YRUcp0KDJNEz-8k1blyU0DnBDtZeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512290060
X-JNJ: AAAAAAABTbWYvvjGXjJrThEUmFYkDGm2hPFUhN/Fmpmeam8kYtUhEiDZsXpDvEOsvqdrwtxml3GRRp03Y8jItkpGssCQediCKFUH0pX+lUWCFTY1cIs1B++az/fRwDGQ6b73JIgEdN4wQbOTaeKGykoj2QIn8Iany3LA6X4O5crQFMYi9wnCb1AjiGA9Kb/wY71I5DRfI4wqkmOsX0D5Ln9Hs9GApEqrqHeqbfpsbAZcLHU64Ak5PxCcLGcyqMAhuVoZwxjFsgYuaD9TflYzZq5bsqbJzemmRMW9qBXJxdP9SwnZMakSLxVXlqIn4rw4gIiJbtxaIG9zQh1HDFwvgkU8QcGkBp1hU/QePo8tPvs87Z5iS+bizBIn7bqXvNWyixVlGuyOOsBdcor+j1CkSUZdkgG6i+50z9oEWJreUNJ6F+5r2t9LaFTyQF1GsgZlnvJoMhuSvunJGySWpPNc71OygcurpPgUKAJWaB0ga0rnpZDKnBbT1R47tAAutipe2qVu8v/a0bSLQJ34vtPniGc9Gkwg4QwThANMBKAtNIR6fx/DqexAhMR5uLzKGtWT0+fnWva9bVlotAkkIBggXmDsEXaI5JP7dWWE0To9Cyzgai4Wu+yosRtIAjY5j9ciQaw9dnA0K8rrH/MpnhPgvd8rjmA=

Hi Laurent

Thank you for that, I understand; I would probably use the web patch submiss=
ion method if there was a next time - however, do I need to submit this patc=
h again or are we good?

Kind Regards

Oliver

> On 27 Dec 2025, at 10:49, Laurent Pinchart <laurent.pinchart@ideasonboard.=
com> wrote:
>=20
> =EF=BB=BFHi Oliver,
>=20
>> On Fri, Dec 26, 2025 at 10:26:50PM +0000, Oliver Collyer wrote:
>> Hello Laurent
>>=20
>> Please find attached the relevant output from =E2=80=98lsusb -v=E2=80=99 f=
or the device.
>=20
> Thank you.
>=20
>> I=E2=80=99m not sure what is wrong with my email setup or what exactly yo=
u=E2=80=99re
>> seeing but I=E2=80=99ll try and figure it out, sorry!
>=20
> Something somewhere replaced the message ID in the Link: trailer with
> "[email protected]":
>=20
> Link: https://lore.kernel.org/linux-media/[email protected]/
>=20
> The vger.kernel.org server doesn't do that, so it must be on your side.
> Given that you seem to have used git-send-email (based on the "X-Mailer:
> git-send-email 2.43.0" mail header in your patch), I assume it must have
> happened somewhere on icloud. I don't know if the behaviour can be
> configured, if not you may need to consider switching to a different
> e-mail provider that doesn't mangle with the content of patches. Another
> option would be to submit patches using the b4 web submission endpoint,
> see https://b4.docs.kernel.org/en/latest/contributor/send.html.
>=20
> [snip]
>=20
>>>> On 26 Dec 2025, at 20:42, Laurent Pinchart wrote:
>>> On Fri, Dec 26, 2025 at 06:57:18AM +0000, Oliver Collyer wrote:
>>>> Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
>>>> uvcvideo driver. This format is exposed by USB capture devices such as
>>>> the Magewell USB Capture HDMI 4K Pro when capturing HDR10 content.
>>>=20
>>> Could you pelase provide the 'lsusb -v' output for that device ?
>>>=20
>>>> P010 stores 10-bit Y and interleaved UV samples in 16-bit little-endian=

>>>> words, with data in the upper 10 bits and zeros in the lower 6 bits.
>>>> This requires 2 bytes per sample, so bytesperline is wWidth * 2.
>>>>=20
>>>> V4L2_PIX_FMT_P010 was added to the V4L2 core in commit 5374d8fb75f3
>>>> ("media: Add P010 video format").
>>>>=20
>>>> Based on the community DKMS patch from awawa-dev/P010_for_V4L2.
>>>>=20
>>>> Link: https://lore.kernel.org/linux-media/[email protected]/
>>>=20
>>> Please fix your e-mail setup to avoid this.
>>>=20
>>>> Link: https://github.com/awawa-dev/P010_for_V4L2
>>>> Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
>>>> ---
>>>> drivers/media/common/uvc.c       | 4 ++++
>>>> drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
>>>> include/linux/usb/uvc.h          | 3 +++
>>>> 3 files changed, 10 insertions(+)
>>>>=20
>>>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
>>>> --- a/include/linux/usb/uvc.h
>>>> +++ b/include/linux/usb/uvc.h
>>>> @@ -109,6 +109,9 @@
>>>> #define UVC_GUID_FORMAT_M420 \
>>>>    { 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
>>>>     0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>>>> +#define UVC_GUID_FORMAT_P010 \
>>>> +    { 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
>>>> +     0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>>>>=20
>>>> #define UVC_GUID_FORMAT_H264 \
>>>>    { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
>>>> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
>>>> --- a/drivers/media/common/uvc.c
>>>> +++ b/drivers/media/common/uvc.c
>>>> @@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] =3D {=

>>>>        .guid        =3D UVC_GUID_FORMAT_M420,
>>>>        .fcc        =3D V4L2_PIX_FMT_M420,
>>>>    },
>>>> +    {
>>>> +        .guid        =3D UVC_GUID_FORMAT_P010,
>>>> +        .fcc        =3D V4L2_PIX_FMT_P010,
>>>> +    },
>>>>    {
>>>>        .guid        =3D UVC_GUID_FORMAT_UYVY,
>>>>        .fcc        =3D V4L2_PIX_FMT_UYVY,
>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>>> @@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct u=
vc_format *format,
>>>>    case V4L2_PIX_FMT_M420:
>>>>        return frame->wWidth;
>>>>=20
>>>> +    case V4L2_PIX_FMT_P010:
>>>> +        return frame->wWidth * 2;
>>>> +
>>>>    default:
>>>>        return format->bpp * frame->wWidth / 8;
>>>>    }
>=20
> --
> Regards,
>=20
> Laurent Pinchart
>=20

