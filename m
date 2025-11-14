Return-Path: <linux-media+bounces-47087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C423C5D611
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D6BF8344360
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E528431A54A;
	Fri, 14 Nov 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="1aJcIsXg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8B243951
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127237; cv=none; b=A7RhMgZMnro6aXi/2BmSdi30K2cFmsVTd9LCShiohFAwxZTUgKAJ86pMI1FG/n/wzLL33DgSGDzmpT5Xyh3rtHXvVAkuNcbVuAx3tJR5u3C7gkE8Zy116wRKBTDWp2c2Ce8IaQuhayJ8WOC30SOMbjNXeirPe7CBZRWwPa1xrYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127237; c=relaxed/simple;
	bh=6OPWkw88SLGOTV0S5cSAZm2veOCUr2frRtUVV9N68e0=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Lp6K/x+ajsSlNDfHI6RGgWb/fHmZdxmaAjVWpV3hfQi0at7Vtg10E2PqcxycRYiJ7fVwgp/jZXTbtnrxwvrPiDZox9Id+pcrHhPcx+R1V555PAmvG5a9Sryo9jgYS8CasvWwQ0xSaeZRP5nR2FxABQlrDrPaC8BaisdL7jcLl1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=1aJcIsXg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47777000dadso14965115e9.1
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1763127234; x=1763732034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wpPC2wtFd4NLEl4Fex1g+49rhMvK8bEF1ED2igQKkxU=;
        b=1aJcIsXgHNGMStIs3tQO+xH3VZFW5xSomEHLaZQmGl9V5rZPQpfpeMCC4hI2FPNxKc
         Rb7koyuK7YKnQ8Cxr0aK1CQvD2HaMkzk+fv0wNnnzey5BmsMuCvIfBkGfmqMjZqSdhsS
         D3zibjy1XvPZwmdS9Q4BuR9WXnIUsvMA6y25aphiHbNHRFq0ebXxHTtjUGh4kJfRvxJZ
         d1GNnNPjw54XE4BwFERzZ/QU1OFfSGMGO0qhscQCGo8fSdbA/3KhB2OayPoarFCPkey+
         fqjhmOLm2UVqL8hNnEZpnauzu0Vjr6p2IEXGbJsDKDLNgQ9kZBzPY/em1F9Zrco+XHBg
         HZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127234; x=1763732034;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpPC2wtFd4NLEl4Fex1g+49rhMvK8bEF1ED2igQKkxU=;
        b=vDj/cH2abDBEb+DJ1KqaJf85A1tVUm98pOOMVhe9GqJj6NYWyG3rv/aCpLyLoPF1UF
         34dr17HzyLaPfuA4iEDcZ3znsndSb4YVH8nEbUyRLOGNCIl5VDgfZ0ybtvAzFyaJJvFU
         XhKThXCZNMey1/5ehuSmAtt/tPxyEkSubU2JjAWOrg8PR0QP/tLfMsWKaAFwj3wMRxnl
         Q+B9P5Oq6UaMZ0UtzcuJGGBsQuIkmyrKsumKYMdCOV5VjVrIoKfw6r9fJxtRr+Wjs6Sa
         B3WPZqcDV8xBElijz6Qved1jLqUHaU2BpMejzPlXZKl55LW6HPl3O7cUTEXh552GCqwJ
         VGkg==
X-Forwarded-Encrypted: i=1; AJvYcCVTmh+0xIL9Xk8OcZm6TSzEdE5/eB4+frM2HW950BJa8GmdnAOdJU5pqNL6noFFFM7BCxNi/C9ykQhxUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRfCUM2xt9cKKYN5D0reZgWKW/wGyKohMXKx6wcBircbQDvzJ6
	7EbHNQeaIlWHKMjZo3tXsEwS+7jDtEnFVTUBR5a2lfpkg27HAuqre47MtsvC2IU/1b0=
X-Gm-Gg: ASbGncshYWmw/ixnUlzkZTOMp3/APnbyCJyRJ3gYizAYMqYvQyy4NLr8RjUYKvjCCUt
	E3Y+KyEFOoMSfUn08y8VtypCy2WGrfGK4PGB4vh13Vpbn/eM1jnGVeza7xvJzVzNbfxQrUTdGBt
	J57mum/lVZaQZb+m98Wd9rFR+M2SnFFnttGTK4T40tldoYPgWzjEDJJ9fTdKGcL7r2mQd1XfbI9
	sAs0O2thSeLUZDLomKOfRuyPgUcGl5UVIr3Ti2+YdMJ/3eQHuhm8mqHDpPIsNxOjJD9+XBL4MvA
	nelSEFAW8N1d/DkIEVXYOvjhyoERtCnue9iay34CpKsaZxruXWYUAv1g4dyp9bwnsm8AIUqvd/2
	FvAHfCht70n79vrEjXEIjy0LxF3OUHg6rOsjXZo8ZKEx8+bgUM0AgqQznyp7ablJTKqS4xR6r0J
	TyBZiXyqtdd0nHiXrNNSsYy1p+Uiyf+a9OtKVqCAZqsim7tILcwKy0vOS+MB9u3LBmhjLogOrlW
	qMKhWkREw==
