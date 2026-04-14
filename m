Return-Path: <linux-media+bounces-58761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIEzLIyN3mkIFwAAu9opvQ
	(envelope-from <linux-media+bounces-58761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE13FDDB2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44E77309D2C1
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14671267B89;
	Tue, 14 Apr 2026 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vy5Gf44b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahP7AY+K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA222CBE6
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192732; cv=none; b=asZRrQpbam2ZxPo1uvpygq3bZOnGROvjuZCWVtOrTpqfFcLNCV3SZVWEFuuNw4cSqDqM4ewVJwVnfXrxfhSwCz9WHD8uV8wwUkSB3h+zK8Z2oD6LYviJgMacaM3gtBi5zvMwxriIGU1cuYmsXZ9gRxC6LZ4Y2wvmKygRESiP8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192732; c=relaxed/simple;
	bh=S6xohSLoXJccfCQEg2QqComjMAl3QPjojUIlGkD3nS8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ds63fOSU//jedASbYxgBonBnIwASN71XBs2gssbd6j56suAsMkx+b7xVKm1sChf4wXhBXpPERCpJFlI+EBO0FPd7ba9Y1ddGMGA93LY0Lr8hdRSrLLMrCs94QHnf894iYIvwMkjovUSX0YFELpxa0SYU9i9/DiG6KxvavDwlW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vy5Gf44b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahP7AY+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EI0ZZ83759266
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YwElSoQ/iEAb1412AmMdQklGVnJZFWpO9xU
	/T5F6EOg=; b=Vy5Gf44bZz7u5LdX4KhMGO+CEG0gUojSHHV/l4bPqKlKXKXprFQ
	fvjofuGPjQ/Ft9Nm3MZeDV3jZfGoHNIuV4nAfLsXJppVydWR4RxhfUI2kKHnWhli
	vw0qm+PVVKY+WVNHQ9QeKlvjK+5UQgaCnxxVsc9tEo73GR4t+EysGD5IlUcvEUzn
	cuYzoXUSCJv/AhICm4WguquN1E+7hPyP6uZIKmlpm1Y6IVGp6QGCCxe5EGFiobmm
	3mNUBLKClOZ3cOE9qK1s1L+M55TgsGYQFioBdWn6xY8JXi+6oLGxfPkQAUWzY558
	mBmmA5gjx5VOL0OCT0wRaNVB0MKMbuhD01A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg0860e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5aa81907so139449831cf.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192728; x=1776797528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwElSoQ/iEAb1412AmMdQklGVnJZFWpO9xU/T5F6EOg=;
        b=ahP7AY+KBY9DQQz4FR7cbk/HYMjhxG6PQJXnLUOOaSRC6JiOcxaRZYy5EZFIdfojCx
         PeM1U5YQbkecl6QJ0Btz99noLiuzmFK8HPBUt3os8IGV8i6gT7fnpPEYKcbDX9VSbHHC
         qv9DNz6XoCSW13PeWQxr048VtRNsUeVAJQ1D33J2x9EaY4vexSWVf3K+4vfNLIOQ6dTn
         x9E+c2q5vHVPG3VpJz63m7wa2zIB2tTWeO6ztHUWKpcNzN20VjaEFSZzSbdeZwhYeHyV
         baxBOxP04yX5Hwv7Ga5hL1O94vcYumScEjWuZ5tJk7jo+yjy80B6Se3ujQYQgsv95/IB
         sdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192728; x=1776797528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwElSoQ/iEAb1412AmMdQklGVnJZFWpO9xU/T5F6EOg=;
        b=nwp9EGI4VCx1ZxBdftCcTZFYjDFg4mf/8b9VBAJydjrMfTFY6ffz74fxiAQgHxW2K8
         DYMOxwwFWZmosm+CTJDA/M2BnM2LdhP2BURw+MmMLLcqw2nteJ/9YlxOI/8qAc7zaPY2
         U30jXYya69QWWx8A/pLRQ/yRCwm4UZ2NLcQVv14wzDMe7l0nqkVW62gfyeeueRKQRCfd
         qC8dqXn76CiW5nl5UJ9pCsn6dIRU0qvFdZeWNOp2aZc4YKVDlL4ms8DdgwFIPFkqB4s3
         /0mG9TF8gGSs12ozFKfCW6HrG2o3FJVTX1AAGZX7XMPZH1mO4dLt/W5L8kMYtiHg2/WP
         rPSg==
X-Gm-Message-State: AOJu0Yx37g45Z2q9bvVbHwbjmNcPI3Uf4+6wn9Rkrwi6Dq/mg7Aa1y9m
	L5boLS+aqr0Mq2QBLQlSUqmAJOKF/Yz8m96fzcMlRzz6Vf0lA5GJvV4yMogqQTxjHXwNGpOpMVm
	Ow37iLsrZy/J1CXkb8FXyTLoYHzP958ojYHn1P3Ul5/vh5lQ/JNbg94OZ1vHj4fTfAg==
X-Gm-Gg: AeBDiesKM7wYFHoEt4XbvuqhlJ6EVyuC0Cufx3OwCpj1Qb7emGTRctXgSCJ6w3W9yQZ
	GlpYfuyqgXorz+IQ33RS81FdTX+Uy9ygeu6fdqYKIZY3xVKf7rsSH2BTFoAO1tAoVNz9U70b4i8
	tLIJK9BfaLxMXXrCSehneZ2nholYoV+ZR9VZPpZZ+3fU+tZnOWY5lgQOrLZAVovJxwSmGaHdCP3
	eg+b3GnuBMl0u05qyQnNZrA5rNEm8MCldWpCfI2HUIS/rrtqqqZRb74ACXi20sDPjPQVYMSpF42
	4M3SBjshkCNGqJrMLp9UPvkPuBOZ1EHagYJ6v6pOOlyGXS8N7pINCggV6LwyzUjW7k3F515xupM
	SAlF3p+I0WNAYqI9aU/RxJMEEfVSY0UwwBpOkAmUTTQ9ZjH7dSF+guD+Vh1yB1kQPvHZmPnNX4B
	j2V0ygHM4zgsI=
X-Received: by 2002:a05:622a:65cb:b0:50d:7f60:6210 with SMTP id d75a77b69052e-50dd5bf5333mr198346321cf.59.1776192727862;
        Tue, 14 Apr 2026 11:52:07 -0700 (PDT)
X-Received: by 2002:a05:622a:65cb:b0:50d:7f60:6210 with SMTP id d75a77b69052e-50dd5bf5333mr198345991cf.59.1776192727270;
        Tue, 14 Apr 2026 11:52:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:f062:40f:6621:e20e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e9esm427647366b.11.2026.04.14.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:52:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
Date: Tue, 14 Apr 2026 20:51:57 +0200
Message-Id: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69de8cd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=QLs-j7ecQSDb903mvAwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BZ6GwE50BqMXV2vN7lAjlidWuTxDFxWK
X-Proofpoint-ORIG-GUID: BZ6GwE50BqMXV2vN7lAjlidWuTxDFxWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfXwdgobyoylcxz
 NVxG0AuU4a8QwyeJsNQW1t4ZVj9WmviefrkDeMtobeMmN7BWf1OVGr1L2pPT64sbVZ/vOZTC7cB
 OKS9NF7Q+bLzC3KPbDlw6aogksNR5ornUgse+6YZmzlZ5I8Xv/EI0sItBHilSym7RxBsQEEcMU6
 3P4081CdkK3nM2tc0cyhx0QflwYMZHeyZWesbmz18TerlC+vBABVDN6s5YM3hx3hOd9WmPg5mnA
 bnFAIZIFeZTfwusbK3HpnSkn/3934/Tdjh0iTgK1XpH57ZJRV9W8N0etl4gR7GbjMtkNxnhuBRI
 aD5/ioB/l0SfiJZsHRepU55kmpAQAe5TEYOGm0/RuVy59XupWJU2QLnYdZ2URC6X2PggubNurIZ
 xW6cAqUjOjOl9bdkQRQBf1suCIn5JsXculxHD96wzP2GsJOBhOVQku07VRCyTrE4wqIVPtJeUwi
 XIvijM871Duy7ZXoM2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58761-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00CE13FDDB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
allowing frames to be routed to the VFE PIX interface and exposed
through PIX output devices such as msm_vfe0_pix.

On CM2290/TFE, the PIX interface includes a minimal inline processing
engine, which we will be able to leverage later to export statistics
needed for proper 3A frame processing. This also fixes the PIX path
not being usable on this platform, as PIX routing was previously
unsupported, causing frame capture hangs.

Changes in V5:
- Rebase/Move from en_vc to en_port
- Use common __csid_configure_stream for RDI and PIX
- Use bitwise | for packing vfe width and height config
- Simplify vfe_packer_format, no error expected

Changes in V4:
- Remove unnecessary boundary check for wm-to-client
- Remove stray \n and fix commit subject for 2/5
- Add proper define for PIX pad index in csid-340

Changes in V3:
- Introduce what PIX is/means in 2/5 as discussed with Dmitry.
- Fix patches format/encoding (proper ASCII)

Changes in V2:
- Fix various typos, extra spaces, and reword commit messages.
- Split the CSID-340 patch into three independent changes.
- Make VC/DT-ID configuration explicit in the CSID/PIX setup.
- Add the csid_vc_iface_map helper to retrieve the interface offset
  from a Virtual Channel (VC).
- Add cropping configuration in the VFE/PIX path so that it
  respects the crop parameters defined in camss-vfe.

Loic Poulain (5):
  media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
    registers
  media: qcom: camss: csid-340: Add port-to-interface mapping
  media: qcom: camss: csid-340: Enable PIX interface routing
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      |  83 ++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 152 +++++++++++++-----
 2 files changed, 156 insertions(+), 79 deletions(-)

-- 
2.34.1


