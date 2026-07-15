Return-Path: <linux-media+bounces-67688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K3MpBaCYV2q6XgAAu9opvQ
	(envelope-from <linux-media+bounces-67688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:26:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE575F5E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:26:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W2FTX2D9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dHvOj4qa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67688-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67688-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1B4C3067ABC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A70830C169;
	Wed, 15 Jul 2026 14:10:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529623016F5
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124617; cv=none; b=r9EeDqvDr7iR/F+SIigvfOgZ2CaYtLIWPi70aCUH6jT1nXaV12V6aZcl8rXDTEm2uBMA+bh/mHG4QbpXj/sFTzCx9pqx5Ib4ZbKlQUQjvEQoOEGetbuHEDmzcz1hjfxLYx6CbphOe69nzHaVA75VsB3ozWVy6iYJfPPvbebiO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124617; c=relaxed/simple;
	bh=kW6DzE8gBD1xD2n/V5jzsLIMaBqmreiRBhCtQer7VoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZHs8QbP3hfIMlf512L6/0l7pLR7jZa0E0/fWwCjciKQtgYqmRiT/bqSPzQW05ky3s6I3Qi57g3yx5cuHX4rhu+HNRSpEpFTfYnF0qvJhXMK7nzPDiMS8L4Ug8HFLMtFQwp8sHN3TMVMkNK3N/zsWJpytDRflkAFDFJXF43aVtHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2FTX2D9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHvOj4qa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3oDZ3664598
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=33emF48pLpXR/Ir+AF5dzJ
	ycnoIEWfU8Ei+ErtUGsiE=; b=W2FTX2D9gT7A5KEm7eoOW4OTbBps2kbpJptVcn
	LXqtON00sufQz17rtVzZHk5j1p8gjTm1aF5naViXSDoHlCXxMDYoaAApGVfGoNbH
	m+iCd0t23LzwIUPIbNH5C1/SHat/posm9Lk6ZXmRY5A7ddyTvXbGLSNnCEpacheB
	EhuEjKxVcW2h8NPnep7u2axYcJC3nkXx9wXL+RtejLvRnR+rwiZuJlKIF+pVDFKS
	sOxBuU7VoLbgruORl2IB/TST5tVUr2TQEDZQYg0WZd9FUlPTRQ0qPprTGnCcDW+P
	oKscnns2rlCzyC8/xas/cQXO9N3LoXC+JZps1z9RH76QcTtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mm21p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so32349245ad.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124611; x=1784729411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=33emF48pLpXR/Ir+AF5dzJycnoIEWfU8Ei+ErtUGsiE=;
        b=dHvOj4qaxvkPOoFvBlBXB6REZqM6qkfX6QrMsbsNA4yVUHVoPUvpW3RoXtnNWkSfx2
         2WAr2pjf0IcFvcz5swcxEIg87ER/CwAVFskmE2XZ68HjSg35BDpiwsuVUSJRSewkbN61
         osZXeCTgw2QuDTcbq4UqIxCx6YXaPlxLVNY0qnrYZRbCpiSMVRvV6w+p5olV2G0xA0M+
         X7HBJDvM3Em2PeCOty+R0J0v0991x74A+f2A6cz4ITdR0JA94h0vVRZMqOYK7YmcIXuR
         CG7SEDipBwGqBLFe113UuYKEeKyRHvRVA+fz/eDUpUGqBALilmnTtOR+ytOtJ3kDGcYv
         wOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124611; x=1784729411;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=33emF48pLpXR/Ir+AF5dzJycnoIEWfU8Ei+ErtUGsiE=;
        b=aQw0OnKXqmNWsD0DoxoCqtC6N08Uqgo08panEZZnC9cFMkDxMbh9bXCw1xeGOTF4kJ
         Ze6ERlLBvpu4Ojoy7aAKazcwa67m6CQjvmzSdOnm6j7UM3cETvxob9H3UE8dCOH655sC
         1uJ5a27Q5lGaMt87Ra5ZaQNwDaA+zzt+gm/lIJm0dzhPRerUiXKgsMR4oVTh0adXPWp+
         krjOBuoIIvtGdpzdC9rHeGF9N+yOq2s9SJLU9wWojtIZJSRE682U+iID8ahOLFY2lUyn
         oI22jRfoTA8klz3Y5zmQMNyThvUmxsEsFo8LGm1rUocjOwehmQUMiAm1FH+4xz5NdlqL
         tXBw==
X-Forwarded-Encrypted: i=1; AHgh+RrAiSMyvFLkKUgbq6WK5xu5Zj9uIBHVRABXJHz1vkncYTqJTIkbIqKvF5sDY6O3rhfX8ftURLK6fhq76g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPjhbkaJgJbLSPD8sX8myTsCXQVeV4otepzRJUiDA88m+AW/3
	bmRPmtAsZbeamexaJ/rnXFozq5bV4OdaZ/Qq+v9u+gg+oZFbNEhzP7Qp1ZauDk/9AxWHO4cd5sO
	IHl4nhyrLwWJLy+LJvzrV7LYypXvBTY7LTyfEFx1McSbMSlcMXGqt5mrQ6/wUqkB7Gg==
X-Gm-Gg: AfdE7cnQ8kQ5chN2CgsADLqTWCB5E/astgZDjxsl3bayV9V9TaFkrgh1bqc1//JDPxQ
	s07JVVe+5CdWWFjDBmHwf20TKyfb2eLNSj9XtGX9QsqT00c1iA5AfqeMNt+MsOwnMDhtq0afpK2
	7WL69mWnNeK6F3Co/t7vyiJOkiVsidqFzFajrek5ohUfOKqnTd2SY4ut8U3IhkuuzmIFW8xAKH5
	LOHyifI8UdHCLK+pb18uXF3IImfF0aV8hPF1E0ZUN4/Tsapvr0+f22277rQrZrWjLeHN8ZxT1vp
	ONlrVaMBsYlH/A1TDGROeyMv2tPk8wYQ4Wj+94cepCRCVn81b4bys4RLMYhVusa+lWBWYZJbP1e
	WAjfyziAL10T/9MrSbHkb4DqfR6Geuwua3ygbwbktmfMN
X-Received: by 2002:a17:902:f651:b0:2ca:1594:451e with SMTP id d9443c01a7336-2ce9f286f13mr171822775ad.31.1784124610528;
        Wed, 15 Jul 2026 07:10:10 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2ca:1594:451e with SMTP id d9443c01a7336-2ce9f286f13mr171822245ad.31.1784124609943;
        Wed, 15 Jul 2026 07:10:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:09 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v9 00/14] media: iris: Add support for glymur platform
