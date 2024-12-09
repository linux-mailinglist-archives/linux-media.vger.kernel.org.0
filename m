Return-Path: <linux-media+bounces-22947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FF9E9A80
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42F6161C67
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7C31C5CAD;
	Mon,  9 Dec 2024 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zg9MaTrV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C556D23312A
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758117; cv=none; b=O2a37+TNPeHTf3o640HTSEFwuyJzO/hfenQocAmDs7CtaSDntWM0skkLx3xlR7sGrXYgtOldK+A85684mObW1srUHK+zKE0lCJqP9Y2X0qvcxDCgQXOJrv37JRYcNb6xEm5oquF4WLrtZxQBbAV6Cy8eiuiPBR2q3o5m1oGROUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758117; c=relaxed/simple;
	bh=qvf6Z+Ka6yQvgPXOvWAMB+sYfbrIepMBTcEYp5GgVMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Om1Q4shoQs562YP5eQMnt6Z66tqw6wN7SDoyKoFUbaxeGG5ixDIIYAOiD9s/KiC7SUCPeGd6td3/XFxJWrApE9xju7P00zpR+95r5L0qV1T81DEk9QKHPXIvvSQv9sBk/W9rzRrvza47Tqhhr8Ar0h/DvZEwcGFHlt2VDO0mW34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zg9MaTrV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733758114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8CNxdaZDke1IVjl09wgAQK9CPtsp+j111TxSqB/HAA=;
	b=Zg9MaTrV3e0yd/p9d5Zc/lUAR/EKP7VQcJppQh4tC2k94kM39c2hBDi7l7PYpTvENhUR6W
	/jYrTXj2BF8302LpEC7Ei9hTmXxft8j2+kmhhaXIqV24KuD4CLlYgLhyMaOkf1mGNbhfo9
	E+qDULEbtN023OL55HgoADzasYCiEpU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-v37TsncGN_WWh4Ab8iQhIw-1; Mon, 09 Dec 2024 10:28:31 -0500
X-MC-Unique: v37TsncGN_WWh4Ab8iQhIw-1
X-Mimecast-MFC-AGG-ID: v37TsncGN_WWh4Ab8iQhIw
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3d9d6293fso1631325a12.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733758109; x=1734362909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8CNxdaZDke1IVjl09wgAQK9CPtsp+j111TxSqB/HAA=;
        b=ab2iSd7d7FYwVluycTK20tTro7TH80Lflj5LiCv8CHfgQk+EmoEcUYl4BhV5hf/9r9
         uhTMSXcPJrkjRBDN+PR+SfPkRDN4QEp9hsYRcw1ubMYZdez4qE48SLY/tXT8DdWTFjH4
         ztb1TynnHxFdaKEMsebMbMpg8KZWkY1jrGt8Nwuj6iSV8rJhZkoTdIA8eph3dfu37DNq
         KDbxCqKXoFBT/JJnsHWI0MDc82Isf+UedUWZFY7Sz/FUUP3r5JL/Uw4ToDhdZoS/X/TY
         IT05r3Kgl+0oN69OlyDCzoTth/GCwDq7QPqwhpVIVwjA+HInhkeCQ08pzlohC45xJ2NX
         D2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaoeosIrCWpQ0YxLy/iqXXuf51ZS7yjgAcptmBtryjemlHcTybZBt9gHoyVeaPtYc5Scz+iJhBY/w0Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSdoJC/9bOsVh0rnvVKL/E/umhhFeCiLUyJkc03oZXGHofoD0
	ZGk0jpE3L3WOrgs0Fe/d56neajXYpiLjzO/ZOX4WW+hpbAEBtH15Vm5pqRnkT0T+0vMEsirpzry
	BvciYO7nnWro8Qrqs4QZW77ukhUU0Lq4q5MGs3UAr+K+mwNIzLwnMjvGaucIq
X-Gm-Gg: ASbGncuBnE75a9NzBVgLE4fzB3uz9I/ED1/Dp6dC2m1t2RNRGu6niPiptWkyviwh2EB
	w3aYCKHRE+cuLS6QDwfCPXBOYF38cIMZA35Al87CDw7/5KlrUnR/l+w5gKVwhjLJBapNrEDy6Zm
	9kpYuGu7SR5nNLbxpaB0O+AVFR/m37fwpOYhesK8VJgOqMOlQPwNGAnNe8FyX3qTKjc86Be8LEC
	Z7IoUvDmAzPaWMCzmuMQ7Ye/iCyodKtQF9zc1GS1rvzxjj2uUAdYg==
X-Received: by 2002:a05:6402:2552:b0:5d3:ba42:e9e9 with SMTP id 4fb4d7f45d1cf-5d3be6d69c2mr10705531a12.9.1733758108786;
        Mon, 09 Dec 2024 07:28:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpNDyINNKptq9S98OEpzOs4X92aZ/u6zj2HCho4ET4SXIDz5mwVd5XzLnEYATHoc0J67tznA==
X-Received: by 2002:a05:6402:2552:b0:5d3:ba42:e9e9 with SMTP id 4fb4d7f45d1cf-5d3be6d69c2mr10705500a12.9.1733758108387;
        Mon, 09 Dec 2024 07:28:28 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3c2b0137asm4953862a12.4.2024.12.09.07.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:28:27 -0800 (PST)
Message-ID: <1d7c4bdb-f34d-4df6-abab-25c0a7af9cac@redhat.com>
Date: Mon, 9 Dec 2024 16:28:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
 <2e90c10a-71fe-4e80-9ac3-80393bc8b266@redhat.com>
 <CANiDSCvO4DvAHfYpkSi_ZMuV6huk0fTA94-jPafeGrUw+6WoZQ@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCvO4DvAHfYpkSi_ZMuV6huk0fTA94-jPafeGrUw+6WoZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 9-Dec-24 4:23 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 9 Dec 2024 at 15:22, Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>>> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
>>> index f86185456dc5..cbe15bca9569 100644
>>> --- a/include/uapi/linux/uvcvideo.h
>>> +++ b/include/uapi/linux/uvcvideo.h
>>> @@ -16,6 +16,7 @@
>>>  #define UVC_CTRL_DATA_TYPE_BOOLEAN   3
>>>  #define UVC_CTRL_DATA_TYPE_ENUM              4
>>>  #define UVC_CTRL_DATA_TYPE_BITMASK   5
>>> +#define UVC_CTRL_DATA_TYPE_RECT              6
>>>
>>>  /* Control flags */
>>>  #define UVC_CTRL_FLAG_SET_CUR                (1 << 0)
>>> @@ -38,6 +39,18 @@
>>>
>>>  #define UVC_MENU_NAME_LEN 32
>>>
>>> +/* V4L2 driver-specific controls */
>>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_USER_UVC_BASE + 1)
>>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_USER_UVC_BASE + 2)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                        (1 << 1)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE               (1 << 2)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                       (1 << 3)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY              (1 << 7)
>>> +
>>
>> Hmm, shoudn't these be standardized. At least the ROI rect control seems like
>> something which could be standardized ?
> 
> I believe that back in 2022 we deciced to go with custom controls:
> https://lore.kernel.org/linux-media/a0fe2b49-12b7-8eaf-c3ef-7af1a247e595@xs4all.nl/

Ok that is good enough for me. I just wanted to make sure this was already looked
at as a possible generic ctrl.

Regards,

Hans



