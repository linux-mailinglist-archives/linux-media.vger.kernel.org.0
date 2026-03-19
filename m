Return-Path: <linux-media+bounces-56293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLzXOgSSu2mYlgIAu9opvQ
	(envelope-from <linux-media+bounces-56293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:04:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB52C6808
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AC34320239D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B886315D39;
	Thu, 19 Mar 2026 06:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+Srr/BT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaYBp1HN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB87F2248B3
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900012; cv=none; b=NybxLSoSUQFVpaxoKOcCSw3Qv45sUHlQ2a/KsfJ8vikGQX9KTtmzJrevXEMBE+GTwkLW6xa1W94QPCoWroyRsgY4FV/iQoC/SyteHuauWciHvZKjxaHMyVisngpzp/6S5z78dsDzQKQ/J2dxGcBH8FfGZfC4wsWHWQF4TcEKfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900012; c=relaxed/simple;
	bh=VauW/RGRyUgiLiorJMeqipoBRAxqClErnJ8ONalNeAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qrei8Kcte5y1o+BZYydv7s4jUniwNNvs6hGV4aZrurHS+juCVHyarwIDCeT9tuPsr3Ld2XR8dN9aK+oa8dWkzAJHso1ggJLTVCKyNv4YO1Q3vb4Ha07LMkYDDo3ttj5kHCSYz0IpIXs/K+UM8qufc5b8YMZvFxnpllfSGjr1k4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+Srr/BT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaYBp1HN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XdeO831272
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6bNVB+vN1tv/9CQnymCkv9yAHBuvvR2gmbWq/1Knkk=; b=N+Srr/BT/E2usFCH
	q9e3m13R+cJyk9SNml8EO5tR8tSFALdMQPca3BvslWYMvwR6/OneYAZqE3gUWuxM
	DnGfvMQsl+9GK6K+kMzo8sduUDREWKaRGREe1AfIsZxU//twiGtloPH8N5k1XcLc
	VJfDfaIdeJ0swO5b/6VuBUvQu99LCkH3sSFkgTsC82T/rkZqurJ6A/xXGcSbBpbc
	UJTk65k9RXaB1rqB8WKb/e2CN7UUfoQJ0VlnwkPJWoYlkYovAbaPjDT+rkHhzOdu
	cdm8ZIJvIoMW6ftkOx5nb3fT1W84H1wA4wBn2R4xvAntwrXv8bNThmFg/uz7mDB6
	HN9n3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j3s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso65700501cf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 23:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900008; x=1774504808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6bNVB+vN1tv/9CQnymCkv9yAHBuvvR2gmbWq/1Knkk=;
        b=XaYBp1HNc6Nui/Sc7aEHQC5bgxE7nrFi/OEG2/1mGPpVZGWv9dWlaLcWhT3FTKh4pA
         zvwu4sxm8BEM2vh+v0WXyCbson9WgN+XMRR6zXT7JW+3TvU2SafQ74ouSiL0R0A4cDQg
         9mEof26ZtsXqJ4F35t65eB2dBzLRgBYAdCqjIa0Wj31HJgSC6LdbWeRtgjYwvUdTpZ8g
         gpM2G0XNVGSL4RTNuEJWQ/RbUPkbSIugXcbrh7pcdhVbJD1m1v3PNA7wHPgIg3ephh7u
         a2548ZNOMseO6fM56MN00vzxWds46BL0i4DO9CQsMXsXLVgiLcQeOjtRe+s71yDNXBzl
         wc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900008; x=1774504808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6bNVB+vN1tv/9CQnymCkv9yAHBuvvR2gmbWq/1Knkk=;
        b=KFhLT0bBC98+7b804Ukl1Y7efUsMr7dt3MTj7mVqtU8NuKhdINthLh2i+uwdvne2Qh
         iuRjvx5PLTia00XAoRC4w3O0HDTJyGkrgSbay7Ojg2EjAqQR1NPbOXSodAVN0QXbzOfX
         DiTVCeslQOWHIyWe1BCBRXH8BXcg2DjXKpeZVA5RhMcltGK+fPR7rmXI/HxiXqt9p1Y0
         ufVWlWnMYoCKH/fYvn44rjIvXf25zSH4hgvi+v6zh4YNIGWGwMPBRVvFxdXTKnvTuNA0
         cwfRCSz/rPu0TttXHI1mrdYnfbeHzF6gxMiKpQJmnnSiZT04eD9G42fg5XbPmRjYv7b9
         SXyA==
X-Gm-Message-State: AOJu0Yzp3gzbzbaTlHhY54eTLTfuBKVb+CkrVppbW+oPti4CwXd1AUzm
	UsXpRV63dZOUIAIQnOmRFhTQoeri5VBqGjevU79+DWN+3AjF/BAAuFnK8EJMYRMFfa5KmTJnBmD
	NYRGlrSEcmWE0fHxevRRF3M7eCU1LQbEMNXRNKd9NgyZ61dX2B5ZCVT1YnPYAAXL7j7qn5eOYaw
	==
X-Gm-Gg: ATEYQzwLGm8O3ASYwLecfp9J9cafanMDKXx3I7b2/dNWUdI9i2s/TvguT+0c0eUVBTw
	GXeh6LKH+qT9zbxVOgZ4rIFLyl46EGPR0oWfan+Mt1K5C8DZoGUfLSx8OLYid1RUBZA9opua7GU
	i9Q90YGKA3H/kyZp874LW5RJ41VbNKR+qx0JFgEX6aMDN3gEieW7cuoMddmykFIhaSU7AMD5o+s
	tk1qzv5tJnz24kUEK1AfGWiU4Y8rjPly8ckr+Yi9YnyFGmRYLuqGbEmWQ7TVzzTXNdFc6hdbNnr
	CmcraC06Z7gtOG7C4NmP4/JRrMKv0FJ0SxU9DjW6OFeKDH1GX8uvo7tNVzuusi8UFeoX9t+cLY0
	c7B6iYyXTfH015jyYgABmllVjGQztX+vIbSpPCu5ZWyhWy/FdR3LcNqV6Ad/SP1cG0PrR7mkQ2z
	U4zuHDvUaj2Awyyb5a2xGMZhZLMwZKs9wepPU=
X-Received: by 2002:a05:622a:4306:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b2d93a1bemr2601861cf.24.1773900008003;
        Wed, 18 Mar 2026 23:00:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4306:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b2d93a1bemr2601521cf.24.1773900007531;
        Wed, 18 Mar 2026 23:00:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.23.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:00:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:51 +0200
Subject: [PATCH v8 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5689;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VauW/RGRyUgiLiorJMeqipoBRAxqClErnJ8ONalNeAg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DWexDGF3TQ0yvchu3rsdKJrc4FkYPMz4gc/
 9/u9g5fGfaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1gAKCRCLPIo+Aiko
 1SpoB/42v5xUuOHaWhU3uqepnfUQeqbclso/iH76PzyM8bxFa5qpP3pUvVPm+/V5kPolzHY5mMv
 ES3DZA0jHE7lUGwvvz6bb9hqyyZ8MQyGhGnzucS88yC7V2ejh6fZVwSn1OshoAa1zQgzVvWNbbR
 IPPqnVsUxzreqStaNZre7wH++xPdQP1tVV6bBElFS1SLs7GsTmxc/Jb9WOMepOBpf6eCpzN6BP2
 1NILEi8CORezvSanUiC0lzPtB8MBW6g9m3WNP+FGDSThZiGDW524lCyW89NU0339S6vtUs8Pve7
 HWThcr2QqbADimWiZvC4P6i3+O5ZTqx92HPg9r/TRe7KSeFP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0fudeZ1jvKcoQyo0E5n3zAAZvBuUL1N-
X-Proofpoint-GUID: 0fudeZ1jvKcoQyo0E5n3zAAZvBuUL1N-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX2RNKtrLpkH9j
 Quh72MY115zXiWWQeaaFgPXlaTNk+cTQRZ53fHA0KPMGqBHiG8ztKKuSRgkmMug11phEzRoWh5F
 XrZefevIjhGhQ4E/nGtR4DwhSB31ALpv2Vd5ebw3j/zuiwmZVLsR5fkpNm0nxxgicNWMDmC4ZPK
 gvfbmP68E9NMsi8fJQWAOQZqkx9BwtQiYL/CtFofMXzNxUj/T4jaZClXWI+pwFkvBwZMj6Rr/ka
 eUftCNSkJbjOU+2brprls2oTpxrHF2GAflNA3ESpJ95T9w+WZB14j/5nC1I3rdPAl+I1+nVgqrY
 4i1cjl/Zq6LfNxbLKxXau7/RfP/YiI8ynoD9hyQmoGgmyW1TYxKBb1nZl9IDUrQW8DTcIpFe5WE
 v/jH4Gl1h+yci7PVkPd77R+w2jMveuDQGa0IzQ1n8wLe6ely1Ws3xI/eOUtDlFUCU5kRj1OD0mX
 gZe7IJZ/Ez7VyP9EZmg==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb90e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qqQcAvOoDgVuqrtd-OoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56293-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4BCB52C6808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW response time is a constant between platforms. Remove it from the
iris_platform_data structure and use it directly.

Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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


