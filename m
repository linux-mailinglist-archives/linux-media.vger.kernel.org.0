Return-Path: <linux-media+bounces-55889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAWTICbht2lDWwEAu9opvQ
	(envelope-from <linux-media+bounces-55889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:53:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E3E298486
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F8F3055130
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F1238F647;
	Mon, 16 Mar 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuFdxoCK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+HPLKyh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793F18AFE
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658192; cv=none; b=h+GMZMxT8mAb0+F2YRuWWJpumOEEoxgIKWq5mzAYm6+/FxVxAxgiSgSOJsR0aJiIeKa/wDN/IXq+MXYVGtAOwVizvjWYT5THqkh43YNAl06kzDl1dOSSxxO+YbeJWrCljxLe7JQMDp8aoHqBdPD7uGe/MCvppngvtVrTdI9+17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658192; c=relaxed/simple;
	bh=dLUILDJah6XE8IdSAr92gpRYC2Mbc2s+6mqhrrOuDME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8jiJIKBJP6E/uomcRUQVoBJQetE5KK0D0x0k/BxxW7gWspIMJyf43aAcqkKacV6EaKGE9ujALHRZv2u88ppoviG1dqMC/fbEmiuCDUGDccQskM4lSp5eG63uTDNzuRSKneQmIYjHeeKEiNVjBlVtTIHDISQ08WGRsO8HjO0QYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuFdxoCK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+HPLKyh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA4Dpe3125145
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hThaOiGGglNbfqGc3fLwjm954j6A3isNL94t100F60=; b=MuFdxoCKfRrXYMvN
	TP4BeSW3bwS1ZO+JlUjyXol9xKcEQhjpDtWCFHAZm425QP1OVAJ3QtbV0R/sxSFD
	d8vdYAwhE1GNlWxqFqaHyMw+SNPfX+HJZcX8fHCz3k+ElifL/dy7gma9e952PGRw
	A+nqGv8LSIfn5kB9iNDyMkMIMxC0GwXsIw4aLew3mRMxy0bjn/ITOCFKgEOkRL7x
	oRVE8LFsLd5CJBwfCIaYhugJMGwgWGev3+n5aJlsJz9NtVVoQiagjzKAgyGDEbOA
	h2xFJk221mFR4h+xtla4hxcL3oTMdrxX6uLy0c3hQ0EzK7Dh/qK5WQ+n0O9m0ivP
	HqpzQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmg4k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:49:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38346fdbso331527385a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 03:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658190; x=1774262990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hThaOiGGglNbfqGc3fLwjm954j6A3isNL94t100F60=;
        b=K+HPLKyhc9lQ26T4N9KLPS1cnMuYb/RGr6wRlfZElk6/NYAYdGX5apuCKZRzcXHG01
         K0BXJ7u5pSzRAdMfeb9HN56oY5/Mr7sTnZHyKaoQXj1hptbjTPmBGy72h/uLibPrFOSB
         AHnOtcoUM8FV1AezsszltX41ekh97xa5W7o+uI0/bNwIGGJr0Ox2ktzj6n/+9aIHGv6w
         WnscxWfInywwTkE8U8dQUm2hEUsWTbjJwz5pqA5EMlGZtdAXs9P5o7sihT3PmOAnngOF
         N94cvxIDhIbLY+BT6725QbpzeGL8q/wYcVqS4LPJ8/jA3Mijrh2n8X4p+QdDbmsgdHrL
         qQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658190; x=1774262990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hThaOiGGglNbfqGc3fLwjm954j6A3isNL94t100F60=;
        b=BVTaJvpXyWIIpLnDuUlJ8q61aEWdgpqbPWnaq6Q72DkFaU8vdQ0TzsBeQvs5VpMGd4
         9BhxDlda+jVT/GGZUJ6BT33DS8NP63CfcdyokgfVcFbti6Kcy1YS96wQMRruhvo9yySp
         2jIl30SOKhS6ujT57TaZUIqxm0FoZWphE3N2pSg3gq4eyJXBqenkZChjvcE7tkTCaCEd
         GBQcKOAfDHM6wcb7/zouOMPzo6eFSPO6FO3PtMtRtx/WkaWRPIjth31SAAY+jjQ3fK0w
         yqZy0M/rAtKjss8FeVKWn0tx6CgmUuo916hETPDOS9L7eVM6qdsoWMYwE4yTE303JlDq
         MC2A==
X-Forwarded-Encrypted: i=1; AJvYcCUDena4d04UsKrIPlDn9566YLmXqLK3zM5P0yRzBwXvMp83Ah70MKfK1ESQS7lnKAefoDw/kvXoDVe2xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1tzMLT1QXmWcxppXZy4ge2OPq8Vs651NTnGsKkwkDKaWnGBf
	ueYUwOk/V+NI6fHqLb8GW7/DF1KNhg2MeP2fOS8Xni6hKwP5rsDNShP163/TbXDaSgGE9eCY/lW
	SgnrWGxaYgwAXpuEdL5Eop2twAtavsGAMkIQYryBg9cEVH2UgtUFJqvNh5v/73HvlCw==
X-Gm-Gg: ATEYQzxWf/xOYegSQN4fMH4FosCzPLD4AOwQW4OGr3Z/Evl9EgRxm8rX2gPgGdwZCtf
	kwZ+RdyvH4lIAVsaywj0OMA+3mKgWu58OXC+cq4APm+3ewQJAOp6oElBYBYz2f+Z8FBU37iSTCV
	W8zPC3ym6XeN13taK+lVJdqGYjWl/TjMdOYaCg1FHXj1ln1O9jz2lZM/lT+rSG6RXzN5zYFT1GP
	iLba+bqYyoR8f9HAOKMOcewrL5ylDG8lpDMG2bcF7DMzJa45a7oooZiKVWbGoJIinmAYdrFIQhc
	nyEZdNIvXVaIBIY7Sv45SIigzUrlatUpGpZsiXWG28E/ZYqxablwClA6gODFwFBi8qdatR0vxzI
	7TeE8AUUfYe9E11LfFHUqBqp8krHwNcP7w0Qpha5Q/mBV3Du9TiqYNSZD6qjLqbB6XLVlN+XbdY
	3idHc=
X-Received: by 2002:a05:620a:444d:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cdb5a83cfdmr1274076685a.4.1773658189656;
        Mon, 16 Mar 2026 03:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cdb5a83cfdmr1274073785a.4.1773658189153;
        Mon, 16 Mar 2026 03:49:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf02b14sm542653166b.51.2026.03.16.03.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:49:48 -0700 (PDT)
Message-ID: <a685b880-0239-4804-adeb-c63204a91142@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:49:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <c59f621f-23a0-4c60-b8e3-5a9082c816e2@linaro.org>
 <wjsnwdyoptrfbmdkqlcepzekfbccv6vsfop5wm37m56rtlevfk@jkbievryoo2j>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wjsnwdyoptrfbmdkqlcepzekfbccv6vsfop5wm37m56rtlevfk@jkbievryoo2j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfXw0xaNM91onAZ
 kz/766PWroWcWXOMW/HDAMdH/gYkfl1o3OtQtVOMAK6k/dbxJAq17FetYAPPr75pl/3SbvbTbnE
 SBUSxxk120TzIiEbqnToJpjLTprSUJVgiCyoepPRzo/FzNUaLUYbi6ej4Tk7gg3sUmmhAn72GxY
 J0nnKOpYz+qjc1bjhOSQdq8aQlQiJO8n6j82V9YF37tMdJ4Xfl8/DV4SUnrWcYhiJ5CeX+BBD/I
 fDJ61VTRAORSSiigYRjUuMjx6p5yThvNvcq0z5O2uRB3k0sIjCgYmUgvkAxBORRwHMCUPFlXji9
 7eAcLCgoy/+V+Jv5EsT1B472Idp11TRFLAdjkKgpnmY+labftGk0NyK8g1Gl7RuGCBAmOjyr93s
 I5dLC+z1WUOczK12XeEvYt3WldbMEd7i17dGDiQS4Bjucv5fJVdzcWml+AbkRt9+BUPzPEngKbz
 fs43IG5wqdnL9qjuS2g==
X-Proofpoint-GUID: 9w8LaY9decNjKrOwe11rR0j1KY_CgeTh
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7e04e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=Rh3If-h6mBuovSfaGQ4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9w8LaY9decNjKrOwe11rR0j1KY_CgeTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55889-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20E3E298486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 3:45 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 03:58:14AM +0200, Vladimir Zapolskiy wrote:
>> On 3/16/26 01:52, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>>> PHY devices.
>>>
>>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>>> have their own pinouts on the SoC as well as their own individual voltage
>>> rails.
>>>
>>> The need to model voltage rails on a per-PHY basis leads us to define
>>> CSIPHY devices as individual nodes.
>>>
>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>
>>> 1. The ability to define on a per-PHY basis voltage rails.
>>> 2. The ability to require those voltage.
>>>
>>> We have had a complete bodge upstream for this where a single set of
>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>
>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
>>>   1 file changed, 133 insertions(+)
>>>
>>> +
>>> +  vdda-0p8-supply:
>>> +    description: Phandle to a 0.8V regulator supply to a PHY.
>>
>> On Hamoa the CSIPHY supply voltage is 0.88-0.92, so it is 0p9 rather than 0p8.
> 
> What is its name in the schematics or in the datasheet?

VDD_A_CSI_n_0P9

so vdda-0p9 seems fitting

Konrad


