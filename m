Return-Path: <linux-media+bounces-65318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vqynLC1+N2pBOQcAu9opvQ
	(envelope-from <linux-media+bounces-65318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:01:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CF6AA463
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:01:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bWAavCub;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QnWSIK1I;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65318-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65318-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 916F03004D04
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 06:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB5125B0AD;
	Sun, 21 Jun 2026 06:01:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C91A680E
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 06:01:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782021674; cv=none; b=D3PqqfMPs/jugVi4S//QSnYf7r19g8vYZtOnybsHkgXhm/qDIB03p+c6Ku7T05jpJvy83sb1PDsdlXJC/P5c6uc3bKbjusa3PLB7P5FEQDm+IAVjkIXYfRnIilCqzxbM+E9hfspBvpKO8/TFtGE9Vwc1ntP296XQYrGTsGgxThs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782021674; c=relaxed/simple;
	bh=Ps4FYVhY/+AWPZL6Cgx+yY0Oak9eRrn0s+QgtMMDndc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6LqqCFn+YDA4o9zcI9FdqD+hH/5DOhnUBFcfDAfwZ3JYHgZ1+AmX3jUqGtNM9WVh5TbhU48c2uuITPuCwrYWu7FJInLjS7T8Uww1Dy/tRiJBuS4GALAe+rYXjGMPH+4b8yMfbubuXne8MUWguU7psoyxrvcG7bm0QEqWMwj34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWAavCub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnWSIK1I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L5jATZ1012920
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 06:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=; b=bWAavCubaAeSbQ2B
	5X7Tk45bwritVIUZ6q7ChKGUS5amfhJX7i6Jd3+U8KstjQVYB//B890waTbupy9b
	tJGRNDICPR1Jmflh+TmMNV29BxRzu7Cc+SFEay0RQthRnVPYESrrpI7WkU5VD143
	wexfNLzPJ1ZnOnb5OMuuIkR5VKYO2anf62kK7rZAWbyQvF5FH3QEr+Vm42Q+MPG1
	8okJYHbaGa4baOhiXL9wGya+HQK2q/qefMZ1x09nSEovfWnr1czKkIP5oN2215pS
	vJF2COzVkgD5GEGRKuUE12Bl+jL8bxINXTToZzgEPUkQFTGeZEl5+zA5C8N8CehX
	pcEM4A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm58278d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 06:01:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so4752987a12.3
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782021671; x=1782626471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=QnWSIK1Ieh3z6sMm15nAIjkEnBshbx7p3MFclrQpGrch6/A1v45DcOqnPJYh3sa/mD
         gfvhs7XSbC5Fg53rItnmHSXgIqSUq9N0juHBMeHniREacli6aD3OXePsJ/R74HMt6IR+
         U0Vt0asPCIHumqvdCrJhlAFoDZs7ZofVgngjybOkhIvW3VUGmZnTrUQSxcfUKIbNR8oe
         SOJF7ebOte/cZgGugnXPWZ8VohmqyRDEMzGLfRpb2enS8EG7C/68HpZwyWfeqIyOc+yN
         VMQCqcwaQn4hj/DDRDP/zODrRQwDOA43J5xd076Uo9Fb+tMGIhPysTbAfdiYiI1HT+Xx
         6Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782021671; x=1782626471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=mTpbCesNSC0vKdeXpagMRi/ZJGBU57UnWo2LmG1d9U3G0EW7hM2rTQd/HcGo7FN3Nw
         W61TFlVmPzq9Zler7uTlIgtyfXnjIQibWbjgcmhVfuV4EATlP64U0epy2Ri9BJSKZd8m
         0cIXrssQITQXq0/KARvWPqweg+jEWFf5T1Tfq2jT8yBIg4ecN7NFm4l9LvHxd4f+7yDn
         zmCV9eY7+SGMHHeijD1CWjpb28KdCc8SnV9AC+oLQHRJQg2qGdAi4DUdyT6SsyW0gfNL
         6N+QBbahUxd7vnLxCvmkdaGlEi3FINlgeSZeZZcflNviw67AJShx0E/wImDfhaTgu0xx
         hFPw==
X-Forwarded-Encrypted: i=1; AFNElJ8wWW8hwQxvoxfHcXKCXLyAYXY4gRZSsjUHsUTrpE7H8Mv8rJFMw8XH64pCVJxfWHEQrQZzdCpmz9ERZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHXw2b/E4FztZbwk3gu5xtxraCgGDl4kYfCL1zOTdznoEMAOd
	Gsw3E/WrHX2mTjp5+6HJDSY2T1/j3t0CONjwN1dTn4v+KFdl9RxdNktXGnOMDbNyiJgdpR5uUss
	msTXTAC1vtCbMrG7hRtRBCQvH1095YIj9BsUxc2/P/Znz+M0Nvs1S0nOwb6QHDpPrlQ==
X-Gm-Gg: AfdE7ckcql5vB6RIklyRx/RIDyrN1b+SsGTvB7s/qIUUUB5ZXe5WpIgZHzgSynSEjRC
	h6TnNrfMZESPwAEH6OQ0hSbaQ2Yt128ZsfakQVKAwIc5Jyywl+UobxDvqm6eE0xqCWJbUwMBJQU
	LVdaOiWCtys8JTdg3NGY1wiIOts77XGCgTYNo8QGdrHLr/RFN3GqdE/y7XbSovMBj0FMDyT0jGz
	D4VvVF/IBFsyHkIxW73M41rxcM/PQ82oEmjfqNhxrfjI40AeKt+tCHoDJ2+QJvEWcNmTn83KYlO
	hYa+X654ROMJ+1s+uuDYbTOR91RRwTxIhVOMeP7kcVFc8ys1plmuiPRjYUN94bhtecL929zN5eH
	UfiMVjEUy/k5/TNy0XIsWJRdRf1LyLVNAZ93COlqAmQ==
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621230b3a.5.1782021671036;
        Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621188b3a.5.1782021670637;
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.226.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm3823101b3a.53.2026.06.20.23.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Message-ID: <cfe1778b-c204-46cd-a9c8-2bcda8ea63ac@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 11:30:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
 <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vOG6HcLZsM9LBk9gnBU2jv83ZIZivmzm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfX8M/rK6m4/gph
 IF2d6B2Y4Qm9eLBKvGE6Wt3ASXwi5y0z6BpmNZrGUMJrRNRWxOPCOJJ7YauXwEU2eGrhNottMv8
 PoUnfWy05agxv1UbhoGKKWmrFtRnlIM=
X-Proofpoint-GUID: vOG6HcLZsM9LBk9gnBU2jv83ZIZivmzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfX3g/edoOpCv2d
 4QRSWLODaCcQ49NXgyhagd0rnlJkwtwldPWMskpzDkueHvg7ZwKvs7jm8l4WHbC76L/krsJlB45
 /IDI+kyhn3xQ20sU5Cx0dQy2gLwlPQ/wF4puajpv3iVR5b0OvTveDhwikSCI0pi6HqZWd6YSnPN
 iRPMeGM+MnDhG8tUVV532wRg8U0Y0y5e4YLOe1oUBTdV6RWn/WSmKhlbRAv3UumruDJeQGI7EAP
 KGwSwCN49B7PdZcl4sPCMhynorZMLrhX5CzQGnNCTqIB+9PP8p4Z7LlC0mfvpn3m5z7s0KHzOcI
 QuNnTO8zZoowxlm1sY8TRagWqlSHCBpFceYkWln8cEIIJnflKzu7R6qn7k211ZcgYcSAEgWAl4d
 VPIb6lBk4xEpSdh/3sNetyZ6bkM7o+dVVA+KbloZ+wUX3sfDD06X9ZM7tB3w9vDj90XaVhhS7wT
 pWyS1EFp634w3uFSE9A==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a377e27 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Kt9MDo777XuedpO0AoDL9g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EEnOiY-A6ZLknHPuIi8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65318-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
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
X-Rspamd-Queue-Id: 433CF6AA463



On 19-06-2026 21:06, Konrad Dybcio wrote:
>> +			cam_mclk3_default: cam-mclk3-default-state {
>> +				pins = "gpio98";
>> +				function = "cam_mclk";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> Please try to keep the entries roughly sorted by the pin index
> 
> For the entries themselves:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
ACK, will fix pin ordering in v5 - qup_uart0 (gpio0/1/...) first,
then cci_i2c(gpio36/37/41/42), then mclk0-3(gpio34/35/96/98).

Could you please review the other DTS patches too?

--
Regards,
Nihal Kumar Gupta

