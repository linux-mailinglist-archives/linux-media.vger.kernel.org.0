Return-Path: <linux-media+bounces-55639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ANnDSvks2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:17:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA22814D2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E80A30977E5
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C0D38C429;
	Fri, 13 Mar 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EngBqMXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETi25XhC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363538C439
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396797; cv=none; b=PBNDpMF7SocyKRZd0jfsxtp7gMBTmPhu1v+CNYGfNDsX0UO3zTFXSxhBLj2G8+R5ELzc1ssr3TBZEv5YS+3K+ZzIaXkdJFEdBWit7RkjIKiEKoq781kz4XOfu+RlI8QKt3uEDvarPpN4Hhg7F1+VAdN/VVOjYBrFMXIE3mjGtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396797; c=relaxed/simple;
	bh=k88ZkaYOfUiE50vbp83+j092cB8rPIF7jixvSqDEts0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OhHAPhcqj5aYXYA1Rn4JLv2vdQE3SKUsCRXA4mkOV+KgH3l0i/pxwOaKRPjrfiW7DhDw1TwtAKYDdmVv3tdQyI3KZsvFejJ0pQPO4PEj9Jsk/6CXwHZV3xy23WKKcT88FoOK4ybEKohNm3fa70zuI6bM9MRBPD2qs8+B6XIEjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EngBqMXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETi25XhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iM3G2262607
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vp4yq2CoPQaG2JA2XRmlSj
	tidh91C6tJHZDVnicU/do=; b=EngBqMXSkvVsWpSZk2njoetQcR1hk8DuOywbyK
	1rjqHOS8ihzBRgmJMuLCftqRI3Ic7gGxsHlVOTdp6EhZ8wXm/mPMYkyU0hmE55Xl
	XGsx5HnRnPjtP7ZfZgIgQM8AFI4kGpuo7Nqg52/amw1Q1tx4YWWit8AjlukuoxZS
	lzoiaARpxEQ/7O45jA8Wym9kgNijin3bod8TsZ5zLBVe2u4gSOLxWLGtVNQt+3Wm
	7d3Rm5iIgsQF6x5V6PrMuAhUjEmCoLNBNae4jwWTyoOa712LUImyh2XBHhFi3l6h
	Od7Onk8ff5YJzszM8afirHxujHeL+cQlbFfGQnZvBa1gFdjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rhp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509114d7418so31058641cf.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396792; x=1774001592; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp4yq2CoPQaG2JA2XRmlSjtidh91C6tJHZDVnicU/do=;
        b=ETi25XhC5vfx3y7FlLGXRk5uwCf3Z5DFiIMGpXOsV3j5YTeJqGFi9hIsxem61J7ifV
         Irfq15B9sjz2c1SIyBZ0squRuIJnTld4qa9Pl05Mt/ghL66fUU4v9ky39uDDf2lkfKYk
         /S456Fqht81satavddJ/mZHbxsTIQ0rFYmw3QWbf2/RlbiF1Jg2CUO3Dy6kLx9ETRbMw
         0YnIPmCO7vgQQPs8Ww5N1h4o6c7A6V3fgeCWbkV8H7GSb78ShyiSqj4ov/EnxdfndWv0
         LkwoCIIlJGIPZBqBkF9zleojcBIJ5+vyk26tAajDkGy8RlJEuKHpXTcumdTDSpHK593I
         stfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396792; x=1774001592;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp4yq2CoPQaG2JA2XRmlSjtidh91C6tJHZDVnicU/do=;
        b=o+0KD/goAmC/nR8mz3G3WDaM2m917s3+E0sc0eihQgY0ssWbg8iYY0BLbPIfdBgU9K
         NNLURVX6VZNi7sEtV7zZJr8vghtUSyvb/x8/R+t0kar0uTRNJJ6JHAYrDzeLkkj2YH5w
         Sa2Fu1DngFS36kLTbcYlHC9/ZLZ5KcdJsQ57SYLCumdwTaIDeaWZNxuMtKqvzeTGdMmk
         lHH01e0M+iqBRLGT/m/qK3O+aJMEoJOvWfK45WBm2FFlLJyT8CpEH52+Au3mbLUzJQrm
         hYiQI3WSHXdbxuUKLTUY6fDbqL6BEZ+a+VndKKy427Co867LGiyAceEAEXsugDaCbcfi
         PVNQ==
X-Gm-Message-State: AOJu0Yx8vvHUMToIq9zvivsa7Ah5YPBOKWSDW3/DVPNe0jsumsumZaqW
	EZ7DR90KOBMot+MQCwTZNzAZQAUOH+WqiYrgGBVddHBQIAsw5T4w/OX4V3+R/74YBrrZ5FtNH8z
	h2GZkJY93CbC3IMvDdMZrMcLBLnAYwZyDtLNezsLvpbLmcTMeXaT/XajKkMSJ24QUmw==
