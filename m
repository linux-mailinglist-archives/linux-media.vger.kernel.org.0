Return-Path: <linux-media+bounces-64357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fOtUI9MFKWrbOwMAu9opvQ
	(envelope-from <linux-media+bounces-64357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:36:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8678A6664D1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:36:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AIu5OqaU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VDCANzXo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64357-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64357-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86353304460D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235223793BB;
	Wed, 10 Jun 2026 06:30:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C7377ED2
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073041; cv=none; b=PAwXPTq1YNIsdZH5bifHw5S4b4uBzbaDJt9uQnw7kp8EM8pwT41Sid1MG0R9GHBpqtjGmagCj6vx4WWfZMXI6bIRc+hmezuXVaSXB1UVTAgwPAyF9v4wPRJbcfpSXLRRzUOL4SIen8/zfgx7XqKz1vaFgFPx/k47aKVPO6q1G4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073041; c=relaxed/simple;
	bh=xu0XPQQrGgIcADZXkcWURUAsf1MnYM7xyMfECG6R4iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GyFlqCS1P8bUUNzgaqZP2uCVQAhEd2kFjQk5pZT3LvI1ZQ7dX8mX0kRlwhRh1A2Q00WNSu3H6HULlV1cO8R3AV3Lpg82+MdtM/TJwrNNPikgB6C49odV9D4xzci6TVhsDKF7t2ktWrQeXC7HH4/KJRG3jbsWibAkFFCMeeWvmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIu5OqaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDCANzXo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4WhlZ571717
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=; b=AIu5OqaU11VlkgCu
	io1f17qEYHMztmqZbaxrGPlMzRwhWQywIko15R9+cbIg8vahzI5f6+YPP+MajUj1
	6uH8UpoNEl1vWnRGWWdjkgeRb8ElZJlW52TEoIUYDKdEaY4B7g0Ht2jP+K91ocIc
	z09tNlRwKIAzqaU0/pacnpWWQ8in88PphDLZGdGN1yOjNp98mkcv+G/KsaIu9eoR
	dzWrlizqF5i0yMFTvssoe4bKEJI1wkOzSCm04OIiIg6aR1mdX7wcBLfbp3rQ4S+G
	0DNGPFGLdRDtzvNpxARHkEBwFb1IMgJWwT9l4HzcEop/ZQrbcDUPmJc9mX2VXewh
	NASfxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8cpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:30:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso6132309a91.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 23:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073036; x=1781677836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=;
        b=VDCANzXoeuH2Mf9y1xTQDuhiBfkoGSJNJsUbWGCMVBNs68IO6WK4ltsizHldIlyR1r
         fI9/nQAE8OfVey4eXdW2zxvZ61L9bZVKpd0pkGpB5mXRVfbOXFWtd5tK3MzGg+++SCA0
         9nim1ODySIoYynruH6AFZgFuTmeeJSv0n1Aozf51LH+K/zVS6U9a060O0/4SI4KiLoR6
         Z9FcFcE+AZfqyX0bbXinWVL36/DYeEsrsOyZC534aVT4pBsiCgKdPrR4buuxvorZHQ9s
         SD3qtvgL0Sw/fZ1OqZY9uZWTZAMqz2sVjuj7y8Co++yKghq7k76enm/tiSiZg4k/YPVs
         /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073036; x=1781677836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRWghUWFVPf3fPEbC/Fe3T/IcSJlI8g6PwLdmF+HWAk=;
        b=ieQI4Avf8B8Dm3GLKBABKrYYciksPrdHfoo1VynJjOH1/QMpQV2+6hzGKwqlkDFmVf
         zvQKdbtFE5bkyLQlcOLtXxVME6tHbrZUFFXHCun3drHgwGRu5ZLGpMCelKEeNwHrNck/
         K66EnOaDtTVlxbPEAx81dbf0Gmv4HmLdCQ11FD4oZNfJh5JvvakddRx7zFgYBRuKRFY1
         HnCx+sPK8mY/WK/dQiQ4bDzs7cxsSh/JaPZoTxSQvSFdzWddFMl8OFjc+QcXNazTerJh
         HBq/uHuYmM6039WVy+qVC9PKGdMRBjQtT45YQxsCMjTJf4Ncyz81dN9MCMHpQyoEqVY2
         Zwhg==
X-Forwarded-Encrypted: i=1; AFNElJ/e87JKPfvSkV4HbJJoq9W63VWQF0/lZlAq/9eGUjjMBMaa8cc/zzSx7Ftr+s/0jXgDbyQUygrybPIViQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+QRq1uXZQB3dfz/PswqqQ24XeQkjRrHrTIS+FhKUM39UL4jM
	PucJbov+JL7ZJy6RZDnBsBcUfdGnD2weRmzYhmvwr5azbqHzGvzh3N0EKYHM44H7qB4rRSlPxka
	PtjqzaT1gjDrlWngR6oLh1nFykncEvc43UfLu7DqHHeTyCiRqZfZS30OdPSXxq+4SYA==
X-Gm-Gg: Acq92OErRYu34CLo4psugJqPQpEXbV+tZr5VF/p6ZnbTrQdNjoZiwU7p6qpP0J8O6qA
	ZykHip8vmv8CCFKZUeieHqNxeuQAKdW093byIiBDAV0gbiEnMvhQ0kjQfCx4Xgf3QIY6uGidm9w
	IgLNm4jJBxhPyyPCYNjBWfvWMqRzn9sYN3ZmFUlK7F6qtrYXKyc8ovTXky/b2FmByYmTpjN284f
	d4m2JBuWip+op2urR/H9EqS5wFSUeBePpCnD6cln5r/cGdCOqcdJT9DE5/aWSf+ADBQ1M1XjJj4
	VNf0tEA+/hRT6cPgzz20Ph5ah8YfszyJ/hDg/lJHS1ae2Dslb+fI2nNVAstcfIGIdOKXJqjZc+O
	AuhT5yXf1bV6aHmDryQVhBFGLcR42RstFuGoRDhYfn4SRzzjJcfUd20A/OvBWJgagJg==
X-Received: by 2002:a17:90b:3c4f:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-370f057b7f0mr26101949a91.18.1781073035554;
        Tue, 09 Jun 2026 23:30:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-370f057b7f0mr26101909a91.18.1781073035080;
        Tue, 09 Jun 2026 23:30:35 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:40 +0530
Subject: [PATCH v8 04/12] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-4-1c79b9d51fc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=3955;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xu0XPQQrGgIcADZXkcWURUAsf1MnYM7xyMfECG6R4iY=;
 b=bhxQGFLqPTHgIUNF7liZjSwOjDJVrophzNwIhKAIt7mP8Rj0AmnNn/j2fvNMuvpvvrPzTfDor
 Ok9eX9jBxT6DBvC+J8JzDCx4VCOhGvpkppCPigyec28OnF9HI+6Q93O
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a29048c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZwZBACt1qYONU4SPBGcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 4mwDG8wwawbwmwl33kJvt6ZsBmUDQWDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX1BZKHuniMxBs
 1OXT6FtYSKU2XJlhSxPZnI2xf+jGsBPWfbPTJfMcqA19zcR/FjbyiyV/TGCjz5Y8e+GW1Z+fcEa
 vo2v6pBx8jZnBP5omkVjqziHANqtTRL7THLEMhtYIu5ugLgOwSRYd4bxZBlnnwN1rVah1xUbs1z
 MyiRVbxm97aL2POa+DXTiCwubK8nmLUgkuX/eSYHFh6f99QNDirmh+bbe0j1WpErP6rPrsR+kwd
 CHUJGR4LGrLpShqNRoPODuaL2OmZeH4VpUYW5fZzSZoQ++ko4fjTfdxeNu+W2dh8mZfMXC/NgOo
 b0PsUCrrUGuUeOQrM6peEch1MJ+QsXLNLLjweKbSGLWvTBl8n4jE7bFbG/FnGqIWkOqumHHywa+
 DBRKU0e9seRa+Ir0onRmcr1M44ShK/VKTazxVBrP6UsIkOdks+/74DmRBCtc2h/H3iE5Xm2DUiS
 sKWtn6Ot1vr8ermO1JQ==
X-Proofpoint-GUID: 4mwDG8wwawbwmwl33kJvt6ZsBmUDQWDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64357-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8678A6664D1

The glymur platform requires a dedicated firmware context bank device to
boot firmware where linux runs as the hypervisor and driver needs to
manually manage the firmware IOMMU mapping.

Add init and deinit hooks in the vpu ops for context bank setup. These
hooks allow platform specific code to initialize and tear down context
banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  9 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..89dbe9bbf6b0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -19,6 +19,7 @@ void iris_core_deinit(struct iris_core *core)
 		iris_fw_unload(core);
 		iris_vpu_power_off(core);
 		iris_hfi_queues_deinit(core);
+		iris_deinit_cb_devs(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
 	mutex_unlock(&core->lock);
@@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
 
 	core->state = IRIS_CORE_INIT;
 
-	ret = iris_hfi_queues_init(core);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		goto error;
 
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error_deinit_cb_devs;
+
 	ret = iris_vpu_power_on(core);
 	if (ret)
 		goto error_queue_deinit;
@@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
 	iris_vpu_power_off(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
+error_deinit_cb_devs:
+	iris_deinit_cb_devs(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..8bdfee672954 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -319,6 +319,20 @@ int iris_vpu_switch_to_hwmode(struct iris_core *core)
 	return core->iris_platform_data->vpu_ops->set_hwmode(core);
 }
 
+int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..e0dc109bbe6a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -33,6 +35,8 @@ int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_set_hwmode(struct iris_core *core);
 int iris_vpu_switch_to_hwmode(struct iris_core *core);
+int iris_init_cb_devs(struct iris_core *core);
+void iris_deinit_cb_devs(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


