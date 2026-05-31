Return-Path: <linux-media+bounces-63159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDcACMPNG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:57:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 715FA6149E8
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F32F6304C8B5
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2488313543;
	Sun, 31 May 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jffAadAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCdLUOKS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAA322B8F
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206940; cv=none; b=P6hZj4PJSxDy5kBk0rnPSdVYSTQulJsGsSO3mKAl+RrISSvJUMtr3rFGtBpqt9I69CT6RjuQW003TVc1VuFUId0kRrXugyZ2gkzRt7uHrB6UCszQ8XK6iY3cDvHzC9D/7OuxXDdeRx94CnYRlnsQ0haZdSf1Tb7Sk3CvymEloE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206940; c=relaxed/simple;
	bh=bVPxoi85jbZFO9af2Hg2HjePj0L5XNSg5j6catQYaJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJzDqmvsBTPSqBSFqDAg9Y0TnaFlus/L+JHrya9hBI2Kn9Ju9BzFjXPGgWqqI8CDkYwfHkSQZxBCsazQs+//TZ0DGjYIOx1Wiwdm9U5oXZ97f7Fh7c3E4z75WNMnQWLXaHsEdaWJphQMgvKAywR1Fq+c1n5nuym4v+DVt2Hu1GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jffAadAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCdLUOKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V5cEjM2086620
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=; b=jffAadAEzOpKIi7d
	b9X0gR2i7tkBD8SGtjY6kjv7S2CcFpxdE0fIYM0bEaoHbdClzUTUWKe66wiKWSny
	XJ73AFe+qmtoddOuZeFe3c1EuGu7+uHWUmldYJpESXQ32wZ94vmDIcTz0ehi1sFU
	peVUaGggejxNE04boNZpDZZDET+6Jx5V7rxtUslVdafSxgfXyEcCkCqqZCpoxhg9
	SlsBD/O1jhSL5t3Ky4nGOs3XIma90wia/wEjqUFyJGiXlPP5DXuAjjUCKbHlvxln
	SgATFDd0ve3D0rOJoAt8p+HWsjLhpBTwMcgu+CXjo7yJeQk1fuYlx+LfGZWhM2yj
	38V5cg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux52e20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso3398835ad.2
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206936; x=1780811736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=;
        b=eCdLUOKSJ6Wh6YKqhcVAdTLkpAmy3WMrZb7cRdkvkQtBVsOv3buCMMS2I1+oeiwLgc
         H9YwwIBxONYG9NJuI5664Odv4MrolNt/3dSjDMqcaMUfhxrScFwc64qKrip3Djj2ntId
         j90mESU65BS0/wYoGED5qMiwU4ZPtY6rQsI60XTbrYQxzo8RsseXkzU0k0piLZ187KFz
         v2phfrNDypeWsu3TwqDlUdR6DKTHKoUxOlOvYKWl/bEpbTw8cf994VtwGYIGq3E6bTW1
         poTd5+AJBz9LuRhUHuqLUs7gFFk6NS+oM/mrNsK8KoQ3oq2Jt4xuukzigpovYTsRetnD
         V0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206936; x=1780811736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=;
        b=tHde/xE7Z2wInEq8dleAFF503Dy0PPvYPqlSLFccYeWqqaUjHX+3BofqMo0/dWWv4d
         PQ9ZT1ML+/vThUh1Ok5nNywLvCpUrpB4efPBzH+52n6k/y6GBEq6PoLXT5GYoigjVKGW
         i+1zsBvrYvmUphnfoBmZw5t7jblaHD52P+Yj2bFaLK1ai1WjXDUvUsoVGAFmuX5pExA3
         Pb6CydBakOCHHiGRrijKcYcTnxIjOe7PNu96kQ9/sYiC6AmfXTXtSSDm4S3O+bSdLJST
         hnorHe6bt9WJvu/P0iP5gdL8mgD9QuvqoONLGV/EmIdz3Eh/KuCngZL3IPj/qyCINedA
         uRhQ==
