Return-Path: <linux-media+bounces-57277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BkMCXehxmnENAUAu9opvQ
	(envelope-from <linux-media+bounces-57277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:25:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD825346B4D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F5B6307DC88
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0DD3016E0;
	Fri, 27 Mar 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC4a0ohF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRXR4d+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F8322B72
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625013; cv=none; b=it6jgZAKZ0L+/ff7Voc6jJ/OMaqmfVRagwb0dpqeTbr6flFvtF95Ycar/dgwmuMJ2NkwFzhSSI4NMv0cVssiLf297zv8yPBJi0ARJvaLx0gsnTdiOArlFvF+38ElFHAqH3ss64cuFX8eS3X3GWWIhCl0BQz6k137pmVy1+/Rijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625013; c=relaxed/simple;
	bh=5dw1GNGE9jZm3a9sG92/kuYpuhNgkwUikv+53nOSVVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGjHDY9qhAZBsaCgMeD54JPBO6VVoKtpb9oOxzQsk7O9o8Bdx7wKjuH+goyvln1JyJ29kARMnCalHiSdH9RyFu6AMZTPBD7ZlRgx5wWsFqD3yICa6C8IOD5GR/SPvvH8TcRXGwTubOD/rD4TFvpMiM59GXBlU91GB+OciTYmPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC4a0ohF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRXR4d+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhgwE1640859
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHwjKUgdMjJel/RbPhL6jSPLQTm69YaGVpLak6EQCCc=; b=pC4a0ohFk5mx9TuB
	fbsObHshI7Lu6E9Z5+kNICa+Mm+AmfFdkgVWNurb5MOWwK22aqPC7fUbD4zoIRu/
	EhvKsiLXkuvF2tMKmyUEy+F7/JdXknX3tHtj9K0TFQQliyRTXToHfeUwRB893ZZ9
	pFezooCLsV5SkcFcJ1+nJCcmFK5GMhRzuV3j2MBBcKOQEGFEgXwEx14Hgd/OqxT/
	7ObK3C0VCoOesB3lGGZCNQPydqqpLcmpm5CJ7moTHkEocxMJLWxDNxJ5pbzKW8N1
	ORCnlhV/Rmi5xNixcY9REVvOOUxT6N4aoN8Ifu9hY+1OtWgghEaufIJNcgkptH9/
	S0JRRA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q3xqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:23:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35842aa350fso7292041a91.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625011; x=1775229811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHwjKUgdMjJel/RbPhL6jSPLQTm69YaGVpLak6EQCCc=;
        b=fRXR4d+4mPtJ3uoHRnO1ZVPr3xyfpeteW7KoMTzGfRLitCeQmPPsnUZbew7Bgkk/6c
         TiNCuAe7y4pKTH+oBm/+E024zKjMDSZv6e1nPo9IKQTaE1pCzkAE912jFeboQFZcfPlm
         2gD4GzXrp5/Ihh2xrAEW8vlKHGbCYdz8EMA/o13iuaI8Ot3mv9A2EgpmFyt1n3FeTw9a
         ZZ8SEMppEbOhGQU7WaG3+Bu6rUEJgbI6N8ZqNk1yPkVwhlUft8rDzzr5xDQJjaY6LQrP
         HRO+QwJrBk8yLxON/G+bAjG04DqYNxNcyADqNchUYZVxwgtbKs+tDRG6xrLk+vJAF7AU
         M8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625011; x=1775229811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHwjKUgdMjJel/RbPhL6jSPLQTm69YaGVpLak6EQCCc=;
        b=arrewEtf9TsUsJ1qZW9BCZX1BLS3ZsSoPnQwIVdqef/cNB8uMdv2tI1DznEGejN52z
         zSRbS0/NATa1HpnJcEIzEx++lUTwLu9vM/PwKyzva95hn3yrEYENj1ECmgYzFpu2Xk+k
         Q1KBNBmVT3NuiA0+ISVd5B8V1iRV1tVs0PW177T9LdZH427eq5Rfh6uWiny1m4/8NV2G
         0GEV1V9fRkBd7fwqQbN8AwenG/vD9P+QKNnwFsTjtN722Xt1soARzSD8Fl9Szjr8mS+/
         f1XmRrc93XdGZIqh7Q5dr6wQ4e+FaemNa42/TG30Chwz/1/f7GRjK65B9XBO5NoJ6zb6
         nHlA==
X-Gm-Message-State: AOJu0Yygn83iw/eBZEKEmHW3G7qmYK+8TxE8DtGraDsBv5d3h9RmhRB0
	tSfN6FlGZrajMs0OnwmJ0fT84t14UT98AGnv8anf3I4S8ohJ/0INbSClG9V1GRdI1curKjWFZ3H
	xVQHVsitFVqv0WS1HZyamui1uxXQ+9tivHj/PkDDAXsUR8uiCyDq4N74a438PaoeV/g==
X-Gm-Gg: ATEYQzwucXPGMAh7OKTUfQhfNNWVbIbe0mcoBL9cI4VxMwn5GGrb3cO0Q81Qfjq6x8n
	0D2wZDSVHC2xoxeSNwq9kTO5FDDhzp7BA2okWol97ijb5ggUnpi8nTphhveC+65DR+LqXnRnELu
	UiPO7BnfCiGo0EG3QDS1trghD8tF02lenlKFK2WaTrsztbWV0z6oRat3Ebrska5jLx2vL2P0+Ym
	xkb49xIY6zqrHMtth187TYrLdFmjkBvk/oAITA63HqS9SElD3GOVYQRT/WgZxHyXeIdSynUAzke
	DZnKLGaTkv6R0GEBOFa8BKovtEGQ4T+Or8qHU8ZnFpJ3kkzFAkPsjb0lxo8ZTaR1SQzam7GGLRc
	ep3o++Mv2SqO36Q05pQ7fVruV79eL4RvqZLnAcpCWcjYxdc9VOh3idg==
X-Received: by 2002:a17:90b:3144:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35c30008d96mr3044237a91.11.1774625010540;
        Fri, 27 Mar 2026 08:23:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3144:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35c30008d96mr3044186a91.11.1774625009436;
        Fri, 27 Mar 2026 08:23:29 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7673978676sm4720603a12.25.2026.03.27.08.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:23:29 -0700 (PDT)
Message-ID: <9cee6835-b076-45db-c22d-572f91ddbf09@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 20:53:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 08/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
 <20260320-iris-platform-data-v9-8-3939967f4752@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-8-3939967f4752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WuWksGgkHln6-EtBYZ9X5QbZK-__6gHo
X-Proofpoint-ORIG-GUID: WuWksGgkHln6-EtBYZ9X5QbZK-__6gHo
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c6a0f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ATcjf3gZzKgDnsL-OLQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX+0N/awJ2RIm+
 0lQmA6/1QMxG9v5ZgD8k4S5KYtaMxiQACuy+LKot0nCd3EpwZJqMFZQLsSmW759oJMOO27VgZ7G
 2+JNoqRFEgy8BhEnmE9KZSzlgNGze6k1jeG3WwZ6XGU4P4+hYqH51ES2jo8aD2BSW4dZFBcVFbY
 X838SuApewPuE7ouf35MLcm/2O9gkIBB8m2reBENv3VUMghwozF/e4yz5HL//9Mpzt33e1vlQd0
 hl5Re6NUCyefK9s3yBoStnKLmBdwhFSx4uau/cFt/bDWCXkv65Iz1Y8RPFD/8qFGqEdHouPARq7
 XXJa+QA5OwtVQQCxBiTi5bH/hBR9ZMJgPhTPF2aNUFc/MzApKQgGRTRcKefx5PGvV3hN5gkFeNL
 KtsguP3niYfqNk89c4ZkxG+3tbXgiAM+w2ZDvTBD4kFtnrZAmbi1P2FV3pIbOVOVlMh6QFJxl74
 b9OCzWX7l+WaHDUKGPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270106
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57277-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD825346B4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 7:24 AM, Dmitry Baryshkov wrote:
> Having firmware-related fields in platform data results in the tying
> platform data to the HFI firmware data rather than the actual hardware.
> For example, SM8450 uses Gen2 firmware, so currently its platform data
> should be placed next to the other gen2 platforms, although it has the
> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> hardware-specific platform data is also close to those devices.
> 
> Split firmware data to a separate struct, separating hardware-related
> data from the firmware interfaces.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

