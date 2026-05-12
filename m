Return-Path: <linux-media+bounces-61279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIEFHfhFA2ri2QEAu9opvQ
	(envelope-from <linux-media+bounces-61279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:23:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F065238FB
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B294A3015D15
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717E639EB6B;
	Tue, 12 May 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D33mOYUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZmJv8Rh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C937C92F
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599276; cv=none; b=RNjm3T3nZ1Jt3X9JrdfmN1IhM3ackJi00AKVKPa6M1JLmJvjIQSa7LHK/OYvGULyxcaxlT2FCAarmsUeVKs0dlbKinv6ucvu6dqa9/CjQb3vyYs79WMbtLMGCbHzKRcaTnifyPKr1kTry9Qy2x7ynBaoXFYwI/qfIO8J22clp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599276; c=relaxed/simple;
	bh=HCRGBUtkrSoGUk8jEGoVTJVZHXmbNMegp9Xp5SSwp60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpr8qYrdbVZpZvtjFc58HwBESj2tnOsKsfyGRy9tocHzS4YJ33ILQq46LpKxFYD7Q8/eV5NKwJNIz7AD8XZ1C3mPXx+xkMASJE1+0p13rR0MqXR3YL2ancyJ9Qj5T1mv7C7t+fcLUd1FyJj2FMJFv78fhnS/TJ7P3uhTAXzDXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D33mOYUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZmJv8Rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkYcp739985
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02ovJpLqS/OJQIwZyeSKKeC+6lmXh6VPbB9glk5k+CY=; b=D33mOYUnSqrJbovu
	J6zlRYOyZ5QcoVa2I8B7m7nWtzLVP3WjUbq9mtapvqzjurJ/c3N2TJnLoOHCyRiq
	gv2aYdkKoNFYg3wl7DOs2cJbYdlOk0GUJcFgW5yt1MfiVqaPKldZKNRTiJmiLtlz
	ZowXgMzTrVOlRNp+jzAgTMB3Tl+5syx+b6yRIldOPjrPwj3thUMOcea8nfyNEPR/
	SJWiWD8TE75CEPjXBn+lmnDeA1Pr0blYzTinEjVX9fQDW8GHkyDn0194CLBk1MW9
	1ESTchTOjyZYSpLPbbbeKby4nuzfmTacbf30Z6/faUF3KRqWTkQslHY3AUkmbTnN
	knSpIA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhs5e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:21:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69b4f753046so4336232eaf.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778599274; x=1779204074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02ovJpLqS/OJQIwZyeSKKeC+6lmXh6VPbB9glk5k+CY=;
        b=eZmJv8RhQh0rZX4aT+j87hAl0eJvKOd9tE2sD4KpWlUBmce1WCALJlsk/yUAbiWkjR
         xGztCib0fWHriX0TIxtOThwoui2tktc8bjzYvAUXQF0epVbHoFPuj5xXoBE+G8febq5r
         aGMO5Bw20Sa2MtxLsECi/d5q4p8iHYCQhwrzrHnlecuctR76IEmxOiT+mIcI7DNstNba
         AnHC/19d6TtPomk7KTQgv9cMschN1dsSCGhtOmRFueWVlKRo3fBgm4cyBoGMeQgD9W1S
         R1FscNofqs9olZkZ3APSNkKP68ep3ETR2qBUrk5e7yZV2H3tdsu41oOjW8fzHhnroafS
         fS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599274; x=1779204074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=02ovJpLqS/OJQIwZyeSKKeC+6lmXh6VPbB9glk5k+CY=;
        b=fiBmKlzsB/8ZVD5cK/VCS/1vs5Q3++rlA9MP05J5FpgdNWjnuqBAOFw0PAeMmqw9NG
         J8sVQUQQBVrZAK0Tg88HnxBHbGt19Bmd4JSzpRN17uwnBoUeBJG22HUwLPX5ubl6xFrz
         JoX/MY+vrZaqsTR82kude6KNdUiIRwUGQOAB2e6eMJTlSIetTJCdgtZ84rfwprp+Rpf+
         NpSV0vGl57tYGKNUt6vNm4ubm4tG+dLL65RQ/PMPjh2iY7ydrC+wHlpFg9hrTU6zp4Zs
         dDLbT05MeB6fmHX3nzf5wdqhcd5AKrNt4hrpddR5A5Uby2rDBH5b7Itpwo45L5mbAZJ2
         PJOg==
X-Gm-Message-State: AOJu0YxbxRKEdHkwN4s6wYntqKqXP/vpKpxZEG2pnnwyZGzS7YjgOw4u
	+Pi3hREAgbqud4Ca3IrBArd+/eByoG6n/GqjzI2ThTJdMRw4MSSTlRBEDFz/zu15FSjVAC49A1P
	xVfQmw4aVTPL4kby/IDWHnZ3HCBE2LDDR45b2Mz+/TleuJqQJdxD4HnT5bLa0xkkLkA==
X-Gm-Gg: Acq92OFplJWCd81m+Ila+93noiPXE2CtfEhzDF/XH7aycVEIQRXgb27fqt0tDn8Ub4o
	W/BjJwJtc7/wMqIZe8H/O7uvrkOTekuZGooZ8E8Ukcz75fGPd4yT0ptWZp9k3JQopIiiuOgt6V9
	mwxMprPTt0DcVTk4SuyIcR68WPqK1Cij1YxHu4C7mUOqM3AxcZJSCLgYZ0BNiUWXTF/ARxiU9sP
	880o+/loBBwmYoI5JFuI+1gOWTEuw0YtMmbrkJqal8raFxS+MqukPXUcJzwH5BLCGdgilNWUPme
	TkfwVaM7PlsqRf9z6+nch2GitUrI0xKTcUkNLHP5DQoQ1frjdHuXGa3AFXw8Sd2aqT9ZA/7IJPU
	sLY9mz/0WBUZw031HC63fyj83HtrAftGxwagvvjZdKuM1inU2NDMxx1cE17OY4ggHikNInCDLPe
	yZZOGCUTHCQzbuuCUF9B3vbCw1EOGR8Lgi8lI=
X-Received: by 2002:a05:6820:80a:b0:695:818c:e56c with SMTP id 006d021491bc7-69998c8f448mr15047273eaf.7.1778599273930;
        Tue, 12 May 2026 08:21:13 -0700 (PDT)
X-Received: by 2002:a05:6820:80a:b0:695:818c:e56c with SMTP id 006d021491bc7-69998c8f448mr15047244eaf.7.1778599273394;
        Tue, 12 May 2026 08:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6268ddesm34036571fa.37.2026.05.12.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:21:09 +0300
Subject: [PATCH v5 1/2] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kodiak-gen2-support-v4-v5-1-a98968423d24@oss.qualcomm.com>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
In-Reply-To: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KiFa/JqpExwVeRLpQRB6b6/r3uzswFx4pVVeS9KUMuI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqA0Vl//QAeOSbmqNmESKLZA9iLZNeydJOb/N4M
 rfYk4itFsCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagNFZQAKCRCLPIo+Aiko
 1fIbB/9IgdORjEiBFONrCN3BW+BB1uI+80ILQKcUydZQF6tznJWOsDwUoxTlHHmF2qo8ke8f4yd
 SAtcRnP0SKkyWTruPN/p86izEdk41GtPjCdkZnHK6Moaa4QTLKcNFVXi4O57Mu/HnHAX7beDAyL
 CAMLGnM0VjvQ6YZcPO4q5k9HrfEtO0xXw88Z9RgG7T3x/wwEuk8+tC8+1B4sypiXYvhHjmXUd8K
 LtnvW6h9ml9pMYYqNNx+K+GR6hLOMFKpOEz/cH3Aa4IsARb7T41DTMd+R+0XYzilihQG9ZwYQY3
 DO8iBGwjIZsVALiF4KUN8Z1adJS9Dutpm75RNK9Jb3IMZJrl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1OSBTYWx0ZWRfX3OSqANMMK9W1
 4E3lPCwlH5V9X9wBBjqTGi26f5S/gtXGxRMZBPAzOn42w+LRI4G5G0U33wUv/CjVgp4UBKVMcH5
 eRuFkeX/1CyE7Vf7Ul8u/nzA3JPShFFbktDUZsdKRdYahyIUtHDubq4UFwkctlmgWnnVA0xzHIO
 OAMVjwVYR4xLrJV1AJ+Sc1vfzeQGmiEjI+bmb4yEEXJCI1Jqq0h9LU5ix+RLmzHvFHbH4xakCiQ
 TvUtd06yzc24GYKSVzDWWWDbUAD7xP07uQLTAHLJEtkldQBfT320qTG9Ia+yDwrUKUi0OxvnOor
 3vm0xqR6amIOTDoySaFr+lOU91iybwxqWAa78N88bLGO2mY2dP26K01Ocii2uGyZN3Bg8mtjB64
 RG6rE0FCCXj0BFBz3K5MK9ne8qDBO4FXDQZtg2IGCjE4MrTXUQGxgNq4bA4gvT2A5Mon23ugVCj
 KgimsjP4QjgigfZz7Dw==
X-Proofpoint-GUID: 1g1LP79ftVgdjTEPOrLSK8nMCn7cJfD0
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03456a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_zkiGRivnqQB5cGHL1IA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1g1LP79ftVgdjTEPOrLSK8nMCn7cJfD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120159
X-Rspamd-Queue-Id: E4F065238FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61279-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The HFI sys ops were previously initialized in probe() but, we don't
have firmware loaded at probe time. Since HFI is tightly coupled to
firmware, initialize the HFI sys ops after firmware has been successfully
loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 1f326f696d08..52bf56e517f9 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -78,6 +78,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b..dbc15edc602b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -266,7 +266,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.47.3


