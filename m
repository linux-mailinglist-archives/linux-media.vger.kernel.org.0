Return-Path: <linux-media+bounces-51298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBEwKagzcWlQfQAAu9opvQ
	(envelope-from <linux-media+bounces-51298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 21:14:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFC5CEFE
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 21:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF9AA7E573D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 18:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21033C1973;
	Wed, 21 Jan 2026 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WPZakaZR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17702318BBC;
	Wed, 21 Jan 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020710; cv=none; b=rN+Py8N1aCMcWTDJWbsrTQ46OUu5T7MdlDeckBJODVjP4o/GiDNAjiQAlCW6DWfxF8IwVyD37ujtRfEfNuJfyIyXoDQbFGTVLuraxRz6ANqXJrQ9hQ+Kf92Hlvf7jOm6i/GY4FqJRMZuC5+Ux1wf3XkmCHPgcn3pQ437zj1IrlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020710; c=relaxed/simple;
	bh=Mqg4Jotrj4emqmxwurD4+1mh5LlBcxBi8dAuBycyxrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CSbyU+Eb7lRCe/fbscyJWKhNQrYqHlS2tdPwiCDtCU1v7asZ6V4N5fojVuWNVK3Mm0m+1mV17lk7bB4NcDN4bRtppSIPw87xwvY9Wr+w/Xlq5paGQuLs9f50xe7wwsOJsQY3eQf3jHMZRgAmnpWhyCKMyGlBWzyy3ddcQudy2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WPZakaZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LHkKxJ2452345;
	Wed, 21 Jan 2026 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNilkfoM7J+p+yzttmzKFaWCG1a6+F2xaeBA5IxOpx8=; b=WPZakaZRs5DWDluu
	bzohTkdyjHGtyhSFVMtWH9wkO5kiJLsBiMOpQVkXTXmkZ8VIq93IL0zX0RpfZWAh
	pTf4VToic+hXi4tfzjl3FKd3BH2Bw2S/+AZc3g0sj9lT9G/qMqFEg7wUi/FWCEYR
	UUM58zsoXhsyh5OzspsL2VH8XjcfuVokQzX8cdgfyXK2LktVbuOrXtJQcKzac+uV
	hGCjzGtsNUzcHha7lhMKxq6Y/73pcBHDEC0IPNFDOK4g2jln/Oz3gAFd/B/o5eg3
	oaoCYQ2LtZRaw6bNFECWCYhpdVU7MlSwmMc3fqzP1X3Wr8YS8rFBsz+gpdxvAPkV
	TeoWDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqhpup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:38:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60LIcGuq015594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:38:16 GMT
Received: from [10.216.56.4] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 10:38:10 -0800
Message-ID: <fb56c6dc-acf0-4b35-add6-9557298570fe@quicinc.com>
Date: Thu, 22 Jan 2026 00:08:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Bjorn Andersson <andersson@kernel.org>
CC: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
 <wfkjfoaqgn7lyhtiojodjcaxyzsi75zszoxpd3o47p5i6l2eb7@gxmozuc2wh47>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <wfkjfoaqgn7lyhtiojodjcaxyzsi75zszoxpd3o47p5i6l2eb7@gxmozuc2wh47>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NSBTYWx0ZWRfX6byNHwj/SSEP
 3YRUMT5M32FxjGzHEh+kvENcLfh2HoDr67rKflgqWws3yexxi1HaCHVthSebiHo654tZzCqmvMr
 O4AwNtM08I69W0pdu9uaYzRyX11cXZkkrnYh7Fit2Tn0mtnnChrXQBk8bP26biaiCCzIQ94Kq9T
 fTh6Lax3/ttWWdpQThXArnLiu1+Q2IVZSx8SJ6BX5cAVm7yj2i8JobhB5E+tN9VOOAjG7XR5hvx
 47I181CK499v2tWb8jkVJQ6CiVmv2Mm81wbrHNzCnPHF4ePBIVKhPTyUFu3n2nXrsajiLjUYC1T
 4P7Dk4TVOfgYd2Ub8+HDX9aMiaVEmeyyUFwBtL2R1ZQ1t4UYuamA71g3b1WqartURjadw6ZbFtr
 9BUqU1kXgt/1RI8qeWvNyFkQsPW6Ivux3eEpgxFRDO2J57xjtPJb6qAKIEFjkG02QsbWBhWtneF
 vo2FFw0xJrppUY4VsJA==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=69711d19 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EJUgQ-LtjB6CFHlFTh8A:9 a=QEXdDO2ut3YA:10
 a=Qzt0FRFQUfIA:10
X-Proofpoint-ORIG-GUID: zHPcGiwGKDoB8uZr95d2wKFmQibmxXs0
X-Proofpoint-GUID: zHPcGiwGKDoB8uZr95d2wKFmQibmxXs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210155
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,xs4all.nl,chromium.org,arm.com,lists.infradead.org,quicinc.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51298-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[quicinc.com,none];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,quicinc.com:mid,quicinc.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DFFC5CEFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21-01-2026 19:30, Bjorn Andersson wrote:
> Maybe I'm not seeing it, but you didn't include either i2c maintainers
> or the linux-i2c mailing list, so this is unlikely to move anywhere.
> 
> Please send this out again with the recipients that get_maintainers tell
> you do include. (and skip the ones that aren't relevant).
Apologies, and thanks for pointing this out.
Posted v9, rebased on tip, with the I2C maintainers and the linux-i2c mailing list included.
-- 
Regards,
Nihal Kumar Gupta


