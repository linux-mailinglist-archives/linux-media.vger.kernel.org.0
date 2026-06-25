Return-Path: <linux-media+bounces-65642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DszcG6UwPWrWyggAu9opvQ
	(envelope-from <linux-media+bounces-65642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:44:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2CB6C6374
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:44:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Tx/yzU1A";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XOdb1acT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65642-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65642-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA9AA3017BC9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A5433F8A6;
	Thu, 25 Jun 2026 13:43:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143F2882C5
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:43:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395034; cv=none; b=Wyx+14GPQC3K0cuz7gYx/LqsuF8bbMB8CWXBixbDmmKdPj0TJSNgGvPqd6ochnz5jn5LixPhb5hXgBNLC7mHX4JqTMAP/2T5y9f8dznobglI+cZjKe4raNHUTy+7a+CkI/i0y2QqYGGEHt1s9YkrCzyqZJOquQYWRpTiHtcPgks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395034; c=relaxed/simple;
	bh=ylnoSG5Un0ZYdcYuC6dnhdYGCCCntf7xa274R2xOL9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaQO5uaHz0A6A73nQTdkiInsjSILdidbDL58mQkSn8xRbSc7R9cQRbTlviAWQZxAchiyL4UbaIUA6pIxK5+1z5Iv5+N8XqXkFKaaLAPinUnST2ai5dYtDPJtJBMBwJfVIN24vVCaxFbJqq5AAhmQHQ0kldBq8UDkXR+SiD+lZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx/yzU1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOdb1acT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k52b1725441
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lnu1e7ij8lVAgXLYu6foVJHm9q1pJayOQFxmbxoqCb4=; b=Tx/yzU1A6IDpcdD0
	gMthgJ41kWPqh8/q8ihQYrN5vwMwXu2jehAjangwCng60pA/mL1CjXgZ3FCm4xxC
	GIO2W+fZnXmMSW0p3XQnIKlXjEKrN1yu8F5oX551+5eHCc/0RBLO/cBVk/uN4EQp
	AlgHJYIFT7Amssx9qP/mp5S15MJz/dd8luXcUU0sK01Gw6+bufjwnuGpFpO59Avh
	MxdRuiDyJEz3qRJJliSObfWo4GeP8og+oOne8AmsgCZlEVG8Y9nRPuGHgFwH05NV
	qjlXEo1aMbsxmpmBrTuWNmmbKh1B1Hio9Dh/fmYkgN5Fn5yu7P8WR4GlLR5csGMh
	i1r++A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dvh5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:43:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c8347cd5so399623585a.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782395032; x=1782999832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lnu1e7ij8lVAgXLYu6foVJHm9q1pJayOQFxmbxoqCb4=;
        b=XOdb1acTyUGOR/GVJn6hSczp0tPRDtzZwJblT0ldu/5F6pIrpvFudIIJ+LTJma9yQO
         wXK79nLP3J6lhko0D6qVKlhfMcSdPdKnFZg4Qz4f5eVOM3lNHuVlP+90qhUfqAlEkKrc
         1YOj/7VtYzQOyNOVZjNgfUcoGOFSs/V5beexVmcmfuvznT+zl/Vx5/Vg1Cm0vMS2AGbV
         zchu0KQzAv8VtIa7z/xdQmS8w+iMO7P8ThyNp2UXsKPh5vDmRNMaPd2UcX3F9uebcsqv
         gPQa633JuKVaoV6nJPKquY6YZLa1a9s3hMlVq0QV46aWFldyV0VuvgSObKx2LqWPzuzq
         Ccdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395032; x=1782999832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnu1e7ij8lVAgXLYu6foVJHm9q1pJayOQFxmbxoqCb4=;
        b=TXWP95v0eA/KGLAorauOSa8aRgwuqzvtb1HFhk2FyECyFF1ZAGSK/Ikbz+upt76vfv
         YBM+gVSuALNAYTJpvMHFVj7LG5u7GdhXVIRP/OIfFuej6YO915PKq6TVkiFpa4ssfEGA
         bUutqa2ualTgQbyoNtxW/hmmAN+DU7NVl8rlwo3VkVsa45AhWduZNtlKGCoH8HMGHxTh
         M43TBPCuDf9eklpd/lWvOnQJ9gIr6eVdY7Soa+j3Rcwy283g9ynev2SeD3ztRWoJ/YiM
         k0FaB0R+JX8mgKyoBozA7ijLW0W73IH+TyMry8Q4jYSqGzjQq+XdijOcE+DpGHC6hCRy
         5VgA==
X-Gm-Message-State: AOJu0Yz+WA5SLZVKoVXwbcwS5Ga7iVOQudSOmL5zypBTYYYO563y3+Sb
	D4/ozbWRSmu8OWTbt9Ytx7VBWgHHd1tNhVpwmfLg8Sr5cS64s+cujOOpkvE2bJz+P6ZQcR2SXnH
	dLxNg3rwn9KD/iS10OyTYY+0puIjSGgbG74Ux2Ls+2BS0BjAT2ofLrWKNWNPMjSLmxZ4aNA9Jka
	Kf
X-Gm-Gg: AfdE7cndbe+Rzc+kJdfXNSfhMm8uDaM5Emh6zLPqF2LiPKAizc5W25263CnB1L8j8f+
	Ho+ydJsN3IfHVTuhks44nNJKSDjg4kxojXYRxXGI5ncONdw5cosFKjifPNoxqzJTfffr/lrvZtL
	EMQEwnqud3SjsjZ4cOv54ORFpc2eQ32EX4uJljq71ZKoRZ7H4rRA8TxC7jgG5VdYRMZQGaAv8Mh
	mzW0/F9rHaWyv4AvncP2ku+mzpDN6vx80otbsm5CXuSlYTQ49kQPZD6BkH0ydfLQgVsXXfgcjQw
	xFbTosBXR7N4taWdmnPxC+zrz7rvEePWzev1I9ggUADpRrZAwaA9D1qpX84yFOj1yPh53+HCFn9
	VjMXn+zldy040nyH5Z/2iKJDdVvvAEtHeoPWxmczhpdo=
X-Received: by 2002:a05:620a:3710:b0:923:5e7:1664 with SMTP id af79cd13be357-9293c9e820dmr378642485a.45.1782395031816;
        Thu, 25 Jun 2026 06:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:923:5e7:1664 with SMTP id af79cd13be357-9293c9e820dmr378638185a.45.1782395031413;
        Thu, 25 Jun 2026 06:43:51 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c120755d053sm115124566b.15.2026.06.25.06.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:43:50 -0700 (PDT)
Message-ID: <364a79bf-e424-4237-ab13-18e38299ecec@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 16:43:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] This series adds support for the Qualcomm JPEG
 V4L2 mem2mem encoder.
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NIri7iKNH1ptwzU0rCsz0DyFAuSqnM67
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d3098 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_FjdycPTHN9gxW4S0HEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExOCBTYWx0ZWRfXzEkQdb23KrOw
 p3746Ne4ZDjF9NoWEANJw3lOsWBA4mwPJttjLmQzSNMZQ8JCtKloUZxbfWiFb5SWT6ObvpDi+T7
 3+MxMy4sNvqMN8ePEAqODvdxDSYUdVY=
