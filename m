Return-Path: <linux-media+bounces-25298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55DEA1C2A7
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2025 11:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E413A7BF1
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2025 10:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E2B2080F9;
	Sat, 25 Jan 2025 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J2iVeZVU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155861DC9A8
	for <linux-media@vger.kernel.org>; Sat, 25 Jan 2025 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737799945; cv=none; b=Vm/54oYuAWhRoHKuQQF7+WWdsh67ZC9Ko1vYCgxEg/7cP//JZ/ddJjNdmG6zbqwoAeUBGd0ZXqRFGf69NwQJjeAv43cvbT1sHMV4BZAeWIKXy32lfK45s+2/mGjUkfuM0FGSy5svzDHtrTDF6pW6LzdbPKkNoZQm76EAKsjYh3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737799945; c=relaxed/simple;
	bh=dvQM7yJ5/mqxQUSgsCXLE4iTBDMmQzrICMlF/ow7Apk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEA+Rc4GmEYDsGnmx9XlVH8d6sXS04vHMRCJim/yPKScEa23tebVQsKPPok6tjhcLUpAkWVJw5cqn9DDJcnNV8lPatpcqvqOWLrqiEP3dDUx+uq6uo2tZiPKO/ciFnFWNcBEn49fpbw5gn1mUwfe/iHS5Ijdu10P4j8B9AooYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J2iVeZVU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737799943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSWL9rPqiOXSJCvaBQbQWTuINmRs8t2K11WreHClW+E=;
	b=J2iVeZVUK5aZimOX45CTXKGEEqRXNHgCDlbXOi/s6cX09+ivxJ/Efg78sgxslbFgY1yiMV
	GOpHNx3cO0y48bbmjnKH6CRWpYbVnVN2phfP8ChS90fOVXISk/Hv3asyrRoL0y5MupRa3V
	h8sCQ9o0r0fWz6yrll9kpxNzBBByqlc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-mJ8vT0OoOXaVDbk6hhztfQ-1; Sat, 25 Jan 2025 05:12:20 -0500
X-MC-Unique: mJ8vT0OoOXaVDbk6hhztfQ-1
X-Mimecast-MFC-AGG-ID: mJ8vT0OoOXaVDbk6hhztfQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa67fcbb549so300018366b.0
        for <linux-media@vger.kernel.org>; Sat, 25 Jan 2025 02:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737799939; x=1738404739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSWL9rPqiOXSJCvaBQbQWTuINmRs8t2K11WreHClW+E=;
        b=uUVhBetkMImJpR6nBVWkEG1ywfQjwkBgxp+x0LJwb8S2RFNbU3Y9XCnUOTxnfoFSRD
         1WNT7FyBJdS5PtEglWoY3EdP4ABJMjFajVJqJM+VS9XUq8mFrv9WwTDSpAsEr3sBAkyu
         Fhad1ppOJLGWmFZNVJfHwkdtA8LWPTD8HfTofiZUZEf6NS7ZIkLK95hpuBg0LGLCFFIe
         zENJ3NwtTdVO5ryarsKTipr2Zl2KFjPiAXYoRu+d7HvKN5QVtckPlZiX218mTd+VCx/n
         TVbaLVvx2t4nVyxLjCUQBrGSX0qtysOSx/jdnCvaF3efw24G4s2MU7oblYSbH6PnQHjy
         lMOw==
X-Forwarded-Encrypted: i=1; AJvYcCVemSEkCq9hEF4tTEa16qtERWx5ACWde4+5aBLu9sqSb11eSuxI1QuBHnDN3IeUhxUkhp3N3K+J6ToRoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzer+OUw5EQfCycLqm6SWKfKHMddY1R57DOuEQVW3CHD/q8nkmB
	G2XRX0nNq2FzlM+k9VGGuY+NAUKAagVMf9fiLk4AcOGz1pFB91A9ZPCa1dPrsrv0T3SHbZ0xZQk
	rfKshlyNMuhSrfLajpfmuTK0YB0ksafEPLYq30OGFCBMWdl/a3wyVwLCuXBHt
