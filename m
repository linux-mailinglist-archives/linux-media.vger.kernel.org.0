Return-Path: <linux-media+bounces-67589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JEyWH6+IVmrY8QAAu9opvQ
	(envelope-from <linux-media+bounces-67589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:06:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C497C758181
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XJfocCXu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B9KMxYH6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67589-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67589-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29094323AA07
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FA2360ECE;
	Tue, 14 Jul 2026 19:01:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EA377ABF
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055668; cv=none; b=AKgazZk6UtpK4EEETct7cTi7F9EMC+DOrvfwNLQVXPHZ3jpXxIsT0HrN/IlbMTTBrNuicDIoKIkcRn2hjQIhx44VlkwyUqS4WR42zal8UHXLOwvRkA96iM/mmUpFqUUdPwnq8dTuCHVCP6jaBOXmjtavpA46Kx9xPR6qHd/hql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055668; c=relaxed/simple;
	bh=buk4xI+JCLuZ23C+HsYLQi0J8+zn1QOiLeR4ODO2eBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRT8PMU2/ItetjUPsO5aoM/eoZEjDdEK+o6U003hmOX5pcxEnsZFbYtpio2X/hUuI40cEvi81QJtAooERYr40Jy9QzC/DNmEnTZE7xqZ+dLFrE78znxUMACNk9GbU7dfbKtoljt2bv4wSOrO66ALarOLA3yOZ+vMoqRKDk7yTV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJfocCXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9KMxYH6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwcUB1455555
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/WIsoLhcv7tcYsYXMHFs/oSDYp2hT7z2bHGlAenfcs=; b=XJfocCXu8sehwSr6
	ympSeHuGEd+OOJNbIr8YTIpS4rp5gDsytN2OMpcMGMq1s8Gw0bbYAHZrv0hU25+9
	r0utz80z4/3bKBVZU4IauX9N7a4t2IqBBuS2FThCmbYvM1fz8qP8wKAXUIWptryO
	cMDnX0GVq26latOu1pzCcyOwR4HI1wqOyg0dai2Wi1ChEmd0350fvXtkjOmhasWO
	3jDxRSoJgyYbUBvsrOzc1OYOUS+tP1kfOUyNFqbKuIoVL0qGRYuH1PAbwfU9ni/o
	ovFtzR5yDTvaKla9ib+iI0FbfWiszf/l4OuSx2biC3VT9oZgmlDQBH/O0fD7vw/G
	nBf5JA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq1r0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38459087607so1528588a91.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784055633; x=1784660433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/WIsoLhcv7tcYsYXMHFs/oSDYp2hT7z2bHGlAenfcs=;
        b=B9KMxYH6DhbGEBW4VdZAEc8jVlxu1pH1QH/l+a8wHISDmSq7F7PdEf2qTmqEMJFQhv
         n+aYgzYrPZGlj0/civTZRKXiz0/813jwFPP2kQ+H/To+HBbzaXI40rigRtFVojnl2aUw
         E1V56zozTxx9/RDy39wIPZyGWIpoav0L+akK4/PP6f4lutI3dYHCisa5AMdqs+m+vsEU
         /UlXah7JE9LBfVnwWEI2PUFKeIFy0etnU1SzedQeGGiyTMFbk7zf9dUn8QenH+t44my8
         Y1NFrthviKUudFcD9WHA3pe7gWa15g85kUpghsSlUeasG0/w171ZQ2xcXXIgUtCahTQL
         161w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055633; x=1784660433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/WIsoLhcv7tcYsYXMHFs/oSDYp2hT7z2bHGlAenfcs=;
        b=ltw2nH9ePR0zACDgrM/oezRSqm57vqQfLuUWklyyHuHx/A1ZN3D/TNNYF1ZOvtxZm6
         NxikuxBbVURDVWqgi/8ggHvBLaUNIByUcUDq1tYhqOhsCWgcADsyM9r1apTGnsmlTGm2
         TTrnkreXVXVz1nHwKjsOACMN3DlyfkV45SNRqIjyr2xBCZ+vJS7ocukXHxizhvXIgkdm
         qCC5Jpw1AohHKTldoXi43bKgah/fJevWj7BYkZVC4Mns7HS6N7xs8TrIZ6k8c9tjOoPt
         JFRM8AzgVZqTipqvuWVLf25a/TpuWcjVUG7uxP/t7ch7/HjvCamN0e+MqMiKDN0e93RZ
         +Nlg==
X-Gm-Message-State: AOJu0YxHJseUKBanKE/z3FHS0z7/DkrptJdgbB1lGW+JwGYcUiurAYQ9
	6bvNbBIxEvlOxWs1P6BTrhnznOJQwCg2D4IKSRYXnrIg+c1oO4dXbylehJMsQJJghLodpcC3/hF
	JJSIStbTsplIGZNmW43SuoiM4EOp8DdeYADvtKtjcWKJaY3wIPKGXAyfKZuXAOenSLqzZzv+00w
	==
X-Gm-Gg: AfdE7ckGUNzXBPKh2G9sQ3esp19Yr9NbO2RGGar2H/pAW+ncLlZmjRPDarrQPdYqZkJ
	sAk5gk/ilTgNmScgtboYo2vETizwB/zz7nzM1QykvUe6Ul3m4bRH5EPkoLxiWJMYDlK9dSI8Wpb
	sKIKUFTsTaxxHuciWDH/qN+hz1VY1FZ3rShgjp+pBg4uZlAhpRH73kP9fldcpxeJD8E9Oh/lnmt
	shiD9ACpcQX0K0Q94yRJcUDvhVPHxJxhHLkkNM4jEit3xgi+XkaJcZu+FdOtMXCFFlz/z/OGAfZ
	XAnZtJeZpKFMucUaMignUensNY8MSnnrVreJeE8tyq6oVuLGlM/Ts0x+VjygrSKCLQ4BygWMwDr
	pDFpMvccIfqtICg3yvqe9WQJ21t0+PUHv+vjLe8rlax+SvyCMghkJvDGHGPj6MlelT1WDZoo=
X-Received: by 2002:a17:90b:3b8d:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-38dc7b2d49emr11824527a91.3.1784055632597;
        Tue, 14 Jul 2026 12:00:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-38dc7b2d49emr11824494a91.3.1784055631994;
        Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm56634528eec.12.2026.07.14.12.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:00:27 -0700
Subject: [PATCH v2 3/3] media: iris: Add ROI support framework for iris
 video encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-enc_roi_enable-v2-3-63683f9dbcef@oss.qualcomm.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
In-Reply-To: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055629; l=27597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=buk4xI+JCLuZ23C+HsYLQi0J8+zn1QOiLeR4ODO2eBc=;
 b=3EjZC4ymoxloW4uzyGboo24zAkt1MoDzTOZeh5WBCEf68VJrCla6/jVHnlAPPJUsYY3Um/N3i
 806MYL+4G97C06ctJR+pGCCF0z4nDBSkRreNcu/WA4r5ghYhRdZHBAd
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a568751 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GsgF-zhxtwJLDi3U7-kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: FsdLfXyZ0v9bb8STGbGiqA9o_6FJfner
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX3nzofXHKu+kM
 zHy5SoKTsCyF5WMsL6ncpuyd8pARIqsocIeJpT50rEhZaQeGQS2kiJpAS4O+wViJ9PcRUULx8Pd
 1ETKKNOBtz647Akf51maiIIFEJ/G5qLINZNMfbq344mUx0//O0OPn+bdcwczGYseyBpg/b/OGGF
 ewWvWErX9TEI3Q7kKDyfMKNvvT0dbbbpEbkoDZLJusf7C29EIOnEifDIVzKu/KxByAe5anYfbpO
 nTQfNTjxVhJIynUVQARAFT5Mdsxw1GSzmFklX4LCW5O3tNNJmfn5MS6nx68lhQ88f8jWjuBX7Zx
 jlLpfnfz1Mrz+A9HY1OBiGQRIvdjaA2FMLkYI4WQkZBzFTvMoGYiNUHF0j3FB6lOrk/UGQmecSZ
 CpwxI/hiiPyFp3D1mQvWLCLtO7YzuClmbM6IH6MOKqUkcvP4P6reXbx14Dh0KILwp+Zk8iPsqoq
 SN0rdU+yr5/BXbWutrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX3m4MRfVndAU+
 azjYl8+85JiTI15CGh2SsLd9qLUT47Iejzqs+SZTqnNPKW7sPf76BCEai6J/CTReFVTc4hE11ld
 AOLyHdDTC/xqHsPaRQjEXZlMSxCLLL0=
X-Proofpoint-ORIG-GUID: FsdLfXyZ0v9bb8STGbGiqA9o_6FJfner
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67589-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C497C758181

Add ROI support in the iris driver, including control structures
and default parameters. Extend support to set ROI parameters
using custom control V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP.
Implement internal buffer list support for BUF_ROIMB_DELTAQP that holds
ROI MB based delta_qp as expected by the firmware. When an input
arrives queue the corresponding ROI MB delta_qp buffer to firmware.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 101 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  16 +++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  62 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 15 files changed, 358 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3510113e1f760406c81b1461377a3..03dcce5c41c2901a1aab4f5e926c5b3366924f57 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -5,11 +5,13 @@
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <linux/slab.h>
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_power.h"
 #include "iris_vpu_buffer.h"
+#include "iris_hfi_gen2_defines.h"
 
 #define PIXELS_4K 4096
 #define MAX_WIDTH 4096
@@ -762,6 +764,23 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
 	return iris_destroy_internal_buffers(inst, plane, false);
 }
 
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
+{
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+	int ret = 0;
+
+	if (inst->domain == ENCODER) {
+		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			ret = iris_destroy_internal_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
@@ -991,3 +1010,85 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	return 0;
 }
+
+static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
+	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
+	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
+	struct metapayload_header *mbuf_payload_hdr;
+	s16 *p_16;
+	u32 payload_offset;
+
+	memset(mbuf_hdr, 0, sizeof(struct metabuf_header));
+	mbuf_hdr->count = 1;
+	mbuf_hdr->size = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+	mbuf_hdr->version = 1 << 16;
+	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr + 1);
+	payload_offset = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+
+	memset(mbuf_payload_hdr, 0, sizeof(struct metapayload_header));
+	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
+	mbuf_payload_hdr->size = array_size * 2;
+	mbuf_payload_hdr->version = 1 << 16;
+	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);
+	mbuf_payload_hdr->flags = 0;
+
+	/* Firmware expects 2bytes of delta_Qp, int16_t */
+	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
+	for (int i = 0; i < array_size; i++)
+		p_16[i] = p_array[i];
+
+	return 0;
+}
+
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	struct iris_core *core = inst->core;
+	struct iris_buffer *buffer, *first_buffer, *next;
+	bool found = false;
+	int ret = 0;
+
+	if (!buffers->size)
+		return 0;
+
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_DEQUEUED) {
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+			list_move(&buffer->list, &buffers->list);
+			found = true;
+			break;
+		}
+	}
+	if (!found) {
+		buffer = kzalloc_obj(*buffer);
+		if (!buffer)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&buffer->list);
+		buffer->type = BUF_ROIMB_DELTAQP;
+		buffer->index++;
+		buffer->buffer_size = buffers->size;
+		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+
+		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+						 &buffer->device_addr, GFP_KERNEL,
+						 buffer->dma_attrs);
+
+		if (!buffer->kvaddr) {
+			kfree(buffer);
+			return -ENOMEM;
+		}
+		list_add(&buffer->list, &buffers->list);
+	}
+
+	first_buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
+	ret = iris_fill_roi_data(inst, first_buffer);
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb767761824c4c02e0df9b765896cc093be333..5dc0a7f0354745fc2754eed682a046c2e7fe2b90 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -28,6 +28,7 @@ struct iris_inst;
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
  * @BUF_PARTIAL: buffer for AV1 IBC data
+ * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
@@ -44,6 +45,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_2,
 	BUF_VPSS,
 	BUF_PARTIAL,
+	BUF_ROIMB_DELTAQP,
 	BUF_TYPE_MAX,
 };
 
@@ -107,6 +109,24 @@ struct iris_buffers {
 	u32			size;
 };
 
+/* Metadata buffer header */
+struct metabuf_header {
+	u32 count;
+	u32 size;
+	u32 version;
+	u32 reserved[5];
+};
+
+/* Metadata buffer payload header */
+struct metapayload_header {
+	u32 type;
+	u32 size;
+	u32 version;
+	u32 offset;
+	u32 flags;
+	u32 reserved[3];
+};
+
 int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
@@ -121,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
 void iris_vb2_queue_error(struct iris_inst *inst);
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..5bf1ff99e3376d89942fdd1a18e8552b87938496 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +301,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -323,6 +331,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -331,8 +347,52 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -357,7 +417,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -375,6 +435,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
@@ -1499,3 +1566,38 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret = 0;
+
+	/*subscribe to metadata delivery only if ROI is enabled */
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return ret;
+
+	ret = hfi_ops->session_subscribe_metadata_delivery(inst, plane);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+int iris_set_roi_params(struct iris_inst *inst, u32 plane)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	u32 metadata_header_bytes = 256;
+	u32 size = 0;
+	int ret = 0;
+
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return -EINVAL;
+
+	size = inst->fw_caps[ROI_PARAMS].elems * 2 + metadata_header_bytes;
+	buffers->size = ALIGN(size, 4096);
+	iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190be8935176b290588f224fe4f144a4..7a32fb42980617eb56ccbee730db053b1abf41d4 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -48,5 +48,8 @@ int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
+int iris_set_roi_mb_size(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519962cb958b0e330a6d018310c3450..5692375cdd357f9b00760053ffff5af4bd9cce9c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -131,6 +131,7 @@ struct iris_hfi_session_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
 };
 
 struct hfi_subscription_params {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1ae726c94ab6346b0b4b2b3db1d7b..4a003c798e3c27b59c20b196b84147a32cd74c46 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -937,7 +937,21 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_roi_params,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index ca2954f8bd3ad539b057eb152d5ead9a6e421670..ecbc3c695a85f4a1b8b570614818a223bfdd097e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
 		switch (buffer_type) {
 		case BUF_INPUT:
 		case BUF_VPSS:
+		case BUF_ROIMB_DELTAQP:
 			return HFI_PORT_RAW;
 		case BUF_OUTPUT:
 		case BUF_BIN:
@@ -1268,6 +1269,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 		return HFI_BUFFER_VPSS;
 	case BUF_PARTIAL:
 		return HFI_BUFFER_PARTIAL_DATA;
+	case BUF_ROIMB_DELTAQP:
+		return HFI_BUFFER_METADATA;
 	default:
 		return 0;
 	}
@@ -1308,10 +1311,29 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
 	buf->timestamp = buffer->timestamp;
 }
 
