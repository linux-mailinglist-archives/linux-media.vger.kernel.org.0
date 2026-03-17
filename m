Return-Path: <linux-media+bounces-56121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH19APy3uWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:22:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DF2B2303
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6509318F1C0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C073845D3;
	Tue, 17 Mar 2026 20:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwdEvHUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T36YvJ9G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C2348860
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778651; cv=none; b=pBmYGy9oRfNU6XpoR/CKThRAAaWKz7nIWk0yXrAI6JudouMJHwFZEJsP5fZxcWIqzWHNrCRSq08mxapnXTxCfgNR3VgMrj7MmrZa21KTEwCQ7SnEc7RfFasgC5sJFLMC4z+3blSvWD4wTAZ5NTiBfogXkQmcaExbxP6WZU201yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778651; c=relaxed/simple;
	bh=DSGod8/rbwUuy+7Fk5iG2SYiUUonGdHh2WmqwytyRJs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cV1dx+yyPC2JFNfV1ES6Du/KwZ1s/sd5KGqtUtBvlR5Sg21h0tryR9trRP5OyZM9FN6T34WXsn/ZIsPHeYrm+ilt+j6p/5HPl8b6t9MScJWj48/mZOYu3pVLACtFG4RC7y9DZjD4SGsUWUgf/t5MTpJ/zxBEld2LgbpbiAuzD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwdEvHUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T36YvJ9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJHN61632399
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvhvaggR3xBuBneqrzNZa/q8kTsAXME3AY8AiUv2AIM=; b=OwdEvHUGWV3t6gd6
	eqJ9sm86EtT821tQcL8HsA33/PRkCPW6h2FcsRaV/Q3AzbsUxeBxeHdcGuvstOQs
	yKQc9M9tamDuTIBFDFeud/Mi75nthbK0qi5rZb2GpgciXNw4hH8Fu7n3Tfj4nKNT
	Uw2Y7vp7mNnvd5ugmyfua/ORldIR0KkEmOgQmcqL0QzLk+wxels7ODsTtxkaOKqD
	n1Gqzp19ozkKxOjVxiDkfnAyGJXv9oiGWZ72NLVdwZWi+5Im5Nls8atn7I4lsYli
	LMTOvHdzF3UdmILc3peghFB5dGojmIE4E1snZvUI9soOiLffH+ruIttiU1wUw3jC
	8c5ezQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapuguff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:17:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509011403a7so363493421cf.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773778646; x=1774383446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvhvaggR3xBuBneqrzNZa/q8kTsAXME3AY8AiUv2AIM=;
        b=T36YvJ9GUdiLlwU1V3p1KSnsMRfSnFZ8gtDdwmevhDNu8jBCizVVi8yzPmDHM1KdlC
         CNEBva2UM40ZcaiWA+QSAw8Ilvu7u5nTi/sgg8Qbksvogix9xuKVz6Iyb8aMRHwjkBju
         pdF9qS2K0U/E32l024BvyLrCpDvIv2NHoCRl1VXm92zMB/dCPsETLwbjv0WECWutzXSM
         +C0R8LmWR1K9HJooJhj0djZcm4fNVjpaKsO6YLI5jFj0OyX6QMNeat0H4Nlvfh3eBKJM
         qKkspy2AY8DBxFE/LDfqqfB8VB7bxc6nMRA3j7lRYszKb0f9IhW7OnBXUc96BHuRyPlu
         Zy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778646; x=1774383446;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvhvaggR3xBuBneqrzNZa/q8kTsAXME3AY8AiUv2AIM=;
        b=kLwAu0O0ha0h7XLMQVess5QHrfbwJ/FruyaAp6N8ahrr33Z4mTDnEgh4f6sDyPlko4
         /5YHrDoCjrgIPbzFSB9p8A9tSoDX8n7sc8vx0xmflqjn0Bn/QEKH100apbrIqHeNAGQ7
         ZiR1tsCayO4QMnwDZ6mwsrutsLCcDzz1ArAaVw54FGFZIX4I8WDBQvHXIK3Io/81qmg9
         ZNMXcVySwtq44vYw4qb18Kq7wv7xdSTzQu8iRO4Hg5NlZW9dwkJpsAzgTiTQoPj2ZsDr
         dNDtbIJWE7QMzgqY6g9ubUWhxR3HKpNF3XSyMBi31IHL45RurAmJt2bPTcEqq/keigBU
         kopw==
X-Forwarded-Encrypted: i=1; AJvYcCXCFLIFIWJvnCeRkXxA7VVwjMlOrfh7SLyavf0MqNaOY1KHSE+g2GxQzCaOrqeHXcuQjMMqnQh4GtAfvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrwzXfdInu3OUhnzvwlAB1MLv6+2oKQtZm9ooErxfSmHiBxiv
	xBVmX7yawsvpRIlpSpIhOXXKBb/mrh2IXTeGy6A8jy45uK7kP1AEhT7OTaRzkZVctii5IEBxrrM
	r8xe6FN89MWQTO4Fd7vZhKflfC7DgBvdFQX7/u5C6p8sxN/yrnKtZzDfVFQBuVdnHBQ==
