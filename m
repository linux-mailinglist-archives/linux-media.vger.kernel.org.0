Return-Path: <linux-media+bounces-61436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BQlG851BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E95337CC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B48E300AED1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141B6481A88;
	Wed, 13 May 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeY+NGed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwSfHaBe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3179247887B
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676578; cv=none; b=PWl7zIICQ5El4CtYv17dlPC6q8GKqOHHm2MgqJMFZRexGp9QvJq5dqU/pCsbhExza9lGgh1PvCy2Uqb0XOi/rL5fd4EBzWcQMiyCIkSWbE8IIv6mnAyCMQf9rue59SHef4koUEGXX1fm+S/ODxJq5Sdle6nlmoHiPbKFja4cO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676578; c=relaxed/simple;
	bh=1zDPOP1SavZgDiQyi4AT03ZJTGCF0M0Uv7ocps5TYYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgdlx7RRtS7hCw6kJxH2h/Iff8ZeU38AKa0q3p3+9BS3tIrre0GpQWyCIzAlRNPKiwa174DcbVDIWvmvz8Na0jRKmV8jy4g/pQTXtXPJoIZ4g7dLR/ky9pl2FlaPCxItEDKlivneS4+mWweuaZQKht6GhJ1P6PYRdkTWPg2DPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeY+NGed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwSfHaBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wpZl4159672
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dxp8B42jWwt+tWH1V+vTuYQ+R3Qg9AEvv+6K2fYAZ40=; b=BeY+NGeddXBECff4
	9KqTqR9PldKOmOGd82dgJ/7wH7If2cncAZ+S5DDDGDaZay36OPIuYf7gAWGSnR1P
	kNJYrO7ov9CXGJkh0Ot1WoxdKAkDnkMnS9Wq3kI6wyb4wqGreTSFw3FPK5r/8iU2
	XY+wj0YGOmwBy+THBL7Wad+4Y8iMJ0uMbDjs7JUkbRLWr2ni1QE9cRKF0Qh/F0xq
	2uAe64Pd5zT1ai8bUzQHOcApyeiJOMwhAHcyKjZVn37/JSr3mRYmAKkxDvm2Osq3
	R9PVs+Z+gbDAErSMBOQIJ192Yx0iaGNCnzVfklgj2yxFKIAcjEQ7U4M2SWwgFQst
	7CDboQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rtce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso161404311cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676569; x=1779281369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxp8B42jWwt+tWH1V+vTuYQ+R3Qg9AEvv+6K2fYAZ40=;
        b=OwSfHaBe8W0TQGSyGzOSz+iRsZgtdGU71Udx2tptlN4oFfv18pE5cO7/eAGaO0bL3h
         5jxvJuFEy7+IYAEn6fYvDSyOgIISoPpn1L1pf7YoFe6i6Kt+MPBklpB9dvckvSrxN+Ny
         O74gqixVt4gTLzy+PUcXDb5kTnmJoF2hofyQqlQruVgm41GmJGkfVUdkIjcAa6uS+ECo
         Rh3k/f1ciZXhBp+ly0Bb2xS9TOxoUv4R1CTAUp3HyxGwJbqvIbWrr3BZsgZ1mXtcz8ly
         Cfy/6beQUig9aGNL0gyU+IFRvZFKNmf8qvcNY4cFEcXFz6r6BGja26geHNXpIq+vRGAL
         qEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676569; x=1779281369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dxp8B42jWwt+tWH1V+vTuYQ+R3Qg9AEvv+6K2fYAZ40=;
        b=XG8ViAuupmYOlPvwpMcB4za3fDyVi0ehB4/AkyHSxsuNs7wAtILGe9S3GP2Rvraeod
         Z7Ek2PMnLgim77iqmqo27S5D0wEqeQxWJJgjhdS2/nVGdJtTeN/N5kTaDZS85aitTm6Y
         Ej58YReywSQCwQE3W9gOTtkJzKVuC97/Nzf51cTlIHIX8skiXjYfEwdDoR6uURfAeITg
         nP8dy9dRNX3V4dECELXFFT8/Y1G9+OFJxJ+glwn81sz877ifUizrsjgzGhQgh+18CmEP
         tUqKfHxXmg9gvh72GjtFvl5jm/yAbx+a8nx8CKBPr/Fn6ZHIEdAy/ho8NVjIUIW4qwuG
         3lJg==
X-Gm-Message-State: AOJu0Yw0rIhvw9wDQZFgnaZfk61ynNrU4GBgx4nifGllM7ryaEpxKegD
	UPqufc8TCz0DIJT6Co4ChQ1ooZjOxX8ClwDokz3E8tb0Rxg2J2MMf0v5n/uw6VUAGgZ9ijt+Ue2
	4bQbRr0NnmFnF9AYn5rA5hETg8G0pZPQ8YfI04PHH0439xby+DeUy5NfnXmmqS6dc9g==
