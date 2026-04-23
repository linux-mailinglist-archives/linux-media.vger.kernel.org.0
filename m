Return-Path: <linux-media+bounces-59397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFvnEnwK6mm1sQIAu9opvQ
	(envelope-from <linux-media+bounces-59397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:03:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1546451AC2
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48C1B307F85A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1543EC2EA;
	Thu, 23 Apr 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oopMWBFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlmiLk/T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332C3EC2CA
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945648; cv=none; b=Z7AS3rm2vHTgeq9uY0Yt5X7Xnz2LP2MIcPrdtXVnR7SQ0Sa0+NKF97x5W7ZkROmf/81e1XuWA47pOAOTxzKhIknwtYbDlHB2zMXmTLSV2vghO/tl3gl73K+FtgEpnomggkwm4zzT/A8Yzf6gRVlaIznjEMo/F5ns1L6Y8sdqJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945648; c=relaxed/simple;
	bh=i29lXDR220N9S/ZCltewSH2m1udYLebrd2wvWU1dcKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqeNUtC8b0be/L3jB6cijbuBvqOVAnlHHSjPnF4hyTGPuFVjwzQtJKKLB6r0/I6T2OKaQLJuIgg6xAyH95j28p4wRMIbfT7kn9OxuE5ik4QnBJIjaGN566ay1tmMRy3GQFkK/e21b6oNBYxpMMy7fMviMrsOvFvqfIp6YTF65Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oopMWBFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlmiLk/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uMiu1565714
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2aLu8tVOEk23kPdNH5kca74rbgoKNO8p6b0S6AIX50=; b=oopMWBFNUqDHxJ1f
	8s0BBoh7oQ2oUzN57gQW8Cl5ZLn7tiK8UIqUTppahGzx3BX/pudEpQ8YpdWNeNfy
	9uARNbs3BpSPu23gB3ummYCXvAe6qvIX04fm9XRSEsUwkIQFPIFRL37sP1bdHhGl
	R9FuPxP0aMR46mdkGXkyvnmeyBvmTtyLm5VFZ0X1QCaiUFk0M3WM746Y5sAKHhDY
	8jTi5cvXjibGCyFhtnYK9CO0l9ONFaako8fB0p48xdAmd+DCU3pJykGADlvsmvFL
	v35EyrbHwhwt3sPsfcgBn81aeJ6OHfmVmyAl2oXhkDEeIjaFjRq1duhFQo9NMUk/
	IYu/bQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuwf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so52463265ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945643; x=1777550443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2aLu8tVOEk23kPdNH5kca74rbgoKNO8p6b0S6AIX50=;
        b=QlmiLk/TVoaVwYa8MiZJHqBrR9Tx1XU/APH8bYscWnvh9UnYaQGmwxAZMBnVuuIWSZ
         6f2OjNrMycm4iALahERu/b3+txxmh1XwKrsnHFvKWZ+Y5ngk3kwa0nlJ98rocYTLgou7
         //6xiP5jQbwiS6ikh/PSq6fmM9SggDRlkzyHdz7cm73/b1xColW8yUxK9Okg0Jkb7izr
         6Dj994k0bygtjCLJ8+RCwzwwGUjlCxyICL+wiUm8UEVHC3OYgvDGfj6GhXF6iV1mGmpS
         DIRR473SMNq43fDQUj35huBhVVxlIHS55D3mlMqKV00wnaUDrc3Bzy63giUv0ZtuobzG
         XCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945643; x=1777550443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2aLu8tVOEk23kPdNH5kca74rbgoKNO8p6b0S6AIX50=;
        b=hmOVb3QxtJNAWQhCG/1Bh6NFpv+gbfRXqA6htAELYtwiutluFKnpFqZHyC+c3m/aRV
         D5XKLu3KZ0wZSf/QmGuulrjCHZgopx3q7u+xTQHdzycP51gsPyhq0/+IXVM/5isIhqyj
         h1vN9eCLDltvO4SBZT9edf59pJKAruXKBwlq2ZMqucb9KwgmATPIZF1LB1YZ0iP/keJo
         uR5G7/izlTbdJQSCvtmOdx0EBhXhbxS5bQkBsghAoAkpvn/PjneoLosRKuqOC30ECNn/
         lJxa2PEwU4xqAeakrQBMM02FnHqG/phqLUEKOeqxINkyiInBqWrBKONL2c6DmSEOyo3+
         aD7g==
X-Gm-Message-State: AOJu0YwnNVV9N8/w4RCcvtwCrL5kWt5+tM5P9WH5777gEGHHOcxEF89X
	AGI1FbyL9fdUA9b84AyIZRC4G9QixnoDgZfwYpCM1jbeaytPr+ed/98aSz1ZqS0iOGJ6vZv7H7d
	cpej8svrHYa5Dvxshfl6S93jDwNF0CB/m16T9mhSdpd3Ol71RuN6BYFfzeVMkDzwz4g==
X-Gm-Gg: AeBDievcmMQxPjEpMqzmbGk/0foCgry4QJRFPc0F6v49vdLntWDOxsHklZ+57B9/YYB
	xf/1p9tMVlUsMNYMgm7qf3+6wbokfJSbxzqb0koxseQd/0ft2C3u/hD7gzjFx3taaUDgvU4O/ox
	Ck/+Q4P9gtzkl7SGPe+24g/y2hqzT7tK0YTUyS1ov0yUl/sGpHMWuGrKvrhYMNmOhHdHsrUMpWS
	pb/q9cNKn/3mQZrqEwRBJ3KPyKkw5tFe2jLw4p0PdpuaXPn8Hw7XYF5XaEJnpvitdVd6hQmhFrI
	MV9PdNQCFilTrKWkaIZbCkxnBHVDPLy624PBpQLnVqmKaNdFScnSHP/zrjdY7eqEv9RATj47SV7
	dENKWUTNzKlfQnAjlVFFCGPU5aphthgTHkwKN06wogu3vBd2Zilpj2lubsQMrve4p+L8xiA==
X-Received: by 2002:a17:903:1b6f:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b5f9f3c58amr256862745ad.20.1776945643048;
        Thu, 23 Apr 2026 05:00:43 -0700 (PDT)
X-Received: by 2002:a17:903:1b6f:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b5f9f3c58amr256861585ad.20.1776945641792;
        Thu, 23 Apr 2026 05:00:41 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:41 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:06 +0530
Subject: [PATCH v2 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-iris-code-improvement-v2-2-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1339;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=i29lXDR220N9S/ZCltewSH2m1udYLebrd2wvWU1dcKI=;
 b=xeE+GZHhbHPYXGZ//YHmYFmemxBp85msmf6bNdSFq+mGc775eeXFdc8EWaFwwrGuU+8PW8+AD
 M/Mxj15Vd/iBIYFYMzdZWoX1K90Lp3POzb6/M6QHD2vAM7VGuVVHeuK
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfXy2S4yDNzrrT4
 8eq5Afza6asf7mj7RI+5ASQD7WlW5wjLAvJtVP9dafsKHgzP9mVVj5CTBZUv644BYhGCnQjTK8X
 AnQnS2WyOJ7izWU9BswX85jp0ZhHR6wCYXqzj3Tzfk/tglQru5HHFoEdcy28us/Qvmanf/RFm2w
 9YyBz6yVetD21sDaPRsCeBZMa7pknUHAIvtzc8GilMREMb8OBAs2GTDKyztd+cAi343qU0XiGct
 MIZuQFvJX/g3DjnL7uCMpZ9F86H6ihY+ey9UPiKzECX5/rNVDAdLtCooTkhe60CmBf6+9c43hjs
 g/XjiZfkgRZv/b7vPIR7gLfAQXhkS9p6TJW5o/dDteA9wNu3DWDl86HB9nywQjd09+G8+Hl7yiS
 WdexijaG11bsBtcKcsmJscJuOb7FuqTw9tCxFF2YSYjj51IlTbrvSlO6W83XLKC/y+1pdIrYKbN
 Ao1rmBt9C66RMoAMTRQ==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea09ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xFg6UwmA3-Dp8VzUGb0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: knAt0r4jzzjxlZhul1LwP53O4wyPOz82
X-Proofpoint-ORIG-GUID: knAt0r4jzzjxlZhul1LwP53O4wyPOz82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59397-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1546451AC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750dc7edc4834f32a51f2c5adc3762e..e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8 100644
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


