Return-Path: <linux-media+bounces-55729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJzjNJ4ztGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:56:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 773142866FE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41E01300DEE3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28F43909BA;
	Fri, 13 Mar 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojgZtFRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXnMzBaE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09D363081
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417359; cv=none; b=EuHVXP6ZBnugBMV7uMPKSDaBRJg0gB1ZoCzPO08nPDhtwahixEEuzOflC9lhzCgBP7hyTGstmEo0d1uinGGadiCul8fL1zsHDGflr8/2ywrShAYPNWx17ML28Lvj0+aLgguEHgTEIy2fNuViD3wNdBGzC/GEhl5ax3d1xofcDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417359; c=relaxed/simple;
	bh=BHCrltSoKl7vxeGTt7kHNjXBp/oLz6Z3DyNVwQN0Z2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Acnj1KvoAGPSifAsUCZVG6uAFyUROdgOYP4m03k7CKePYhAHoTsKZbDQL71O2WVqPG9GJOpKYi+0zK4nfkN7aEwkjNJjQcE377xV7CwqpWid4vEFzCVnud8afIVMr2rV3zdf13gRurR6mq8iNIJhhi4W+z5pErfNOZS3qOC2aAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojgZtFRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXnMzBaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B6N53906313
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FTRo+x25I3rwOqyyDFGrMI
	HG7x7VoYvVDdNnIS9ruOI=; b=ojgZtFRoKuKiyIWuPera44Z+mzYsxH5isJ7PCQ
	nGwEYXPh2jhCdc91r7vvQvHrLIOUc8M9w8Oe+Eb6xEZ4L3AQp9HTbBcgNwPBcBBD
	YJwtbqMGXFOVP7VuAJkzg+GhBWld1MEADks2d2kwHnfY/hW3HrM2c6Jev8mxSTXP
	mZUdrgkx7fS0glnIz+vERwJ/RYpv+CoA1RcCpfJfn1l4YvMPOH3rwcEqFUw0nuoB
	kjPPVaP8lz2a2AY2antDV8/oqkGWCQ7u8HfCNfC4pmE5jzsGV4lVzdM2fdxyvvL7
	+2UeBY3pN5HOGC3q+F/KoF557ZsF0RJqUcNXJxGreJmz8zHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs9b6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:55:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2182752885a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417354; x=1774022154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTRo+x25I3rwOqyyDFGrMIHG7x7VoYvVDdNnIS9ruOI=;
        b=VXnMzBaEOY19kzbVVHazOgkhxPsUbdHEAXQBrjrnoL48Ke5hbGFOwunRH9993QTI0Q
         7CQQqqOiRHYSIKjjLixmWP5enwUP3jTcYNiY+nBPEeOFBFuVOuLhGE1aaLGJt3luzFMZ
         09OKwn1VP8VOmeL1gFVYvx2hH1MAylhvUe9KeFJkA7WZwS1jwAcggpu3Z18ia9ysO8ue
         m5x4eMy0m40aYM1Va2x5u79Os70wmtZsLFBlE/7phJebjuf/Fr2Tnfc4Pzq1rKOGAsU3
         uHPHsjr+wJQzqgQiq8vvgT9956ChBpnEyTuJi+fP5MbRJexiOqMxd+bV8LogD6C+LqHv
         GZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417354; x=1774022154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTRo+x25I3rwOqyyDFGrMIHG7x7VoYvVDdNnIS9ruOI=;
        b=Pwt4KbrMtP2sL5O2VBX9ovI9akAM1qZnhdktgJgmnAvQrbgaENoIjBc0A4sO75zf72
         sj0DbinTVMNXgYv1lKS6WlBy69JXq/SxPAqEwAL/rRVhSJp9co5Zieiw8Ct7kxFMqlfL
         Yi2nGNU2Fg4IxLDH8gE80DvAFm9nrjAK34HFL3E/kM3dT74yBMnxTzdHTl4odPGkudMX
         5KRwizDxTcwZqonp40W7RAXtnZpUlr44luRB2C67gGYDOLnZQixocNtNNwGebb3Tqsug
         rtjODvQTQy3aN/6jf0x287tVak+tq4EM+beBkd1Bgni8C7GYcGPVZckSDwVKVBgD0nOj
         ZbwA==
