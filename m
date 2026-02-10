Return-Path: <linux-media+bounces-52515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACfMEQUoi2m6QQAAu9opvQ
	(envelope-from <linux-media+bounces-52515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:43:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C611AF55
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B36FD3044B82
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594D828727E;
	Tue, 10 Feb 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="acnwf4vJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0CF4FA;
	Tue, 10 Feb 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727411; cv=none; b=fJyTP1Z8PmhV+n8U6cMg8y47rQIRyQO++J7Q+F8u6xZC43+Vye1clpGCi7Fs29ZQQhUIGToCXhZTZUfsz7EyTfs1UGyV5bWHA3eZXgxQp8IgcCvfuo2YllrlHOEQKRDVlV3/PweVJcgbsTomQty+kd5lMhuN8Tf9clZxTGU+tJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727411; c=relaxed/simple;
	bh=SsUey4ngL1IxmEKLVcbKNfqjTf3Op/WYv3+uHVC9HVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lhoDWWnVoqNprBCxN/mUNgSEueCgcjwcI7eu4HMJMQVnGsUoYeyvkxvS+dwmXS1yNZ5Jwp2dUJXP+Hi2vUTeeDXDprO+MEKjnClvu9AbvOMW30txgxAzTuUE8xhFZ7xznL7mxxT9jTnt1uIZGDGVF8HsXtIt5wPjAN5hDW7C3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=acnwf4vJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AB01dA1940314;
	Tue, 10 Feb 2026 12:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DJUZuxMxHgBmLTMKLMgpfnmRklM8tdMOAxKG/xygi0=; b=acnwf4vJonQLz/nN
	+M2c4JvMSZmChvFX3Hi1hzhA0MiUak1VWWTfxsmzc5pBz61aOd3Pn/uK3tH8qTni
	0OTwq8qH6ovr9RGYtVHE82P3ol6/ME/Z9x6w+LRWW6h0XCWFyrIe5I7Bylk98nu0
	RPuEMZ1qIIFRDCfix6vd8/WDqjSqwynWFdbM756uuu+lcQ3JVr8E8iXOH62ijpiM
	yZw1UM/+IWQMiFomDySBva2AQGgfrFJRq05EnYiW6A0HT/TXoM2JnxL+vTBFxOt9
	E75H7o8xCZCP15tR25LRvyS0yx1E46FK5GhUUyv6sv8YBcJD0JJS0hrnfkJZa0I5
	w7kAHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7w1jsk4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 12:43:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61AChMtA022796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 12:43:22 GMT
Received: from [10.216.16.89] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 04:43:11 -0800
Message-ID: <d63a0663-626e-416c-a5b4-e7d91f158b44@quicinc.com>
Date: Tue, 10 Feb 2026 18:12:59 +0530
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
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <c9d1e8ca-253a-4e87-8dc7-d2036737b5e4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OYhPIZr6wCzhrCvheCyrDBt15RWjAilF
X-Proofpoint-ORIG-GUID: OYhPIZr6wCzhrCvheCyrDBt15RWjAilF
X-Authority-Analysis: v=2.4 cv=YrIChoYX c=1 sm=1 tr=0 ts=698b27ea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=uqR9VxAXCapsPfiRIz4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNyBTYWx0ZWRfXxOWIvIMH6TaC
 OwZPD7hRCr5RAFGXZ489cBHFAbMiHVKOztXjxxARcvxfTyV3k85X2N0d0UyK5SQyml975DyOCsS
 +aZIppzRnivpZErDI31bILww0lnPUlWp2ilRsx/OfGCqSt87+gjpyMBfscjJwychNrTp36brKm7
 lHUQ0GBERy7Uj1t0vwNgPzzwUakVKsaalr4oDBsPJChT/7ptSyLZKFH+ljisiji1vepM5jQfxc3
 Gvd9MfvK3Hld3MhdT9u9KCUR2Iv+73qkDaQxHnElAcp6Kcn2HTUpnpylYRH7hTUxEy7O3xcVuMH
 pgevAzo78FRxK7oYT42w3nAy93Urc6dGIndTWjcHvEZhrtnr1qPBtW7oMNI6Ff/0p7jJv3KYAO8
 fATXpWwF1YPAZYk7sIMY+bjqKM/CnxoW0JJuEg0q+M0Mn/C3cOnmIIPkIrJmjj4n0FxfYuNSUaE
 mC1oAdgKk4OHBQLvy3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52515-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D6C611AF55
X-Rspamd-Action: no action



On 09-02-2026 22:08, Krzysztof Kozlowski wrote:
>> Krzysztof, Thanks for your review.
>> All patches posted here were build‑tested and verified by the author.
> Then please explain reported by Rob build-process warnings.

The dt-binding for qcom,qcs8300-cci specifies two clocks:
clock-names = "ahb", "cci";

On Monaco, the CCI node currently defines:
clock-names = "cpas_ahb", "cci";

The dt-binding warns because it expects the clock-names to be "ahb" and
"cci", while the Monaco DTS uses "cpas_ahb" instead of "ahb". The
hardware works correctly, but the name doesn't match the binding.
Renaming "cpas_ahb" to "ahb" aligns the DTS with the binding and clears
the warning. Please advise if you prefer a different approach.

-- 
Regards,
Nihal Kumar Gupta


