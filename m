Return-Path: <linux-media+bounces-63039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPsrI2qlGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:40:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94F603C07
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FC0D30240AE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A023DD50F;
	Fri, 29 May 2026 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZ5gxadG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5lGPXlI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F18233948
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065472; cv=none; b=Rxvd+p7jGXVSBupyuJTVdm3sVRLI/Y3vvJWDs0J/Ze1qgx5FTYBIf4rZxhpBgcLGxvuTd42oaLV2JSHaXDFQrXtsAX2ZPq3pA8RmxmjytFblaC839S4qQ/oSEdPKj6kU0kGeRisViVs0mVuNMP7f+uU7jqohaqFpYpQnQtAblbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065472; c=relaxed/simple;
	bh=xrNSSChXSP6Dhgp1oFPSGJ7x8cfUiKmSoXkmQclw/u8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qm/j2mCPO33Hkta252RRB3aN8tKjLq1jHmHOAUlBJFH0AqpkCszGrjzTERUFl2B03yzzjw2DrM/4sacYP0uaf3MTpZqAyvBfMc+476T5e/hK1bMulWjZjhze1fFWUHEDF/xIsg5RIgVptCQWNEBWF+exEWYE/Ja8ihH4d4MMlQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZ5gxadG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5lGPXlI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLDrl154455
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NilxEkXlNSGx9SvphPrCyq
	fQL0cQzhwyxwBlG6uCIic=; b=lZ5gxadG62vuJGFf+AiMTQFAewQvkdU2G3+0RA
	7Msa/TX16tZa0C+d8L7WGJEHQX8xOEoYY+07s+3zFhAI+QG0bRWBrxTxTpI/YlPn
	QL8jxku3gY/+DWoS5I2XOafdJgFLJYtJW63cMhIdVywWQjpYqgohle5lvoi3E5E+
	mP0zsu+tO3ooUd+Y5mPVpdTtC6f+iuNd2IPXApGswXZGbs97fQByW9OPvieXp6Nz
	5gpMXJJjyLJ3beaigwwDRae5cIZAuQDmKZ4YJecU2heRP/9pC+z7gw+4GuWcEskJ
	I7iNpbypgmVfe4h+UnHTTOnrDC5Wy0tQ6/5SiUb8Qqg9S/OQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5c7b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:37:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827adbf00cso6482979a12.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065470; x=1780670270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NilxEkXlNSGx9SvphPrCyqfQL0cQzhwyxwBlG6uCIic=;
        b=U5lGPXlIiXl73f8KmMpq8FsPioIRsHUVsyhwbFqjOa118i6SneXKfv7I5KvCxSKnPP
         xH/sQ7/DBfWJ8eNdYE4oIgqLNn3s6s80CWqKOF716vChyTR9ChbhcAN4sdhrZr79yhE9
         cixA97qrrtUvhu/Rqk/55bzYiVHznqDjFsWZ8G6FO94gQa/V1WMHR6vqGuuCW4apGHVl
         UyddvmUwiEkgofV8ZR8fHI06G+u9l1efGH7G3hO1G2HquKnUgrJ02FRroi1oGJBK9+wo
         dzGvBEBcYSFQLqf+w7RJhuC6Cw+29xVxhZYQuJCNRhe3VIXZBb4IMvCnT4hOASsq/DJ7
         Bn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065470; x=1780670270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NilxEkXlNSGx9SvphPrCyqfQL0cQzhwyxwBlG6uCIic=;
        b=L8+vOvcTmMvTM7gbz+zuDJNZnN844W7FDlzAmNGGd+FbDPdy/+vg0Mf/+OQgbHGe02
         14kaDCbJBUgSJZ2loLdbA5x0our59AHlG3WRW2JojlRaa8NGv2LnlEvvsU+AeGrMLqzc
         phmnI2BY/AgcNKurCjhZLr0OO3zmueXZmDkD5IaIN6qfhKl/J5bdqBLiItZfjwoyldY6
         vJ7nTyFgNwLGTN5Sc3JdfIm1YzrWw7Z6kKGQrBdJ3MtFHp74JjWZmuJFNJXlz0NJZKqw
         XK5W1zItNjwc3y1QY8puspVWDBbWJ7ccQ/LQXASLIKz2vIza4SUXYGEG2M6xGLDrQJGe
         QkDg==
X-Forwarded-Encrypted: i=1; AFNElJ/BgLf71yingci5yzO9eyyq1qg36sLcJZaFjZOEOOiiuchgPwFz8dWfTeD4yTK4ESLatiwupB9SYWzyNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhRt52Z95ACfxxvuTaeCQGPk6xhpVInUQRgMPe18SffPTpLVgC
	+sUZVWVdkWxN1o1m24gAxjLLFODwGjDZx4pGEil4A36/8NaGCvTVYMxsritnFMUDi+7W4dZIIv3
	NUQ+ck3oU7uU3lEnpJPyDtlRqgxOLhY2gDiELn/U9vegABUBTtvZK83YYdToIqj7IfQ==
