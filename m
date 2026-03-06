Return-Path: <linux-media+bounces-54810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCzqIej6qmmcZAEAu9opvQ
	(envelope-from <linux-media+bounces-54810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:03:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA12247FF
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F030307A549
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA343E8C4F;
	Fri,  6 Mar 2026 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llP3PUQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QThzhMCf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C712853FD
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812815; cv=none; b=Nf78OJQjv2mZRMiOzGS05tzgLN61LAEfvKPRdyODisvjY352vLakhdw2zig8E/JTMWPfAIGZ1ZkMroIIFZZe5vqrLkFQp8fJL0BsW0q41YohVCY3XtTG0ffbWBfCzX1t6ACNCJe+LbF2JSl8MAY0Pbn+ulhh+BhhUm6nKNjL3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812815; c=relaxed/simple;
	bh=Z3rpO6kQrWE+j2L3gm8Z9r1IXg9iMCiLAKvkCTYIHoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=axkFiNfiJFOdUwq7FKbL37+SupfJBNEartAUCSU9OzCnh3mooG8MZgKT43wpFve4jnjvhhdmb22D1u5cgdKs379QsZrbeSl0rXVlJHQtwg4GSysmq37pEOK6leNtNFNIQ+0tqYgtRvg6LRpRNrzuwfDezIjxDLnkLVLBZPo2JwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llP3PUQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QThzhMCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FqxBf3804185
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 16:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OCgt4IYdoKnOpIB7dLO8DyHP94BzVSQjMXA
	yHByoHZ8=; b=llP3PUQYmNagNXMmRLPUdWsuks+p0bUgWJGJFE5UAwO/79dGbH5
	vIVqVe2v/2VFW9/o1t+yXQDAPfvoGm7DHwfOlC74XZbuLts2+xtHcz8VCRwLKl4P
	chOeyLzIm+dwEDm8gkNrPZUCZpHbbmSL/mcpeRNgke9jOghuFALzmu3BWaKBT/Wm
	kKVPAysJku9md6XKtABVqY+6u61+KXrtyU22pFp+qbpyPT24kirLLi71t0xNAKFJ
	Zq0Jakq77P+KwPnoHz10agtFZ2xG4Zxs8/Srrn5ryulV8RbqhKGNLw5NYZ2ZgZKq
	xekglgY47H2iVzO3033ox457OWrEZ3ouUAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09uqer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 16:00:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506a07740bdso235461391cf.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812812; x=1773417612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCgt4IYdoKnOpIB7dLO8DyHP94BzVSQjMXAyHByoHZ8=;
        b=QThzhMCf4tSVBIoqLQCTowGugNy7GdyyQB2OSurVYWQXCYyYWMj3u1ki1DoPgElgrc
         qDdwoM6myzrPFOkm/XLKzLhLpY/Odf0KSQebebhz7G4v5zeuuniuDddtwsqeBXQ3wzl1
         KRu/tQkPoFm5s48IzM/Sz4bnRzroCIFAB1UmCF0gyo6DKny0Y1Wdbzw/7uxfxHiSF/Xb
         JfN3homKpiIECk89+ruODVq6d0i7Pclwy4hRnl2JMCtCGJaaQEUlnozcE5bCDFS5T8aw
         56pdBcyVJ6v7S1a4x3nYcq/DyKje7O/ysxOFtqzCHIy+sShZMgbyQvsRX1oVq+/k1QWt
         cnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812812; x=1773417612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCgt4IYdoKnOpIB7dLO8DyHP94BzVSQjMXAyHByoHZ8=;
        b=Ym8h7oT/zrjpj+2fNYUGsQlYUNBZVsDCXeIdLtCRF/ymA0o7/d8FrpER55Vx6PHg3h
         /ob5xp/l1ZZxUY2KdC4JaLLE8JxAm3BiyoOLS6AkBgnamSMnDJF1/DTfAhC0ePirA/tp
         Stk/eQYAe9ZP/kzTHP/7/bwGb9/q3h+tiYC/GnsmWpkxvFSbadKVxv2tgAuPzq+M8trQ
         8EQFYMD1gk7K9IdVvRevdm7gNEBzbA2Ba4VHdnKY6FN3sentW57pGcpl0kgoNKAuITBp
         lRzeBbrb9IwOuitZj8hpQlMod3umiSQf0eMTTSWeGaSEFZ686nEZc58Ge2yNW268oncP
         KQTg==
X-Gm-Message-State: AOJu0YyMyw3yAmewDfV2QpYszO6WKIPSXj9doMCQ7sKvSDFGhA9UeibP
	6zd/WeDlHR9i+6cwNHCVItvICh6e8zIFLYXdL46g2+a9wgpANciAyPaosMOX2iaAfXwgRj1lHCD
	g0DXzs4UJOtoNiIGePyG2HIfllm0AJ3hMBaQKvYF6LGoacHX2TEo3Gj0QlpYcdsuYKw==
X-Gm-Gg: ATEYQzxMV0aWNe8JrIDeq+0Y4FlX+xOpTVw3FXJ/kj717folSMtmVIlwItFOYw2lKFe
	uiipQMi6aOeiT1LCwb6+ZPY/pJFPOeuJFNdwNrrhHZ/6DsDDn4CVtESfJXswjnp7FH1pq3g1D1e
	msib9172T9W9rODTcNzp0LlFvaKlYh2kavvlQVHxA/FpqQTGr9kuzKarEp8asVb0bUv5INGOUCk
	4mFb+V+RU+brxlYjQkDxrXLThNVD0XpyB3wY6j3qh9TJijM818NlulitFhOZcPk8fVcG8LjJGMP
	62d5OUsKmL7PlrqgpV0u9eoI5zqpVZuZhACnZ5XJmu23SyKJ+yLeFi18kYJ2tDxofsV4a5NoEXa
	Gc9WmYupHohviGekFD1J4sSntxem+ciffisyu6TD00VXBB8/lmjCf4B6Sdk/XktazytqZPK90Hr
	GaKUM4vpkTZG1N1R3piXub99KfcOiZdkoMl5YGCWqO4Q==
X-Received: by 2002:a05:620a:4407:b0:8cb:4c67:349b with SMTP id af79cd13be357-8cd6d43ce21mr323865885a.31.1772812811768;
        Fri, 06 Mar 2026 08:00:11 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8cb:4c67:349b with SMTP id af79cd13be357-8cd6d43ce21mr323850285a.31.1772812810864;
        Fri, 06 Mar 2026 08:00:10 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:10 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] media: camss: Fix PIX BPL alignment handling in CAMSS
