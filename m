Return-Path: <linux-media+bounces-52607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKtvLceGjGmfqAAAu9opvQ
	(envelope-from <linux-media+bounces-52607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:40:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8F124DCE
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444DB302A69B
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F1B2FE04E;
	Wed, 11 Feb 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+nUAoil"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFB0C8EB;
	Wed, 11 Feb 2026 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817173; cv=none; b=Kt8MSnRSkJiiBQctHJuvCIsZ51MuW+/zI8BTG34ieETQstagfp5ABPyuZ0/fc202SVu0D4myL7KWO+T1Wr7LSagKjX2MGdFUrEW4krI7cuwcN6nDqnCoqZNZTuv0LRlxDa8rQTNq/uriZJqp6gUBF1mV2RAUwMiKoIF45fuxyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817173; c=relaxed/simple;
	bh=smH6/u2dHedP1RNEYZ2moMcAIaSKU0/J5N0ml/3MVps=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qMI2sVNfiB8XqOU01QH+lQt5uuTKtswVqQ3jnoSeHx5nqLzIs8hasdI5rl1bkdQsNm6OQcRBwjm+90+8Rv0U9U9wnkWBYAHcxNHmstZZlyGTaVTP+ekL5COP81+P5s4M5OKETAwZRGRMS79hNJfVbsYkupp20K5oAY4ihSuM6bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+nUAoil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BAHuGA2298192;
	Wed, 11 Feb 2026 13:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovI1Of9i62sla3VPPmetJfS7B15pM70XX/7h+Sqz6lA=; b=Q+nUAoilRCx10j9x
	vQ+AyqWj2qjbPb29vWOWq6f+dq5u/A8+jt4hlppekwd8wUg9iHcnCRoZ5SOXapHY
	prmcLSxb8qxUi2HuAhaACIoTbznrCXlxdhWR4A7OgIdb83puTB65d9DrNTvA7dUM
	p1u/1yy01aaHza6Jhm490vX2hv8rGOt/uBT2F+8gF/6p9aCMSsTIM+0/qHCzCvyi
	JDThK6KV7kd7YMUEaTjtRYF1mzOe0T98WyRBu0vbvFV7fZUje71pEJG12q6P3Zfl
	nR38BtZJ41CmQBbk3FA9h3QnWnTgQYWJb5ROeeDtWG6clBV22TbzKiAqvzBu2Nug
	PMw3+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8qvq8jrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 13:39:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61BDdQhc031031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 13:39:26 GMT
Received: from [10.216.0.199] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 05:39:16 -0800
Message-ID: <675789d0-9fea-4ee6-a368-e1ec0f2c5a8d@quicinc.com>
Date: Wed, 11 Feb 2026 19:09:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Krzysztof Kozlowski <krzk@kernel.org>, <bryan.odonoghue@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <loic.poulain@oss.qualcomm.com>,
        <rfoss@kernel.org>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>
CC: <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
 <20260121183142.1867199-6-quic_nihalkum@quicinc.com>
 <32c4d3c3-6cbc-42cc-8c6e-7f1d0d35cc2c@kernel.org>
 <7889e13e-fd81-42aa-873c-92de641e1979@quicinc.com>
 <c9d1e8ca-253a-4e87-8dc7-d2036737b5e4@kernel.org>
 <d63a0663-626e-416c-a5b4-e7d91f158b44@quicinc.com>
 <8f8d7469-5edb-4718-997e-9cd01f7a9689@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <8f8d7469-5edb-4718-997e-9cd01f7a9689@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7fOO1Wx2NiT14tvRyLQp7kLG0CysBqbN
X-Authority-Analysis: v=2.4 cv=Q77fIo2a c=1 sm=1 tr=0 ts=698c868f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NOhv38UlziJEWAsVEukA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 7fOO1Wx2NiT14tvRyLQp7kLG0CysBqbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEwNSBTYWx0ZWRfXxSRwkFB9eYH3
 ezFbL4P7AnClBQYUlCrKmf0+wL+TwiywkjcS8CgotxyHtVtBXsUE+gFinTf/BjgbFcdlPxdX8ko
 uwITtWPnQSWQNpTQwNvsriAd2NWx/2y5gu1DFFwHUoIOaeU65TyKP/dnTdTACXKQeWDpE9o3re1
 q4w6XCfsMi0o6VySMFPLi2nmd2C02UA+N6+zwSYVkNse7y/p+8DpaHoMm/4hF7dQ0YFveRFu262
 0IxvwgRCSyJtrKMa62Sf/Hj8djD54UAYe55uaKTuIZQJudWccChT3nm+kV/AxNRwqh7MsGEgnHD
 ReoDjKMCnpp4zZNcN2frwH+gHG1fmqwQQpgSq6ZOHqNWA/y/vPCIXyi1JHdq/apJAF7/p3B+LFA
 EZxMbTj9K2a4cg2VlBXsGKCCD/zuzqKJpK09Gl0vHgDOqHypk/TAhfEjGv+srX+GFkfH6i3cs0+
 xFfN18qyZInlgZnU9gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52607-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20C8F124DCE
X-Rspamd-Action: no action



On 10-02-2026 18:21, Krzysztof Kozlowski wrote:
>> Renaming "cpas_ahb" to "ahb" aligns the DTS with the binding and clears
>> the warning. Please advise if you prefer a different approach.
> I said this was not build-time tested. I gave a proof of that.
> 
> You said it was build tested but you confirm it has build error.
> 
> Listen, when tools report you errors and maintainers say your code does
> not pass basic tests, don't insist that this was basic tested.
> 
> It was not and discussing this just wastes our time. I am not going to
> spend more time on this discussion, wasted already too much.

Apologies for the inconvenience, Krzysztof.
I will discuss this internally with the team and resend the patch accordingly.

-- 
Regards,
Nihal Kumar Gupta


