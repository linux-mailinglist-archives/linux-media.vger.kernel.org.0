Return-Path: <linux-media+bounces-52596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIpHGgdojGkdnAAAu9opvQ
	(envelope-from <linux-media+bounces-52596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:29:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8AC123DAC
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22C38303EAAC
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB38F36BCE8;
	Wed, 11 Feb 2026 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuuMKF3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmPPYY9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E924336BCFA
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809321; cv=none; b=Wg0OA40vt40rqtumFjI/nlykb4Y3mE/PxeY+EQ7gZBFlyaJTe391P3g++Xccs9C801dsbliM7VMcCeB5SrSQQDXd7XL7gN+wSATyFHcr0YD93Rj0avyrwJ1KUhAAatlT7o5SvDJCLdJ9JrPiqDSbLTD4mwqxuM8k5PNfABZ8jwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809321; c=relaxed/simple;
	bh=zjRfCYvn0HwOiG2N5SXplwll2RdwRZQpqPt75JDx4Ug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GSoYHkTksLAKqLKycGhN+8gYJfR1SPQbDv8XzxrcNBFr8YtbgjfDOks8rGUnpiR1N9MyQ11OvgELhQIPNCDlDI8qrFBb0mdAUivhJbFSyD47mAC/M1Xnlj1zZ+ZPEl4GshvaYkVX/7qJwSkFT8I7bEGcsO8klS9OREttSj7hYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuuMKF3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmPPYY9R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BAH7GK2296900
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DE71sEnrIUr94aD31JpJQGVqAEN/siC6VuNOhwJ+Du8=; b=iuuMKF3AspdoE8OJ
	OX29Z8DkqKXSNTdJwKeJ1yxJZEkkzcCyUA8aiSGDFZwD4Un9KE8iKrmFv+aoCs1P
	tfUKAVY2/+FsbQ3trVH5QhDJRkHvG+L1BT6AwB1jnoecKNwbvVLmSHG2/a76pyDK
	7PhdjgI/mbK1X1nDDzydj6KOUpg+umdPNI0smb2Vwjl3CvwCaN7taaKdumY2mXpE
	SojTchVMgWUorHUiTjXQak/vDzw0Vf/F0fmTUOD7UpQgmhwCQTnGkZ1IdcoZGxri
	fJ6qg7kxiex8CmUtip6ALwXKqELcnZB5cMYBs5H7DayZg4GZi5TWBzaLiXfqMx+R
	xOha+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8qvq869g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:28:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso187047685a.1
        for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770809318; x=1771414118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DE71sEnrIUr94aD31JpJQGVqAEN/siC6VuNOhwJ+Du8=;
        b=OmPPYY9RD3scJdxf1K3XbRnHgk3jlX5yIaQKP2FPIBPnuK68jl8PGf/OtXb/LjCvJI
         +Vuy84TxtVNTQOi7PqmQZrFnGA/+9s7z6Z6II0LnCJkcla/XSK9aDOj45bk5MeeZ0SGC
         +fvDcPIOnloaFQqzLRJ+LolbVcWcIXpdi2muZ/V2DFXOwOTypU8leDGuJUzOUH8BjD/+
         uLbBrtLxPAMtBhvHCybwHoWb9JyBlNa/qydBUsaQT420ycHBMryTBh0Kiw4CmM83vrNk
         q3qWmJQu2rPXPx81hDG9TZJASFtlnDK9CMRzdWfJNvY0eH6ZAI9BwwepQG+AnAHs35IA
         wUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809318; x=1771414118;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DE71sEnrIUr94aD31JpJQGVqAEN/siC6VuNOhwJ+Du8=;
        b=u3SVYNKUxlQLc5YIbmnQi1aZFiAPXZUYvUsR5xhjC5il2SgzthXtZ8loxtdz87xJ+U
         P7O0m7toyoCJ/mycQw1iF9gG6uu11fOsLqopxgL4KFEiUrYIte3eX5Eh9R18S0XflxQX
         sRlbqUfliHVGescp6hNlDwu6/W8d7apMH+tk71/spM8CaE4AEzkt9fwFTz2WeHNnmxbt
         yka/Re7CSG6j6AxjycFm5M8eqaBXTvyVz7WJCq0SllzqfFjzlkko9INWdbJCyKHajnaA
         eATLHN0QRJz4/22X/zeC+y5Jl5O1cFl+gHF9Kef1+JDR6xUiPiCbLWRrytNExdSgosJy
         e4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfK1ZY4HXUxYBijgXnBtVPCZV2CZeABCSAtCtF35tiuwGf46U0XKKeKfd3ux/+FNTyCdfgqVfv1m0ByQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzL0rn0ZXoAu7BnJOrHcgczYJ7YrAG7fhN8ZcjpKQSD3vIkrXp
	2j+jTcGHAWx9hCvQjfXmvGlQajRtK30FcB1Xwu4j9Vkl142gMuiE0/EuYyL46psZpZPFjfXuHKJ
	t8ZzBf4eXdcm1IVSfsRQEzkxdLCn5KijacBbYSZWev1HDRPalPxl9S4y9VIYvh7/T1S9ak+T8NQ
	==
X-Gm-Gg: AZuq6aJVsWO/cMMo4K0e0RpLAcH6AWL4ooEkjxncoubYknZNnwFQvD4bAm7pbrpy/nR
	RUJtLjiFGjhFxmioAWje2veMbQ87IkKxrTBz1fHRMD14B2KjwBRVYCHMrhnOWdFqKsnkgopE6tB
	8Nx9HqYrUvnEbpDEzsLautT1uHS/pFTpoS6g+vTSjwM05eipX3p+FUr/z0ZShoK51WGuTbHmgQQ
	++1xQcISfriat4BZrBEVY7kmAFzurkZKv9a5wPrTsfwz2Qyb3Je/NTUVnp7yllmf3q5wS951U/5
	vF2vjydpvu+pOCx34HvsSKXEfkhmXWfCpdcllHf0sTnNelcLsz9RQw3QY0hT0KMS0tyAp3ABqCH
	KR39yaXVD4C0SIMp+FObMryTELdrCyT5l466S7iLA3d7jAUMgqoL+/oIhX4I7y+u34LFU2zFKZn
	e+IZASay+NsAreetxCuqun9ZlCtCvR1H4RUC7TFY1X72iMnoMwXJCKBcmWJCiGzV3+TBs2hnklb
	g1SxE33xCVDC4mV
X-Received: by 2002:a05:620a:4804:b0:8c7:1b10:e35d with SMTP id af79cd13be357-8cb1edb947cmr725915085a.24.1770809317995;
        Wed, 11 Feb 2026 03:28:37 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8c7:1b10:e35d with SMTP id af79cd13be357-8cb1edb947cmr725912985a.24.1770809317578;
        Wed, 11 Feb 2026 03:28:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd984csm50133566b.39.2026.02.11.03.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:28:37 -0800 (PST)
Message-ID: <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 12:28:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in framebuffer
 conversion
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: soufianeda@tutanota.com, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r5VpO9wmNxs-MpCXTc-puZbm3ZkTvfTy
X-Authority-Analysis: v=2.4 cv=Q77fIo2a c=1 sm=1 tr=0 ts=698c67e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mlNn8-T5AAAA:8
 a=bKjmrzRvnwYi2RYbpB8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=_4ER54FGBOWlvg8qisjz:22
X-Proofpoint-GUID: r5VpO9wmNxs-MpCXTc-puZbm3ZkTvfTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4OCBTYWx0ZWRfX2MQojVKna1iH
 04Bxzm7Rq0s/8YvKSmEUxfyx4N+1ONpVUXLPESE0CgJg0VKeehbw98BXqkRqD9qlKCwETnLvqOX
 wKG2PbBxxKIQt17ABaekjgSSI2wsbudYf4QfDctEG8bko6j0Suqb7kcHFFmrgdBpujGdez5LLQW
 g9tphTsKbrbFArMZ9dGphCu+tEDOJzzjzElmYlM0LqrRWNnSj1v2l9rUxs60XlYyrOajDvUWbNE
 poeaxnHGaPAmWgCTQFR+rkGZYwnjQBHnzjk8RqmSk8hsktR3FhQbFoQJLIIrWbgkD90FgKuhVo3
 FthMpaLUvLgHhdd3U8UpblQqDmxoWC1e6R8KGx6SiR/DO5DySQXZ8V8aJeDrVSoYUXb2EMU9zHE
 qGIYRnOa1hXZIAJnfhzEuCA+9/DppoAQaMmRYneluMlICwIRE9Z8Zey7A9va337pAFy5WuDDz8F
 iCFppcKO+8sR6fIBq5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52596-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tutanota.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF8AC123DAC
X-Rspamd-Action: no action

Hi,

On 11-Feb-26 09:11, Sakari Ailus wrote:
> Hi Dan, Soufiane,
> 
> On Tue, Feb 10, 2026 at 09:53:50PM +0300, Dan Carpenter wrote:
>> On Tue, Feb 10, 2026 at 04:26:31PM +0100, Soufiane via B4 Relay wrote:
>>> From: Soufiane <soufianeda@tutanota.com>
>>>
>>> Validate sizeimage against the allocated frame buffer size before
>>> hmm_store() to prevent out-of-bounds write.
>>>
>>> Signed-off-by: Soufiane <soufianeda@tutanota.com>
>>
>> We need a Fixes tag if the bug is real.
>>
>>> ---
>>>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>>> index 3a4eb4f6d3be..ca7ffc7855ac 100644
>>> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>>> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>>> @@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>>>  		goto err;
>>>  	}
>>>  
>>
>> There is some sketchy stuff happening in this code but I'm not sure I
>> understand the issue.  The code looks like this:
>>
>>   3317          /* Note: the padded width on an ia_css_frame is in elements, not in
>>   3318             bytes. The RAW frame we use here should always be a 16bit RAW
>>   3319             frame. This is why we bytesperline/2 is equal to the padded with */
>>   3320          if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
>>   3321                                         sh_format, padded_width, 0)) {
>>
>> This allocates res.  Why would it allocate something smaller than
>> arg->fmt.sizeimage?  How did you find this bug?  By testing or reading
>> the code?  Do you have a reproducer?
>>
>>   3322                  ret = -ENOMEM;
>>   3323                  goto err;
>>   3324          }
>>
>>> +	if (arg->fmt.sizeimage > res->data_bytes) {
>>> +		ret = -EINVAL;
>>> +		goto err;
>>> +	}
>>> +
>>
>>   3325  
>>   3326          tmp_buf = vmalloc(arg->fmt.sizeimage);
>>   3327          if (!tmp_buf) {
>>   3328                  ret = -ENOMEM;
>>   3329                  goto err;
>>   3330          }
>>   3331          if (copy_from_user(tmp_buf, (void __user __force *)arg->base,
>>   3332                             arg->fmt.sizeimage)) {
>>   3333                  ret = -EFAULT;
>>   3334                  goto err;
>>   3335          }
>>   3336  
>>   3337          if (hmm_store(res->data, tmp_buf, arg->fmt.sizeimage)) {
>>                               ^^^^^^^^^
>> The worry is that the buffer this references is too small.  I would
>> prefer instead if there were some bounds checking before the memcpy()
>> calls in hmm_store().  They would use a different, smaller limit if
>> only part of the buffer could be used.  I don't know if that bounds
>> checking is really required though...
> 
> Indeed. Beyond that, even I have to admit I have little idea what this
> IOCTL is supposed to be doing. Possibly feed in a raw frame for processing?
> But that's not supposed to be implemented like this... The TODO file
> contains an entry that says "Remove/disable private IOCTLs" -- we should
> move to use parameter buffers instead.
> 
> I'm not sure anyone depends on these IOCTLs at the moment, but definitely
> some obviously are associated with some risk.
> 
> The world looked different when this code was written.
> 
> I'd disable all private IOCTLs in the driver, with the possible exception
> of ATOMISP_IOC_S_ISP_PARM, which is close to the parameter buffer approach
> already.

Ack, my suggestion would be to completely remove the entire
atomisp_vidioc_default() function from:

drivers/staging/media/atomisp/pci/atomisp_ioctl.c

(and stop setting .vidioc_default)

as mentioned this is something on the TODO list anyways.

This will cause a bunch of code to turn into dead code, but I would
like to keep that code around since when we add support for
a parameter buffer queue that code can serve as an example how to send
parameters to the ISP.

Regards,

Hans



