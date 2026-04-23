Return-Path: <linux-media+bounces-59416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNq7BHYh6mnKuwIAu9opvQ
	(envelope-from <linux-media+bounces-59416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:41:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16359453239
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8C483066351
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32802D877D;
	Thu, 23 Apr 2026 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MX8sGrcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ce6Rp88s"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86EB2D6E66
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951075; cv=none; b=blHowwb9VlFDeunchvepyFlmryN6KIp/esZT6x+3+ub4ftQZBeJxKGc1NbIM6bRpTIy6bXp+6D7z4bHN/glgqKWD8wos5/cdJ/G3pCbi103ls8XAqNFTAIGN0TMnD/ipGtEk/2uJvCfIvL0SKFJf+CNjee3cQHkGMyiHUJn3KtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951075; c=relaxed/simple;
	bh=snCiGYnE5lR7k11Sd8HZYZBUpIgzZpSwTWZQd9WBf78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPvux2FvnR3L+ZJilMEme+fWVyFO8JQgR+Zo/16aY4YLa8w6Wkv3v3j6AUX2U+YCUF/og+2/0YUOEQjFezE6/nra9e4bAhvkLSn08cn1pg7w609a2Xsvr9x9yjFwHCICWYbgsdRIIVHFMqrOjjAuTtcWvQW65pm7kAFzf2b2crg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MX8sGrcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ce6Rp88s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uMdf987888
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B78CjQBbuZjRK4uBze+IvM6DTXnaPD6tJ8oMVVcOAus=; b=MX8sGrcqJf8loBNi
	Ak3CGBtYIZVxyMmFQ1qWiNGwut0aag948vpuYEmcD+h7bJxA8rM4URpcbUFDh3Pn
	4TCi8FCaeqvG+B+jaL9ud+NnvWV/aeIhbw9HpVReK95qf7pv/rbdtLutGZzG+/BP
	UDU9T1r6dEwWR5EM3rrSVWRfnWDZwXYk+kQ2xfxJJt/3pPrE1IeHfuGJQeTLTxxP
	b881haxJfiMRClhRry3QKsE5qbglSrFIsl0dIta7IQHRZam4ksYGp1fwsiR37p7X
	UU5SkYlYpoLKDckxoyv1kHMTZnzIJa4WJZWcnp9jVvaDvFda2OwOMWGOhXE0nnfU
	ndfSPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q45ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7a77b8ec9so6861325ad.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951071; x=1777555871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B78CjQBbuZjRK4uBze+IvM6DTXnaPD6tJ8oMVVcOAus=;
        b=Ce6Rp88se+LE+Mns3k4v3ocKiMeUdmFSSZpgKbln/5g9vGEQTTu9cveKanG+VtUSpn
         Ab8bbmflkmk+VcCABqDlQ3JFzPkByfCcRzqtZA1Tr2G1CPWcVyY81zYF4G7xSLLxl/6v
         TiPHmM5W3DrdXtRwr9AXoUrZq8/taEuIpnZxDLykCY3XFw8LocfMZPKMe6myurZsEOw4
         RdF3rXOBeOmzec9laKRQ21ITVZTQDSbuKg2x6zDBSw0kqXv7NEMKZUSgB4tXDOsgL88o
         kaydIObTRmwqABlXh8oHr1snLuD5OU/0akOy96SpegY3FVTvMJUIJ9PffWTDuxNzOdle
         u31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951071; x=1777555871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B78CjQBbuZjRK4uBze+IvM6DTXnaPD6tJ8oMVVcOAus=;
        b=FP77OlWkCC1YNFhhLbP0JwR4Lz3Fjtd7wG4RsntvoiZqJwsfdIS3S7SbmGHWLrZ0D1
         SNBxhc6D7jRL6bBoh9UhkqpeSyv60YlrotdUNAYq6AR7DQUkmPRsgD1qTcz06BHMbgo4
         QmTqoav+K6WF366S8vf7lpiqRTij/HbK7BptJ/uep1Ct7HIFV//2nSszaXHqMYPpB0gq
         LGdbMkZNbQClq4wtPs8zrwp3eRV7/CtTK+MxRhilcXZ8/y1RptpnEC8WG+qVfEmMhVk8
         BmUIuSXx1ywxSZVxL8Zy3c3las05Mz50q5wMvJuQCZRD+SvUg14nkq8fojHEeBLpRws1
         0sVQ==
X-Gm-Message-State: AOJu0Ywu/vY8nTMIQ0+JK1tfvgRzVVkWCTM6/dc4mEkNFFMwLB0iGJkm
	q1WVf6B8HQ6GxGvJICx98J726RLOpmRluZ3rRU1t69Q+eVjzbAc7BcNphr9HWjVFd4z4zKIg168
	4WMsRpaQt9xk1+rULlKuQ5bWhdRCfl5T0dRa9JNShVP5nt5GZBEwO91svfqlznhkOBQ==
X-Gm-Gg: AeBDiesj7NeyxtsRryO8YhA+mYvNeAManG+CBfGvbXiIBpwqDWpEZ6v2ILSEGEGlo6s
	z/wvcsUW2SLDPsDB+Qc8jST8yOjfADbw3ecu3MJ7HB8CHMQcXrrqKLnccOvgXWQhcWRkuYZmrg0
	Pv8uq7Zra8olINAEa9k3hYX1TN72n3xKQQXDoksg4r1IxAx2Lb0tInxM7Yja70ahSvk0ASOtRIf
	73blviBYbl3vhIcbQHHBA+zTjCJ8zdj8RPvtP0vmyGM0mI193aGorfCDx81cZrMTK7mQ7dI1vQ+
	wvYyuA7fHBgefMk1czBdzvO634h2x4EXJo9MJTCWj+wS/LF9SgUQ4IxgGK3OST1yDckgql6iumO
	BAPa6P7JjuaVI8kF4YrFLdRD33RRh237Rjo7SAs+WZdEdwpHaAcNk+XacqRZW4WbZ5Q==
X-Received: by 2002:a17:902:b946:b0:2b4:63bf:5535 with SMTP id d9443c01a7336-2b5f9f53480mr168745555ad.41.1776951070345;
        Thu, 23 Apr 2026 06:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:b946:b0:2b4:63bf:5535 with SMTP id d9443c01a7336-2b5f9f53480mr168744695ad.41.1776951069423;
        Thu, 23 Apr 2026 06:31:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:08 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:37 +0530
Subject: [PATCH v2 08/13] media: iris: Use power domain type to look up
 pd_devs index
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-8-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=23045;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=snCiGYnE5lR7k11Sd8HZYZBUpIgzZpSwTWZQd9WBf78=;
 b=pGyp064lgiKzU7aaLuO6hn1B6gZtziER1XyFZ5rtaSBdVqLv2bijg47KbU3J0iQwVzuE3dPlT
 RyqvuxQJIjsALVpa8mE8yckSaoF063plyk+NtK3Ki9M8r4FucM7Datx
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea1f1f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3jpyDGP9Yv0p6WhxEk8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: WsBVYMH7iiZHXoWBBKSeKx-CLTe8-GRv
X-Proofpoint-ORIG-GUID: WsBVYMH7iiZHXoWBBKSeKx-CLTe8-GRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfXwj0uH1RjFSkL
 /wBmf/+qV6HAH12AZQvnSXrV/Ex/mriFZ7JE6WR9cWcxH34VX7FJ1NMlCn9ZAXilCEb5PEtvFbK
 p44K8hhNJUJTurqvHho6tNe1lKA+Yo477X3nlx1U9ySipklvzmw/re3Bjda5teW6HQhoxu6zEQb
 hzITO9daFgcYUtDC/3oims6/Cmv3Nsgvb8uH6v8Q0/4HQHaCxf7+jQZh/oAiza7GBeARgagHzFv
 UqN6tUac9e9b7rAQBtqOkVBJiqK/Kb3lmA0FfHaY+lNyhEX8tHTIHT0CcjL08wnheA7xvcQasw2
 Bj7UmWnCySFteNmNWvIawSbpc6gOP46BBQxL++dm3nroFs2cVSvYN1eLUYrb8iHOoEyRUM+wgjy
 p6h59uR9Jkgh2sFTFzl/msIbuFg6DKsegUVujmJZk+GhfKjf1sDWrH63fIZ9VPFcsVyqo44g9Gl
 LeAKO+MulgAocH3SSKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59416-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[104.64.211.4:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16359453239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


