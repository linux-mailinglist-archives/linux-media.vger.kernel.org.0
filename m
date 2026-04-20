Return-Path: <linux-media+bounces-59127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDGyDgfr5WnxpAEAu9opvQ
	(envelope-from <linux-media+bounces-59127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 10:59:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EB042898F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 10:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FB1F300C6CD
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA95389101;
	Mon, 20 Apr 2026 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Le8XAlg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+oT0PPO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B23043CE
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675563; cv=none; b=L/+COMmLuQK5bdNo8gChUW4w+O3vpFwDyF190o0viwFE3A3gZwwfDRtHEIUnBI21YXOGxelrcda8HbA3CyTUmN5d1f71EXOAg9gKWrxC3OLplcS5SupWYB/KBG4PuUGHr6ihzwHeYdPGWEw+OrZi78Zb6/x5ABkgWSvu+ZbtYDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675563; c=relaxed/simple;
	bh=c6nb2jnSt5+cAXNAp2HMhEyW43Xa8koXKpBZ2ym1Vvk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jaw0eOwMAAFzUoc2IYtO9Rt58WNiRJYhGiw9lCVz7UCYtW/VkK9sUJnX8LXPG1RKLLVq/MLNTiNPkokKvteabLC/WugAag0DJKCfIEz1DmR8Mg2hfh/bfHri7vP7hi+2ZbXDWir2W8cSm4KClEJhR5EqG2nrrJ2Q53u8T/UUTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Le8XAlg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+oT0PPO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7L4io1466042
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 08:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQzx3NNlQzZa2LLaXDzMbKjtnT61BRD7ReYCVIHQqy0=; b=Le8XAlg4R7fgLPeD
	auhmIXII+0ee8vvP4j98VI1Z+l/OFGdgRh+9Wp0n/SLXuHB1JHvMySRpxYZWG3uA
	K1r4nm5An2m83hiEceip5AR9F8s6x+zQqmxvVTN6tD78/ZSodrV07QVjhExTxgw2
	wNRofZ1QgSxPmWyqQHlhZXa3UiE98PFUhlyENtPE3lHB8gECVDdI0uq68pdhVBX1
	IQjsjRMQhxRYW6xrtTTaKjvcYdYqtp9GxUQPIdrubkVVfZ9W2tiK45Jw+WCpJphZ
	Vk9eREyX4X6TG7mxasKVtOE4sGmB3ECTZ3AHyWXdVag0zBnKmxuh0TZrBpdvz3KK
	LfsUOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr5cut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 08:59:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso4617611cf.2
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776675559; x=1777280359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQzx3NNlQzZa2LLaXDzMbKjtnT61BRD7ReYCVIHQqy0=;
        b=D+oT0PPO+iZ/D/NC+1bGSOhJMkDTBxwf1sr8DtuRX+MLo9Qp+EQM6GkBxF1s+u+ydP
         U8U7P/litEJNZo1xLxADFBfCi/Bnxnc9Nt0D1ixPl6hSpCzYqXuV8YPq2i/yOFxD0mLL
         Amf6sNxIdTFhfp9JFsuatjaFoPOYxo7U1eaOPmABLs1WH1xv7LoMsIXpddEmp9uMG6WA
         M10IG2ginY+3834qxC+zXhBYfioTQxdnxYmEqlzY7njrRvWSG0cAcDZQROsRc3ZQ2qA1
         SOsEKcTN2rssPtjOk49p6ySPOyWEzWzBIpMahXOxCwKreALNp9s9ExGQvQ5YRJALas88
         ROtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675559; x=1777280359;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQzx3NNlQzZa2LLaXDzMbKjtnT61BRD7ReYCVIHQqy0=;
        b=A9uO/uVEnJ0WX9kDdtu9MZGnxUKW/8T/wlocpp7E6qEkjA6zn5Fa9V+ZMk9Q810sfi
         Fbp+MmnYW8244VPt0lduaXk8LNykhJzXUPPX6oX7EhgxHq2jOQGHuFH68XGiHkSewSpI
         XRlvWw1eNWrWgoSoAJuLKhXfzHAGUrhI4yTBj81YMrubIEV6zrx8xmxhD/zeWGROSMmC
         BGk1KpBwzlhfOqJvGGf8uiuLiWcjS8WOCWC0IQlUTAvAdzCP5NE3IcMPcp1mzeJusluX
         CXkROSc0qQD1WIo/ayCANBxlwDnNPUJ6pq340ygx9XgDPcUtcp/xQSuSPGkyPxbsT2gD
         sftA==
X-Gm-Message-State: AOJu0YzVuuCUilkvmDYUgXMc1iMSn+8hpo5X31u3aJludZ3wWisDK7ns
	WvNQ/+9Z6xSKTwJlK1mLS1pCwpUzpG4L0SrkofYBvd4ql7XokQJ05BQvUel99CJJ2zftgUT33tJ
	oCvmIdWok1vyNPyfC0xr0s/XFl4HUfYQvSP7jmMwXVM24g9GTSODdXSiqScZv3sgdmQ==
X-Gm-Gg: AeBDietP0YoNZu38td82mHdksJiwZgPgUZFo6DricHVdV1zSHd4Z7fsrYFfpnnbXgbq
	gtPfhfJ+j8UlsDqh3dKLq7sLpTx/vdp9NqVFPeKFJUw5r444mNerqcmfhdSRZUUuxgeGP8Qj9CL
	OD3+/FOMr/Y3SMRPljAJzDdah28kYOynvQL9Cq4/IuEMOxJXh6hMvZ/BXM5nTcc2w8SA79EODoN
	hRGDn2mdvmE4tldy59BXWh5sru1cFFpaqbxjpSrYVgn08Q8cXpxo0V1EIVy3VDykGvHRj0Pn+8b
	fPMW3cLM4i2CIWgHxQKyhWazOAhuiR/9VSsMJMZ/PFNFecOXsTDdU3IINFdPHHteYCYhXAHa043
	4AZimkyZTVOr+CLOXJeCXw6/1QWoJBI0tn0JKYP3bzvizvqgYleU=
X-Received: by 2002:a05:622a:1f8c:b0:50d:6f16:390a with SMTP id d75a77b69052e-50e36c0ce17mr190231201cf.34.1776675559419;
        Mon, 20 Apr 2026 01:59:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8c:b0:50d:6f16:390a with SMTP id d75a77b69052e-50e36c0ce17mr190231071cf.34.1776675558950;
        Mon, 20 Apr 2026 01:59:18 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d50922sm1799851a12.21.2026.04.20.01.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:59:18 -0700 (PDT)
Message-ID: <2bed7c05-7a5d-4808-990f-9d2ab9fd8005@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:59:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
To: "Yeh, Serin" <serin.yeh@intel.com>, Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
 <DS0PR11MB7971EF4F2B0759AF0CD738D0F62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
Content-Language: en-US, nl
In-Reply-To: <DS0PR11MB7971EF4F2B0759AF0CD738D0F62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NiBTYWx0ZWRfXxsGLFHW9DGfa
 DEdX2CAngEzL/YhgDbPuiSW4uVC5SUtO3f7yrSHTfc3Cva30GUTy6rL+2U4inodyxgsIcfbjub5
 eMDV0xUZkBjPg2zzAamAD57B6zp3evIA7snsahymXWdS+/BPl+TqT4qA4fDR+dU2i4ElypDx2v6
 apF4bE046lcSUd3WbAmA6hhPvaFVkfJtLsokm6qYDnmoSNLSMXr8WK3SZwpQqOzfFUKTajW7tVH
 +RPytlweaIKnUQj1yn5RU6fw1JMgKixDmGVu5SKd8/0/UBobthpCZ8odfGK1lc5HwW8BF1kF7AX
 D2dFjyZowp5Cnco081L3mpsFBqirWrUa9jqeIDst6famSyrwSaYk8BsB1yHURFjIsDb6rNsBlDJ
 W7YcLW6mv/V94cmo0cAuwIkPqv2hiqCQLvgY/c1hdSAWGt23FrLRcW+WSXPiRqbr4jBRVjdZJzn
 JM6TVCXpz6aCGI+2Z9Q==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5eae8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=vlGuhjqhAAAA:20 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=btJqPOnvGg8dZoir7aMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: t0ZVhQothsou3kKNA4McsY4RDQeOBSb_
X-Proofpoint-GUID: t0ZVhQothsou3kKNA4McsY4RDQeOBSb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-59127-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34EB042898F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Serin,

On 20-Apr-26 9:23 AM, Yeh, Serin wrote:
> Hi Kate,
> 
> Please ignore my previous mail.
> 
> There are some reasons that the upside-down mirror/flip functions can't be submitted in the driver for upstream. 

Can you explain this in a bit more detail.

> The version that I submitted for upstream is not included upside-down because the sensor has design limitations of mirror/flip.
> 
> Your version will occur incorrect bayer older on different platform.

This should be fixed by only setting the voffset when enabling v-flipping
and only setting the hoffset when enabling h-flipping, as mentioned in
my review.

It looks like the sensor is mounted upside down on some laptops, so we
are going to need flipping support to fix things up.

Regards,

Hans




> -----Original Message-----
> From: Hans de Goede <johannes.goede@oss.qualcomm.com> 
> Sent: Friday, April 17, 2026 6:16 PM
> To: Kate Hsuan <hpa@redhat.com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Hans Verkuil <hverkuil+cisco@kernel.org>; Sakari Ailus <sakari.ailus@linux.intel.com>; Yeh, Serin <serin.yeh@intel.com>
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor driver
> 
> Hi Kate,
> 
> On 17-Apr-26 10:32, Kate Hsuan wrote:
>> Add a new driver for Sony imx471 camera sensor. It is based on Jimmy 
>> Su <jimmy.su@intel.com> implementation and the driver can be found in 
>> the following URL.
>> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c
>> /imx471.c
>>
>> This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a 
>> part of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops.
>>
>> Link: 
>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/im
>> x471.c
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> <snip>
> 
>> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c 
>> new file mode 100644 index 000000000000..32a105a60731
>> --- /dev/null
>> +++ b/drivers/media/i2c/imx471.c
>> @@ -0,0 +1,1047 @@
> 
> <snip>
> 
>> +static int imx471_update_flip(struct imx471_data *sensor, u32 value,
>> +			      u8 flip_bit)
>> +{
>> +	int ret;
>> +	u64 val = value ? flip_bit : 0;
>> +
>> +	if (sensor->streaming)
>> +		return -EBUSY;
> 
> I see no reason why this could not be updated while streaming, since the h/y offsets get adjusted the bayer pattern stays the same so changing while streaming should be fine.
> 
>> +
>> +	/* hflip */
>> +	/*
>> +	 * Some manufacturers mount the sensor upside-down (rotation == 180).
>> +	 * V4L2 sets both h/vflip to 1 for 180-degree rotation, but only the
>> +	 * vflip should actually be applied. Skip the initial hflip write to
>> +	 * preserve correct orientation.
>> +	 */
> 
> I was answering your off-list email about this, but now I see that you've added this workaround here. I believe that this workaround is wrong, so let me move answer things here instead of off-list:
> 
>> I filled in the DMI information in the table and I found v4l2 sets up 
>> both hflip=1 and vflip=1 when the rotation is 180.
> 
> Yes that is correct, note this is actually done by libcamera, in response to the rotation property reporting 180 degrees rotation after adding the laptop to the DMI table.
> 
>> In my case, I only
>> need to set vflip then I can get a correct image.
> 
> First of all are you sure that you only need to set vflip? A camera is not a mirror! If you say raise your right hand in front of the camera then on the screen you should be seen raising the hand which is on the left for "the you" looking at the screen because if you were to look at you from the pov of the camera your right hand is on the left.
> 
> The easiest way to check this is to have something with some written text on it. In a mirror you cannot (easily) read e.g. the text printed on a T-shirt but with a camera you should be able to read this without problems.
> 
> Also make sure you use qcam to test because qcam does not mirror/hflip.
> Some apps hflip the image for you (esp. things like google meet) because people are so used to seeing themselves in a mirror that they adjust the view for you. Note e.g. google meet only mirrors your own preview it sends out an unmirrored image to the people on the call (IIRC).
> 
> If after this long mansplaining (sorry) writeup about the difference between a mirror and a camera you still think you only need vflip, then that means that either the hflip ot the vflip control of the sensor is inverted and the driver needs to invert it.
> 
> Are we sure the camera module is upside down? Maybe vflip is the one which we need to invert and the module is not upside-down at all ?
> 
> Hmm, looking at other imx sensor drivers, unlike ov sensors where sometimes hflip is inverted it seems the 2 flip controls are sofar always straight forward on imx. Although some drivers only implement vflip and have no hflip at all.
> 
> As you mention in the cover letter this is a cleaned up version of:
> https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c/imx471.c
> 
> Note that we've seen issues with mirroring / flipping from various other drivers originating from Intel, they have not always got this correct, especially when it comes to mirroring by default (when the hflip control's value is 0) but also with vflipping by default when the driver was developed on a laptop which had the module upside-down, see e.g. :
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/media/i2c/ov02c10.c
> 
> where we needed to do quite a few flipping related fixes.
> 
>> +	if (flip_bit == IMX471_HFLIP_BIT) {
>> +		if (sensor->rotation == 180 && !sensor->hflip_initialized) {
>> +			sensor->hflip_initialized = true;
>> +			return 0;
>> +		}
> 
> This looks like you skip writing the hflip on the first start stream, but what about subsequent streams ?
> 
> Also see my next comment below, I think this skipping only once does point us in the right direction.
> 
>> +
>> +		cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
>> +				flip_bit, val, &ret);
>> +
>> +		return ret;
>> +	}
>> +
>> +	/* vflip */
>> +	cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
>> +			flip_bit, val, &ret);
>> +	if (ret)
>> +		return ret;
> 
> Hmm, I wonder if the problem here is you doing 2 subsequent cci_update_bits(). If the flip control registered is double-buffered and the new value is latched as the actual value on the start of the next frame; and this is combined with reading back reading the active value, not the last written value then the first time you do this the setting of the hflip bit will be overwritten by the second cci_update_bits.
> 
> I think it would be better to do something similar to what imx219.c and replace these 2 cci_update_bits() calls with:
> 
>         cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
>                   imx471->hflip->val | imx471->vflip->val << 1, &ret);
> 
> I believe this should work here too.
> 
> 
>> +
>> +	cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
>> +		  value ? 0xe0 : 0xeb, &ret);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
>> +			value ? 0x01 : 0x00, &ret);
> 
> No need for cci_update_bits() here, the register is always initialized to 0xc8 so this can just use hardcoded values like the V_WIN_OFFSET path:
> 
> 	cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
> 		  value ? 0xc9 : 0xc8, &ret);
> 
>> +	return ret;
> 
> Updating both offsets here is wrong when hflip != vflip, you should only update V_WIN_OFFSET when changing vflip and H_WIN_OFFSET when changing hflip.
> 
> I suggest dropping this function and instead in set_ctrl() do this:
> 
> 	case V4L2_CID_HFLIP:
> 		cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
> 			  imx471->hflip->val | imx471->vflip->val << 1, &ret);
> 		cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
> 			  value ? 0xc9 : 0xc8, &ret);
> 		break;
>         case V4L2_CID_VFLIP:
> 		cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
> 			  imx471->hflip->val | imx471->vflip->val << 1, &ret);
> 		cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> 			  value ? 0xe0 : 0xeb, &ret);
> 		break;
> 
> Regards,
> 
> Hans
> 


