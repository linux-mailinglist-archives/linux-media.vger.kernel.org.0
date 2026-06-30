Return-Path: <linux-media+bounces-66115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UjfhOmDQQ2p1jAoAu9opvQ
	(envelope-from <linux-media+bounces-66115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:19:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC76E5561
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="IQu0N08/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DtcqYf58;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66115-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66115-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E38B53059D41
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC91040DFBD;
	Tue, 30 Jun 2026 14:14:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55F305E3B
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 14:14:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828863; cv=none; b=GQ93LhW6gyZ7q/THMt2JRrtbIiCirhgL4rYuEHqY0amp3x1kXVjgy+/RyrbzGVCJKoMvonRjLBeBeMS/T+TkxTgIl06FGkubRcL9mHo/dKnpQgaxbXL0YEhEfWggCiud/zUpm26RzVWaD4JyIzvTgGeDCiNkwsawCsykNrdzKHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828863; c=relaxed/simple;
	bh=HW3CYhqWeEEMA358JGRSoW8hUFjA38VepKRLB7WMZ6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UO1YSsK/gn1KOb2QOc41eAbE0B9xQ1fgYc+rWWLEWgoxlBeHTtCAdZDkddM6pv3THcseTBXJTVpppdNSNvBQ4E70vBGISfNBX99ENh4ky0spoK2VprDGsQUExnBAA2YQvK0bq0We0TY28GZPSHQ5lTcqqAu6/JWKD2lXQaU2aeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQu0N08/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtcqYf58; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFv42185858
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 14:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6x4DFcKSu2it/wMBG0l1xyIwWIgMI9J+8HeQgkt9huI=; b=IQu0N08/qLo+qkr4
	nbH32mkkxTBjoVZJA5gk4P10DoDuOIbZJP8PQYgknDtdsN7fNeyOwDJYlLd4/uP6
	WXCEhR4O6Fm7LlM5Aty+vdarGCzxZtpL6IqS83ttndQOwqjO2z87eB/NWunF0BSR
	qWpEMX5gGbQv9+8ZhGSdyEmOAR3a+uhVjqt2p1cym8COoRJYD3ekWxf2ZlGskDpl
	94Tl6Lz08cq5an7xjkR4h1RKy3UQBgNddDXwZj26kqs88e3W17VJn051VjxWRieV
	W1C/FBKzHGIxJcY+WDWZESCbp8RihsHrEa8f1nkSC63BVBFSSKFozDkGzk1hZnSW
	LMYulg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862mvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 14:14:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737d34a0dc8so3353740137.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828859; x=1783433659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6x4DFcKSu2it/wMBG0l1xyIwWIgMI9J+8HeQgkt9huI=;
        b=DtcqYf58xIMM/b3E+F7JuljTT7KBqoF2ZGXiraZx0AaLD1eE4wFj4OQ8Ot/7CLXM3Q
         OnuoBSTCIJhm0Z3N51z60ViLaqOsuV3Epz/VV0EZG4k01ViFz5VNRznhHB0YRnj2rxTM
         fW3HtUZH1dt6yuwp22w4MjX+VpNih6Z2uJQGnNrA/2gMYHTrQOrwfZuTB/RcQhThVW9g
         329G2dwwFYe/VFGX9B9A35dyKFxZyWmRQaCj9vhi0gHYPih1Q0lEV7vaTEyV6AELdTMd
         BQUn3K/kNTDKnt4ivMHolV2wMqCfuBUUsO/Pf35kG7w5BqfWDawDnvmF16Se/Zlu6qeE
         TsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828859; x=1783433659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x4DFcKSu2it/wMBG0l1xyIwWIgMI9J+8HeQgkt9huI=;
        b=C0e5XqNR5oXMtQa4fkDUKoQj5zx8sLNCvlcVakqN7AIdnK/Iy6+3dFBlgooVCuOPf6
         1MJolYbMlwaPCRBrh9kzv9TMGrcTwoQnkBUxC2lDYjdX0b2O5E5JD0fUrafjV8mAvBCz
         OhUA88iHutmnqhQ6yWid9svT46G2Q0/6js796fiHVd4edkjIzkHLVqLM/fr0/w2meqa1
         nrX4ZjiMSBl7w3rt4WLHyqlNC/+7P2GZK4WQt0ylqNaEaYpT8JHn513QUVhZj5NcPlCI
         TQhl4IYnhXbDT29OrK1VpuAvSYMSMozWpFtjOdlaQDn2T1lY7GrkNQpcyvGcTDLxdIjs
         QCTA==
X-Gm-Message-State: AOJu0Yy5rafySub9OCLQ87YhFwa60kXrvH1ijkeryKgLYbilQEiIAq4u
	zvzqpJCIkz4m64wTn9v5C0dZqcwopLcNPxq5uH1QzEhIdDoG5pyN9Cu5AeTaww9CyLcsKkakJDe
	duAWvxHEzqoP2vFA+gpen35YhXZprmV4ifySUM4/55k+jf1aAcBJQQG1qJVwuONMV3w==
X-Gm-Gg: AfdE7ckY/K4u5X54cKHYKqq72JjiIZ2Zoq3iAMIPlfI2QJF8lCXsnfzLEd+zyz9YIIN
	ltjUK4pg5lInLW1GLwTjmn92+VzJemdZtE4wl47vYaLkTHj55igmmpBk6EP7d7nbiIZ08vgDx5t
	YIg/AV762t/O3E1GyFsVo62oz5pIQhucwhYmidRCZVAdB0EUlFVCtmy/gKj9B3XT1L0//f78Epk
	tpaRi8Zec8hrTmEMbQ6SyGrXDsy5W3U03SIsGHvMmJKGXdLwITGhngo0FxxyqoB8n35abrz6VLR
	4sHAJi8SWbcMenPLdun8u5mFCtBhzw1FXT8/QKrUVHGHN+mUcaDY+haPxnlkWGOaJGw3wL0CFQf
	4kblRy3tHcGzVzd9oZN4JVfOX3w9p20OtPwC3VYmfKZE=
X-Received: by 2002:a05:6102:26c2:b0:738:9c30:2b7c with SMTP id ada2fe7eead31-73cb89da2f8mr386485137.6.1782828858393;
        Tue, 30 Jun 2026 07:14:18 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:738:9c30:2b7c with SMTP id ada2fe7eead31-73cb89da2f8mr386445137.6.1782828857751;
        Tue, 30 Jun 2026 07:14:17 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289176ee2sm137272766b.58.2026.06.30.07.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:14:16 -0700 (PDT)
Message-ID: <2a7cd484-ee0f-40bd-bba7-3faa86bb8247@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:14:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
 <ts6esusuua2khweva6iyfel2yowislwwx6zb2fl2azcefownie@cg7jegn334fj>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <ts6esusuua2khweva6iyfel2yowislwwx6zb2fl2azcefownie@cg7jegn334fj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W8O_xVSuZAPXVBksZeK6cy_qa4-1b4rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX1C/JxQk6TK+n
 9/kIBh/wD9nhfuvo4ZyUpQHjX0gtrFMBvMw49O2vBH6jo2RY178+8LojLxflAcyI9oVgjNBhgjd
 bQ8xM3LqZjohX1blHICNIf5VX/I/O8KJH6DikD7LeX8KaebaU2xyzwhmGEBxiRjJEvFjD+lxwev
 HOBXglgPKxxdJhjlkbHUGTgTosjloJ4ywTLL+MKn043LPGhib2WlGtgrpP3bicmuDGiIOg6Uzi/
 sJOcHs6Ib3/ghkNqgnVuNwpfDvoeGyrLoVMzxEsiq9DTtnS4CIdkQ/pCsyMqV0FpZuLkx6fAK9a
 eRUERw59m39tjw4a3IUst02wseIHrTSnATCRvrRr8D6dP1F6gK78WXFd7mizLsK88UEbSRwUHl5
 eYUc7Bj9uVrRqSMJxUvFQtqCh1CGet7CWJ70UsDzQI6DfT5HTD0CFKgzmYmwKbPAA4Dq0iz9dfs
 e9UNMvk6UaDNepiKVXw==
X-Proofpoint-GUID: W8O_xVSuZAPXVBksZeK6cy_qa4-1b4rn
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43cf3b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=SSmOFEACAAAA:8 a=EUspDBNiAAAA:8 a=scW6VAnpIgxttaVlY60A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX8EWsWc48UvH4
 TW0PBvgQIw3lPgrjNt8lk+3rMHHNmr7FYU0O4xfbykTXbBs1g2EmjrFk5Dy6manoUf8MeZ9eO3D
 69DCnoOYlX0G4r1zQkJyGh+nhXnja9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66115-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41FC76E5561

On 6/30/2026 4:06 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 03:17:50PM +0300, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> This series targets SM8250 (Kona) platforms.
>>
>> The jpeg-encoder node is described as a child node of the CAMSS block
>> and is probed automatically via of_platform_populate() in camss_probe().
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> media: qcom: jpeg: restore JPEG_ENCODE_H1V1 for CAPTURE format lookup
>>
>> V4L2_PIX_FMT_JPEG must remain in jpeg_encode_fmt[] with JPEG_ENCODE_H1V1
>> so that jpeg_get_encode_fmt() and jpeg_get_memory_fmt() resolve correctly
>> for the Write Engine (CAPTURE queue) path.
>>
>> The corresponding jpeg_mcu_blocks[H1V1] entry is also restored.
>>
>> V4L2_PIX_FMT_JPEG is not present in jpeg_src_formats[] so it cannot be
>> set as a SOURCE format by userspace.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> fixup! media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> You definitely haven't read your commit message. Sad.
> 
>> ---
>>   drivers/media/platform/qcom/Kconfig           |    1 +
>>   drivers/media/platform/qcom/Makefile          |    1 +
>>   drivers/media/platform/qcom/jpeg/Kconfig      |   17 +
>>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  310 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  337 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  111 ++
>>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  354 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1524 +++++++++++++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   39 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   30 +
>>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  527 ++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1150 +++++++++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>>   16 files changed, 4606 insertions(+)
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
>> index ea2221a202c0..011b5d237193 100644
>> --- a/drivers/media/platform/qcom/Makefile
>> +++ b/drivers/media/platform/qcom/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   obj-y += camss/
>>   obj-y += iris/
>> +obj-y += jpeg/
>>   obj-y += venus/
>> diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/platform/qcom/jpeg/Kconfig
>> new file mode 100644
>> index 000000000000..8a96b37b919b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config VIDEO_QCOM_JENC
>> +	tristate "Qualcomm V4L2 JPEG Encoder driver"
>> +	depends on V4L_MEM2MEM_DRIVERS
>> +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>> +	depends on VIDEO_DEV
>> +	select VIDEOBUF2_DMA_SG
>> +	select V4L2_JPEG_HELPER
>> +	select V4L2_MEM2MEM_DEV
>> +	help
>> +	  Qualcomm JPEG memory-to-memory V4L2 encoder driver.
>> +
>> +	  Provides:
>> +	    - qcom-jenc (encode)
> 
> What does this mean? How is it different from the next sentence?
> 
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called qcom-jenc
>> diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/platform/qcom/jpeg/Makefile
>> new file mode 100644
>> index 000000000000..310f6c3c1f19
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +obj-$(CONFIG_VIDEO_QCOM_JENC) += qcom-jenc.o
>> +
>> +qcom-jenc-objs += \
>> +	qcom_jenc_dev.o \
>> +	qcom_jenc_v4l2.o \
>> +	qcom_jenc_ops.o \
>> +	qcom_jenc_res.o \
>> +	qcom_jenc_hdr.o
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>> new file mode 100644
>> index 000000000000..cd6216fc3424
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>> @@ -0,0 +1,310 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef QCOM_JENC_DEFS_H
>> +#define QCOM_JENC_DEFS_H
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/io.h>
>> +#include <linux/types.h>
>> +#include <linux/videodev2.h>
>> +#include <media/videobuf2-core.h>
> 
> Please keep only the headers which are required for this header file.
> All other headers should be included from the source files.
> 
>> +
>> +/* Offline JPEG encoder constraints */
>> +#define QCOM_JPEG_HW_MAX_WIDTH	8192
>> +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
>> +#define QCOM_JPEG_HW_MIN_WIDTH	256
>> +#define QCOM_JPEG_HW_MIN_HEIGHT	256
>> +
>> +#define QCOM_JPEG_HW_DEF_HSTEP	16
>> +#define QCOM_JPEG_HW_DEF_VSTEP	16
>> +
>> +#define QCOM_JPEG_HW_DEF_WIDTH	1920
>> +#define QCOM_JPEG_HW_DEF_HEIGHT	1088
>> +
>> +#define QCOM_JPEG_MAX_PLANES	3
>> +
>> +#define QCOM_JPEG_QUALITY_MIN	1
>> +#define QCOM_JPEG_QUALITY_DEF	98
>> +#define QCOM_JPEG_QUALITY_MAX	100
>> +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
>> +#define QCOM_JPEG_QUALITY_UNT	1
>> +
>> +/*
>> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
>> + *
>> + * When set to 1 the driver selects the core clock OPP level based on the
>> + * encoded frame resolution and quality factor.  When set to 0 (default) the
>> + * driver always runs at NOMINAL (highest) OPP level, trading power for
>> + * deterministic latency.
>> + *
>> + * Accessible via v4l2-ctl:
>> + *   v4l2-ctl --set-ctrl=perf_level_auto=1
>> + */
>> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO \
>> +	(V4L2_CID_USER_BASE + 0x1240)
>> +
>> +/*
>> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
>> + *
>> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
>> + * OPP level whose throughput is sufficient for the requested frame rate.
>> + * Has no effect when perf_level_auto is 0.
>> + *
>> + * Range: 1 to 240 fps. Default: 30.
>> + *
>> + * Accessible via v4l2-ctl:
>> + *   v4l2-ctl --set-ctrl=fps_target=60
>> + */
>> +#define V4L2_CID_QCOM_JPEG_FPS_TARGET \
>> +	(V4L2_CID_USER_BASE + 0x1241)
> 
> These (and all other relevant defines) should go to include/uapi/
> 
>> +
>> +#define QCOM_JPEG_FPS_MIN	1
>> +#define QCOM_JPEG_FPS_MAX	240
>> +#define QCOM_JPEG_FPS_DEF	30
>> +#define QCOM_JPEG_FPS_UNT	1
>> +
>> +#define JPEG_CLK_LOWSVS_HZ	300000000ULL
>> +#define JPEG_CLK_SVS_HZ		400000000ULL
>> +#define JPEG_CLK_SVS_L1_HZ	480000000ULL
>> +#define JPEG_CLK_NOMINAL_HZ	600000000ULL
> 
> These are platform peculiarities. Move them to the platform-specific
> definitions. Or, better, drop them completely.
> 
>> +
>> +/*
>> + * Reference measurements:
>> + *
>> + *  - JPEG clock      : 600 MHz
>> + *  - Input           : Worst-case (NOISE)
>> + *
>> + * Although ~120 MPixel/s was measured, use a conservative value of
>> + * 110 MPixel/s to provide operating margin.
>> + */
>> +#define JPEG_REF_CLK_HZ             JPEG_CLK_NOMINAL_HZ
> 
> I assume all of these are related to SM8250 and don't apply to other
> devices. Don't make the life of people adding other platforms harder
> than it should be. Remove it and read from the OPP.
> 
>> +#define JPEG_REF_THROUGHPUT_MPPS    110ULL
>> +#define JPEG_REF_PIXEL_RATE         (JPEG_REF_THROUGHPUT_MPPS * 1000000ULL)
>> +
>> +/*
>> + * Performance levels for the JPEG core clock, used as level values.
>> + * The numeric values must match the opp-level entries in the DTS node:
>> + *
>> + *   LOWSVS  = 0  -> opp-level = <0>  (e.g. 300 MHz on SM8250)
>> + *   SVS     = 1  -> opp-level = <1>  (e.g. 400 MHz on SM8250)
>> + *   SVS_L1  = 2  -> opp-level = <2>  (e.g. 480 MHz on SM8250)
>> + *   NOMINAL = 3  -> opp-level = <3>  (e.g. 600 MHz on SM8250)
> 
> Definitely no. Drop this alltogether. Use OPP tables and OPP-related
> functions.
> 
>> + */
>> +enum qcom_soc_perf_level {
>> +	QCOM_SOC_PERF_LOWSVS = 0,
>> +	QCOM_SOC_PERF_SVS,
>> +	QCOM_SOC_PERF_SVS_L1,
>> +	QCOM_SOC_PERF_NOMINAL
>> +};
>> +
>> +/* hardware register field mask identifiers */
>> +enum qcom_jpeg_mask_id {
> 
> Why do you need to keep all of them abstracted? Just use the registers
> as is, assuming that the registers don't change a lot between platforms.
>

Hi Dmitry,

Regarding the register abstraction — I'd like to make a case for keeping it.

The Qualcomm JPEG hardware exists in multiple versions across different 
SoCs. I don't have access to all of them, but Qualcomm tends to reuse 
and recombine IP blocks across platforms, and assuming register-level 
uniformity seems premature.

Adding a new platform only requires a new ops/mask table — existing ones 
remain untouched. Would you be open to keeping this abstraction as-is?

Thanks,
Atanas

>> +	/* hW version fields */
>> +	JMSK_HW_VER_STEP,
>> +	JMSK_HW_VER_MINOR,
>> +	JMSK_HW_VER_MAJOR,
>> +
>> +	/* hW capability fields */
>> +	JMSK_HW_CAP_ENCODE,
>> +	JMSK_HW_CAP_DECODE,
>> +	JMSK_HW_CAP_UPSCALE,
>> +	JMSK_HW_CAP_DOWNSCALE,
>> +
>> +	/* reset command fields for individual JPEG subsystems */
>> +	JMSK_RST_CMD_COMMON,
>> +	JMSK_RST_CMD_FE_RESET,
>> +	JMSK_RST_CMD_WE_RESET,
>> +	JMSK_RST_CMD_ENCODER_RESET,
>> +	JMSK_RST_CMD_DECODER_RESET,
>> +	JMSK_RST_CMD_BLOCK_FORMATTER_RST,
>> +	JMSK_RST_CMD_SCALE_RESET,
>> +	JMSK_RST_CMD_REGISTER_RESET,
>> +	JMSK_RST_CMD_MISR_RESET,
>> +	JMSK_RST_CMD_CORE_RESET,
>> +	JMSK_RST_CMD_JMSK_DOMAIN_RESET,
>> +	JMSK_RST_CMD_RESET_BYPASS,
>> +
>> +	/* hW command fields */
>> +	JMSK_CMD_HW_START,
>> +	JMSK_CMD_HW_STOP,
>> +	JMSK_CMD_CLR_RD_PLNS_QUEUE,
>> +	JMSK_CMD_CLR_WR_PLNS_QUEUE,
>> +	JMSK_CMD_APPLY_SWC_RD_PARAMS,
>> +
>> +	/* core configuration fields */
>> +	JMSK_CORE_CFG_FE_ENABLE,
>> +	JMSK_CORE_CFG_WE_ENABLE,
>> +	JMSK_CORE_CFG_ENC_ENABLE,
>> +	JMSK_CORE_CFG_SCALE_ENABLE,
>> +	JMSK_CORE_CFG_TESTBUS_ENABLE,
>> +	JMSK_CORE_CFG_MODE,
>> +	JMSK_CORE_CFG_CGC_DISABLE,
>> +
>> +	/* core status fields */
>> +	JMSK_CORE_STATUS_ENCODE_STATE,
>> +	JMSK_CORE_STATUS_SCALE_STATE,
>> +	JMSK_CORE_STATUS_RT_STATE,
>> +	JMSK_CORE_STATUS_BUS_STATE,
>> +	JMSK_CORE_STATUS_CGC_STATE,
>> +
>> +	/* interrupt status fields */
>> +	JMSK_IRQ_STATUS_SESSION_DONE,
>> +	JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE,
>> +	JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE,
>> +	JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE,
>> +	JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN,
>> +	JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE,
>> +	JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE,
>> +	JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE,
>> +	JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN,
>> +	JMSK_IRQ_STATUS_SESSION_ERROR,
>> +	JMSK_IRQ_STATUS_STOP_ACK,
>> +	JMSK_IRQ_STATUS_RESET_ACK,
>> +
>> +	/* combined mask for clearing all interrupt status bits */
>> +	JMSK_IRQ_STATUS_ALL_BITS,
>> +
>> +	/* fetch engine (FE) configuration fields */
>> +	JMSK_FE_CFG_BYTE_ORDERING,
>> +	JMSK_FE_CFG_BURST_LENGTH_MAX,
>> +	JMSK_FE_CFG_MEMORY_FORMAT,
>> +	JMSK_FE_CFG_CBCR_ORDER,
>> +	JMSK_FE_CFG_BOTTOM_VPAD_EN,
>> +	JMSK_FE_CFG_PLN0_EN,
>> +	JMSK_FE_CFG_PLN1_EN,
>> +	JMSK_FE_CFG_PLN2_EN,
>> +	JMSK_FE_CFG_SIXTEEN_MCU_EN,
>> +	JMSK_FE_CFG_MCUS_PER_BLOCK,
>> +	JMSK_FE_CFG_MAL_BOUNDARY,
>> +	JMSK_FE_CFG_MAL_EN,
>> +
>> +	JMSK_FE_VBPAD_CFG_BLOCK_ROW,
>> +	JMSK_FE_VBPAD_CFG,
>> +
>> +	/* fetch engine plane address/geometry fields */
>> +	JMSK_PLNS_RD_OFFSET,
>> +	JMSK_PLNS_RD_BUF_SIZE_WIDTH,
>> +	JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
>> +	JMSK_PLNS_RD_STRIDE,
>> +	JMSK_PLNS_RD_HINIT,
>> +	JMSK_PLNS_RD_VINIT,
>> +	JMSK_PLN0_RD_HINIT_INT,
>> +	JMSK_PLN1_RD_HINIT_INT,
>> +	JMSK_PLN2_RD_HINIT_INT,
>> +	JMSK_PLN0_RD_VINIT_INT,
>> +	JMSK_PLN1_RD_VINIT_INT,
>> +	JMSK_PLN2_RD_VINIT_INT,
>> +
>> +	/* write engine (WE) configuration fields */
>> +	JMSK_WE_CFG_BYTE_ORDERING,
>> +	JMSK_WE_CFG_BURST_LENGTH_MAX,
>> +	JMSK_WE_CFG_MEMORY_FORMAT,
>> +	JMSK_WE_CFG_CBCR_ORDER,
>> +	JMSK_WE_CFG_PLN0_EN,
>> +	JMSK_WE_CFG_PLN1_EN,
>> +	JMSK_WE_CFG_PLN2_EN,
>> +	JMSK_WE_CFG_MAL_BOUNDARY,
>> +	JMSK_WE_CFG_MAL_EN,
>> +	JMSK_WE_CFG_POP_BUFF_ON_EOS,
>> +
>> +	/* write engine plane address/geometry fields */
>> +	JMSK_PLNS_WR_BUF_SIZE_WIDTH,
>> +	JMSK_PLNS_WR_BUF_SIZE_HEIGHT,
>> +	JMSK_PLNS_WR_STRIDE,
>> +	JMSK_PLNS_WR_HINIT,
>> +	JMSK_PLNS_WR_VINIT,
>> +	JMSK_PLNS_WR_HSTEP,
>> +	JMSK_PLNS_WR_VSTEP,
>> +	JMSK_PLNS_WR_BLOCK_CFG_PER_COL,
>> +	JMSK_PLNS_WR_BLOCK_CFG_PER_RAW,
>> +
>> +	/* encoder configuration fields */
>> +	JMSK_ENC_CFG_IMAGE_FORMAT,
>> +	JMSK_ENC_CFG_APPLY_EOI,
>> +	JMSK_ENC_CFG_HUFFMAN_SEL,
>> +	JMSK_ENC_CFG_FSC_ENABLE,
>> +	JMSK_ENC_CFG_OUTPUT_DISABLE,
>> +	JMSK_ENC_CFG_RST_MARKER_PERIOD,
>> +	JMSK_ENC_IMAGE_SIZE_WIDTH,
>> +	JMSK_ENC_IMAGE_SIZE_HEIGHT,
>> +
>> +	/* scaler configuration fields */
>> +	JMSK_SCALE_CFG_HSCALE_ENABLE,
>> +	JMSK_SCALE_CFG_VSCALE_ENABLE,
>> +	JMSK_SCALE_CFG_UPSAMPLE_EN,
>> +	JMSK_SCALE_CFG_SUBSAMPLE_EN,
>> +	JMSK_SCALE_CFG_HSCALE_ALGO,
>> +	JMSK_SCALE_CFG_VSCALE_ALGO,
>> +	JMSK_SCALE_CFG_H_SCALE_FIR_ALGO,
>> +	JMSK_SCALE_CFG_V_SCALE_FIR_ALGO,
>> +	JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH,
>> +	JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT,
>> +	JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
>> +	JMSK_SCALE_PLNS_HSTEP_INTEGER,
>> +	JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
>> +	JMSK_SCALE_PLNS_VSTEP_INTEGER,
>> +
>> +	/* dMI table configuration and write fields */
>> +	JMSK_DMI_CFG,
>> +	JMSK_DMI_ADDR,
>> +	JMSK_DMI_DATA,
>> +
>> +	JMSK_ID_MAX
>> +};
>> +
>> +struct qcom_jpeg_reg_offs {
>> +	u32 hw_version;
>> +	u32 hw_capability;
>> +	u32 reset_cmd;
>> +	u32 core_cfg;
>> +	u32 int_mask;
>> +	u32 int_clr;
>> +	u32 int_status;
>> +	u32 hw_cmd;
>> +	u32 enc_core_state;
>> +
>> +	struct {
>> +		u32 pntr[QCOM_JPEG_MAX_PLANES];
>> +		u32 offs[QCOM_JPEG_MAX_PLANES];
>> +		u32 bsize[QCOM_JPEG_MAX_PLANES];
>> +		u32 stride[QCOM_JPEG_MAX_PLANES];
>> +		u32 hinit[QCOM_JPEG_MAX_PLANES];
>> +		u32 vinit[QCOM_JPEG_MAX_PLANES];
>> +		u32 pntr_cnt;
>> +		u32 vbpad_cfg;
>> +	} fe;
>> +	u32 fe_cfg;
>> +
>> +	struct {
>> +		u32 pntr[QCOM_JPEG_MAX_PLANES];
>> +		u32 bsize[QCOM_JPEG_MAX_PLANES];
>> +		u32 stride[QCOM_JPEG_MAX_PLANES];
>> +		u32 hinit[QCOM_JPEG_MAX_PLANES];
>> +		u32 hstep[QCOM_JPEG_MAX_PLANES];
>> +		u32 vinit[QCOM_JPEG_MAX_PLANES];
>> +		u32 vstep[QCOM_JPEG_MAX_PLANES];
>> +		u32 blocks[QCOM_JPEG_MAX_PLANES];
>> +		u32 pntr_cnt;
>> +	} we;
>> +	u32 we_cfg;
>> +
>> +	struct {
>> +		u32 hstep[QCOM_JPEG_MAX_PLANES];
>> +		u32 vstep[QCOM_JPEG_MAX_PLANES];
>> +	} scale;
>> +	u32 scale_cfg;
>> +	u32 scale_out_cfg[QCOM_JPEG_MAX_PLANES];
>> +
>> +	u32 enc_cfg;
>> +	u32 enc_img_size;
>> +	u32 enc_out_size;
>> +
>> +	u32 dmi_cfg;
>> +	u32 dmi_data;
>> +	u32 dmi_addr;
> 
> Ugh. How many platforms do you support? How many of those have
> significantly different registers here?
> 
>> +};
>> +
>> +#endif /* QCOM_JENC_DEFS_H */
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>> new file mode 100644
>> index 000000000000..c3573853f24a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>> @@ -0,0 +1,337 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/interconnect.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_opp.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +
>> +#include "qcom_jenc_dev.h"
>> +
>> +#include "qcom_jenc_defs.h"
>> +#include "qcom_jenc_ops.h"
>> +#include "qcom_jenc_res.h"
>> +#include "qcom_jenc_v4l2.h"
>> +
>> +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
>> +{
>> +	int c_idx;
>> +
>> +	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
>> +	if (jenc->num_clks < 0)
>> +		return jenc->num_clks;
>> +
>> +	for (c_idx = 0; c_idx < jenc->num_clks; c_idx++) {
>> +		if (!strcmp(jenc->clks[c_idx].id, "jpeg")) {
>> +			jenc->core_clk = jenc->clks[c_idx].clk;
> 
> Why?
> 
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	unsigned long freq;
>> +	int rc;
>> +
>> +	/* look up the OPP entry by level to obtain the core clock frequency */
>> +	opp = dev_pm_opp_find_level_exact(jenc->dev, jenc->perf);
>> +	if (IS_ERR(opp)) {
>> +		dev_err(jenc->dev, "OPP not found for perf level %u: %pe\n", jenc->perf, opp);
>> +		return PTR_ERR(opp);
>> +	}
>> +	freq = dev_pm_opp_get_freq(opp);
>> +	dev_pm_opp_put(opp);
>> +
>> +	rc = clk_set_rate(jenc->core_clk, freq);
> 
> Oh, I see why. It's because you didn't figure out dev_pm_opp_set_rate().
> Please do.
> 
>> +	if (rc) {
>> +		dev_err(jenc->dev, "core clock set rate failed: %d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
>> +	if (rc) {
>> +		clk_set_rate(jenc->core_clk, 0);
>> +		return rc;
>> +	}
>> +
>> +	dev_dbg(jenc->dev, "JPEG core clock: %ld\n", clk_get_rate(jenc->core_clk));
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
>> +{
>> +	clk_set_rate(jenc->core_clk, 0);
>> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> 
> Should it not be other way around?
> 
>> +}
>> +
>> +static int qcom_jpeg_icc_on(struct qcom_jenc_dev *jenc)
>> +{
>> +	const struct qcom_dev_resources	*res = jenc->res;
>> +	int p_idx;
>> +	int rc;
>> +
>> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
>> +		rc = icc_set_bw(jenc->icc_paths[p_idx], res->icc_res[p_idx].pair.aggr,
>> +				res->icc_res[p_idx].pair.peak);
>> +		if (rc) {
>> +			dev_err(jenc->dev, "icc_set_bw failed for path %s: %d\n",
>> +				res->icc_res[p_idx].icc_id, rc);
>> +			goto err_icc_set_bw;
>> +		}
>> +	}
> 
> Be a nice person, add bulk API to ICC?
> 
>> +
>> +	return 0;
>> +
>> +err_icc_set_bw:
>> +	while (--p_idx >= 0)
>> +		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
>> +
>> +	return rc;
>> +}
>> +
>> +static void qcom_jpeg_icc_off(struct qcom_jenc_dev *jenc)
>> +{
>> +	const struct qcom_dev_resources	*res = jenc->res;
>> +	int p_idx;
>> +
>> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++)
>> +		icc_set_bw(jenc->icc_paths[p_idx], 0, 0);
>> +}
>> +
>> +static int qcom_jpeg_icc_init(struct qcom_jenc_dev *jenc)
>> +{
>> +	const struct qcom_dev_resources	*res = jenc->res;
>> +	int p_idx;
>> +
>> +	jenc->icc_paths = devm_kcalloc(jenc->dev, res->num_of_icc, sizeof(*jenc->icc_paths),
>> +				       GFP_KERNEL);
>> +	if (!jenc->icc_paths)
>> +		return -ENOMEM;
>> +
>> +	for (p_idx = 0; p_idx < res->num_of_icc; p_idx++) {
>> +		jenc->icc_paths[p_idx] = devm_of_icc_get(jenc->dev, res->icc_res[p_idx].icc_id);
>> +		if (IS_ERR(jenc->icc_paths[p_idx])) {
>> +			return dev_err_probe(jenc->dev, PTR_ERR(jenc->icc_paths[p_idx]),
>> +					     "failed to get ICC path: %pe\n",
>> +					     jenc->icc_paths[p_idx]);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_pm_suspend(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +
>> +	qcom_jpeg_clk_off(jenc);
>> +
>> +	qcom_jpeg_icc_off(jenc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_pm_resume(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +	int rc;
>> +
>> +	rc = qcom_jpeg_icc_on(jenc);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = qcom_jpeg_clk_on(jenc);
>> +	if (rc) {
>> +		qcom_jpeg_icc_off(jenc);
>> +		return rc;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_jpeg_suspend(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +	int rc;
>> +
>> +	v4l2_m2m_suspend(jenc->m2m_dev);
>> +
>> +	rc = pm_runtime_force_suspend(dev);
>> +	if (rc)
>> +		v4l2_m2m_resume(jenc->m2m_dev);
>> +
>> +	return rc;
>> +}
>> +
>> +static int qcom_jpeg_resume(struct device *dev)
>> +{
>> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
>> +	int rc;
>> +
>> +	rc = pm_runtime_force_resume(dev);
>> +	if (rc)
>> +		return rc;
>> +
>> +	v4l2_m2m_resume(jenc->m2m_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops qcom_jpeg_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(qcom_jpeg_suspend, qcom_jpeg_resume)
>> +	RUNTIME_PM_OPS(qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL)
>> +};
> 
> UNIVERSAL_DEV_PM_OPS? _DEFINE_DEV_PM_OPS?
> 
>> +
>> +static int qcom_jpeg_probe(struct platform_device *pdev)
>> +{
>> +	const struct qcom_dev_resources *res;
>> +	struct qcom_jenc_dev *jenc;
>> +	int rc;
>> +
>> +	jenc = kzalloc_obj(*jenc, GFP_KERNEL);
> 
> devm?
> 
>> +	if (!jenc)
>> +		return -ENOMEM;
>> +
>> +	jenc->dev = &pdev->dev;
>> +	platform_set_drvdata(pdev, jenc);
>> +	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
>> +	if (rc)
>> +		goto err_free_jenc;
>> +	spin_lock_init(&jenc->hw_lock);
>> +	init_completion(&jenc->reset_complete);
>> +	init_completion(&jenc->stop_complete);
>> +
>> +	res = device_get_match_data(jenc->dev);
>> +	if (!res) {
>> +		rc = dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
>> +		goto err_free_jenc;
>> +	}
>> +	jenc->res = res;
>> +
>> +	if (!jenc->res->hw_offs || !jenc->res->hw_ops) {
>> +		rc = dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(jenc->jpeg_base)) {
>> +		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
>> +				   "failed to map JPEG resource\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = devm_pm_opp_of_add_table(jenc->dev);
>> +	if (rc && rc != -ENODEV) {
>> +		dev_err_probe(jenc->dev, rc, "failed to add OPP table\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = qcom_jpeg_clk_init(jenc);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to get clocks\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	jenc->irq = platform_get_irq(pdev, 0);
>> +	if (jenc->irq < 0) {
>> +		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
>> +				       jenc->res->hw_ops->hw_irq_top,
>> +				       jenc->res->hw_ops->hw_irq_bot,
>> +				       IRQF_ONESHOT, dev_name(jenc->dev), jenc);
> 
> Are you ready to serve the IRQ here? If not, either request it later,
> when everything is ready, or use IRQF_NO_AUTOEN
> 
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	rc = qcom_jpeg_icc_init(jenc);
>> +	if (rc)
>> +		goto err_free_jenc;
>> +
>> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
>> +		goto err_free_jenc;
>> +	}
>> +
>> +	jenc->perf = QCOM_SOC_PERF_NOMINAL;
>> +
>> +	rc = devm_pm_runtime_enable(jenc->dev);
>> +	if (rc)
>> +		goto err_v4l2_device_unregister;
>> +
>> +	rc = qcom_jpeg_v4l2_register(jenc);
>> +	if (rc) {
>> +		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
>> +		goto err_v4l2_device_unregister;
>> +	}
> 
> rc = devm_add_action_or_reset(dev, unregister_action)
> 
>> +
>> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
>> +
>> +	return 0;
>> +
>> +err_v4l2_device_unregister:
>> +	v4l2_device_unregister(&jenc->v4l2_dev);
>> +	kfree(jenc);
>> +	return rc;
>> +err_free_jenc:
>> +	kfree(jenc);
>> +	return rc;
>> +}
>> +
>> +static void qcom_jpeg_remove(struct platform_device *pdev)
>> +{
>> +	struct qcom_jenc_dev *jenc = platform_get_drvdata(pdev);
>> +
>> +	/* v4l2_device_unregister() is called from the release callback. */
>> +	qcom_jpeg_v4l2_unregister(jenc);
>> +
>> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
>> +}
>> +
> 
> With the reset action in place, the remove can be removed.
> 
> 
>> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>> new file mode 100644
>> index 000000000000..cce15cc18186
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>> @@ -0,0 +1,354 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +
>> +#include <media/jpeg.h>
>> +#include <media/v4l2-jpeg.h>
>> +
>> +#include "qcom_jenc_dev.h"
>> +#include "qcom_jenc_hdr.h"
>> +
>> +/*
>> + * The elements defined in this header are specified
>> + * in the ITU-T T.81 / JPEG specification.
>> + *
>> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
>> + */
>> +
>> +#define JFIF_HEADER_WIDTH_OFFS		0x07
>> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
>> +
>> +#define JPEG_MARKER_PREFIX		0xff
> 
> None of these definitions are specific to your driver. Move all of them
> to the shared headers. Reuse and extend v4l2-jpeg as much as possible.
> Ideally, only the hardware specifics should be in the driver. Check if
> there is anything to be leveraged from or shared with other existing
> drivers. Another option might be to define a new pixel format,
> header-less JPEG, then make it a userspace job to write all the headers.
> 
>> +
>> +static const u32 qcom_jpeg_v420_hw_reg_mask[] = {
>> +	[JMSK_HW_VER_STEP]	= JPEG_V420_HW_VER_STEP_MSK,
> 
> I think I have written this feedback already. Drop all this indirection.
> Use registers directly, as is.
> 
>> +	[JMSK_HW_VER_MINOR]	= JPEG_V420_HW_VER_MINOR_MSK,
>> +	[JMSK_HW_VER_MAJOR]	= JPEG_V420_HW_VER_MAJOR_MSK,
>> +
>> +};
>> +
>> +static const struct qcom_jpeg_reg_offs qcom_jpeg_v420_hw_reg_offs = {
>> +	.hw_version	= 0x000,
> 
> #define all these values, drop indirection.
> 
>> +	.hw_capability	= 0x004,
>> +	.reset_cmd	= 0x008,
>> +	.core_cfg	= 0x00c,
>> +	.hw_cmd		= 0x010,
>> +	.int_mask	= 0x018,
>> +	.int_clr	= 0x01c,
>> +	.int_status	= 0x020,
>> +	.enc_core_state = 0x014,
>> +
> 


