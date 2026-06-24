Return-Path: <linux-media+bounces-65519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9OIiBLWaO2oJaQgAu9opvQ
	(envelope-from <linux-media+bounces-65519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:52:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867B6BCB1C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=firXKm0L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="F2/6z79q";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65519-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65519-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B61EA303C7DD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E433988F1;
	Wed, 24 Jun 2026 08:51:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982EC2DBF75
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291115; cv=none; b=LU9YjVB+tfkHNIxzSXKvO2oqbFRh/1ZI5UQxYQbmQhs+P32kcEzzbIX10j+EnESe7bSAQFN6//SvB69POeQpN+6MvknDs/qs8HPnWfqD1IxJfzWb27hpKKbO7v2Z08q/LNOVVlcnvOrkE6WK8f1JtD/sqkzHcFM2zvr3lxkM/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291115; c=relaxed/simple;
	bh=znIPxVQSz8dtKadTFIF0UTNeLbMfAah3gZA5e3t3csw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kw3KOFma9Bbr8FMsoqQvbGiz+uVg+SlW0M2hl/DAhpPZBExz6lVxltFnMd0yuYEd4JC9e7+vhdwINVjCdfJRxEvbAzXv1mUE5MHvIGhRpcwk7y5Hbh0+OYLN7NNG3SbcVsz6idDvLfykH0VN2wUJ0gnHXBcTdad2AIuU4Dtb7iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=firXKm0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2/6z79q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u5DC534360
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QW2n1nJTzhvBpl/6emQCpg
	fkyQBbHqZBBwyB8zOU/rs=; b=firXKm0LKJZZ8czNnNR8UqTRQQSymSw1j4TtOP
	sg4t5o/Nm18fxGMOZ2Eif5P+SultUgNUBShTiW2Rbrd8qV1yW7Ys1A3aaMGhUM1d
	SrZtbCy/0VbJtBHxD7bFr4GNVIaRY3wl9qX6uol9KOf6gtobINuZW/g2FFGjCAPw
	ZJs43+EAXnZS8gkHgo6gQApE2Wlw0+pzAiXb7G5qZlAaTh6mZLkG4B+imD7w5AjB
	xi1jI04DQtVHpweYMYnhQ7NMxhj8GHTZBdDJc94rYwFz1GwaqenJdVdcYykDvj54
	CK1ptFPCGG+eZMZHOFpBO9Yu+NAnkuS3wkEjOboqcD5tEcuQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r315t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:51:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422ca754d8so692646b3a.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291111; x=1782895911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW2n1nJTzhvBpl/6emQCpgfkyQBbHqZBBwyB8zOU/rs=;
        b=F2/6z79qGHGDWcBUEdrVTQvTSWTcAWEl0NCJ2RjAo3LIk26jYKbdGZV2kg4n2z7e4J
         MRCx2lhZlgVwJIFJJEcT2Mo/xgtvGB2T0QdGFem0xnJZJCAgwnxHQrcJRoT8QlN/YPbj
         9vVoEGA/y3KqKm3Jqny/t8saGTQuCmts2DqQCH/RaBzgU6N723kbUyAheBvfX3haupId
         A7sdJVbBI9rhYmHgRmeQItHDomYzbcOmvIKtQwQnFpEnkX3QsJc6vx01R3hFrGOOZrOn
         GRfMr9dOc/sIx/CIcSAp9lso/vw2AGYVMPsdQN8VD6zs0o6tXjn095tehAjUxBGMgtWk
         z5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291111; x=1782895911;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW2n1nJTzhvBpl/6emQCpgfkyQBbHqZBBwyB8zOU/rs=;
        b=FsmyYJ4HaGGTwpryDlkRUAGY8/R5uUO/tNk119yzxeW6uei+xPWPImazzbx+GWwkGX
         wS+DlOBIZFxWAsiymExi1CapBt/eRklpchxEgmBTzx0QrMd0B7+GDEZU1Vf34fboBGRB
         AwzOE+jODtp7SHCuoz+Shfl6TTmIxmzGGdQQ+CvuGY9GvEOCmQFb3QwzHjKHuRCjsrSI
         Y4eEbtaPk8xDbxN/qDoTpBclUkEy51cKO1JOv6Lu1OkeEhLoeDOBOzN7SPxEKgUDqb6Y
         G+E7IKubW89Z1NWHE1ta7ew/9VkwP3nalU0OnoL8GYP5HpsKFvPIpvF+FobVSB+gn3xn
         HmrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oEmtOSMNtKA5vXFn/IDfdy7OmLwGJiMLqHyFQCEBNUv6mKYayJpgoqj+0CFPUSfUGX7bJok4Fws9Q/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nDRJnjGPXUuLIsO+dQ/+aI8lLHWM1kWeK75okwDfnEzogEKB
	ldoM5bo5rktmoA+LF9iBtMDQqCXp7cBKQTDqD89Dnb60weufLmVEeuVDj4LF+KDKZ8Ts4lFuZp2
	biWnMV7WyiKyLO82tQIYEP9/sph6BlUuW5Jj/5gL0LX2vmrgX/PtLDRO8yDjCEbqrSw==
X-Gm-Gg: AfdE7cnlTJZfvHUpNBDk2BDFVbll90nTFRIQlEYen84FNYRmDnzj7QQszpKwY8HQDf4
	k156rQCyRZYuUu15JX9S2Ve09pkz+xLKv6duAFnklprxdSz68unT0k8Pw6MzPn0uT7urPHnBGwO
	0wJ8D7avGhfDy+s9T/Ik9HbV4kWKbT8HSTkb0Si6R71fYG54uoUuTEj6s5YolaFttbkxkriomPH
	qOQXDH6Zup8yCViohGZ2zuFthFkGHTawXST7/iZ5lTvBATERKtLL1vxEsHR/aTtsHBdQkvsI/Er
	g8qE9MwWz5hudDfmrfZ9E4fhQ5twhaO1DmiZf/Y0U4j2NCgVKy3RKl8IbtetYHqKJuobzSttqhm
	PVrt1b2/eaoVRAOSdl1oChHrilL8BN6mYkjJCaASPTSKA0aKprAe6PSTbIofZ/WYVL+d03FfADh
	+vCMHf9fgCXQ==
X-Received: by 2002:a05:6a21:117:b0:3b7:8e6b:7001 with SMTP id adf61e73a8af0-3bc51b6d080mr21430066637.12.1782291111231;
        Wed, 24 Jun 2026 01:51:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:117:b0:3b7:8e6b:7001 with SMTP id adf61e73a8af0-3bc51b6d080mr21430039637.12.1782291110747;
        Wed, 24 Jun 2026 01:51:50 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm11926464a12.19.2026.06.24.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:51:50 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: iris: add dynamic encoder properties
Date: Wed, 24 Jun 2026 16:51:43 +0800
Message-Id: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+aO2oC/22OzWrDMBAGX8XoXAXtSpasnPoepRT9rBtBbSeWY
 xqC372yXSg0uQg+wczOnWUaE2V2rO5spDnlNPRlyJeKhZPrP4mnWDZDgVooMDzeetel8EF9GCJ
 xaWpwWmpBUbECnUdq0/cmfHvf90iXa/FO+yfzLhMPQ9el6VgpqmPrTWiUABTCBBmM0AColQXvg
 8VowLfAVtcp5WkYb1vrDJtsz0LxP2sGLjgCNsFCDa2g1yHnw+XqvtbLh/Kssb+0fUoH23ptITZ
 eukd67Znxr6F4HixYLJqsia2QqBp8YlmW5QcetFL0gwEAAA==
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782291107; l=1682;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=znIPxVQSz8dtKadTFIF0UTNeLbMfAah3gZA5e3t3csw=;
 b=WO5oY7bMrirRcO1sAcvrto698iTTQx5U/a2N4D3+nU8PwFFz8XX4ca7i7lI35TfBUmKxvWWNV
 aresOUpnjxTDbG/hDwcVaTjIkhp6Tea2OofrPdv9V6KIY+JABXzpI9v
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfXxK4Q3aVEyk0e
 /ODWbsaX7I1tVq7mOGlJ+YKP4mfldC7x+6Lwpqhy/DlxX6k/iPJMiRgb57j3zuBAWAFaDBxUMQt
 QhQadV1c5BaUprwa7dEj6hxjez/M/Wr/3EggP+jRFZ7Rf9rYw6Aq35pU5y6y7oXixSdbIUnqV/y
 SBeCM99WFuTDzvw0KJfSSekrpbivZDsMDuGsqk/4OYQf+ofErSNgiZCaS1A+Ns1auSctjtTRowz
 F09nkIK/J5Y/poGMhCr76/bXSKCK0WZIM0rn4lcx+O10x/dc1SIR62LrQpzcgpS6LYDWLsBXlaq
 +rREaGSbKaYVdHZfh5eka1TZ0l+FD+Rq/6AlKJoHI8AW7sdHjLtEgu4Ua6rbX7AjW8UKVw0cWhg
 zBJtvCQqB+QNOFNhSJSX7MUaVv3f8w==
X-Proofpoint-ORIG-GUID: YkH8UlkMBLxxfwjTkeFfQ5ceGkBkh7ZM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfXw+G8y2Mm7BTd
 ZKbVG272Ru1s9vzIB/6FGx3XqtdctCSI+fDCFP5ea0hR/sKlZT7Ody/ZyNbd/77u1W6DqKiD4Jj
 X8aHUFnDk3bn5Ox97MnPyEIDANOUH90=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3b9aa7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7J5Ww17mAtRdPOrEpzAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: YkH8UlkMBLxxfwjTkeFfQ5ceGkBkh7ZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65519-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7867B6BCB1C

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Correct the max value for FORCE_KEY_FRAME cap.
- Link to v2: https://lore.kernel.org/r/20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com

Changes in v2:
- Rebased due to a conflict with commit 'media: qcom: iris: split HFI session ops from core ops' (35da0884068226ca3a53371dbf685db6e0d74658).
- Link to v1: https://lore.kernel.org/r/20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com

---
Wangao Wang (2):
      media: qcom: iris: improve gop size support for gen1 encoder
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 26 ++++++++++++----------
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 8 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260417-dynamic_encode-3751a6360ed4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


