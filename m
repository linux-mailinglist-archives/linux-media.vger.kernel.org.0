Return-Path: <linux-media+bounces-60652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEj/Fphm+2kbawMAu9opvQ
	(envelope-from <linux-media+bounces-60652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:04:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F03754DDD03
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 888FB30C9898
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A4E48AE30;
	Wed,  6 May 2026 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUxvZK/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIKjr2P7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13223ED136
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083003; cv=none; b=J81vZG/WKMn5Xgmp5sSVw+POV2xItkFFBmyao+jtCMkKcAihDNskm6N3nE6j/Fy8XtANWGnZ4j5sSlsN6DxtXhziYfuXSZ/iGuxu6hWjqkzpgKPiTUhu95ftVwg2PL/upQG65oW95JMWGgK5fbs42hACRVcVjnCl5KLlEs8dmWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083003; c=relaxed/simple;
	bh=slFlcG18qKmRJPdDvfi5FDwm64deTGUrtGeGdyAySDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLDL/qaiqMHCEVCP9P22KOxSlYrMhKxSfX/+D4/W0LAber+g2vQmvmZQHpPN+ZNua6FhJdDfO3p2+L97me3U3lfxL4pBr3xUi2J8dBf4h7rpI1tHe7z83vGi8r/XY4QV5mzbyo630oAKpEXbl2D3cduIJuldFYmW949Jwo554/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUxvZK/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIKjr2P7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DJhrH529231
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 15:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=; b=lUxvZK/PdTXLb89b
	kOoFZzfSwhMEpLuomTDMDCEb9V9gM+reKqMbt8imv00LFL4ox2+0XRRxQQKYs4H/
	NETs2OgFotrUI2GcCrm7MF+nNG4n0jtg7T7bvOAZuMSXHRJO+7I0Ap2ACljVhWsI
	3yk+jVM3ctQiYEa2TFQR/v2V0wb/DS9nkAU2PlK8Dg0TqRLSTlO0wAWbN58oJyjI
	yRpcUQDms2KpkQk5y7fVN0D4TpOkiK+tRcE3nDm+ezn4J175nyy+POEhuepbYwjX
	7ILtgxrunRAwI1Vk/7/V5qzBGZU3w8n/0FS4FbXUqyywjAhnMywFnbo+musI0766
	x90uCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015xa247-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 15:56:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so15340012a91.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778082998; x=1778687798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=;
        b=jIKjr2P722tkurHjHV7xJofcCGFSsSiVhkBLM9r7JX2TYjtVT2va5NbJDtA6cvRNy0
         /odua52NzkOUhW4cUmSUxUKD0W4jj6Zo4EwSNLzWCp98vpG8X152kq7zRAmucmqmXAg6
         3akokDbb10zFfQrWPGBK9CoDoReRwLaHX3+FfBYup50lgedc1R9NTSZGTnEBra1HrYWT
         uvjTt+gc1yBOTuot6dIrKINR0y+fSn3CB8f7iAjZBooRO59n1Lt55io+Fa9QaxrHWiua
         g1Gde9ziCYWVDGkfHLrmiifdedEqLnRj/r5JTGvkfLtftG/wK1mmk3cmKqiEKfWBRe35
         zuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082998; x=1778687798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=;
        b=XcsgnqEU85ZmwWjElX5jz6vuaXgwIBmcCmPdEQelcVE/CFIkORRuOQDErtjjSmJ1fV
         /lMsjTbNWzUuntvaxAbO0AyCvYZy4yvybWwjgziDgIy+etiY1yrbklXjwksXhQX7z3u9
         uxhT9qJqOLW9Im1j5ZFXGdYNuItZPT4VAtmMac3R0dPc20Qr9uN48Vt1bv8prZFDPPG4
         PoQBvrKqoy1lrNUE2NSvIbuIQdQQwBWJLZcCEFsG9jLqUO/ge8K8G0gfIePrNKSOQRDl
         3TAp2u+YBhOPkLuJQVBmePjOhwbHHw6qN1c6YDRb5cXq2UOfXnrLjrh2cDBwTLo23XJe
         M1Ag==
X-Gm-Message-State: AOJu0YxwnMkvcJ7bzic/1EYpUcmmP5fFQ8RlXxGuOLzXV2j8qGUpqJJA
	rbw1Kd3piG5qOYoP7rj8cFBirotXqBsIZggWqINLjvZ7DS+D5JtFox/bziNXABeCusYXTC6x+MY
	MD+EMz0M54IZUx/E8bFDqQDsqokQYYchTxMh2uuwiXaKpUSofF6L5Bit/rB8IvtloXw==
X-Gm-Gg: AeBDiev0/GA9nvi1VSqvKUhSqLgXNY0bYyD697AILms7ukZMlg0qFRPQHjwalqHMgfy
	S0yzzR+CfOHoKsfCofWJkWkbaJJMMuuuXXaKAJrxhYFk2cDfmdm54RbRBjj5MFuJXBth354xW5+
	PBbjDUOm6Eb6mqeG35SkE3zKU0mWeSJzjkZzciRxjgcr7ZoIBEEDyTAEZwhEL2OSkWcHiPLwqVB
	443B88s7sIe7CA3JGwaepXYrgwGliPW7MZu0WF3YaYKfvuGeVXg1AgmpmWuFpNngnZQebqySDzj
	CxplJG6858XPqc21rXSJiAK8rkWDKNb5j78VEBB0Mufj0IAU4WDKBockKpv2xnLniiHyMXjEPwA
	1j7vbyveBxWiavmeWX/hq1wxSLmv7AodNtlRBxbC7V+DVIPh8VgW2qlE0/iYavxo9
X-Received: by 2002:a17:90b:520b:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-365ab3e6379mr4145706a91.6.1778082997922;
        Wed, 06 May 2026 08:56:37 -0700 (PDT)
X-Received: by 2002:a17:90b:520b:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-365ab3e6379mr4145671a91.6.1778082997424;
        Wed, 06 May 2026 08:56:37 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bd8debsm2886209a91.2.2026.05.06.08.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:56:36 -0700 (PDT)
Message-ID: <47413644-1c3e-4668-980c-e60f7b8c1352@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:26:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] media: iris: Add platform data for glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-12-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-12-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb64b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2SVvIUmmVaN44YnEgAEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jC93_KtCh9qVGGFhfHSAgUSW2NAOJapL
X-Proofpoint-ORIG-GUID: jC93_KtCh9qVGGFhfHSAgUSW2NAOJapL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NyBTYWx0ZWRfX2P8KoWiAwd4O
 ZUn/HSh3/QgF7mP5WEbwlEaa2Vq8/PS7FudM4gtC/pGNmUtFRlE8hCYjkJWHL7kLI8QMkWv6W5R
 qJWw+byEuKc21WX2DquhZnPN0Hr29LPY4OGr2eQwhutnqpbBp9YH1+tXdtCDpJVVMKpDE6zzIJ6
 0RVEmTHc5QA4DG7DAnIZBA7WxuVqICOzveJCuP+LlNZUtFO6JXRM7Is9QTQKEYgtswisXKEnDt6
 jdPjwFCYfPBlHE4BzDgJ/XbcsHR8yXcpUc6TUoiHSpw70kI0Rf31EPelyFJSbBgjJvbMcQ2zpiv
 BPvI1GNRtfWbJhnCsYRi+jIEMD06cCBb3N6QQwShGnNARTVg8qJx9Igf1STVa5/vgzM0NQ3zkDo
 bujLGhnx9ZETMT/YAykAQ4CTiCcJ9V3SFPLCu8GARWk9zk0TKPT/Sw5c+8B18R9KDCR5mCcrqCs
 mmpc82cDZ87bdesG0gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060157
X-Rspamd-Queue-Id: F03754DDD03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60652-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