Date: Fri,  6 Mar 2026 17:00:03 +0100
Message-Id: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NHb3TeR-3QIGX5j95dQ1cVoXXkSmoIE_
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aafa0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=4T-m2v83tDMdnpPZlosA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NHb3TeR-3QIGX5j95dQ1cVoXXkSmoIE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfXzaq/MOs6+CIZ
 4RjZytYp5266lSogEBCMarTatDaUghX62UHoj0uhId9eeEwr5zl/sZVdsJj7S+NaJ2QAw+wk3yT
 wNiyk7zk6K66FRLvfBV2bRloV9ZTDNlg9yvbfWgvBNh1EhFYeoW/O8Ubgm/OeJ9kIBBT1QBwOn8
 1/UeRX+nbICQGHCDliYzJv59zt9oVRVoOK4qxtnDAGWZfa6B51zJ0dQ4WNPibgf/GKdrbgHppGJ
 IhaVD5pe7Qmsw15cxS+xVpSMNqkHVJIxTju/3qjSPqFE66Z+J3Ygr1IObIc9qgr+FsCOhRcZRAO
 jS5j0WZecCDAqhNRDw+mOUGsKWMAwPVkG43YbNcAVIVe+vkxSfq7Hbf2/O1qCpHf+6S2DSPBWw3
 tzhbLmJhNbsONdFWxTYTjA4psKW8btQTc0IwpL/QvHaUykKEWAgXS0Rb1jLtZ3LSOPpEyXK2u7y
 q0pJV6sBFKLsDJGUABA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: 00DA12247FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54810-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series refines the bytes-per-line (BPL) alignment logic across the
CAMSS pipeline. The current implementation relies on ALIGN(), which
only works for power-of-two alignment values. This is fine for RDI
interfaces, which typically use 64-bit or 128-bit alignment, but it
fails for PIX interfaces with Bayer formats such as RAW10 or RAW12
that require non-power-of-two byte alignment, causing hardware config
violations.

The series introduces a per-format alignment helper, updates the VFE
code to use proper rounding for non-power-of-two cases, and makes the
PIX BPL alignment logic format-based on CAMSS_2290.

Loic Poulain (3):
  media: camss: Add per-format BPL alignment helper
  media: camss: Use proper BPL alignment helper and non-power-of-two
    rounding
  media: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290

 .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  1 +
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-video.c   | 13 +++++++--
 4 files changed, 63 insertions(+), 7 deletions(-)

-- 
2.34.1


