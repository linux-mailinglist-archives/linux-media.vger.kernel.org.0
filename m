Return-Path: <linux-media+bounces-57396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CADdFUIUx2lUSgUAu9opvQ
	(envelope-from <linux-media+bounces-57396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:35:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D334C596
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371BB30E100E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680D6396D00;
	Fri, 27 Mar 2026 23:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6iB1hCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBwWPjD7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A5A392C56
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654149; cv=none; b=q4o0c4MY+3850FaE6fYjB2uw8Uqq8FClfE/0e14ML4yW4OVj8KzxO4WLgvZIKqN42FpVyDOT5ucjiuZhkF9KtDPtXCXccifX3aawFZPoCCZOdurHqOBq5DY+4/QIHCVO1+3i+A2UkRu9hrTodl7kVT8wfjmQFOnRRShq08TF1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654149; c=relaxed/simple;
	bh=LyKW9a4ahjfp9UqYl+c9Z+AjjY5xRtESGt5zAt7he4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFw/0GTmt7jlYEAv48H1/ibBRBoIzsuxUpFXgB0MXtx2dZOJ0FOMZUYDeFqrSDEpoBWE8HcYcR/j5WP9/ACPIKjFWlzbL7Zw4ACopJueDxw58jdkTlRRL1j+RYmgKENzTu3y6uk54EmITiQPsaBRJYFikszxdTaWqJgDeJZibH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6iB1hCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBwWPjD7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN4PDZ103343
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=; b=o6iB1hCFdxQu864u
	EnsTH2k7MIpwhD47J21IwY0zXdMoq5KXeYGKm81JD5mTa8kr1RfNMzFYn+kReusI
	3TbS1gYnw0kMv8qi/+nnKYOjyb8ViO2aFA0umpfoyUPukbqcNYI/B/uSLKQHdJ9a
	7XWAv/zUg2H4uEB6+NWx6lFwsCdoitVx9nukiB2bhECWbOH1MlpqpJWWvjd0kZqs
	tKgux72qS2TqVqRXENJq1K0eUpoXaAzRSuqYNCy8Hb2j8WVJS6BJwfqwv0xTPvME
	cgCNou7rK/GwwLDbUeKzTY2ppo7xPla1GEfZAu36sYJ1fYsEK2aEU/dSs1kBQKYS
	IY2tcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn1388d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:29:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so63956181cf.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654146; x=1775258946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=;
        b=DBwWPjD7Llbcyix6yhHkpOhj/ruFGttihJjT6rwaFVRZ5iuIi6LQDoMUWAADJfXWLB
         nW88Dcw6VD5WcIzmjiK3ZwXNkJOtyH25Y7IS7UQBbL9+1QhWnkcxmzxTuD1OfiEl7/qS
         A9LrjdmzwM4RlNGehRkBQYPe8wlYLPh+GvT3RCdqZyrZREA9bp/ZTkTEOlpI5P/WHlef
         rUkhoeqqTaUm0TJF3ASsKDB5Gcuff7WtlRtLFZg8qzDZqdwm5CewMJ1rv4EcWUFgQXDK
         7h8TBGSnv1AaaDc5LRcplpw/7CAhmy/6qnz51PWB+ZKG7HwPF2Ti7ERcOuiZYIAdEjiZ
         7tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654146; x=1775258946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=;
        b=Kfm/0zErdGItGN/0ftRBX/GVBrMmeudFQ8C/hjER6mB0cHo3w5Qde/2Vbzm9NJATZr
         gLOFOcU45idVyuOZQaA22/C4WFikTJXcw6IRAxAfwQSE3s40wRDSeTvAoVakCP8eV0tG
         ykO/qAOQAqu6hMdK0phAC8U52DTtlqYytxoFtRn3+Ga2bnx21Dv3dWJKLGPb35l9lFG5
         +QqnWKjwfxgLx1RiDgP4VgRr73RyMygv+ZHHhVyeuuhV7/b49mUF+g9/SQ0X0KHDzkIZ
         aoQcGrrIZSA5/WeO1/sFVeYrW8Gjb7HciUjdSLOiTseTqKiJUHkmORbiTbi9w2br7E5G
         4WQQ==
X-Gm-Message-State: AOJu0YzhJJU9Y3Ye3Cma+sqZVH4+d+B5qafb3fwD52tuE8fFu0moCemp
	NGFk6r6fe4cCr4grQvkMi4m/fgxt1f4HYlzAyYzAkDXU60ju2/jE3s3TIZbK8aWKMqizIS7SRj9
	8N+pl3hUP+P1OOpUxWcuw6eoWoJso1vaXpzRdKK8QxlujffLtKbuhj22BXD93KHIoHw==
X-Gm-Gg: ATEYQzy9MbgFfjB6DblvqJ+R6vooE42EUsw1j+HKjwpkwMD8PEQ+PSjUTJshgrU/UZz
	c6eBanR5Ynavn6pa/D9StmUgCkw9aK2o8UgI6SlSb8t+tVxqGyhyBJmlmwJS2gXgylOfmf9ahB4
	Y9IRX40iKW1oZOCJsNzZqcuYIZ5qpNq7CJG0B8HXJG7MaBN6HACftyBwZzmNDhJQQoj7iiSzRxJ
	dFE+bGkBNo5FidNpS+GbH9yNXGNMsTamhAM4eRgGRMLkk9Gq2AKH6VAukVC5qFd66xafM389FHO
	PdjE0+HBgacWVDkuB6rTOW78sQPcx5pcbOK0Qi4PdCidgYyiENQSlapfkEoe1OLImSo+NFOuOA/
	QVA2oGYgXJLBci50ALTlf72mzmeGfMAtA3c4ruWBS1SL32QWh9gO2z+uy+QP0YgByooM98mGXhR
	9zB+2U46JtUnMPeGBSgsObJO3X9ybzkS+i2GI=
X-Received: by 2002:a05:622a:345:b0:50b:7113:7170 with SMTP id d75a77b69052e-50ba395d15cmr60863101cf.39.1774654146010;
        Fri, 27 Mar 2026 16:29:06 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50b:7113:7170 with SMTP id d75a77b69052e-50ba395d15cmr60862691cf.39.1774654145589;
        Fri, 27 Mar 2026 16:29:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:29:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:42 +0200
Subject: [PATCH v10 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-7-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LyKW9a4ahjfp9UqYl+c9Z+AjjY5xRtESGt5zAt7he4s=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGnHEqjIotzbXdYr8CW0X4SWcrOF9UoePc8sSmrUVE6Tv5y2q
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpxxKoAAoJEIs8ij4CKSjVRIEH/iaw
 4KfjIU95Dn5u0BzSUIOCaqSnj6ozDgo8bb7BAfgTkpee+WfdkHPhgWWcWj4aPV2iTVAv0dLxSgd
 n/LPDFx1DvqwZdPLZLiIaxAc4dCdiTHSpbtRxMCZiEKS9xOVUIcBs6uv1jD+dDtkff0Tm/zyiq1
 N9ErG22nYAOwcptBFtXzCbry7pZtEM9/xuxos6a+q6bLIHoLB2IA3wh/ksljDMqWF54Q83XLsmx
 L7CDm/HK+xNGuubzFHSuakcZFYFVbAjpXphyLvhn75F3b5AX5BbEs77D925boPkU4g+icS9Wq+q
 jkshVEIGDZo2ReXF9z3OhPQCRwi8Ue3LgayMpVc=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX/GWPwp+hBHEQ
 0C/gMxIcvRIN6op52qXIMDk+QQHPXPA+kJ8363txAB1VDpY83/Cobn1QDRd6fhan4PgkGAxn4UO
 LDPw6r9G4lDUaCkS1F8PH0QBVp0Q1j1RTeyAg6wQf42TX0oRMPVcNd8iDMuOLbv0FfymXNUA1ak
 ABeVRu0u716FpBrQ/R/+x3Tl/tJzEJZf0c+JvWWvd+aGVsiviz+53yur8P8VS/X/vp+ZzRJ7ncI
 za5HWoyQLTzt4S5ujp/7wsZVxzBYSi2uX/Ai/xtRTSWcwgqo/fY5TSERg65sUCcn5RoZ7qdFPzP
 IYjuStNyVxtakdpjiySMCFRwabmwz7P/p2ENo99DU/4mdoji0aopdd28jxUne80q0YauRD+Kxz6
 NEuLZX5V82wih3jd0R0eZ0IqrPbZ30vEZX7zelAUtO+vSe7g+w6G7o6o7JA8QJtfRfVP2CVSWEb
 JJXdxnwyEEOwXj4USnA==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c712c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qqQcAvOoDgVuqrtd-OoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NOdylc6UWr5S74oz3rln3vt69Mr1uYJh
X-Proofpoint-GUID: NOdylc6UWr5S74oz3rln3vt69Mr1uYJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-57396-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B12D334C596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW response time is a constant between platforms. Remove it from the
iris_platform_data structure and use it directly.

Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c            | 3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ----
 drivers/media/platform/qcom/iris/iris_utils.c           | 5 +----
 5 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b..e6141012cd3d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -28,14 +28,13 @@ void iris_core_deinit(struct iris_core *core)
 
 static int iris_wait_for_system_response(struct iris_core *core)
 {
-	u32 hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	int ret;
 
 	if (core->state == IRIS_CORE_ERROR)
 		return -EIO;
 
 	ret = wait_for_completion_timeout(&core->core_init_done,
-					  msecs_to_jiffies(hw_response_timeout_val));
+					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d1daef2d874b..e8a219023aaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -232,7 +232,6 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
-	u32 hw_response_timeout;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9925a893b404..6ed4c4ae4056 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -361,7 +361,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
@@ -410,7 +409,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.max_session_count = 16,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 10a972f96cbe..abe523db45c2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -936,7 +936,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1036,7 +1035,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1127,7 +1125,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1222,7 +1219,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..29b07d88507e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -55,16 +55,13 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
-	struct iris_core *core = inst->core;
-	u32 hw_response_timeout_val;
 	struct completion *done;
 	int ret;
 
-	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	done = is_flush ? &inst->flush_completion : &inst->completion;
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	mutex_lock(&inst->lock);
 	if (!ret) {
 		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
2.47.3