X-Gm-Gg: ASbGncue3Gaghl5kh4uAKR9A5G8+OUILKZQ2IH0TKWi0lqEHurzZWYHq4GLmLRKFBkx
	QQI8Lu4E+kjvWOQAPynNmG/dKQ5z5l/Y/6iZBbqH7C70urturONz3qC7MlFmdOsHjb9Rq6aNzR/
	AVtY+PwD0B1Opj3V0+zwLfH8mbI4ZZaLvgDkSGcdgZq42JqEzkWBhvCXaKb2pSPATqanHIzh+GE
	Pz7/amyaXCpOELy2DPMc9izlIH2X5K+dalqvOyymzqv/+U/b2K+yVui1qIUij6bWfdLuEhQV1a8
	uNZykzHJQRGKKWGu4N4WpRk7/x1r+9ssVH8fQLcSe4J3INdTqS2sb4r9JOLt+l5dXnZyTZl41NA
	Rl74uG3Bo9/LPyffBanhPU5AWLjhdVGFs+tep5OT0Y6w2VppAMrOHze0=
X-Received: by 2002:a17:907:d03:b0:aa6:730c:acb with SMTP id a640c23a62f3a-ab38b0b7ee8mr3157077766b.8.1737799938828;
        Sat, 25 Jan 2025 02:12:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJcuBOGkDjGNxbr8QJIaHN3eY85+YvITwAzZ+fw2iHcMG6hDNbv5KtHD/EJ8upWj8g6afZ+A==
X-Received: by 2002:a17:907:d03:b0:aa6:730c:acb with SMTP id a640c23a62f3a-ab38b0b7ee8mr3157071966b.8.1737799938267;
        Sat, 25 Jan 2025 02:12:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e12d50sm267718966b.10.2025.01.25.02.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 02:12:16 -0800 (PST)
Message-ID: <367710fc-9c66-4cf5-9059-1df00320f1f3@redhat.com>
Date: Sat, 25 Jan 2025 11:12:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, robh@kernel.org,
 krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
 mike.rudenko@gmail.com, alain.volmat@foss.st.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com,
 alice.yuan@nxp.com
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
 <131271d3-f3be-450f-b4e1-a7efb65362f3@redhat.com>
 <20250125001437.GA19927@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250125001437.GA19927@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 25-Jan-25 1:14 AM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Jan 24, 2025 at 06:17:40PM +0100, Hans de Goede wrote:
