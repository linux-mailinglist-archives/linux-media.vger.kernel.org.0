Return-Path: <linux-media+bounces-64122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0IcVNFFWJmo/VAIAu9opvQ
	(envelope-from <linux-media+bounces-64122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:42:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D9652E2C
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:42:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZxzxeYjj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ieJhOycu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64122-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64122-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BD013048147
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8C637AA92;
	Mon,  8 Jun 2026 05:39:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E84378833
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:39:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897156; cv=none; b=BnbUjx5oxaj92igrPj9ZwxziGe6Jyh4ka9wOHZ/L7dQNwlyWxiV14VIU8HTFTyX7VnlqjkTK/RM/xO/zwPYS40vQDwBD/GNL7UTgHmreV0tbXbMRrHWuElew/sExMpa3gv5P3R9IrhWZKeEiUS6ima9fY5BGcHX/cNwny7Gzd50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897156; c=relaxed/simple;
	bh=wpIsrxhUyQoC4+CGVf/W5f5I3tcpKncIP3Or0kbvFm4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ILJ0dxvTfYqgwM0nVGHC91f9jeWbUJDk842++m1VZaoXIcLFBeKxQYRsa4SyIekqbuTJAgZB9TEvDpwHMR0zG8/hKFEaNn3AceTvarRkenSN2x3ne4hBh2BOjGAvjCPu4b/tDDA8O8KfYnrS7bd49FjS/ipYV1219y/u7PIRErw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxzxeYjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieJhOycu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580E5st1572061
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MkLuA4o+7nSfPg9jniXvvAefJwBX26Jgt8Uank5Noo=; b=ZxzxeYjjlawIcmQr
	HHKcLE7cWFJaDCDhenm3kxmY0d5mWNyCs0mon3B5nQn37vTspP4CzayBSOAYxGnC
	tT/aUCtV9EQ1Ytt8HTi07jqQ5brrArYS4J0i5/3uW9oYfx0ry8T9l5g1iOsIQBLs
	Tr3ULhRu3vMg8jMcqm+GMSt95+DAel2TXyVtpoDi/nwHyxfS3lCPiQycs5yIO/+g
	i9nHQERh/Epi3dLf/wfbrZPyqKW44lBmJvIEzeELAgpZmjAdwy8Xy0qNL5zcFpiK
	fwxoaUE8gjnhzxTrQG3pSl/TM6bX/JvKMWlJ/duE6JcXhQjglJOW5zP31DzLUiCW
	fBNhjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8wrtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:39:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so4037197a91.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897153; x=1781501953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6MkLuA4o+7nSfPg9jniXvvAefJwBX26Jgt8Uank5Noo=;
        b=ieJhOycuaC0f8rS3qkWt4p0SB7lR2ISjSIFDChUihNFfA2JCNZpqvjVutP0de9N/Xz
         x/zTLDWOSrZs3WuqpbW4yLZd03W2bj5dtK/qeE5NogC8/HijvIgMOPe6VgDRy3hFhVJ8
         wVnckRGCq2QgAg5eqmy5pWZQ4D2hIGJzqdUaHbCZGMm866353mI7A627reygDQnq82Gk
         uKXOqnILSArbKyoPpicSX7h2Kqdak60cuoafIn6muT52Kdr+mhhPoEuVHyipSCMbYivd
         S1ph/qUgCXsRz1Dwn0LfNqepP76/z+E3zkdCdPyRJwgrUY3aFrp0vqNrQMyA9agVj/Rr
         i2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897153; x=1781501953;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MkLuA4o+7nSfPg9jniXvvAefJwBX26Jgt8Uank5Noo=;
        b=irHq6+e/0NJrjo1PpwEC9rKv8N3Czw0bhlUGGpMSsSuVYvvWGft5C+bYF9n5ozLjzL
         K6vECda/IZODtZMWCmXPk2J0rJrnjdpESHkXNwRy6JxfpxhrveG5gQWDv1C9WDC5eLjE
         nHYGWSW58CAJZAoEBuHnoxQW8FrKFaYUxQksjLTFomk5kw8MkhPXltfUlGY2c5u7TRqB
         NKKrjxpJyoToK8RTgRnOvsLBRqmslNrQX0h9NhVV5BvuLFEKYJEdp4gO+jUurFW1br4E
         JgAxhD6/Nlrty9nFJHhDjCO5NY64Si8l7QlAp6tasQZFS0tICJD7YPqssN2stXyw2qyW
         VRwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/2a2i3/PcI78pRZQi7CpmTczOXQrvZ++o7/iRQ0C8I0TssQUL/pt3NhqttOaFd7bOgYisdVW4KI5zPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqUwhZkMRY64nH6IBTsFStZ2jKCEOvUMI1GARWpmdeWmr1/V0P
	Y+FhiPAeQjO9RtbxO2jUlUZRJnzQ2UUZC8xCzeNs9w+FvBQjygDpqNs3Y14y29RpkYQF16nTsGd
	zCI3YveIlc9SQwHq8MgOTB6+JOrYj+JyvuOmIjCfNE5PUDmNvWXzyWhw4ctBamPE4Pg==
X-Gm-Gg: Acq92OHiwLfCRSsot66saHUMda3anxLVnD0+/0/iB/A2zCwDOA3QfWj6f57l5T4CSEN
	UOFIsDMIk3zUIWEJkFZ9VMuEDx4bR9vY4q5crCDI50T+YYSnKCB/yXihzAeo3bS5OwCtXB2zVba
	BJ6kLE0CTNKmXE0SymZrhW9QUF2IQcdIHJbpErgcebWkLZ0rWZKKNxdb2KgFD0B0XpuSBfle5z+
	ccZSCDDONbTFtGRlWcWkYjZ76P++HmdLY5yhMGT2x4oUO4ZuPMBiLfYyR+d8uqvX+TiEvP+Awvo
	JAIZ+WjcQ9MZnxqICjPLZIqizL2OF+uDnKfIpwX+zTS7tfRgvDMtOqnCJI10M9xYVM9rQs3p8rq
	0KukGlOkuPTIYDefpCz/1uMnf8khPft/Hn6kn+xH/96SreoRIhyseyYI3MYkNr4eE
X-Received: by 2002:a17:90b:2e45:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-370ef3e8fe0mr14000939a91.10.1780897153040;
        Sun, 07 Jun 2026 22:39:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-370ef3e8fe0mr14000909a91.10.1780897152456;
        Sun, 07 Jun 2026 22:39:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm173272535ad.29.2026.06.07.22.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:39:12 -0700 (PDT)
Message-ID: <dd14291d-a658-7209-471a-ff5f021fd1b3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:09:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, robh@kernel.org
References: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
 <20260603143718.A65981F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143718.A65981F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VVusswe_J3hCjADYPp3mBq1bv99SiDy3
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a265581 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ltST-9eG5Q1Uj6kUb4QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfXzBfyBk/KffPu
 y68xHI45gSw2ewb9QyNED5L8QBweKY0mvSJVUI1u6njhyPhIWEcUNiMnV9WzNgNr40Fe24z7VEI
 FlX7AUe1LuyqxnFkuYGQKD3/AuBGaNE98fkkNO7m5/CKDTHQ2TUKkVepLCkcdUA0dmBtgxeFX6L
 9y86FAX1jd5FAuIkRF+t3eyyGBLq+60B7OzxtZBeEDEkpygt1WHfhBlIlv8JgbA6+fwziVK/lSi
 BUJjnvMzGeLj2WD4OvT/d/f45YCsEt6kEv5nI067WfjWKAkQYwFABMQM59noxx14pdcaPPHid9X
 jotl4w9dQqN9ct4ycBk1qmtPGW4eLdrGBbBBfzLczELKmF48XUVib7Vf8Ci3FsWYf99TCwJkbAG
 dFKL0zY2yJ3j8VjdvC/9HnYdrkK/t/uI4dcx9u9UciD1ubtY3OlqYdEwvBDowvOX0ODx0JoEFd5
 RyOyjTWh4tra7274gMA==
X-Proofpoint-GUID: VVusswe_J3hCjADYPp3mBq1bv99SiDy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64122-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F2D9652E2C


On 6/3/2026 8:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
>
> New issues:
> - [High] Uninitialized stack pointer dereference when a hardware block has 0 power domains.
> - [High] Secondary hardware cores are left unpowered due to missing iteration over `num_cores`.
> - [High] NULL pointer dereference when optional hardware blocks are enabled in hardware but missing from platform data.
> - [High] Premature OPP voltage drop causes DVFS sequence violation.
> - [High] Uninitialized fields in `struct dev_pm_domain_attach_data` result in arbitrary behavior.
> - [Medium] API mismatch silently discards additional power domains if `pd_cnt > 1`.
>
> Pre-existing issues:
> - [High] Resource leak of Runtime PM usage counter and OPP rate on error path.
> --
>
> commit 569dbace99d0eb806398e44f1f3dd0f46e77e155
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Replace enum-indexed clock and power domain tables with per-block structures
>
> This patch replaces flat, enum-indexed tables for clocks and power domains with 
> per-hardware block structures in the iris driver. It groups devices, power 
> domains, and clocks together logically in the iris_power_domain struct, and 
> removes index lookups at runtime.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index c2dcb50a27824..681db1da9559a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -39,15 +39,32 @@ static int iris_init_icc(struct iris_core *core)
>>  	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
>>  }
>>  
>> -static int iris_init_power_domains(struct iris_core *core)
>> +static int iris_init_power_domains_per_block(struct iris_core *core,
>> +					     struct iris_power_domain *pd,
>> +					     const struct iris_power_domain_data *pd_data)
>>  {
>> +	struct dev_pm_domain_attach_data iris_pd_data;
> [Severity: High]
> Does this leave fields in iris_pd_data uninitialized? Since it's allocated on the
> stack without zero-initialization, any fields added to struct
> dev_pm_domain_attach_data (like link_flags) could contain stack garbage when
> passed to devm_pm_domain_attach_list().
>
>> +	struct dev_pm_domain_list *pmdomain_tbl;
>>  	int ret;
>>  
>> +	iris_pd_data.pd_names = pd_data->pd_names;
>> +	iris_pd_data.num_pd_names = pd_data->pd_cnt;
>> +	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
>> +
>> +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	pd->dev = pmdomain_tbl->pd_devs[0];
> [Severity: High]
> If pd_data->pd_cnt is 0, devm_pm_domain_attach_list() returns 0 but does not
> modify pmdomain_tbl. Does this result in an uninitialized pointer dereference
> when accessing pmdomain_tbl->pd_devs[0]?
>
> [Severity: Medium]
> Also, if the platform data specifies multiple power domains (pd_cnt > 1), does
> this logic silently discard all but the first power domain? Since
> PD_FLAG_NO_DEV_LINK is used, the driver has to power them on manually, which
> means secondary domains might never be powered on.
>
>> +
>> +	return 0;
>> +}
> [ ... ]
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> index 773f6548370a2..fdc6eb68e5c78 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> [ ... ]
>> @@ -70,7 +69,7 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
>>  	return dev_pm_opp_set_opp(dev, opp);
>>  }
>>  
>> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>> +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
>>  {
>>  	int ret;
>>  
>> @@ -78,66 +77,20 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = pm_runtime_get_sync(pd_dev);
>> +	ret = pm_runtime_get_sync(pd->dev);
>>  	if (ret < 0)
>>  		return ret;
>>  
> [Severity: High]
> This is a pre-existing issue, but does this error path permanently leak the
> runtime PM usage counter and leave the global core device forced to its highest
> performance state? If pm_runtime_get_sync() fails, there is no
> pm_runtime_put_noidle() or iris_opp_set_rate(core->dev, 0) called before
> returning.
>
>> -	return ret;
>> -}
>> -
>> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>> -{
>> -	int ret;
>> -
>> -	ret = iris_opp_set_rate(core->dev, 0);
>> +	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
>>  	if (ret)
>> -		return ret;
>> -
>> -	pm_runtime_put_sync(pd_dev);
>> -
>> -	return 0;
>> -}
>> +		pm_runtime_put_sync(pd->dev);
>>  
>> -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
>> -{
> [ ... ]
>> +	return ret;
>>  }
>>  
>> -int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
>> +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
>>  {
>> -	struct clk *clock;
>> -
>> -	clock = iris_get_clk_by_type(core, clk_type);
>> -	if (!clock)
>> -		return -EINVAL;
>> -
>> -	clk_disable_unprepare(clock);
>> -
>> -	return 0;
>> +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
>> +	iris_opp_set_rate(core->dev, 0);
>> +	pm_runtime_put_sync(pd->dev);
>>  }
> [Severity: High]
> Could dropping the OPP rate to 0 inside a block-specific helper cause issues?
> If multiple blocks are being torn down (for example, in
> iris_vpu4x_power_off_hardware() which shuts down VPP1, VPP0, then VCODEC), this
> would instantly drop the global controller OPP to 0 when the first block is
> disabled, while other blocks' clocks are still running. Does this violate DVFS
> constraints?
>
> [ ... ]
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> index 02e100a4045fc..0feb5eaa544f9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> [ ... ]
>> @@ -158,116 +136,43 @@ static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>  }
>>  
>> -static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_value)
>> -{
> [ ... ]
>> -}
>> -
>>  static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>>  {
>>  	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>>  	int ret;
>>  
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> +	ret = iris_enable_power_domain_and_clocks(core, core->vcodec);
>>  	if (ret)
>>  		return ret;
>>  
>>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
>> -		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
>> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
>> +		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp0);
> [Severity: High]
> If the hardware efuse indicates VPP0 is present, but the platform data omits
> vcodec_vpp0_data, core->vcodec_vpp0 will not be allocated during probe. Does
> this result in a NULL pointer dereference here since
> iris_enable_power_domain_and_clocks() accesses pd->dev?
>
>>  		if (ret)
>>  			goto disable_hw_power_domain;
>>  	}
>>  
> [ ... ]
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 23a7ce3ecb2d0..f35754ef53ed1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> [ ... ]
>>  int iris_vpu_power_on_hw(struct iris_core *core)
>>  {
>> -	int ret;
>> -
>> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>> -	if (ret)
>> -		goto err_disable_power;
>> -
>> -	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
>> -	if (ret && ret != -ENOENT)
>> -		goto err_disable_hw_clock;
>> -
>> -	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
>> -	if (ret && ret != -ENOENT)
>> -		goto err_disable_hw_ahb_clock;
>> -
>> -	return 0;
>> -
>> -err_disable_hw_ahb_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>> -err_disable_hw_clock:
>> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>> -err_disable_power:
>> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> -
>> -	return ret;
>> +	return iris_enable_power_domain_and_clocks(core, core->vcodec);
>>  }
> [Severity: High]
> Does this fail to power on any secondary hardware cores? The probe function
> dynamically allocates core->vcodec as an array based on num_cores, but this only
> passes the pointer to the first element to
> iris_enable_power_domain_and_clocks(), without iterating over the remaining
> cores.

These functions will be applicable only for single core platforms.

>>  
>>  int iris_vpu_set_hwmode(struct iris_core *core)
>>  {
>> -	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>> +	return dev_pm_genpd_set_hwmode(core->vcodec->dev, true);
>>  }