X-Proofpoint-ORIG-GUID: NIri7iKNH1ptwzU0rCsz0DyFAuSqnM67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExOCBTYWx0ZWRfX/cA3Ba8qVwyb
 BGWq71P0Ijo/cQVLLMcR7bKm7lnkoCnCZ10WeHoqITfQB65dAO+CFPaCZp8ZzgOjhsPPx5VtAGE
 GyH36BZ5LXxsFswVMmleEd+9Dl9+k2rrDe+Ueh5QYib3vxIuUOYXaUx6L/O3KGZC1NZ8AShai+5
 IanrtnGdXg2eecPMofYtlegluASPQLM7AqNvsHF6iIwMIwldGsp4NJE2s1HxR6lwFfpDYps+uRJ
 OzSqfBdl6CXUrJvY40sQBeaZNBNBZd0x10138qifmoVl3IC5tdxOscR6bHp69VduGD40JZ9ze6b
 b9DLkCbaOzMlOhrXoLL8QXOrb5XX9PsRTel+AVDSgIPpkhMrQGvAjfcPGQwIkQxZw3bkOVKrjX5
 JiPwHb9IRzNMmfcLhrZsOGqKlQ1bg2jHu42C9wjZwk1a5BVXjQ6uMhudzWyS/BQXLYVmVrcewok
 +59odBZghAvX+pPqanQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-65642-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE2CB6C6374

On 6/12/2026 10:44 PM, Atanas Filipov wrote:
> The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
> framework, with DT-described hardware resources and SoC DTS integration.
> 
> Patch layout:
> - 1/4: devicetree bindings for the standalone Qualcomm JPEG encoder block
> - 2/4: SM8550 devicetree integration
> - 3/4: SM8250 devicetree integration
> - 4/4: qcom-jenc V4L2 mem2mem encoder driver
> 
> Supported compatibles:
> - qcom,sm8250-jenc
> - qcom,qcm6490-jenc
> - qcom,sm8550-jenc
> 
> Driver scope and design choices:
> - uses the standard V4L2 mem2mem + vb2 workflow
> - maps runtime resources from DT (clocks/interconnects/iommu/etc.)
> - keeps userspace interface within existing V4L2 JPEG controls/framework
> - uses runtime PM for balanced power transitions across stream/probe/remove
> 
> Functional validation (hardware):
> - platforms (codename / SoC / compatible / board):
>    - Kona / SM8250 (QRB5165 class) / qcom,sm8250-jenc / RB5
>    - Kailua / SM8550 / qcom,sm8550-jenc / RB5 Gen2
>    - Kodiak / QCM6490 (QCS6490 derivative line) / qcom,qcm6490-jenc / RB3 Gen2
> - validated SoC coverage: SM8250, SM8550, QCM6490
> - tested flows:
>    - single-frame encode: 8192x8192 NV12 (v4l2-ctl)
>    - single-frame encode: 1920x1080 NV12 (v4l2-ctl)
>    - single-frame encode: 1920x1080 GREY (v4l2-ctl)
>    - GStreamer NV12 pipeline to JPEG files (v4l2jpegenc)
>    - GStreamer GRAY8 pipeline to MJPEG output (v4l2jpegenc)
> 
> Known limitations:
> - scaling is not supported
> - width and height must be aligned to 16 pixels
> 
> Atanas Filipov (4):
>    dt-bindings: media: qcom: Add JPEG encoder binding
>    arm64: dts: qcom: sm8550: Add JPEG encoder node
>    arm64: dts: qcom: sm8250: Add JPEG encoder node
>    media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
> 
>   .../bindings/media/qcom,jpeg-encoder.yaml     |  142 ++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          |   35 +
>   arch/arm64/boot/dts/qcom/sm8550.dtsi          |   42 +
>   drivers/media/platform/qcom/Kconfig           |    1 +
>   drivers/media/platform/qcom/Makefile          |    1 +
>   drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>   19 files changed, 5067 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>   create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>   create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> 
> 
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d

Hi all,

Thank you for the review. v2 has been sent and addresses all comments:

https://lore.kernel.org/linux-media/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/T/#t

Regards,
Atanas

