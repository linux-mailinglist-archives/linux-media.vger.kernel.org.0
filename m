Return-Path: <linux-media+bounces-51370-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QfoFAcvXcmmqqAAAu9opvQ
	(envelope-from <linux-media+bounces-51370-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 03:07:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8156F6FE
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 03:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD6030062E4
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 02:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EC636CDFB;
	Fri, 23 Jan 2026 02:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+Hlid+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVA44ZzT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4328366049
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 02:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134008; cv=none; b=UhsbGfIREVjtL5Qoqbq0iV/4VUL3oPGGE1ngQwifM7pFctOOYRVykF2pG05HlX06LjoGbU/wef9SawU4Z07825SdS6UmWcjHQ7D0+ADvhnjJVvmmi9i1cM645olaWO/8sZGliU5IhKLgmEKlu1FRRz6QP6pflBQVsq1t8tsD9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134008; c=relaxed/simple;
	bh=bjXz2uNgevrvoVgxOP3/YRoBEpxtpiNqvthwULkiCOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1rZxouKVZcmDh9qGz0GogRMLLaX7qDgrehLlLUeAPN6hWzd0KzNMzyEo8/24mBDrebtMf9sMpQTVpMCtu59Y7odKk9cTWYl34hYZHqhCD2kV6sXvK44Oj+BVnUwSvtCguhy5mbr6Ui0mL/vtC8E8WhZODaFw1hu/1DV5neAKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+Hlid+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVA44ZzT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK82H34138678
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 02:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ib6OGxut6zAbsFSJhzdQvferETY5q3TDEEt79Tgecv4=; b=b+Hlid+eLaZoCOyn
	bMHvppqRXCGO4M+PdLFi86GEGCcDOYbhGBOLTIouYt+QYgCnBR3hwWsA8yuWzAkI
	HTmSZe5GyRAWGDQL4FScjZKjWIW3oAz7MBX/b5sPde7npQaYbgt0zy7bXmgAPDN/
	bTNlYjHBitDzcXZ2iPlE6b6MLGmq9XcIi769DeY6d5xpT2Z2pk+a5AOtnw1fAf67
	sBcGlsM++eQIkUSxPVhKLCArzm40iX+6vr12CggZBo6uWfvm0c5lTaraitHew29P
	LACckrnrifnpJpo+1WBiXdiDHMaBLODdeS6LNQbF/OZaY86cgIe0Gy3jAeHIm4pM
	e+ZWEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2jqu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 02:06:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50147745917so69545631cf.3
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 18:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769133996; x=1769738796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ib6OGxut6zAbsFSJhzdQvferETY5q3TDEEt79Tgecv4=;
        b=FVA44ZzT3PNgjj46Si9Hu8dZJJcFYDPzwcaSCt7dHxfKMjZwGc1LVfYSs/5mPhjW+V
         aniXxOCgf7HP2fkchQC+ga4r7hvYg2d0xZMGuU/Z4cwRPmRgU+GLqCAPR8gCluXoWcpR
         y+rBo1stjTBK/UMbw/voZqjIjCpQWzf6/XJVZ5gs9luyUA+fSLVk3PYeTmYYYRSZY28L
         tJd2rI1aig+XN3MJCohOdqyPF0qavtcZftFM+/Zg8C35TxqV4+vusTGhCRSu02EPjkSm
         PbLfuM6LmD0nsPdbweKAOa+JtvCo82iW3dmLetJKUhiaQSzukb14h+8oSj/n7rKHN/OT
         ipVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769133996; x=1769738796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ib6OGxut6zAbsFSJhzdQvferETY5q3TDEEt79Tgecv4=;
        b=OIeBv3O7vHyUvL8kmThWF75tqf1PpT+VcwXhrxCt0fRjv0JEj4VWYIuXlGXav8wOQZ
         neSaQ0dltPSotcEJUYioMIKHzYUht12E0U4savSnuU/YKoFdQAem8tiAEpbkYHC1WSxK
         Mh3rSEcEQwa0W1UUL8DMFV9QJXHEli4fuUVoodnnntZ/DR6Gz0klzQQu8lm8Fo3Tgh4Y
         MyRNr2Wxyvb3k6Q615WEZvrGKvvFYMNjCAu7Mvrn6JrdnRTIubivGC+bLoJKHCqdOQlj
         vItD+1ciK1CHu3BJ9BZCQvXpRI9v5lYAEe/mhprIA+McxxGIg6Sa8dLd+MWn4dD4hWC8
         Lrow==
X-Forwarded-Encrypted: i=1; AJvYcCXXrRVjRRFjwhp4DaDbaHCEI8smAB5w1HaZuR4t6GunmfDZrc0wJias/tA13JRTrXxP8Ia2osa7USkyCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QXNnjSxZqbew+yaIgcLdKYKQqqr9MyVR06kOmmsNmRHnew3I
	UDoOuVHjOilu9fVog86FiVcw0qGjdQOJAsxr1h7kRkNfrJa2Y32zlQTa0fgSHh2MDhOHlvKdynO
	f6peFB1seqV78oJ/QLirenbOEPA5P2CVvzspBSyQtfMmshJZ/wA8r+43pU5kR8AQn1w==
X-Gm-Gg: AZuq6aLaJKV9D44B1ZMfzq3muuHQMemLv+DpE4tsx9tR2wHVH7bagYTCU49Rc7r1i95
	DgHUjpZP1zz8NL+QLkeExPCqXPnh2xQWnsPvsNpWOGoFex+/g0PJrmQVRD9TrIPSpn8MExy8OAN
	gzC2RSmee9yux+75JhmOEmhoP4H/u1se0jX7KcCZfEjPe+TObTAC0yvUl00g2HHyz8uFUIGfn4u
	fW/tvXRB/qsNU9x44BriJyLNiJvvQyoUu7UnEObF8C+rhWhoBswlKh/qo5cADCHJKsJdacO9hA+
	gcJXAlLkB82XyX2xAdbnCcb40iqFYi3CcUMrN4got29y5+/D/402+1bRvd1c3RrM5QzQl3T4Ggr
	zAEYkqqRAhsDfDqjCpyC7bLi3Z8YJ5jmHzABhI5I5A/4qrW7OPk2Mp4BcJbsk7LVBTjFkE2cc3g
	==
X-Received: by 2002:ac8:5ad1:0:b0:4f1:ccea:6744 with SMTP id d75a77b69052e-502f77cfaf5mr24109441cf.58.1769133995851;
        Thu, 22 Jan 2026 18:06:35 -0800 (PST)
X-Received: by 2002:ac8:5ad1:0:b0:4f1:ccea:6744 with SMTP id d75a77b69052e-502f77cfaf5mr24109261cf.58.1769133995490;
        Thu, 22 Jan 2026 18:06:35 -0800 (PST)
Received: from [10.111.168.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37c84acsm71085285a.6.2026.01.22.18.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 18:06:35 -0800 (PST)
Message-ID: <e9516434-2cc0-476a-b9e2-a7159e3de34c@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:06:29 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] media: i2c: imx412: Extend the power-on waiting
 time
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
 <20260122-imx412-v6-2-2c0b54594c2a@oss.qualcomm.com>
 <aXIZ_lxi1OeuXbV7@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aXIZ_lxi1OeuXbV7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FD_IXEBVbTu7ihkwIuDvGnT8AmpwDKIr
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=6972d7ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1ev712hiCEvYkArktcQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxMiBTYWx0ZWRfX9jnUdbWq5VIU
 0rfntBPydWouFiK3vAwC9N2K9TnxT4qrKBIuxucNFqMDc5fpfZYZAd7vJHQRTgqwi+xymO6zFoY
 2PpMT9QhscxAyI3DOdvZmkf6YaioQVbvagl6KqKKuEiaR6g1HRpBQ9Wu0M8bqceJBj2IMcbp24T
 eXGpwrmojQ7QkdfHbG0HBT3Mgcyhgwtw4OlhUCIyH+6KoBxisuGXOffc7ab6hjV0TeMWJkllIN1
 ii5pCyt6tkWy3Adwdbu7zhxwKv7whL1gBOQPe7quyJhYuA+lu3Co3aLFk/LeBYOq7M0wh6hAILJ
 r7g5AcfcJex3n6QuR8Kup9GqHOtqBUM0vcNxS31Xh6y0XntpIeRe2URHm+/M8pxn24u8nviKAlD
 Kd/d21Nf/u43/VenwEPUq5qpYKaKH8DLdLvx+0cJA1brXMy6OnlKJGCsDyVLgjznZEeaYn/F7ec
 ryEE9K0sDLPV3Q0J3ew==
X-Proofpoint-GUID: FD_IXEBVbTu7ihkwIuDvGnT8AmpwDKIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51370-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D8156F6FE
X-Rspamd-Action: no action

Hi Sakari,

On 1/22/2026 8:37 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Thu, Jan 22, 2026 at 05:31:19PM +0800, Wenmeng Liu wrote:
>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>> configured in the current driver. Increase the wait time after power-on
>> to ensure proper initialization.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/imx412.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
>> index aa63dfc349181bf9c180ffd566b0317d05b410c1..9154c238949e4308755e757bd9c71f0b44f433ee 100644
>> --- a/drivers/media/i2c/imx412.c
>> +++ b/drivers/media/i2c/imx412.c
>> @@ -1037,7 +1037,11 @@ static int imx412_power_on(struct device *dev)
>>   		goto error_reset;
>>   	}
>>   
>> -	usleep_range(1000, 1200);
>> +	/*
>> +	 * Some IMX577 modules require a longer reset settle time.
>> +	 * Increasing the delay from 1ms to 10ms ensures reliable startup.
>> +	 */
> 
> This still doesn't mention the Arducam module. :-(

Sorry about this, will mention to...

Thanks,
Wenmeng