X-Gm-Gg: Acq92OHyS2268Oevbt7kUaGBp2n2o/gX53DXNaoopLBiuV5A0P6wWTxPOZIhClAk/f4
	0Sb8DNjhcpF0scxX2g3THGDlxhcO2xfVzLm5RYbQ+3dLGGSkh+oZC93gCW4FsQZWbQVpqr6rktV
	uZBs2bUd0eqJuqJu35no5l1/7adNe6JJPONH7nLWbTm8Nep/PZDaeoX65tW7qv3jg1VKuN4phXE
	1gW5x5yVSUFLHwvhKCPyf+F/UW1Nk1U4IHDVtWADupouqJuILsQEf7Wfqcr0u9mZwYhpaCkhYZY
	Yfy20LQ3gG1XVuXJRQd+h5tvgW/ex1kp8pbbHaWhl9AxHPxBu4ClXU4Z0LpMU68Qu+3pbGp1h7g
	E8zF1T6iFzGeKDaSOzXLhm9Zx8XywHzh9xSNe8fXPZJD1FAjvIFvODN5GgQHEeJWnuVPvoe2VDx
	37eQ5J9bE1Kx17h+qJvGSNe8X7FVaCw107hTg=
X-Received: by 2002:a05:622a:13d2:b0:4f0:131f:66fe with SMTP id d75a77b69052e-5162ffc337amr36148291cf.59.1778676568516;
        Wed, 13 May 2026 05:49:28 -0700 (PDT)
X-Received: by 2002:a05:622a:13d2:b0:4f0:131f:66fe with SMTP id d75a77b69052e-5162ffc337amr36147971cf.59.1778676568073;
        Wed, 13 May 2026 05:49:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:43 +0300
Subject: [PATCH v2 09/16] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-9-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bF8iILLVIppNchJxOge/8BaIad5y4umYpW2shyRCvbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNB4nJT9z63O7kJZgYvfB5SiqrSgBkRCQ+Uk
 cKeg1T8qSyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQQAKCRCLPIo+Aiko
 1ettB/40UnnejMbXtc6WC0kekzMq8Kkf+1ccORptSkX2GVRJr/EqmmvmOj8TpWCermhq1Pcj9y2
 EcFa5F9lso2fsGKnrecItUQLq8tzeqbUNgjKQWVHErMG0RtwIVba3fW+iuzlFJeEqaTkL/wEuWB
 5GFffvHZdzoj56Ny5VR5g4jEQE1uyYfz1JGP8sTGdkKGAWMmjYrOV0SretkHLfGcEamyF/IVaso
 W0VXUee660J/1orm8mOsYzmBQ+w6kglhN1x81bnePByONKJ6B50DdlSiLnaQfDtz0GyhzyJdVO/
 jwQansvlbifRSE/jshmKyQ5ejek/pMktiBYMTtWqYvwmpWyE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2viS3XgxdjLPrQWSaWVx3RaahlbWpNyY
X-Proofpoint-GUID: 2viS3XgxdjLPrQWSaWVx3RaahlbWpNyY
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047359 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=x0nZcyIE9sK-8O7Lov0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX7xxTUdKDOH1i
 0un2ZI5H/W/QqhhqszxnlGg6UghHQ1waubjsg0hQ6bt4+0vHfpb2pX5Vcc8H5+NbVUm8xBg4nJm
 DMG5ZkXrLq071m3Uyia5hwvEmWGqEtq66FSKyusmxwi93FXPXQk5SgGUDdY8x8fOjhuDpkczBYC
 IlKexKm7M9IN4JeNe146mLjHqwx+jpLNFxUbQzXm6hzCwBFDy6NzA+xMZt55g82PrsvuO5Jkgp6
 XLQEITMcLzq4z0z1jN2t/cd4qtwtb2RlpM9vQ7q/o7P0edNL0JfQ9sLsuo2odx/4VMxgVPVgbHg
 a6x+dsV2nGMrXEZ88CeslBD7Ku/eXGD4/8dqb3lMOebGcXtIMJID1CcND5XWZNolAFHPqi6yodz
 U27OU2z5WnxxxbYH3CXqZ4Fna12VFFdHXhJ9aBoq8kwG4g3BiTxi6I8ficLVlrxYu0Tqxnm/vsH
 Ds6xXdgAeRVMqaTm0ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: E52E95337CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61436-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e1dc226066c1..4a0895bf5720 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -63,6 +63,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -283,6 +284,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..1af20b067c03
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu_ar50lt_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index b8300195a43b..f3607c0ca847 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..f00e2de5fa53 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.47.3


