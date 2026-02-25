Return-Path: <linux-media+bounces-53346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBHNKKcFn2mZYgQAu9opvQ
	(envelope-from <linux-media+bounces-53346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:22:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C106198A41
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47CA0307B566
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A903D349A;
	Wed, 25 Feb 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCLZuHlf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY7oHhmE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015C3D3322
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029229; cv=none; b=c67fPuNDp9srPTftC5XutLrzHGDhmGF1iaPtFnEW7BUE+Ci9FAk0uyBhYIlqy8TRt43JWLclmavaIWTBIK9qHLmfLJtzfLUY/AQd8Bs/EIgbGT6UfN9XRz5OTHmCPi1o9m2whMSwULVTeils633Fczmj31shZyBV4bGhzZNWscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029229; c=relaxed/simple;
	bh=HoX+77Ou1KVRWuj52NLOpoMqo5t3Lt0ZrveaYtMn2MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqGYWFMP9KU0fcnYwnk4Mz72Js4PLFR6S01ciUVnyHH4zJwplGbMChn1+R6KbFS9rfMag+AZ4fFp43p0YYfFHouqwlYqIYJXuYrlxMx1nlSBjGHZAsTIcU1yEGLGRz16Km1nqO67414Guu2V+p1x2/bbVZ+NM0nULownFhsrF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCLZuHlf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY7oHhmE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3qaf1512951
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=; b=lCLZuHlf8TyAjJm3
	u3rme9fFAEMEi7u536FDPUL5nlAy5jiQp4VpF1GwY2/RJhELgyk1DwwPJRciUo9f
	G6UtslgOw5RylV8+vIzZxzMkscSgIcWthwhfKep4VCv3qiZH2jlFNOMtWoa46lcX
	6KcSkfDa2N+ZoxRrbkVfKOoXzCQaocEd0HhJDFA+sXLsHChPj9nrDPFepT1nqWVI
	IZ36rErEHBHfnY7GWhBi1tYt4FOiBTs7/fvZPcQLxGXvO1vVknuj6NlwUVlasWB5
	3wFujOQ6K2RIpoDNlYCvW7z0Q1Es0jss86QZ/6e/PluRBy/m1UvZ3r/40OqsZ3/M
	2XHL/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf0g31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad3f8367bso78478315ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029226; x=1772634026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
        b=kY7oHhmEVfNKnl2Ets9P9vugOZO24QTV9ZW+gUYqGvz9rPMJQYeTDaPW8gCyQhT5oX
         kM1eciXC55RcKkfrgz5j0X8PcKzDzlc0EiV4xc21488ryLkx0xZ5sYyfN43v6Tu531Yq
         wRmK3xov5ROrDgaFVlnmGeURzJKgjSuv9/ghY6/s9/3xeTHecSGoyUnhaZ8KdC1QSJUS
         huraSwqyLHE18EPjXfzAm4JMJqYA6GOe6qd37ja9GtijGvwyuHQ4RFl2dCxh8DSLEXOR
         P8Tgv2BreMhHnnXG1KBNcvn0eUBntXMwkuRoFhT2znJ+8GczSN2UDjpoAMKH8ZRmhkbN
         vCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029226; x=1772634026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
        b=ENsaxIifl2EIuumrzfZCxq+HgUse6DdOGRfhd5mWOWotybVG0sT/JLIHj8cCBSn73G
         KiE0HXrL2rwu5CU+4mdl5Dstyzb8HGUcQsgUIDYmKNx0il3s7tT1/ZuRquV8DJa+UJgg
         xdixtc+1088uEYdOKUkLU+oghXCPK/mCGvuyLKS7A0DCwgMZxrNaUJcV8pkhxbqs8QSp
         lZoY8h1CORWvUdh8OL59IQZ35Q/f6nhLarAYuyPB5b5LvSRqdVQk+mlFmr3eZEL0B7TN
         pXW+VIxcGTZVJ5gbTPq03HijiakZGd49SKMZuPRQjbdD/M4E9ZCKvEHasCOwGR7GV3Jv
         NeCg==
X-Forwarded-Encrypted: i=1; AJvYcCWu36i4uhy0hEc1a1vxBo69ksGPlbw0vNh1IiNgOubYA/dvkGTZY8RX91CU6TP11mdqo5Gei/R1r0kd6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+UUyO2L02M9fSyr5t849h+/LbDHg5fMDMX6IExrwmAcL/webt
	zZObTtupCer8gWkg01a8wJWGZV37853Ribt6ZgNyEYaKHPM059KETmQsK7W5rbZAr1MyqoNN1If
	YmVbF+3ctF8xzDNxmeXYIuaQC2lVS1emHWgGNN2Dvb1ilBfCPA4+bqci+cS+McaJoLA==
X-Gm-Gg: ATEYQzzLBFGY8sQHYDuSXRUUl1wuisitJyrtuDa0ovF4QRxL+gB2NIlG7RSla789F0e
	Lnhyenrs4/7bNUVWtwZlb57Fh34hyAijWesfaxXv+qNHyfz3Vgh8gSbhQgiTVaLky0baeQc8RSm
	amjDJsfULwY0pfjuqmKSJGEdiJMy1n4SSSwwK3UrKV05RAv7hzRu0rG6mZVbjpgTD+GN0JA8TuD
	XWrfhlNAZfdYFsHo4771obJLR5R3J+5pp8UH761LgQ6yZiX45LDZv+0TZ78xAHsIxP8heXkr5Pr
	+Hq0I2NqOdsGHg2fltOY2Z6Sni64crD4XcCMyhUOJ2V780OTmik0nb0JylLkjy9sO5MFduQ6foM
	8qW1FZwimB9O/7qFm9i9IKuJg+Gm0uE5ZJQYkxGtm6PwCq61+bYM=
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ade9aa21a7mr3608395ad.51.1772029226461;
        Wed, 25 Feb 2026 06:20:26 -0800 (PST)
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ade9aa21a7mr3608015ad.51.1772029225935;
        Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e55dsm142051345ad.30.2026.02.25.06.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Message-ID: <b6519bfc-7931-4985-aaf1-1aaf1fe5aa88@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:50:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
To: Bjorn Andersson <andersson@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
 <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n4kcJ8eQwx-WGRd2AyqhAF5MWBmIVRIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNyBTYWx0ZWRfX1akwjq7Qugjb
 oSY0FwLhQ/+bm2/duNfBqeBJAbyWqpFNPxMPYyriNxE2DAtGtPF6269jq1NSQFZshICAL1nVtJo
 pJGcE7ICWGm0mkUbXW5YH2nXL9rdS593SvgGLPkOpmq7cUNycCotx46/Iw0thdOHzy62IeUdheX
 43s3RmuA3NwrgSVFaIKslopbBxl03EQzCVKI6JFyKieRrFoqsf6TEyyRWHCYUxXceOC4AW+aWcd
 9V1GNoPioqKpCoXyJ6I360K7FGB4pnzzG68kk9no6hcfi3XYALi/tdM/LlVuGYsFiiE3HMFcyxJ
 1xvLpjLUg+76d9x3/2XvRpAePk5pgcRP+zIqcf62fx7Uu+ROmhMflF2sR/61/yX4Hfc2pZsF9xG
 9vDZgx8fSP5VDKZi4duerzwAmL5ILUlHEn/ZO6Cfu1Bxv7aherh1gbpNd9f8a1FzBZghYQGhin7
 D+H79ndTzUw0U9oLS3g==
X-Proofpoint-GUID: n4kcJ8eQwx-WGRd2AyqhAF5MWBmIVRIM
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699f052b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=tV0izz4fD985yFSgC6wA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53346-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C106198A41
X-Rspamd-Action: no action



On 2/24/2026 3:22 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:38:56AM +0530, Ekansh Gupta wrote:
> [..]
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> new file mode 100644
>> index 000000000000..18b0d3fb1598
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +
>> +static int __init qda_core_init(void)
>> +{
>> +	pr_info("QDA: driver initialization complete\n");
> This print is useless as soon as you make the driver do anything, please
> don't include developmental debug logs.
>
>
> In fact, this patch doesn't actually do anything, please squash things a
> bit to give it some meat.
>
> Regards,
> Bjorn
Ack, will squash the next commit with this one.
>
>> +	return 0;
>> +}
>> +
>> +static void __exit qda_core_exit(void)
>> +{
>> +	pr_info("QDA: driver exit complete\n");
>> +}
>> +
>> +module_init(qda_core_init);
>> +module_exit(qda_core_exit);
>> +
>> +MODULE_AUTHOR("Qualcomm AI Infra Team");
>> +MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
>>