X-Gm-Gg: ATEYQzx/x80AZRSNi0jqGSHj18ENdZc0XA7iwNmvFjD7eaKQcGbddJJbMLMCRHolRK4
	/J0PESW1GumnMRwJh2DKznHPvufexz1QHWvqSYmW2QO/ld6697qSwfiQ2UrWDMpiZhvYSTk6V/J
	tpsl+ptlIWWtuhvLsOWSZWXQHc8xFzU9bMiPeUJyBCIedR2qCMiGPF7HcLpGcfztwVoroIOJmpC
	uCcIKuQAxmpQOO1j7Eovp3hCWKv4Oat7CDBlppe0AeVx3tIQSptQnlx7hBGhHEu7IQafBPxTkH6
	XhsVDYAog92SjXRWhR/111014jLW6V/o1YeLuOIA0l5iW1+RZepazpqM8Am3qbXS9/6e2yFoWPx
	QP8eoI+zB5jJ0S4II3dzu0PA92LgfIf4nUyS2EXy4BECmnC1hVBPP9VOTg2WJP1uPUo6mhaX4Cn
	n0rRibPX4SsY2j
X-Received: by 2002:a05:622a:1344:b0:509:2222:41fe with SMTP id d75a77b69052e-50957e472b2mr34005641cf.61.1773396792208;
        Fri, 13 Mar 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:509:2222:41fe with SMTP id d75a77b69052e-50957e472b2mr34005271cf.61.1773396791732;
        Fri, 13 Mar 2026 03:13:11 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd5274sm53628846d6.3.2026.03.13.03.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:13:11 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Fix clock and IRQ
 configurations for sa8775p platform
Date: Fri, 13 Mar 2026 18:13:01 +0800
Message-Id: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3js2kC/22MwQrCMBBEf6Xs2ZRtAlU8+R9SJCQbu9A2mtSgl
 Py7a89eZngD8zbIlJgynJsNEhXOHBcBfWjAjXa5k2IvDBp1j6YzqgSaeKVb4LdCtKank3cueJD
 HI5HMu+06CI+c15g+u7x0v/W/p3QKlSY6ekL00peYc/t82cnFeW4lYKi1fgHgQXKHrQAAAA==
X-Change-ID: 20260313-vfelite_fix-00a36e8dccfd
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396787; l=1052;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=k88ZkaYOfUiE50vbp83+j092cB8rPIF7jixvSqDEts0=;
 b=7GMJdYBmxrgi/LHEh4HGlEaa7MxFB2Y7qDnJu0K+kfk0D3/HOSDyDijJD6uBAU1TrDB+wO5+9
 LcCYiw6EowxD+899DFBiTKPxzManfQUsDPfqpIIk3ulIZSVdUYtN3HX
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: gbVtU9LRfzQA2FJ1KAHUU7wHoufiO8W8
X-Proofpoint-GUID: gbVtU9LRfzQA2FJ1KAHUU7wHoufiO8W8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX3Jy9lcrksoWz
 lI/RtThs4IJSo+loQv7fRVelEHT/d2qY5W2uZw+K+8rs7+1R9PXBHaW2aSWmrWy47SvRWGkzh7q
 Z62IIvQOQCPOgWLIECpBArhwzSLQoI9jSlAIjG0lygqqoPbgZMYLKXJW8PMT+yXwdD34LOQk0c7
 CjywUMZ7u7uxBcpLPLqbXItLzH45kMHIV/R0rQe8b0CmUjMZeHPMTTu8zW5aH8gWOz+obJtlEML
 pfe+JKc369xZQ1UdgMw/2Js/X5t6FNAluT+z7Hz51XC4Et5UHauIxL/ILZonKY6VhpHYWnc9UQJ
 F92Uie47IaygVU1gCW4Mu6UE8C0Tx0h8s6KSoySrlw2aI1HtX3QeHomLgDeNbFfd4N++POP3qP/
 b5wTPq4/Gbj0NeRHnFFK+fS2lQN9zO43KBG80rBDrndE0QaVlF3U8L13rB6bvgTIvNjbuRifIqH
 UAWQQ4527/IiFsAUzYg==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3e339 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ziaXHUkB2o-VTodMPeMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55639-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DDA22814D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series contains three fixes for the Qualcomm Camera Subsystem driver
on sa8775p platform:

1. Fix CSID IRQ offset.
2. Fix CSID lite clock configuration.
3. Add missing clocks for VFE lite instances.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Split patch 1 into 2. -- bryan
- Remove duplicate clk rates struct.
- Link to v1: https://lore.kernel.org/r/20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com

---
Wenmeng Liu (3):
      media: qcom: camss: Fix csid IRQ offset for sa8775p
      media: qcom: camss: Fix csid clock configuration for sa8775p
      media: qcom: camss: Add missing clocks for VFE lite on sa8775p

 .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 +-
 drivers/media/platform/qcom/camss/camss.c          | 80 +++++++++++-----------
 2 files changed, 43 insertions(+), 43 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-vfelite_fix-00a36e8dccfd

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