+static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
+						       enum iris_buffer_type buffer_type, u32 index)
+{
+	struct iris_buffers *buffers = &inst->buffers[buffer_type];
+	struct iris_buffer *buffer = NULL;
+
+	if (list_empty(&buffers->list))
+		return NULL;
+
+	buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
+	if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr & BUF_ATTR_DEQUEUED))
+		return NULL;
+
+	buffer->index = index;
+
+	return buffer;
+}
+
 static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	struct iris_hfi_buffer hfi_buffer;
+	struct iris_hfi_buffer hfi_meta_buffer;
 	u32 port;
 	int ret;
 
@@ -1332,6 +1354,25 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 					     &hfi_buffer,
 					     sizeof(hfi_buffer));
 
+	/* check if any metadata buffer is available not queued, queueit */
+	if (port == HFI_PORT_RAW) {
+		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
+		if (buffer) {
+			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
+			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
+			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
+						    HFI_CMD_BUFFER,
+						    HFI_HOST_FLAGS_INTR_REQUIRED,
+						    HFI_PAYLOAD_STRUCTURE,
+						    port,
+						    inst->core->packet_id++,
+						    &hfi_meta_buffer,
+						    sizeof(hfi_meta_buffer));
+
+			buffer->attr |= BUF_ATTR_QUEUED;
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+		}
+	}
 	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
 					inst_hfi_gen2->packet->size);
 }
