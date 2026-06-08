Return-Path: <linux-media+bounces-64120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bd/GF/NVJmomVAIAu9opvQ
	(envelope-from <linux-media+bounces-64120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:41:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A771C652DF7
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:41:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pku7S1tl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fFvtimJ7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64120-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64120-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434EE3039382
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63B5378D64;
	Mon,  8 Jun 2026 05:38:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE7236F8EF
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:38:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897130; cv=none; b=NZ75yakDu6KBerGTMTfZ9d8M7CWkDOcS8mmSwH+JEz1wk9ZC4MsmJJz00VLqslVDVzh48yns/sknpo0Pw99xJHPocUvev+PnYQkXdFmmcaLjgAisPZPmeJFxo07/jUORDtryxaMbmV5zCzd9BVqGsMpFHw/pAmIf2HMIi4LZBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897130; c=relaxed/simple;
	bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BWqY9TorgoRdyk47bKjbUuZuk8OLCAt/6IZHRrBAJygy+FQFSb0L5Q4u72TOVXesLrplpCtOJ9nppGDMrlpX0Wj4vPJQT4GI25wltUEXdkS2RXXqlcphmwEacaVnct0HiTfguGmkdX7GhPRkjCJWAGF8EdKKhWx+tGIROolaJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pku7S1tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFvtimJ7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Haiw1935496
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=; b=pku7S1tl0aKtOZLO
	sTCvvATJkYW0dP4lXtEBoX6RmnnJ2pq8944hkv5qfUua6izek2zHLLlfFspqm5c3
	GdaXiVGSkn4k/XoyX3hPj5ayrTxRxqd0tFWUsD/tWSvxhOz2PeyVttRHiC4pG3ab
	08sjmInFkmd0B1DNpaZuKanaGf7xw+b+XowmBlEICYAe/ET00LEKzcfMc/tf5EHm
	MNaT0N806pkw2Re/MrdAvlBiXRrVF1UA91k+hp14JBUCBO1IQBXDjOXEc8iaMHmG
	rWSmUxAO0NAdK0TZv+wrN17DHwgpdsL0GN5m5YWq8gCevZizLGJNS3pnKBcO9sro
	AIiJFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf64s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:38:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8425a9979e1so2654899b3a.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897127; x=1781501927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
        b=fFvtimJ73w28oQ8o3+yO3pDEcfYXueXc2cKmjwmOVzO4jYTAXmO0vStjldLxVoM+91
         Co2Q/EqvdvxCfEA4CNI3ZW0VAvE1kgoTitLg4xdcfYEi2MYTita/S+3Jjc42wnB21Sul
         Zv0UriW7Re9yNy69t0ussoaVH3J44f/fdd0dGy4Wpa6nP4WFK/Pz4OJ0GhB/TpHIF14h
         JTxoKVUJp5cRYtxY7wmA9/GuYzZ72UAZ61ehQfbbomomm22xJ1mr80j+UujK1iomV4yI
         DgKO9Ybc+DDq/P2XYQcnuXA/VnyxAgsTacC5kgVBLzzNdleYTvAG17HGQ9rRfSGa7qHS
         Oj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897127; x=1781501927;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
        b=A1mrt5J/+VS5ikkQHAtdU/IACtqTvCn6g0BtMoSFTml+K9ckwVFcF5oRpEmO7dnYXm
         u3C0cFpH+3mdDa0uHRdTfMasBNK2WYBAAdjJwVj6tMQewYadweeUwDC3zPk1xMV5rSAM
         Gt9i0pmWL+0Bs11m/i3rx73jkE8KQLtRF5u9snlFhPPs5nW9SSajY3M2GeS/RI4VzQEJ
         phOadsDUt7RmJPkW/rRfwJ7h9ACkQsSnbVFz8pK+E3oBTGxuy/jmJ34FMoSwYcW6jcN2
         ylu5zCiD5dL/KPh9UJeRHp8yl2L5Y7ZV0qT6brGdKIFGA31CwGeuXbISZt1CRsewF9uc
         3B3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6sxEnCnQffQIlwmR2xq4By6deN0hn/E8nA5leqj1FeHYWw4jFTcXMi1qttrH+CWAhQ7x3bQf02fI51Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcAJUe/YYtCsglgD0r7pFgg1cu6Ah3izP1rEt7vcWfGEwFMB0Y
	NET+jdLrVQZek0urds84fUPRsWvPRvweQDzjqKg5NsXFstheSFdi6wUTOI/MysWr6B5rTHG9yL5
	quJ1yUtpORhv1O4HPcAQISWrBrYs2H6TZJjER5PNXgZjSzwCPjiz3xx2UvwqC/QY1mQ==
X-Gm-Gg: Acq92OGBg+9OXJId4tbGO9dyzxbDX45UgeVWEWrClW4hPGU67neLyNJpCMxVUd1bPd0
	s9or2+ZTJnI3IGMY+zUs2ezs5/Ou3wOCM2pfHMHuyorSNOgDxk73fNuCLBeSulZHYeIP8HOUJeD
	j9kjFE+SOVXNr0RgRS3sJghRFSc7rJl1/2UoAG6Ms8OiHgfGnqQRCWvfhj6fyjeN/yckQaJCksY
	Soq9VeKwK17YPce6epMKWdPignyvfXtjMPHW32lIbySvvljDoVklvvA7yRjGJYMwnbeOrFSNWXu
	JsXmgfacrOyXHIvY4tf4KARzTvaxxDlCd0uxJtvv9QJHSGMHSBvrfOJmOAdc2DSLpPPX/JMLodr
	+zF6+Iot6gdqTlm2VQpLy3SwnNgHM9NV1Nubogpg+cers3H1cnKTwKydSPan5luUM
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr14472661b3a.4.1780897127156;
        Sun, 07 Jun 2026 22:38:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr14472632b3a.4.1780897126766;
        Sun, 07 Jun 2026 22:38:46 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm18557943b3a.2.2026.06.07.22.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:46 -0700 (PDT)
Message-ID: <d35a0160-c0a0-155c-8f0e-65b1b7eedf5b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
Content-Language: en-US
In-Reply-To: <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a265568 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=s3xQa8otug5672-2qowA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 1LaIfQo4e9QtorvH-Er9WkfklaxwMSjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX1Am0+t915SXS
 v34x4jR4ibc5LXksyWf17kGYW8nuRU5d24vwiIIrQBt6rffkhdbEjdiqVH4sKDlNRbFn158IIhb
 5mDnsgrmM1rLv+MOVgWW3fdaRFtOgceyAJ9fvLrlikwYhbPIPQ5ZyLWkoVMLYGJQLqUb8ojxW7C
 aEEruXxIebgMHYEcMzohIPMOABdUT/P28f3ICwNXm+bqZNPr3Br/DoTc31bjEKyHv+IlPRRx/zK
 MQ6kIpmEg1t2nt/4mLznVM/1//koeANSpU9mDLTEa/QfkSqZsLHEEqpNV8zw51G29JEKF5QDMI0
 5qlZrV9mMFWyXQAm/2MiztB44dcIFJqIGm5hNO0C/iJrb1PYxZrzYZfvBaDBLDLxl2tMHTmyOY/
 T7b5X55WTCgzJBBEZVhnA8fuIqOWt0plMfQT2WaHtfrVKEDRwV5xPTiAXkBg13BL6McwRvzEsK/
 J0RUMsYoRkrkzEqvASg==
X-Proofpoint-GUID: 1LaIfQo4e9QtorvH-Er9WkfklaxwMSjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:sashiko-reviews@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A771C652DF7


On 6/8/2026 3:09 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 02:39:22PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
>> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
>> - [High] PAS metadata memory is permanently leaked upon every firmware load.
>> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
> Hmm, please check Sashiko comments.
>

Ack


