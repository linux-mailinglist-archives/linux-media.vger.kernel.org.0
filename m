Return-Path: <linux-media+bounces-63164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IYIGLTOG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:01:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E25614A6B
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17BA330B03D4
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A2E32B122;
	Sun, 31 May 2026 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCOD7ycQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaJtn0zH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F2306767
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206965; cv=none; b=Ucqs14a09WaPA4+ewChDXk64+XMQe3dRIJKyrSDg4+yoSLEbdzfLbTingWvsgxI5NjK1OyYhuBZiSh+b/eF/GXAjQoM2P/wNKtYkVIeCVJd9Df0/4NVGfidjqmiUkMtbCJRSc827CLzJyeWdVE0Kwk/tTpCfct6jQyclNbbHFVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206965; c=relaxed/simple;
	bh=dfU6+dokRmdLHFqF1O48cBLlUXiRI2PArZA5+lK6pus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqFJsJ9yLMelqLFekalHALgjlUIAyetJWRPoMxpED5ezsG3LkNdj7p6tRsREIyD3NP6Y6/wt26mDe06YkVwOB28igjgNHwCv5WpGhl52SCRjzPuTZmtzL/IfkC3HovZ4tB5JfXyt3uTBYgt/8rMRTs56AZySrh3eZGcOT5IPCUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCOD7ycQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaJtn0zH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V4X2fR581303
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5VzfpyDmVjM775VKxwIpIo0dFf4yb7OgSjGOH8Q/3Q=; b=pCOD7ycQM4pDCl5I
	Ytn/zrgRMi5PBiJAk+AS+UGW9BI9dfH6MLeVDajCQlEkIebBG3hUTyCYusiPC9j6
	EezxCPQnvXgGW1wHjQCobNljjT/siEUlOmkXppi79CDPk4yLL9Gbw3rl7XX9zKIk
	jzBKJmZgpgc/+djaF2NyVHNZyc3J3kJqhBjUkwrcI7oKi95EPkKJw26cyFVlprHC
	w44gOa+TaJBp//RNRfY0SHOrPr97JbMKPEI3AZlcvBdwRY0cVvtyRJyvOZvp2sP+
	hoD57QdmmJ7J6V9tcA8dhbHGZ1OrcSyVBPhXCLbQWONrlqa2jUeCD8tKiLuMEcPq
	+qyN6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pkf5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:56:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so6727655ad.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206961; x=1780811761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5VzfpyDmVjM775VKxwIpIo0dFf4yb7OgSjGOH8Q/3Q=;
        b=RaJtn0zH9mfcS+3MYaa5va7x4VA1yniNjlPmipVKIuWW7dAvDc0UVnkk/1vMU7UKVq
         YGseIofUak3J3V3GVOOop6hY+kxoGAxRU3a30Ec6jYR4Y+i4LE28eypcn4PlMZyt07Hm
         vEokxZ75v7IxFv3RkZGd+GRn/BRTOJUuPVNs2lEHE8lAmirOjYfJUnvpIloaqpjxu/uz
         aRwGzc0Urn64SJYJ8i6lkS1pFhoL8hIrRrMGfii6RrX+mazCPryJm6VnnQbvLDbM3JbT
         nBgSHtWomkQddA1/sIUK74Ig+KCEMaVsMr5/FLkO7BmEviXeiCSzLsgfvtr9cfloJkUn
         pnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206961; x=1780811761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5VzfpyDmVjM775VKxwIpIo0dFf4yb7OgSjGOH8Q/3Q=;
        b=AJLRRG6xJMEOVFrOAno4Ou/F5S2lRyYGW3jC2u56642OyqPdNq2CyzNUJM1Sfco++Y
         l0V9gf5rtos2ZyrvE7YNIIoTXvWjMTajxLUjchJ5pxgIsfRmZM1KMIRLPVBYCNW0gT1m
         a4Xx0LsHRVEFS7k4LkRSBTGGC5ahCcbptylX5k0WYRGDBLRoim4pGW0V+SH6M6/8bou/
         SlUpe5+FnE+6WWtmHyRp1+owgVytAa6SHDkVXUhCa3KrK7grIpRUadIk1fv6FKS1Kvrc
         jz+oqdn+V4caLccrUo9z6SS6HTNEF+KoJ8F8UsGh1g0HfRByPBiNKe8JGcbQGq/i0hHV
         jkng==
X-Gm-Message-State: AOJu0YxW7cWEL4jh5WhgpjKbOugup2HgYV6DNXJtdKOsiSE01v4ylBHI
	6MdcJbE/UMStk0M8rFb/hyhWBNGN1WkUeEMhnUbtdPgdeNjopiQTA1GD6Kt0jpd+l6qJxP5eCwB
	NQdVYfrc5GHs8/WOzbE/6B2tXoi8cJwDClgc0Dm1QyJV37aLnz08VG5CN5qSZ0ulz2w==
