Return-Path: <linux-media+bounces-57474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MvZHmdzyGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D809D3504EF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61CF330242B2
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CA51C8604;
	Sun, 29 Mar 2026 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4LtILkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AokgzxWq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D910F2
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744409; cv=none; b=Py5foWZJnUYirPZImpJx9/5V2NoeqWkUjIhx+0eWepik5KqKU+7ykbxCY2+9k8964RQRzjZW1aMaiDGfXb6s0OSm9dcU9AOM7Yz02DsSSZf1i1IeE1rt1YVu50X2BWITybEV32K2ntFaRCYvVrBxsTQQ/ok+YroMQ3Iw+9dtDNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744409; c=relaxed/simple;
	bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oM7exPw7BA7NT4Dqw/gRL1r43OJcUhN9ZvsuC46eH2Yy9/y0+472xotQEekMD45pD+yul+pZp1sd/CtjypSo9iWsfyzCOn7lrRuSDWmY1yi/de45bbYim3tBf+mROv5hT6rvRafbUY2nL3+1FRE6NMaXe/vUI5j2wK4keey3xdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4LtILkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AokgzxWq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SMj4rp3574320
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=; b=p4LtILkOcOG5alEN
	Z8sZRYkpRLYXWsQaTLEz5tRjzpiLTi26uMmusy/kxjV1xDPFj8ODsjW1YRkFc83V
	WuKZnR89btzrqVWycPYcBfohbIi87+jpQ9hSnzhe9RUe/S7xX4+bw0m/VWEq8Zjl
	AfeVcPem1JaY3KaEkCuHJKi+FgTkb3O9E4GXczR3IgDt+7V12M+93a0HbnBykerI
	XpuCcv0j4XCuc9sRTSDAFRX8nrXk9J0mIS6M/VtYCatk6mO/qzalYZOd0Ba10GwN
	jaYCHLtkBZUoN9TJcTx3swNb5b2blEPKGQcSmue2rS94CHU3aH/jLmccau0qNH+s
	weSjtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c79s69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso43367711cf.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744406; x=1775349206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=AokgzxWqEuPbB0RXbtScfb4Pmf0h/VtR5HDKTuO/ebqmpzN6SQ4WVDmWGTnX9UaUl9
         IGm7yhK/7MmX/qanuYfm9nE10u5Pfu0RqQkJzthpK4IqJV9iUYczl201A1Cf8PoHouyA
         R9RXad2u2cxguCRA52LtxIqQ5J2C+SO6dtIcEbuDvWtKUpD3+qRC0hrY81UiTk5ClMLQ
         0JNdUR7Qtn2Y1iXm3FH+U7KRheJFeohrb+EP1KcFODof43BIo1X+8p+LWfIQOKznhWIU
         sb4w6pL9nUAGRHeejIoqzcaHKKITgHFit5n/bYUQYcRwoT/7vkI5Po7QLCVbVsYE+LB0
         PvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744406; x=1775349206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=UU+gvaBeADkTEUuCfyZ3iyFLe5U44Zr98zzWKsbwlebHLsF0mDqLTfzHYl7hFfeAAA
         IQ/McSHMBELSd2xDjMMyhRhshTnsCrURUaCRttYjG+P+p6itM/Aw14XqYSRUTMYDm6/E
         XRZKXFGwMoD+T+ut9N/NMyt+QLLKt3BdWDTXIQwCxJ0vn6siMa9sBPaVi0gwgnYKEsOt
         mML4bQN9wW6lsteO5IYDQu1NTln5Yk+Lj2dAVQxZtftlCCxWrp5xRUEaQPoq+2nudEvP
         ASCGc/7plaTaY8Ur1aE3jFKCRnBjBclrvKgcHhXRUHIWDxoI0mlg7PfSVF73uAj9TTTX
         32uA==
X-Gm-Message-State: AOJu0YyjBnI0L2mpaCrA0ToThsMpZP0JjxIFFLJEBidGZddc+9sCh+W8
	GMZOhBJGSPaQy86jzzdcPJ6RrS8iQq5TezY3PWLIS4Ebu/THkLuIjHCI5s0bSVYx9WWQ0ZkjVnv
	3mMFDLonDPnmjHUqMvN1h46RACRC31VVtVGReSJeZhnHRGzWeZRNX4+mPEEAExjK/VA==
