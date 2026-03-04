Return-Path: <linux-media+bounces-54455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOBMO2kLqGn2nQAAu9opvQ
	(envelope-from <linux-media+bounces-54455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 11:37:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5261C1FE740
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 11:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF9403170938
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 10:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761133A257A;
	Wed,  4 Mar 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWP4kULZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQVbsSv1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE53A2579
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620359; cv=none; b=WFA1ts3ZEwgcKQxSHoIm2L89P4OyqdJ9QtIkZ2Vh76QAFTzcxk6pwK2tRZ863aTw/p07t4m2MWXvmOXveTDx5TLG8q2m+Syr3oGEUFZJXhpRbfHGIHb9Ywb4mM1f6ReYzaTozr+v23Kj/NEnQ+GtF4xzlvDO/dcBiUpkfHQlrzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620359; c=relaxed/simple;
	bh=RZJqjHcWljwgglzRnGIL4K0cq5N0Vm956creLFYveOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUirY+6R0Dh9hx/EFloIOmd26A5HkASKqw1P6berzh6fHoV/H00PggjCMLduTw7vsiDSajhf96sx7BD/E9ziyn6oJt+1XXnZCAu3Tuon3/9YYLZg1FiG93UyWKGI34KCA/C0F2uL6mTdUaRorS7G27hjijiXUrUKoTl0sAOzYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWP4kULZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQVbsSv1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQIr152553
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 10:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD/fzWEvkZUb0Aeqg8CKGCrD5Hp3noy4/2L2GfbrChM=; b=MWP4kULZIakaZCeO
	zhzxs6HaMnpq6PTEhvzCmOWcBPwLWJDftweYgysUed37fsAXuwVfCd2oBjoLFi1B
	T6XXLOdfbetJbHBfoVgiKhY21BGQQ2ED0UL02T6p41/FjXU8y/cUQvh8K/rc55YZ
	TMiFTvFp1XjDViTIM6PZrwuuzYM0ksMjSE9N1NdMmDftTJIepgfkkLvoAN/9zJHE
	Myh+Sj9qaM1jKGtoNULr/NnOH+OqDSlduGB3RBhH+vwFA3LcE/6R/OJ2r7ah6MKN
	SJ2/13hV4mrq+XaaVMg9l32dYsukJenGzA32E2uJPZ6BljQZrqQbO8iKVlFsVccs
	PGSNNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvk9cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 10:32:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so523063285a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 02:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772620357; x=1773225157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD/fzWEvkZUb0Aeqg8CKGCrD5Hp3noy4/2L2GfbrChM=;
        b=NQVbsSv1dd5Pv/z5RB02ZhWYPjHNZBk/6dJGE5sol6HZRrhmiW34r983Ex+YFF5rvE
         e8GzHVV2jKay9EzShTuUg82MT3U5qIyinG7KqST0ctiFmhit6tnpl1EP8sI+EK/cZj7l
         n6YtCsCtsAD4jw0XiR/EkYfRfbJSPtzYvHIJOnN5xr+qRKE3St/K5fGi5aCKLitUv7v6
         wb9unD00Cxg3Dt723BKUR6ZLX57zQeHyt4+lQ4lhkXk7oUYqubva4px1iZO/NyUrkZWJ
         N+o7Df6WWi8QnTbH1C0AaqeIzREtSQDIQJq/4k+cPohf0ZuScagOaCAuIkO1PpCj5Nta
         4Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620357; x=1773225157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD/fzWEvkZUb0Aeqg8CKGCrD5Hp3noy4/2L2GfbrChM=;
        b=isZDcS36dPDgjET6CT1sgfc3o8at163mkDua6JfcKmgx4ZhQw543J57E3HKKqEccj9
         EXbFlGet+RTj3JTE3dLfeosB+6pRaCIhIVSVucW6vbxQpauN9iguQC2ZfpwfhpUIt2Iy
         6GT2MG0dOCgq8Rkuk2sKfRUoJ6o6b/50IQl2EW/+7kr4ifWXSKaAAvTdjATMiRZU8JS3
         hNYZAqdB2Gd3IJQqElMwyBMhqt/nm+4xxK0B7maAe+W9gpdNvJqtxV8gVdAyRCHHCBez
         Wm1cil4eax13mDuiCdGwVldWMsjsQpKRNR90GmrqCx9eHjOYPdc7bfYW3dAbZ5aK54Jv
         Dg1A==
X-Forwarded-Encrypted: i=1; AJvYcCXylxZnPlsFnklErf9fZ1g32IbH5nUXxepnt66/DniR4Tpt8Cp/4498p17tjDRQtUEWsnnpr64GABYH7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh0b3cNfRC4hhaYMjCPhl2IMHaSH6EUKybGgS8HpS+L0sydjNC
	z2C5iql73yVxPurQmzLLLb410+JbxjzZqAKa5w8JRBLrCx7xmB7mbXNPo+khtuh7Zjdmay+h9oW
	sA0FYcdRqyeVmSAocKtyxsDWzPY/lgnUbLvf96nDr6nES/DDuUdkg3AnpmlHunRUApw==
X-Gm-Gg: ATEYQzx6bXrWRZaGPv2Tc6EATo0JWcEtma0Pq2Pqim58ZdvgVUNjCFqMgTjfBSFAm7V
	FQPazHvLHE32YyRx/wD4hoW+Ku+pbRVucMMScPhVW3LPB6+7AJb37LftL7Iz1V6NdW0xWu4hkZ2
	C/YnMyjVW0dYDa7NjkCj4PxwmI8RKsbCrD4XEAAW+wOFtpdPfvMT/JUun0tCkOj95PtbO5Inpth
	BY9fPv/ZMwbSR/PGm8NSAwlG+8PiurPLrZLzT2LYsegpEwr9Km38/L+GINZTwIJArJS6ZoGx6kW
	zjVj0PDT9Er3qMVsto17emcp5sCLGSm+6aaeE1xibNgXpX0WxyQbTINcP2kp8CV9XjCUvybOws0
	bp/5w3SW4iByyqiBLIBvhBVGhPwwicGx6J6iS3YEFS+Wyu3QeBnFRLie5yDP9SmdQtzRPel/6+B
	u+wrU=
X-Received: by 2002:a05:620a:46a4:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cd5af181b0mr131177785a.3.1772620355567;
        Wed, 04 Mar 2026 02:32:35 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cd5af181b0mr131175785a.3.1772620354995;
        Wed, 04 Mar 2026 02:32:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm1224812a12.17.2026.03.04.02.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 02:32:34 -0800 (PST)
Message-ID: <5bdfb62f-c3d2-4705-a49c-8830577342f9@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@nxsw.ie>, Bryan O'Donoghue <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
 <04f22394-2dbb-4b7b-bce3-9b41ebfb7709@oss.qualcomm.com>
 <1082062b-87a7-4254-b5e7-2dc3769a619f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1082062b-87a7-4254-b5e7-2dc3769a619f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4MSBTYWx0ZWRfXx4aV06DBXQM3
 CRbrDJZIFSOuBokEwuu3kPUPs7wDwDxQfr0cQKJ/rw91mIuR8VEIMa90e5PlNvDLkTSNNBbNRSl
 5qw5JFtWX3nozHJmWhvUxmGbv2oE84bK8UDIwwwUNvv/jWHfubtjYCd0N+mR8y0W6cKIE/zSr7T
 Dsq+0lPFIRanFy+uTHnv4wN65OgQPMBlkT+LaPhOToh9pzp4rvU5vX+rtEBq1MyNW7TIlSLMzRJ
 s8izkBpYjQblkMBdyGg19uHzIghQ+gsXyBVFg65p/+YONuFYDf8AiQ6FQzD9xreY/J0w6VDf5wp
 7vPo3Mh9AdnkMqJzSaGVnv2rlXY0yr7p1FCQ8D6roQk20ODoQ1gw5VZYfwbPMAk23TxUK241yDv
 cuv0x0v19+bBkmA6/6a26kJDmmoDlJAygqB8OarR1awzb3bVHz7nrOHhT0/PMggMUgREJoy+LmB
 M2ZQNg72TFUsP5a2dwA==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a80a46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JUammnum_Y0_sDqSRXIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UrM_G9rbOjGah-1_6Sj_UcBrVW5hcmk4
X-Proofpoint-ORIG-GUID: UrM_G9rbOjGah-1_6Sj_UcBrVW5hcmk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040081
X-Rspamd-Queue-Id: 5261C1FE740
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54455-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 3:56 PM, Bryan O'Donoghue wrote:
> On 03/03/2026 12:34, Konrad Dybcio wrote:
>> That depends on the use case.
>>
>> MXA is always-on (that's the 'A' in the name, as opposed to 'C'
>> for 'Collapsible'), but it's not always at the required performance
>> state (svs, nom, etc.). For some clock controllers specifically, there
>> is no need to put them into the picture, as the rail may be unconnected
>> altogether, or only used for some retention mechanisms (which only
>> require the rail to be enabled and nothing more)
> 
> Does this rail have an OPP table you can share ?

Camera clocks on X1 (mclks and the fixed PLL2, which is exclusively used
to derive MCLKs) that potentially depend on this rail (awaiting Taniya's
opinion on the other thread [1]) would only need LOWSVS_D1 for all of
their configurations (ftbl_cam_cc_mclk0_clk_src[])

i.e. let's wait for a definitive answer as there's a lot of layers..

[1] https://lore.kernel.org/linux-arm-msm/382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com/

Konrad

