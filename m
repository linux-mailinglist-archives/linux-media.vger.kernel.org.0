Return-Path: <linux-media+bounces-63162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC3YA0POG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:59:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6DF614A34
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13626307DFAB
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D183A328260;
	Sun, 31 May 2026 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORZwSWsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pg2adjf4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649231E859
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206954; cv=none; b=FJG5Ov79roIrhIW6cedfFouuvLOE9nTfWP8GS8+wwM84yir/v9dPW9tUAogM0h/7urXk0H/Wib5RzqKEmnbimD/1s34p86ljD8m48LpNZ1ZMy/AvMFEM/l3/o+A538qbRIoJJd2E/2qZ/Qz77TMtJ/fOmmG6vtw7eyVJSIb5W7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206954; c=relaxed/simple;
	bh=+qL/hBSTWBuxNiFK2MIAANTOJ8DrM/Sqlp9Ov3W2cvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Efjn+QK2Eg/dgkrgRGAhNEFkZ6oTwpmdwQ2xEhWmtgyof4yNckUvubAuy6AeDmcu078t8s5VzUFcgZqCOHTbjtfcKHKaJ2RyQMmMGk/qskwXXafl5j0iNYtgqWS1kLOMRQUNwNxQcM86dZ11OJWEKPDRGqRt76QZS4mUcP7a66g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORZwSWsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pg2adjf4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V3KdC8716773
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m48eV0xUesXIRVTMJrkjrvdiGFvsY6A6Ikb+qrJ/+rg=; b=ORZwSWsjW37wyi5D
	TW/ayu8nhicAS0ZqJqFNMJwNLjAcCf3AWT2J9cohKjvbsxAFGN4834fcD+om+eHZ
	yLr173AphtU3bkGnOSUgwlcjrLZ48vTSB2H3i9ni5vuczBjLvNyoxj+w0m14Hho0
	xVXWUfeTEooxAlEGGBSDLqMH3BRMaUHmBfwIlENXwDFKHqp+84nt8ONZFRTgOQh6
	Pib2cEJlWOE8YMV/FaBRdz/KeyizvTD4vqmbtzLUn+CP0yD6IeP8wh8J/5FSHQFX
	+5dF/P6hi6NZ2UwZPlQg8SNHpOi9D01Qqkjtt9VQtUDjk1M8qYoauuLr4aBLE7sW
	Tcq7Bg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2harex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c20f7581so3511845ad.0
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206952; x=1780811752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m48eV0xUesXIRVTMJrkjrvdiGFvsY6A6Ikb+qrJ/+rg=;
        b=Pg2adjf4knGmv6MTR1TuOMaw7Lfgc0RIRxah4RP47fu3EMZnO4J5KqAYj/s+QD0bj3
         egfscpbYyA0laPFMg4USAxQjb+CxZM4gqY9EtuVnea8TkyB02zpgSul78Pyt0hYBpLEV
         2Qt72oiqog86adpL1I/IyKan8nK8Tiftgw8naUC9ZA2UHWkBUdF+qoeENMuTj9cPs6W4
         VxPYv7Tf033XPM3wDkiE1+8nwdyQ06CJbcR6gfhXQkRuFQxyskBvqyet81/amDAhQxhG
         2jGHS1KjZ4jwGbtTZlFWcxpZ1dDoy04iD4hF0acMeeCmOEplt5v6smVYAFGDX1Np3K/O
         5POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206952; x=1780811752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m48eV0xUesXIRVTMJrkjrvdiGFvsY6A6Ikb+qrJ/+rg=;
        b=SR0LTlqZESfr827fm1BNRpEJBgNqEpUMP7uPCoG63PWKGh6hjrJuhU4Y6N905CxZc3
         l5SGH8XUuMkcWWWO/UVVlZ9QZj7TVuNLLavEOf7XiR3Sp3vKg5RsGA+t+9agi16qEtFZ
         Ql3FZfm32Njmy3GowIP3SaLGhhhOnNKNSGTabVzc0lWA7TG9Mkt22RFbjeoBogW0wOm0
         SlJ/2X2euaC9+x5pr3FD0gFE+k/vY7XLRXtzyVlPMvNtXzVELlXFGkFP/PGueKTDwzuA
         MDOlTbozJfWfZgG6iX2dFDx9p4Hjoljkutsk7HXcNRMc797lGHpyrUX0PUaMpTNFeLwC
         UcQg==