X-Google-Smtp-Source: AGHT+IFSfYp+TEIQ0ghuAn77Ll5FRjYgRRifxjJaxX6xb5D05/JuUxVRrH0WsOS6QGKVmw+kLQGajg==
X-Received: by 2002:a05:600c:1d01:b0:477:54cd:200f with SMTP id 5b1f17b1804b1-4778fe69569mr30877955e9.9.1763127233520;
        Fri, 14 Nov 2025 05:33:53 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc92886-cmbg20-2-0-cust122.5-4.cable.virginm.net. [82.20.18.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb34295sm44948895e9.2.2025.11.14.05.33.52
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 14 Nov 2025 05:33:53 -0800 (PST)
From: John Cox <jc@kynesim.co.uk>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	 <sakari.ailus@linux.intel.com>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	 <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Stefan Wahren <wahrenst@gmx.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
Date: Fri, 14 Nov 2025 13:33:53 +0000
Message-ID: <vnbehk9a1e1pn6qv2qj8tcaj5l62u0dul9@4ax.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com> <20250701-media-rpi-hevc-dec-v4-2-057cfa541177@raspberrypi.com> <e99ff4f12d52eee03075f911e6b904290b47a961.camel@ndufresne.ca>
In-Reply-To: <e99ff4f12d52eee03075f911e6b904290b47a961.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas

>Hi Dave,
>
>sorry for the long delay.
>
>Le mardi 01 juillet 2025 =C3=A0 17:01 +0100, Dave Stevenson a =
=C3=A9crit=C2=A0:
>> Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
>> to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
>>=20
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> ---
>> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 4 ++++
>> =C2=A02 files changed, 6 insertions(+)
>>=20
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c =
b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 650dc1956f73..3bdcbb12bb30 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1381,7 +1381,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc=
 *fmt)
>> =C2=A0	case V4L2_PIX_FMT_NV16M:	descr =3D "Y/UV 4:2:2 (N-C)"; break;
>> =C2=A0	case V4L2_PIX_FMT_NV61M:	descr =3D "Y/VU 4:2:2 (N-C)"; break;
>> =C2=A0	case V4L2_PIX_FMT_NV12MT:	descr =3D "Y/UV 4:2:0 (64x32 MB, =
N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b =
cols)"; break;
>> =C2=A0	case V4L2_PIX_FMT_NV12MT_16X16:	descr =3D "Y/UV 4:2:0 (16x16 =
MB, N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 =
(128b cols)"; break;
>> =C2=A0	case V4L2_PIX_FMT_P012M:	descr =3D "12-bit Y/UV 4:2:0 (N-C)"; =
break;
>> =C2=A0	case V4L2_PIX_FMT_YUV420M:	descr =3D "Planar YUV 4:2:0 (N-C)"; =
break;
>> =C2=A0	case V4L2_PIX_FMT_YVU420M:	descr =3D "Planar YVU 4:2:0 (N-C)"; =
break;
>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> index 9e3b366d5fc7..f0934d647d75 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -697,6 +697,10 @@ struct v4l2_pix_format {
>> =C2=A0#define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', =
'2') /* 12=C2=A0 Y/CbCr 4:2:0 16x16 tiles */
>> =C2=A0#define V4L2_PIX_FMT_NV12M_8L128=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>> =C2=A0#define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', =
'1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /*=
 12=C2=A0 Y/CbCr 4:2:0 128 pixel wide column */
>> +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
>> +			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 =
pixel wide column */
>> +
>
>Nothing to report here, it looks good. I can't remember, was there a =
reason not
>to add this format to ./drivers/media/v4l2-core/v4l2-common.c ?

I'll do that for the next patch. I think they can be described now.

John Cox

>Nicolas
>
>> =C2=A0
>> =C2=A0/* Bayer formats - see =
http://www.siliconimaging.com/RGB%20Bayer.htm=C2=A0*/
>> =C2=A0#define V4L2_PIX_FMT_SBGGR8=C2=A0 v4l2_fourcc('B', 'A', '8', =
'1') /*=C2=A0 8=C2=A0 BGBG.. GRGR.. */

