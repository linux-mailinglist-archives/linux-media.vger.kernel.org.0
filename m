Return-Path: <linux-media+bounces-67216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wn1VJ5FbUGopxQIAu9opvQ
	(envelope-from <linux-media+bounces-67216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:40:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D9736B79
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LccAUehT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KwuXmw/E";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67216-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67216-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96A1D30285E6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 02:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2092A322B87;
	Fri, 10 Jul 2026 02:40:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5822D5C7A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651203; cv=none; b=bU/GD+4EFqkGc5QfahArNi61En1HjVX6Z03WTJ/PP8XEhkTBzvYnEmnrNNAjj+3o8JGFAI6ROjsSm3c58tvDyvGkwXLA0wGG4mMBIJe5JbdEDqBzQl6l7rrOjTWTrTUABanIEqwAjitKaBCZcZdw61+xJuPpIn91E8beXXOoNYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651203; c=relaxed/simple;
	bh=ny/0yGBUhpu15kx1B5zBZQlhBGDlWFFW9v8sFZZmW/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=To9IpczdUahptjfTd1/73V4A3t/e6Nn2qvGywS06W0R3HQUIZWqGV5gf+HGg8ZjPTTu+yzlJz5vlm2iq3MC/P/UjagUfIa9kCvkCuGjrHAmn9GoxNTNdy3JKG34YOIwKu5jaKmy3+FQObgL2/8r7L/55Lu5uqsDteb7LH+cTXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LccAUehT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwuXmw/E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUoiH2557048
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NR87RDpBrxH+KnWlqPh6r/
	esmuQuv+FT//+hejaEsKc=; b=LccAUehThdCPEcjMRLbusa31reE/OLT6cXs+rB
	jScyF1qPpoAvpEZ+cqSr1vEINgeIjhDrp46JsCnLZNii9eHGPQ5ovRpvJcV1nvcX
	tzAp+JKcPmDf46iFfSR10TGx3LMz2KjiR+SrNFyYunQCwMsY4JZXW/FSj0uxagPw
	rqbB77V3OXsMNL2W+k3iqyLTJClBmfU3VFi/c2kHjQjCog8igu6AA40fdLUwSsyI
	j6PUAxrl0KCmfngMu6FvCp95t6bkQ71P5ruC5LSYSsDt2Vc8moCV7ZFyKkhjIaOL
	Mmg8TH6D/P1i9Uj2cazXJClw6Hr1FtCY7ZsMZuDMRZcWhjrA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8h78u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so8321385ad.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651201; x=1784256001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NR87RDpBrxH+KnWlqPh6r/esmuQuv+FT//+hejaEsKc=;
        b=KwuXmw/EqNGnBmZ1hVGdjClYW+svBcXM+CFuoPoxfUYv2En3LejUXdaNcu/XK7kWP+
         OWU3jIRI3u3rOciGWTDPN/0mWzHVvyZ4Yuq7e+xU6P0DyhMxJqepFVidj5Zud7VAF7D2
         tt6aTM43MzecGTLHoJEvzCRCiAWfYbLOGNLBEoahMqr40VK66lUUz5AzNUHtUxFriBtU
         boy5JY4AUdFuWpw9o8xtqifF4mC/Zl2Q0ET8rBhfi5lufhOZC+6Iva70IpI7JCPK3ghu
         cTePtNsW5gzW5Ovi99eXGyaArk9vVMaWc5HFuSs7UeucH7nlVTDNQHjChBbcH6OsI2VP
         fM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651201; x=1784256001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NR87RDpBrxH+KnWlqPh6r/esmuQuv+FT//+hejaEsKc=;
        b=bgXZf5kuj4ubx+rdVvtQD8uPrqSHsfBua1GR0T3nf/9cE/GgwU+Ekcx2kPtMVm8lbg
         wAUV4SmSyfRShXXlIobB84xGi6rgf0bspt0CfJRySGuZWG65PqBC7qe0jvgw6by+aVo7
         5hzhdcAp4falTTaQX2SBmBWAiNnp3iXnr9pmTw3RKtDjCwgiL0QouYkd7VQMiB/ikx0q
         WXqLhV1bAgYdg5egoSJPJHVJwWHZvrbiKwlumMX8ADrI6JoseMehnR3p8Urm2PAB6Dm8
         ie6ubkbsCkIFyPJDmtngrAe+ad16097AJ7ZHgJpR8fhJKjyIJ+IAtbSVKNncAUJuGWyd
         N1GQ==
X-Gm-Message-State: AOJu0YzAuJ++yxBcm5/4xla4OEBACsZOt/jHU+RBRyI8uCpIOlJtznoy
	rTSqOTzU0LgTsA5O/b2wEnVKQNRlsE3YA2gcLJEoQ3WuowEa4Z+Cvdg9JFdk5Lm5EBFB1hI/6NW
	OzguNY3/52HkdQTFqebQBd9TYbH9GYWLUXKE1ryz5KT1lVahzhZuf9715ucEMXHoNZg==
X-Gm-Gg: AfdE7ckNeZTWD4IIFqDRP9dgO7Gy+A/hcBoEt/wgiSMXPsHx+k6eGtsyO3c8tg8WUeI
	swPtMVAwwJc68DpBXldHogD6smTpOdhdPYsyNmi+DNLW4diq+aKbrey8QQApkW+hqdXtAW2Ilwl
	13npOuPxDxArPAybbP1Ch75PnppsLwOnPf8mAB+kl0xSLwpZvCRlsK+XMU+lbyXDd2GnlV9mr68
	vzqQyjbZ96Y0bwXZwafUJ4YR2op301o5o9/2k7jNutXytVZl0QrSp9KbE7wP425YOBozPYDtP/l
	UCRHsHn0EkCjezNJgIJcPSkX3m7Dp0r19M3AO1w5EivapGeeMRsBgxG36mSaqffMZzb6qAfvLM6
	sQItgu6VbSSWouYitg3iu2vMKltZinlxrVyXf3GjQwoV2
X-Received: by 2002:a05:6a21:1fc3:b0:3bf:97e8:a07d with SMTP id adf61e73a8af0-3c0bc902b2emr11133509637.10.1783651200690;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc3:b0:3bf:97e8:a07d with SMTP id adf61e73a8af0-3c0bc902b2emr11133484637.10.1783651200251;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm38300227eec.31.2026.07.09.19.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/2] media: iris: add LTR and hierarchical coding support
 for ar50lt