X-Gm-Gg: ATEYQzzh6777zhM8uaVef+0yPKyCObj8E+h0jqcg2kKZZ0/9QjnULY3txvNCZD/kprp
	G0ELw/CtivJG/BrHTokATIIadefIoZhz9ydUH/2o3WohBnw9SgKcLMIfnQ8XxKQzOZAjq+rs7Fg
	TflHeL57fXs11hOmcXmr7k37RhAKsNFGRYYf6YL7FffHmeqryumQmLqhyfGq41/gy6Y/FL6R9oL
	330Qy7ZDZrSKjMpomNzP/bixy2rfCO5WqoVvFBq1I0X2WaC+V6wpOC3TTPRGmX7IAZ0u5QmcXSg
	FpZ/ZJj+U4q2i/Ac5JsltKyfEZNJ4aCYLII3FsmxGv1SLugtdwPhXWhgDX3II7rTfwej2zmDpDB
	LYaKRQLkHphGuBSXlJunrSV14jw6mk7VS8QM/BFqaSWdKDZay3Nm3DSoV55jmZtf4tZ4DrI3lap
	Vl00xP3P/rssYAW01/LHt9b/kLaEV680l1BNqv0sKaCk117e62GOIHi2ZoVh5UZ0XhWKHq2vxpw
	sONuPTksMQCusET
X-Received: by 2002:a05:620a:4045:b0:8c6:f414:3ba8 with SMTP id af79cd13be357-8cfad341877mr128720685a.49.1773778645983;
        Tue, 17 Mar 2026 13:17:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4045:b0:8c6:f414:3ba8 with SMTP id af79cd13be357-8cfad341877mr128715885a.49.1773778645342;
        Tue, 17 Mar 2026 13:17:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb986esm440356a12.17.2026.03.17.13.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:17:23 -0700 (PDT)
Message-ID: <8b849d79-0248-471d-beed-b774b6cf218b@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 21:17:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
 <CAEth8oHPaWg9U5GWSeF4R5FmKfgxdxE3jfPut8egP=8c5oxHJw@mail.gmail.com>
 <abmVMOR9MMpTtj98@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <abmVMOR9MMpTtj98@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69b9b6d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=9AaU9RWykodHtLtZMSsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3OSBTYWx0ZWRfX0KMRza4oNoJ2
 hK1l5yK+3hZFJrXfrhYiAdja/B10xbetpbElt+ORwqOnizOF0D+TxkTmGtMuxwgiS0EYjag6KJR
 cgYUEL8JibPcHG4iUXkLFizH8wZtWJu1rMX1UssTWcKfjWxXG5jGvtKOA4KsuABOiZ/RZD5FX0Q
 AJ+2nFIXhKvzJe54MBNOtZGGgnDrUmi5AzcheHgUAP76zAU3snywYqAlfIDM2buf2pMuZAWJZmN
 ANlgCvnwgrCwDEreCoHvBJqme2AYicbZ7PioKdi1N+h/Odw0wN7kyh+S4RzNm4OKLmZySCqbcoU
 e3ThZ1tJKRmHT5jADXNgTJzGTzc28AG/cIbecPxgNWQxlpeBlVLEs3b2nZPgNJQgxJpHwageryn
 2tih/wp2y60cIelBww8c051pYPrFGrJ5ihJRuomhKwzYUqt9Qqrl8rMNXr6WCw88BMNQODLzwqR
 v7BetRqnX3Sa3aOE6SQ==
X-Proofpoint-GUID: lUq_ezFiM7wR68JpZMtXVKB8QvJGf6mT
X-Proofpoint-ORIG-GUID: lUq_ezFiM7wR68JpZMtXVKB8QvJGf6mT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170179
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-56121-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 660DF2B2303
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 17-Mar-26 18:53, Sakari Ailus wrote:

...

>>>> +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3_data *sensor)
>>>> +{
>>>> +     struct v4l2_subdev_state *active_state =
>>>> +             v4l2_subdev_get_locked_active_state(&sensor->sd);
>>>> +
>>>> +     return v4l2_subdev_state_get_format(active_state, 0);
>>>> +}
>>>> +
>>>> +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sensor)
>>>> +{
>>>> +     struct v4l2_subdev_state *active_state =
>>>> +             v4l2_subdev_get_locked_active_state(&sensor->sd);
>>>> +
>>>> +     return v4l2_subdev_state_get_crop(active_state, 0);
>>>
>>> Please avoid adding such helpers.
>> As Hans mentioned, we can put active format and crop in the t4ka3_data
>> or keep the helpers.
> 
> What prevents you doing:
> 
> 	struct v4l2_subdev_state *active_state =
> 		v4l2_subdev_get_locked_active_state(&sensor->sd);
> 	struct v4l2_rect *r = v4l2_subdev_state_get_crop(active_state, 0);
> 
> in the code? In a lot of the cases you could simply pass the state to the
> function using it as the caller already has it.

Ok, I've done a quick audit of the code and it indeed seems that
in some cases, especially in t4ka3_set_pad_format() these helpers
are used unnecessary (and even buggy in case of the crop in
t4ka3_set_pad_format()).

So I agree it is probably better to avoid these and in functions
where we have a sd_state pass the result of:

v4l2_subdev_state_get_format(sd_state, [0|sel->pad])

and:

v4l2_subdev_state_get_crop(sd_state, [0|sel->pad])

to helpers which currently rely on t4ka3_get_active_[format|crop]()
such as t4ka3_calc_mode().

E.g. all callers of t4ka3_calc_mode() already get sd_state passed
in; and both callers also already both should get crop and fmt
from the sd_state (t4ka3_set_pad_format() wrongly uses the
functions to get the active fmt/crop for this).

So we can simply pass the already retrieved fmt + crop
into t4ka3_calc_mode().

As for other calles of t4ka3_get_active_[format|crop]() if
they really do not have sd_state access then lets just
write out the code as suggested by Sakari.

Kate, let me know if you need any help with this.

Regards,

Hans




