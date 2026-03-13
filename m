Return-Path: <linux-media+bounces-55779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DcRI/xvtGm2oAAAu9opvQ
	(envelope-from <linux-media+bounces-55779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:13:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D74289971
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C86D53039310
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6A3E3D8D;
	Fri, 13 Mar 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozKaNNc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrhABmxf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B053E3C53
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432781; cv=none; b=i/0sTIkeP0PLnZyt3244ma/bUKVf+fZg6wt/S2NVy+TuQjy2t+KJsMpeOepCyRkoBUtz1YEyLdmcAlrRkYuTnII4nOgs5lZ8dHZ3rNmJR/sCHX+LUVcBCBmdJJAQRw/tyHoHw+WrRSsnvWDlQg+mOk0R5IiUntNSXsgRK4E3MSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432781; c=relaxed/simple;
	bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/p3LQBrLato/Rgs4KK/9TCO2haODdwW80h0x7HaSncmRfcHnZ5i9VXlMbjZM0ivMBVqrTdoKYPCBSOGrO3mPzLUZJCYy35o9WiVS8mALka18nLvzswXTyCxe5atyCY5ln1XSRmUCWS0p1RZXCcJwmGnsMQQ0ghq9Q1yQaD5riA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozKaNNc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrhABmxf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DGCDmn481549
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=; b=ozKaNNc3lDWBpoTG
	4TUUJul+Y2f99sWd61COriFvdLosF5Y+8Sn2kPOQLV1+CP2vu4JGiTzi8PeX9Aaq
	3u5M4LFpUxZFZStIps7hFmT2Z9HMSezZfzUrLw4aCgR8wc9UK0zta6qHlEkiRhO2
	atyAu011SCPPw8XaSLybfu149aKkO8uuu04BDeGRgUjpfpnASaxE/wXrYM6NuzMs
	SFuMXQaOS3zBQJTR2Vb5l1svACAbG+lwMuyLEapzJleB8NxMbDHrQb6Jji4bFMFD
	FBKibUClx4MZEeR1uqOsOp4Gb5rSFRIP5AA5sRxUClsJ6xw78Ldht/CXk+4wegu8
	1aDxfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7tbtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:12:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso2525760585a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773432778; x=1774037578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=YrhABmxfsCMjF6MrFv1GHtOejZ8pXmlwkKibpcQEzwCtAAPweuAg8eknYluWQ9YQVr
         DabiyegY1iYVWyZefgIvVcADkYx/OMjmTWW/NKju6nDHN9Y1zOgztjbm0mQBFKY6E30r
         Od65RQJaEiVIm4gQclZZp0JHzVRRU9nNiy3N17OMZEAnkzFES4B7RhT2jOyx4Lmxhltl
         id4rPUxwKJoROFOihOJqPB89kSJ33K0wjtrZrDT70EeQrRwS/6oA4MwlbOAtbD9sUCIy
         3kQG45Bx4jeqEyGppFe8M7oNYvZWWSQk2hY+555w/NdvyVIaHXxwS6PkmmOrRNQlJX13
         OX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773432778; x=1774037578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=lZeeK//+XI2dAk+mdPitAMLNdPUoIVjkxBdsMqyy8aQ7PsmS/bfCTb8s73LL1Ziw9I
         IMTGSvxtIhcCpRzI4xOUZrgceTwfAB9bKqI92NsQgV4QRkSHR1FhmXqRSBKIC2G1ndsK
         jRtZ/ESIhQx+1PJMajHwraDopL2ccLd+jzqztBVpL2pvJsMUJVzhudxQY2XsLSfSEFjg
         aC6C/VUq78tJ1yyyxeEDIO2gc6wKm6BeKn7eTMpEHfCeK9p1mg6OERR7wCeb+aWFOgrQ
         chZjHO02TTH4dLg7tfjzBVt+Fw6IGPqrOy3KYksewImQEeEvogb+vr5JL190aL6memsc
         l6Lg==
X-Gm-Message-State: AOJu0YwSEH2lzmhEqQ9JCQYybUTVQU5oNxKOsLyl3wU9v2fA2ctDcArs
	RSeFmuTZwBzMKlFHg0voXAqAlXf29SAE/ZpzmvkJFyfygjVCu26KEGvQqi6F1SpMVwy9FU6f+UJ
	WBYMf636N/zF86EISkcqqickZ+tRiecxi1u+gIMI5nNJzGGQIf2GmxwkTH3AVxvEVbQ==
X-Gm-Gg: ATEYQzzLgax7odVZsvT2dWmdrbOFWtJvHGE9EjWFhHYPjGA8uDB87ry5ucwQ3CvR0yA
	YmCLZgEbNKyxfWLZAUg5v0P+cwsaBWQ5PFG9vitFcc+aF/LTby4vqkIfsruE6p/3DTxzjYR8bKR
	6THD0KNZo8/CE7/ENAAp0fMHBelJ9ZZa6HbWipv2BCzT6VDwh8gJ1n5muU2gOyLK+HiDm75rXdy
	8OeG3HN2VJewTfNmqyvpoGSJvpzAWo5W9ZZ5BQrEfRKoTkuk/WIkiU1BQkbJbrcbUOU1b1syGoi
	vICYAp/XPm0njA1cK3I0xijjrZ2/4UT4CtXTQGlHxCOkvfvch+RR3GgFkfFbIn3p+derg5kiv7S
	CGWPcBmeN4NKZDQ1oAfCJN67FizaoZMdhFweoAPe6dBLp7cDzyVfpphgCvBJlhD++plBDWWSn5X
	4KeMiClC5E9IU/oV94kKmpkXcZOW0PiWHkglM=
X-Received: by 2002:a05:620a:46ab:b0:8cd:b33a:7f94 with SMTP id af79cd13be357-8cdb5a4a8c5mr696316385a.1.1773432777821;
        Fri, 13 Mar 2026 13:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8cd:b33a:7f94 with SMTP id af79cd13be357-8cdb5a4a8c5mr696312185a.1.1773432777363;
        Fri, 13 Mar 2026 13:12:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm1681259e87.17.2026.03.13.13.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:12:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 22:12:50 +0200
Subject: [PATCH v6 2/8] media: qcom: iris: use common set_preset_registers
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v6-2-1763bb837fd2@oss.qualcomm.com>
References: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptG/Dq4TGBL0ZBxwH46PjUSAUzf2sw3qfpxiCN
 G9M4O6mM0OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabRvwwAKCRCLPIo+Aiko
 1dzEB/0UtHrslVh+GL2HTJYrp3cZTjbJVy35sOY1h+nPGPtrcak3DPDwnASl1e3XVZlAmAjnjP/
 ZXPORVnCLU/FQwrjIrKFQm4Q9IvXfoJmEjqk2qk7B0NI3Fvt8+bW7Gg+twSuGN5wMJr5gCmPCyM
 AdxUvuEsPjXPLxX5VZXVdxRzkWAsAfAwUJeZHCqIKzakp3CAjuy4gzoyJhVuIUcTGJbKAUibTyp
 z9ExNghUN9uqNDxKNyvxWwM7tghDxcqwcRGvrWRjsbAmAnYyQPejA/qeARbLUr0w4G31ulHEkMi
 YrbO8bpPmZ4jBVksFwpQS84inm0FHpk9AqgTtr+gAxZg8Etd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: w1Y3TYGkOayUxsoIzFZOQSUTaMw9V_Lw
X-Proofpoint-GUID: w1Y3TYGkOayUxsoIzFZOQSUTaMw9V_Lw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2MSBTYWx0ZWRfX1L8143CH4QK6
 RErsO3hRDJIq58YjHUokuVBAn59PRMKn7EanXF/Cl1ApRI+7nBwlMV++flaRYZZW+eACe8E6DTY
 lI3cRX83DQk2a9E41U7yhDdidbC9KgVq716pf13zjvNmcLXwWbmb7Keo+AZ2Z9ctJHp9Q+QLuV7
 xXRLxX66+JR1TiMPRfD+IV9N2j+RnNb+P5zQKRBpFXMBk5EKcSsiUJEO47QfTg94gpc5u4Wt0EA
 9w94jyNu0dbAhUbyUHA8YyrtyYgVYRsi41mMdCqDF7tnieFAvj2qTWHnau6BzwLh+lcEoWHgbf0
 YLiL9VufNj9yAHQvF87L7hHn7z/rrUWktGzs2LHgZuPTnkRyqbq2oeL1rcOikBiMLo6ft3dMbK2
 IoTBcPhHMlWAFXmqglwcAk0/RdMeoFqi4KvxBwd3sR9WU3X2a/GWS4iWmGnB61YYHZ9y6T1y3I8
 tBf7LAw364wSiDRBBdw==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b46fca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130161
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55779-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42D74289971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


