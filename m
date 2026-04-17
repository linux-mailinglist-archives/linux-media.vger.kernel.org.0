Return-Path: <linux-media+bounces-58996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILx0NpAJ4mmE0wAAu9opvQ
	(envelope-from <linux-media+bounces-58996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BA41A0D7
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75A7E30E9D73
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD803B6341;
	Fri, 17 Apr 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGX3yQEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENgl1ln1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467AA12B94
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776420977; cv=none; b=d/SziiRha1WrUc8Xgb3J06FGnOWCjPpFfMu2W1lLzdJNpI7kx1w6J8+JQBjoEV50XG+NeHz1rKg2GnBLkpi2L9YVBIb5oTjlAF1SHnAxn7K1MYiHo4lvMFDVZNBcLCiG+taXv2DUwhgQny4u6zq5QRANJSwRhsKjD6n8DaJyr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776420977; c=relaxed/simple;
	bh=FbRccAlNnTxvIjKHLYcaGVLSPfh9iyD9P+CWG72bXZ8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mz7RmoJlIRvu17p/+l97UTeZ8GQbqGqZ7n+dkHA5SHRYGmYAEL+0Qvs3uAKJALIkCPfH4WHIFcCbNcJqCfBOlib0OnUiJwNw8kwkalUfjzrtZVxZkv331eqIE43e2q38FrHrfPpAwzQkRxVF+5xxAqnWmnOBOydZxDPzQ7M3Glk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGX3yQEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENgl1ln1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7vlkw1092086
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jB5s7u6k9Zzlr7X3W5qKaFiB0WFBTWxPhCDheBItAY=; b=EGX3yQEE6nHTovvN
	ot/bzxxsb95qZj3MVBh6pZkAStRXMi1WKAkU27PYIaCs73LRhJdVHLUfErbUTSOh
	3pgQG+SX8zOxEb+EoccWQDkDS/xb6jWC7xebUXpeoaH2iZJZDhYzWfJg1tunEsr/
	jxN1V5uKXyAaD6S/OAKl6LlZyIBz2I4bwuI0mQchfJSLo7JR6ihwRWyOAky91jMg
	M5HDt3kDvdqoNOy5T6JzzlRV6FM1lqG//WGOSomJSl6APoRgNcnFWFS3/UA/qMNF
	9yPwp76gcbSkH4LdS9EBsyZFsKexin9HX6AKfXk+1FVnuCp3eb5AW1iOohpm0Me4
	e7NgMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk227uqtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:16:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d63962d83so12857751cf.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776420974; x=1777025774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jB5s7u6k9Zzlr7X3W5qKaFiB0WFBTWxPhCDheBItAY=;
        b=ENgl1ln1XNFD8R7HIbxrGiUPqZ1JSfsTzrPs1dIJtHxuvgWer1ADYtjwz+VcrcEBoL
         9oW0ZQ5+T2TwJsPpYE8KjdI9HjRD1AoqR9FM3SQYMp/DD+HJtN2oWdbDUxnk8sjunQvI
         4YvtD5tZhWjRxtSYQefV6U4KXZ0iz7+uuf0VvH/7LUV7KqVbA3iXIznCJgTktmsR6duo
         clWfBj7d5hIVMw6M5U+Wr/3wcUe36uQOcS7uABySx04bze8CZISrXGfBHlDBVEXW/965
         oGwYXkjeRua4omHGxUQqzjqPUnWM8PjTO7o1wQvjPOE3WDEvtYTkyr74wv9i5CCl50yG
         J57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776420974; x=1777025774;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jB5s7u6k9Zzlr7X3W5qKaFiB0WFBTWxPhCDheBItAY=;
        b=fAScKQEz6m0Y90GEpVQsc45U8tSDuJgWebr4cSj8ppZrw4dbP/istKgJqo/7fEQkoK
         9kuPuNHz8WBC/E84scRZRpWgqwAqQ/PN6n9EJ9ycmGBdcIu8ccmSTSB5kvKb+a2/oPDj
         jIBekWhGxUwXySY/D/JUFWPujB/Chxg1G853ZsERo1P/73ZdhQomZoqTbf5v7eAKsczW
         gOkTHyhcKq3x8FqNB7lguxG9A81OmTk3rp5mW/m0ce58p4XEzujh/1ZsWHMXZleo6ZBb
         7oooDNTzKrVH9lfHJRnj75pTnXuskX8N2It/7Tv3+ASje+InBEZRMlEpvmvzQlgUKSHO
         wNGg==
X-Gm-Message-State: AOJu0Yx/572nP5WToIdN1jEY1t2QMXFdgyrkUd9GNu/ZzaeMc532dAy3
	FKxekmPnAiMuBT+Rx1Czuy36VcKr1KGdCysR/u7J/m/NBFp/qDFUevOvomMRIk4TF/CGslpfUIm
	47U4nC+/YZPalnoJEiAZiX+R+TjQy1lOilUadRhHNHN3jcba10V3n7/pB0VGOMb79AQ==
X-Gm-Gg: AeBDieuXGVQBLTyLJy3tYSdLgM4e93dOLbd+5/Ml2ey9LYI3uy50yQKwNU4hAQ/GGqZ
	kjhLVcZOOLh5XKLSA+EZBEAbICxMK1jlxiDcPneH+qi+s2Ripn2xkYaAlo4ljJLr+2PHIdyKyIl
	CPFpI4CN/j/VYaPq0XhGmqG2EbJfJmnnb07JWssPWMY6yDDxNzGs4xAWuod/swkk1z1hz8i/9ah
	SJ6rMx4fLW3nhx07GDc0qKQCAowmXOPv77s1GpOf+OIVWLbbw5LF3qCAlOaJc6lqKcJsc0ZQO7c
	dw9WljWctCShmaZSwC9nxyKbojOnXnjvDrOohs2bGHfhiLr6BasCLgjiDjm7eaEhd79AhynX0vs
	bDFlFVhD6vLVeub4Q91r7ejWXoKJ5qDd1bCCXmpkmxMtbCb+4R7wGDFEAAv1e7Dpi59RB4JGPME
	TmFRvtwa1SLENLSR578QZxilxwM8JSC3nkJVYJLKW9OXzkXvv5pQ5HebjAGzQst8daByVPdJ210
	tbfyEULhrC37ThZekp/hDdVyO8=
X-Received: by 2002:a05:622a:2b07:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50e36ecedccmr28082311cf.41.1776420974433;
        Fri, 17 Apr 2026 03:16:14 -0700 (PDT)
X-Received: by 2002:a05:622a:2b07:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50e36ecedccmr28081771cf.41.1776420973888;
        Fri, 17 Apr 2026 03:16:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455539817sm39424466b.56.2026.04.17.03.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 03:16:12 -0700 (PDT)
Message-ID: <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:16:11 +0200
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
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <20260417083214.222189-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEwMSBTYWx0ZWRfX/H6huHbrWGJ7
 cxqujsobHBzDpKsPwLNOAezkxhu9EtMPI21+cJDBwDay38xf2emdM8SJQZC+uNsxEfBQ4p+Owqd
 fg5OWrEka7FPxcmRC7GZjtTohJRJDEP49VJHK31mMQLF/JcmQDBiSU46BE6ppmEUuQ3bmPtBScb
 1F8lKg8cawmZHAztr7C1JpzmBqfXMfhmu4LOBb3ZbGFl7zHLn8rOcgfmEbQoxPU9WseR7UYqVMJ
 HkuLukHyLPIpUipDd8JsskrjRwH2I513pLSTa8/D0Ibl95O8Pw0MDKV3jAxWRWHuIMZ4zLXiwWF
 69doN1tGFxU6gUOB5tM67aBG/x04USfd8ZiTDzj7T3IqA+JnxxYeUV0lEwgfi31hRGxiUcPA2AE
 itLRibIm5VmXX96CMiKKFQyvW/X4T6qR/h3WZRuyQubDhrNfXva7bcfo8AImgfH5J3ewNSfIX58
 cv1jqnkC8ztkj2Y5DqQ==
X-Proofpoint-ORIG-GUID: 2N-PZxt0j_JR47LqSstqs8AZXMFT9nrR
X-Proofpoint-GUID: 2N-PZxt0j_JR47LqSstqs8AZXMFT9nrR
X-Authority-Analysis: v=2.4 cv=Iuoutr/g c=1 sm=1 tr=0 ts=69e2086f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=vlGuhjqhAAAA:20 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=MCOcW4g6KZAOg600A84A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58996-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E7BA41A0D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

On 17-Apr-26 10:32, Kate Hsuan wrote:
> Add a new driver for Sony imx471 camera sensor. It is based on
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> in the following URL.
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c
> 
> This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a part
> of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops.
> 
> Link: https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/imx471.c
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
<snip>

> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> new file mode 100644
> index 000000000000..32a105a60731
> --- /dev/null
> +++ b/drivers/media/i2c/imx471.c
> @@ -0,0 +1,1047 @@

<snip>

> +static int imx471_update_flip(struct imx471_data *sensor, u32 value,
> +			      u8 flip_bit)
> +{
> +	int ret;
> +	u64 val = value ? flip_bit : 0;
> +
> +	if (sensor->streaming)
> +		return -EBUSY;

I see no reason why this could not be updated while streaming,
since the h/y offsets get adjusted the bayer pattern stays
the same so changing while streaming should be fine.

> +
> +	/* hflip */
> +	/*
> +	 * Some manufacturers mount the sensor upside-down (rotation == 180).
> +	 * V4L2 sets both h/vflip to 1 for 180-degree rotation, but only the
> +	 * vflip should actually be applied. Skip the initial hflip write to
> +	 * preserve correct orientation.
> +	 */

I was answering your off-list email about this, but now I see that you've
added this workaround here. I believe that this workaround is wrong, so
let me move answer things here instead of off-list:

> I filled in the DMI information in the table and I found v4l2 sets up
> both hflip=1 and vflip=1 when the rotation is 180.

Yes that is correct, note this is actually done by libcamera, in response
to the rotation property reporting 180 degrees rotation after adding the
laptop to the DMI table.

> In my case, I only
> need to set vflip then I can get a correct image.

First of all are you sure that you only need to set vflip? A camera is not
a mirror! If you say raise your right hand in front of the camera then on
the screen you should be seen raising the hand which is on the left for
"the you" looking at the screen because if you were to look at you from
the pov of the camera your right hand is on the left.

The easiest way to check this is to have something with some written text
on it. In a mirror you cannot (easily) read e.g. the text printed on
a T-shirt but with a camera you should be able to read this without
problems.

Also make sure you use qcam to test because qcam does not mirror/hflip.
Some apps hflip the image for you (esp. things like google meet) because
people are so used to seeing themselves in a mirror that they adjust
the view for you. Note e.g. google meet only mirrors your own preview
it sends out an unmirrored image to the people on the call (IIRC).

If after this long mansplaining (sorry) writeup about the difference
between a mirror and a camera you still think you only need vflip,
then that means that either the hflip ot the vflip control of
the sensor is inverted and the driver needs to invert it.

Are we sure the camera module is upside down? Maybe vflip is the one
which we need to invert and the module is not upside-down at all ?

Hmm, looking at other imx sensor drivers, unlike ov sensors where
sometimes hflip is inverted it seems the 2 flip controls are sofar
always straight forward on imx. Although some drivers only implement
vflip and have no hflip at all.

As you mention in the cover letter this is a cleaned up version of:
https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c/imx471.c

Note that we've seen issues with mirroring / flipping from various
other drivers originating from Intel, they have not always got this
correct, especially when it comes to mirroring by default (when
the hflip control's value is 0) but also with vflipping by default
when the driver was developed on a laptop which had the module
upside-down, see e.g. :

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/media/i2c/ov02c10.c

where we needed to do quite a few flipping related fixes.

> +	if (flip_bit == IMX471_HFLIP_BIT) {
> +		if (sensor->rotation == 180 && !sensor->hflip_initialized) {
> +			sensor->hflip_initialized = true;
> +			return 0;
> +		}

This looks like you skip writing the hflip on the first start stream,
but what about subsequent streams ?

Also see my next comment below, I think this skipping only once
does point us in the right direction.

> +
> +		cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> +				flip_bit, val, &ret);
> +
> +		return ret;
> +	}
> +
> +	/* vflip */
> +	cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> +			flip_bit, val, &ret);
> +	if (ret)
> +		return ret;

Hmm, I wonder if the problem here is you doing 2 subsequent
cci_update_bits(). If the flip control registered is double-buffered
and the new value is latched as the actual value on the start
of the next frame; and this is combined with reading back
reading the active value, not the last written value then
the first time you do this the setting of the hflip bit will
be overwritten by the second cci_update_bits.

I think it would be better to do something similar to what
imx219.c and replace these 2 cci_update_bits() calls with:

        cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
                  imx471->hflip->val | imx471->vflip->val << 1, &ret);

I believe this should work here too.


> +
> +	cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> +		  value ? 0xe0 : 0xeb, &ret);
> +	if (ret)
> +		return ret;
> +
> +	cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
> +			value ? 0x01 : 0x00, &ret);

No need for cci_update_bits() here, the register is always
initialized to 0xc8 so this can just use hardcoded values
like the V_WIN_OFFSET path:

	cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
		  value ? 0xc9 : 0xc8, &ret);

> +	return ret;

Updating both offsets here is wrong when hflip != vflip, you
should only update V_WIN_OFFSET when changing vflip and
H_WIN_OFFSET when changing hflip.

I suggest dropping this function and instead in set_ctrl()
do this:

	case V4L2_CID_HFLIP:
		cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
			  imx471->hflip->val | imx471->vflip->val << 1, &ret);
		cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
			  value ? 0xc9 : 0xc8, &ret);
		break;
        case V4L2_CID_VFLIP:
		cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
			  imx471->hflip->val | imx471->vflip->val << 1, &ret);
		cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
			  value ? 0xe0 : 0xeb, &ret);
		break;

Regards,

Hans


