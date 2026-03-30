Return-Path: <linux-media+bounces-57615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p4vlNix2ymnZ9AUAu9opvQ
	(envelope-from <linux-media+bounces-57615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:10:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9429E35BAB1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3887B303A093
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4356E3D34AC;
	Mon, 30 Mar 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTQeaf/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhDjsbje"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0D2AF1D
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875998; cv=none; b=ghlfxL7ldFXjmOQtsLGDr8mvBzCGTtAibBJpCtIjWttTiolEapdYkmY3nzfyABETM3bBvUSnU1XbSguKtCFm/hSvtfkArFg73/DKFGC3RXDmkvz2Md8/tS+r64TYPblBdVofBB231GgarMzeACI0tusm7ACxJ34xrX7dbJKQfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875998; c=relaxed/simple;
	bh=hnJBIkRTxb/pEx74u11pPM/34htrB6sS8kh15oW/cOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvPxXKj8zEydamFZOtVHoOQqWfsGFFCTeLO9zxCDMvble7+dWI2+bsGGNanewkV8DaFYr1k2JlAiaCYKIWDSmkWjWsNRFEJtHqdUZlj6/EDRJEZMYEMuSWzZvRYffcYDvjUDqO7eZe3U7DpMTzky7ZQEnC2QhZ69WgEj8TUlom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTQeaf/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhDjsbje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGexs3174192
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=; b=ZTQeaf/bytoCSzFg
	EDH8gepEfMTHNA3ea5/l/Z00vj10jB0GWj/hak8WZ2+LJeykTE127InAgZiMx8GO
	XzS+nfcvuaPOcQSDV/SozA0cdn7P0iTCyazjW3u+in77R91Vp1YhT0ur9yrYylGA
	xTtTJH2szq98RqFxdWwzcUbh5AdSzfj6Oh2WLltinAPul7VqEGoEu9DTevdoSnzU
	G7Nu0ewwB0ISQNtX33XcF9XfT8fOiKcE3hVaBq5iYhS0xATgA6sbe5cZvXmLyTAL
	k10JtG8qp5qG3CD+Cbo58BxEgqrev9YdFl1OYWZEo+XALFovMpnZlEif36TQeUYG
	zyjM3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h0m8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:06:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242cbb97aso19531395ad.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875995; x=1775480795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=YhDjsbjezdf3fxam6BiBLP++RxXrsTzOmepg+0XLIXdPd7ELztaTZcdshqvrmTU9Sg
         iwXWuRwTpbRdiyw92dyKW6B4bZmHLQYrM5Pn+WQuzLP5HVIFHzdumRwxrOzJBM8nKTzr
         yZk+T3e0MAOukxogwC5Hu9T6Ub3fuC6AT0rPDd+cJ1FnNV5EQOpW9Vu9KDi6CXyFepbE
         MQZDhRcqynRYoAo/+85pIATD/dvDTgI4kjiN1Xw2qNn/K1qF+hz5nUx5UhJ065MDPSjC
         LCcMcdUrGIYwEGkkSCKcZTs0yrgD6ayV0gmXwsJ9WJ/8ScSuEyhTA64MZRVCYFoEPZGN
         GcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875995; x=1775480795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IOBEa7GFyVDrfJ8sYt5+s+/t7ENB46SJEYFrDxrvCM=;
        b=jSr0rkJc5g8q9kWOYIBtdn0YMhrqiwtdBW3utccdEj3XK8lMBBVkFg972R3jrz9Rrr
         RGWfkw84HvwhVAc06AIDHslhgXmFwkuQGcSWva6SHHWUgNcQPlCC8xRRRAcQFrX+/6k0
         1DAZifGNuhd/LERZ3Pfd/vbCj2zOZMFKSt/+KjM5R0BpdD2kINOCJuEuhiyNqKQTTYLe
         c35+SmkdwftzXUw8hxerqsJ9f9mV+oiFZksBgvF0QgSiJQzowaCW0OmUiDQszCqr7IVc
         wTH8Bf0nirzLSTDA9nVdCbaMGq9i+k+oR0z9awOO5bFYRGTZpO/ur5e81X5fNu6ySfMj
         jUug==
X-Forwarded-Encrypted: i=1; AJvYcCVan66mgSV/AncbFIImRYu6EzELE63srnXdcZDhqgyq1FcEYvthra1GiI5UwJnrF0SlwpmyhWETSCPncw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxhQCxVNmDHG800X2qJQjtYpjdfrauxxrrCXvDueKxtImaSVu
	c+yI7KFRu8XMJDjkuHTBif6BXYUrWzzpc0jw+RqvZvpSjzlKLG/i+taacQRzZwXkWSYx9Kd2VX9
	w4q2hoHsSXTKD/JMzA7g/IqF9uiH35FrvUWRiMqhJjIvHftOlydH0fXnG5+wzhqI+Tw==
X-Gm-Gg: ATEYQzz7bmIq3BEUa9EWmf3GZzNzaezU3FIacd6Zvu2sYPFRXMSraQOBkuLMlqA/p4M
	Myr+RscA9Pdfd7lKa++pVWthE+VhSxT/5lK2fAmmvkbyxR2l3+2dHA68NH48mQ/IknsXgrV5/04
	8YEb47Nq/b5BBrgFcPBRpIM1z3598suFcEBO9WR5odVqQttqevUEH7AchcCU1CahB9+BQFy1ws3
	USKO4ppPFjfkcqGcxqWjAMchYZDZ7DwFuk4aHBo49oL1LcONCUyNXCHEpZ5ZMbWmvwqiWE+ZIL/
	qM/Mb1qfubK5jH2Y5YiTJ8uT2QuEzAu1h3qhBYIxtH/VmHWF+w/7Gh0ky2F5VdzWaACQ71CkAdG
	vJjg7uJLz8vfDqWNXs1zTMrlQbP2OtS0UGwoAUAKnFMABw5XyiFOeGA==
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600805ad.18.1774875995496;
        Mon, 30 Mar 2026 06:06:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2ca:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b0cdc2165fmr113600345ad.18.1774875994884;
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24267397bsm88213025ad.27.2026.03.30.06.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:06:34 -0700 (PDT)
Message-ID: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 18:36:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMiBTYWx0ZWRfXxp/qA3ovDnwS
 fb0k2qJVHE+dKT0N6ggjzeLZmPCS4esoNyxSyYvNU6FUYPLcOK3xLS78vHsk23adLYJiA+92ZYN
 +V+GNWAYRmCwvIqDZVwxBVVfe4KWppvCkH1m1mOjs5fT6DXWkAOZ0xr7ExvMBBJtd4ywxqGezxz
 HgKky6MJpm9l4nzJ/k9VX87IY5Owb6wth54oZTcLZw/XJlEP/kpqmoZuQHwFQpZU5ZgvbSdTTpf
 azTI6kQttXJ+Kxd++1sYIeVC+xsjJUJvTTRQaCBW/yFZmvgcIwWaS64GCGW+t1rttRtUpDUON5C
 Iar2PpUi2WuVbA0eeRwnHdO23DUSKljd970pPiD3Gn9tPUOKXJ6ELm2vjl0BqBV1TTdy6QsipGu
 vogfIj5SlAjuOClgZTTmYTcOw9lIvSMwAtEX2PVKRX/J/J/7c74fSgfbLoJ/gyJhkMBhaTR0niG
 QJUSbJN4syrqWkTo8qQ==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca755c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PIOu0JlNxAVOzX5nUJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: AOwius33ASv3UeVwBOAoxT5yzq7U4tT1
X-Proofpoint-ORIG-GUID: AOwius33ASv3UeVwBOAoxT5yzq7U4tT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57615-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9429E35BAB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>> the PLL is powered on by the MX domain. Extend the driver to support
>>> scaling both power domains, while keeping compatibility with the
>>> existing DTs, which define only the MX domain.
>>>
>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>  
>>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>  
>>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>  
>>>  static const struct platform_clk_data sm8250_clk_table[] = {
>>>  	{IRIS_AXI_CLK,  "iface"        },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 7b612ad37e4f..74ec81e3d622 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>  		return ret;
>>>  
>>>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>> +	/* backwards compatibility for incomplete ABI SM8250 */
>>> +	if (ret == -ENODEV &&
>>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>> +		iris_opp_pd_data.num_pd_names--;
>>> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
>>> +						 &core->opp_pmdomain_tbl);
>>> +	}
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>>
>>
>> Hitting below compilation error on latest kernel
>>
>> drivers/media/platform/qcom/iris/iris_probe.c: In function
>> ‘iris_init_power_domains’:
>> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
>> read-only member ‘num_pd_names’
>>    71 |                 iris_opp_pd_data.num_pd_names--;
> 
> See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> dev_pm_domain_attach_data")

Ack, Thanks!

Regards,
Dikshita
> 
>>
>> Could you please check and fix.
>>
>> Thanks,
>> Dikshita
> 

