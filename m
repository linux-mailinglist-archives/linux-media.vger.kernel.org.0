Return-Path: <linux-media+bounces-55293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN9WGkX4sGkRpQIAu9opvQ
	(envelope-from <linux-media+bounces-55293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:06:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D595B25C366
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D37B31AB629
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 05:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4D432826F;
	Wed, 11 Mar 2026 05:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGMYShwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLuWY+al"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D51322B8A
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205516; cv=none; b=T0S9uVpPPk5PmgrItbyzYdDjXXcxvzKLhiP+xA4PvrRsNkDvgM515y1yEC+UT0+TRywry0AKK7vN/GcZ3DNj+28L1LVCnKxVS4G1cQzHStS9VxRczu7Cb6NhPGNIIW1ZBRnuN0JCs1gL8wbrqqGptNaCWAQ3Dt3tUOomOqla4qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205516; c=relaxed/simple;
	bh=dKd+e7VXpOLrs33EkmmfTfblgiU21vmALyxPTYH2etM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBlYHMjRItEe10Z30BNut2+iRcdJ3G6YE3ouLH95sgWU6hsf3L6CCcjhHkLS/ZIW3opE6Ij9rB1mtNaaBqCa/9YlTWRAQlE6TIMeDWO3qwbJ4HNCy6OS3kI5HTgh9XHX30bw17KRKFO5jgtEmhund1hAi2XLlgLXFWlc/PXKDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGMYShwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLuWY+al; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3wl0m3892708
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDxcjhAqOb/kGi+fNZPYkRZoZ7JQxWwf0K5Qbx1wh5o=; b=LGMYShwexMrfSBBz
	+0dssBkMZ5q7QvbhDtMJxP/Uy/jhiF2marUV+9+AiQduM5jyHHzjaJLyiWnWanPo
	XFtnHOHtG5bAhXAMpV0f7c0rWz4I15WUAn7vr6+LjECwq7TpnveFp3cUBpY8J8Gt
	u3wWijC6aQGP49eroIpyMz7JxrFjv55c9VwRXoCTlDWaAr5H7+5yRoh9jfIQ63CZ
	72CPXhTjuN6qIMXDKtF7xSmRfejfgP/3iz/InXaZnj1ML9qJ32XT/ehk/Sssv1js
	HXZVGgQbckGBzgQS2OwXLwxnbCTRZ3I+EJf7b3EVT2v7HuuVUtadUw9Ylh0QWc8F
	pgMU2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyu5xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so3948272185a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205514; x=1773810314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDxcjhAqOb/kGi+fNZPYkRZoZ7JQxWwf0K5Qbx1wh5o=;
        b=HLuWY+alFl1T7hiawZPnhv/cxNeCDv15JcGkXG5AZJzYTnwNdKlJ+hWkD3HVJ1ibwq
         uKaVIVkkUjbSSl7zbhwIvcgm/nXpQ4pKhPCVS6Kb7rzkg1F0HrjnBlj15gxfBmhBZFo9
         jOwONxGfA3Sc+RvUlPBUE58z6MEH2K6LVE4iSRXz9AEK4XMy2FiTP1WctLD4jUM12oXw
         dDVOezOYmZZ2fGLDls/Z2Icz4b6bLGX1QtWu5VqcZZgXVTpPbhRKDGRwve6VquYKXpsH
         mJf+QXoSmpoqTcUbuU9Zjj3jOyJekcNc+LuEt5SFHnRf9B3p8v02TpVBqgtIftf7B74q
         mwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205514; x=1773810314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDxcjhAqOb/kGi+fNZPYkRZoZ7JQxWwf0K5Qbx1wh5o=;
        b=bj9fe4JZS+jt3KUlBJSjz2COvFIcST0HzDYzdSimSeVvyO1SZFCPZuw4JvI9AS5PEO
         kuki3+Eu/Fysw8kOJZqWkoXDKyPIs4vztqVW+gx5ctxy40Ag/yV0doQvdE4zWxaItpFn
         SlBnbQNln6bmorVVFBkQBoGSHCu6MP3VTXLgqxg1zpSGQ5NFzL75oNNKajl7Pquew8ga
         8fJCcg5eAGnmMdQfruoIOSM15domkaVeVpgNYKo3GiORP61hevsHsOPs4TupRJ2zpIAC
         dzHqtE0vS2h9ncnFXQKiWBSq29UL90UxEWbxmNK6tFUiW1YTeuEAEx6bBtdUvrTjmtP4
         NXAg==
X-Gm-Message-State: AOJu0YzGFQV6wTFsTG/r/CqB5XPHG/3h88E81YZJV2vLjMhcPqkgL0Fj
	fk29U2n1wOk+GKLU5w/n7DNXQylUhe9FoN6f1v/8B4g6WSiQI3/SFaH0NrN3Dg5uZbcRCR5y+H8
	S9kcHMriMJf/lMGXsO6Keg7piBeAY/3ojFUmFqE9VFlD8VSAAk/T2oY9eojpu59vJug==
X-Gm-Gg: ATEYQzzZXRedRuJ+y3OfT/VIptg0/5qqAuzXyA8Z4QzJ/Tf6BBqoFiMToVDIdJrS0C1
	5D9Pg843c95JoBjcgCl5sT1FnM+51S73dToVwxDxqH4DXy7ViICbKWFryaRep/XNZ/DurcHD0XU
	8TkOYJK27nM3ivacEDOjnCxTSC0LlDGA1ygDt1vB2UTuTMtNfRmXPSrtokwjWTq9xNNV4irfaI8
	6XJ0Ct74RQ53BMF0apdgS0z1iWxjZMpIVl4kVL4jISIW+AagAhMwsy7TCrHd00aBgTRL7rVa7LO
	e9gh+/xi3l1zoB+y+bBPqrwPcvB+gzpzZ84FO+ye1BxRw2jUAJIXLcZVK5yR/nLMuiRy8DV8azm
	b9sDqGuV3qRUXO/FDB95oiXUB1AOjfNyE9YapmNmbJ8lgsTWBRwY6vb5EECcDfJqaUOC+dcYbJU
	VBAYB15/rzXz0HypYLyNt47+7qXSIRJniAhtU=
X-Received: by 2002:a05:620a:1a08:b0:8cd:911e:2c28 with SMTP id af79cd13be357-8cda1936b3cmr171660485a.7.1773205513893;
        Tue, 10 Mar 2026 22:05:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:8cd:911e:2c28 with SMTP id af79cd13be357-8cda1936b3cmr171657185a.7.1773205513469;
        Tue, 10 Mar 2026 22:05:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635805bsm199240e87.65.2026.03.10.22.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:05:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 07:05:03 +0200
Subject: [PATCH v3 2/8] media: qcom: iris: use common set_preset_registers
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-iris-platform-data-v3-2-f02258c4d4ed@oss.qualcomm.com>
References: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
In-Reply-To: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6432;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKd+e7VXpOLrs33EkmmfTfblgiU21vmALyxPTYH2etM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsPgAXv2pf7kX2wiaYi5akWFnHVf3XWbCsFzEF
 C8jBMi7RQKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabD4AAAKCRCLPIo+Aiko
 1chCB/4obfNBTcjckosdatnmMiNrIZfs2KniMO5fgqDXKQwAfuZS5pVpjFUhl5Sh5ntkqMoO06d
 pSTXIr6jmDwP1Atga7n4qF6lbl2dMzegYgW84yjNgFEZOkoi3oim0j3CuHAPgsmnfOAPIyZKb0X
 tBfiAVe/5gg3VUabphByrpJVkA+XbcSt5YE+xFGRkYJmYaTDToNd7FY53Mxrcf2/JqQMKKhUDVf
 eMBP35CTEYKbXxGPFyQ7nCFmoY2iiou/Gf+leSrXvwY59UYiaM0bzqz/eQWLk/MjkFGkBbPszBP
 h6j6a/Y6+kup61AT0q4k0rQocggoRSMKJmJtE8lxV6ui6i7e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0f80a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QXlSR3VOD789s0_y8mOH5nsVC3mwdiQs
X-Proofpoint-ORIG-GUID: QXlSR3VOD789s0_y8mOH5nsVC3mwdiQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfX3n/bG/qLsE0o
 9g0D/jv0mZcHyEmRW2yeruHdacpO/5aPkSoCaF/kTS8ccvsI4EBckD9dIPZB7FLRoPEi+i8S70y
 VVui4niMp5+PTgRfsQdau97HDn7ayXLyWIWIK+90+RFIhGzjhV0spTy4znDSHj0TOB6rp93a+W7
 2lB6rufIGGwPf+gqyCel4JiskWvPVv5iyiK+6MbxP/c04iaAwSm5Q/2x/08xMKhg8Y9qmCp5aC6
 DO2Z0t5GQD4cWd2A6GSE5zCt9MogeeA8o+XfFs9zT9BXeM2GT3SbcS9TJO+D6SYJi9K1RXq8GSN
 4Sn236IVhiHnCP2vZQ2J6Mk1xRmPlx5YWdGi+uwcZjRTlfKYq/51Zx7oVaBooDeKQjNvO2oEY3J
 pYCqcQ3Tijr6reF/G3fkGeKFXoJrRs9CQJbUkldXs/gKHFuGjp7ABlao5XlvrMl9fEC+a8Htkny
 E/r+2rxi3OgD6zUtS5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110040
X-Rspamd-Queue-Id: D595B25C366
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55293-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

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


