Return-Path: <linux-media+bounces-67430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gg2YMdSZVGp9oAMAu9opvQ
	(envelope-from <linux-media+bounces-67430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:55:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B445748698
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:55:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V6ObucGp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LXQVfFpW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67430-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67430-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52B3F3037460
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B745E396B68;
	Mon, 13 Jul 2026 07:50:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933073932F6
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:50:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929033; cv=none; b=UclwLb/uUkzCVB603KTT5xwaHEBnLj3BttnzYDwl+3k/ssegSWZrW+zJdudmrZhVsO+rDR/OBAT+RTYXX5opLC3xYFIp/s3KlaS06OA6vnnJwr6u29cXjJMw/AlNvT2XSsXJiUGWKIwHyQCLcUXXfVSorj/CPgircW38pIzm4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929033; c=relaxed/simple;
	bh=9WSmn/b6XZ/rKpFHFanb6R/3wcH1iGeQ0twNm4G+Y+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2VVcpPMG0sjl1f9fQ42JgpX0KnX4MVLAiTMt6gjytg6uNJfJqziXgUfNvoroA1CX8nwgXamRAx8WM4F23WGsHgERxOaJu+DE7rRCQwemNuLIOA3ssSTg0IXiHCc9fpi4NTbpeINXvCTEtOSsorZ21gO22jSIxaj4c9pAHIb5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6ObucGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXQVfFpW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NuDR568086
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4o+jialbkoqpluPCQl34rTfle13EcBIZSENOrUkTUo=; b=V6ObucGpHLDK7H8+
	so3ZIEcBmfZtP022vV8IlGOQ6QWtspPWIfpEjWIcG49KAXS0Pe2juE6s4YJFmZcM
	gyJKkY4QKmqwkZVNAj7qecG6xlKRDnHRV+RygsSGDw1ty+s1ABDjizgNiasmxVGy
	kSszLOh/8/CHhSfrqQxDhi8brpSV0mfPPQ1sbx9sOU+I+HbMlrPSUKO0CCvXKOWn
	xe7axzRJ5liAWmtVQi8Hzj05P7LkKAygXiLCkViFkrQ6vGa8+8BGUN7TYytHYfxX
	5/4hwpCeB+zRxndYe19A8PNUR3s3Nnj5ZAoAjV4QJrTqhksQCttvLPejboD0aW/m
	PVVTKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915215-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:50:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso50061571cf.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 00:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929028; x=1784533828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4o+jialbkoqpluPCQl34rTfle13EcBIZSENOrUkTUo=;
        b=LXQVfFpWd+iV4pXKRmNw3SDLUPc3Io/Puaxk+uw4vcVAVujOxaDUR7Di2qcegqR1gG
         GgUSRPtz/skUc96w04TcHcQelyk9+FwH1kCGBJKER5RS2Sfa3WYxbM9a9qtf+yHCEXIs
         Zat8nRpdqeDpqxmITwxBJyvDMhzKhdLKYRF7SFO2z3Z1R/Wdx71MxRODOmEpfzpfRVfd
         XcJfIuX4h1bbaaUCWXjGBd2XBpUvQJkSCTPz+IKgGT7aH2M8VrJ5YFEFB0pLZPSchcPa
         9J6IRkTWWLoxVvfVupQ9T0RwcUIgu0JS/Xq6NJaVEbVx5flrgnmpn8x2JsgO9GYqhf00
         GAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929028; x=1784533828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4o+jialbkoqpluPCQl34rTfle13EcBIZSENOrUkTUo=;
        b=Ie8ti0fudeIQCJMcBWfB8jQnyMg7czqVrgJpYaJ4rUQlq2KrmqRs8oLlyxV89R94Xe
         fwHnmeg9M0bspKum7yQDQWNB3KsgruqaMcYYKqitNiJhUBMlpJaqmTPcDcx5pvrVN7uC
         HCovvQ7mOK5+a8dBxnb9oRBJikUHSR9NG4qvSnDHYgGbfX26Z0tCf9kOxUpqjW3mhmj7
         hkvgwg8WhI0VpahRd1a7Jw7JAwlZEHN6WYCl750dr0pbMUXwqwlJqXPqIIQMuz8vv7bB
         Jf3/GehwM3sWl/jW2get7QrF5kgaf9Vdt3aYWoOVXIvtjCbmCWhAmJZtAmtpisC3BiQ0
         bJtg==
X-Gm-Message-State: AOJu0Yz2AFw+ExodUkbCU6AbgQyyfM4HxePXAbtQsBozY21+Cd+1wQ6i
	vZw9EVMHjkHD4QTnGG4oSRF75wzX1zlWwwz09Z2GioYI8zvJQ7cb0xBSw9ATAiQsJ29HM+8xsrv
	KmqlC3FNYXyMywD/5RQp5SEb6Et62LKSVslAJJ+woME4SXvqJ1/1JcpObjxpexduwX0IOITuXcw
	==
X-Gm-Gg: AfdE7cnWG5qqZZ94GBJQPgx7AMz7q9LIsj1wN/shn83QAw/hBJ8WRWV4bwZmYhiLXdh
	7B5n3a1OMyAgs7BNXo3tWfObux6jcANYfcQ99OnF0a8ENvHSbVIz/dDptoNhggsfnpD1xLzgDFh
	cxBErxkWZ2jRWhGVbKs2TRiu17wvKNiZF9Z4ANTY2gos4YZl6WesW4JJYxhWkI12l+qHDora5Il
	LAjrWiE1vZ8L79N3IawQblO6FlQ1dFTFhvgiVGuUlNBWuCTUZK7LS10ZeGLQd1ZnNkKg3TtGMEF
	wVmWwJnH7/DMhA9/5EqvQ5n+nE4F1bpuW7b8l26JcQ4TzttQyDvXBXQklhopqvihIQjqPVkbGmN
	gJv3Oy+aopNNstit/BkryBhctUjK1VcbXvQPuawTIeO8=
X-Received: by 2002:a05:622a:5592:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51cbf381941mr79733601cf.88.1783929028119;
        Mon, 13 Jul 2026 00:50:28 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51cbf381941mr79733471cf.88.1783929027713;
        Mon, 13 Jul 2026 00:50:27 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm853021066b.29.2026.07.13.00.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:50:26 -0700 (PDT)
Message-ID: <d25a574d-35fc-4a68-85bf-ae1aaccc2154@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:50:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
 <20260613-eccentric-statuesque-centipede-5f8d8a@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260613-eccentric-statuesque-centipede-5f8d8a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a5498c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jsUs_A-8PPVw6gTEMXwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfXzmjuVXWmTTpc
 yJa0maLa0S9jcVcxEbvSjn+yPtx3/VVD2D6rvrx1gm8WHQpa9Cmv2Vgzn+ERbjQlnXe6CZmrzWL
 pTdxc8nhDnUkVmt1BMnyX5Bdhowbaq0=
X-Proofpoint-GUID: avcd4TWEdpMDKs7JmIQ7Ebm7tQPjLY4z
X-Proofpoint-ORIG-GUID: avcd4TWEdpMDKs7JmIQ7Ebm7tQPjLY4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX8jRt6L28Y+Wf
 x1+EpZll+5mqgjZPXr1k7PNxaOP9BTWtZub8pZWyXUROOEaJUhTLk411z2BrsQAjUf0de7LDTIV
 D329v24euZvLWvr0tkfKuLKmk3dVhU+OE75u/Zu0bQM95TwWrpg/0lrNJsr2dLLo5cbOUs6ZD2v
 ZZQvH6Qgf2IoQBKYTx+0yWfeSQOK10Bk+eWXnvzLy/+DnBjVZq/OAhV0usAqCoEupU1ZHjmW75g
 wd3dSW8t9jQ5HBJakW4AWN/cyEbdzc9qciUyARDRUMLfFQgRVPgXzN/zwCpjp7AeRgtNDq3qdDc
 CejVTLoru6YfM7RmxBmJltpIIPOfUu1xWztQhrnRXE+rWi/ScdVmPI6Q4xc1pd2UhA4PiFs39Ax
 AYxNJFWNVyXjlufVHuXmuSt8e03ktbE9GHGmsU3tBeY7ExXZJLapnuOwukoz5SGjV0wae344Hsk
 +AfhU9Apu/1OnVswEEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67430-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B445748698

On 6/13/2026 9:43 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 10:44:17PM +0300, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> Initial support in this series targets SM8250, QCM6490, and SM8550
>> class platforms.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/Kconfig           |    1 +
>>   drivers/media/platform/qcom/Makefile          |    1 +
>>   drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
>>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
>>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
>>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
>>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
>>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>>   16 files changed, 4848 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>>   create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
>>
>> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
>> index 4f4d3a68e6e5..f33d53a754a0 100644
>> --- a/drivers/media/platform/qcom/Kconfig
>> +++ b/drivers/media/platform/qcom/Kconfig
>> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>>   source "drivers/media/platform/qcom/camss/Kconfig"
>>   source "drivers/media/platform/qcom/iris/Kconfig"
>>   source "drivers/media/platform/qcom/venus/Kconfig"
>> +source "drivers/media/platform/qcom/jpeg/Kconfig"
>> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
>> index ea2221a202c0..30c94949e9de 100644
>> --- a/drivers/media/platform/qcom/Makefile
>> +++ b/drivers/media/platform/qcom/Makefile
>> @@ -2,3 +2,4 @@
>>   obj-y += camss/
>>   obj-y += iris/
>>   obj-y += venus/
>> +obj-y += jpeg/
> 
> Same comments.
> 
> It seems you ignored entire v1 review and just ask us to do the same
> work twice.
> 
> NAK, please address review you received.
> 
> Best regards,
> Krzysztof
> 
Acknowledged. v5 addresses all driver comments from Frank Li:
- __maybe_unused removed
- RUNTIME_PM_OPS macro used
- devm_mutex_init() with return value check
- platform_set_drvdata() moved earlier
- pm_ptr() used

Additional items addressed in v5: mod_devicetable.h removed,
defs.h cleaned up, usage examples removed from commit message.

Best regards,
Atanas

