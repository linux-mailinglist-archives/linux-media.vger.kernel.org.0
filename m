Return-Path: <linux-media+bounces-48386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D72DCACE75
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F43A303FE0D
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045AB3115B1;
	Mon,  8 Dec 2025 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaK2i+Wi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCmk6ghw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01235975
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190502; cv=none; b=uf1zR3jn354yktLkcDM1apS1QjCfZWHSoaW+X0MLQMk9iJYZZSFSpSTOcig0RZ1ldcW3njbtbYEMaZFAuVjBVNSWIwofM852SYppsdNgDIIA7DaxHAZZ+vBp/klksx+EBgtcgksp7HcXUoHcYxr/Mw6IFlJixR6KXXIfj6avD88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190502; c=relaxed/simple;
	bh=kMby2H/F/tsIt94HtLsZY50MHiaTi/KpsERd2wJG3pI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qKpkuBKNZ4GuZzXso0xIMilK5mTfUTnS74+q9uLutX1AnOemqu+01Z7ECiMtlaiXLt6PKfLu4vpW0K23fe7W3uX3wy6+s88WoH2ED1eG8W/N7j2b6Ohigl38eXUVzm8S8HYbtmU/aVWEyNy2Mp+MPQXTz7Dh5gURj8DzVHu2I0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaK2i+Wi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCmk6ghw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8A4ArD009203
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 10:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7XPWUE3E6BRdaTZcWB/4aVz/ZIDITOvIlBF35IogVQ=; b=CaK2i+WiDeeaeuXH
	qSODsEtfafSjagfU757cn/fLRKg5i64ppYSnjRLKfq1z8LtgrrQffScWI5HP0FiK
	l+SKxGbf6ghdfiHqsasGnxGYpIhygX6HFIy0P63XM+FOqGc7+6zcP+EnvGGkWzdv
	K2IA09MopaiH0QJ9sX3r3ikX4o+foRKH/fK3ZtMz8aKptQZ44uvD8ueTQkZIrnZP
	xtlyPEYTrk1rSEpIOPtSTpc36tgss1U1UJ2N7OfQXrTZNec8ZnuJPBmksfsbKO1I
	aNggnrhvBb6IjEITA9ck5ssmNd7zeTazV53tTC2DVHW1Q7J3z+urucqvXcfeVF9W
	zil3Kg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke038n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 10:41:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-880444afa2cso65317806d6.1
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765190498; x=1765795298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7XPWUE3E6BRdaTZcWB/4aVz/ZIDITOvIlBF35IogVQ=;
        b=XCmk6ghwbGdZQkxjTR61g4qy7hJ5ODsWxamm49OkZk6U/SGfYjt2x8u7nLybOvyVkx
         t5RuYu76xlhLr1kFo0B/rxUTkX8c3qlaOd1eHNDhx/xsn5KOEfbfBSAsTN1mL3klZOFm
         4oapFeLlwumE3xRmXiEb5NUI+gHaXeQhe87Mjdd7ft3HkRf//eQpK7H5jpu3BpR+jbuR
         fDtD9sETph/eS1Q1Ffi2v5vrGOHRc+DNeeXmWq3IcLDevBESIX4NnOLy9vAWaeVc+b4O
         CcUZwEeRjsEEGYGtxWFt6mzIOgKDYgcQi9/Zo+ovoeNeg2mJNUp3HGRbHhPorxOV0G/y
         Y2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190498; x=1765795298;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7XPWUE3E6BRdaTZcWB/4aVz/ZIDITOvIlBF35IogVQ=;
        b=H/oU2SLM19KPihicqkrvu49/ki4IlkXsNfD7D5FznFQQxoqFe5Wu/gltjSNvpPm6UI
         5/Q0ZGyMTpHdRFTk2gncsailwnTW2XxTxav7MXnnA4oY2kqTOTaMvonDJBcnpVZwGaBm
         wrAbwlDH/SOSPfnqv4pGRcwWMucEvdSiWmvHXsTxSpsFo9cN568dALjTeDQGMD7CC64E
         yXKIVe8MRXD26MmIEdLwCS3shWhECnOAAFc2BWGBUjoXU6lulAQQC6KDDgwSzE71eE77
         viddhriZVjicqL+sq3XdJ+7tOM+vkjXjnkN0Gy6h+IyqBClFRQRvSyZvKejzpEuuGooR
         M3zw==