@@ -1360,6 +1401,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_subscribe_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_DELIVERY_MODE,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					      HFI_HOST_FLAGS_INTR_REQUIRED),
+					     port,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32_ARRAY,
+					     &payload,
+					     sizeof(u32) * 2);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
@@ -1373,6 +1434,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
 };
 
 static struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2cd5555cbced8e438cb32e87a539c..0bfba8e8158f3800647bd0b2979207c601e495a5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -20,6 +20,7 @@
 #define HFI_CMD_DRAIN				0x01000007
 #define HFI_CMD_RESUME				0x01000008
 #define HFI_CMD_BUFFER				0x01000009
+#define HFI_CMD_DELIVERY_MODE		        0x0100000A
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
 #define HFI_CMD_PAUSE				0x01000011
@@ -125,6 +126,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
@@ -166,6 +168,7 @@ enum hfi_flip {
 enum hfi_property_mode_type {
 	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
 	HFI_MODE_PROPERTY			= 0x00000002,
+	HFI_MODE_METADATA			= 0x00000004,
 };
 
 enum hfi_color_format {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07d830cc8502ab5f28001312991ba8..aeb0426a05694f219f82145cd84a28287ed3075e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
 	hdr->num_packets = 0;
 }
 
-static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
-					u32 pkt_flags, u32 payload_type, u32 port,
-					u32 packet_id, void *payload, u32 payload_size)
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size)
 {
 	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
 	u32 pkt_size = sizeof(*pkt) + payload_size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 25162ae71357482b065fe8e3b0a0664138447c4c..0bbbeea809a79ea0377f12f948a0d98b97a06295 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 		return BUF_PARTIAL;
 	case HFI_BUFFER_VPSS:
 		return BUF_VPSS;
+	case HFI_BUFFER_METADATA:
+		return BUF_ROIMB_DELTAQP;
 	default:
 		return 0;
 	}
