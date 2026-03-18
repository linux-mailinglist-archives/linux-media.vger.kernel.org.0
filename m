Return-Path: <linux-media+bounces-56201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG9tMzaNumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:32:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3272BAD61
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C3C7301025C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC883C661E;
	Wed, 18 Mar 2026 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtiejN80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiUZHOxQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC83939AF
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833516; cv=none; b=hqH4I37fGOO7RDSprTLyiG3cqYCFrFGkc1KHnZaIy1XYW/+CgwNmoZU+TCLJATgMMJu6ISvdcRqRTcjeydlK/Fp/G7BIVkt5Ge1j9xbSKFbHp7CepNjdZcKYh6zu/rpxPkcjck/TbycA7YxGTVGH6Oai3Tnofl/bFotEG2iZSdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833516; c=relaxed/simple;
	bh=8+i4NJEDvkGlnLwW1MGUNI8BKp71hpc17Dao5R9ojiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ez8zAvq/hV5e52drUQ16Cmxcesn2nnkrXzKZJANMsDvLHEQ6q9PQ/Yg9wXRHx1uVpbzqjpIm5efs1PukTJSrwdCftk9rfpuVp22gyaWO9bjUxW3isNWQC3Ppv2gixCsDGE+D/j7s4jLkq5InGZDdNM2pAGGCXEe4oCQvjKuB9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtiejN80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiUZHOxQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I96X1P2730140
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLC8IJ041M587lqPxE4O1+B1gM84vZJXiCGzihxtKdU=; b=LtiejN80cRFwaa1w
	nCTC5EdgKeVaDZlblHkX1hXs+Y73YrzqdgNWwmNfECRxZ+oO0vQ9agHhfJ4PGsvE
	udBN12/G/0d+Ombk0udk1HmldMfgcDmDbL2atWiZp4DQgiz3ibw8UbY8HVKmugm2
	hGxUgQGlVvloEjL5LsKK4AakXaa1tUwhR1rOFgplFhEN6CbDOJIIbGvbTFjqCJ/z
	sQBdqYIOWN3nfEArpqNP0D+GbnjaC7Ob/+0lQwWuY983i/ECTS41FDbbbDnGHtaT
	9hdxx7oPziH5wT6U/YGqz+S+MHzfunAdlDHp3nj1Afrl2Hajpo6PWx3jjaCrvAyx
	cuIxSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvkkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:31:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec784479cso417070075ad.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833513; x=1774438313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLC8IJ041M587lqPxE4O1+B1gM84vZJXiCGzihxtKdU=;
        b=UiUZHOxQbGTyjgrlvPhD4tKGOeGNEYwI0c/6IqWvYB5FObLT/qF0tewEt/YKL6tiO9
         SCygSdq3rjOYNzlHJHc/VZBWgzM79P1hj4foWo9fKzMlBO7G8k8s+x+uZo+xmx95+dik
         Ky90ZOAn1jzUiItwj9x9YPs27TZGwAKVfvH8V6Te2homDmMbfAkM8Zm8vkUOj7lCPKEP
         F4IIDjfZ6GqSmJ+wdX6t3Rd78PfBNqU3vIYcX6lfyf2jZeIh06Hl+4Tsz/xqVBpbZRBH
         tYHxVUhN/zJUAppdOjq/csziy1m6AldBpoGLU7sq6XIOU09lzVAL159/YEc1uG6ZGp5I
         daIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833513; x=1774438313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLC8IJ041M587lqPxE4O1+B1gM84vZJXiCGzihxtKdU=;
        b=k4KqJ0UmWMJO1rXwd658KMtD1dgN4Fr1JULc90v9WuM8filpSM8t0MtUV6/Af+VPYn
         hPRGTxQzkknu/OYbdz40p/52zsenZOPYPhw9T9JpTQNp+tvjb/BOs4nmZa6QH4jOcqze
         12i128rEuCjpno6nCF/n6+HvMyKgPc1RFDu09mt53OfI+ZHXzSxhxmqm3Q06Kt5kgSkn
         fxczsZK3Rorab6G5KsoSyhq+xTykubTUTH3sRElxvFwfTXk3G2Vk2k2/kuQ1LlObEqPw
         eZ4wuQ+QnuY/ncZCUqEYaradvdGyBBAtY/un1DdOCqMV6n/DHyk8RFwM6tBAW3a6yAm7
         If+A==