X-Gm-Message-State: AOJu0YxyzwBcCwDo6jFVyGIPlwfvd02N22gbbT1qQB3te8SZfecGzkjM
	FBy72RI2c3kHaqKPAMIRdys2sxWMPnfe2fD0XNGQ5tBUhK/Gom8I276w7yb/9lZswYDsZtNLLvG
	JeDqxsi8fhM/pfbUbwkCXBntPOZ8p4KTdvhUbd82nVxWITG4ZHfHopp/Sm8Hnbo1tuA+i+MHNcg
	==
X-Gm-Gg: ASbGnctaWb17Qj9sagWu2cKklxhfFse9jQjxUBr1kRyeU0fCjGw3Nku4Cgxxufp7z3v
	2FYuKdjHQAWcXBq+E9viDeD+OjgmIUtE5bpmdkri4bPkX1O6m4tZAiTMCApO0KqOWPYdDez5f9w
	LlavBAwPCxdWg5xhe42YXBm1LWMhJI/D1M25/Pf1mRv8H7YK3PYRzgTwQ39zTiygmlHK0UHYn1a
	aSIN7K7CkvUfGSSdXRTQfT6w6F+u+L3LQ+iQmcfJaVWak/4Iy13JSAXZ4XDshpBn2H/D08GRawp
	nXsjNwYhLdipp2JdfKJMFPWQeAtjaiMaD7sjVw9knr+EewUb8ZgjyVaBA5SiXd1PIksZRkX/BlP
	4QsInMVf2DqCEmUvXiSVt0Y7/D12P
X-Received: by 2002:a05:6214:f07:b0:882:3ecd:20ec with SMTP id 6a1803df08f44-8883dc42bedmr107754476d6.60.1765190498477;
        Mon, 08 Dec 2025 02:41:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPHkM6AYJTRAEVX5sv3FTI33hgMrCwFDdKcVwFv2aiLc7PA0LqX4GCUcN3/1YoKrmpEDZBTw==
X-Received: by 2002:a05:6214:f07:b0:882:3ecd:20ec with SMTP id 6a1803df08f44-8883dc42bedmr107754156d6.60.1765190497896;
        Mon, 08 Dec 2025 02:41:37 -0800 (PST)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4498947sm1042456766b.15.2025.12.08.02.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:41:37 -0800 (PST)
Message-ID: <4402b9bd-b74d-4a92-90b6-3edd38db8cc9@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 11:41:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: uvc_video issue: Panasonic S1II initialization fails in webcam
 mode
To: Lynne <dev@lynne.ee>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
 <20251122151401.GC15447@pendragon.ideasonboard.com>
 <7ce47ae4-f45d-49f6-919d-98f301aaaa75@lynne.ee>
Content-Language: en-US, nl
In-Reply-To: <7ce47ae4-f45d-49f6-919d-98f301aaaa75@lynne.ee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OTIse5geANFr34_Jxjaxh1eMIwTsLvMG
X-Proofpoint-ORIG-GUID: OTIse5geANFr34_Jxjaxh1eMIwTsLvMG
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6936ab63 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_Yd_BS_N7A8Er3USgEkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5MCBTYWx0ZWRfX/HBLEi26kirT
 jrdBMZeIcex2bT5fRfAtizepfoEV2DPgunVJBAa06EZrFswyV8hnZRAU8X/fgUI41njwXKpyHSi
 LJRUtQpyz7VvAjimuj8+4ZW46pzi/bQEYufi7h31JN582+iPnVHFpkKOOQWES6eSrIRXHVBatyv
 abnpmJMTSDV+PExZdE1GkvNVVNf8oZfFKO/S02mpGqW6xl/VlWJerlJyogYICOr0MzGrdk6nqxR
 gZefDEFLHr80Vggir4pOwc4YbB+OB+dxEhUAfYznKNaOygNuRN8AkYOxhSaf8NsAEE1TDDGXNza
 OzHGYjB5c+0zsQKP47t742Bh5L1uzTo4MhXXy592Yn3Z2gRnmaqWLKoblBUEPF8yt7LBMLwPiAk
 v3lJVwDN0r5BsVD18i5iAtkYAgKBqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080090

Hi,

