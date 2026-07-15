Return-Path: <linux-media+bounces-67700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ouMELlWaV2ocXwAAu9opvQ
	(envelope-from <linux-media+bounces-67700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:33:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1269575F70C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WFGbFU5E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UFpRY1pQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67700-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67700-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 280A032D103C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E37370AF0;
	Wed, 15 Jul 2026 14:11:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06DF3793B4
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124695; cv=none; b=SYaU1j87sGAXp5qiNfTJHuLS8KGjZAoNE4xrT9A4YiyBwA/bzbqXQJaxrDsqB/RSnlCzt+ZGd5ikdoHIyamdSxxGKzJ+IoM7aCJQAcbmutyBx9+hpEjLi2L1Qsv8bE6R709gIWzRK3bC2gLx+ImnCLKBrZwOIh3BDyEnz2mpCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124695; c=relaxed/simple;
	bh=1w4CgMY6hqW0RscoW+I4KpJUnvg/6sO9akTSyFxDnD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9L8BjW/UizC8aw+kL+mgBN+wObSAfhlWGMN1Gm4Lq2n0Ms6GyG/FirPYvcs+xVeInrhm0kHg+YUWX24LeEw2T4NJ1y6VzSSNDQMJHNyDlKo+PxFDf/k3eONNGg4tQKtyJ3/kMn8RjQBqFiqtfOF2t0pMjsocbJfOpQG0k9h4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFGbFU5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFpRY1pQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3ZLU850924
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etB4FVaixj6pjK5WgAj9fa3+p1eiXpv7Kfpsfz5keYg=; b=WFGbFU5E/T6Vss8N
	ol1kJDo1d9jSMHvwYK7ICKd/2KfaCcxeU5idiOBSPXTt4evn6wS4EUyIjyFb4RLs
	eE7adkS/BRKfqjN3vkaXLQdv+1xkcfaxY/Cm7Ykh9K7T8YrkYz9hq+k7UhEAcaGX
	j3yzI9HWD+zKOjj/C+w9cSPU2gdZxJoOur8doP0gB0dIP3DfWNPWVvrbKbsloS5b
	qoUobmCxRZ0xkpU5fTh/ihvIu9xtifKeAxhsmX2/KA/o0t5f/D+ZYzyjpa9i7xPg
	A317YMqMloKZ98RWYiWvTh4cGQlvhUXSl68qgJXr3ssLfzJzOfQ32Cpe3TT50unT
	RhyPTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wsej6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso124938395ad.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124691; x=1784729491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etB4FVaixj6pjK5WgAj9fa3+p1eiXpv7Kfpsfz5keYg=;
        b=UFpRY1pQv80w75W/v5EEOCcmPnZ7IhanjMbZJ9pxidQo1Bzv3FsvSu+tmZsJxIHAfN
         bndjJFZf6u95UPvPH1+t0WrqY0P2IcF294zJSSMt6DWj2k9XPHZ9QhyMXUYL8B3ORNGv
         rjHaBWt0ky9mczgwut/fjT4NEpu/FpdKNHuG43BLwEgGOYTEE7FP19OGoqiFCbuS/ea+
         5UR8v856MbZIidwC69MB/V0ACMyOfiern3qcvm9GSBVaWyVvFYulk2ppJ4cjURi6Ta0D
         7lxR9DIYDCjwOUUMVL7f1+ZWuXZvPeUdpdw1eO7z5TskjPJ06i/aVMyVrpbhvf1scOhn
         6x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124691; x=1784729491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etB4FVaixj6pjK5WgAj9fa3+p1eiXpv7Kfpsfz5keYg=;
        b=TL2I1ZLZtWa2wjLAqn4oebjr0RZ7W5xKSzVIARpEwVES8t3EdywCV54OcvW4o8qVZY
         t0Bex+EWBJOAfOwRuFysn/DgrU+WfZVSJHmIjn+liqT8M0VGOXkaqMjBa2zhkgvF5OPr
         +dPDtNjp3gwOdZGiw8bLIb2Td89O29OzyPAUD/oq+BNjvDOfXj3v0rs5KxKqAs8M6OEw
         R0LC90k3MAS72NSeZCA7nIVmoeu/HgwS2AM0OMEnuheizSNQgDJSfKPBktzZc3FxKDxK
         RhGh9BAYLV7k4bey+DCvdopd9s944nspSVoceKpOp+1rTpm7sSvJ3U//IyX60PO7MDxd
         Bojw==
X-Forwarded-Encrypted: i=1; AHgh+RqyeMtDNd2LjGNJ18IittmZbLtDTwcTtlOKHlsvu8g42KPB61xQMjR3KliFk2/nVBFpytWoPBL1zTcWUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCG6y0pZgFy3YKTfNo3GbKdU5UGTxSo0rQocKHQJKzjNSlN73B
	NZjvl6scprO/BJzA2LEykUl1gtuJ3/AZB/MqzvpEWkIEBGZ5EjPgRHqG9wV+Q9WUh9c8bwaSIuI
	nMzMgrbBBZHJoJ8UyOWKKEiECbw4YlX7meCW1rA2xYsT8tTn0h/R8EDk29MCa7aJvpw==
X-Gm-Gg: AfdE7cmGT/+coh6rJEv9ZKq9fuqVCks0Cf3lvYbc2Nm9BOkOzyGnkRbAofWxwrvcSle
	6p+/A0BjSE+QvvaOPoKXQIw1cUDvMb/5+zt+SWTDKCKCZCvOyQemJDLI9kBzAzzQzQGZCQb7k06
	jFSxOuRAkB9sL9+IbGPcgIrhdvjzhBda4L1+OzpnZAi3yKCXN2MyMfGdbvuSg1qzKSvF3eqBfVS
	Qs9vA25gIRhV+pd6kx3DP3xqPraJCt/w2y9ETOrdRiJsyXQfAOodmjD0yWtlNUNIzWTuT7yYcfL
	9vEGkrTXk1n8SI46N/gxdxzXblunkO0bZ1BuL5HnkmN6UvX1ZUskBeCflFtU+OPVLR/yFuAee86
	SpHVWaCPD+qnKctR/83FA6aU5g0+uEFYI5G8wXm1ByG/L
X-Received: by 2002:a17:902:d48e:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2cef136496amr67063425ad.21.1784124691209;
        Wed, 15 Jul 2026 07:11:31 -0700 (PDT)
X-Received: by 2002:a17:902:d48e:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2cef136496amr67062995ad.21.1784124690562;
        Wed, 15 Jul 2026 07:11:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:06 +0530
Subject: [PATCH v9 12/14] media: iris: Add platform data for glymur
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-12-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=8204;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=1w4CgMY6hqW0RscoW+I4KpJUnvg/6sO9akTSyFxDnD0=;
 b=R5qk/6RNBdmvHYruD91KzWcpoIqOK2ct7dMvrRVi7BraHvG6bqrP5XrTV47f690jYHqUBGLLU
 LNlO9T7qsybB8gnZSDlWcFdCFr3PEw3A2O58UYHiv8BvHRz7Lqc0cGr
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: ikc2_6XxOV9v-OFnm9uC1PQzp3WrdAvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXyrivlbx2gT5J
 dvN8PmDsYych5bk/S1NuCPpxUOiPBSt97gV3tFkcF/1FZQwcsuK9RDzZRKt/ruCp9jTXDQFbY5O
 dWfd4LWdFw20LbGIqzPg56Y8uLaBCg/kEfHW0NEdCCXMIzYihCjRX8+kBeYXv/ckuZxpWJB8v1z
 ZdNuuEWFksycz7EU3k2UZXjK1X5Jcf0gXX3S1TpGWAyKXwe66Icj+9ilZ6+zKl0l8zTd9wR5pgG
 2T914xvyYQtwn8j33fn96xYLzQBgcGGv4CHreOLMTiH65ZgI3fNwg6w2Ff6SIp0Ts+tgjeYRF6X
 y23wJi54AU51XCsJ8uwyLB7b28JODoAABZu3MRdH3q+9iVsZeaJAc00ZWTdhYyRO4yg9r9rjrlV
 R0gzOxVWdoiHYyOHpVwpz4QvA7iyfI4TRUyxPU6MamXtSq1JJk7siIlujqt9DJKbXfJRde0RK3J
 WSAvBQwfo3aJglJ6q1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXwHqAHYNErIy0
 RwkFWZRz2ddKwvA3HhL62oLPuegurtX+N4DMiJj0bZET09grScUk3+EJxyTLTgJfYiq60E+eYuA
 M4zLkJg6dhJhcsG4/4QNIFZXboLymqo=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a579514 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0Xn_3AH55rwbdtokavwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ikc2_6XxOV9v-OFnm9uC1PQzp3WrdAvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67700-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1269575F70C
X-Rspamd-Action: no action

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../platform/qcom/iris/iris_platform_glymur.c      | 78 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      | 15 +++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 35 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 6 files changed, 138 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..48570da56aa0 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 99f59b64f853..e182030bd537 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,10 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -53,6 +57,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..49edae8120fe
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+const struct iris_power_domain_data iris_glymur_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_iface", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+const struct iris_power_domain_data iris_glymur_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
+	{
+		.pd_names = (const char *[]) {
+			"vcodec1",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec1_iface", "vcodec1_core_freerun", "vcodec1_core",
+		},
+		.clk_cnt = 3,
+	},
+};
+
+const char * const iris_glymur_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+	"vcodec1_bus",
+	"vcodec1_core",
+};
+
+const char * const iris_glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const struct tz_cp_config iris_glymur_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..9f2877ec9901
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct iris_power_domain_data iris_glymur_ctrl_data;
+extern const struct iris_power_domain_data iris_glymur_vcodec_data[2];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 72dd23dbe02a..4049e134c3f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -48,6 +49,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static const u32 iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -83,6 +90,34 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_glymur_ctrl_data,
+	.vcodec_data = iris_glymur_vcodec_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.num_cores = 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9e96fa218dea..6ad553990c89 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -493,6 +493,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


