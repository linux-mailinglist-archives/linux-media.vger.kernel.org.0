Return-Path: <linux-media+bounces-64393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rJtmNzMtKWoJSAMAu9opvQ
	(envelope-from <linux-media+bounces-64393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:24:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE9667CCA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Olvl/u8X";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fL4w8JL8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64393-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64393-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AD9C30F8BE3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7253BB665;
	Wed, 10 Jun 2026 09:15:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916B3D75B8
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:15:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082936; cv=none; b=dZubEoWsLjK8gRxk6BBRtTNqQEzzq/piErgAVIDsrI3e6HqPFhlIJfLUJA5utzgombXnM8so+LUuK1/rzZI0m7Cs7RnOLoklkWOEwAUf01PIYIzzQdyR9qW4End7th3Z8aqxXn25DhGmXqPDffnJx84XdjjUJR+2bor0Wg9HR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082936; c=relaxed/simple;
	bh=hZcomtwpii664f+hVQ0Lm90qeu1yAe9XyRqvPFvR/w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8RIlasikN0gkxHpI4TjY1XjjTwQg88uz2h2BEg2YrO/CKp39sNrNy7mmh3pphqi9n2qffFrWO0CAkVwDIHwa9O9SdCDi62S51+PXPVYB/FSMvtw9UF8XWhrb0rDRqaMjQYoRtpKHBhmLnjD+DWtw46Hoad32Y5xZ61l3J4A+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olvl/u8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL4w8JL8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iWax904112
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=; b=Olvl/u8Xo1jmNCw2
	NyNNxc4/0YW99yeRg3V3+aYudCag50TDO4JaFAFSHtrxTJI4PVtMDdXGCfkeMHWZ
	cgxwQtd/i5iiBHftVlJw/17OhciOAnTBGvkzAzMMZRqp97tEzwPpAEuXeYPR/se9
	kugLBSa5V4VbwHMRbtqvQRzShtFLfXopvK3a5lkDpNaz3TbjwAjZEAdrZprh0qd6
	/nBj0O/meHD3eye1jCdR9x8zBDdqc+A4VqAgYmNs829dstfsZ2+GuzJqFAWbHQuF
	XrMjuMVi5O/j5bvQEu2slN6rU/B/O7pXmxy2R6POouIlai1FKEeJzKA+GmBvdnVL
	y5Rb5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket7m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:15:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so128200285a.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082932; x=1781687732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=;
        b=fL4w8JL8zy7jzglE3TaNFsi3jc8q6NO4rKjH92bug7tm9puaGHg2K4qVafg8qtCegB
         MVtBEjcz3xFOr6lKuQMPy3a1GRVVkWbz5JM18inU+pA3cxXcQxK/hST+vbU+CyPbjEE1
         xq8c36rzMtVrfsDT6CCvXv1U6CkAXR/0Z+XYZTq7UvtlcJOa8wyXJN+nB0y393xgWEc5
         8zaSg4FVEwypO9U3gpD5rNdgMaoOYDlxDGxjoJjqe7kWDljCp7xN9994A1I0XqP2Yc4/
         Tg7RMSR/McKU3347j2RkeLdSFVmhwGzsUMMeDckbfvlUUCUedql72m0QU3MGIGmXvNjH
         CMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082932; x=1781687732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=;
        b=oh1MACRDfO2Y2/XQ8dGCIj+lt10cP6xGFI4VdWFvF9Zc0weG7rRV7q9XHSf+H0RQ8M
         0P3xg18zpuQn2ijl04Hv3z92QJglCtowDP8uiCAGxwc5mjBvrYraIwa9CzTfl/L1ldxU
         dTVvlb0nkO0LM2EesE7aOqDF/CKpnXj0qUVsfeYuusNSRi7Fnc1xoaqthYefMHzEweRk
         RCYAsB37dDzjptNBpUIrC6a5LjFLX5HksFxcodrYQJH3MYz/Q2Y0+t35/257dUs2yjTc
         NVe1jF6JnW91AMACk30fBZ4uqBLOjgynKqBEuxvj3W4IJrPXlCqARGWuaFt/rklEzCD6
         h6JA==
X-Forwarded-Encrypted: i=1; AFNElJ+UuI7WcW82W7OW6TqjUgrSZHOqaiHGpedH2RRoI6FykfXp9esgztJ76Po/MeXR6rG/6ZinyOvi1NQ8dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGXtAgu1OS5Qh0luXWaQNhar8ih4zMujgyGXsZN/ILdgWZb6Mw
	LkywnKq7Q96XOP/UWXY+wlFqyUIAcRAN//dwj3I5EYie9lNCeMzzOuuPxeboOXP0NZpTBly5Yhh
	TNZ2YkHyfXmmV0h46zFkJdjAnyAnPivDXHoMXfQfSs+16Foy61YiY9UrQYzfasob5YQgostvyRg
	==
X-Gm-Gg: Acq92OEnEH+630nmRBvK2qnsffq/qn2KNIs3bisYx2hfYeWzD4bBp2MndDid4Lu9Vdr
	Dsr5q8ZEz8dBuGuG6tGpTX8fTe4/zqWKZG+kveaTV9iy7Lmts6SetgDF6+ARhNV4pC8w4PKVET+
	Rst130SdqrcnQKn4vN44dBjs/1qHbRboqk3EumDEMqEU+FyuCTFF83mVDquKJ5B92McrGWHa2HV
	5LWksD7hjFuxed6xb/BY2RxhQPIrUKf2a3WJvhmeMwfryQmmZ0lbo1bDhh+qklJvwRQqP2B5MSs
	MnJAAM0Mzp3SpTJ6wPCPu9wyRJdjmlDP7m08/oqxhuFGHvX8s/UPdaOLZdJvGP6CqV5kB1xAHnj
	esBtrgeYaaCfsyTzwUDw9gNFwK9fDMUXbTumRTJa1rUpF0whj3ORKTOre
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2089297985a.1.1781082931824;
        Wed, 10 Jun 2026 02:15:31 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2089295285a.1.1781082931286;
        Wed, 10 Jun 2026 02:15:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm1153176266b.4.2026.06.10.02.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:15:30 -0700 (PDT)
Message-ID: <6c79a38b-1ffd-4693-b54d-78be24a51966@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NyBTYWx0ZWRfXxczSNetk2sRN
 E4HDnG2gwuRzyH8zQg1yj0gRusHKzL3tEwq874xBKrNKH/2W5V//CGzhfBV/qClHH0za4r1GhfH
 kjvU+SEA+HC5TmXIErUPMeyS6mbAu98X64y6Zv1v0n6X9pyaSFCC4hg/4JCaop4ahIGdvMS/yQD
 lyr5HywSxuidvREkyaVjYTdCXgdIgyzdey6y47GMAUcS2cdMjM/Vn45Ec0muaaDYPK+Z6bDFfDT
 5rK6XQCv9FyVTzNp2DB+gv6VhrlKO2YbY2NiRhN0kLPBawafHqbvvGI/BPOoVHvwQf/dZUhubWg
 6LcEdT1FMVvFucW84XGYs4lSCb/PBNhlz/A+EW1m6Exm4CzrlwV8Zh+ODc5fq+kIj7HVQ/+POM7
 AKfotxsvpZ+6onYBsftiu+WU0jG6c39chVa5zbca2H644gNQE+AlUqp0wzZePZr+0p70gc/bmW+
 G/HDvgQqIRgLJ2TUNdg==
X-Proofpoint-ORIG-GUID: KFScalf2_J1LTabwz1GXrIIFGlwsBXdZ
X-Proofpoint-GUID: KFScalf2_J1LTabwz1GXrIIFGlwsBXdZ
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a292b34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gZ9Hao4PvtIMPGLi9fIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64393-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54AE9667CCA

On 6/9/26 6:15 PM, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

