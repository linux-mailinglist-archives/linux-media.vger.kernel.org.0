Return-Path: <linux-media+bounces-60349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MITCeSX+WmB+AIAu9opvQ
	(envelope-from <linux-media+bounces-60349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 852894C7900
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FD093067728
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EA73FFAAE;
	Tue,  5 May 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYQAEKxd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duDheCMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0CC3D0938
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964492; cv=none; b=Om5hxkkLSDDLGLdwt0gmGZaC08tDE1HO4HNKS8L0U+p1t5VhbMtJnlxpThTV0fMZAc0mVo00R4So56wdUgH5AVP0VpwWD80/iRe2iAE4wmA5ZhPVHTbjsvOk+q/yQ3DliIwWqBLpRDg3ho9rClJ9DZe3PoNbtziu3gte25/wR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964492; c=relaxed/simple;
	bh=jNjZAZiQFF7xQOA0ExmeL9uJE+LCJCQU8imR5sq9Yw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF9WqyZo2XNTGzR9b3XpZsXzSglTVMsZd4jTybnThATHCC974GSi0lBL86xQWcBzNNWhDn5/u1+JVSDSlbU4s409GLu8rqSB2qT1v8rPmB2jGViR+TXDMXk8TNmKNkE/kSaecTzFmIpGCWZnBB0m9k/Iz1McKW27jHTr3Fr052E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYQAEKxd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duDheCMz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456M9A83468041
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyFy6Eg/1l/ALrrdXeArv0NcOTcllEzAF/yzKF4ySpE=; b=cYQAEKxdT3D4pYLG
	nlai0Ha68QvGFy/RbwQE+2B4QMmSsRC73fziRCOaPf0EZa/h83uLOST+B7JoXDJD
	iESlfGLv6BxQalLvcucceVSAfHkFJAPKTknP4oypKcLxUgqCQi8z4vBaBC7J4nkv
	7MwASxH1aZux4GjgWYzZU4r4CBE8muTwxYnjd9Z2Q7WRGfGybKfuEymTopn9ggej
	3hoUiXsnJSxRC+6D3AXF49QYS4iWh0j59alco55awbOKWphcFN8uEL+xRs990RWD
	3k2iSJJti5bLxXPZvhFNitybCfLoXtUwbrab9uz22E8W0Unzhwt7Hz3zJDy7y0hP
	6jiu7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtju6cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:01:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36529b265cfso2204676a91.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964489; x=1778569289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyFy6Eg/1l/ALrrdXeArv0NcOTcllEzAF/yzKF4ySpE=;
        b=duDheCMzxx1yUNJWdEFJiHH23RPP1k+LLV2IpDbjzBrUZgqp60s4d1wU5NxPiaBe5Y
         ZXkBQWideQhz29FxWnvUviTmQeQO/eXDsgqrKIsBl5VTuJSZaEmMCv7jjv9xkVrrUjr0
         LWOihn94q99BmI03sCkTZtn4AdyeUIrKM8uzbZOczsruK7FJ4KA16L/FU7De4DlWZQPr
         8YkDICSmb15giNC8O13NmLjcHGKO8Zs98NnRTYogNZicsCyRvwSMA8c3udjcSANP4NNA
         9PAWgckTc6ufsBt9Fe2RqAlTPyJFrr9K//Q5ynLMTYwPRZtnx1rxVgjZdeuFCVvxdz0u
         dPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964489; x=1778569289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyFy6Eg/1l/ALrrdXeArv0NcOTcllEzAF/yzKF4ySpE=;
        b=UXJB971AIZrW4eicjWQJ0MlKw+dt51t+cdtLd6KR3fYdcZfLWOeixxejCixz9xmqIP
         d2cRq7usJJ8VOD2VQ+j6IypCAYDPUpmLDuHKLW7M2MpTNb84jLnGZUuu6Uq/zqMsnOFo
         4/3af6WuYhSVJjjGCTnqporVkPLSA4oqggEya5rMkvJwWRcZqFijPEOhhkUzDMRwyE9S
         p6jB//QKvZxrpdS9SmMSAMo8sFtWjJCjhezgNItfqJmSrRSKdpgIgfpZPKnjxyOV8i9B
         Gb6WNYhbsAzTnWCvWvFVgjXcQRhUfXUSfWRyH8viEBc4Z3jw7spqb/rHM3P/2AgEFPY4
         4wwA==
X-Gm-Message-State: AOJu0YwMUiNAsy6Rp4yuXHieuyGBOO/E07nkD0l5LYD6IfmYO594dJwe
	gqOUrAgh/fSHB3cK2ssp7d9QTuGxg76nO8jRcNIFlxcjgAFUHrAwifESYm9pZvNvdC9SdjwSBED
	kvsfl/FsqDIPkB0y1277PCVj9IleuraR3kUVWdFXi+ZLqeF6LmFmLDf9EDbKuynH8BRBzJHg94w
	==
X-Gm-Gg: AeBDietrUKnpn6cfc34N45BLGY7D4zmbFhfUQCGN9DWsjb9vummh2FizUmAQ2xEUy7l
	6LA1iYqPphuK1owq1p9i/DZzqzNuselyWG/NksgbVPes6JzydR1PbV8PYpyj4yRS6naetijREWT
	nwtEpGZg+BtSzxbinrBW3UypNwOjca5iVG3CMudEYqhy2qdocYxYfqatvpoT845YxQiroQIp78L
	kVoFyYpF3Tz0rOERfIOnLU8GoP8CaNLIxstPu/rxVsgpS3YYNi/Q9mmslNGa4as/1n9Ph2RWj3O
	mKHVrzzUJRAf4gIdXivmtjqxoNJLXdwFH72RzVIDZUiRSAxheYbJfiKWyGnR9tBW89utPx/NCtW
	eP3sJESZ7b+f8leReeZV+j1BNrqcUSryB9caYFIrBSgS0kfGXqfAaqwTrzIioXlAalw==
X-Received: by 2002:a17:90b:2892:b0:35e:27ec:de0 with SMTP id 98e67ed59e1d1-3657747c4f2mr2008270a91.13.1777964489078;
        Tue, 05 May 2026 00:01:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2892:b0:35e:27ec:de0 with SMTP id 98e67ed59e1d1-3657747c4f2mr2008221a91.13.1777964488403;
        Tue, 05 May 2026 00:01:28 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:27 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:30 +0530
Subject: [PATCH v4 09/13] media: iris: Use power domain type to look up
 pd_devs index
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-9-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=22664;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=jNjZAZiQFF7xQOA0ExmeL9uJE+LCJCQU8imR5sq9Yw8=;
 b=x8ZK+7rjoOJHym/dq5i0ld/Put39teoGZehcJ1Bo83MWMeMCyzI7+QLLIlNH7Pis9O6VPqZGL
 PFOadtIqtQWDWtv8sZHKgisW2RzwX05rbGZ7OA5TKy0+YrrCNepYvvC
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: -lSi-_bbASQon2WPhrb1e2XCeQv8A4pv
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f995ca cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3jpyDGP9Yv0p6WhxEk8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX2SYl0XNe9shQ
 huFOCKEhFGfYteN+MyPertGZiBAO4RWI1CDIfXFtmTsBt3q97ln4cy/jEcWz5ByjDlKGekdL2Gj
 tvfGF3zmSUN/Uq32yDu0ylyMzNw8qIGHSvdbQulMrbMae6IPYpUvVcd0gATgu58Tp9YQiEDmO3X
 +ruRlL2941wuE2RJYRfEAaAqohMr/L1SfewBt5nr+Gfxdwora+ZsjrYU5Xl1J2wft+C/GmilEKp
 lxwcnsc9HrKQu1leZIscv1mDyrNufff7qUhTO0P4ekxl1gJP+3Ck0JZhHtSRRkC+nOkDbV69mx0
 snqKQDvYovR3f+18fiRaqGVAKcAarwdBFy9Xyv/zkFEXbQYrj/RxU8uJ1MFzK9d/UQecG1AWjFy
 8Q6x34+wDjtLg7vGUDuyQwlLJxVu4QPKniKedTX+46hETFP99yvpPmyNBdeaCxXFRYg3EtaseZx
 PNupvPIj4Y9NELtb41w==
X-Proofpoint-ORIG-GUID: -lSi-_bbASQon2WPhrb1e2XCeQv8A4pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050063
X-Rspamd-Queue-Id: 852894C7900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60349-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
 9 files changed, 116 insertions(+), 71 deletions(-)

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
index 834194cb5513..13fbb21c2182 100644
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
 err_disable_axi_clk:
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_VCODEC_POWER_DOMAIN);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 92c0b06bbbff..bf7ad4e7cb8a 100644
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
@@ -262,14 +252,12 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
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
@@ -340,14 +328,12 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
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
 
 static int iris_vpu4x_set_hwmode(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 73c094bc4311..2593c04decb0 100644
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
 
@@ -297,14 +296,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 err_disable_hw_clock:
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
@@ -369,7 +368,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
 
@@ -380,7 +379,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 	if (ret)
 		return ret;
 
@@ -403,7 +402,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 err_disable_axi1_clk:
 	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domains(core, IRIS_CTRL_POWER_DOMAIN);
 
 	return ret;
 }

-- 
2.34.1


