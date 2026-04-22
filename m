Return-Path: <linux-media+bounces-59316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OtnJ5mv6GlDOwIAu9opvQ
	(envelope-from <linux-media+bounces-59316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:23:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A1445378
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EB6D30C809C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C0733E34E;
	Wed, 22 Apr 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yi3OISCY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCymLkcr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B6B3CF661
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856635; cv=none; b=iOLbYmS5bJW0QZZ3hNGsHrTA9DgXA1cn4GN2WK0H7mC0fXuLTVGjEZ+Qzq7k/o1zc6OOp5TvCSY4jrXWhBhabFXBbuauuUUElSOnnGER6ti6l9rWv35qDuqafZEqVwplxM4+S2PcjL38R/jru5TFiTlHvN8PhOttoJCmF0oKtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856635; c=relaxed/simple;
	bh=cZWoW0QtVKH8JIVtUlT67HMSZVr757vitB1z3b7VwJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uArbCtCEQrPCiinvb9FxkTdBiR3Ps27jdHfkc1J1D4IsxASGPfZU7An+VjHxd/l/7/FDgxV4O3ANddsbUQiKYcIwhSkfzxQi3RX0Gc69E8P3sZn8yTAT21jQHLPW2uHDooPnYi415U5vizlywj+XAsx1HF4Yfvg+zYv4vE+391c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yi3OISCY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCymLkcr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M995Nm1081541
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhrOe5+iY2QBpjWGl8a6mJqg/wd0SGxajIelouCwIfo=; b=Yi3OISCYxuQQCkiK
	L6sYlAGHivF5uV5jH6ciqnTC2Ui9y7gOQ7HFyQnb0FlwJRfXN3yxItO5RkMyrZrY
	iovkB4aIZcHSDa2Ur7eNHJK5fcpC1mlyW9VXAlwFG7tj5Sj/6104KJ05wi4CQTvy
	nf//0BCsVpbzqVGJ+pqNgLO3DdE3+ug40a2rGbwUlVYTFG7m3nscX4aAy0gaTZxo
	11zF3L3WTG93PTeeeNhDfPTVcyR0TNhDalopDSjrUiTHTvKEg0xgRS1XIXmYWUQ+
	nzmkePCYOxoBDuZuTk4bl+LxCl2kJW8VTXsXG9gu41awvJqwb/2EaefaeRck5l24
	6vyGQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng35h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242b9359aso51918885ad.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856632; x=1777461432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhrOe5+iY2QBpjWGl8a6mJqg/wd0SGxajIelouCwIfo=;
        b=iCymLkcr10/GXsL0LG9z5l2lOwqpw1W6583L0ghpB53q1vyejETvtJG4IL3cZjnbIX
         OYWX/LlXUmjC8JE6wSIxPpB29jqX4YRz6h2z0G1pKolIGK0Y7Y/RCEOQu/efQxuGF0RD
         GNWqH10MazPifid0m1futx/f0+zjOgC0o7q812yq/6b+02BtBrSmwaO5T7J7yf+lz+Dh
         GPrmsbjaICZIgBsac5uYYmO92Q9Zw8RTEZ4dpKYEeoyJzeexYgbnQ6CYPvHI7iwUNy7m
         UEQR5gefH/mJvyup2hsYOlIiRuCXNzyiFTe2MvTrz8uQsHNn8eg2bMotCZR/V2zLn8iH
         Vj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856632; x=1777461432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhrOe5+iY2QBpjWGl8a6mJqg/wd0SGxajIelouCwIfo=;
        b=k3y+sHJLp0AFouHyZnDDD95s1QqYX8oX4vCJsoQGsbqHUl2Q0l7kU5jgPT/Az6h5Rx
         gsiYL9VUOWZy7C6W8tQIhYt68+mjgI/+oqha8gV47v8JNeN/p5bPo3U5yb6RivdZ2XaW
         o4RvLm8eBT/nObtEJudvJxJg4op7Q9JMr+38eAhJW/xLyqjNag2F6Nnpsfl3GTajxIdZ
         92FSzOTZU3wSChTheAu/wZrmxbSb9JIONhK4rWqaKht0S0B0XWAYP1Z+k+zsbyiR/W+Z
         2FnFO7RWJuSGMLV+NccABEevVDemBISJ5Q/Usszek6+I/kSkRT3ECJdWOeZIdiaHLdhK
         Hq9A==
X-Gm-Message-State: AOJu0YztTiwouoJyUWo5N1AT1nFLnEMz/8iWpnJLdfpqU2Fd/a5OCp9y
	RMxiHfq03M93AXvDtUFaEHQy7LU66ALNEJDPRb7vadOCacxuuim7kdaol05DI5H5qEA2AZa3YeZ
	S0mhZx6quIWVz7xAocuPGWNjyAC9MMqKCD9gwqaECE9+r8EkpWzjVgdiR1qjlvc8Sqg==
X-Gm-Gg: AeBDieu9ijtGb+2cHKuGopSj2GUJr+DGlvlL9jB3WNSqXprv6hXjhUSQq2Tq9evPgGn
	9cCgiznDZ4o92poWjFLQhHPMCxpFdwMF7dDGlPbY9UnfNz3Rulg73aSb4zur8z1BQGz0gpvcxXk
	DRRZBCoJtb0PTFVcrPJijDa03/N4mbrWDVDpUZCnGBeDneNFN8v2TZ6zQLIuGfYWmSwe8EbhEnu
	Z0gNSwyK39NLWm69gFJ6Ith8KPSs2xrfdB3K8hy+JCEGZcnthNMiJ0Iysa+8sSfWeHm3/SOM73a
	Lxbs1PJylImxvFrQtGT4kH7wBjiZSKJugLes0x6nfddAXljSDkUyV2XKCc/uFMYFtmvfFTpzIhH
	yi4J4e1pPDoTFTvWqa80nATRcdLhAOqXf5QRtxldZ4B8NXu4x4ObacQ+5ShSEgmtHVgHQGA==
X-Received: by 2002:a05:6a20:a113:b0:39b:c9ff:e3eb with SMTP id adf61e73a8af0-3a08d6879c8mr25419771637.4.1776856631802;
        Wed, 22 Apr 2026 04:17:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:a113:b0:39b:c9ff:e3eb with SMTP id adf61e73a8af0-3a08d6879c8mr25419727637.4.1776856631301;
        Wed, 22 Apr 2026 04:17:11 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:11 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:38 +0530
Subject: [PATCH 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-5-8e150482212d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1298;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=cZWoW0QtVKH8JIVtUlT67HMSZVr757vitB1z3b7VwJY=;
 b=x7UK8J0rJmpaw3XK3wfvpIDBpo0KeW5jh5IMMR7ZopJl69ODuA+YWEzoVCDscfVphPiV3/T/0
 E2Zfhi+UEK/CRYUcKGyKF+nhyk82zo7/ayLi4OqgEQZqwBu/CRSYn6J
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8ae38 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jSGZT_DOcC9zL5wkuQYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JGnV3a-JPuEi--va5gJ4iZxWkaW-5dMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX40Wqt5pmXdnc
 hKpDOKxYbTv2W+LLG57QdWEwuEF4WNjKFwk/VYEvi/AiWDoQDquimWTgQgFkLj4jYuwyB8YTmSI
 geUNffYzyKFmZfUb4oVz+olL9hhTqFZyKdRn1mYriLlu5EFVfygKnvYgOsIF1sFEV3A69cVy9EY
 aCDrM0HeBlHWJsusxYHccV6V36FkDWnQoFdAXC0KZSH7w/o/+qefMkhN7c1b0hAC11GWikZ5r/2
 dkIhI+ji14iAF1pAi17/JUw4O6HzXZ0spp8QVXcBGKGSWYJtrbkaWWSWoaHmOR8wIfybebcDD2h
 oESbUoVj6r5/YRu1Y2w6+Rj7bIiLROeFEhbmOTQzu5oPzm8w89iznIRGGRthGaM+6j3YfIEh9Ej
 0Z8ZLqSXNZc1iS3CeJmQtIjdZnAu+WAAuPvRxDXS2moyxoUquU1+8OVUiNhtQCN8zZ4vpuHtob0
 kfpO7n2fddA7RDqWwpg==
X-Proofpoint-ORIG-GUID: JGnV3a-JPuEi--va5gJ4iZxWkaW-5dMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-59316-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: EF3A1445378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
dispatch table, causing the property to be sent to firmware twice on every
config-params call.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 06698fde639ec654ff9ec78a178271ab2284f5f0..dc7acde1913e65eb39734702cb164bb26b8ea6c2 100644
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


