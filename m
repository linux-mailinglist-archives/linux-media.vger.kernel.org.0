Return-Path: <linux-media+bounces-61677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEZCKIMFB2pNqwIAu9opvQ
	(envelope-from <linux-media+bounces-61677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:37:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F50F54E95A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42B9D31B4770
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C4A480344;
	Fri, 15 May 2026 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUEcEKIb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbHhfIrG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43025480359
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844269; cv=none; b=iJ3+zkmXcrES1AIteS6yDxff8UQ6blBxdEB1eHq/QDFgOgB0B2/JhnZPfaSBLJvKSENnA8R3loCu5DJY9Mfcw93gSgXgvd2jCQqOKq0OgblhJVGoq9VOvKkoz+YghGRUTfSgd/p3ep3kNm6aTxXmFCwxBju32wNWDjSQx6NoZYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844269; c=relaxed/simple;
	bh=8GEDarA6be0j50wNyqgSIad0yj0KaVwLw1xvsnqY7XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EovoDLM+qolHKu0SPiBy7LIF+jJ82/tfZ+2rqRKK/PdI1q3kkZP03/sNPKXUbzHGnJWORAf8b0xYsnhOcaiJ+dNru4zmhzgXO4YyX5QQDPgxFv0QJBsAd0O0mScT17W0XMWFrbH5t4fRNJ/ePkkN+/1cMhE1cBBI0lqpaRGmi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUEcEKIb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbHhfIrG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAX4CE3199809
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9e8SFWKX43j8PfXL3Etp/9LfH7ZQMKBil0enXZsfe8=; b=CUEcEKIbJEi756Hd
	12EA8ts3ZBQGGRCPXbMZ+SAG6xqajTag8sfMjVUdhJ1jWh2dId63yYO0q1MME6n1
	qyz5YyqvwThWkn23xh0rKKPgGn4YbqPEKl6F7OrThPtspqHHWP7LOQ23Q1GajD8J
	ugvF6IzIjt3SVhw7IFfBB0yqNN4/xdugzBXLOJ6nEw8x5p6syX8qduOXHmIr3WOh
	eOaOVWERGZxtzpgafgtalYOcRYkY1zgdXjGnXgDmlhHq0LismBH1UYqkjby3b4kS
	GGIcbgwnYmH2s8zCrPht+CV2caXujMDD/XA7BJdhwSIg9aXToKhtFJAy7lM1+172
	YsIZGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtypw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso12273631a91.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844265; x=1779449065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9e8SFWKX43j8PfXL3Etp/9LfH7ZQMKBil0enXZsfe8=;
        b=LbHhfIrGrkmP09Ke0TIqJlapGZVP6dTxJHNQlw72lbw8EETdhreX+7N7Zt2cRhFsnU
         lah86jcvGObR6uH82u5gAZiXu/Ub/SsS+0Ezqv8vupWbkvqinnf/dcYkB77ASum6GLSX
         kJiyNlOs/GiP4iso6pR96ntRdpA1BvYQ7Rb7c4cDImVDg8q2+9sHSuEL3zLvAKLccztY
         wfwQZiFeWZRhcQUDi5ZNuGa13qvtIm0D2FCQEC2lyHG/hKVJ8aaG3chn3xnzkU0MIm7M
         fSZzisq9hjJgmw+Kx9DOv22RGS9lHhScKbfr8MDVgcwS/joEfUV30a55GD7d4WY5VjAB
         ykPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844265; x=1779449065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9e8SFWKX43j8PfXL3Etp/9LfH7ZQMKBil0enXZsfe8=;
        b=mSUpfJg2ibNxdKtBVPbIiMVU2Gxjj2dWsdAPN5IoFXFqFE20js8w8AIeQs01syrpXM
         +tAw1aJg34ZwNtfaIRCtwPxs1pUkSHoJ5br/WzH1w0/zIEZy+/OqUUgwAcPSu2YmIYNq
         O+nO6s43S4jK1YKVIFG8geZUIBXMHrd+RUq5ekB4uh+3jYxj+WuuSKqfJUWX6uCPPF9p
         ceQzJ2ThbYZ3Ji3lFg2fM/UObDFsEhJcPUZwzOVpoTo1iAcpd4ZZgrK0uvRY9TCN6ePU
         +WzDVc5lsii1pKN3GxioGp4mu5qUldF+OGlgO5ilFeBvj6/zYfmv2/SuVKM72QL1yrNp
         JcJg==
X-Forwarded-Encrypted: i=1; AFNElJ8p826IOVhDa3eGJ6IGh5bj1jo1FXh33StDfwy5fGPCGblYVygTpIenDpeXmuMr9clXtUv4wstzNIzLyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dFos+lFKkX0jBLD57lIeqrFXC9cJD0Un3xzNxuLCee2Q6xS5
	bsFPffLelO9DLBuLNH6yTJ6tL1Ij9/0bQtJe3JjVVakLF/4uHLwQbp9qxLTMoSZyuUTE3Bs37mH
	FDN0YnlHMXKBvXN/CdIq7GwOe8Bfbc5V1+lJB80d2WQJanI7onh90Hx88Hc9r2M5remKzB9KvWQ
	==
X-Gm-Gg: Acq92OGrckDq3zCLxyF/aguyyg8RZnobdWVds6LLzXldIfieZJtSEfQuHDYyHa9+0U0
	boUFeMd9mPRxtKLIyFAs56N55VPM84XCZuszB2awr4KwwyCdFb94Tmww+XDb2TdcKzMbbwFSXzw
	187aM6FaGR8KerjAZ+WuV0S/rtx3zhkf2j8pex49ulcr0RznKmvgsQHZRthdVLrc3RcIBNFznrp
	sBIQxNFJqpfP5gWkCl6wAHC0jkC2rE9ujR6Em0bfyaqnOsr/vAH9NByUhwphQBxE1yIm6WFzyhe
	RgkVJVf+dsY3vMJyCTXRSGAPxEY7jJyO0onOdpg/RpQ6Z4gTKjpZil9Vq6Kr6oFYsczSHRYhgUY
	ahCcyBwWcy92vk2/sHgeliEMEIyIJAsWW87IxBu6dshU3zwkLGdEI8QE=
X-Received: by 2002:a17:90a:fc4d:b0:368:1979:5e8d with SMTP id 98e67ed59e1d1-369519cd892mr3633381a91.2.1778844264679;
        Fri, 15 May 2026 04:24:24 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4d:b0:368:1979:5e8d with SMTP id 98e67ed59e1d1-369519cd892mr3633319a91.2.1778844263916;
        Fri, 15 May 2026 04:24:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:24 +0530
Subject: [PATCH v6 09/14] media: iris: Use power domain type to look up
 pd_devs index
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=22859;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=8GEDarA6be0j50wNyqgSIad0yj0KaVwLw1xvsnqY7XE=;
 b=SS4N+4KmlSyy0NYCaMj2k8ZAjYrQm6+GwmRgLV7D+pdGsDjUf+zU/77XQSeNqQYGgB/uu3qLm
 segocow8hqVARirp0lEhJ+nDz36EE+G09ACxsq2Gh0Qq8zDdZjtrYTl
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a070269 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3jpyDGP9Yv0p6WhxEk8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: xVhPnD97ri7Xc-_pXVs8FVHOgKAw3txk
X-Proofpoint-ORIG-GUID: xVhPnD97ri7Xc-_pXVs8FVHOgKAw3txk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX3IIH6tNhDoQQ
 EarsxUNbjl1f21TSECNzullE7lTViqV6V/2PdZtodKYo6Y/JZZWFAgvLvyVg0nu8nTEhLxdLCSJ
 dtOZ+4a5t9ozXQnIbLSQcXV/mNKYFA7zE0Y2TQzIJLhUNB2VIgSJ58E3Qq22kr17HUxyqMlyGvZ
 /lrlT+yWpJzEKQzbzavJmkRPwjQroB+Crd0y5prACVCeE8XkmfK1iB1PUHhIYc0gpPeFhxe/+J/
 d0gnMHapE3Hc5rBKLFHva7dTsUIOCje0l0XZe7r3ThJERMLpOp78OoRhrdVSVvap04cki0GOBlv
 uTkhxk+IXiCtImWvGcouBeOY5l7+3hkgPkFZ68cUnaj/YoAr2rLmF5PPKrePLQdD/LTdJYDuMfU
 LHnVMUbihoJqqYEzT5UXUx9YkzEq4YZL5TanDUZikaw0z3WQY5AxGjWeZAY8vMc7RLmL7cny6vf
 7jhwI/Mglu7Ip3Vk4Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 3F50F54E95A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61677-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

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

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 18 +++++---
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 24 ++++++----
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
 drivers/media/platform/qcom/iris/iris_resources.c  | 43 +++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
 9 files changed, 115 insertions(+), 71 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 07cc0ce25b84..1d757cb8e9e1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -70,6 +70,12 @@ struct platform_clk_data {
 	const char *clk_name;
 };
 
+struct platform_pd_data {
+	enum platform_pm_domain_type *pd_types;
+	const char * const *pd_names;
+	u32 pd_count;
+};
+
 struct tz_cp_config {
 	u32 cp_start;
 	u32 cp_size;
@@ -270,8 +276,7 @@ struct iris_platform_data {
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
 	unsigned int bw_tbl_dec_size;
-	const char * const *pmdomain_tbl;
-	unsigned int pmdomain_tbl_size;
+	const struct platform_pd_data *pmdomain_tbl;
 	const char * const *opp_pd_tbl;
 	unsigned int opp_pd_tbl_size;
 	const struct platform_clk_data *clk_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 41986af8313b..bcf873829fd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -62,7 +62,17 @@ static const struct icc_info iris_icc_info_vpu2[] = {
 
 static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
 
-static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
+static const struct platform_pd_data iris_pmdomain_table_vpu2 = {
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
 
 static const struct tz_cp_config tz_cp_config_vpu2[] = {
 	{
@@ -80,8 +90,7 @@ const struct iris_platform_data sc7280_data = {
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
 	.bw_tbl_dec = sc7280_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.pmdomain_tbl = &iris_pmdomain_table_vpu2,
 	.opp_pd_tbl = sc7280_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
 	.clk_tbl = sc7280_clk_table,
@@ -111,8 +120,7 @@ const struct iris_platform_data sm8250_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
 	.bw_tbl_dec = sm8250_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.pmdomain_tbl = &iris_pmdomain_table_vpu2,
 	.opp_pd_tbl = sm8250_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
 	.clk_tbl = sm8250_clk_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c249ff827541..8a0f67d1a74a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -72,7 +72,17 @@ static const struct bw_info iris_bw_table_dec_vpu3x[] = {
 	{ ((1920 * 1080) / 256) * 30,  294000 },
 };
 
-static const char * const iris_pmdomain_table_vpu3x[] = { "venus", "vcodec0" };
+static const struct platform_pd_data iris_pmdomain_table_vpu3x = {
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
 
 static const char * const iris_opp_pd_table_vpu3x[] = { "mxc", "mmcx" };
 
@@ -103,8 +113,7 @@ const struct iris_platform_data qcs8300_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.pmdomain_tbl = &iris_pmdomain_table_vpu3x,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
 	.clk_tbl = sm8550_clk_table,
@@ -132,8 +141,7 @@ const struct iris_platform_data sm8550_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.pmdomain_tbl = &iris_pmdomain_table_vpu3x,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
 	.clk_tbl = sm8550_clk_table,
@@ -169,8 +177,7 @@ const struct iris_platform_data sm8650_data = {
 	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.pmdomain_tbl = &iris_pmdomain_table_vpu3x,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
 	.clk_tbl = sm8550_clk_table,
@@ -198,8 +205,7 @@ const struct iris_platform_data sm8750_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.pmdomain_tbl = &iris_pmdomain_table_vpu3x,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
 	.clk_tbl = sm8750_clk_table,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 12596c9a3cbf..3f2fc4e197c2 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -44,8 +44,8 @@ static int iris_init_power_domains(struct iris_core *core)
 	int ret;
 
 	struct dev_pm_domain_attach_data iris_pd_data = {
-		.pd_names = core->iris_platform_data->pmdomain_tbl,
-		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
+		.pd_names = core->iris_platform_data->pmdomain_tbl->pd_names,
+		.num_pd_names = core->iris_platform_data->pmdomain_tbl->pd_count,
 		.pd_flags = PD_FLAG_NO_DEV_LINK,
 	};
 
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..cc61dc038598 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -70,10 +70,42 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
 	return dev_pm_opp_set_opp(dev, opp);
 }
 
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
+static int iris_get_pd_index_by_type(struct iris_core *core, enum platform_pm_domain_type pd_type)
 {
+	const struct platform_pd_data *pd_tbl;
+	u32 i;
+
+	pd_tbl = core->iris_platform_data->pmdomain_tbl;
+
+	for (i = 0; i < pd_tbl->pd_count; i++) {
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
@@ -85,10 +117,17 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
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
index c1355ff74a64..39e9c78c3a69 100644
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
 
@@ -242,7 +241,7 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 err_disable_axi_vcodec_clk:
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 5abd19a3d2f8..541e156d2e87 100644
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
-					      [IRIS_VCODEC_VPP0_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_VPP0_POWER_DOMAIN, hw_mode);
 		if (ret)
 			goto restore_hw_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VCODEC_VPP1_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_VPP1_POWER_DOMAIN, hw_mode);
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
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_VPP1_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core, IRIS_VCODEC_VPP1_POWER_DOMAIN, !hw_mode);
 restore_vpp0_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_VPP0_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core, IRIS_VCODEC_VPP0_POWER_DOMAIN, !hw_mode);
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
-						[IRIS_VCODEC_VPP0_POWER_DOMAIN]);
+		ret = iris_enable_power_domains(core, IRIS_VCODEC_VPP0_POWER_DOMAIN);
 		if (ret)
 			goto disable_vcodec_power_domain;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VCODEC_VPP1_POWER_DOMAIN]);
+		ret = iris_enable_power_domains(core, IRIS_VCODEC_VPP1_POWER_DOMAIN);
 		if (ret)
 			goto disable_vpp0_power_domain;
 	}
@@ -262,14 +252,12 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VCODEC_VPP1_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VCODEC_VPP1_POWER_DOMAIN);
 disable_vpp0_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VCODEC_VPP0_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VCODEC_VPP0_POWER_DOMAIN);
 disable_vcodec_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
@@ -340,14 +328,12 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VCODEC_VPP1_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VCODEC_VPP1_POWER_DOMAIN);
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VCODEC_VPP0_POWER_DOMAIN]);
+		iris_disable_power_domains(core, IRIS_VCODEC_VPP0_POWER_DOMAIN);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 }
 
 static int iris_vpu4x_set_hwmode(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 8b06bd346b83..1dd3eedb58e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -213,15 +213,15 @@ int iris_vpu_power_off_controller(struct iris_core *core)
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
@@ -242,7 +242,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -269,7 +269,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 err_disable_axi_vcodec_clock:
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	return ret;
 }
@@ -278,8 +278,7 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -296,14 +295,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 err_disable_vcodec_clock:
 	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
 
 int iris_vpu_set_hwmode(struct iris_core *core)
 {
-	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
+	return iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
 }
 
 int iris_vpu_switch_to_hwmode(struct iris_core *core)
@@ -368,7 +367,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
 
@@ -379,7 +378,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -402,7 +401,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 err_disable_axi_ctrl_clk:
 	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	return ret;
 }

-- 
2.34.1