X-Gm-Message-State: AOJu0YxcJFIjZnQ0ZHFDGQcWNWoU6PK0qpRHoszOXBEdPxP3Mz+BnKBu
	kzvqVGbp/CBFmEY3C7jAiKx5lwghcvd1hlCbz7ggi21PkVHxCZgKB93wq3efvAjUOrUejkEm3em
	/jePVKBt3TmWTJsWYgfB5jHyIshlJTU+wYLcmcTikEb66zEz4a3P9Rs8kIjpppXYE+A==
X-Gm-Gg: ATEYQzyREi7adOZsTQrCs8rc5b36hI8WU5b0iw3pxrI4oCzcnuYz7NzPa6zJ5+pODG9
	kx+HZhVSMcmHEiAsyf9Gs0bz3hkgyoB/ijhl8t1z3io/gPhJJms6fM7GH5ebricygHuOFMxiW8K
	5mhRdv1zKrrEnow3ZqWPlRScTs4sX2AjClcj54OJvxyBzgojPQnRv/8udu8y1lx93BZSEAwxfcj
	z7p5enc9fq6Rf5CTRoBiETyswUhAFLWphz2/t1zSTvDklvfdfqrs5bjDvE5XD61orPHlF6W1bXw
	l9a/mKfZ1JK9L4M2i9qP6xwnD36at1z0q2qAOpekrHyfRoDt7H6I0FC/1Lsn1tprg8Y5WGF9LeQ
	vIU3rC9uJ67/pliFiJrkHBB5ZqN9bGNesDz4wjDQYB4eUnT+kf7vkJjJNUFTkSj7zWEjHEzW+cW
	Jj8nTr6ZiqICUtrlhKEODq10wvnCAdtMKONSk=
X-Received: by 2002:a05:620a:5dcd:b0:8cd:b7ec:7adb with SMTP id af79cd13be357-8cdb7ec7ba1mr301970185a.60.1773417354342;
        Fri, 13 Mar 2026 08:55:54 -0700 (PDT)
X-Received: by 2002:a05:620a:5dcd:b0:8cd:b7ec:7adb with SMTP id af79cd13be357-8cdb7ec7ba1mr301966285a.60.1773417353758;
        Fri, 13 Mar 2026 08:55:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33cd4sm1612329e87.8.2026.03.13.08.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:55:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:55:51 +0200
Subject: [PATCH v2] media: iris: drop struct iris_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-remote-fmts-v2-1-edb11793b196@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIYztGkC/32NSw6CQBBEr0J6bZP5AEFX3sOw4NNIJw6D00g0Z
 O7uyAHcVPIqqVc7CAUmgUu2Q6CNhf2cwJwy6Kd2vhPykBiMMpWyWiMHFgzk/Eo4ulWwtNZWven
 qc6sgzZZAI78P5a1JPLGsPnyOh03/2j+yTaPGgZQqiqK0XVVfvUj+fLWP3juXp4AmxvgFaziqy
 bcAAAA=
X-Change-ID: 20260311-iris-remote-fmts-53336c2b89a0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BHCrltSoKl7vxeGTt7kHNjXBp/oLz6Z3DyNVwQN0Z2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptDOItD2BFtAM3M5nx0ZxfYDf0cljD5J+b3rJR
 ORSfPDVanqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabQziAAKCRCLPIo+Aiko
 1d2gB/4vd5Uni5/hU9CR+XKdoKpVrCuCxU8BRrKrSHsictsB0TgVCUwB02UD+LnOxhv2dQEj59a
 YLAtJ8xGU6TWdTXNUqnswiawUmTVgfAYKPqPNYYsblKOuIhu5i7WmRvdOK9u54xTdJkiGfLWTU+
 AGTKZlSoDh4fBfxmf4Pt289I/OtNUE8N5jEVDUD7Iy2r5t0TGFvRwniuZXNiXES3llhszn7DJ0V
 bknUdxITB1+oq6ovrBLwYE5WIVfk7V5BwqGnvI7+Od9m+sNWlej5443dP/evI7OTdtYMnTpebJn
 Ljoy1KkaIsMZ3s6TACqK63fObuwCQ1Elkt/pHn1iF3WP95Cp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -c8FPB4bGV0Kfwc5Eee7fxPWyjBzb2xt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX8za/JYLxOIMN
 bBbUuhtdDT2dXUChoniuYfXD8QktLpcfD4xpWP8tlcbLGMXcLrfCEjt10dAwNOe+yDwoeptCqpv
 Jy/U6xWrj1NbzbLRvAcU65j0pJfS0ENsml5Q3v3ke6aZMeBhqY/Sng6nn/mx3EXUlFzCeyAy9pJ
 jo653ehwYGNiZYRuPDGG0Y+vDfFzAaaEwwffMBae+M7nnYctCb6c8IgZH313Arc8kloU6guxWyP
 ULCdBht8NgUw6dBh8ZFlYCWDBmHiQzJbQdGQxuaGasC/7055pVCAClvlhjt5GNterE4G0ooD8tr
 IrwCtl+Mcm6sHLRhSSwFPwdDs4Bz4iWZn9bLYjg3LZNR+IJyCS7gCaSh/38KOBGPJuBLlTOZy3S
 LkWwrXqR7hh82x4/2IPyFk58F3WO7uUgfoHSMil+Of8Kp8ZU/aBe6+CBs5EaASoq5TnfZ4h7/td
 ei/oXknXgv1/0yCkaZw==