X-Gm-Message-State: AOJu0YwBIkgnM0Zb/zqSMR39rtxSFpEd9gVeyURHdicMhZqQyncvnScq
	625B7w/zR7TJnOUr0WLROgFr4rYYzCS8QU+uL8z/Djztfc/dO707RIGFrqJgEr2F+jywjIkiI9a
	T6ork3NCN1NNM4JI8CNCq9CQWhGgJFSlT+4j7s3/Ko4MxDk0n+2SFlCILAU6udA1XUg==
X-Gm-Gg: Acq92OHLM+dxFh4snQ0SczDG3r9rldb6uG2tFxES6gywYTO/T1jw9wWpuI2rcl/tCdr
	Gl3qGZGSVC0Lg4Ok5yOwR5ZQPMT0f8nAdtFCFoRJRtvFbAfCQZSCQ5xspUYPG9nXb7Zbn+8QvFO
	qUA8v43H1wgCsp3Qs+o6e7WCUmGzdk/53UeYq73keSNJMKDhZORVQpQxtMMXyX5ZSH3EhfZVHrc
	+236b6EGdGZ2PIh12O4yHG1OmXRGuRqQhC3mG7pMZKv+E5b9zuuYao87v5FRH92GLKDMEXrnyJ5
	EN+yNnkJXbeP07pRnGb57Eomw8/blBCSZZHf86UvpUDmj8zlIInAYJcxtk37F3Bc2ozXSLNEhAx
	Nt7XDE4+qSQYIleHGGauX6eW6pHWHSDGAqCrmtYtA8+BUg2OVzKVtAElfQ+7oes9RiQ==
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr73823625ad.34.1780206951174;
        Sat, 30 May 2026 22:55:51 -0700 (PDT)
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr73823365ad.34.1780206950734;
        Sat, 30 May 2026 22:55:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:39 +0530
Subject: [PATCH v3 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-5-4c699c3dd719@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1365;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J4ckhmDMHxWwy+HpYLt1Dv45ile/JlEk5pzQRopA4mA=;
 b=nkOUzQg7r0oO4vvuYLPQyOBJg/0FtKpEBP+kJyu7DUXnzstucOVW24t5WDBHWnhSrroqr2Dv5
 xGkDPSOY/kVCuhTp4Qf59ARpmySmvvs/VYu99Ee2p93zAZgDKr76ey5
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX00o2M4q6ygaz
 nRdAGbuvvTBMVasbGERwH1RZ36IIgxxxfOn9yQSx6YIJdZkZZQFmFDC3/jyA0GhLOXsuU0RDv/0
 zJ4nk/4n4AFFi+EreLHKcD8B6G1XeLB/8ZYurLiFi4qfEcIyW3NFbQ7Ery5AtrWtk0kaE5bbeh4
 HADZIFL9oBWfkqweYk+nxBNmMSR7lOUdrbeYfgBgHjxw71wuK04ExAl7dthHS6NyBYHomZ/xm99
 lGQ89TwrmIzGTztG0PRwuonPvvna897kHfMmLXyYrTiVD/KmjJgYXfYeuNxtMjoiFM8SMz7sXAn
 IfJkwEn10mlgCsvZMbWByxBQ4+27NY5YcUNcw7q1/pwyhgJiSYmxJoirkasysk4UmT0J/VTMZC6
 h+RYHydJzeQJMcvoorrM95p3jeFM/kGZedf/pkYNbnm5c/ppHpQECNDccoxzKtY64fH89ESzna7
 Y1/IlmXU5gjpvMyGujA==
X-Proofpoint-ORIG-GUID: p8t45Hmo-tDDODqgyCm9pEHJuVEtPPDE
X-Proofpoint-GUID: p8t45Hmo-tDDODqgyCm9pEHJuVEtPPDE
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1bcd68 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1vCIiHQokKioWWC5pcsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
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
	TAGGED_FROM(0.00)[bounces-63162-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 7A6DF614A34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
dispatch table, causing the property to be sent to firmware twice on every
config-params call.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fe67ad0ffb4f..516bc468c72c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -623,7 +623,6 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {

-- 
2.34.1


