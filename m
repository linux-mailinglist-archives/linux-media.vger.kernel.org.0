Return-Path: <linux-media+bounces-64950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F80GBr+TMGqTUgUAu9opvQ
	(envelope-from <linux-media+bounces-64950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:07:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9D68ACB1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:07:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mwzwqaci;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZRsZjzBl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64950-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64950-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1791301D533
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D100188CC9;
	Tue, 16 Jun 2026 00:05:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1EC1624D5
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568321; cv=none; b=Iz3BXbrRi0Jzmyh+9PzG130JExeSbHZburZMfIvdTu3banHHFXVxTdoWpZW+UzclpDvOaFmmp/lGBQxYPLHmZt6rx4DCyjZsWXoluW71qtKPTM8Lgh4ZVth6Vggld2rJXsqM7VcMDbiQrDhvBdEVsMUI7hT5Zlmpn7By4TKGMBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568321; c=relaxed/simple;
	bh=z4UvlLuMnEtqK/mLIS5Po0b2ZhrWKH0eSyWDRWD5s7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3wgcyGKgJ68OyuGDdwEJnnAGb/T1bv8nHDXd/qz2KtZfkfgRiJdteX8N/NE8g5WcEserR13vuEAMhrMnbmbDbSr8p5DGgHD+vQ3YS/mW+LUlxBU7qnLg0MAFhvAkStLd2CMdzi3dKtxsoYy6V9x0ha+7lWVMKo74Cyo7Zy+EP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwzwqaci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRsZjzBl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxIH7861237
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcKWHiV3PIVeEfWstVYdHMZX8C49G/avdEPkqKGjnhk=; b=MwzwqacimipnwimI
	Wu7e7oIsxa/FOdqepKuPq5Z0WCnxSuEAl2ydVHqHhkcsYrFUv4MU6Qp8sWh/ZuR8
	tqSIGm3s6+fNQiEUGkKU27rxs8ZHbxlEFYGMoUePfBrgWM4Bxpsv7ST2KmClcVRL
	VBU6VuwHdDDum4x/McbUlahEVgK7X8bV90PjJTz7plY/2DtK/JJ6WsOrBlusxAaN
	DcnOMo3ZaMgDFVHJcC1zohSWBdPezRSiYwAvOyxilry2l+Sb9IGQxamyqK18Mke5
	+VrMOgLHkRQDG0B/jzzTkDdijAOxbZmVM3ixE8oLQ1Ti6xQJo1oFTB1pI944vygh
	c81S6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbms6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915b3587972so375796485a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568319; x=1782173119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcKWHiV3PIVeEfWstVYdHMZX8C49G/avdEPkqKGjnhk=;
        b=ZRsZjzBlx1NBSquN0um9+XRkCklyF+HS+LrSCEYs88bBBjYCPEm9aBvYi/zMLVqQ0G
         ut/iS1ywq19L5Q2vZCZY11jXDIYq0MauolfjQXUKvjayEUWXzcS8scyfAPxr/U0Y7KVD
         XMt6nWC8DDnpyaxXsX6535rUgLi9TtPEh189/9VawvnnTcQ9GZWKoES+nJvPwbsNXhUN
         kjauIsYbTx+dqPYITHsxP8t55JTcqETl0rKdsvntPx14kyxu5b87o+L/Rd2ib+iDFRV6
         ofHzzQvD9q30KwRyJDQtHHNOw4grp7Qmif7t7bfUGzRkmcVNdd4UdaLUg3+Jqm7RukcY
         OtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568319; x=1782173119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kcKWHiV3PIVeEfWstVYdHMZX8C49G/avdEPkqKGjnhk=;
        b=VAZNBO4uDPCicjYjXrGWxtFbQiC7c1AFjBXRhX4XPDYXiuXb+g/3B3sqBlNySKDRyI
         DkSOZ3Dhvp0lDD+STqTc0QsYbHToEYhJeDG+jlSIoomOov4XMLzddXvogyT12kLVJMcr
         Aqd91Zif1ykXNg2jSvWUo+2t18KIFgCaTtI3q+M+24OfKxKriybmxwgrMhOXiCeE+Py+
         cJsdqt8q8jU/9s6pDuNrr1ev1ywAugmAyw8JWbYBo+miVnBSOww1OeGp3WWx+lAS4EEg
         mSsor72oEHwrLypO9HevY7hBrM80ffz8CZkhxxjFm7oYIMxBGGyIqHK9fkIR41lSeTAT
         yJSw==
X-Gm-Message-State: AOJu0YyKr/5qXsaOOySlnBXzSURUuhKivCPX9gR2HaHioHK+lLmcjV24
	HQDYwGxCcUa/DD0Kx3bvDVTojlTLAFlzD+/ReJUzul58283RTBeGyQc+Xjy9qaWnocdsZAm/TGR
	Ud9SB+i2cZB/gnPWs0M3bLZ2D2bZ6bsr6lsMp/pzOFVnd5Z/IFsBVjecswa9ulX4ZnQ==
X-Gm-Gg: Acq92OGpAmQFi7eE7M0GoDPonVOzKc9quhyPOkGyHNw1EMbIpnac5T3qkXfAQHi3PG6
	1rEdKSXH5Vfahd0p9LEJWKi9rNxiffdA9amhEviGZ49wo2RCXMyOzZOLiY1wVDrNHsP6xkx40wr
	hmF7xaRVt3/fHULYGaRsgXtEDjNZNiKdXU7MtHEvfzma7lclatY60Fq2eN8YpbN+fEo4KxXF6Jt
	X61db1oG+nGsLLu+XXay90gpdMFsdyasaqgBC2qKBnVvz/qeUppr6oqzU6+5bTjnGy2PhwtG0hu
	0ZMSBiXc+gWccXDpZSAvVDxD1GlD13G2+koff6KP5nJE486Jueo7nszgeAtGYA35ZivCqPbVUJT
	njRkK7bTWIU3aT4q2BarOYZaW5pA0ySCojr8NF1t3STZWmnQcg53M6ad12Hfq7YlKmeaQcX/7Ex
	mk015BwnzqjBF00HnWrgqfut8mBYF6rXTwFYM=
X-Received: by 2002:a05:620a:288f:b0:915:bf79:3e0c with SMTP id af79cd13be357-91c454141admr233328085a.4.1781568318705;
        Mon, 15 Jun 2026 17:05:18 -0700 (PDT)
X-Received: by 2002:a05:620a:288f:b0:915:bf79:3e0c with SMTP id af79cd13be357-91c454141admr233321485a.4.1781568318181;
        Mon, 15 Jun 2026 17:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:37 +0300
Subject: [PATCH v5 10/16] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5661;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=z4UvlLuMnEtqK/mLIS5Po0b2ZhrWKH0eSyWDRWD5s7U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMP9g5nklaYa/KQV+8JH/N7yIxgSekcTrE72
 v0bY6vrW3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDwAKCRCLPIo+Aiko
 1TBeB/9zgHf57ijJTGoPAxVFBPgk2owckJ91zdSxmgyVnF0QGIn9tNpQGVUIvSo63QPZe8RUMEb
 ggPPb7NxXEKtO4jxel5J9iv1bhJjbDryJskSMM1ntpk4za9y8NGxIOH+wjl7m1ho9wXU/XsITvs
 96kalButhX17cE3b7bH9AiKIPEuZY4jng64GkNtPRsjDLEXLcWnCiS8b9SFOPED18ruxYPpu5Fl
 lrrZHyRmba8EL17PfiN7tCjumW85ZP97TZGTVKTAg6ats/PxHVKX+xR9P/vWBVEtn8gnzDNFPj4
 hheULXOjjpfxIWvI2cJU9Q4WG9BxJRIhxlmgFneUw6Fi8oym
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9hfLS6cRzRSjjDJZ9RHqpVLib1bRnb49
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX9lNYusmZIh7Y
 dII09aZee+0veqO9oP/ZnX39kVkQMvGSLk9TD4hzXfoIDljpZdIDchRI7j0oanVg4MfYM00AbIV
 v5SkMoL3CDfYQJqxY9kChDIO95XEdKc=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30933f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=O8_DsgnrxEnowPJBzLQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9hfLS6cRzRSjjDJZ9RHqpVLib1bRnb49
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXz/qmEOxj2H3A
 BmklJe5p5SMZnyUc2eENcQCTI7n0OJbYaqxesu4rNKRTw/8vgDdxlGQPSp3MeySOj1kKrveq7Hf
 Rq0JN5Tv0Yisit+e83NnKmBN2llhKflWBiKGORierfWQI+dOE9EWAcgn/V5k1xXBO7So38L1zo+
 NlsePTFIy91f1oy7f0IRZQ0UVfVqEuuHHpNYMcSMMqxMb3VdyD8fHsmkyVP8F5nkGydF7VcU9Az
 C+scBOU/nnUEgr6HXJ+MhlE7COOxv6yCk1PnBH2QDRZd/CxtuHbgalbsN4nzCg41hH4MxC5sEVb
 mRMtjNvHBWHjrhQkeOB88fP22u7WvtmUzKrUDDWCmGxD2H+DSwadWUsWvE8st2h8Z6ajNoOYUku
 JLgRn7VODp1WcZ83Ah3K+0qjS1Md+drEHfdpInjDuouF7iZqEJ5G4ToZM9AfmNpOC7aop5lqndJ
 Tc/VYshNsAdoK1ZV8CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64950-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,pkt.data:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12A9D68ACB1

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c4..99e82e5510ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee192384..bb495a1d2623 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


