Return-Path: <linux-media+bounces-56744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNRpIuBQwWnLSAQAu9opvQ
	(envelope-from <linux-media+bounces-56744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:40:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2203E2F4F5E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F9E6305DAAB
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC213AD525;
	Mon, 23 Mar 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCEqIwQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq7usdm4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C535F5E2
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275971; cv=none; b=cEp0PKzQ+yMOEP0pEEr4Uv71VfjJIfxetbeGOktNysNYfXM1YeosYSBl42H/c3HZYGdK/a6t85oOm8gClnkedNWj/zyUscoLhvfY6anMaGm2OIikeABZnebVWUm3YLt8pbXKfR6elSbCBqUakNZvtogwsDMxZ9vmIxlPXjhbW1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275971; c=relaxed/simple;
	bh=pqVgpg17eJHPRS2YVvj9etxBbvKB5WNQ8xPwA2cEbD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpIJGj+swe2iJPtlHSQ3Fciw/VKj3ueeMVy+ULU/GxGApn7oAnkrNTFXCN/QnfZIJnZj5xghJy2Mn3/w+jzBQGuut7lZVyo6MLfZA58jrkJAM2Fx8ChGfifwdxiCUW8xkgpCVUOp6cKDOFG+pXZlGXX3T70tB5GoCOHt7k6W1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCEqIwQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq7usdm4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDTdl81176062
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=; b=FCEqIwQUe0G4B+4e
	zycwwl8D0aVorIfQgKi2f+U0Ie1Rsmy8mJcPQv9ta1zUjIRobIXPRX1FB+je6tFy
	lWD6YNGpm4ryD0UGclb1tO9bnvUzmsbC04jtc8zf25QkqKIzZMGBKlIgof23JVU5
	sSpH/Ka9AkItoR6abfTE9BQG/H6Q0/w+x+D1FGGxi7pQIk803hOvATDR/hHCEi9f
	P+qb9sVlsJrjZgOZiR/TEEvqsf79rCjhVZjXMDlHCecg6nKC8iaSqLczdOMn24Xx
	/eyehRrNiyyTuCjELGNSwoRzYFbrrH8hkneo/UREupc1mFc4RoKAp1GjUlNbF9ZO
	HLT3fA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0874r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:26:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-602845e6661so456911137.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275969; x=1774880769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=;
        b=Vq7usdm4bMsTEYVm3m7LkhBZEnwPZnx61MlqsgbqzQQe3ArvwXcPgvidhWrEhNafOn
         zCnW31yxuDD8KDZhfFbl6X0KBSAtwMeehV4txMQrJDDqBdg9SXGt26ItvC0wRkY4xCDj
         UVjlOmtA4Tj5uvLBo0DYt/QEG76+ga+4JytSUkfs96xas+20w+4VParhfjW77n0P5Dzh
         wr8OaUFAhBDDq5Sj3V2tiMJF5ux6nyy4JJtvYWxMXGiC5x2H3M+3mr2fCF2IG5/JEmD/
         iQEZKU5URwUPfyXNNyV7T+eFcyT2DM93iczruPx78bk1ObbuxRcOaCfbSgeBCJ9i44Zr
         JdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275969; x=1774880769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=;
        b=S6L94nQX0mLL5UJP40Ld/sksdHuE4JTFPxadwmWeR717oNNXN3HzgMkFii2yfg9hJ+
         g2By86Y1+vFROxj9JdzlbwNmUyNUVgvnITzzk2/atioLSFZSZLIq+pNk9+2qYpih6YUK
         jbiIwaNlSE0JTJNBz+FBCRGLIUcc4lophZrzEac79xlWL+y4YnfWJ3wQPbfjhUC1EDIR
         ReHfrsYcdure0pOcfWMXPy7jITtLTI1shU5fV17m2OzAKjX4bDDjXDlrT/PMss4euCJD
         4RpvisrKfvj8Su5Z9aL77DOvLdT88lu4rY9NZvbGP5TVWuEzdWuPJkEtVsL5HvcwXnXp
         QncA==
X-Forwarded-Encrypted: i=1; AJvYcCUFBNpJZkiOafDKk+rhJzEj21Oeoex7+YgT+5aFozsFUhKKD7PrB9K9ZyuC8yLeEnUuaNK9xSjUQC+wGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCK3E/TmoC2ithGhCR73omLxonuEfd3eWBrbynDwbbT5qsmdAS
	xNpLT8Fv+TD7DQWvcbj7waK4EN5fHJHFxPsu00V1QAy7qdj2V9lKLIAje0W2mcUvB2xXXuql+Rr
	bDZFfJ75z43ouTW6dr2tFHHYwZnR7/FjoHgnEyxlxGohuOmJRGOt8ZvYJowVpJYh+Hw==
X-Gm-Gg: ATEYQzyxFwWOGEFIeDryY0PU3fESCD9VaWBxhJwVInH9kKLumDaMFwZnzJtEcjJy3m9
	vn2jnLHXVsJ/F9YtKTv/O95ACxGRNBYyGDI2NTYz09QO9tefLp9xDp1LkemsCmxjGJXTEQ8iXuF
	q8S0BRLOQotLvzh+zeIGFyFyNJqUS4ar2DaxrgdW5m9QR1lWkuxw8OgLzM6Yq9aMf7adepxQmn6
	eVLAZT8qd78FoDONN/MhkRXI4t/s/Ep0t2Wx/KM+HhUnecZOg6xf9kYnbL4YagcPJEpDgPZ3taH
	MRmtzs9PTvJMWLlXVO+1Q7l/ZWv+zSZAMtMDATHl006dw35HFYS8um95FDem3VTNDZvzHuGa1NZ
	74EQUqRwsQ8M/GQ5/U0XC1gVgGYcpab/7fTpWVchFzuaT7fJ40T5qGEtDCMZO/l5H5qGr8u5Ymn
	yxreU=
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2933691137.3.1774275968516;
        Mon, 23 Mar 2026 07:26:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2933671137.3.1774275967928;
        Mon, 23 Mar 2026 07:26:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm398492366b.31.2026.03.23.07.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:26:07 -0700 (PDT)
Message-ID: <2e55bdc3-54a1-4f18-b9ad-fe03f21fc4da@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:26:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
To: Krzysztof Kozlowski <krzk@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-3-sumit.garg@kernel.org>
 <28d63822-f191-400a-8005-5185dd480dbb@kernel.org>
 <acE-kAi2tkPh2qie@sumit-xelite>
 <5c5b49aa-7819-44c6-b5f7-19ec780d73fa@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c5b49aa-7819-44c6-b5f7-19ec780d73fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c14d81 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RZWjG5IIt-miciyuqOEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: o9xJOJFl2yA_RnQOlOG23HoC6SPFQKuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMSBTYWx0ZWRfXw5fAtDasxNcz
 Y4sJpPmY+4IlzNg7h4FOqwbHjX7vnbi7UN7jZzLsY8li/Mgxmvgyb/vSDvjS/NAFX6yyHF95CKE
 qBj7zIpma+UlJ9YxTv4bv/+4bwsGhz1+n1AZ0RFCI6UgRggaqa3+nfuInEAdF8Ao6BKrDy3rRCe
 aoXhbEdEePILxXkgibbxMzHNFFO4dPIMqlVkjTk1EUCP3X11Sk5QQmZR07YsnamlLZK17aPqZ1b
 SnlWI2IA8aN/qUyeELRS1PzFhmw0P954LrssCRwgIvu42AaCv/EsKbSsl7uZrrKEv1873v8BszE
 g2BSGYTnIFhYluaPPRXsnpLB8ekiAhQ0BLF6BUPCF1XbwqMVyFubZ+CDtblUkpLTjIb0uZFfDCZ
 GPAsNy+TSDND489JjwsvneasBphrdsRYOUTef/nBm8acAiV0fVzsioPu/X8L5o0xoHrP/pJC9QM
 r32z5pKmt++08gV1n5A==
X-Proofpoint-GUID: o9xJOJFl2yA_RnQOlOG23HoC6SPFQKuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-56744-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2203E2F4F5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 3:19 PM, Krzysztof Kozlowski wrote:
> On 23/03/2026 14:22, Sumit Garg wrote:
>> On Mon, Mar 16, 2026 at 08:51:16AM +0100, Krzysztof Kozlowski wrote:
>>> On 12/03/2026 07:27, Sumit Garg wrote:
>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>
>>>> Qcom platforms has the legacy of using non-standard SCM calls
>>>> splintered over the various kernel drivers. These SCM calls aren't
>>>> compliant with the standard SMC calling conventions which is a
>>>> prerequisite to enable migration to the FF-A specifications from Arm.
>>>>
>>>> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
>>>> support these non-standard SCM calls. And even for newer architectures
>>>> with S-EL2 and Hafnium support, QTEE won't be able to support SCM
>>>> calls either with FF-A requirements coming in. And with both OP-TEE
>>>> and QTEE drivers well integrated in the TEE subsystem, it makes further
>>>> sense to reuse the TEE bus client drivers infrastructure.
>>>>
>>>> The added benefit of TEE bus infrastructure is that there is support
>>>> for discoverable/enumerable services. With that client drivers don't
>>>> have to manually invoke a special SCM call to know the service status.
>>>>
>>>> So enable the generic Peripheral Authentication Service (PAS) provided
>>>> by the firmware. It acts as the common layer with different TZ
>>>> backends plugged in whether it's an SCM implementation or a proper
>>>> TEE bus based PAS service implementation.
>>>>
>>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> ---
>>>>  drivers/firmware/qcom/Kconfig          |   8 +
>>>>  drivers/firmware/qcom/Makefile         |   1 +
>>>>  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
>>>>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>>>>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>>>>  5 files changed, 401 insertions(+)
>>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>>>>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
>>>>
>>>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>>>> index b477d54b495a..8653639d06db 100644
>>>> --- a/drivers/firmware/qcom/Kconfig
>>>> +++ b/drivers/firmware/qcom/Kconfig
>>>> @@ -6,6 +6,14 @@
>>>>  
>>>>  menu "Qualcomm firmware drivers"
>>>>  
>>>> +config QCOM_PAS
>>>> +	tristate
>>>> +	help
>>>> +	  Enable the generic Peripheral Authentication Service (PAS) provided
>>>> +	  by the firmware. It acts as the common layer with different TZ
>>>> +	  backends plugged in whether it's an SCM implementation or a proper
>>>> +	  TEE bus based PAS service implementation.
>>>> +
>>>>  config QCOM_SCM
>>>>  	select QCOM_TZMEM
>>>>  	tristate
>>>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>>>> index 0be40a1abc13..dc5ab45f906a 100644
>>>> --- a/drivers/firmware/qcom/Makefile
>>>> +++ b/drivers/firmware/qcom/Makefile
>>>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>>>> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>>>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>>>> new file mode 100644
>>>> index 000000000000..beb1bae55546
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/qcom/qcom_pas.c
>>>> @@ -0,0 +1,298 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <linux/device/devres.h>
>>>> +#include <linux/firmware/qcom/qcom_pas.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +
>>>> +#include "qcom_pas.h"
>>>> +
>>>> +struct qcom_pas_ops *ops_ptr;
>>>
>>> Same comment as before. Don't create singletons. And for sure not global
>>> ones.
>>
>> This pattern has been carried from the PAS API contract among kernel
>> clients and the SCM PAS service earlier. The clients don't hold a
>> reference to the PAS data like underlying platform or TEE device etc.
>> Hence the need to have a global data pointer to hold reference to the
>> ops data structure registered by drivers having different lifetime of
>> devices. Also, the PAS APIs can be called from very different client
>> driver contexts.
>>
>> Surely, avoiding global data is always better given a better alternative
>> is there. Do you have any better alternative proposal here?
> 
> Why it cannot be part of the context?
> 
> Look at your API, e.g.:
> qcom_pas_init_image(). It takes struct qcom_pas_context which should
> contain the ops.

This would make the client have to select the ops. The whole point is to
avoid that, since the client has no clue (and is supposed not to have any).

What Sumit does is to bind the ops based on the runtime-discovered
mechanism (which needs to only happen once, given we're not replacing the
TZ at runtime)

Konrad

