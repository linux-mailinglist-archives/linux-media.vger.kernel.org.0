Return-Path: <linux-media+bounces-59317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGvhLryv6GldOwIAu9opvQ
	(envelope-from <linux-media+bounces-59317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:23:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94F4453B5
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14B8830D649C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B615299944;
	Wed, 22 Apr 2026 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCMKw/MN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXZSZEfH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EFB32F76D
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856639; cv=none; b=BrOwjjcrmGGudgwpthq5mnhtKrkbheEo6Rf5yK57cDziZ68FqVcjEOl+bWPdqmJp7G9kDuM4F4NRNtnSKYzsd2lr8BVBeEcVTCvCLrboJwbYn+sDUaa3BnW+gqM3Kd6do1s6p8M5T2RUYWhMawmxFwBA0Any+sCTMeWU+Id/D0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856639; c=relaxed/simple;
	bh=g9IR8KnHH6+1Tmoj7gb2YK2cNjAd/VRLFVaxwWPe/vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JozEgPI75N+QxVZIPaw3RccrLtSmmt7xg1CNjhQk21TlVU3oM0jixMn0AHLfc2dwCX9lCI+9Zf5Vz7BnkwwkZIfXn+CiXPg7oiUcaOo6fndBwUNr/+kljxiBWeDUGGtYTtvXHAumS1K9W8KAW7HeJYdriEscmZBBMJh9lqoaXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCMKw/MN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXZSZEfH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5hDQL2209301
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km58GpJkLRFDB0UlfVyXA5qy9bxrBogWZ7Kd/EqcNDE=; b=iCMKw/MNYv7m1xB6
	UaoGnjfHWgbFh+KnxBBd8ancih9iFc0NRw22cKtzIt2AZyhJpW9uIHg6SskpysvX
	SpImGjlzOgLEYNq+jVnh7cEwtk88y02/lqJX+ig+qvBEkjwc35DX1GoX0QooXRRk
	XFr7Z8LH7FZnJAxoEJ0E7n0PDYBCq0HERo97s4V28ZE7fXYMb6ofIdmweP8uBnao
	IEBye4cQ29AwzDJK0TE6iocaP+vklsXTV742yMWFpQBDxNyejsAIpquoGwzniwrk
	S34oQ8Gb6dAy3oIP+vgo3m4NVMcyc66jo4WPVgW4oOTgvMfCGq6mVkNZ7frBtbcS
	La/DQg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengb2nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9429f49cso6279584b3a.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856636; x=1777461436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km58GpJkLRFDB0UlfVyXA5qy9bxrBogWZ7Kd/EqcNDE=;
        b=ZXZSZEfH9QhHCCm9xnC7UzNuCANdVc+jZBJ0xq+VOM0W/pL9WOZAbPzOm4P+9RxdiA
         nZxUDU/7cs0LbWsiM5I2Bftbk2sjgm6ANkliXrKb8p5ZcpYFdydQFsw05B5EcRIhJdM+
         qCuPebVIhsaukuwM3mvD203avIqmO7wKt4Gk2052y/JL7fsM+eD31ltXGzFpr0BzOZUr
         /+RNZMpOEnwiSPQjKPYS/zf11h6nojAYNqg/ltxl1lAQhXOtGwdBCQ8+SfSgu/xCh+fl
         9hmfFV2tVHvpIjhzEorSKvOUznoZsZBQ9imGiJHRcnafQpwXIpshdaCe5owWN4NCpVuM
         uj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856636; x=1777461436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Km58GpJkLRFDB0UlfVyXA5qy9bxrBogWZ7Kd/EqcNDE=;
        b=PPCotMBAemVo4iCROwAJEajMmtUvgLzFNx93LADSFaHxGQVCnJub25FmY3NTfT7NBR
         u/m0VaIa3Jajd9sbrPtlJcF3JgX28vtMeFuM6Fbha/feUZc1QgcPgQ/qV6rN7HLzDYK/
         xpDwL9ihWNSCIyt+GPhlSYqRDXiBCOfSvMt6PdfOGCy6l3QyyRusNmw+oloBN2gVIRKw
         WE8XKVcP/x5/kzbvSuQfhC/0PlcW/1nZq7XNFkmd0PgrzoJP+M5bqCs6hi8KEWoM77ee
         5DPPMpgQ22jdbqJqJZM3rGGrdsswqA2/SVLHRQ0jkCGq1BmA4rQjPC/JOjNTYMTIFuFq
         yV/g==
X-Gm-Message-State: AOJu0Yz0Q8dMThN9xd/Ui94H6SHr4psWk8lMmrdW2NHj7XHgqBKzATDq
	S/UhwtqjyRdK6hBHgNJfAhAServstkw5YZkP3OQp8QcsBZMZZFQ0iAgE0y/29GfMJ/pgg4XtAWB
	4yaC5ia0c7lEMOGSWQ/G5ZTTEAwY3qMRWek5Evu2iqI8vZz68YxhjcoTt1mf9pPYZFg==
X-Gm-Gg: AeBDies9awdJGR0JIDfj8YEgW2Jvrd2G4AQv6S0A3GbygxitPcGEeYJ68b7XFUXcAM7
	YsukHyd9Ckf3EyOfAPqmZPe0I5gntc0uzCoo3A1mDJXLddY9RiLkXGXOILhzAUQsMy8WAFLaFpT
	goalOO66v77C/8qNRlJWskIFAuyKmEeR0Hs08lWZFgF72hVNhVtQgSIEgoNdnGyqHsVcmCnnkp3
	LJEVw2lFmvcg4P0lWRjM5r1i+QFFWhlHMQdlnIjCNjrQIVaqrORRsVwmxHgAD1UgDGuE8xoenkn
	FuY72jmTkGgku71SrWjRqRoaZMLOHyMVRjerm0udjn2PV81FM1U+Vme3sSJdiBNk68iXZ+vCmj4
	d27fzkz+V9NdwDlSa6SBVZ/boV4BjrnOlAs7Gak0k2s4gn4xZXBYp9+0g5jD/74lT0HNwDw==
X-Received: by 2002:a05:6a00:c8b:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-82f8c852deamr23556154b3a.11.1776856635983;
        Wed, 22 Apr 2026 04:17:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-82f8c852deamr23556115b3a.11.1776856635447;
        Wed, 22 Apr 2026 04:17:15 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:15 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:39 +0530
Subject: [PATCH 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=976;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=g9IR8KnHH6+1Tmoj7gb2YK2cNjAd/VRLFVaxwWPe/vs=;
 b=juH8HyrkSGURUlxLT/h8aMnPuevI6YYYK2DueuFH0IgBoBEtOvTxCX53QeJb2ogHWvDVr7huo
 3MdJeJbF5n4BTigQ/BqeWUxZzytQICjCxbrC2MccDduq7f5i+pFCv1A
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfXy5awJGlQXFlW
 Laab0+l1Vjb088sIZcpILR4bpQpCJEWSRC7s6yjJI9KIooIS3zIucy85srAY5tiA0jWoYaoD89u
 LaOF+epNLSnMO6oQEMCZSIfU/tt5av3xZCi5w8dyJK/VzeVChzbcoVr9htN/St3y73xIYgfzP/d
 mComSlIcUtq2sLlTuQh7DRsPkZrNEEE2a5FG1Ze165QQXUREhgfeqoET8AEOvDARa481oZXgpRx
 VmI3NkBpTrp8LE9xnuedBFGz89pl/JQlTAAM0h7yElRUItWgkloa+c/15UHDiPLoIaTFLXsf02H
 RIpfe0a9fDaXXfKLA10yUuY2nt9U65yyo50GUBsc5mJWhx8r9CHr5Th2vMT8ED+ECMPa+zu07Ql
 DKPqJ3SLY465zXgaH6XVJTUsT/KSTgssoXaNPwP655PbJotJ8qunN0PSrbtXzTVNxff9rpgNFvb
 /rKHDQBSL8DwqLmvYnw==
X-Proofpoint-ORIG-GUID: icxsRGhkBJ8f9GvHWgfgRlVszRvrLISV
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8ae3d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TZpohm96M3O9q7pB9U4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: icxsRGhkBJ8f9GvHWgfgRlVszRvrLISV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59317-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C94F4453B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index dc7acde1913e65eb39734702cb164bb26b8ea6c2..494c8d9fe14b4d347fcc3bb3cfe494365de360d3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_AV1:
 		codec = HFI_CODEC_DECODE_AV1;
+		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,

-- 
2.34.1


