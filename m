Return-Path: <linux-media+bounces-59752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN7EDvow8GltPgEAu9opvQ
	(envelope-from <linux-media+bounces-59752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:00:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E147D47F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B274D3032A46
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43133EB1B;
	Tue, 28 Apr 2026 03:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALUARuu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkPuhpMM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026EB33D6C1
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348616; cv=none; b=Q+V+8C3Sfz7jD7WARjdp7pSmh1OyTRluJRvqYtzrl9GB+LWn0tFXm6abPPcyiqZZltr5pTO9oTCxlm4nmDegy0TyuA/Y+ul80AvzlLZ1nLtAKZdZvO1uvd1l1Zbx/b/iVTvJJIbGZ9bphYWawM7s05E8oHR5s9cKoN5Le5UIduo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348616; c=relaxed/simple;
	bh=snCiGYnE5lR7k11Sd8HZYZBUpIgzZpSwTWZQd9WBf78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrF7aZQ+kj8brMzsSoNkytgNpF7Bt2iodXKPOd3xTRv5E8sRSnp6r89mQ8XYkpIN+D1otEvlrAhkrLaFjGnbp48HJaBlbaVJuC1UibO4pe3BmLelQpDfZacAzaz9rOlCsOio4y56EVXYQpO8NTOkjoFLpTOTu+TDuJiZu1NXz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALUARuu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkPuhpMM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RMTxlo1627362
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B78CjQBbuZjRK4uBze+IvM6DTXnaPD6tJ8oMVVcOAus=; b=ALUARuu9jztmqYeA
	QHQtFcmliuVREQU+RpnhyNfq5CbiKsszAaJ9Z40RKSErktNDffrLgmUXSkWZr890
	R/IBk/zC/zOOvknEroopXDeQaVryfB6Xs8gd74+jD4evIrIlIJJZarpEiyW/MS9n
	njPvySq+yFBYySJclFDBhgs7tqjz4ya1OLDYXTFaGoE1odyho7UOFLrjzubvbd1h
	dWnC4RUlfeGdrOlt5z1+6D9gjeOawOfkhGGBpY6LHVaQvgpDUZ1hnF7Jx88RSLMv
	A3EyUzMzABDg/NulgfTQLlkhHRAMvGFhK4EGCF0JEVpBe0NHZT2SEUXRvQr4rAoq
	CUtRtA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgms91ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3568090851aso25976866a91.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348614; x=1777953414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B78CjQBbuZjRK4uBze+IvM6DTXnaPD6tJ8oMVVcOAus=;
        b=VkPuhpMMl1ZNy45NbMg85aMxHUEjGg4y9zKsy4TrIPHSfjgUBYH0jMrMVmE7l/ehFu
         9jJM78kxRXOpRXLFS9bQzEh8h+H7u6PBtPuoIVy7Kz3YjfgrHLatamb+96V36cN0ynty
         XxCpL/Ur3FVI1VSTN5RusOe9H3TdnyNgPf7l1KCiUeVYNV/NH5Abb36tmP331CziC3WC
         N9Je0a6Woj1zTeX8QkNv3fR0htwqFBdGp4GWDzghtzuzFnnwodVkn7Z6BBjqfGBBUjld
         I0b3EaajXQhhUzHcD9F0kv+8Gbfr2Te7uniUMPz8L4ubl9wIkrcEcPWMgSirvVjFrWYH
         BM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348614; x=1777953414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B78CjQBbuZjRK4uBze+IvM6DTXnaPD6tJ8oMVVcOAus=;
        b=ltYZQfOylwvAv+6jEoOPSmZvvupNdwQMluzJNVbxCFZU0wF8F57+9x0RwNDfv5oOcd
         piNCUGRdKq2oi/oySqrfelqUmdeJK0ryYBm10FX8f6rWOMuY6iP96l8QOiNxuh9civ7k
         tFL56ihYFy2+kAY2DA/YRgJ36sDjWcaiZ8kcs1voFoaM5KK2/A+IS0FQ/brnW6goq7OI
         /mbbGA48ESB9mdaGKk9K1sLrX3zX1/A1NxDEjZhL7L7RT/+GLYNFLcQzyuUaShBGFY6b
         lUomdpNETAt/KMIsVJC/Z8e6hwX6hvTtlaIlFXRxZmQoMZlWIsuHHWWnx64ew+HN8ww0
         vMJw==
X-Gm-Message-State: AOJu0YxRCOnMywg2AE8q5OXt09G1ObSgd0Qc6bOlUUnpVv8Ht+5QxZ8y
	EiGDyfO/UynePamZTgQIzvi0Bw/6dPM9RI2guGpHkwpUIFjv6QGPR92hVDEDT43BiRFx5YxL60M
	HD6zb/rvqXmkGT4r53hFRNbJaIBaEPyS00v3g/JQxU1zp6JqX5hdsyURppywx3OYZtQ==
X-Gm-Gg: AeBDiesdC29xpEM21t65NGATtM+jx8MIjMQUrUI4t1Fo7p6xjUENGd/PNAD/nyPuICv
	E5PNIci3BHTbnjSonER6As5FoNbplT8zToC0VXWEQeSuda/9t6YzHPA1GOIFMBaY6nMvfRsK6r+
	X7y2t1Q1tqFVXaie7gxk9LVY+q1/F78NV5hzRx1CJv/UxDuP7FnFVtjuUTCZTTu8R/1qKcQUrfX
	yJi4gNHinG5xDgfdrflZ9pdCrB5uvIChdzxt2XpQOyvzKpcSeGsxahRsATKwg+3s9x01zQ39Rwh
	tQq/tpdLwDcn3NKiPpsqT46Mc9Y9HtCeRmJ2sbMpYrTIHjZrDyn3Nzkzwv4lZv+EwNxVuLHXxnZ
	7RqywBweKdvciqu8LiEfjltQfrdTZvyHlS+YPwnkCM2eJhqaQUvqGwHZAxh80HjLGPA==
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-3649205a55emr1476573a91.20.1777348613378;
        Mon, 27 Apr 2026 20:56:53 -0700 (PDT)
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-3649205a55emr1476549a91.20.1777348612837;
        Mon, 27 Apr 2026 20:56:52 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:14 +0530
Subject: [PATCH v3 08/12] media: iris: Use power domain type to look up
 pd_devs index
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-8-8f28930f47d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=23045;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=snCiGYnE5lR7k11Sd8HZYZBUpIgzZpSwTWZQd9WBf78=;
 b=oJjWfLUbgg8n7VTOXJCpIuvTetYxDw3TUBom9Rsz07QuVihPN47ewOcpgjM/QwO2gDcRNKHJ5
 gByda4hXj9tBPPecmsJ0ySZQlC/qTa0GlL0Eh7IWOC/c1VkyJLLobf4
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: g50FHu1LMzcWb66_OBuKG6jh-iUjMmdR
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f03006 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3jpyDGP9Yv0p6WhxEk8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX8hYoTtMO1mhG
 yjCWHQTicdwki3CUjiqdQpen5GRSf7/DegEq05Ewh4NqyuaoiyaJu0odkDrQLMPChgTZy9YHZf5
 ++gUt/3L7JUP/Q4oD+QISksFEHl7O6eMTxCvencXZHRkF7tDiwoCdDA6r2Cjvi1JfMp5tC+g2il
 T6J9jh7J5yCGbZvybC8wCYHGrFTdO4ApYjnHjGIEpfpRbsTEGH12/iuSzH2k67CDpVJTTrhG8YJ
 K8VKc8s8IAm6wwDU38GtEhbmjcQCvlqUakcdjYdUGDZzqziN8daay9OuBIfc7ZR4u0A04B/LaqL
 j1j6v8DgOUGXLzEpJSUqxDH8y2EzGYITJZt5dquQUTNv0Rq0pnX7aVxneYtMjaHo0WM4VK8k8zT
 QHZboteogyh3LtPWFQDbXxIQPcig9sWXE6klr34wTiF1UtrhcBXSsdfhWNonWmU5nEcP0kUywjU
 J9zHIvlBwgHNu6WQkMQ==
X-Proofpoint-ORIG-GUID: g50FHu1LMzcWb66_OBuKG6jh-iUjMmdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280033
X-Rspamd-Queue-Id: 089E147D47F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59752-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

The pmdomain_tbl was a array of strings holding only the power domain
names. Callers had to pass a pd_devs[] pointer indexed directly by the
platform_pm_domain_type enum value to iris_enable_power_domains() and
iris_disable_power_domains().

A future platform may need to introduce a new enum value that aliases
an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption
that enum values map 1:1 to pd_devs[] indices.

To fix this, replace the string array with a new struct platform_pd_data
that pairs each power domain name with its platform_pm_domain_type. Add
a helper iris_get_pd_index_by_type() that walks this table and returns
the correct pd_devs[] index for a given type.

Update iris_enable_power_domains() and iris_disable_power_domains()
to accept a platform_pm_domain_type instead of a struct device pointer.
They now call the helper internally to resolve the index, removing the
need for callers to do the index lookup themselves.

This prepares the driver for adding new platforms where power domain enum
values cannot be used directly as pd_devs[] indices.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++---
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++----
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
 drivers/media/platform/qcom/iris/iris_resources.c  | 44 +++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 ++--
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
 9 files changed, 117 insertions(+), 72 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 30e9d4d288c6..7d59e6364e9d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -212,6 +212,12 @@ enum platform_pm_domain_type {
 	IRIS_APV_HW_POWER_DOMAIN,
 };
 
+struct platform_pd_data {
+	enum platform_pm_domain_type *pd_types;
+	const char **pd_names;
+	u32 pd_count;
+};
+
 struct iris_platform_data {
 	void (*init_hfi_command_ops)(struct iris_core *core);
 	void (*init_hfi_response_ops)(struct iris_core *core);
@@ -225,8 +231,7 @@ struct iris_platform_data {
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
 	unsigned int bw_tbl_dec_size;
-	const char * const *pmdomain_tbl;
-	unsigned int pmdomain_tbl_size;
+	const struct platform_pd_data *pmdomain_tbl;
 	const char * const *opp_pd_tbl;
 	unsigned int opp_pd_tbl_size;
 	const struct platform_clk_data *clk_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index be6a631f8ede..0ec73783bc10 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -279,7 +279,17 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 	{ ((1920 * 1080) / 256) * 30,  416000 },
 };
 
-static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
+static const struct platform_pd_data sm8250_pmdomain_table = {
+	.pd_types = (enum platform_pm_domain_type []) {
+		IRIS_CTRL_POWER_DOMAIN,
+		IRIS_VCODEC_POWER_DOMAIN,
+	},
+	.pd_names = (const char *[]) {
+		"venus",
+		"vcodec0",
+	},
+	.pd_count = 2,
+};
 
 static const char * const sm8250_opp_pd_table[] = { "mx" };
 
@@ -350,8 +360,7 @@ const struct iris_platform_data sm8250_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
 	.bw_tbl_dec = sm8250_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
-	.pmdomain_tbl = sm8250_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.pmdomain_tbl = &sm8250_pmdomain_table,
 	.opp_pd_tbl = sm8250_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
 	.clk_tbl = sm8250_clk_table,
@@ -403,8 +412,7 @@ const struct iris_platform_data sc7280_data = {
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
-	.pmdomain_tbl = sm8250_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.pmdomain_tbl = &sm8250_pmdomain_table,
 	.opp_pd_tbl = sc7280_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
 	.clk_tbl = sc7280_clk_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 47c6b650f0b4..5862c89a4971 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -775,7 +775,17 @@ static const struct bw_info sm8550_bw_table_dec[] = {
 	{ ((1920 * 1080) / 256) * 30,  294000 },
 };
 
-static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
+static const struct platform_pd_data sm8550_pmdomain_table = {
+	.pd_types = (enum platform_pm_domain_type []) {
+		IRIS_CTRL_POWER_DOMAIN,
+		IRIS_VCODEC_POWER_DOMAIN,
+	},
+	.pd_names = (const char *[]) {
+		"venus",
+		"vcodec0",
+	},
+	.pd_count = 2,
+};
 
 static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
 
@@ -934,8 +944,7 @@ const struct iris_platform_data sm8550_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = sm8550_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.pmdomain_tbl = &sm8550_pmdomain_table,
 	.opp_pd_tbl = sm8550_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
@@ -1039,8 +1048,7 @@ const struct iris_platform_data sm8650_data = {
 	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
 	.bw_tbl_dec = sm8550_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.pmdomain_tbl = &sm8550_pmdomain_table,
 	.opp_pd_tbl = sm8550_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
@@ -1135,8 +1143,7 @@ const struct iris_platform_data sm8750_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
 	.bw_tbl_dec = sm8550_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.pmdomain_tbl = &sm8550_pmdomain_table,
 	.opp_pd_tbl = sm8550_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8750_clk_table,
@@ -1235,8 +1242,7 @@ const struct iris_platform_data qcs8300_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = sm8550_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.pmdomain_tbl = &sm8550_pmdomain_table,
 	.opp_pd_tbl = sm8550_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 34751912f871..34c981be9bc1 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -43,8 +43,8 @@ static int iris_init_power_domains(struct iris_core *core)
 	int ret;
 
 	struct dev_pm_domain_attach_data iris_pd_data = {
-		.pd_names = core->iris_platform_data->pmdomain_tbl,
-		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
+		.pd_names = core->iris_platform_data->pmdomain_tbl->pd_names,
+		.num_pd_names = core->iris_platform_data->pmdomain_tbl->pd_count,
 		.pd_flags = PD_FLAG_NO_DEV_LINK,
 	};
 
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..ae27488579d7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -70,10 +70,43 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
 	return dev_pm_opp_set_opp(dev, opp);
 }
 
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
+static int iris_get_pd_index_by_type(struct iris_core *core, enum platform_pm_domain_type pd_type)
 {
+	const struct platform_pd_data *pd_tbl;
+	u32 pd_count, i;
+
+	pd_tbl = core->iris_platform_data->pmdomain_tbl;
+	pd_count = core->iris_platform_data->pmdomain_tbl->pd_count;
+
+	for (i = 0; i < pd_count; i++) {
+		if (pd_tbl->pd_types[i] == pd_type)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int iris_genpd_set_hwmode(struct iris_core *core, enum platform_pm_domain_type pd_type, bool hwmode)
+{
+	int pd_index = iris_get_pd_index_by_type(core, pd_type);
+
+	if (pd_index < 0)
+		return pd_index;
+
+	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[pd_index], hwmode);
+}
+
+int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
+{
+	int pd_index = iris_get_pd_index_by_type(core, pd_type);
+	struct device *pd_dev;
 	int ret;
 
+	if (pd_index < 0)
+		return pd_index;
+
+	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
+
 	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		return ret;
@@ -85,10 +118,17 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	return ret;
 }
 
-int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
+int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
 {
+	int pd_index = iris_get_pd_index_by_type(core, pd_type);
+	struct device *pd_dev;
 	int ret;
 
+	if (pd_index < 0)
+		return pd_index;
+
+	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
+
 	ret = iris_opp_set_rate(core->dev, 0);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db0..d5692e4694b1 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -9,11 +9,13 @@
 struct iris_core;
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq);
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
-int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
+int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type);
+int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type);
 int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+int iris_genpd_set_hwmode(struct iris_core *core, enum platform_pm_domain_type pd_type,
+			  bool hwmode);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 1f0a3a47d87f..a9f43dbfc695 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -208,7 +208,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 
 disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 
 	return 0;
@@ -218,8 +218,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -235,7 +234,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_hw_free_clk;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
 	if (ret)
 		goto err_disable_hw_clk;
 
@@ -248,7 +247,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 err_disable_axi_clk:
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 4082d331d2f3..7b8922d8aec7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -27,28 +27,24 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 {
 	int ret;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
-				      hw_mode);
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, hw_mode);
 	if (ret)
 		return ret;
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core, IRIS_VPP0_HW_POWER_DOMAIN, hw_mode);
 		if (ret)
 			goto restore_hw_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core, IRIS_VPP1_HW_POWER_DOMAIN, hw_mode);
 		if (ret)
 			goto restore_vpp0_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core, IRIS_APV_HW_POWER_DOMAIN, hw_mode);
 		if (ret)
 			goto restore_vpp1_domain_mode;
 	}