@@ -77,6 +79,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
 	case HFI_BUFFER_PERSIST:
 	case HFI_BUFFER_VPSS:
 	case HFI_BUFFER_PARTIAL_DATA:
+	case HFI_BUFFER_METADATA:
 		return true;
 	default:
 		return false;
@@ -450,6 +453,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	return iris_destroy_internal_buffer(inst, buf);
 }
 
+static int iris_hfi_gen2_handle_output_metadata_buffer(struct iris_inst *inst,
+						       struct iris_hfi_buffer *buffer)
+{
+	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, HFI_BUFFER_METADATA);
+	struct iris_buffers *buffers = &inst->buffers[buf_type];
+	struct iris_buffer *buf, *iter;
+	bool found = false;
+
+	list_for_each_entry(iter, &buffers->list, list) {
+		if (iter->device_addr == buffer->base_address) {
+			found = true;
+			buf = iter;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+
+	return 0;
+}
+
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
 					     struct iris_hfi_packet *pkt)
 {
@@ -497,6 +524,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
 		else if (buffer->type == HFI_BUFFER_BITSTREAM)
 			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+		else if (buffer->type == HFI_BUFFER_METADATA)
+			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
 		else
 			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..9221cf3482299a0177b13443dff9df40a65d6724 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,8 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -194,6 +196,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -203,6 +206,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa8a0c40b8d6bc473d0bc90270e6cd..21ba9639d17b2c64e8fa33b4aacbd1946fc4dae2 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -498,6 +498,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
 	if (ret)
 		goto error;
 
+	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
 	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 00c1716b2747c7e840c2a3317800d83663744bf0..df97011636740be6cdfe5867f273c5f93408f570 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -22,5 +22,7 @@ int iris_venc_streamon_output(struct iris_inst *inst);
 int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
 int iris_venc_start_cmd(struct iris_inst *inst);
 int iris_venc_stop_cmd(struct iris_inst *inst);
+struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
+						enum iris_buffer_type buffer_type, u32 index);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9bacbed3533147cd5325410f9c94bd..0b0400ca8f88b05a3267be500e9cd38cdc154991 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -179,6 +179,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -296,6 +297,7 @@ int iris_close(struct file *filp)
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_roi_metadata_buffers(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1