>> On 26-Nov-24 4:50 PM, Mirela Rabulea wrote:
>>> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
>>>
>>> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
>>> active array size of 2592 x 1944.
>>>
>>> The following features are supported for OX05B1S:
>>> - Manual exposure an gain control support
>>> - vblank/hblank control support
>>> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
>>>
>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>
>> Thank you for your contribution, I noticed in $subject
>> that the model-nr ends in a "S" and that you describe
>> this as a RGB-IR sensor.
>>
>> I've been working on OV01A1S support myself and one of
>> the issues is how to communicate the RGB-IR color-filter
>> to userspace.
>>
>> <snip>
>>
>> I see here:
>>
>>> +static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
>>> +	{
>>> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>> +		.sizes = ox05b1s_sgrbg10_sizes,
>>> +	}, {
>>> +		/* sentinel */
>>> +	}
>>> +};
>>
>> That you are using MEDIA_BUS_FMT_SGRBG10_1X10, but that suggests
>> this sensor is using a plain Bayer color filter which is not correct.
>>
>> Here is what I have come up with:
>>
>> diff --git a/include/linux/drm_fourcc.h b/include/linux/drm_fourcc.h
>> index db679877..68ed65c5 100644
>> --- a/include/linux/drm_fourcc.h
>> +++ b/include/linux/drm_fourcc.h
>> @@ -447,6 +447,8 @@ extern "C" {
>>  #define DRM_FORMAT_SGRBG10	fourcc_code('B', 'A', '1', '0')
>>  #define DRM_FORMAT_SGBRG10	fourcc_code('G', 'B', '1', '0')
>>  #define DRM_FORMAT_SBGGR10	fourcc_code('B', 'G', '1', '0')
>> +/* Mixed 10 bit bayer + ir pixel pattern found on Omnivision ov01a1s */
>> +#define DRM_FORMAT_SIGIG_GBGR_IGIG_GRGB10 fourcc_code('O', 'V', '1', 'S')
>>  
>>  /* 12-bit Bayer formats */
>>  #define DRM_FORMAT_SRGGB12	fourcc_code('R', 'G', '1', '2')
>> diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
>> index b6acf8c8..e2938f0d 100644
>> --- a/include/linux/media-bus-format.h
>> +++ b/include/linux/media-bus-format.h
>> @@ -122,7 +122,7 @@
>>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>>  
>> -/* Bayer - next is	0x3025 */
>> +/* Bayer - next is	0x3026 */
>>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
>>  #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
>>  #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
>> @@ -159,6 +159,8 @@
>>  #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
>>  #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
>>  #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
>> +/* Mixed bayer + ir pixel pattern found on ov01a1s */
>> +#define MEDIA_BUS_FMT_SIGIG_GBGR_IGIG_GRGB10_1X10 0x3025
>>  
>>  /* JPEG compressed formats - next is	0x4002 */
>>  #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
>> index 3829c0b6..1b91ed0e 100644
>> --- a/include/linux/videodev2.h
>> +++ b/include/linux/videodev2.h
>> @@ -706,6 +706,9 @@ struct v4l2_pix_format {
>>  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
>>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
>> +	/* 10bit mixed bayer + ir pixel pattern found on ov01a1s */
>> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10  v4l2_fourcc('O', 'V', '1', 'S') /* unpacked */
>> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10P v4l2_fourcc('O', 'V', '1', 'P') /* packed */
>>  
>>  /* HSV formats */
>>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
>>
>> For this, note:
>>
>> 1. This is against libcamera's copy of the relevant linux headers, the paths
>> to the .h files are different in the kernel
>>
>> 2. Since I wrote this I learned that it looks like the intel driver for
>> the ov01a1s:
>>
>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov01a1s.c
>>
>> may have enabled horizontal-flip / mirroring by default, which means that
>> the order of each of the quads needs to be flipped.
>>
>> IMHO we need to resolve how to communicate the color-filters used on
>> these OV xxxxx"S" models to userspace. When I last discussed this with
>> Laurent, Laurent suggested using V4L2_PIX_FMT_Y10, combined with
>> a new field or v4l2-control to query the actual filter.
> 
> Yes, adding new pixel formats and media bus codes to represent CFA
> patterns won't scale. We need to switch to using controls to report
> those. Sakari is already working on a series for that.

Interesting, do you have a link to Sakari's work ?

>> The idea is to separate the depth/packing info from the filter info,
>> avoiding the possible combinatioral explosion of needing this special
>> filter with all possible deths. I gave this a quick try but at least on
>> the libcamera side there is still a lot of code assuming that both
>> depth and color-filter-type are communicated through a single fmt
>> integer. Also it seems that in practice there only is this one new
>> RGB-IR color filter used on the OV xxxxx"S" models so I think we
>> need just 1 new V4L2_PIX_FMT_ define (*).
> 
> Changes in libcamera are surely needed. There's work to be done, we'll
> do the work, and we'll solve this problem. Let's focus the effort in
> that direction.

Ok, so what does that mean for upstreaming support for omnivision
OVxxxxS sensors? Clearly advertising MEDIA_BUS_FMT_SGRBG10_1X10 is
wrong. So I guess that upstreaming this driver needs to wait until
at least the kernel API side of this is resolved?

Sensors relying on the new CFA control to communicatethe CFA type
could use a new (e.g.) MEDIA_BUS_FMT_RAW_1X10 or are we going to re-use
the monochrome (Y only) media bus fmts, so e.g. this sensor would
advertise MEDIA_BUS_FMT_Y10_1X10 and then the CFA control would provide
the actual CFA info ?

IMHO re-using the monochrome (Y only) media bus fmts seems best
to avoid needing to have to make a "RAW" copy of all of them.

This also matches with what we are already doing for IR only sensors.
AFAIK MEDIA_BUS_FMT_Y10_1X10 is currently already used for infrared
sensors, so sticking with that and adding a IR CFA option to
the CFA control to make clear this really is IR (*) seems to make
sensor for IR only sensors. At which point extending this to RGB-IR
sensors seems logical.

Regards,

Hans


*) Actually the whole spectrum the sensor is sensitive to really AFAIK



