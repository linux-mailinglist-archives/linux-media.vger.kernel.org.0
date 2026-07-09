Return-Path: <linux-media+bounces-67171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3e8UAJamT2r8lgIAu9opvQ
	(envelope-from <linux-media+bounces-67171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:48:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B334731C02
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:48:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XD3TomVC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FXze7EX5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67171-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67171-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A167230A5571
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652B834250E;
	Thu,  9 Jul 2026 13:42:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934833EB06
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604546; cv=none; b=BMUBkX5CXkWHnoS/yMZcE7XYqhJbWGLD1463Vbe7r5E5i3VHvXab/J8Mx8l76buc0rAcxOzVksQ03k+DsEYSRAoSI2QkLUTbz0aLmdPFEzCWxkKaOj5xLIWadXvy/C6/29kv53VhMbezqOZX5XebaXEMBMbtE5+0dnk70n6xHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604546; c=relaxed/simple;
	bh=D12Kqe684KHhLTzzN0zwuJ804Vm06UzaITtnqf7NpI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dP+9JOA0itPJOH0peE8SIMNFmh9N7ZiwJl3bYFHOCtH/FIytYx8tiEimti1axjd17VM9il0FG/vq7w7w1S1u8DUFftjCgsHXWDsJNkyNFtey1Ih8ZZeZPgMrj+YVcGzsLqpazts+UMeo85+29M/ctSir4/UQfJAub4xXUVJb/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD3TomVC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXze7EX5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNEle1628463
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=; b=XD3TomVCY4hpqMyE
	qNs+GauUf2rXgujQ+SCvLTLxzuqn9CbIO5G3nDcTCQDHlcNe4x8kSepjPpeTeb9E
	vAruQ+V86FlIHGGRcrAApRQBycgdYYwe1xkYOkeRgx7gKS3OJrOz945vzjBoY/Qv
	7MuplV8F8MjdixGDVchKf5Mgc2Byyvm2d3do7oC3j1X8bh8LbUw2Q2Xz9BmG+2A9
	KZkoVlqoe6RqR3Q1mRummsFUbjUUxcnZWb8t/8HrP8ljBn9C7Rmk8LOVs0Z4Ppnd
	Vh3Xbh62n8S+1/YFtF+z5D8a0EwvpdrgukX3WIzo3TFiTpL0LgYHEp8bvcNPCSjq
	xUpy/A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvuxkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9691d185f5bso892917241.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604543; x=1784209343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=FXze7EX5D1t+PRRGYWyX85KkRovsvGka7+IgfHZtumchCgWmnXr2uxruI+/tbcEw0b
         b8uMHdfV8WtnPoUPefIbJE/fydctHNaJf73rZoXxLPuUtODbDgVt4LNrjC9g0NTJpnxZ
         y9RkXl0HkWRinb5DYwkrCvF54/UHcECRMrrCGQ/F3shI4yj24YQ3GO7KGQN/2hFW8oq/
         3HcaO39tPyu8l8+tV7UO4fEo1nOWIUAcD3JovUL1crMPWuvPkKhrgPi0hyhAmQuljXw0
         rXy4L52ZbGiWkrOAdtiAiFtO+A/g8EiJ7guf+mzrdmFyzDRkXd/USHgGKlazDuYK0j5Q
         TDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604543; x=1784209343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=hFe74o2XwArnUX61E9oxkBvv2oZhLvF3YEvFyEiNpecsNabg6S/YPHdXd33eGtZM6D
         1IvMGnQVQt+3QOyxoexTUfe0mzBiI0MIahoP+RSQF2oVS1+8L+DXYS6xeVbPRtzjlqg/
         C7EkFk5yyXKRvvrlPyaeuFQh32aau5z6Uwx1hyHmfhfAxZaP2QgmcEbXgSg8L7rrbcyC
         eds/zH4dvMWHqKwGvFF/6pK1ec5TPkqQuobqR+ysrcE6bAIX7772UUA4j2UIxbGVEY5j
         7dN8XxheoqeRrKG61lLTxUmERbL5fwpAehb9wVOD2cfPqzXZAWg/CKuQ+z5AMiKQ8izt
         eSzw==
X-Gm-Message-State: AOJu0YwFms8dLya7TDuewk1g3H+gUea7KWNFpeqv1jKZVXHqWQ/52+9t
	Fw4ZFU0tc0FxkVQwodKDFUXSqCQKA/3j9sUKBUatNrDBOWVtJk3MUFHk9vSbH6cpcDftBYifu8F
	zf+IOCcCg0r00PUyGo8jyHIizfPq5tM9It17VRVcV83Hhru+XHfaQvkPrSfpoDkrwdA==
X-Gm-Gg: AfdE7ckvo8rfQOCsVwh9EfqW4BfG7TCOr9rbEYKgPqehg7JpiEKqfreGJHteB8eUvVy
	SBBwfhXPRbdd+SB/EicXkatWgfU1Ysk8qAtvqPs56EE1X13sbD4D1BVMIkHKth9C/pF8fqDk/is
	nbHzyCLMliB7u+bkdo5uycfqSIRnI8haaupZONTdabp+6covNp2UFhOOxNzhDDw3dAfgQlb6hcw
	WHhKUEGyKSS2HbYeXJGSOTn1j9r4HJKhmfO+I9kN+gIfZjndni0FMV7M41ftBQRNyvPf3TB19ue
	Xevv4Gj3q3HaTWMAVvBUG9qYXTolipUfz/Ang57pRSEdbObsivAmXOuvM5OTMUl1MfoAPYLtdHe
	T3V5jtMedwVGJhSvZz+s1/DrWXlmG7dBCuXzM2TcCxEtOfC5h143sO1BoFDdwFH30p548S6gGpZ
	9pc6AC7g7CMMRCNtQ1oU72saH+
X-Received: by 2002:a05:6102:8352:10b0:738:8b5c:a41a with SMTP id ada2fe7eead31-744f67bda32mr1449138137.18.1783604543302;
        Thu, 09 Jul 2026 06:42:23 -0700 (PDT)
X-Received: by 2002:a05:6102:8352:10b0:738:8b5c:a41a with SMTP id ada2fe7eead31-744f67bda32mr1449115137.18.1783604542712;
        Thu, 09 Jul 2026 06:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:00 +0300
Subject: [PATCH v7 09/18] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-9-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D34MZH1YqLFpbixHKqEmKSwRwy+EVhESWZFGb+Rb8ys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlHJ4/o9MdMiNYPZ15JRmnPb20zgXw9Mv9/
 /aEdijTeruJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1ffNCACmx+9x7pWf70ZX/mMUTj6VUukYK8dDb4H7qjVh62PMVfU/WGMm+udYZtcvv0i63RrUVip
 yphd4NtRdytEdCsS1VBNl3Wtb4Yc1/S/yaE4VufWTOz9cSNnWoFDV98KXB9Iay6yoJpyTH3s/0a
 CuaDnEGDE2pqtrX2JVBKJGbmT2HzEi8eWIDFabSTkBKMoCkRK1/LyjQA1362TLtoE+i2wdEFZvw
 UcMF5BfiYFx6/0UIh3rb3AXjC5pfdZL00rr8dLPU0M3R65Ct+mT+Cg3/L7ISoMo3FgKRUkuHsS3
 vjLDldPEPBxD/Yp57DjIu2BLcoWZl/xe/I6HTyjfNnCt3GxQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8J7WRD6Tzjx1
 DVlCo8GUqBLoRgN2T3Dl1DWMaoIBOVMvUIE+genLobSJS4LGsz9at6Q7EcrP7hWQBfe9t+qbeaA
 vxkRHHChJ6gIaohrnLe9zz4clPqslZQ=
X-Proofpoint-GUID: IjkmeQ8uI7VC_ZrGev-ozzjVvUHVx7bx
X-Proofpoint-ORIG-GUID: IjkmeQ8uI7VC_ZrGev-ozzjVvUHVx7bx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX48TgdTlf0rbf
 fQWHWsWEeLTlK9x6OqtRwZ7qqmQmRJvtONBElz7I8p1tIZzbKm+5pbdel5CK2UDUh1F/nzOX3gT
 ji62fD5fNM/Lf37SqaUsMR9eviZhXCK4nqI8B3HUgryz/8W0Y2aO4ZtGXba5nqKTruD3rgWwqBd
 0uLlGF+GrtZ4Or9XiayCVULS+iyTd25e6xcaIu+XItaVx3bBouw2kFcXXlEAa6HLkvite16k771
 Auco1Ao5Z8ZlrzBChNzCyIM0P9m5QSTrLk+zZXAaYoC9bI9WtAlGJ/joCHtycRQErFGvTOARKyN
 QjArMuLEGVArpSBVUNSTznemgMisXGq702C71iT83DveiamedJQSrp07+yWtw3V1gF6WWBXsTTf
 C2MpxewM3Wz8+UlLB+WprESgAb/sJMXOt5+pQqvb1Oondkagj8oH/a05p949bHCyPMGTEsCwQDJ
 bt4ZkWZelFLy7vDVSAA==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4fa540 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67171-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B334731C02

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 5 +++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 940daddbafcf..e194f67a6f48 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index eeedde8fc9ce..b8099d7ce556 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


