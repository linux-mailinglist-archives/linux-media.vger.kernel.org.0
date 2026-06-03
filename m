Return-Path: <linux-media+bounces-63617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aMsbB+E9IGppzAAAu9opvQ
	(envelope-from <linux-media+bounces-63617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:44:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43D638BBC
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:44:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="h0m/aYQ8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aKULIrBa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63617-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63617-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C807130B0A13
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDAC48A2DE;
	Wed,  3 Jun 2026 14:21:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60C43DA2D
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496495; cv=none; b=iIhQiwpHWe3ibAivDreI/52KTP6bu9lM25Aspf2zCNRUCq2E1EIbLex6TZT2Beuqwj0q3g9tTGys/YRC4nNGMJqqPq5LLT+OQBuisbgSJPJGx+0yMvE987H2FlwdcZmr9TysKNv8Ma6V2XpPzvwZSZ95tOXkCUaMj2TIXUOp4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496495; c=relaxed/simple;
	bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPyj+m6ks+BRW09oYZSK0SSquh550+I48evoPe5OYatgEQclZMIj+GjQNB5BhZ6mD3uKJgVG1mXW5PJ2sizGRSPNW+S+JhQuXW2aGiWJC1+GQ+BL0SwwyhqhQ6Nk7WbP7eEZuI1u7vZYEDyfmnC/YmbHeiS5xGvbInLmkDz3gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0m/aYQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKULIrBa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CebYI2076090
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=; b=h0m/aYQ8LGz3nWUC
	5B+xKAFVUnyzkM4SoWnQVCR4I6S1fYeZEtdIvzuarM0yLYakynr3kB50+Rpw3jtY
	/nyHIIfH9Hb7YTmzllSUh6JlKMctL93Pgn4Q7xoAmGm/523jcANoyfBg+cBicIXo
	Y7pd+tOKH58L1CAdZmry5uNjhh51DMI+hJVOizXskskeysjFujB9770I0eJLL8wj
	sa77vsgSgQ55uLhMI82PqujiygQFeWiTunziGZpCD6NuzkpYn52wD1eaqsJpjL2Y
	h1LoBu9GRpcDwY4CfyYS3hQHEfQANDhuCFApKgv4t/lt6ojUhgdbeISpe1t7KWCE
	mV4gaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19xe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:21:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97415004so7793328a91.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496492; x=1781101292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=aKULIrBa9wmjAApESLtqpzZb3eL1iQAmW5BIvu+X0MC88jHh7wPtvch0ettIxL4qo6
         J8OlmRohjd6sFYVJBMlihKT59p3t+58bpEqp/rIYncTFjGSVXvplGCj1c/c3aOoszEDg
         PnhxUpPYGNTSF/9DpUIHlL6oODL8xDyCkJNmlv+VfBSHOZcBOS7jIz4a7CvmDJh/ioTu
         CaMoQQ3+1mfSqmhl+eDJJUu/x4MMNUs+BDEyP16n7e4IKWI6xoaMjwUC+ZZjZ5If3/4K
         dYg/bMuVbLPT1EYM5tlxlhxdP6M1kVdLZDlLN9gNGNnRPXn83ZhtC7dDEj9ZCVD8Tled
         m1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496492; x=1781101292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=NnsuDZKFBnQdIQO2Q7WlOS7z1bRjiOAlo7WtyM53VzYYiZS0ORYdaVXmpO3wicZO06
         xaEH+Kduiv3FonbqIpRetAFCcb0J7D2B7UojDbGZZ/jTBqFny5QsEv5AveIM7sStOBHp
         BLmvSEN1LkScV8ktSpvvkXx98q0pPjgu4Nlh6jW+SOBEJ2m53unhLIRnWGCMzrNhyzjU
         obwOGIIt7uuL2YJyOYK7Qr39Jaff8FYJBoVMTgb7BcnlqiprHimEmYFvRIh03uzlq73w
         zadLXvw3VbloaoqeXl+KXFXQ57wHNLmAuLz14AlZZQd5tnn1xj0vW0VFi0b6jlOR8yDc
         OLjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+A5jheq5YFat34tDqQaDpFSDOLOe7aXUrCDH7CJnNnyOaO7gitBWe844vNHs+B0rrAbytQhb4WTd8Egw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzRctbTdWlPfkCF4YV1obt9ot10mMtob3rIZzjbvz7T7RYqwfP
	bSSQkYCG1AqHuLdoxGe942c5vjz0hdmDK+ks9NOwX1nt3DZtTgHkXyJCBR0r6tRgTYMb8mXpxe/
	kPSzoMwboDcz2NSM+WYhGPapZhIKE3e2Lnkz20fQVtEhHZrXAcWEYWycc9vyccuu8+Q==
X-Gm-Gg: Acq92OHFXo1XeXzFLyOT0dV5KvwWOO4fN7FVZ5vekDXM7gY1Q99nR9Osi8q7AQQ9pgu
	CGkTTNPCSz2WecQUmJeq/OusGKchVvFYQTAaOPWgxeQw5bCimceCXuqL2miMIlbYY7tGFYlppc0
	Udg+77Cya8sliz8+RMSql9qUJU7Hr2lkTFKIF0G1EWsUFbZ+WA78ZEM3c1CB35Uwqeh7AhrlMNz
	y5lqDHPzOkpdyDTPUt2dwm/SgU8GLwzTcorhW/ZBWK7KBTRkoiG7uaJ1w1bIz6ZwOri68gatw1f
	wniu7frJIc5BBxTFE1wcOuNg6y0vyU6NaO77zkqn2RGtWDTQbTJFq56xoqj07GS5Q+x0XSmao11
	2B6yWMiRGM4wMTHKvCnt6Xhg0ycEbCix/XClc109IrQ8bigoxikWxnb8S0VLpsGgoPw==
X-Received: by 2002:a17:90b:51c2:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-36e3247617amr3743133a91.1.1780496491856;
        Wed, 03 Jun 2026 07:21:31 -0700 (PDT)
X-Received: by 2002:a17:90b:51c2:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-36e3247617amr3743089a91.1.1780496491404;
        Wed, 03 Jun 2026 07:21:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:31 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:50 +0530
Subject: [PATCH v7 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=880;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
 b=j6KLzRXja9vw21nECiRDIymu9bT8tQkMHvQods9ahk1D42LUixH/CxeLS/SQpISGW74WdmXD6
 6drwsQqNiu6A5EHUvmo7hBgLTSczmKwFmTd3bag+LS6ZEe2eaPj7UfW
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: VX5x5VVALoaIdShoNZqL80yewJVV5R6l
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a20386d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: VX5x5VVALoaIdShoNZqL80yewJVV5R6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzOCBTYWx0ZWRfXwUskm8Ge9Smv
 Wvv1zjen98EYwbqBQHcp+96A9nq9VmdDsVrNxV9uT7g6oSu4ibWSinvfPwMTPJQUuzuBUejaHc5
 5RcCEBHoBQ3XaxjRBni+tucpsJDfMPj7Dwc00g8xbjvb0RaI2DpWZXmicYP10qtVF2wQlpG/MeN
 pHU2wZFQXnFosmMH5hcZh88Z02feI6gz/jDO+QzqvyJcSS/7zQ7G/4nBBgdpfIB2fHGKTz85wEM
 w65R3nPayH83TTMR140LGlaMHmKuGUy3H+N3qCe/Aj+qzBabiE2U5b8nvBkc+Gqm2byNaogz9iO
 T2xMFoDq74GWJCT2ITmKKP4DHbIezM5n3NXZaNsMdXK/3pJR9RFagiJ7GI+TPmVnHR81PMoGlb7
 9v6cmcTR2qTxQG8c82YMPnYV/1JHSeWQmTdVepozib9mndy72DyjSo1lHpLxrsNruJmedMnHtmV
 4SQfBzG3o/th/tc/uMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63617-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 9A43D638BBC

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..9445badeb18b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,12 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1


