Return-Path: <linux-media+bounces-52436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHWiL/wNimlrGAAAu9opvQ
	(envelope-from <linux-media+bounces-52436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:40:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 230CA112974
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AEF6305DAAB
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 16:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608BF38171F;
	Mon,  9 Feb 2026 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZSzRM3Sa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE33815FF;
	Mon,  9 Feb 2026 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655037; cv=none; b=BNHdwmnFQMlZeSa0jdSNCTskY+QSQhh8EjieyPp7UjntloH1KyO5ralQrpK5eKdo5CcQFsFQZ2wBJAy/GYltiSS17kdh4X2bWEsOsJSjfp7s6Ewmq1p41TLhSOOMpBUzZn7uLhir9grWXZoMHdQoirlD5RsjvFJfgW8c7NbdEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655037; c=relaxed/simple;
	bh=ms6SQjObH32t7lGplru/llQZaGHGi3TfQBKhiy+KO0E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=K/xFjpmOzA0W6LYqaRtZDr8P/9hbm4BTi70o0Dcfg0g0P+tg1isghoIOuaH4yiWPRa498WjLSnx0IqPbJ7JQoQo9xnIyiEIyp2ZjGHIxwIvylLgS8/s1sbmxsVa7Yuo1PNVBX7vEbQ/2fENm6/j6aBkU863tZdEFMqguMSbUVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZSzRM3Sa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619GYkF81656107;
	Mon, 9 Feb 2026 16:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnt8tuErBc2u3xhygOYyhhf2vGOcScZNMe3mwfLG/+Q=; b=ZSzRM3SalK9jfD5M
	5Zq7h9lumi0fLGSi2jJjenFVDrD19SPcF5vyD4Fz9sqIJxSwW7iXjg1JTL87kmEH
	pHMdNEWskSup+0CYEkJdTtfcHym1+1SDIdAd83RV2U/ekxu8VBFTal3YX5T2w85O
	ltyR9CLINqUbTQ92YLBTbGdsCT7tbRBua+oB7v/XWK5O5X9JzRqOHTTs5vWS7w9M
	YE2jcj83Cdgr2pCoq1CB0AN4X2ss1DJdnLH2c1v4bRRRJ7Wxi+uNC1YpvCIprFpR
	Cn8YqXuqF6KUXWLMwwUbHbIYXUZhvgCBhVUbafF9BUHXqaJoCn3ZGbTmZnvItVpP
	DtACSQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862tff4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 16:37:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 619Gb8nH029896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Feb 2026 16:37:08 GMT
Received: from [10.216.23.47] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 08:37:01 -0800
Message-ID: <7889e13e-fd81-42aa-873c-92de641e1979@quicinc.com>
Date: Mon, 9 Feb 2026 22:06:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
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
Content-Language: en-US
In-Reply-To: <32c4d3c3-6cbc-42cc-8c6e-7f1d0d35cc2c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0MCBTYWx0ZWRfX1vqUd0QUv/rE
 dsO0oZ1vX6Fv23ieFNPef02lkA3vfV3AYsndz9HP0MbFTZQpj4z58XEDwmr2JaNwLZDnCtaF0yf
 UxV34CCQsGpDmLoHEygqpUCh0v6WWMXC3VAWdSSt5bAeO/VzV1m1ddAsXqpsEh7u9EZIYnXKllx
 IRJ1W8vGvsraRsS3vwkpBK7OOmNNiFFbb4xERIdp4bJ0DdbPHS3frI80xZkXSXNk9AU9ihVwU5l
 gs8SyFmgK9/rg+EWS6YttG/L7ZuIZewMglk+rQMAsXkJzNvIFETU8jcmOjO8JOKVJaKly/rM0XP
 cxqOuJeoE1A9+9+mWnBrkDZD7KCEI0oP6oTPxhXD4ZSP7GK/TdA5I37ICvt9KtSSuoH/vXU1OR+
 BK11Sf/ZVycDv7fHxZINkC4lRmXOtdFzxB+gNcb2ck9Y3JDBSlwrFn2FNhGs+m8YHwbYX/LZ76u
 MTc3wZAm8/IYuutmBzg==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=698a0d35 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BjyQy4h12ZiA_7grzfYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xnJ-14g5FjEonoGLr6d6l3VJeKwvLMEu
X-Proofpoint-GUID: xnJ-14g5FjEonoGLr6d6l3VJeKwvLMEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090140
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
	TAGGED_FROM(0.00)[bounces-52436-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email];
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
X-Rspamd-Queue-Id: 230CA112974
X-Rspamd-Action: no action



On 06-02-2026 22:09, Krzysztof Kozlowski wrote:
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
>> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
>> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
>> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>>  .../dts/qcom/monaco-evk-camera-imx577.dtso    | 66 +++++++++++++++++++
>>  2 files changed, 70 insertions(+)
> 
> So many people developed it, three people reviewed it, patch is at v9 and...
> 
> still was not build-tested by the author. At this point this is big
> surprise.
> 
> NAK

Krzysztof, Thanks for your review.
All patches posted here were build‑tested and verified by the author. On the current master tip, I am seeing an unrelated issue where RB4 fails to boot due to a rootfs mount error.
From next time, I’ll include the exact SHA on which the patches were validated.

Rootfs mount error log snippet:
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[Firmware Bug]: Unable to handle paging request in EFI runtime service
[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]

-- 
Regards,
Nihal Kumar Gupta


