Return-Path: <linux-media+bounces-64354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YojCA6oFKWrLOwMAu9opvQ
	(envelope-from <linux-media+bounces-64354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:35:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFE6664A3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I1ZVaHne;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BsLzSHiO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64354-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64354-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDEC8303ADF8
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93213750B6;
	Wed, 10 Jun 2026 06:30:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B1374E4E
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073020; cv=none; b=uZZKF0T7mHiAvrEgVfuz8p+ggKQBusMtUOTVyH4T1JWks9rA8WoGkGjoxMeQDtq6xNX0V/bqFATsrIYfAto01vh8HBvAEnW9Yi+HOtqQIsAMVSaPC4rjlvPK3K2x4vqANsgip+eIPBoQSom21rpny9X6qE5l4OOSR0EIPOPV3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073020; c=relaxed/simple;
	bh=g5QnDYNLCUXkrvTnyRg/wjaqw3cIxeOy+tSozwdFA3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRQUIkrksBjoCVUegxDf+TKi6uymKgAPlp1tlibhsuT2KCvmZSqJ/ouJNGY4t+teakk8wPwRZicMgg3OGGlNTBhQOgXlQYyhPxkXngZoGQBcGRPI641VIvjGS2vJExAuAoB3ymgMSthHufpAre9d8W4f85gxdlYmBHpVXvghYd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1ZVaHne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsLzSHiO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ekBj282710
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9xkdvPWvw9OpNaumZA+ItB8MxYfFys7ZfCRfS7YrK0=; b=I1ZVaHneBmjqy8sc
	4Ok5hiKYahZ/rIeGhz4/gM213hD5RrO3n2wV3IaN4a2dmLav/bW3SJOmO1RCWPpZ
	mjZ5yiyZC2Ha70f2aDIC3gGeWOoPwegHZm+T9Z8d6eLNbRgKZpB2pXS50Brd2b68
	D9IZ/EYqxA97Fz7gtKySXJRm/v0d5WqXInVNvjVJx53J9uBlSi41wgqlkoZ2Xs1h
	DNBITic5gkiJEym7eQ9lZTP9jQKzrY3OvsKWCNu3okWf/cvz3NY/A36BAlqlI/N6
	6ys2gVMSzzEhAtEhU4IYemT7g0xY8vsrJauoWuxaMX2FFJ99WKfFziYNQO7T2ib1
	zj5efA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnns2ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso5991895a91.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 23:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073016; x=1781677816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9xkdvPWvw9OpNaumZA+ItB8MxYfFys7ZfCRfS7YrK0=;
        b=BsLzSHiOgTAL0FMXWhh3Ds6VyRqjvS4Vo8J2F4dwNvCw7OX3oHLXl/2R9hcaZYJ8Kz
         TdiSWk34kS4EDY57R/8ha133xS3MMBaCuUs31/4xFQ+DYQSxWT/lPgjRM3LJfgUp9vY+
         60jw9rwHLXTc+WaH+Z8F4iQFBp7EHD+wxp26HqCst8a9OHmlrrQ5lUzxC3SRR+tTiMte
         kpvjChXFgluBqeRo4tBLRS5Z9J13d6U3/0WjlNp7U7GlTL7XmsS4FWPoiOUYWq3J0fnd
         cussUYL4qvP0yggmw72418fbLLN2xqD8fQd33GqrX6h1fYV3eujgT29EKT4FAdj32TpP
         hlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073016; x=1781677816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9xkdvPWvw9OpNaumZA+ItB8MxYfFys7ZfCRfS7YrK0=;
        b=OLJ8o6Upv28qP1TcT/7MuP6dQjx1VzvNlTGWNtRPV4zZB2s1SYbvZ7gfnsnjpN8O/H
         9s2OTmaNIsf1oJAKW4BQ78/hKz39OVUFwl+XMmVir+iUnQ8t7nPYwxxYZ1OfvkfeDyrt
         rZSFbrIIUCfr/GBfNIAeE0Ya/mRQ0uYoiHAaEuuYPOjVuKKswX5HzA//+VNJi2AwAynN
         GrJmjPQyanEGmjIjGfrq8hviblHC7Y5YGcT70NpWQCIJA+APT66qghvJfnAq5MC5ZMKh
         mXjaUlh0ZqSIA0u57Uq62O4O0tuu3QoGZLFpBMh7a6Hx0nez7UJZiXf70Zpvd281/m4D
         Sy9g==
X-Forwarded-Encrypted: i=1; AFNElJ89amL0NMWd25xp6FZHDlub1Wb5v+VXN466j6sXCuwB+/IxgPXhSF1433q4d9HVSRqiXB1ZB2zft9Ixzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0NEENabFY+Vz1b20snb23TtYmlJkzkPfKs+/HPt8/mVzTx4LY
	jq8qRgI5Xi4ABQ4+lxLinXB7V1WcV+5OGjPTqsx6joqz2Mxb8aK3DH+JwsoXDy9qpcia2ceZhFs
	11VQaKwvrcPKV/EooG/kwTw7O/lHdWyEftW/SvtSYDG/DXPzGp5BxamD97s//Ry1yUw==
X-Gm-Gg: Acq92OEW/vyYyc3phRxbTqhoCb9hgib50s4pVyXwaXjRhzzfxdTIpiniQn/73Gl23lk
	rKzNkbd69Vx9EAn1iAo7in81wBsVBHg5t0vg7ioVCnGsF9iqsrQM1H6K0phDGulqgdOco/UAcyd
	AU5V3dP3rVGRrDhAbir/ZauNuRz0E0vZm7+LjgIsdtB0sLV6qhl6XuehBjzI782jF22xBxSaV0Q
	quGlpLlm4czMyCxAxhPSgZvydWGK9cga4jFYrBTEUrE7As61pbwuYKghXHRhzUka2VtVzC66Uc3
	5OAWiNAu/ERoid6a3RPtCtBlYZ5eVpuD8cwPvxsrDsPC5/VROXZ6ZjAsNUjcjX2Rj8It8AfTVix
	Dxpr3vM4Ty4+6SAVYgHzkiBx/KtCMUm4kld67OhnW4Ljnfr1B/YluOYY1PPeR0/jMtQ==
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr23696443a91.8.1781073016420;
        Tue, 09 Jun 2026 23:30:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr23696398a91.8.1781073015866;
        Tue, 09 Jun 2026 23:30:15 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:15 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:37 +0530
Subject: [PATCH v8 01/12] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-1-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=5465;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=rdDaZJ2JpJP/hvRtkYjsfyvO0PZdU0ZWU+/yGYP+wUA=;
 b=YlKMKStuh+NVFiFAmn04eX0qlxviZreZXgdBWOfPpAx9Fl3ixQVxZbpnRkQ0wKZi7Oz69QHDe
 mtb9UcCUan/D4VE8KOzXwbdwVQpJ5HB9jmo3XWOh6gB9AS7rLotVfYu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: G26NFqFjZNlpCTjFB-WpD3y2EOE2QtA4
X-Proofpoint-ORIG-GUID: G26NFqFjZNlpCTjFB-WpD3y2EOE2QtA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX/NSV5FWqB+/B
 qvrMjgrV0VsKky91847U4YH4hiATS9HloUCvnTGoUDeGZ1AEIrf6muDbNh4ONaE2TFTPfmw55SR
 jgGtw7AEfnmncTMMw8LXnfpHkHW7dJDESeWApi47ebuLpKIQfHlEE54xshAa2sXHjcLggVECjjO
 SlpxXbTnPxy6gtaqhclqdhmfegcV/nUE0tucSn/Y9BYAmJoN/rWy6LhodPbPSZ36szhAZkqCt//
 FqEP5fHd+8E9u9CMx9gv3H470JSrXPgNAfowizUlQ7hJbZIspe4tvw+RcTCnoX3ItQT3iGBdZOI
 yHo8dHdr+qkdqIR9NwqjujT+Q8rHwp6tbGBxqkJPFMEgwEQCbp+g6r5WbfoC3i6eHJP2AywFWfv
 84U1EJcpbmp+f6rkz+duaA7ZdMGnMAy3PU3oIdzqoTaqWDZtBuC+W6J7HrW/Gkix53/LmlnmvIW
 z8PdiuajP63L0SgcRoA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a290479 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6cGehGV22KE80QuxIsQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-64354-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 94DFE6664A3

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 MAINTAINERS                                     |  1 +
 drivers/media/platform/qcom/iris/Kconfig        |  4 ++
 drivers/media/platform/qcom/iris/Makefile       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 ++++++++++
 5 files changed, 92 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a727d4920fae..92d26cf491b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22262,6 +22262,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
+F:	include/linux/iris_vpu_bus.h
 
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index af78a1775937..76c9fcd253df 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_IRIS_VPU_BUS
+        bool
+
 config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
@@ -5,6 +8,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER
         select QCOM_SCM
+        select QCOM_IRIS_VPU_BUS
         select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..6deadd531c8e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -30,3 +30,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..e3327b227332
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = (const u32 *)dev_get_platdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void iris_vpu_bus_release_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_vpu_bus_release_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->platform_data = (void *)iommu_fid;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(iris_vpu_bus_create_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..62af9ee7e288
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *iris_vpu_bus_create_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


