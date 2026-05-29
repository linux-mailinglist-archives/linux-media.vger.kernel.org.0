Return-Path: <linux-media+bounces-63037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD0FMQCmGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:43:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBD603CCD
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2A6F30241AB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DF43EAC84;
	Fri, 29 May 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbDGnaUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPWNgl0A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586073DD53A
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065424; cv=none; b=lYnaU7SaPcS5lnViLcBGnzs/Ok+nMwAO5XfOenzVfe/r1K2SQBxyjWg1SIY5GuZZNoOin20pT8OED7tUv33vQ+riMB4N/Qrl0qAcENZEA1W/PL3RLKP1XSp0EQJfkTw8yru6OtCeBDazlsiJNTxZTSQQAzaxhTTvgAZFyzRX0e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065424; c=relaxed/simple;
	bh=UAxB3FbLEll7mPh4olvchmGWKKYFPfMHb+VfDd8w3QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZF+PbC4pH2pZiYaq2+5ovMvIZfgg96/S9W1CrWjfO4Cgsl5ecLaGI1bm/US8418Ek1SOi4XZmAeo9oQGSB3i01gc6jKeNH0zmdTiS3RTTswTyOYE7DL/+gbdVVcormVupAJvJpyEYmPKAkyXEtwV4t4WiI/6gu79+CL5H07EljY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbDGnaUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPWNgl0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL2u72335118
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qVoT8vU1JD5H6cyjWhce4nmuiIGVZhevzhHyW5tT51s=; b=hbDGnaUkvebLYk7u
	v80fv4DPtJaNcIbVfMf7t4FZpjDj2jADMPADIjbH9BtvkaJ22HBdLJput1UDJhHf
	CbC9qpKzYK2ZYYTrGekg8Pd9fEWWHhKz2ykRXS72ev+DiRyVBu94OnxYSgyvivw0
	DKvBJr9tar7couOADlGxx4mnNd3Gi21ee3sSEmRvHVSLvTjgcUKkMIC44UPN/1I3
	ncAZNeb0GyKUZWbrSjBMRvmpA9r3k8AlJ2WrGzpznmPEOCT7uG5G76F3Xl/EnaTM
	TXrSpRD6dk0JYra1NWzzkWRKoMLvCR5scHUwVehs4YWg3hQ0G2jCEXKBOfujLlFe
	c+E/pg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj26w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:36:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso3122335137.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065419; x=1780670219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVoT8vU1JD5H6cyjWhce4nmuiIGVZhevzhHyW5tT51s=;
        b=IPWNgl0A27v5yzMkF2nLKM004NI1f63/kX7zuuRT4BlK1D5f/ew/MNHXoyDtak1XYX
         VGqHbk/1dIRKDjVoOnEzosxfb1iCVLCB6+XWrDYRTR11TS4ZMX0qHRbP1r16BYLoPcH6
         x5KQA7U54qJipaX+FpzkovwmBt8wmbgysd+xI57uGLapeQESqEpZcIZDLbUhaknmFn09
         +8UiPldxHtUBZncwQQg1TNg3nzWO19MoZFjR+VrqFBWTMatWNpASnYVF0QhpfUGcK/hW
         8qnB2Z9qIHojT67mN+MkHdHNHWHypIxrZnHLItHMWC/BrdaDXbmxxpX57IZmVrzmUVsT
         948Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065419; x=1780670219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qVoT8vU1JD5H6cyjWhce4nmuiIGVZhevzhHyW5tT51s=;
        b=qo8GNpWEJnQLyshqelm6K6WrGhS2vNCMtiOSZluKVLU6U3fAbYOpkCcYYbisVyDULH
         +1EqlP++/pvnlg6hCBUenu6qJ9qLM635OtXKHYnH2/jtfuF1s5ryPGb/N2OhoO0rmSQu
         7ZJT9AACusezVmrYzRS/MVEPcBYEm2aQL8BXYl26NIViZsTo0XTAGBIk0AikytLGlywt
         t7wU3c8FDTjC2PEK0lBKcPaMA687MdpjLdGpJNn0iEmT8pmhq8yvQ9Mtqk4xr6dzc+Ud
         NOI5eqyCwV46HrYjm1ARmQULLaVgwDV0QnjrUCmjDDIRW1u1YA//caLaHA8WkMhhggkx
         3Eog==
X-Gm-Message-State: AOJu0YykUySx6ctdiHMprQRZxUKV3GMzMa/FK67/8o8MP+MEhhQGxcCG
	oe9h7d/ZiSMjPOTQocX7GpIedVZ2FXPnNuCqa7QPqQdY3bsRDyuTuqh/Iu/SYM22EV+VSko3R1b
	3PimBj/mfDRNp2rUmAdRIC4avo3u8Sk4wEdBvCkIJdy8pSerAN/mncFIUYhbHPXtsE3Cu3U49IN
	iZBZw=