Date: Wed, 15 Jul 2026 19:39:54 +0530
Message-Id: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALKUV2oC/22MzQ6CMBAGX4X0bElb/j35HsZD3W6hCVBtpZEQ3
 t1CgvHgZZPZfDML8egMenJOFuIwGG/sGKE5JQQ6ObZIjYpMBBMlKxmnbT8Pk6O5BpWrOhMIQOL
 44VCb9x663iJ3xr+sm/duqLbvkciORKgoo1JLWRSKc43sYr1Pn5PswQ5DGg/ZSqH+sTn72nW0O
 VTNvVEF1/DPXtf1AzBrNdrhAAAA
X-Change-ID: 20260601-glymur-4fcd4d832ecc
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=23099;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=kW6DzE8gBD1xD2n/V5jzsLIMaBqmreiRBhCtQer7VoE=;
 b=KIz1eKFtVM10MjroM68sYMMefj2JINWc/JhgOTUKMQIoLCaX2ucbsm9nPKk8Ar4Oo5q+3UrZP
 BJU8cqGVrhyDasZV4J2aDpnyLohcQGb55UesMA84PUhJb7x87vD88vN
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXwZ/x91MUSHYn
 9XPPyoFuC1f8i8KyMpLJ2SIb3P0g+iuKY/dicQvurxjkf1L/utfVOXVzxcIaOZSvvN2YDiV+DQ6
 /MBVE4KKMC7O0IVJTRvJB1aE1KhGVohjunVUAth85f7r+IB/FA+BY337zOr1scdNOwOYZ6DwJJp
 /GaxtRxXIXXma8XeWAO/kvhEz7bzLTohdcYKkp9NOQ+LG+LK0KPxNSk093/kWgM4nMJIOLdDWrW
 K1DDkC96198hoje23H3BEgHN0ScBbnxZ8OC8ldO6dRJAtXOYo+WWJLyFbRtVnWH/36PGw5t3ebG
 u/Qy+AkcA6qX8Z08n/YUocoNisc3PmSXnJ+dYHhR64y/Ja7XmFMq3Kjays4Uoe9CRIQur/4xgm6
 v4ZnM+/knvRfT++Yna6sSeuu8aAu+ZAYOpiYqy2630UxAW3rV39HdURjOed1+SJzsuzQsRyhjLz
 T5rq3xhwiuEfkELyWpw==
