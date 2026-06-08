Return-Path: <linux-media+bounces-64123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hf+vE51VJmoEVAIAu9opvQ
	(envelope-from <linux-media+bounces-64123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:39:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E822652DA8
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Aux8Bjki;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f4JQ9de1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64123-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64123-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 172C730041D5
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F29F37B014;
	Mon,  8 Jun 2026 05:39:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F51378D64
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897173; cv=none; b=NRiMl+Epp66vyZVwGfwh4CBLklvnefBDBjiqC0YwY7k235AGxHLdewXLfhldk6yGFWYHVw2JH0ddyj1ptN7b+qLgIdbXUGx/7RD8MSs+5CbCBPFmjVDTuzFrgIc1h2cZiVNKxTC7U6Fi+rDtRYzrf/qu+Kof2W5PXDDxKDloYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897173; c=relaxed/simple;
	bh=cMCkxruPB0+/BzQoZuFiIbm/OEHgsUhSYjlGeEC+JAM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=po1tUfbpknFKeEsAnnxSEy+TxlxcSHvxjh03d03Gm2fM+gS27TZi1YpaGq1iga0+kNlNz9fu48IkjhpkeTdJObmvbupgpmLzvq0cLdftZ1kZZU36fSAsBSZZnlFwivOCQ3KHch4+y3eTB3a/0Xce3alHnwnAZitpyxEc4jejDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aux8Bjki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4JQ9de1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EMvV1575350
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HUAabhh/cNwlZD3LTk55FqmkLMmZVgRrQqnCafWe2g=; b=Aux8BjkioW1WDjDC
	fiEEiqjE79eRs9GyMm9EA+dmldhCR5bCbUFu+lz8UOy9hlUWW88+WrcujAF365p8
	Lqf9vwGHMkWekA/kQtBM3bO20YYIdLDkn+ZaCpSRTeV+eAJ2MYbZKDoVjeihkzOM
	tFMGttspDZOdqccrwqmKzNqmaJ8KapXcE3qFy+eHM8etnIJ3Xhq1Mp1ME7CJ+glT
	RaZomr6hDzH+JydZ5acKIPaEWfMuBZ/Rw7ckBOEYXzmPlog2TstOQNY5FhEO/eU2
	UOZsxN3N0Vq+KqN1i15kIfW6wECKDBytGdpmiZnKW2HgOuidvcZzNn+ROL56jzC2
	qaIVRw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1dv1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:39:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b74447so2956174a91.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897170; x=1781501970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HUAabhh/cNwlZD3LTk55FqmkLMmZVgRrQqnCafWe2g=;
        b=f4JQ9de1o+A8hrutcn4BXxXC+QrVb+3ks+9ZzKPxEyTgwfQwIaiFdASax9qigdrMNh
         wnqBgBu9zyN4AO7ZqqShh2FZlj4UZ+MeZXSTsC8dkG/TPk+w+XD1IkPQqOMlSPXeb/k5
         riORXHd3wCWXkZLrb8b+YCkODTg3jYBvFhx/F4LSBVwjxGfXAk5bur0LtTUr+lfDtKhA
         gnojzVeiWQfo2fCuv5Sjo9JJR3GS+lNVhuoposaPUOtjHIvcartK9tcBYzMX0bc7oOwZ
         nTitc+GBagUil498DZ/rAJIS2nu/bkTJ83m6cc7Y11IFqdq29b6zfDLiorfQ7VRzpmA7
         E/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897170; x=1781501970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HUAabhh/cNwlZD3LTk55FqmkLMmZVgRrQqnCafWe2g=;
        b=LU0TeGnLO6KF3FUii+tB0Ua2OvjuFV96ml3vdggdY0DHVl3BYOpm11px1XTydIOLjZ
         9/GkqqkgC9zh0ThHzl2XqW5FWQ3injKAXU4hcU26uUiHI/UzRjpEohTgSPYPaUCt8n+v
         6mzh1YocbuaPs9xTn85e1NTdwqSg2DYZV10/F5Yl3so4Ba45sML5zIByKwGyknRlgW5g
         1RdY0cGXB2SB9+4If4P0h7hqC3aZPiWf8CPPxuw/E7aHVHtvsQphQZ2qRlVCBXq7sd3J
         BKk+T6V7QAkdCmBoeX6upBtXSmSvJfXumoJvSqMZPzBWRLeJkaWfKiGLr2lqL1rxnXwW
         9iIw==
X-Forwarded-Encrypted: i=1; AFNElJ+F2e3hcAEPcsQfceUvN7GJIo3v+IZbv4xgZIFfeXx6wPKrfmhSrP7ZTH6+xQDlAjxbJRFVUasX8+mi1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7K4xMWPsYLeEiEzqwIDs8ypupgpGcvPvZcJueIupCehexZKU
	qV6hSgsNhA2XVl62vbu5CULrbt5m8xG1YYu7bnTcF8A5lX3n99JECS4IMUkFjUZjqpmF8Slozot
	GL6R45ONzO8EjMMUsYTPAMWuNB5YCPqOXd9FMlZDBLRMjkD6W85he2qOozIUx7DZMGA==
X-Gm-Gg: Acq92OGvWBXWVrFzqcbjSPxnnRwjYmDwVSSY7UJx5j4fPIbluTANxrsPC7xxLDQphov
	SNBf/QB6wRS18ewXBhY7pW6AkDWZqOuElTrPaISs5v2l9GK2qfc6lDyRvYGgf1CzisHmQH8En3u
	7wCtArHT5GRBGe6ux67EaZzJerC5e+6iObY4bZLqrG8GngfI1u89LS/VIIlzqSDdFiJ/yA47/Cv
	CMGrNF61EZFbWmE1ySp0f1sSYUgBIemXwi5BZ+oYp+GTD6Wjzs+ub+6fOUBw6fDQMhWUNPkqY2w
	DG8xGHEX9/oMsXQ15fDaok7gCkehrL1CTn96AJzyLnQBfMQ058AeZ86nnmmR1VbaCreIx2PHbZo
	wcJ1DijfsnkdP6WC7ulFKoksnOr12HEgcOAiq8D/McipuuS+17u2A1mUMui4iym0R
X-Received: by 2002:a17:90b:548e:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-370f0b55fbemr14256600a91.20.1780897170485;
        Sun, 07 Jun 2026 22:39:30 -0700 (PDT)
X-Received: by 2002:a17:90b:548e:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-370f0b55fbemr14256589a91.20.1780897170005;
        Sun, 07 Jun 2026 22:39:30 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712ef0add7sm8612386a91.0.2026.06.07.22.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:39:29 -0700 (PDT)
Message-ID: <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:09:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
 <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
Content-Language: en-US
In-Reply-To: <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX2YGazvKtW24U
 OTW/fXmAhRbPt27JH7I3wAxixBS6DEplLopBwiqe53D9RJim8eNyXW72giiILprbC8YxT+V9rxc
 SbGBG4ERG0/P9OpZr9uBbveGMvmr7F3Yn35m4ZSCKj1STwBELNQ12XkgwPnqUDbpPwB6SD9axTE
 GSxr8UbKlCWCrWMbdIM8ULSK1GxzOa8skfkd/DxDXmru1NzZgLjS+LJkL8s0/FoktWdyNwq16HC
 /B/CfVneulzDq3X7PifDbsRZh25y67huHgtQ5bjX4JVmbbmKhV85dzmg28NB8zwcgNQHhCd6TXK
 2xKMRUCLXqDAZU1WPXIvW22nDNwkCeDaIF6MVyT7l6JtK3WBXqK9ESUbFuRWVtyNS/r1nL7+p50
 sQErgkQIcog+16YjSXJaA0Mam/7nE4tmXzKuzoslo+aZ99Uzdkh/K4JIlo9T0FleU1aRoQAIm9Y
 kJup2TAAEsHCzsDo2RA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a265593 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XOSsvO-zd5c9LZtoon0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: v3olESzunGSNHdViHZcEw7Qbryvt2lrN
X-Proofpoint-GUID: v3olESzunGSNHdViHZcEw7Qbryvt2lrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-64123-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E822652DA8


On 6/8/2026 3:17 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
>> Glymur platform has two video codec cores: vcodec0 and vcodec1.
>>
>> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
>> same power rails. The clock dividers between the source and the branch
>> clocks are fixed. So when both cores are running, the source clock always
>> runs at the highest frequency requested by either core.
>>
>> Since both cores share the same power rails, the power corner cannot be
>> voted independently. Scaling one core's power corner up or down would
>> directly affect the other, leading to under or over-voting.
>>
>> For these reasons, both cores should voted the clock and power rail must
>> be based on the workload of both cores.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>  3 files changed, 117 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 7cda94601555..f07eaf4b3be2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -17,14 +17,14 @@
>>  #define NOC_HALT				BIT(0)
>>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>>  
>> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>>  {
>>  	u32 value, pwr_status;
>>  
>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> -	pwr_status = value & BIT(1);
>> +	pwr_status = value & pwr_status_bit;
>>  
>> -	return pwr_status ? false : true;
>> +	return !pwr_status;
>>  }
>>  
>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>  	u32 reg_val = 0, value, i;
>>  	int ret;
>>  
>> -	if (iris_vpu3x_hw_power_collapsed(core))
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>  		goto disable_power;
>>  
>>  	dev_err(core->dev, "video hw is power on\n");
>> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>  	u32 count = 0;
>>  	int ret;
>>  
>> -	if (iris_vpu3x_hw_power_collapsed(core))
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>  		goto disable_power;
>>  
>>  	dev_err(core->dev, "video hw is power on\n");
>> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>  	iris_vpu33_power_off_hardware(core);
>>  }
>>  
>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>> +{
>> +	u32 value, i;
>> +	int ret;
>> +
>> +	if (iris_vpu3x_hw_power_collapsed(core,
>> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
>> +		goto disable_power;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +	if (value)
>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
>> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
>> +					 value & DMA_NOC_IDLE, 2000, 20000);
> Unreadable. Extract register addresses to separate variables.

Ack

>> +		if (ret)
>> +			goto disable_power;
>> +	}
>> +
>> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
>> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
>> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
>> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
>> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>> +}
>> +
>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>> +{
>> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);
> Can we trust the patch authors that VPU3.6 hardware data will have at
> least 1 core?

On Glymur (VPU3.6), num_cores is 2. The max() guard is unnecessary.
Will access num_cores directly.

>> +	int i;
>> +
>> +	for (i = 0; i < num_cores; i++)
>> +		iris_vpu36_power_off_vcodec(core, i);
>> +}
>> +
>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> Lowercase hex.

Ack

>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>  