X-Gm-Gg: Acq92OF7U5N4C9tgsrBFMorH0MQYsu/3N5lxzcotW5lwIQSKwup8Kv2gR5rDvRF/I+u
	mISofSkcnRnH0LMd73BpCwN/as0/34ZcVL7xzLQCrD3DwUDSbd6dG9bvYppzBXUu+DMne3DPrkS
	slnAfmjD3LsdSzkGI/BdqeBX3+/qe/5kfIc4gO+Zt+4JroflFxf8Imgfq7QuIdP0/pyM+t+nqDp
	FN+loTB5+Rmd06853fnWz7H0MT+A8VrdbHmcEJy9Q7SasiRXefXz+GLn0rloanXuzG/xr0kaOJS
	Dm9qHUynd4PqPeyxhhsGOQLzWC0yYSjhBah/baCEskLWSYmaACoVKTJKNezp5/700VjSOZqMG/S
	Lyc2VAIyvu+1Vyu73wceNuYf/GRgJUTZd1/oSmT8tkoewRI1zXXmVNlAYWY1p2Qhj02rG810Zgs
	mMo3obUTDIcCuWtQiLqbb2eDmhfAXTrkKe/NhzoE/2TV066Q==
X-Received: by 2002:a05:6102:3e05:b0:631:28c1:155c with SMTP id ada2fe7eead31-6bf2fd47168mr1410122137.7.1780065418538;
        Fri, 29 May 2026 07:36:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3e05:b0:631:28c1:155c with SMTP id ada2fe7eead31-6bf2fd47168mr1410105137.7.1780065418131;
        Fri, 29 May 2026 07:36:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b068a9dsm316317e87.11.2026.05.29.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:36:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:36:54 +0300
Subject: [PATCH v6 1/2] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-kodiak-gen2-support-v4-v6-1-9a81bfa797d9@oss.qualcomm.com>
References: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
In-Reply-To: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oZnKWHIxLAD7FiUYWHIMeDo3t9uClgh2ie7UGzCwNak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGaSGO4FuZhnlQ20+b1/ECLy6cyVfhive9Ls1Q
 CtaC8CrmluJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahmkhgAKCRCLPIo+Aiko
 1WX9B/9ZfPEaWiWlvdvlkDuSYhAeVY7HaiHJkIhYRrToEkWN3ojzK4/WNdSaR0Jdwvca6aTOUVC
 6ZM2XqHGiurdDUAGNH+wCKmH4jb2rGIy7zhOFMZFPDANtMaGW56dFponaCUsGeP/4ooKFwTvhS9
 WbfMcbDu7UEsLapOcN0g+nyxcOaTxGi9jk9VZWBcZwoCyazWMx6QROVgj08xoBfiOce2va3KF5s
 O8/UuIVmoCGr4LxS1vj1bs9gMUgy176gRDGtB37jDhmAgIyx81d+WeSoBTUS0QvHIC1hRYvSPUB
 f1Fen15ryIRnOH8zHcPaygPxbtlJSDpECIRpqUXS+6ZVhnV5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXwgqLC7hOrUqi
 hX2bbak3bVNHy7FRF7eNEV5fPCJV2HwEKQD1cSDUB9cjR4jPOXIXH8sN1TmHT2sVdQ+z7jjGaGI
 M7Pt/xms0pMDLqEK45etQH6WD4kY5BDG8UrDYaowJR7MPkOHxtmeVeTifQBzCdv7QWDay5A3Sxy
 4UduDLCdT/C3iO+1J0KFXCdk2fMbr6+1qwvMJy9iXqapjy7Mux+Ii0M4VCA1oucEiFqg1wSt6+Z
 VN9mWiMaX3lYOEykhkInuIKGzRXfWotZKUQ3Y40yBFJ5iGDo/7pYu4RpZaquxMLtFayKP5yBMrj
 18ECvqZMOu1GJcVhWCJITXucBEw0dZ4B3zJ6Bai7w0mpBBL5k5tatI+P0Fp4pSP/84QiN3WOJ+m
 Ym5wxFz1DfQ+FBu5lE5kDCoR4C+AEA6d15pM77av0s80ctApsNEFxKPa+rPUux1fnab7VkWNIGp
 +dz810GSN5HZ4NoYKCA==
X-Proofpoint-ORIG-GUID: z0jUpMnjOfFr9bwiowYibYAOaeGEh901
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19a48b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_zkiGRivnqQB5cGHL1IA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: z0jUpMnjOfFr9bwiowYibYAOaeGEh901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63037-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 3CCBD603CCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index e6141012cd3d..a1823ded46e8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -74,6 +74,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9f8113ec7a50..40884582de55 100644
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