X-Proofpoint-ORIG-GUID: wZG3BG07LLGlzYkgt-UDaILXBaCK6iv6
X-Proofpoint-GUID: wZG3BG07LLGlzYkgt-UDaILXBaCK6iv6
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a5794c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8
 a=pGLkceISAAAA:8 a=hqlDjt6WuTLSZAQ4g8MA:9 a=aImk6SbPNitU9H55:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=eWIHaOtA_ULHaMmHwLHW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXy3PglZTyRP/G
 qsrBUOMbtQznv5ccmCMPewEr/Zv3p/DMATwi9TIQOfsLz4dU+UQGK82ua8I5vPhJefi6Xs4hjSk
 oYHjXo5hPn6EK/v6Nb6N0c814yEExGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
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
	TAGGED_FROM(0.00)[bounces-67688-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:daniel@quora.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 5ADE575F5E1
X-Rspamd-Action: no action

Glymur is a new generation video codec that supports dual hardware cores
along with additional power domains and clocks.
This series adds platform specific support in the iris driver to handle
the extra cores, power domains, and clock requirements introduced by
glymur. Add support for firmware loading through context bank firmware
device.
The sub node approach for representing the context banks (non-pixel,
pixel and firmware) was discussed here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
Following that discussion, an RFC series migrating some existing iris
targets to this sub node approach was posted here:
https://lore.kernel.org/all/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com/
This glymur series also adopts the same sub node approach.

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 43 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster test report:

77/135 while testing JVT-AVC_V1 with 
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding
is not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
- CAMACI3_Sony_C
- CAMANL1_TOSHIBA_B
- CAMANL2_TOSHIBA_B
- CAMANL3_Sand_E
- CAMASL3_Sony_B
- CAMP_MOT_MBAFF_L30
- CAMP_MOT_MBAFF_L31
- CANLMA2_Sony_C
- CANLMA3_Sony_C
- CAPA1_TOSHIBA_B
- CAPAMA3_Sand_F
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
- CVNLFI1_Sony_C
- CVNLFI2_Sony_H
- CVPA1_TOSHIBA_B
- FI1_Sony_E
- MR6_BT_B
- MR7_BT_B
- MR8_BT_B
- MR9_BT_B
- Sharp_MP_Field_1_B
- Sharp_MP_Field_2_B
- Sharp_MP_Field_3_B
- Sharp_MP_PAFF_1r2
- Sharp_MP_PAFF_2r
- CVMP_MOT_FRM_L31_B
3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C
2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b
1 test case failed due to unsupported profile.
- BA3_SVA_C

140/147 testcases passed while testing JCT-VC-HEVC_V1 with 
GStreamer-H.265-V4L2-Gst1.0
1 test case failed due to unsupported bitstream.
- TSUNEQBD_A_MAIN10_Technicolor_2
4 testcase failed due to unsupported resolution.
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2
2 testcase failed due to CRC mismatch.
- VPSSPSPPS_A_MainConcept_1
This fails with software decoder as well. Refer the below link for the
discussion happened for earlier platform.
https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/
- RAP_A_docomo_6
This was discussed on bug report
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be dropped in
the firmware or driver. Discussion ongoing with video firmware team on a
way to handle such case. This issue is not specific to this platform, and
its there on other platforms also.

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
64 testcases failed due to unsupported resolution
- vp90-2-02-size-08x08.webm
- vp90-2-02-size-08x10.webm
- vp90-2-02-size-08x16.webm
- vp90-2-02-size-08x18.webm
- vp90-2-02-size-08x32.webm
- vp90-2-02-size-08x34.webm
- vp90-2-02-size-08x64.webm
- vp90-2-02-size-08x66.webm
- vp90-2-02-size-10x08.webm
- vp90-2-02-size-10x10.webm
- vp90-2-02-size-10x16.webm
- vp90-2-02-size-10x18.webm
- vp90-2-02-size-10x32.webm
- vp90-2-02-size-10x34.webm
- vp90-2-02-size-10x64.webm
- vp90-2-02-size-10x66.webm
- vp90-2-02-size-16x08.webm
- vp90-2-02-size-16x10.webm
- vp90-2-02-size-16x16.webm
- vp90-2-02-size-16x18.webm
- vp90-2-02-size-16x32.webm
- vp90-2-02-size-16x34.webm
- vp90-2-02-size-16x64.webm
- vp90-2-02-size-16x66.webm
- vp90-2-02-size-18x08.webm
- vp90-2-02-size-18x10.webm
- vp90-2-02-size-18x16.webm
- vp90-2-02-size-18x18.webm
- vp90-2-02-size-18x32.webm
- vp90-2-02-size-18x34.webm
- vp90-2-02-size-18x64.webm
- vp90-2-02-size-18x66.webm
- vp90-2-02-size-32x08.webm
- vp90-2-02-size-32x10.webm
- vp90-2-02-size-32x16.webm
- vp90-2-02-size-32x18.webm
- vp90-2-02-size-32x32.webm
- vp90-2-02-size-32x34.webm
- vp90-2-02-size-32x64.webm
- vp90-2-02-size-32x66.webm
- vp90-2-02-size-34x08.webm
- vp90-2-02-size-34x10.webm
- vp90-2-02-size-34x16.webm
- vp90-2-02-size-34x18.webm
- vp90-2-02-size-34x32.webm
- vp90-2-02-size-34x34.webm
- vp90-2-02-size-34x64.webm
- vp90-2-02-size-34x66.webm
- vp90-2-02-size-64x08.webm
- vp90-2-02-size-64x10.webm
- vp90-2-02-size-64x16.webm
- vp90-2-02-size-64x18.webm
- vp90-2-02-size-64x32.webm
- vp90-2-02-size-64x34.webm
- vp90-2-02-size-64x64.webm
- vp90-2-02-size-64x66.webm
- vp90-2-02-size-66x08.webm
- vp90-2-02-size-66x10.webm
- vp90-2-02-size-66x16.webm
- vp90-2-02-size-66x18.webm
- vp90-2-02-size-66x32.webm
- vp90-2-02-size-66x34.webm
- vp90-2-02-size-66x64.webm
- vp90-2-02-size-66x66.webm
2 testcases failed due to unsupported format.
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm
2 testcase failed due to unsupported resolution after DRC.
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm
1 testcase failed with CRC mismatch.
- vp90-2-22-svc_1280x720_3.ivf
This VP9 bitstream contains 20 superframes, and each superframe consists
of three subframes in the following order:
• 180p subframe
• 360p subframe
• 720p subframe
Each superframe is submitted to the driver and firmware as a single input
buffer, with one common timestamp attached to it. For every such input
buffer, the hardware decoder produces three corresponding output buffers,
one for each resolution (180p, 360p, and 720p), and all three output
buffers carry the same timestamp. When these output buffers are returned
to the client (GStreamer, in this case), the first buffer returned is
displayed, while the remaining two buffers are dropped due to having
identical timestamps. As a result, only one frame per superframe is
rendered. Here the expectation of the test result is with 720p, last
decoded frame in each super frame.
Discussion ongoing with firmware team and gst maintainer on how to handle
this case. This is not specific to glymur, and its there for the other
platforms also.
1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v9:
- Dropped iris VPU bus patches (iris-vpu-bus support and its iommu_buses
  registration)
- The below listed patches are added, those patches are derived from the provided
  link and updated the code based on review comments:
  Link: https://lore.kernel.org/all/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com/
    - media: iris: Add hooks to initialize and tear down context banks
    - media: iris: Add helper to create a context bank device
    - media: iris: Add helper to select relevant context bank device
    - media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
    - media: iris: Add hooks for pixel and non-pixel context banks
- Replaced the iommus and iommu-map properties with pixel, non-pixel and
  firmware context bank subnodes in dt-bindings and dtsi
- Updated the vcodec poweroff sequence with proper polling logic.
- Renamed the PAS API usage to the new qcom_pas_* API (qcom_scm_pas_* -> qcom_pas_*)
- Updated the reg address in dt node to 8 hex digits with a leading zero (Konrad)
- Link to v8: https://lore.kernel.org/r/20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com

Changes in v8:
- Extracted register addresses to separate variables in power sequence (Dmitry)
- Fixed sashiko-bot reported issues some which are seems valid.
- Link to v7: https://lore.kernel.org/r/20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com

Changes in v7:
- Replaced enum-indexed clock and power domain tables with per-block structures (Dmitry)
- Combined venus common schema update patch and glymur video binding patch (Krzysztof)
- Updated CPU_CS_SCIACMDARG3 write value as zero specific to glymur platform (Dmitry)
- Updated the clock and reset names (Dmitry)
- Link to v6: https://lore.kernel.org/r/20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com

Changes in v6:
- Rename function names in iris_vpu_bus (Dmitry)
- Update the venus-common schema (Dmitry, Krzysztof)
- Add dual core related functions into platform specific vpu ops (Dmitry)
- Update power domain enum names (Vikash)
- Remove unused macro
- Link to v5: https://lore.kernel.org/r/20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com/

Changes in v5:
- Remove clocks, clock-names, power-domains from the required list in
  venus-common schema (Krzysztof)
- Update core selection logic (Vikash)
- Add macros for power status bits instead of magical values (Vikash)
- Add new config for iris vpu bus instead of using the iris driver
  config.
- Re-arrage the patches (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com

Changes in v4:
- Update existing venus common binding.
- Update glymur DT binding required properties.
- Patches are rebased and resolved merge conflicts.
- Link to v3: https://lore.kernel.org/r/20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com

Changes in v3:
- Drop generic dma context bus and moved to iris vpu bus (Greg)
- Update commit message for platform data patch (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com

Changes in v2:
- Update the clock and reset names in DT binding (Krzysztof)
- Update firmware device names (Mukesh, Konrad)
- Update the selection of core for dual core platforms
- Add new generic dma context bus instead of own iris vpu bus (Dmitry)
- Add patch to get power domain type to look up pd_devs index
- Update glymur platform data (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com

To: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mukesh Ojha (1):
      media: iris: Enable Secure PAS support with IOMMU managed by Linux

Vikash Garodia (5):
      media: iris: Add hooks to initialize and tear down context banks
      media: iris: Add helper to create a context bank device
      media: iris: Add helper to select relevant context bank device
      media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
      media: iris: Add hooks for pixel and non-pixel context banks

Vishnu Reddy (8):
      dt-bindings: media: qcom,glymur-iris: Add glymur video codec
      media: iris: Replace enum-indexed clock and power domain tables with per-block structures
      media: iris: Add power sequence for glymur
      media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook
      media: iris: Add support to select core for dual core platforms
      media: iris: Add platform data for glymur
      arm64: dts: qcom: glymur: Add iris video node
      arm64: dts: qcom: glymur-crd: Enable iris video codec node

 .../bindings/media/qcom,glymur-iris.yaml           | 255 ++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |   8 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  10 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 128 ++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_common.c     |  10 +
 drivers/media/platform/qcom/iris/iris_common.h     |   1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  36 ++-
 drivers/media/platform/qcom/iris/iris_firmware.c   |  73 +++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  46 ++--
 .../platform/qcom/iris/iris_platform_glymur.c      |  78 ++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  15 ++
 .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +-
 .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  29 ++-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  14 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  67 ++++--
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 ++-
 drivers/media/platform/qcom/iris/iris_power.c      |  20 +-
 drivers/media/platform/qcom/iris/iris_probe.c      | 171 +++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  | 143 +++++++----
 drivers/media/platform/qcom/iris/iris_resources.h  |  10 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |  58 +++--
 drivers/media/platform/qcom/iris/iris_utils.h      |   3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 265 ++++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 ++---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 102 +-------
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  13 +
 38 files changed, 1415 insertions(+), 451 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260601-glymur-4fcd4d832ecc

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