X-Gm-Message-State: AOJu0YypTiRWFEkXOrg1dAb6Qo+NrvxyoLPmp12PGZWHtWBfGQ3OnMYR
	hAB7UuNL4eawC/b+Tya+fVdJ35Jks3ECEmN3p6YnmHA/1PZY3kep4cwfOsFwZXffQ6fhxc9GMVn
	sDUAU8YR3b0v4asFNcSBVcKkIcrIJdURz63PylncxZYX903SndPryBNrd1oKEtNEPVA==
X-Gm-Gg: ATEYQzzaNb0lIfvUiNTP4OorqDETusDu9ARc6CyrcvMGuXZhOLn7Q9WdIFi/F5TyNhT
	wwKLwcRZxjBeyBYGkxprVxN/Qvqaf+TeENYckkpIwDr6G+ylDCAErRApN865boB/Z9e0IJG1rv5
	frbEB6ap9zfYqi8mRXqtaQvRrGy1kqPRpE40Ho+e6LTL2YGDY9fW0t9yK4NgLr/I1uXIP53IBxV
	ZVgBKVNNuznUojst6AA1cT7sCgP7dBD1V4Ds0xyPETtfJllxrZ0SUpYb7uOCA939Kdroiv2/buz
	rT57wKre0bhT+lwKNaQHJc+9jNIulfS3taitdySE3CKRtMp4N1weNUSvXMPOYoLT5np2LEFmFBt
	kFTgPq55ip4v7FcKZ9464lk56JUvEP2NJvlfJmYRozYmsUMl2tRV2jA==
X-Received: by 2002:a17:903:41d2:b0:2b0:5cee:c405 with SMTP id d9443c01a7336-2b06e4420bemr29829055ad.52.1773833513371;
        Wed, 18 Mar 2026 04:31:53 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2b0:5cee:c405 with SMTP id d9443c01a7336-2b06e4420bemr29828785ad.52.1773833512776;
        Wed, 18 Mar 2026 04:31:52 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef3d1sm22058745ad.38.2026.03.18.04.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:31:52 -0700 (PDT)
Message-ID: <26a7ab08-783e-469a-8741-bee6ddf51c81@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:01:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] media: qcom: iris: split HFI session ops from core
 ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-4-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-4-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfX13TbJBjPeWyP
 +69NynZEmyw+deBd5AmG60YWF9QGiOtqph7hvkCeDBdWMpSFo9LKLAijPS6mOgK9zdZ9twsWSLq
 fRlUPkRD28q0Toh8IaZuWSpqEcOEfjZbUcDz8IkGr9OX78qUh9XzYy28YfmzIGCt9ksCtav1qg9
 pEU2J88UI7rpUppJOdXpsl26Y04KHtfMdDjUo6m8PCDMY3t/WpJ9L7Spyo31nM7y1bydlfyF0mo
 wgGEf0bzPO9sRFFNkF3PzmcA4OYts6FqwesV5r0vhh5vt0uPtUv3dJbQxCcEvtv+8ynjwQ4vShB
 SJxyGiHFOnl8ywXzvF6pMi/eSPMehIX32o/+N+Ryd291OAt3JN6zbWAT/W6q+VFacDsWoW3eecJ
 riW6v5HOR5awEJvIhuKkeBFsCp/ILyUG4G/7UlaMJ9Fyvt0L81R+a31r5ZtxLRkbyT2x3gF7M2K
 KvtkQ+5s8IYRnSyZlbg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba8d2a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-nPLP38iecPz0NBfkI8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6Ia4t77B2ovIlRB7yZGCTimB2dfHe-um
X-Proofpoint-GUID: 6Ia4t77B2ovIlRB7yZGCTimB2dfHe-um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56201-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C3272BAD61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> Calling HFI instance-specific ops should not require double indirection
> through the core ops. Split instance-specific ops to a separate struct,
> keep a pointer to it in struct iris_inst and set it directly in the
> get_instance function.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