X-Gm-Message-State: AOJu0YwkghZG93drUQCuflC924Uk0IoCnrz9i6NJg49sfU72DmHUR+ZM
	lOON6ISpu4OqV58r76R01MCqCf18cXxbknmnHERo2HukLqtOY40o/5/oK9gqTW+ayHo8Qi23mRv
	5q0MzATvBRvbB6Nn9fI5+FIX9W4q8Yi2krVmyfICLna+q+bw8YjKfCLrmlCKtLQUKubm8EQukJA
	==
X-Gm-Gg: Acq92OFZ4fNrw5H4bHufh5Rk1/zIDTSaHL0OqAbcbLep7NKUigsIAkXPtR61J+Hk6Xi
	bebIoq1DdtS6M5TaWA9VfWw7Kw7CsdjSyKNcRI1UGHPddd8nuN9W84EJRC5mZAbbMoywDZrynWl
	QwFiwAEyjY+r4SDrifVkNOaDB8plL054KOx3aWFyhpsdqS2myeNBrZAHiulMz0zgm6kR3mdZ8SE
	HtaNF7UJWHUo1aitdfgcL6MIEXpsEqW8fKeHhrQucmwGPzOD1DDPp37fKJ79AQ7YhxqPgQXihh/
	5tElyi6nQ9gAp3W1saaL0bviYKnNt7p3dTkJB5BiHqEb6zmJAaYDYdvmP/UszjKZRVyolPcWnBX
	FoT8WPwfV+6IGAaT3CCPf1ivunTx6QfMgXx3lKQhY5W8aPaJIcPml1zzcjU3dsRpq/g==
X-Received: by 2002:a17:903:1c6:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2bf36877582mr69541475ad.32.1780206936348;
        Sat, 30 May 2026 22:55:36 -0700 (PDT)
X-Received: by 2002:a17:903:1c6:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2bf36877582mr69541295ad.32.1780206935919;
        Sat, 30 May 2026 22:55:35 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:35 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:36 +0530
Subject: [PATCH v3 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-iris-code-improvement-v3-2-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1345;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Uq29RriGWpbhBmOAxORGoqBD0WkHutgpBJXYyBKyE+o=;
 b=rQ1wFVhrzKpX8UHQdt+tbafWMw7piYPyv23/irop9qOXHIN6lTu8pOwBn9djV1SJY/P3OynUd
 pAI5c0BEm1ECcW/Mq8LOmwDxRzkN/o3mqWum2ZHCXY1SeeMaMltKMjM
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: yGwBVpnyUcYPBi7D989gkQWX3iI3m2Or
X-Proofpoint-ORIG-GUID: yGwBVpnyUcYPBi7D989gkQWX3iI3m2Or
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1bcd59 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iF4bBz5rOIv4ZkufqEYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX1yFdJMBawMPb
 b/D2+vVHb0gXJgrhVORsY/lg3We5shxM0R9ZSt4wxaGxBTa2aYlnB0kmLmuppWSRhypVwY7t4lI
 mI85wKQao3dQJ1iej3atRY+4M2UVLBbDQTvcADkFiFwD4n/fG/foYHoTuyt//xJ8y9Wi4SjbUMC
 QRkIrFrX67nXkMEDHfuSyiL0aGAV6kEZrAxdouqOjUHg9lxQL864fqcQaoo0KVj3X04yiYu9GHN
 yU9/ZQZS4u2A+Taq3oFDHQZF1eACL7V6SlcDMBzo7trEGXOwzMKLe+uNxrdeidbTL/5LqpmJ1/X
 8isKwxI10cPpclEyeo+GPzYkIyDVah/vy+yddRZBajln70ZXMQ0tYqAQ2sRWnELzqyDSdWHZI8Q
 2CB03IkuH5U1IR6CeHmWYmCJMz/Q8AzPBfkpalgti7yq632H5xy1yyKJ0z7/Bx7F4ntWS/P81kp
 Rxcc+RR/oqdUBOrV3lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63159-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 715FA6149E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The state‑change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for
debugging. This happens because the state is updated before the log is
emitted.

Log the transition before updating the state so the previous value is
preserved, consistent with the existing sub‑state handling.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750..e991f34916ec 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
 		return -EINVAL;
 
 change_state:
-	inst->state = request_state;
 	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
 		inst->state, request_state);
+	inst->state = request_state;
 
 	return 0;
 }

-- 
2.34.1


