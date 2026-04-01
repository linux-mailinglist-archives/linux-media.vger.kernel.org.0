Return-Path: <linux-media+bounces-57852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFa8DtTyzGknYAYAu9opvQ
	(envelope-from <linux-media+bounces-57852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:26:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB074378753
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3572306D9CA
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BDA3EE1C9;
	Wed,  1 Apr 2026 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHLHMbt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XphqY338"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C73E8C75
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039101; cv=none; b=ifxydGT6xBw+HQww8Z1IQ2SHScBUEJhMrwxDOP+9lttbycb6LGXPVkvw3ISISwyJDZhW0VqsVQm71lsJQSaWN9B1ZrxHN1RB2H2QwzVUSomkJVRzEgMvYkgLJEKPbpYjmFz8PCi/mgXgzY1+Z7DDgpICqc19OK8CX4WxscbJseo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039101; c=relaxed/simple;
	bh=zsfwswlQ3m1rrBxd+JimmXRbTnuQ2uja3PrneN8KEM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtYuCYNtotvfW48hFQuDyG0bse0K5mNCufprO1P6dW/5EBQV70vvTRvLu527IzoOV/2jCmR51sZgQ9i7P58NB1q3h6tOXjwdBB+EYR0I8Q8Uz0EVN1nsSvKHdNQ5He0xbDdKsaUX/3dbtktPbEviKv8Uze+V3l1C0iWsePShHaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHLHMbt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XphqY338; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319AB1J3174233
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZFGCdI2JzeniAj2RCLpa7pYckZeqjXJfQWB3WZUnps=; b=LHLHMbt64++b0jPN
	qRk2OPoqIuILPySzYubQPLUGDbuJXZ9cddiSWMpM+gV0eLVCGJ+7+f16qUxkJlNZ
	kpSIm7FnM+Tvi8xLx4onYo98lNPY2BtOQwtqfM1ZUVhjYoKaEkGOHeL3X4o4y8kf
	FIKPYPGoLPo1uJoEjxtXiHwZ/Js+Lwl2KUPRx3ie4I93AMKTf/1WLzXjMpLdGHz/
	xTQwQ220B3MghGK4WsTRXjtOm0ZGIhFCVXPiXp10IlX5HoljPLbIqsiMrtz5fm56
	3MTFczTByaw4wb1QGojEDc9uiH6rxVC3xn3DcyDU8ZjKBFx3w4Rn24TcNns5zzVz
	SXhF2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbgb3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 10:24:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b6d4337bso956327a12.2
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039098; x=1775643898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZFGCdI2JzeniAj2RCLpa7pYckZeqjXJfQWB3WZUnps=;
        b=XphqY338cC7KLYHEW9VRgA7G9BO5FTCDhxS5mlEjNy6ALryA8TupK/dlF4YUwLZ5CJ
         Qki8rrF5VCHtFLmy2LgeufhMr5TKAYZhTf5O71X2tZNRQYy3pcy+Rx6h3sPyrWIihiLF
         0OwdPEyc05ldOUcpV8SbE/DVyOke8X3IFrXBYLniA+U3VsAGocQa6Gpk+a+Uu7c9xzNv
         ezwppAq414ZZtNi0UUIu3HOmaU9QBooDhuGG637IWxrfpf9sWMENeMgkmB0bcOgBiEUp
         585+v3R9hKLfIzSIpFPk0gHDh8ugcWmx83Nvwped6gWMThlqOsUUkKBTF9UeCh5ABMeK
         G21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039098; x=1775643898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZFGCdI2JzeniAj2RCLpa7pYckZeqjXJfQWB3WZUnps=;
        b=OrjKd2AaR7QUxfauUQCBoxKoYvtrF0HIQqoQQkBGm0C/JCSs5l5faLNLk7+BaJQJBD
         eg6U1Q6BUJT9sBXk1gWvdAzM1/ZjqwofMmmvAdJqE6Pibr0zbU5yddcu3E8sntvSeD5Y
         9Jo0xzYYq93BcJ78cfVv4s9j7kcHsXmXnpKYex+7DfjUWaMp1XV8BylG50P7jNGGKNnA
         f7rjtnQEKTONL2C5sB1zWcSHnoHk138YMfG2Cn66O80FD2csN1i4Wr0Xhhdz0UYKRIIJ
         utgXPPbGbh5t1vM/Nlf7ZXaRlNMiB+6/2QZDJlGMGeGkOzOE88xHVTqVEGIKDeddUx5S
         Qm2A==
X-Gm-Message-State: AOJu0YyZryxq2dxVniPRxq4uaiynTj+zL65Y0RqUz2zmL3bALpkeflus
	+1UUA4ElFigNMe42PrZVO6mzxhp8Y3rLu3w3eWC8D75Tzypbtn2zlB+4G4NUIPSPFYDfaGbuZA5
	qxSssjHdo2KW3LDs2M2jPj3BeAtp7ZjmMcwFREnbNCxDdeMnk/xSoEKl6s7+N+Em2WA==
X-Gm-Gg: ATEYQzwsTEnKMXqu9a/KiZg021ircqJHjhUZZs7gCkdJZnvkZf7/cBGfweGM7MlPHLh
	1RzfApkv5eqUrr9841XxSa0xbx0aIII0O4M2BAHD3xGnInZE9CUwVNj31gW7trpSKOt8VzUn4uL
	iWIRaBnB6580fIaF/7p/sSCu7VDoR99sZXbDG1YUY7N2fqjzSWHkWCO9aPcc97i58Z5MaT8w30y
	kv9ZtsQEzthITTZZFmFoSxMG4jlFmyJd4/btFRMnt5hAV6ryxBWJQkjLZD1ezu3c2ehtkpOPXve
	2dR6twmveBmSfGygMSv7IyOtZ8OYYd469ubHjujc9C73BeU1TXiqSPAfjOlWhe+lOh5UbigHqnm
	tAkwxIKO8jOTlc3TUqiqvY73XHwYJNTlTPOzMXSt5arjJc6XE1kgyG/OXIm4NhJbuzCCO49ko0B
	ZUJxdl01D+lMpQqgVC6Dg8
X-Received: by 2002:a05:6a00:2e94:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82ce88e809amr3176923b3a.5.1775039097539;
        Wed, 01 Apr 2026 03:24:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e94:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82ce88e809amr3176885b3a.5.1775039096934;
        Wed, 01 Apr 2026 03:24:56 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:24:56 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:39 +0800
Subject: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=3442;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=zsfwswlQ3m1rrBxd+JimmXRbTnuQ2uja3PrneN8KEM8=;
 b=ouAzJs/qhwyUO7AzX8pbS6btmScPc6Wi2z170U9E9YQVFG1WqjaOpBfMm03EQk/fS3WdMJ1zq
 5FH0SLqRy3DCkZqcWoIDgETqN5o1VG7xUQm2tgz8RFPUoiquoHFe+MC
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfXzUxO5hDpQ42M
 MtNQLtHRQTxabLGZ/mknAzsEiKJbmmfPMo/AvgfRY39A9baTUrAKl4SySs1flCKbZ1y9a4rPSAE
 zK8Zrvo28TyxNR5dOJJ4gACyrtSU5GKsBZiLEZgsgJUE3biDRqwXladmSJmBcu+8MHPIn18APXB
 QAwcH6aVbjm7w4bg2nUS0ei3VM82WijHH219+WtCQZTbnU3mBsl/a4/Oke25hGnmdV8Zb77j3l/
 QmeMo4j9sX6Fl0lJ4thXGlRHDloctiTv9gBDI79Z418MfBQMbaWz9R4+HID+VH2c7sCNY3hveHH
 rZJtnKS/LyhDkcDgfvGfcp64DqrCaZGzZfc7UJA56qgkQcNZtYUHq7rwfVAg6Rc3lo72H/1nrXQ
 kcYbpO0eFqIIlHg+Jf3uAomR0HAKEaEn+pz5+ALhU9qfDVK97OFTLu3LrX+y9EOBh+JmhhR5xIb
 sh7QUFj0klkDEhYOTtQ==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69ccf27a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=41qbuk9xwJvO8P9Mh2cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: OUulFMzwyd67mkDRswid7F-EMLQtsTB9
X-Proofpoint-ORIG-GUID: OUulFMzwyd67mkDRswid7F-EMLQtsTB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-57852-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB074378753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..e6a62b3ca78efeefa2eed267636789a6b405689f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -71,6 +71,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
+static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_bse_hw_clock;
+
+	return 0;
+
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
+{
+	iris_vpu3_power_off_hardware(core);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+}
+
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
 {
 	bool handshake_done = false, handshake_busy = false;
@@ -268,6 +306,14 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
+const struct vpu_ops iris_vpu3_purwa_ops = {
+	.power_off_hw = iris_vpu3_purwa_power_off_hardware,
+	.power_on_hw = iris_vpu3_purwa_power_on_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+};
+
 const struct vpu_ops iris_vpu33_ops = {
 	.power_off_hw = iris_vpu33_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b822341fb21e12de6b1395202f62cde..88a23cbdc06c5b38b4c8db67718cbd538f0e0721 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu3_purwa_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;

-- 
2.43.0


