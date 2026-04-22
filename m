Return-Path: <linux-media+bounces-59313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAjsC+eu6GkhOwIAu9opvQ
	(envelope-from <linux-media+bounces-59313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:20:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B774452FE
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBAA8303FAE6
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A903CF04F;
	Wed, 22 Apr 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqdAaAV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kaF0/Y4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8832F76D
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856624; cv=none; b=mJg2TVGpIOniqVHsudydUMOznu46Hmza6L1Q5L//3DnjsWSUd1ZHKp1+WuUXyCdQbhwr1jvcO71raqW54svav+i4K6KWWOq+TxvqR9JMru6q+j2rMHVkJDv69QplMJj9k7I1heZh3DivtGuGYbk8SbB/W7vujXL0P2XPpaIx0bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856624; c=relaxed/simple;
	bh=VC9WposBlvve2ycacip2kliKPfx0sQcMrhIp6YST/BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+JFpgSONG+ToHUd1QZeYs9LHsEyzoVO3HQ2S2rVzyrdF0z7+J7BYjqZbInoJB0bOOFZXSWVV9u6FXRe8aw0hVnaca5pXEGMi4ekNqw5GcoDUt/bOEFqNcJP0FTNnsBYnY+1qzglPpOfYyQPI0UbQN2pzQGpLx87zlQhfVOvELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqdAaAV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kaF0/Y4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAmRvo4051189
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lzMCwbAjL7qV1kx/Xu6U0s693kcoGBTXqWxUmoSiBY=; b=mqdAaAV+7IKvawnK
	iUp1aLBGwDiPYnLfgtZsGh8hpS9EkGQS4vcM93CPdxHKOpFtBYGz2kGCAnLKw2qf
	cDQBZaCfFQ1EZLwFAVhiFVIVpgfYadTnwICvjCF+VSnlnT9xE2Mmdhpykt/+7Dg3
	OQj38Z0Kor19zIijR18RzyHy9aoiLqfQgPuVfl+m5JjEuD6dHb06Q7GbEnHXWJKS
	t1IvM0wG1ulN5RxPFcCIDNoCOZwbN9/Y7Id3p3wo5xjIZUQrYZpWtTDUfigZK2yf
	70FKzK76O+/lUcnM6EnfkwUBt5IawivlAIutY02ODwXjPGKXaZd/wN4odk9nLOU3
	8JYM7w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfk650-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c798e905c29so1635125a12.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856619; x=1777461419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lzMCwbAjL7qV1kx/Xu6U0s693kcoGBTXqWxUmoSiBY=;
        b=kaF0/Y4QH7Cl4qhMUKNo7KRS46x5mvU9UAm6gHHgZC43w+rpVHdcDGUNfV5z48U0qy
         kVOxh2MQNNS5SIAVklLHZSig7D6vfatqHYEQpJBJhHw0VTjQ2wlD3xv4Gs1Vj0KFJGql
         Ivycc3FzC+qqo+nXI57pEIRyE1JsjcGe9lzdCDQ2FfNiDu79dTkUFxKA6GaXFEjjht7Y
         0dwX7o2g95ZQnpx9gRft2LaG59Yv3q18fK+Gx0lJdkd6ovnzfNyJauQdaK6qCq4AvZzZ
         xUouBK18MwrKjFlqVUIuhQTVy638AVPUdflD5HammIqgPQ09r28dAxebkNDBU5tAnX76
         0ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856619; x=1777461419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1lzMCwbAjL7qV1kx/Xu6U0s693kcoGBTXqWxUmoSiBY=;
        b=UKisnAOMdQEShJ2oINfb4fO4btTsHbLxOYXtUFyZGxymS337JwTribTGg76tPRDdEX
         KBfyf/8ejFn3ioQhQxSF9gj/KrMVqSXLHuLMeydpBZLcC1ZvxKR4+wMpmnZaDRZ2cSBn
         Q1pnlIxSvFDiN3NwsC6QGHuJrk9kYbqNbwNbZZRwkbIIWGxN258Tu+RK8J5g6hSGOJoa
         Zu1oPAcNykIH4DEfZAoEMY5UdcbXvHro9/iny8WOxs99nHUVn18L3wbtkwwKbg2ZHLRz
         CAsH05AIpUKnv5LdH+HDyXcXTrZagO6YclUHluFT2UuYkEW4mVdM4f62Kk8wINseSGM+
         x4gA==
X-Gm-Message-State: AOJu0YzGtVvRiE295/K/060IUNMclaFaN8UgFpxAOO+1txNyq0mXR2dB
	Vot6IVXQkO1S4ahFbAaPzl8DYRv3DWYgkOc4koXce0YGPNyZen0mxwlzurLrbHDr6CkwheMXQS0
	GKE0JnbLeQ/CGMfdB51E6RYBNRv9JpBDRs8Z2PBLr2azHPviWB9eAuIRoa14k2fh7Vg==
X-Gm-Gg: AeBDieuYHWxwHzIsqiQiqeM8e3zAMUxo4bVJO8rmpFUZppVEXZ3gjCo9gq+iiHEuEgq
	tjQMh3aFctjyTnsPRwXyXS6SNHNbz3us8DQZEYqMl1CzWUBmJoq1qmRB9IyD5aa8P6Uibh8DvUh
	cJ/c5KRYG9UwPPwS6FUK27ENcObbqhfRBZO6nBv9Mp0xJX1zIZhqCZunYJZhspefgkgcJj7A/iA
	Hp6aJkePYWqQdN0KkFMtyLCSjn3UOxKQGVCCJfFnSo5UI4B1khewoRp8QoFDh59K/huWJQR65fz
	eeK+qUKvWOpuBwhVQeyQBX3B0KS4v8pJlx2GdEi1pyVk5NwrZpFYWHcRUDcJpadgyNz/bUVvK4R
	U5bS9QrTW4EIvxNwCMSGJEUPkTO4bdD/P+jdvh7HmOsr4IYJ2O4I/51NYKFPVwUN9rX64yg==
X-Received: by 2002:a05:6300:210d:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3a08d90b33cmr25778807637.49.1776856619441;
        Wed, 22 Apr 2026 04:16:59 -0700 (PDT)
X-Received: by 2002:a05:6300:210d:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3a08d90b33cmr25778757637.49.1776856618917;
        Wed, 22 Apr 2026 04:16:58 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:16:58 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:35 +0530
Subject: [PATCH 2/7] media: qcom: iris: fix state-change debug log printing
 stale value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1218;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=VC9WposBlvve2ycacip2kliKPfx0sQcMrhIp6YST/BM=;
 b=XRyt4NbjzTkcPs9rnszE/7tjuhN52sg/EEloca15RHAHSaBRXfkw4g0GwU2zJzmX02gAiVEqk
 M4AOXfRReV9CCEqJ1oCXjgvecVg5cMWcOh8Un2GA0S8lT+oMllVdD2u
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX3k+AGNWNUzEG
 k8QBJolZwnBUp9kyOla/gk+snr7VIvRWzEbwmS9lXfCH9J4b6p9vIz2Y1rgsRQ4JwLgyufg8VgB
 zUIicqXpgB8AD45IAKn7csnZoe4PY0pX8SbqIz0FMYLDemmN+UWV7HR3++4SHeYaGr2m1QtzQim
 atOMxuOEoVFeGS6w9ye+COfqRe6dZfC84oaYL+fbpqwxH852gI4e99AR+RFqcfhVZi8pgtZTZPn
 kI2T4lcnciyKjCtIwhduiZHQ7+0O4BzGqB5aXZe6MY782+7y+cDd/ujfgmK4fW4aBYFTPGSWOoe
 A2NZTJtM2XnYVY512YshnMA2x52exNaiXPU+7uUpE+wa6s0EWzzkiK6Vso4RuAY3nXmN+X2fv2W
 mMh8r4jJl+VQ7hzx5zYvnt4+g3Wgnn4zfs1QE4lzWQ4NLoW3lPdl5MwOCtqA94AtTaoocppv6GK
 P4eH5a3m5RF8Dt7xJFA==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8ae2d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xFg6UwmA3-Dp8VzUGb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: NlptslaTQbjBnBub3DQUcmEM6Y_mRWQ5
X-Proofpoint-ORIG-GUID: NlptslaTQbjBnBub3DQUcmEM6Y_mRWQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59313-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90B774452FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The state‑change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for
debugging. This happens because the state is updated before the log is
emitted.

Log the transition before updating the state so the previous value is
preserved, consistent with the existing sub‑state handling.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
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