On 22-Nov-25 6:58 PM, Lynne wrote:
> On 22/11/2025 16:14, Laurent Pinchart wrote:
>> Hi Lynne,
>>
>> On Sat, Nov 22, 2025 at 12:28:48PM +0100, Lynne wrote:
>>> The issue I'd like to report is that the kernel fails to initialize the
>>> Panasonic S1II DSLR camera in webcam mode as a webcam.
>>> Seems like most queries time out or error out with a generic protocol
>>> error return.
>>> I tried increasing UVC_CTRL_CONTROL_TIMEOUT just in case, but it did not
>>> seem to help.
>>
>> I see in the log that the USB audio driver fails as well. There are
>> quite a few devices that exhibit issues in the interactions between the
>> audio and video interfaces. Could you test blacklisting the
>> snd_usb_audio module to prevent it from loading (and unloading it if
>> it's loaded already), and replug your camera ?
> 
> Hi,
> I dug around some more. When the device is first connected, everything runs fine, actually. Upon unplugging and plugging it back in, I get the log I posted initially. Unloading the uvcvideo/uvc moedule and loading it makes the camera work again.
> Disabling snd_usb_audio did not help.
> 
> Here's the log of the device being plugged in for the first time.
> <same as before>
> [  +0.000001] usb 2-3: SerialNumber: 00000Z12FB009251
> [  +0.094425] videodev: Linux video capture interface: v2.00
> [  +0.017217] usb 2-3: Found UVC 1.10 device DC-S1M2 (04da:2385)
> [  +0.000493] usb 2-3: Failed to query (GET_INFO) UVC error code control 2 on unit 2: -32 (exp. 1).
> [  +0.000264] usb 2-3: Failed to query (GET_INFO) UVC error code control 2 on unit 1: -32 (exp. 1).
> [  +0.000407] usbcore: registered new interface driver uvcvideo
> [  +0.007960] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 2: -32 (exp. 1).
> [  +0.000004] usb 2-3: UVC non compliance: permanently disabling control 980900 (Brightness), due to error -32
> [  +0.000425] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 1: -32 (exp. 1).
> [  +0.000001] usb 2-3: UVC non compliance: permanently disabling control 9a0901 (Auto Exposure), due to error -32
> [  +1.091011] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 2: -32 (exp. 1).
> [  +0.000442] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 1: -32 (exp. 1).
> [  +0.000762] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 2: -32 (exp. 1).
> [  +0.000426] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 1: -32 (exp. 1).
> [Nov22 18:50] usb 2-3: USB disconnect, device number 2
> 
> Maybe some state gets corrupted?

I think this maybe a timing issue, where if we talk to the device to quickly after
plugging in it is unhappy.

The first time there will be some delay because the uvcvideo module needs to be loaded.

Can you try the following:

1. 'echo blacklist uvcvideo | sudo tee /etc/modprobe.d/uvcvideo-blacklist.conf'
2. 'sudo rmmod uvcvideo'
3. plugin the camera, then wait 1 second
4. 'sudo modprobe uvcvideo'
5. Camera now works?
6. unplug the camera
7. 'sudo rmmod uvcvideo'
8. plugin the camera, then wait 1 second
9. 'sudo modprobe uvcvideo'

If the camera now works on the second plugin then we've some timing issue.

If it does not work then try:

1. unplug the camera
2. turn the camera fully off
3. wait 10 seconds
4. turn the camera back on
5. plug in the camera

Since it may also be the case that the camera fw somehow ends up in a bad state after
being plugged in once and that the camera fw needs to be reset before plugging it in
a second time.

When you plug in the camera the first time and it works properly, was the camera
on when you plugged it in; or did you plug it on while the camera was off and
did plugging it in wake it up (or did you turn it on after plugging it in)?

It might also make a difference of if you plugin first and then turn on
the camera vs plugging in while the camera is already on.

Regards,

Hans




> 
>>> Full log is below:
>>>
>>> [Nov22 12:11] usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 10 using xhci_hcd
>>> [  +0.017315] usb 4-4: New USB device found, idVendor=04da, idProduct=2385, bcdDevice= 1.00
>>> [  +0.000008] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>> [  +0.000004] usb 4-4: Product: DC-S1M2
>>> [  +0.000002] usb 4-4: Manufacturer: Panasonic
>>> [  +0.000002] usb 4-4: SerialNumber: 00000Z12FB009251
>>> [  +0.019222] usb 4-4: Found UVC 1.10 device DC-S1M2 (04da:2385)
>>> [  +5.127335] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 2: -110 (exp. 1).
>>> [  +5.119884] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 1: -110 (exp. 1).
>>> [ +10.239937] usb 4-4: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
>>> [  +0.008264] uvcvideo 4-4:1.1: Failed to query (GET_CUR) UVC probe control : -71 (exp. 34).
>>> [  +0.000013] uvcvideo 4-4:1.1: Failed to initialize the device (-71).
>>> [  +0.000026] uvcvideo 4-4:1.0: probe with driver uvcvideo failed with error -71
>>> [  +0.103095] usb 4-4: 3:1: cannot set freq 48000 to ep 0x83
>>> [  +0.359825] usb 4-4: 3:1: usb_set_interface failed (-71)
>>> [  +0.320056] usb 4-4: 3:1: usb_set_interface failed (-71)
> 
> 


