Return-Path: <linux-media+bounces-47088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E200FC5D6A4
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 709EF35A312
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2086A31D756;
	Fri, 14 Nov 2025 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+purGcU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxqmlJTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6CF31AF2D
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127511; cv=none; b=A8OjzgGto71dfbjx1bLdY+hrbV6It/GkhspQa4BkpEuSCXUPizzkGTf23NpWy0HudTJHSu51ur1OWp5RjUO0aJKdZiVQsBJ8EC8r2pBRLqYah78CFUR18WzNLXbwaLCZAaeX7lccX+unsZCP/smIUS6AUTGrDSW7qD5B4xoTzeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127511; c=relaxed/simple;
	bh=0NkF0NdVe3pPnF8W5iS6qPH9EuGCPN1nDNdGvDSBh8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XJ55nTV03D5WrqbuZdP1IAuvVPEtiBOG2PRe/scNab9p7urwWtXjpIjsMNf02Ht+f7WfvY3lcccFsVDl7tN/O6cIzXNwJf3TZoT2zFFXRUEoWlF7DF9U+1lSIeyrSlIja7G2d6EcVWMUnzLIIhwo6gS9WRdqrobg1vGsxsr45mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+purGcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxqmlJTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8ahLF1537328
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+PsWgSGfauRFI+F7oWnTeCfSsY57hSa+I5A
	qRnu3br4=; b=P+purGcUc0ZuKyH8rCfDwH/Zc8bioodjQ/GxhAuRJ2DU5VnsyBy
	WBhKe59miLAe6SwxJkrIdOVYr4er8aXfZfsBurirJbH/hL+83cK08sJkUQZmp+Bo
	3+8ZaisIRAeM2AlbH8pZgxkUOIICooVhWttrzNforRlkhTArYhEkIU09cJylEZOe
	jK9wZmPqsGcNGSwuY3d5JroRVw+Zi3iha5rAYxi0SOwuwMJA9hufMEjd0KBlQwlI
	xo4IM1BVGLpd/O7Mgqrd1lJ3jAkFMFrOIVzFJKlQni4q5lIgK0pIXAJnUR8gL6yJ
	+Q6sXZw0pqUvgeF6hqU2H4t9C+RQpZQBp0Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hta8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb3eeae67so67045241cf.1
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127507; x=1763732307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+PsWgSGfauRFI+F7oWnTeCfSsY57hSa+I5AqRnu3br4=;
        b=GxqmlJTQcj4zJjt8ShVoB7uMbWGxTkt9B13Y7Me1aclOHil8+KHr/p0U+EBHbMCyy0
         7kWHMF1I+L9a5KKm4luy7EK3AyH4fUjcGNjKNJ9rQ6JOGcppqKFej5iTpmc+apjAuP5E
         XTS/7xYhG1Anqk+o1W5f4Mb//nlKde1dfbZv5Tzp1JEeVmQPWjv0/t88oRjYgwiPFayz
         THSxUwAYwUyffFz9uNAc7+VoPSJPCW1FRbyH13Z+5fF4CvaXY8cZCBtQCi/5kOif2q3g
         d3BsXnszwAHyxYTlaZBsArgu7hco1YcnhvXDSldnitfmUliLJ4nipywz4385fVB5CsWy
         g8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127507; x=1763732307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PsWgSGfauRFI+F7oWnTeCfSsY57hSa+I5AqRnu3br4=;
        b=wGxFqcnv94nZ5CEw3E5K3CH48LrZJKH7movEO6DYtmNS025HMJJU+Bur3u+3Vbzkzs
         lPctsji4AptEjVRpy4EocN3VOoM3WBSpZ/qNywST2lplhop+SsEogfd6ZwzdR+RBsuAJ
         bJTnnW+VqOWP2kYN2JO8UUuhnB7IDXgVlxv0gfLazBAKAJo1yXAs/TXELtGih7TGILnJ
         kHBSvVfbC5MfjHWOWZY7GX/wMTb1E0ar3WwiN8am8G0Adgxupg4p3+WDAcaRMS1bmc6X
         ttH8E4yTiUK0lcM3xTv+OPD/3aexbS7eI3T3HK+zWaW3DUBkbV2rsymlbUwcoFTxuFV5
         P51g==
X-Forwarded-Encrypted: i=1; AJvYcCUynpK3kOkUvcQx7/vOiwntxN4ta5CnYSUTc+2nbdt9VS2HJvCPbGwj/sj0itVl5zPiTUtzutX1boL9eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFhugX15UYxExp3GgzPqF1MpVEf2IWxI2nY2uh91L1F4QvWq6
	RqJkiwIclIwy2GlXblKR0y9J280XVQAK/QKvGJ5R+Jit+e8ZMWumX7vFw3JmSIhSaBtYpOjNCr0
	IoERPHl5k+mef9LcD7e51uD9ochMS6IuJiffTnlgIT6Btt+64EbivXWcvmrRVT4jMtQ==
