Return-Path: <linux-media+bounces-60725-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHzLHSY1/Gk2MwAAu9opvQ
	(envelope-from <linux-media+bounces-60725-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:45:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D94E3A6A
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7385B3059026
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A6C345CAA;
	Thu,  7 May 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQ+q2gMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/4aTs6H"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C7E340A6A
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136147; cv=none; b=sllBd2uvVacNJxrYUM2wNKQNogkG8Pk1AxiW1o/AbBFodU2npY3L8lyGgKkxgPQrfRInM2MUIx3Kjkueqr78FBGJlPHl0qjhQS0e1lnH1hX4txCAR+CR3tN1TMs2IFu1qClfs0uA2VN1Cb/L/f4ZsedYfPYMQgdYovlx35pUa+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136147; c=relaxed/simple;
	bh=13Wy0PboXXprJEYnsXJ5D987/r1HcPUtw7hAtJCEM9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0/WPzIRdzC/RdvlSecCwwjkR10WsEy5mQU2eIXFCs3aPv8kplfsKkm3r/UKmhAtsz6PB/S0aqmzxVAd2jA9CXa0M8QMN56RUvwXemkSSJBd53mIef0M4QJWt5m7z+7wioM1s0vEWqsXuyTOyz0Gn/urXgcWXnWNekivh2pajFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQ+q2gMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/4aTs6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wQs11926195
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4KLMY558TYgnElAbsXo7fOzEKP9ncLvusxHoHl7/Q8=; b=VQ+q2gMM9Ux3NzZF
	FzjnxQEgX9DFy9hqYRtGqukxh2aKC5PbUkCznQ/DlhTS2ojxzv4m23KDMGyevJF5
	3FKMVIGH2qIko85CeO/2WA8dOo7TT86ZwIz2VPAeHz3tsZ7Sc6iDWSLxJJ38yvAM
	nzuVJwZog1mG9r4zcoppmvx0LzmCPzH02kV+NlBzRD9hdqkjUZkYp5BLAcv03yhK
	eWhJPd/XNzh8e7QplONUFuHxwryZSK+skptCvJCEt/C1aXfZDfNKNICSgC/EBhJN
	5JyqFph3OH4xlEJsI+WXYOC2EG4euFWXYgAfKz8AsNWovTcGaWP/V0OKXaQ7dHEl
	eXrMPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g84y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fba8d8c40so8778451cf.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136143; x=1778740943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4KLMY558TYgnElAbsXo7fOzEKP9ncLvusxHoHl7/Q8=;
        b=F/4aTs6H+J1GOeZe8HifdSUI0FwM2Q4XMD2xfwgXjVwSODVYda51r6q9cDV7/fB53v
         an8FBWgjFD0E8FBLxHa3aMMDlyni8K14fcxVy2dubmkWlwMKpOD3tgals7edNuRkJ/ss
         8fnXwb38d9nypkhZbOkD6Ns2I5f7baG37oA+9IfwMr4xdhhsCLtbPYoFMC00+cMcuK92
         aLToHfcjoUJbeWK77JQCHS7lWfDJCmOCLNi5QMz+4dw/XNPm7D2tlqm9tNNhWDSY47vN
         BvA1vverpH7rRRzr44m2vtVRMqxkhC5zqKSBtSCGnzPp7AfCA5KOX9whHkQlxPApN2zN
         slLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136143; x=1778740943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4KLMY558TYgnElAbsXo7fOzEKP9ncLvusxHoHl7/Q8=;
        b=Tn2bWz6gQ6qj2v/eN4Iv8Sk6C3f3QLaW+62Y2vu+JhM94e4tUs8w61CumCj2eilNmS
         qwQ0H4pT8v+OEPCuTuXNASViG5DehjN3kKFAnDtuCgWZ/yUfXC/5i5ho/8KffaUc5EVt
         +NVPWeB2l50mIxJ3WzpAy1gqUqlg3gc3y85VMTPXdGi1yhiDlfWXkIMhPgEQXwb4Rbrv
         RFi3VgtBhivWjhruVR0Zf36PLbYW5pFsnCVTF51a24mABIleyQRs02YzigkZR2jsfsmA
         utiiAiw+f+kJGwSULqM+J7JpHoLkKQTNZX/Or9fISaPPWFTvhAehStWTNAVlDZklctD9
         tXUA==
X-Gm-Message-State: AOJu0Yyipu5f8F2ioo9PWUIZUlKJvzdNOJlRUkBQfqRsuiN4zoNBMiyI
	w7rulxRVIjBVm8bV7fUsAkMmxua3u4dg2oc7JH/g5Gitd16hYfptgiIyVin+0PVqz4keM921/9q
	jLTqF6ZsG/y84XUDhqIZtYuO+rywQGWpfJL+fmUYINkNIkOYhQRq254vDW3BbDyOMmA==
X-Gm-Gg: AeBDieuWRf/4MKvnMVaUh0DYz+FzO9CCsAXfdr2oJz3tSUSAAAwS8WhftDr0yXbLiOq
	y258iA0XNb8THtMqUIDfBVjmMf8LGDX4E+RpxWQmLtuiuTWuI4riW662bSoh77mlobXwND0Fyrl
	q7p3gvTXeRnnxh8fotRsap1aljbogCd5t7B985U4cZKJU4/uT6Yh8cJZAmQeiET3d0Dv5xwB/J2
	9MLtbJmeytOCrpCLHUt+/tDVrK64j41m5zJlKPTanLQL4iXkUdgnWHK+gWslGKNPddvVCUTC8/F
	Ut3vZpu2txXCCRJLbwcvFiZgVqLbXDhqcXHu/HeLAPRwxiMl+k+Ia6VoNYnk3HKCjelVuCT0DBK
	cMjrIH4RrMpNaN2VHUc1vQHj8s3jUO+MJ08Q+7TcPYJnDfBtTGm9i7d6tGHOoKrj2rieuZz9H5L
	NStON+/uOrOQ6aC/MofNLgHsaSD43R2DNKygAM9gTzNyi+eeCVfcsrMWlG
X-Received: by 2002:a05:622a:6096:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-51461be0cbcmr92210761cf.10.1778136142777;
        Wed, 06 May 2026 23:42:22 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-51461be0cbcmr92210491cf.10.1778136142359;
        Wed, 06 May 2026 23:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:05 +0300
Subject: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2941;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QxCGqIHVv5yEowFiMuTZ6xAme5VboAgh/OSRfsnG4Hg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ9tmmnqlSEp5UE7gFt9FU8H71wEiO1dbXTQ
 jkjAVGFcDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PQAKCRCLPIo+Aiko
 1XpdCACC6mrJEqsscLzoZgPLf06Jbpjt8r9O37DC1OL9K7Ln2w7QO88M8yQDFx1g3wxmnrmKJeI
 7eVKRRCDu9BuKyT9i//lp6BHPXFIGW/lfD37Y4/gizmVbQhCvanQNiABnyagYfty+CoPMRjyv5l
 ApfcPXQbPc7wLhsfO2w3T95HuHN5WAnQ+XhIaHcER7HAbTC1+V/h6STBiGgMFqmS78CebxFhc7I
 9Tn1+ZFxTD77rN6ydttqWhkZXQjq8rpH9TVOcwXw9yRCNEMePek5FYddOswaFewBRRoN082fa2Z
 6XfQ7MEHbQjxCiU59dyljf8P/I2eN4Id7SFvJeH3bRLqf2i6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc344f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=S07ZqrrhDxmTjaDOwnEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ZdZQLWVMAyHODRQZBEIwvaXQM6NfGnuJ
X-Proofpoint-GUID: ZdZQLWVMAyHODRQZBEIwvaXQM6NfGnuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX5xPsyOPMaFmS
 90EUZZTu05/9Tn7n9ApDRRsmfvx9fVs38lCu0RWCMKgx8nPVAAPE4t02HRs2SPUQsQVl+YCzNr8
 1dvn5pzIU/AeqiPgfL7xVlgrNK1aJImX3AxAQjhhIoDjHYH9STbAgdd7FE0UWXrM/ca0EdqQIXt
 NJCfUtOqv2LaynmyJmHmrfsB0d7LzQnog9wc1Ae3vZlo1IIYnFi1TOEaQ9tcFz39MyrxCjJZKzb
 b97Anhu2cRn2WYSr9LmvhXvGYpySzYTX4diwdc+1Adm4DeZw4F/IIuNaJ0eC+jik+al3F6RluZ5
 2kjjHicE1AraCbIklurWR8ZBCevP650Cul7/q20hTnlSeIn1tWUJIaCirGiRC4fEXyOYK/FZKri
 7pBxZz2FBfqufo70V7V0dR66L+BQHvnnAz6o8y3wGb14CJKTnLFBS2La0NcvrljZL8GPcdIXqvD
 m+siS2GYGHFkgGTmuNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: CE4D94E3A6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60725-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