@@ -57,14 +53,12 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 
 restore_vpp1_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core, IRIS_VPP1_HW_POWER_DOMAIN, !hw_mode);
 restore_vpp0_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core, IRIS_VPP0_HW_POWER_DOMAIN, !hw_mode);
 restore_hw_domain_mode:
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
+	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, !hw_mode);
 
 	return ret;
 }
@@ -73,8 +67,7 @@ static int iris_vpu4x_power_on_apv(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -85,7 +78,7 @@ static int iris_vpu4x_power_on_apv(struct iris_core *core)
 	return 0;
 
 disable_apv_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
 
 	return ret;
 }
@@ -140,7 +133,7 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
 
 disable_clocks_and_power:
 	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_APV_HW_POWER_DOMAIN);
 }
 
 static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
@@ -227,21 +220,18 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 	int ret;
 
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		ret = iris_enable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
 		if (ret)
 			goto disable_hw_power_domain;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		ret = iris_enable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
 		if (ret)
 			goto disable_vpp0_power_domain;
 	}
@@ -273,14 +263,12 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
 disable_vpp0_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
 disable_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
@@ -351,14 +339,12 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VPP1_HW_POWER_DOMAIN);
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VPP0_HW_POWER_DOMAIN);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 }
 
 const struct vpu_ops iris_vpu4x_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 006fd3ffc752..74b4dccd6a66 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -214,15 +214,15 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	return 0;
 }
 
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 }
@@ -243,7 +243,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -270,7 +270,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 err_disable_axi_clock:
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	return ret;
 }
@@ -279,8 +279,7 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -292,7 +291,7 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
 	if (ret)
 		goto err_disable_hw_ahb_clock;
 
@@ -303,7 +302,7 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
@@ -365,7 +364,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
 
@@ -376,7 +375,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -399,7 +398,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 err_disable_axi1_clk:
 	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	return ret;
 }

-- 
2.34.1