X-Proofpoint-GUID: -c8FPB4bGV0Kfwc5Eee7fxPWyjBzb2xt
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b4338b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=P2JkpESjKQypXLoEBXAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55729-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 773142866FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The struct iris_fmt unites pixfmt with the plane type, however the type
from the struct is not actually used. Drop the struct completely and use
u32 pixfmt in all the callsites.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Made platform_fmts_sm8250_dec const (Dikshita)
- Sorted entries in find_format_by_index (Dikshita)
- Link to v1: https://lore.kernel.org/r/20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  5 --
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 17 +---
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 78 ++++++++----------
 drivers/media/platform/qcom/iris/iris_venc.c       | 96 +++++++++-------------
 6 files changed, 80 insertions(+), 140 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..0eb256b0e82e 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -27,11 +27,6 @@ enum iris_fmt_type_cap {
 	IRIS_FMT_QC08C,
 };
 
-struct iris_fmt {
-	u32 pixfmt;
-	u32 type;
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..737ca4b1fe5c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -237,7 +237,7 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
-	struct iris_fmt *inst_iris_fmts;
+	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct platform_inst_fw_cap *inst_fw_caps_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..bbbbfa6880ef 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -20,19 +20,10 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
-static struct iris_fmt platform_fmts_sm8250_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 platform_fmts_sm8250_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..cd2725d3ff16 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,23 +19,11 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
-static struct iris_fmt platform_fmts_sm8550_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_AV1] = {
-		.pixfmt = V4L2_PIX_FMT_AV1,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 platform_fmts_sm8550_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..74b0bed513c6 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,23 +67,16 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = inst->core->iris_platform_data->inst_iris_fmts;
@@ -94,25 +87,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -124,18 +113,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -143,14 +132,14 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	default:
 		return -EINVAL;
@@ -163,15 +152,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
 	struct vb2_queue *src_q;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -179,7 +168,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -228,7 +217,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_src;
@@ -266,7 +255,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_dst;
@@ -295,16 +284,13 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..0cba49df512d 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -85,34 +85,21 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_venc_formats_cap[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
 };
 
-static const struct iris_fmt iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_venc_formats_out[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
@@ -123,25 +110,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -153,18 +136,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -172,14 +155,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
 		break;
 	default:
@@ -192,14 +175,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -207,7 +190,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -228,17 +211,17 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
-	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
 	u32 codec_align;
+	bool supported;
 
 	iris_venc_try_fmt(inst, f);
 
-	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
-	if (!venc_fmt)
+	supported = check_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!supported)
 		return -EINVAL;
 
-	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	codec_align = (f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -281,7 +264,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 		return -EINVAL;
 
 	fmt = inst->fmt_src;
@@ -350,16 +333,13 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_venc_subscribe_event(struct iris_inst *inst,

---
base-commit: ba72d957a142f5251b0475adc80a8dcfd85bc7b6
change-id: 20260311-iris-remote-fmts-53336c2b89a0

Best regards,
-- 
With best wishes
Dmitry