X-Gm-Gg: ATEYQzwTRBeTNUv4l8g21WglOfGjw++jVisbXspE/wy1ov7aZYf4zRrxv8FwWKjCLsm
	JQxEvrS3IRUAL2Zf/GsXgyAbE0TObwqmHayW0gHIDZVe5QNUWQ/XrKyYsRsUrKa/icPPvBKVp4Q
	D9B8xdq4W1rB/p/G7JBXq4lJ0PCQn4MwGTPhLNnLc2PI/BB6tnRPjMZC7xg+hCaS9iH6eLb66bo
	DmAs8sjN7ksB5qrI0wS+HD7Q5Lw4SNAR4oSemTBAgbZsspyiA0qSoSX2c3SEtmPqEZ38lPMk4EC
	Mop1Y3vcWRt0888OhFz3Ij7GRDSufuBGa7aGhwmzpJihqR7ev7NMEMnxb1C6yeJnmtIoOe83u5/
	8BPzWP+2vHWmddIKD2lNPgEXiec+Hv1NmsF7DguEdua0vFilj9LjJhyhl+LrztgfY0Ts7Z1P5m1
	eKMpZ+orQ6mex09HqipHJINK/qTlwaZtkZUD4=
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr115096321cf.19.1774744406164;
        Sat, 28 Mar 2026 17:33:26 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr115095961cf.19.1774744405613;
        Sat, 28 Mar 2026 17:33:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:03 +0200
Subject: [PATCH v11 02/11] media: qcom: iris: use common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-2-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6562;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNHKb4i7aMgav2rqUCMle2rb3eWzrcfiWoLm
 VEC12ClpAmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzRwAKCRCLPIo+Aiko
 1WHPB/90WB4nVrtBSggkNkGFRyjttpcc9DS7gCXQnU/JSo3WCT0UFxuGlwElHNcUkwXRRwqD72K
 VYqhCf5VqOW0M7CGuj5PyXz3mtcJtsCSba2tC9F/+bRM+faVAxp1bA/Rp2jYnQx1ddVFr/jGNxr
 JoKCucJKV0FlFrUK2fLHZWfjsjO7C25Kq+K6H5nKq/Dpdx6JCHpCJA6CXA4yDhHFVP/l7sLRPrg
 ei78WsCcBrd5TXEjg4MlbejnxTnibfE31X7Vwy/T0B6BrA5G/3OWzqpj/C7nAGHvtFNOnwdU5zq
 nSTiHGuDWZYp+QkKsF2iFTnygtxE6eDvHMS90JWLNU3L5xo4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c87356 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: BrU3E9LcRNeAGzLuNkxOvzvIp9MHoW-K
X-Proofpoint-ORIG-GUID: BrU3E9LcRNeAGzLuNkxOvzvIp9MHoW-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX1MFkDOZdepE5
 /RgUlhns+7NHp8nfzhLWXm8YFMAvlCD4Blr/M2qEsi3O+PTh4PLfUdKFxlE9uIkXWHwfnmirCHP
 B08I8Z4/AtNjQU392mUJxWysX4ebm4Q6H30d0FVPkntm/b5aIfDfYDZDKcQsdoR3RPSFE8HoUoe
 f+clN3WnyNOnKdkkfPgt7s3pvS04fi0DakvfVMcXxjOx5wnA56jw8GHcd/3IZI62QggLWwiXz8E
 j67QzEAyejbZuxiMCEoFne08e9iCvdqwfduiyzjztMukE8SSh7N50ajGP6qvyzXeigpKcZIxesv
 zRnii4xWBiTp8PBJGTd2++fLaC49TmwLRTvTfESPK/vhtmrLC4amhD/9nj4BuMecr9kA8zA/UDs
 V8TKPKJIYF1IVwrwJTnocHqRH7eU9pKEFoZX/K6q8ldmZYAC520hbUepFJ0zcImkCvjm2z+M+2S
 waX9w9xvUI9IE+1Es5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57474-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D809D3504EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