X-Gm-Gg: Acq92OHp97Z4E9exqIe39mrjsQAmfLS738bQbFuQ6b42SFsgCkr7G2q6lZRHCvMY4fC
	auzNtz0SmEm9QD6xJeCMRFpPCJMg0fVNfuD4wfRl4IPdq/rTcxzmITNU7iLrhBu7qeK4X9/V1c2
	gy2u2Wxjo/i2DLtkiP1Yc+XmWENcV6uFRF4Z2tvEY5B8vHQKG0nmPYWsXddCEnsyA8whWm09prG
	48eEFHqjdY2ueyiBhfIbriCHYeLk2qO83MudEzv0daTmWgXfYVonPY+XONH7tNMz2tz9bWEm2WQ
	YguegBB2NGEWPteuILT2wGcojhxPjds/AHL4PdaMGSCswhu1b9X4NfTjY3ppeCFPGhLzoehhHeM
	eCK4OHME9V0q/x3u6JfycyHcfIuP+t22ibwnjbBMUOym8FxMvMUqJ7zLOAOVwOLaU7Q==
X-Received: by 2002:a17:902:e749:b0:2c0:b4f5:41d4 with SMTP id d9443c01a7336-2c0b4f5428bmr35522465ad.41.1780206960994;
        Sat, 30 May 2026 22:56:00 -0700 (PDT)
X-Received: by 2002:a17:902:e749:b0:2c0:b4f5:41d4 with SMTP id d9443c01a7336-2c0b4f5428bmr35522215ad.41.1780206960547;
        Sat, 30 May 2026 22:56:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:56:00 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:41 +0530
Subject: [PATCH v3 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-7-4c699c3dd719@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=5062;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=4TfJehBE92h1hmWIguFxpHCkAJHvwkJ4iRehblWu+mA=;
 b=X/pafYCT4rNyM2SQ94vqgs6EbNJDMQ3yis79ZD+UWKFyo95X3v/T3/xiWqKLDBOwqhVf3ZgOn
 OGUb19o252PChB6BS1VZzGHfoCV5fWqFsmDMPgnpqDcmAoxmOi+z5eu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: T7fptrOPtbjpalHd1kGrB2pMLwZwEImp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX/+HMGf4bKVdl
 zLXBHweRIAwkQAft8YdYiEl7M9JOspjFj0I/cTv9PVWvuvcEzXEwPFT+vaqHhHwY8dgM7ZGWy6g
 eofpu4vT/qBKL1lpa33hCzEpWGXraqEMNgZ4f9y70UtlAMgi5MB5j1K7eyzxidcFam3eGmhrU4h
 LZ9haUFksCXIQc6yqdUqFowrDi37lAe5BiJPA8fSGG8AYgTcPBsO2rbJYfFhK2lCy9jy5uEFG/a
 vPCBFQjx9bM5IKexQhx3lWdgjz8sJzR/d0AO1jWBOvbY7uohijnWa6++OdWTwButAhaYMLo6V1C
 vUbN261O6svGXwZmq3K+YijJYzcE8aGDnnATRf6HK9LL3DX6ki0v9l6qaqH/xdK5l0y9BGlhAAQ
 YHuD2K36tKlwkw3YYqm/Yf8LpJafel51D81+o4i9QXhn7tPa4Nx/xvWeQgkfllWSaOBF/Dtptch
 3AP9L0U7eUF+dJ5tv5Q==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1bcd71 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CWBAsx5YQZKXPYp8bPkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T7fptrOPtbjpalHd1kGrB2pMLwZwEImp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63164-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7E25614A6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 73b4d3381e47..2a4a813c9c57 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -455,7 +455,7 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
 
@@ -463,8 +463,6 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
-
-	return 0;
 }
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
@@ -473,7 +471,6 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
-	int ret;
 
 	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
@@ -488,9 +485,7 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 			if (!force && buf->attr & BUF_ATTR_QUEUED)
 				continue;
 
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
+			iris_destroy_internal_buffer(inst, buf);
 		}
 	}
 
@@ -500,11 +495,8 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		else
 			buffers = &inst->buffers[BUF_ARP];
 
-		list_for_each_entry_safe(buf, next, &buffers->list, list) {
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
-		}
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb76776182..ab8e5d953101 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -112,7 +112,7 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f..e6fd38ad8e36 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -442,7 +442,7 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
 	ret = iris_wait_for_session_response(inst, false);
 	if (!ret)
-		ret = iris_destroy_internal_buffer(inst, buf);
+		iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index c350d231265e..917d2775612c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -447,7 +447,9 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
 
-	return iris_destroy_internal_buffer(inst, buf);
+	iris_destroy_internal_buffer(inst, buf);
+
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1


