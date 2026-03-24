Return-Path: <linux-media+bounces-56805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKlhLTgewmmaZgQAu9opvQ
	(envelope-from <linux-media+bounces-56805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:16:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6673022E5
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CAD530312DE
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BC0239E7E;
	Tue, 24 Mar 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKWhIp53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U007OXlP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A9225B2F4
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329327; cv=none; b=CXNGWp+YBqZfJkNB3I1E052KloKBbSXA5qJqLX3/1SWhSxbV8bJ2NPAXQwXVgil+m9ZGckLwN9SItTcXjksgEwRGo5+sYIaafucByxzSxAVaGre85va7FHFKrErPjhPqwedaioiwQW92izYdMR1PxNGNXhUDTwhF3wOMPa8Lmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329327; c=relaxed/simple;
	bh=mFSN/Scch+iSBbvGZ6JEeuNoSUnRF4fKrQBINnoNrnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZErtY13pVlBv25kfrz+PbAt3xZMRCUdAdvk3HSAEaMFOaoaUEayIHqIr+PTB7NRDdxcnEgJS3JnIohWMkEWvHHsACHJnKyiAhp9UHle/giwwmz4jy91MWogOcF/bV6ePLEZndZzPhtLWtkfwfxnJdXH2ibU4Fa7MtHlCxctn1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKWhIp53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U007OXlP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3b0ok2971813
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=; b=LKWhIp53IeBe/dwx
	4urY0ObI825FLxF3O8dMSncDZ8V/u23uu/QS9JN2JF5rU4YqGKbMGkKzttcR62r3
	br9Jt0Fi/OZpglK5hXZr4uWxhfG8l2OQz35eu4nxVoWpviLjURzHjFYI8W+Bccd3
	mz8mQLFaam8XxQ2FCVfTzykwH0DVQWEt8doRtHz9RFgnC1b8fq2COu4leHEThhLa
	j7n9X/vQ0cTRSeF/DM0EUsY/0DV0jNEVnYsbcbyAl88EHA6y9bS/hD7qcj7K8Nxx
	2ofjNGepfdwaRNWxsNZg/CM/C1MmgxXjKb1owNKz/A50DhIBDYYaz340FYBMDDM8
	kza3ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc45ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecfe69196so65204915ad.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774329325; x=1774934125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=;
        b=U007OXlPdedH4Z54a3RyFfMYQb6jLJc14cdfklwHgIZUwohSs0YH6o5l9/9mSs3vG7
         uFLPSb14DYrw7VlmcSOPT9bcPm9J+9nHVjCfSibU5HSHOCC6cwWipRc5pEP7LsuMonUu
         MgUN/NrdS1/ZDmJogenGjMP+/gzuzavDv0hYdxyiZL1UojIhoBo9yiY4yee+nKov4y+F
         cHcZsHYk42CPB5abSBjLMB4Aa1qyMIjODxyWcuNGUAnAyTJ/cEEYaDBWwPDPKItmVhFd
         Qrw52Ri4jk9o4JSxyowdZBN98Bq5cd1wVhvsfPCleo+rgf0rF103x/UBGx2YePqpdZa6
         814g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329325; x=1774934125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=;
        b=KIfw9qb+tuggn1u7NPgo9AcI5Xn7OB/G1FBezPEnLac1gzimuU7exGiabaGoAsGnLm
         Z5XDAJo5cbG+i6SR6p7YcY6npLeLvgXJnd+1o7rHWVMu6+AvcBjNWprm9/kWL9uwCvqI
         VZIm9RFqo5gbXEm75hJW7Cxar8AbPr2Ubot8+HFDjsX2Q0dUDJ9EjjGOHR0DUuHeP3zs
         frpIQoj83p2Cy4PkPQo1qyYHXndpetlcF6FOQ1LGqbs1YSMkutt1fCs60WIY10PB567H
         qSmqwSD+7Z0H63M9HpFD/OZO63n2wHeH/U2cSOvy+l7Qy6NsI7YRoRUMRl2PiXaxRSpE
         WOjg==
X-Forwarded-Encrypted: i=1; AJvYcCX3V+N3V4pFoLNQtM2pxrD21MZKyNB3g8WjqSUBo0PulKCruKwv5ftnTX3VBRHGys+oUAqOhgkjb9qjaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp8PTdeCvyeWj3uMfuo6aVK8DxW8wR4KpMzcr/FIQvRfv1PRtJ
	oTd5xz9nKoVolU9N17zW+fl0hLRLz6x3bBFhrFVCIydXpUGuC/bT8sbpXkeE7RiVy+nBVhFthgs
	IEx0faVxt4Z5zebQr9B9okw/nsehowX1URzSiNoh271/AHk5vvfC0nmgLq/Syru4CAw==
X-Gm-Gg: ATEYQzw44P84wxLrwnddzUSpZz3Eh3zZgQu/AZCwxr73R6fsAPfCJWl0CRS+uiyF9sV
	tGNhU/mtnG2XWADeKc5j0FtSgwU/d5wydvIYNpmP1+QDNv2dE6Sq5bYTi3PEosJS6qrFoH3pRju
	aVnDWTiwRU9zPd2JlnPyXDPv5g0QZ121D46iw2ur3yo9cewj7KDS5CStLmk9x1FIxXwu/AOzwfs
	sAl1g5PKMfPGd3Whm3OPNfdCCNqLzgb8Xtm8G5p8tMjSFjJ6MXS+WTYDN8LEWyMDIDEmJ/+3zsk
	cwsG+wvQFGqrbuWcNBy3NjT4XhSJ95SJbC5APsaKWGoqc1YEAdcgLNJDqvm0Lx+QBzjuFKxBcC/
	2sWQH6nL9RXylsQyRAIWCnBYyCbmgUM9I0Rt/40j6g50MCptO3ADukA==
X-Received: by 2002:a17:902:d48a:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b08277cae4mr133308405ad.26.1774329324515;
        Mon, 23 Mar 2026 22:15:24 -0700 (PDT)
X-Received: by 2002:a17:902:d48a:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b08277cae4mr133308175ad.26.1774329323989;
        Mon, 23 Mar 2026 22:15:23 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c74dsm174187005ad.62.2026.03.23.22.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:15:23 -0700 (PDT)
Message-ID: <9fa40f68-54f4-d684-9e80-511c1ab230f2@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:45:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c21ded cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dE1MpONsbtOZy1RxgbwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: H93dg6DYFdCaZXHmQTUzQDizV5HT384-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0MiBTYWx0ZWRfXyAj2Y7D5nX1A
 /vnIxYxj386wKNMxP6g970/08DmJ2oe77wX5Y21EuN2sjkNAIUhpGQrnLfnzCrzc5LHd3PtGctg
 +q40/YgbW54aTsbv3AilH1f2qZdLbNLorXvRVOr5PX7oOAfVRmyHPVCxPewkWKvefPBzL8drbt5
 C6Au8vAsnvAC2p0RDyTIc3YySfqbM3dlC96Mf1PsW7xhdNkUrypPZ+hQAkQWhXC+Oy+RxJs+fSv
 55zRusVQGnuaZRZsLJYsLH31Rqw/WeIK6C4as+89qy/i1nX+1F9tsxETo00QatzK2BndfGIVIqv
 qGWGi/5EmHo3WRiRR/vr3tgSGEoF23LB1vMbSzNtxT7ZoyzywygPqlIhVQOUzWVxeYripxkwMyO
 N9/Ij3K9U3Kbfudi+SB85uF7yPK7gganoTaZAGAcZgj0NDQ3uGrSn2EUbVB5eFeaVA5dBi9um/p
 F7HYQvaVs5YrDbrNJzw==
X-Proofpoint-ORIG-GUID: H93dg6DYFdCaZXHmQTUzQDizV5HT384-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240042
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56805-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D6673022E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 6:49 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>  7 files changed, 38 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

