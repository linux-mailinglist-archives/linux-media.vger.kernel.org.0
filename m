Return-Path: <linux-media+bounces-64670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UV8xEwLSK2rKFgQAu9opvQ
	(envelope-from <linux-media+bounces-64670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:31:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C8678506
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lUUqjXkw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hKZEjSBw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64670-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64670-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62605306717A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7923A5E9E;
	Fri, 12 Jun 2026 09:26:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860B37F73E
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256366; cv=none; b=WvVn1nHhLxGeAbbcxOR6B+t7elbNwTYPALhp/kxN/nwP51RKYzR8Fc7sXFfm4iIO0IfS6XwICBWEKQMb23fPrCGeWB2jDlArhVGrhIDJoA/8n6YRVthsrK/gqu7Qpxk2OXvKVirkOyzlN6HI4bRIP/o2h8MKXFlnS77ArMp///Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256366; c=relaxed/simple;
	bh=xNsqm+B3LOE10tLNQts5eunxNV5RsjVx0kaWEOCN+lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvoOy8TCqkx/i4qaco31hYywJHbJ9lg5v31pvnRUyKHP1wDiSUSW2QdLdorh7BDsuv2ugeFqqalln8imdiJoQJ7YBRx2iMYiVb3K+6JxcVXeAKFLU1y6qvu28oEzOYKms58AaLxfJJevq53fB6lpXLqsVHIIuDZe3JeM3iUsygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUUqjXkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKZEjSBw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39WXY2516147
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=; b=lUUqjXkwQsvvukaF
	plRq6OE5C7UNH3QrMFAOxxVJcK/Ty/0R4tKEWduwxn6ksGUKqvp570UfMhiwiMF+
	IXDJ/sqZYHOwcdio+TVb1e6gpAHG2fTgm1/DwNo3P3/G8V2D3/MedAVdUq2xpZtR
	lIuxSZETv9lXSImVrkMzstmlFobLWxFG9ocaMI6rowHu0sWlHETH7xqoEfBXUscf
	UbsTdQAtHNudNvpaCv2Vdomv9p/UAV9vG4lRoNraqBgQ3tlXzIrnaoi1iPHwTdJJ
	D4mqR0PnOvoAPfizgxm5HrYsz1NT4/3tWVca2m11HY+wq+9uSpHXQNTgL1AjjirM
	wGw/qQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72cg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c67361f5easo1888390137.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256360; x=1781861160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=;
        b=hKZEjSBwM6h1ryKs8S1D1Pnrk2zBQdgtXpmK6KxEwc7f5dO47sHrmbT0B1ivzcENZC
         ICoONjoLvrCpwmrQwQZ3acCV3TFZVoY83wffbhzx+QGnW7+x+2MftbHMZnis7Ntk52uc
         6OadZ9DxcdLzqHSXYrrcoJpFqHnm9vtmbH6h1YqFobdJO1VoGrM2RCv/2nFlDip8GLbG
         e4hUuDOHtLCz5tKsQ2BhfvQ+xQkjUES4AKEcKrtl5ajep70ddLz/yaUx0NYpIV4XuXJ/
         NhV4L60BJpI7QHqPJcd0+clxARYJaebIkRumtuK6yD4qDH0sZEcSMiCDRWEhzuEGQmWe
         2UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256360; x=1781861160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=;
        b=XcqFpoVWxOvfHFa6VqTyHLmMMo2Cua0bhY2kY7qmZBj8TsUuqQWZddaOwHmzkcTFo9
         kwCH66DH8ToFKMorG9wFi/2iL+M07X3ofI4ZNtTdVeqyYrIo9+BVHqHhx8y28JeQ1e/V
         iMvxgz7qLPQlrQsDMZrxjOUI6fEHStMQ7j2HrQN4rZnU+514wU/loKt1aUeQXXpQQDXb
         tt9YT88lT5s6o1lVbBkVZ46cR+h/s+LmlGpVQOWj/dt9FpUHkqX3Z5VdZafL7bPWQlQG
         0AyapMJy3ELEg+/q20XNMXMKVNnQOz6vSoDgq6P+PEdKyB/BAK88PbH6CrOuxf2Mzo+D
         lMrQ==
X-Gm-Message-State: AOJu0Yxtaa6bCGPQb7Jb8RP4Z8GGdkQvXejSVBfGGm7gOKgVU4ww9p7b
	HSG2L6BrR5TVJOl9yXW1zA+/wSyuv6rt9gApTtT6FV+CdyGc78jDgAYhwMCY/s/1Gp8raduHbS6
	bRraLKYpKIQ33F1lxTiVLL1NOu239JrmC+ZllRCRtbnEA8qEbn18irV57DrGqfncLLQ==
X-Gm-Gg: Acq92OHZ8fyfoiurHIdF0VqDYKHiPV0XOOsZewFoDYD/MBs18vgoSA0DJ6AVwURSKmz
	xiFzVFq3LxesDou9w+Ul9PAZGmJG2ZNKoJnFRFFG98BgMYaoI5iH0aX+OJyMOHhmDRZkVqve7sF
	T4cXxknsBZyxsWp4beCdYt3tDyV5qzcPrQsoKDw0T3uUY/G6wuEWAtpUZXcUTQnmen4WRRtmSi3
	qiNYLHNMimttN4TWXiyndKsWTzG45LPR+24KBel07RqdvUGeyVEbSKQzQ6g447koH/i2N73Vqp4
	Y/HG7IG0ohEH8F+cUVDdRMrflrSeioto8xrBIJlnTIyrdfA3t0cRZR2WfZsH68qBhxCuqaYlInY
	VLNjnLp6OK4PpwPyYTIS4aRINKS72lDf/qgMjMTlHbGFZ5MBRD2SkTgSiGU1ztS3IQI80OX6e2H
	5uGV4gpr6UYPJZZxOF+aRb2N9vXHdBN6X3Xm4=
X-Received: by 2002:a05:6102:61ca:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-71e61ef611fmr671924137.0.1781256359630;
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
X-Received: by 2002:a05:6102:61ca:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-71e61ef611fmr671913137.0.1781256359166;
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:39 +0300
Subject: [PATCH v4 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RnwWFAaJcZbGFM4BPtgb/HiyJNOnSGTgdllJ6NoVDw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQnqHoBieSia91XFs5XPA/VfkeCtH7g+3B5
 wUSJpPKYtKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1St4CACEU1jg9eaZaKESXwgnhYwNZvjNIOSi+O1BL4emf9VdQ4dFvv0JS7KXW21XyNidiI2e+Nk
 VNWjNWVzbCKNKe1XwzI0kB5LZ05eBbrMfOQJ+cKyIxpHqp6uUhLtmwX8MMYdP5NuKdiB5UHpyph
 6Ru2asYwv67IjAbkjap+q06Cq6vfCzapKH3r/Yf79WKlZ/8uRgJRsVkulWdHCxJrPnXsTlrZ1ej
 nioAXXqeMASTNOWAae9cbZzemmdbBDlJOoxk/VRxwTnFJPePE29/BuiI7PRDRs0gbzpIBiWFnxX
 ig0e8B6M7bHrA+5virOIXEzJDZV5Hu6sWsWDKxhIMPKKK87l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wPROqAmLnhTaqMN3FYPU2WPTXZZ8Oe-C
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bd0a8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: wPROqAmLnhTaqMN3FYPU2WPTXZZ8Oe-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX/4b8+xHjo1wf
 RaX0ajUMoWKhSJjc35urWZNUw0/y9zaWH2NJhGTkf84ALAtwEqQSpOoVp5ImZY1GBMEh2N0a7YN
 Eh5ypfmfNZbS2p8MTumOM2EWKjl41PPMLvYPsjZZLyXHvGIwDfcEmtJmQKB2fXUF4s4PXgigVt/
 RYwX6q8+GkSfm23q7rQZ/RkrmqT30xI6KZ7WMbzV+pke9YqXHbMAD0/nzNqkPPqqxwxkG+qaiS/
 KG8OTJSdKI70Y1fHiQwmk9PO+TpZuSHzkMw43QrCsDVIFwmsWsRdfshVgfzpItOL40fVQEfYePu
 lB0KRsaI/68vV7RpijzP1GAuwfdb6aNSdotsV+t9vgl1XhONy3qvZea5KjZpXnkl0w4JKyT9PEI
 YUgNrQTqhsp+cIVGugGiztDaOvCbxo8Fs5xkjAagpLEkplRSE4K7Jc5ZDA1r2VMLFWnVpwEK9YO
 NnhRBsmVJ5R7mg//nLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzpcCILDPtGjV
 mJr1D9gCAXTBxEsqNCLhqY12D//5AJa7zpQ1vJRYBA2P28SRrpkakDyoAEZn+z0p5GpBG6ot8kl
 /HmMYRmTogZLNS42CPlzWRLMDxKVFLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64670-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D38C8678506

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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

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
index eeef453c583f..e2fddc29abc7 100644
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
index 261db38a013b..64cf182d67cc 100644
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