X-Gm-Gg: ASbGncuxlRyzk+X5NwDR/2KH8cmSrQnfkmJldxCbyvo3oCo0fmJNMk+gS2rVeyANDW+
	NdmfgoHs6WoyD1Gp9eBvGl1F8SF4hvDC3YLmBhZ4Tmb2psXzrBdSiFg+JfBlixbxpj050tWrQkJ
	bhIOfEBGPuN2HxDa7FisBo4Qjnxd1XRjt8NLaLJIbKfSPjK3hkqQ/Sl8uK9DP4wRSCJSGcrAGcG
	sGxwhTroYWrqbCCX8MFgPjpTSCnHX/bNBjAVh2/IRzu7sR5uwM+a+L1AAPA8oALdIkTBlYaUxws
	Z+501EzBNHpqF81Gzyc++73qf5V5An7TN/Kzk5INO6Zw8NUj5HGgjUib6hl5iXSWtvp93hyDtGW
	yp2Td9BbOUUNt9KhKT+byiSAjWVBrJLmPO6PfwqMykH4Z2U7h4mdRH5JmM6VSSjZ1ag==
X-Received: by 2002:a05:622a:1ba1:b0:4ed:6e15:d2cc with SMTP id d75a77b69052e-4edf210c041mr42546501cf.54.1763127507597;
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt0foB30s0JDyRT4f4/1sDpau+ybRc3AhZNrqIIssYYE+lantsGfHNPc1iTVasNrdFAjd/aw==
X-Received: by 2002:a05:622a:1ba1:b0:4ed:6e15:d2cc with SMTP id d75a77b69052e-4edf210c041mr42546021cf.54.1763127507073;
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:26 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add QRB2210 RB1 vision mezzanine/kit support
Date: Fri, 14 Nov 2025 14:38:18 +0100
Message-Id: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qs3y_cCF4bdMawKRzO1-2LxRghKxjaBV
X-Proofpoint-ORIG-GUID: qs3y_cCF4bdMawKRzO1-2LxRghKxjaBV
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=691730d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=i7rZuoVbEr22-3_dwz4A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfXxRlKPc4vmLmo
 IFZUEkkEiDGxdGxsrsyF/eJSN224jjG0I/hYzYVhPzebQxLoDEnOe19cMw6ptFwnHjiIinELsTA
 1gZtMNKa3mQvA+Q/lBmy/oMNOCkBXu4j6uw1qkz7PuDyO4xmC/AuO3N6uAdT7Bip8FomuZA22EY
 RzA1lFekimbgEko9r/oNeyAqpaEMqStrhqRsW84kQ7bZgwaE23uW5J3yBDX74dAH2GGRnEtIdYK
 nN+xlqSCfE8TOeLBoDm8ARaTD+XGSQS0tJJR0GdSCm/zXf+6qedXbhC5Igchb37pRMybdB95xQ9
 EJhkklvx+lrhDsJRSjJKIEXNs0sVarjv4r/UN3aVJ9fTviDGd6pgphCxqWssyEvWqS0WHS/Ovla
 CXdvHFqnSdPjJuIQFgnJwD5KH4UoKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140109

This series enables initial camera functionality on QRB2210 RB1 with
Vision Mezzanine.It includes device tree updates for camera-related
components and a fix for the OV9282 sensor driver.

- Correct the reset GPIO logic to ensure proper reset behavior.
- Adds pinctrl configuration for the four camera master clocks (mclks).
- Adds the PM8008 camera PMIC node, which camera power management.
- Introduces an overlay enabling the Vision Mezzanine board with OV9282
  camera sensor support.

Changes in V2:
* Move mclk pinctrls to soc dtsi
* Ensure backward compatibility for ov9282 reset logic
* dts cleanup

Changes in V1:
* Use correct polarity for ov9282 pin
* Fix ov9282 reset pin logic
* Remove always-on from pm8008 regulators

Loic Poulain (4):
  media: i2c: ov9282: Fix reset-gpio logical state
  arm64: dts: qcom: qcm2290: Add pin configuration for mclks
  arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
  arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 28 +++++++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 65 ++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      | 75 +++++++++++++++++++
 drivers/media/i2c/ov9282.c                    | 26 ++++++-
 5 files changed, 195 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

-- 
2.34.1


