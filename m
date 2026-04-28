Return-Path: <linux-media+bounces-59748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGXkBDYw8GltPgEAu9opvQ
	(envelope-from <linux-media+bounces-59748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:57:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC447D3AF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0452A301D330
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08042329E47;
	Tue, 28 Apr 2026 03:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfBqo+VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8bmy1kd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D333B6C4
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348588; cv=none; b=jb3nxYfxYKopy0UYqR8QxoMo/bFfFazOQxrQygk0frz7a7zzhLeUnlsg2qqhQLxznahBEQLtaSzbP3fjsbKiUm/TSqs+grWtxat1L7Pd7eoPywERcsuuz57wXrJAFZ6SzjvWGc4Z0GDKZTWAaLNaenHYo2P6bLqy9ZW6DG71PVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348588; c=relaxed/simple;
	bh=B3HL64Au0aEXfS2Kn2bLGfzZAIxzxv1nhUwhmU2OkmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGIxLZlATbu7n1HGVlDezfWoqkInhvaIxVbfLifNx2tOXLoqTPUKKhe+H/TVkqq2e4utUgPF9xkrcKzBgtLYIws0NTrZiJMKl3Qq++ac4T89NhX3H4IwXWoUUKenfI7yT3PUvdW4IGquJwAPK/iUQIUvxVk+AJ6BMRJI35zF99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfBqo+VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8bmy1kd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S0ftCS440834
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=; b=bfBqo+VN3FtzyMS8
	CbXsV1xSN8HzlZLfin41kpB8HSiV6JXvskknW6u6+LOO0C8hqseecqQ7tFeVAp+K
	JL+K1rLKVVn13NfqAG9wc/wWb0HtL6kzxfIQX7+7g3fv3f3J/r7HAAGJoO9dZ3bH
	k1x23WyXop7exHkTgz6BNfe2Jz520uDvlS/Oeg5kxt7ImyzYbKs/zqXAM8gPgip8
	G9AZ7tdGQMSloh2HJobcq5BLMZ1RiDeQawAdyY8fAu+9c35Y/1aRn1WGmjS61MBu
	dejT0rZtKDG/h+QfRsLe0KYip8EYn2KrO4CP3I1O+PYjhsA7sB5pg63NCoECM3x7
	BGFmvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac42g6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da86144daso10457358a91.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348586; x=1777953386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=;
        b=X8bmy1kdDrj6Oi9wBjudkjV2Osc/Qvegkdd3K0dnjmncweAMOiitPiKLVC1d7sU05C
         7WtMEZ8U572/Ce0rbLPZsRrpaS06ZY6NDT6OUDPjhtmS1heSQ1dFP/FYRW5fslr3u1gn
         o++2FrVoirwlZHaV63c4di41szjw3/JccT0jECo4GB7ddrClxe6GcnwDI9KuapSpqiEk
         xzqvxmaqVuDTn72GtDaEbTxEHV+uAwBcvIeidagnAN672Fy24V82ZVqA4dbYwenGu+oK
         FPWlV5Ey1+jm2ov7/9lxhkZjVU2dayQ1cJL2R3P/s8JZD01g5xE8mpABo2gfBWynXM5z
         4Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348586; x=1777953386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRQKBOvpIQQtqM4o6WXiH6tq8ETJefi9sBfIx2EGNi4=;
        b=BvcJZUTNOX4OAdKTxE0VEvP4zftVWl1I+gk7a9hDYAjJF5O29YtTHB1GCZqUiAdpmI
         PO19X5aUzxZseTjXWuvh3Ti+dlV06GwgwmVvQglg+tr+2STqmVo7jZHO5pM9u/PVGMo8
         bYSyRdMZVJ0GDxya+E68/LTuuDjyx6/5RDpdkCPkGuYN5+KnG1QJnbxXn+4bB8HTeAql
         cOi89+I0/2SMy4KZRI+2jLOTFXuxZ6FMry2CmInhl1ZW7SRqbQD1rzfMzS6ZIXM60/ZJ
         EsAnt++l5v7o/TOmAo5m5nNO5o3z4+28z0gFbL3qJxkN1318vXUMCqvRB9IvcNAmdouP
         C6rQ==
X-Gm-Message-State: AOJu0YwODxDOJaqCYhdmTwM1T4hfWHmjegackkJGNqY/+FRzHBCEQi/M
	qz+d6Kic35AfO5o52kdmwkzYpLGA3/Qr6XKYcS5rbyq+mBVufMHlw3R2Th5QcAgcmEl0eb/N0bu
	hiV3Y1GRQhU4ceVHGgxirFshkH4yOOkJ+6Lnaw1/HnSY0J/hA1dlCkIfDIaJ71EnsuQ==
X-Gm-Gg: AeBDieskMvS3ODgKfhHpnX04kh9gYEXDlrWbc6U/YgX5W9zshXmTv/pR3ISnIZrtQBQ
	O7BhOjLhqWd1JTWW4OEMGsSyd3iLyLD6zUaS9/BKcJvTr9SqTHd9dJtBTKjYpB5Uo36ngGTqi+O
	ScuV3+7+i62frSt6CaOps1dFPiPH8xLSc9BEl8djRWvSkslfQJrq5TacL1HhQiGReVJFUy90N10
	w0+HPSBpQn8B/yoJq3ORAOEa/C5xo8hL3A3O8/xvsVXgNMuPRZCvKlaG1eZy+1laDlX7RjrNc3p
	/N8o4AdVB2w3HvYEboTruZM9wuyBML38kDk7MVPgOtbY+ohyvjh5+4syRemtMo2s0W3l5dFSGRj
	kE8x2i1hgnciob0W2nm5Ajy5f/QLh5LxlbotGRYn1sj7CF0tfrssU4/t9R8Cmrw31Kw==
X-Received: by 2002:a17:90b:380f:b0:35b:e51a:ec77 with SMTP id 98e67ed59e1d1-364920307f6mr1308430a91.16.1777348585855;
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:35b:e51a:ec77 with SMTP id 98e67ed59e1d1-364920307f6mr1308394a91.16.1777348585379;
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:25 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:10 +0530
Subject: [PATCH v3 04/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-4-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=1065;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DydqIdia9cmT4zC+axscUwQlMujOYL3SDRWZ2LaadIU=;
 b=uv7UAzu7sAsuZDPmxAxOCzv9xYKtBDu7s/YBLJf5okHY+Wt6mzYtJY0/tliLYjMr090ZkEP4M
 nDwoGlXzeIwDq/ZRKXbzxUNySSWceRrt6Bw8UYVepbM2jUG97uOCMTh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: qe_V_Ws4UbyR_SVbrBxOMJzdvuTIq55l
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f02fea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HQKoClRO7b2jHrqM0cUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qe_V_Ws4UbyR_SVbrBxOMJzdvuTIq55l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfXy4cAsVx+vdZQ
 xcBojSf6W/OHT5YXVWygRW6xHfrynWsjBcgHLl8iQrEp07enAv6i+O9FddTKlYr0EE67kYDs3Ih
 EScxQ5RRxpHukGZEzjj4KgYrP/tzcJd5vTqIV3ed0ZL5PdcPcufkW/d5H84KmlvW6xvKMWkz7Vq
 2fSIUnIFOnPKlyCoeo45lWkSGn+3ghucieGjVfjLRnmKt5uFL5FSPuDFCLjuSJUVQLb305Dn9so
 GmmUgHE+GxdcBqQLQOmiBZeYSABNr/HHmfDNXZYRSqSgbtSxU2HlZuN0PnxG1O5G0ozLyk3e/pd
 dnKHCfTXGbaG8b8T32Bu6v69xwoGkWmT41iXMMKr233DPjdMwx7y3TaFWX8wORuyJiEJm3rVe6o
 377px+sD6ci7t0mcvXE5iM744Eqkdshau9Mo4mlOC0lp2KhytsX4X5bKLp2PKzVhq/4FmkQoRQC
 ulaktpn7dDMaj2EWCMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033
X-Rspamd-Queue-Id: CFBC447D3AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59748-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d8ed6ef70ecd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


