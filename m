Return-Path: <linux-media+bounces-52602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGeAG652jGk6ogAAu9opvQ
	(envelope-from <linux-media+bounces-52602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 13:31:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E09291243C6
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 13:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D3793014115
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE82155757;
	Wed, 11 Feb 2026 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKt10MGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVwdFmy6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D695883F
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813084; cv=none; b=ZDOQHF6nX29PV1lN7r9ljRH3ABAHFjm5Fhx3DanJ8K3gSc2OJ4XtisgyvNUaBL+FN+c1/Yf4bWL2qFyc4wlB8w+XgQ0Y/F8M1mAubbvth/wRTdZ6g5QdUYFB6OEtFw8pup+DUK6ySQBP1keL6MQ1VlM14dAVQ0t85hATzzlmKmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813084; c=relaxed/simple;
	bh=rtTI3U1uKhplVdY0K62ki4RZ4vdy9KQD0GTm8yMp7Lg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LyWr3V+0j8s9PdcDuzrWtwAekx5NH2PSCnzHSZFOCdtj/Cf6bIRvUgU+NkacFnYa2JJwLygaIezXKGeMRK//t9pOYHuai7hlKZzfHOgUTPLlg8ZxuEgJG0WKa7C8PQyYnrp9xbkCkWMo+pBcpw/6sUCK0AnEIteLU6jRlwXVjKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKt10MGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVwdFmy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B94Aim169274
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7pdHEvUCQ6XNAHV+59wfpRIZXDYk1ukxnvRIKuO1Ug=; b=bKt10MGjX4+kUzG/
	M09O9FJ97LLUSiysPeM2NwtO9vzRxTbeXxFHfvojQ6G5OJArDJeMKybP0EHBPASr
	OFf43zn6AzWP1xC4ErZQCCY4B6apd/Weog656nM46/NFmDCl3ausVeDCtfOmj3vz
	8cyvRdTq169kDL8gyYermeK7QC1O2bGDC5ylEhuOxRdLAe8oy9cOWj3j+jkN+loV
	WsiviUendjc/hzbaoW0Ug/f0exAClCt2q2GwuwxFEf2UGBNb4+q6e2HRudFf6DHI
	41HgzXhBX0XqXbWDOSEDCXf1zRCw3ek29a/cttG5MHHiM7O/hgZGor3evkJ5I3PX
	Wz0+1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8f87a1su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 12:31:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b6a5821so1586413885a.0
        for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 04:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770813081; x=1771417881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m7pdHEvUCQ6XNAHV+59wfpRIZXDYk1ukxnvRIKuO1Ug=;
        b=gVwdFmy6GGlgnMndoVBiWIv9tYqJ+ffrxD4qTTJgWfPsEwqoG4o/h9n1JEqVzqCu31
         q+Na9laDOJBdrM792+4b4RkyxTOCN555kzjglWNBA4TVxONN+UlHx1bHQy2iG1TUn2s5
         uT/9Kt+3T2eJRC/uQKMBnKmcKllOP9ZZt2Nidd9IKZI/2KiclneM3E81YtDOz3BoyExp
         0QI3S4CA5yvBLbAekE23yc4q/drxHOFsjHICRkiX166Xc6G1e0oe/ywxHbPbE8pn3+F1
         JFBpYPXZskv+zSGhfHyu8puJIA9kHf0Q65j0fqiL9V5FzwO32ip1ObW0p8h985tHW4Ez
         3OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770813081; x=1771417881;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7pdHEvUCQ6XNAHV+59wfpRIZXDYk1ukxnvRIKuO1Ug=;
        b=bv3V+M0mofHVr4FOTZoF6jo7UamzA7UiPdq3Fu5mniihF7xDXNeQH8QuhAA3QJ8RYV
         IxiDFG23GY5u7eQTPUur8MyA9W0EwiAMnD2njiXMV5h7NWEIfxbhCm9H6EQGgHfrviyU
         in3VaHtu3b0Z8dTCKEjgw5E893cbg8R6t9oaTeGXdTkYIH9YjXy1y8UlPAMDUC6aU8YT
         u/jGb8d8llkbz1lkpS+TM0pcVf2tfez7bETenN9VJD1Mjz3sR9dO1wt8Ry8JdeBio+1m
         y4dWJ5io0MYwplY4hlOyJH8xsd78pE4ioxFY96DM3diNX8uJYG025CbYuZrrC+g/Jo2E
         ejig==
X-Forwarded-Encrypted: i=1; AJvYcCULahzbg9a5rTYEimahRACTQq9y3EOPgF/LDTPjkB6zfZ9qiUlZOI4Lf4hz4XxOQVPdwAm7Jta1Wpvo/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvc4Ar+oAYb41x0jctFJmhxD/v6/Yrnhwhlh0zzC+pfIh51Tg/
	F0M/OuHCZNZEH8mGhGr0JJ1fGqZi43HLDsagZduMcrjQVT5dGSbc9nK59ibrMEhSwfPfTMiAe4A
	04v4W//9eP8mNq5TlrR+s87NIPYL5HiuM+SB8zmsMVajKfzrnYnyD6JecfeqXuDQWUA==
X-Gm-Gg: AZuq6aJatTVbF1OiAeW6HAk/q0cANhvSqKJ+cgu0j+8ng/sgh3BvE4DhrnK251OdXDN
	M2LeAQijKFOg51DAIQ5aoqDaTCVInuXK4QgT8Vxf96dRyywXqE4u3T/7JO3+Kfg9TneY6MRamFC
	B5VLkKTPhlA9Lz1/knKZi/Gla5l5v8tvpdMLVzRdHWiwnujmpi6zlJMcK9dS42Tvb9VSxj9eZUb
	F6HQF3UOZLW5b14C65Wh5kK2Gaeu7cmQmsuqXA6t9RBjejf9utGMFk0nYa68C6e0Yr4xg8WFCV8
	Fqf6HPDWUrQxAhc/L28tFZ2acSyHAxYsofNJaMkVhFYrUHPfETfvxBeTtjkpYR9OWG8jnQkK41M
	YPsdE/fruWwmbMymOmNpRA6XaneX1aJFkWOdpHLtlIh2VD/RORhmdq+g9ukmESu0LX2bVIGL9FO
	YhP3pUVUzeaf+9feaM6WhFgvC46mh7uFYbzCBEDMGtr4ILBNvNoIcrKtceE97K52Osj9muZqY4e
	fuBsX+JNGH+Ayq+
X-Received: by 2002:a05:620a:d96:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb2ad1a73dmr171488385a.72.1770813081037;
        Wed, 11 Feb 2026 04:31:21 -0800 (PST)
X-Received: by 2002:a05:620a:d96:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb2ad1a73dmr171484185a.72.1770813080420;
        Wed, 11 Feb 2026 04:31:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ecadbdasm54261566b.62.2026.02.11.04.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 04:31:19 -0800 (PST)
Message-ID: <83b1b61c-828c-43eb-b297-8e4d8dc014be@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 13:31:19 +0100
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
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, soufianeda@tutanota.com,
        linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
        linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
 <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
 <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
 <aYxuCyTizpKM4Ul1@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aYxuCyTizpKM4Ul1@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KpNAGGWN c=1 sm=1 tr=0 ts=698c769a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_uN7KCINyXfYSksNRHIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5NiBTYWx0ZWRfX9ub3L8tL3Iwd
 dEBlAyJhEOkr6khMmwSluB1UHwQYhdE2AfWBoVO3SROhnsdvI42Qf3pAlb6ex0Cn6EpQz1qxvUR
 mZzt8JGbWLDwNCir3Bl2x1gsG/R4DM44lTOVVbErOcMCrXzI6CJxxadTFke2/QNUAY5sJ6nax/d
 ecory0D6G9fElY4ZmmkGl/oHo/MlXRXIX2qSEiOBKM8pzozOyyo/YEM+BQT7hyZQPiqiek+YyLp
 NaNwC5bQQHzDAHZN5n6wWHO5OIzh0oWmuAFdHzcm3lNX91WkIOZ9hddCUDWHNcM3Pg+/R/qDZUx
 +8SfqKb8A5V7VwIyyb6zxr0t03cnXPwLegxkqX+3KKkjZkYL1IgGrBZqxQsQ5eU4K66YhQQngGq
 qQhfCDz2lb/Z7EyK0vBuajt5wWeNL4yij4ol9PvhuOOMWRk8O0ZlRJ1PsDumusmMwCWLY9zsHi0
 gIBL+dRpk509sYHF1yQ==
X-Proofpoint-GUID: VSFfDwAFtL-eEiYgLrgK076lqi8E1VpV
X-Proofpoint-ORIG-GUID: VSFfDwAFtL-eEiYgLrgK076lqi8E1VpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52602-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E09291243C6
X-Rspamd-Action: no action

Hi,

On 11-Feb-26 12:54, Sakari Ailus wrote:
> Hi Hans, Andy,
> 
> On Wed, Feb 11, 2026 at 12:50:18PM +0100, johannes.goede@oss.qualcomm.com wrote:
>> Hi,
>>
>> On 11-Feb-26 12:39, Andy Shevchenko wrote:
>>> On Wed, Feb 11, 2026 at 12:28:35PM +0100, johannes.goede@oss.qualcomm.com wrote:
>>>> On 11-Feb-26 09:11, Sakari Ailus wrote:
>>>
>>> ...
>>>
>>>> This will cause a bunch of code to turn into dead code, but I would
>>>> like to keep that code around since when we add support for
>>>> a parameter buffer queue that code can serve as an example how to send
>>>> parameters to the ISP.
>>>
>>> But it's forever in the Git index, we can remove it, so it's just matter
>>> of convenience to keep it in a working copy (tree). That being said,
>>> I would rather drop the dead code to avoid a stream of not-so-useful
>>> white space, style, and similar cleanups.
>>
>> That is a good point, dropping some of the dead-code stemming
>> from this is fine with me.
>>
>> We should probably stop pruning dead code when we get
>> deep into the helpers to pack things into fw specific
>> formats.
> 
> Either works for me, however the actual IOCTL handling related code
> contains less redundancy than the rest of the driver. When it comes to this
> patch, I'd keep the changes small allow easy backporting.

Ack, as said we can start with a patch just dropping the
default ioctl handler. That should be easy to backport.

Removing some of the then unused functions can be done as
followup patches.

Regards,

Hans