X-Gm-Gg: Acq92OGqfVwzD79czuI1oB+z0E1SZkqSyHZ3IZ5YQ1owF5hLklU3nlw3iQkECojiqRV
	7RHVJl1/nDoIIOdMnSTQGUeed6CraoS7WdnsFWHGdFk224E3PG7RGTviwKH+4baYN/7h6GnIbOA
	msFVDMozp2qXVne38uLm+WPujduI6kIvdiiCQnwEXZjkZFRGI0OB6J+48E0ixQKUq2CnlAq4qWa
	DZDCYYp8KK/OZf09P5JNP5vsDT6uLa+Efl9Fu2DWHdqwUuoyCjtZ9RVrLkwiL/A0iYb7Cd7iONV
	RIYSL6s7i98a66ObGAQcS6us+kpyBlD1uAM1plmbsTAFw1w9URPWngItjn4rmkbhACrYdmwsdp/
	x/Gha4J5HtoRpiXOkNvTPoT+TqKxmDOoRPB8/Y1ibMntwYKAkW5kEFVvKxfKmC3LcLg==
X-Received: by 2002:a05:6a20:a11f:b0:3a0:b65a:5def with SMTP id adf61e73a8af0-3b411e16d64mr3925727637.33.1780065470069;
        Fri, 29 May 2026 07:37:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3a0:b65a:5def with SMTP id adf61e73a8af0-3b411e16d64mr3925653637.33.1780065469345;
        Fri, 29 May 2026 07:37:49 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:37:48 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: [PATCH 0/6] Add CAMSS support for Qualcomm Glymur
Date: Fri, 29 May 2026 20:07:20 +0530
Message-Id: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKCkGWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNL3fScytzSovjkxNziYl0j88Q0c8MkwxTjFGMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAU/Pe0nAAAAA=
X-Change-ID: 20260529-glymur_camss-27af71b1d3d3
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1891;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=xrNSSChXSP6Dhgp1oFPSGJ7x8cfUiKmSoXkmQclw/u8=;
 b=lYpv+FN0QQXW4OV2NsfgGPreJxBFObPV4VrNpCxevLX6KUrkWm9v3ffLmPHH/MRIfLW6wFior
 4U3RWp62DeFDB9ak17sMFDSBMpkksBhxPfOux4yRGLwMMCXECLI2ujZ
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a19a4be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=c4NERmNbVgiTpoOjq6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: fkWoW3RGi53ir_iZ9y6eNCGdc2vHQGeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXxVmNl92kv9tW
 jefQ270TCz2MOmqM4oQK2nkFkzwjUYxr5mfP8RuLTHqd9Prs7kUPNWiNUayCgdMXFWkiriJdj5w
 5Zpb1K17BTGEUo3lSO9IjVs0jH2x4i9sEV2JoSaGbqtcTN5A87P8qkSc6wH8UFeylmpyPk+FLY4
 Dx/urUin//ZDdpCM/cLVlP6TVrfQ8UBHMd6EDeT+QwVdTSJ4Pah1sh15KOopij4IrTVBniMGg2l
 K1BUWlSZO/ts09CSXO/XmoobYNYq7EAQNiSt7nFpYAKKrTzzMmiuECY3xkasETyvKEyWGcYncyU
 1wGhk31xCSa0VANsqNslfCTo/BvAnlkGfT6aokYdu0reS4O98PvxuuSufBrfAT7XJtF39JEGm4m
 i8zLhmZTIVxMWnatXQS+vSojzHAO6PszhDI+K4b23VvIGd8hkkbGSyQEx3a2pOmis4sJoFcYO1F
 F+r+LdvR+vW1cQ06JGw==
X-Proofpoint-ORIG-GUID: fkWoW3RGi53ir_iZ9y6eNCGdc2vHQGeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63039-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B94F603C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Glymur SoC.
 
Glymur's camera hardware topology:
 
    - 3x CSIPHY (CSI Physical Layer)
    - 3x CSID + 2x CSID Lite (CSI Decoder)
    - 3x TPG (Test Pattern Generator)
    - 2x VFE + 2x VFE Lite (Video Front End)
 
The CSIPHY block is the same hardware version as x1e80100 (3ph-1-0),
differing only in instance count (3 vs 4). TPG, CSID, VFE, CSID wrapper,
and ICC resources are fully shared with x1e80100 — only a dedicated
csiphy_res_glymur array is introduced.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,glymur-camss.yaml dt_binding_check W=1

Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
Nihal Kumar Gupta (2):
      dt-bindings: media: Add bindings for qcom,glymur-camss
      dt-bindings: i2c: qcom-cci: Document Glymur compatible

Prashant Shrotriya (4):
      media: qcom: camss: Add Glymur compatible
      media: qcom: camss: Add CSIPHY support for Glymur
      media: qcom: camss: enable vfe for Glymur
      media: qcom: camss: Enumerate resources for Glymur

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,glymur-camss.yaml          | 343 +++++++++++++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          |  71 +++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 421 insertions(+)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260529-glymur_camss-27af71b1d3d3

Best regards,
--  
Vikram Sharma <vikram.sharma@oss.qualcomm.com>


