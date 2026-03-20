Return-Path: <linux-media+bounces-56444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLGrLhipvGmk1wIAu9opvQ
	(envelope-from <linux-media+bounces-56444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:55:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5752D4E56
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE00E30151C5
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771F63290C9;
	Fri, 20 Mar 2026 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4fo6084";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQVD8gtg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6E175A76
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971707; cv=none; b=uOv5Gwbqf95aWx+UqYTDI/s+lPdoI6UhYQ7etDTCnf75IZchNcD2Q+tJPghWib8Um6mmazGVWCtjVFJmRjcHw6og9MIveZJJcTzJAc2q8xfKEeQXikXU07C/rCcwUSvtCTOgaBzmZ/nwAk74BmHEEIkQdpeAAYpIe3Kek+soF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971707; c=relaxed/simple;
	bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7Yw5hyNhG4lOQ8WvlsnUJDOD6M0e6pnscuOJN8emFSgMeO8LC3mxXcWN5NpJPNlPihQua8v8UltMd5v9voxocVBYFL6qQ2nmUTrA2lh3bdi8MLgVKzzxf6aPwIzXtHndlXr5blDr7DiThnYIA22Ravx190bb79JkB/N23PQ8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4fo6084; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQVD8gtg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JJdDdT2759246
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=; b=c4fo6084NTpflE//
	exqR8OP+yDSMjYA/Uo1yo2Lpu/Arx4b0kat29CZVcU99wT1t61yzI4IlX9AuW/GG
	tsgaLjpfEU0o1RMq1CdzBCwqB0rsxyFMj5rXbsZnPdjVgDsYArzBHBBgbCqQYueE
	WBC0aLda7lQirgL/0Bnu4tFHzbkx33fZs0XE8TOXLN6lt2eQAaUjS5ZjOl3CvW1P
	oTBO3YDGdrur4grC2Hs39YCZWwVmg2geLoru/5oX8davV3kr6rhL0jGWKH+Egs5T
	UJeAAi63COM8QmQqjl9Rflufu9ufwo7aNaARLZhFL4/dwwiz7qeOopyHB5w44n0f
	5uqH9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0qg78tjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so92445211cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971699; x=1774576499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=bQVD8gtggvb3c1fh+nOmLOsJlyaS9HcQp0Liuhr0MGl4NUX+CfkW3N39uf2JZSTpKx
         wzDC9rkEcp5fX/tvCbX/Bg/m1Y3jGZF8VUXgQ73DlWzjT6qb0NGqoEdYkqXn2MbhGNVV
         MeX82j3/AwGygOksJFwcOuweUnTK6LM2Plgsn5FcH/wLiD5LNuhaSPeL+JgSz9aGHVnx
         Whj+nyJRo5PdNZgfr0A/NcNg8qB1eBYftJup8mpupt0J7Ll1M+20iSKVEHen/Me8mHOk
         VG1KXtWExN6WcBqyzbE9KTbHfPy5qyBTbgY+oY8NgMKZlgSqxEfgGqy7Luor6lXMfvGP
         t8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971699; x=1774576499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=HBEDNcCwCtYqxcwObdV9YxX5fNOCwWhuiuhve81QJFimdGcJA8x45ckANyPOt60Far
         lWfpDdapp2EaLQbuWhQKmYOWa/kYaeV3QcwG9kSHMKtwFcFsWP5UrsfCb8xubqcdRivl
         6f/x4JqejQapSO2h0gR64d1xSvjQmwlULAsT0x161V7MRyR78f5Y7m0gSEOIwncIG6Zb
         wBFzVXlbbVx9elAmo6F1wraBo/kpaU8r82HfHlu5plLTRf1MfrO3vi4WJsPT5KLKQCP9
         up26epijq5xqwK8m5l8V+P7+DIOzq7BH4jWiuJO80c/YKOgmcDv1H7rOo7D0zUMF+vZM
         /uqA==
X-Gm-Message-State: AOJu0YyDgsE87HWdT9HMoz3WjwL9pXtM+PY/Nw+dZjUVcsyWkc+dbeDK
	w/xfjJMcv7/3dY3n8/TIaoYoz0xitcqCYCqFMlJ5cxLf7CXo9ygGwry8xeCvU6fz1lILIwTcq/K
	9wESX8zwRnLL3irND4lw8sP1KQ8N45OofYaq5s9Xcf0xQ6TNP/3U66gIlmDFtSHbbkQ==
X-Gm-Gg: ATEYQzxB2K2NZFK78DQ95ku1ljR8USjTSqAP0pr2++6tUEBaU/ipk6Ja3yDVYhCC+qu
	Y+EBOtPRiWcK+DvNH4Rla8WL/LrxYkzijTim9/8CxZbb3w3+NziHH+Gy/JfIAVaNGVm+O9JOf6U
	fj+5hjZ5Col24etv4xuryg5ZCVGN3IA9ikMgpeV+zcqt5m/YVKW0IOEWCBHkY7IeSAQohxwUqOB
	fIy8e1oFKQFfewhlfb9JRdrncAqnvWWfvXdYm87pPl6gMuwdMzOw7KIb/p/9RZC5BwAGD1EUGTm
	VLi+7+eSMlgWKcmLv1Z6RgcqBXlJmNa5mjWn6Q9Ir5B9Ehfl5IdYd+YaewPuC2T1kVQAyr4644r
	JAER/SpHeDXrNZy4Br1WlbPBVf2GHG5ncd+tYbXMP+k+wf0JFVvLitjWS54ybqUS6RO6ocb2I7G
	57nkLRE3NrltnUTVZ2sBpuIvx9HjIwbkWispo=
X-Received: by 2002:a05:622a:4c0b:b0:509:2d05:6979 with SMTP id d75a77b69052e-50b3748dfabmr20509701cf.26.1773971698917;
        Thu, 19 Mar 2026 18:54:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0b:b0:509:2d05:6979 with SMTP id d75a77b69052e-50b3748dfabmr20509531cf.26.1773971698362;
        Thu, 19 Mar 2026 18:54:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:54:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:42 +0200
Subject: [PATCH v9 02/11] media: qcom: iris: use common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-2-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6562;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjkWbqlQl57YEkRgQjbQwNrm6Z2gWhzLezkL
 +NwjCtm25OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5AAKCRCLPIo+Aiko
 1agwCACi4ISfO8OFcoY8reJeF/UmpANp5unPJ8AWiVnOqUVVQd+SF1tcWuUQq8i7Og3mIUf7199
 2EfXL2XRP2FrR+cXQYSdZhvVelC8AhSHvGe07csMlik38FjPaYRfdN0fYR6Dxb6iKM0ljbGHmMk
 PPRtrmgFJhPAW7EE+YF9PqIOBqdbmCGMU6aCzOy8sdtwPwSzjdoPbNQy8iTsPkRm3yom1KIFeZp
 Zdfhy1HtIOxnWpvN5Pgkth2IQxK1HUgmCB0zzEchVxAl3CHG2GrjzO+Gp7Qhk0+B6KxUANXRKLa
 Ucr6iwHZ5ss1upmUrHaNgCrgzqV7lGGIaQ8irkUcc9MFCbCe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: H01plO2c-bZXZ7gAgufS_fw-APT9m83G
X-Proofpoint-GUID: H01plO2c-bZXZ7gAgufS_fw-APT9m83G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfXwlGBEUuRxFIJ
 hhAmYdbx44fbyKzrnGTUhzqnmmmSNiGSKzXa3pNgLx7/5fSOJw76aKeZQUjLHRNf6mvuZHtEE4C
 SPi0UoFbU0gggfl307OQEwvu1yQpTkiU19MGGAw6TVL0QwWDpaJCru1xrYLqsMTFMCI9kVVDZip
 tV2479UVAGaYkbXZ4/XPvz2O4kbML+wYJZv6nAXvxFtLoWTDunPVvoJBRw1HfG+yjrAS3DHwrCI
 8qmnHIc7LXz6cU3Upi6eUCLXD1CKPEaKgOmeeSU+roSy321xAZzqtlI9nwQPa5JQyFeUaJzxVHo
 CfSJ24cU2s/ieXR7XAm7tIUM/rF98eZGVB5urgDb0WZR43EWE1Q26pSEDvpVsksrlyHy3ezqBH3
 JbQcUJXaUpVTVh3gi5LTepcyM/1ypzYw2vpzEiOx5l3nbz6otSeJDoU9qbr4Og2iGVRBf9X2i40
 2DS86fg+W9l8ZbjqFSQ==
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69bca8f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56444-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 7E5752D4E56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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


