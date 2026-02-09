Return-Path: <linux-media+bounces-52434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LZ8HxAIimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:15:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34491112675
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 17:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B98D301DEED
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 16:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD733815E9;
	Mon,  9 Feb 2026 16:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NWNx69Db"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8504374198;
	Mon,  9 Feb 2026 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770653704; cv=none; b=XjjDVtCjYcwC1LBNnX1Q/0004V8VyNqEa1NJ3efOvuJUzSiESzk7x4vX7xQrDpbH6NFEdXoKlNb8giq0IDHF8AoUtrQNdeIUtGXjVb6sYowCYoP7PG+EX27VduUv/z0QSPlPS0fMPSKBc07KYdVdhwxMeyOSwoyYBg2MbDX9Ous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770653704; c=relaxed/simple;
	bh=FvZn+OEw8GU8SWUBK2R6uXoXALacJBeJ2a/5HKKfI4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oSijooMMCrdQOMaUWIfTeeMVE48ss3glajPbiyqzusOLok34LuUSd7Ub5GX4zVjgU9e/v9bnhv8bV7OuPU4K/Lb+UBiDPWcz25ZJF/VpZVlMOidCdu2den5fh7xwTz4qejqFsqGCob3q4QYcsYHi7yJ5MGxeF6hqKvVJNjoQ6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NWNx69Db; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619F2ssL2814553;
	Mon, 9 Feb 2026 16:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+edwX847h+ardtb75/Mc+k2r5of2NtPFWAl6tK0Bbw=; b=NWNx69DbPZquUbj5
	ygsi+H5VBAskkLJNEZcuWBPbUayLT9GKNURt/qIYTUG8ys780m+B5Sa2wVaLq7iR
	lFa9Srfae9c7u3cEsGIx/iGsnx1NvPXrIDyTGL0/8K9ssX9CsaMekpD3XHEpoXUa
	lgRiCbaRS5zu0i8wW71NcUeSnPbTVou79Xp+sAOqc0HrKkl+cpoX1kbXp+EYykR1
	CeP6rfv2fq792qqfLhXFXHFH7kpcUkZmacgkwNW8T4KWJX5mn1gFrcg1PfKEjzsD
	zEWOJXApNhlPNFo80QnbKNRZuz6a4av8kuQPTz0JWz0wvghI3VkqWpsOczMel8Uw
	bV7TqA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65c6s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 16:14:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 619GEv28031136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Feb 2026 16:14:57 GMT
Received: from [10.216.23.47] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 08:14:50 -0800
Message-ID: <0c88b41a-6884-4056-ab47-9b67eb735f60@quicinc.com>
Date: Mon, 9 Feb 2026 21:44:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] arm64: dts: qcom: monaco: Add CCI definitions
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
 <20260121183142.1867199-3-quic_nihalkum@quicinc.com>
 <1591d0a9-d5c6-4043-a156-98954bb5b1e6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <1591d0a9-d5c6-4043-a156-98954bb5b1e6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=698a0803 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=BjyQy4h12ZiA_7grzfYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tgCSkNieX9RSoyvyiLHbdnYppgW6O_Ku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEzNiBTYWx0ZWRfX9zzrbCId3Uyc
 LiihgcNa84MDCF0wa8ms5IsBpw5EXpuM6jtpXqtC37PY/sM5r0eCHdjsSEpwX9b00VXGh4gliMU
 eR2zKU3ek/+/EAMUzbhfKIFHZiIOZj4dye7XGjIfglll5cozdeU3IoO3nkPIqLxfQbv3OFDPIyc
 ZAmTYgaNulbGlJ63rs+iFmehBMy/v7Sv2hEZ5Y11Mreo8ePR7HLz37rV+MkrVJoz/0Y3f0aQdtQ
 5sp9m0D11gSMd6SWRgKkahmuC/7qj1EOJb7AyNGQLMctdvA+Vy3Nu22vswo1E/X2EDQEhpoi7O1
 MaxyU5Y2qecH3xmz4szbnQJtTdZFzZGqn9ws+Vnm+XYMA2y4nTDxL8yDqp+J6evgjetMgfZdbHb
 XV7W5ssM7SEDUI0JSnOAdBJzmf7QvzX5scLTotH8hcXmMmlY0lTd03qsjigytrPoMSXGcVBJoFL
 L+fOBY2puFnQb0ZB1ew==
X-Proofpoint-GUID: tgCSkNieX9RSoyvyiLHbdnYppgW6O_Ku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52434-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:mid,quicinc.com:dkim,quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34491112675
X-Rspamd-Action: no action



On 06-02-2026 22:07, Krzysztof Kozlowski wrote:
> On 21/01/2026 19:31, Nihal Kumar Gupta wrote:
>> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
>> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
>> and number of CCIs.
>>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
>> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
>> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
>> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Wrong DCO chain. And above looks like total mess...

Understood regarding the DCO ordering. Until v6, Vikram was sending the
series, so his Signed-off-by was placed first. I have now taken over
maintaining and sending the patches, and the previous tags were left
behind unintentionally.

I will correct the chain so that the primary author’s Signed-off-by
comes first, followed by any Co-developed-by + Signed-off-by entries,
and send an updated revision.

-- 
Regards,
Nihal Kumar Gupta