Date: Fri, 10 Jul 2026 08:09:11 +0530
Message-Id: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBbUGoC/y2NW2rDMBBFt2L0XQXJ1iMypXQfIYTRq1Fqx45GD
 oGQvVeO+zNwhnvPfRIMOQUkffMkOdwTpulagX80xJ3h+hNo8pVJy1rFNGcUz+k3w2ko+YTLPE+
 50FZbb0AYZSQjtTjnENPjLT0cN8bFXoIrq+k/kcNtqWtli5ExIMJ7rW8+tzFmaMoJKWTJhkLvm
 jKqFUTjvfA8qu8JcXdbYHDTOO7q+VrVFjDQ9ZNK33TCReUhOqGF4D5aZTupgBlp98Z1ci/BdJo
 Lcny9/gASuuAoCwEAAA==
X-Change-ID: 20260710-shikra_ltr_support-27bd9a496950
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651196; l=1984;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ny/0yGBUhpu15kx1B5zBZQlhBGDlWFFW9v8sFZZmW/o=;
 b=spNxXQj0rH+mwHqW5MAv5vYojEgV0w2RY13nmwVwDEKu0Ddz7Yaw7b5BJKp2WpgBDLuqzoPfS
 4zmfYNCXe3MDmxv90GdTgKJ3cTxoZ85SnUPiwz+gJkbc5MNYgQ2jmPt
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 0y5DgEI1E8Jf_lNdNA5hDMb2n7PSBNfa
X-Proofpoint-ORIG-GUID: 0y5DgEI1E8Jf_lNdNA5hDMb2n7PSBNfa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX1xQV/zbDei3Y
 q/AUrAW5BVBb9qG5riOuJybWgeAtFAwsLS2puV+0RujnzyfwripJlNbdKE49oCDqRXggcpuNrL7
 wYkgMq8kswhVQlefc99KfBX2bKW+xbY=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a505b81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tubY2wRCqZv2GIUqL5oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX+gXLVnnL/PAL
 9V4rq2zL4LLYmVuA3ySiMYNOhzoSwmCogFJEf1PzHJZm6bV8bXDTdOv/D4ggPiXZ9JFG2vJBsZi
 iKk4IwK1WOyNlImEBMD5oN2IMACD/3C/KkOXviM/pWl9ilNJF/jJ9wPX5nUC708EjFjBvMPG6tm
 pC/7d70Cu6kBwzW4+54pNVOrQAzZdDe0P/1ZtDpW/7ZO19NoxyjT1nUZFTcpV2A3+pyFO/IHjy3
 yPvY5BBLr+Iv05aiE3GhTmMcEaZpM3k3SXNsmI5+WL5mScO68z/sELdmY0SsQTQ0/hySwenZAKo
 FomOH0MJ2gjngUWo9QV40z4xPaX6hB4XIs+afd5wbakClrRrXBSbvc2jab2Ia6yEGE7dCO7bOOv
 ZzEOU86aikyk4b5sb0UrBu3OF8Ixk5+AgUJ7deF2e4JM07WMX70rCmtna8VHYVAyhL2tu5HvtLr
 wqiG6DRgt1qF9lU7mvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
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
	TAGGED_FROM(0.00)[bounces-67216-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E5D9736B79

This series adds support for Long-Term Reference (LTR) controls and
hierarchical coding controls for the AR50LT encoder by enabling the
required firmware capabilities in the iris driver.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Gourav Kumar (2):
      media: iris: add Long-Term Reference control support for ar50lt encoder
      media: iris: add hierarchical coding support for ar50lt encoder

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 212 +++++++++++++++++++++++
 1 file changed, 212 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-shikra_ltr_support-27bd9a496950
prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


