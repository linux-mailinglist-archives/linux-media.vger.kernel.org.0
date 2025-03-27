Return-Path: <linux-media+bounces-28848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CFA732A7
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 13:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8CF189C433
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 12:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861FA214A96;
	Thu, 27 Mar 2025 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbT3GBFn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4F21480F
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079994; cv=none; b=RlOtS+PwWDCSme1v3XxdL2NUE0464gRZ8iPfazQwR/sjUFNrY2kabi8zQ7ME+YBYFRyMSS8RAXln2hOQt5TsorNvxscb2fQKVTSmO7f1dfzla0G1qjQKph2MKB8Xm1lzPbkkCSJT145TYb6MJx9b5/NsmN4L2BZvqRShzzvH0/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079994; c=relaxed/simple;
	bh=9EtOz5caTVxdgsDnx5q6HonAsQ8MKzqR2Y605sNsvQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VZ8JaP19CYr48AoRk6/WE439P/UJ47Da7eWxc3MR9ucLcDbtI7Bd60gCVzqL18kLCswj62HVrYE3Jej78nMttDyrB7kYCEQXYK+iswJ1ZWaZ7gaDi2kOI+D+Tj+6D1LqQCpQdj/WknspY0JJ9/bIjVL6bnm4nNtZM38idSBZ6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbT3GBFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jEu9002256
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 12:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RmXdPQNwlnY89lmzeqzU/0CL6mj1O6uTRJj
	DbIABUoA=; b=fbT3GBFnoOzAPZGYbyKMVcKqkAaKHX+gwH0TP5TBpSKN7dRVrxm
	d34kVO0wmk5zZ63N3HNBXRVtKPs8nZQ6EdJpJhs3MD7dpOEKL1G36KKdG4mMo+TK
	QgZiBaCHqudD9Xb0E5PCtbb6x1cghs9dZ2IvfY6xblAU1qpG7FjuychqQfT8xfQJ
	6/OdM2jqipQVmYQ37/BnVReHADti/iXVar6XHhPbKhBuS5k9JbBtZRdeAlKEwl/b
	htMgGOrAT+fGZd4T3+mqcaE1plPCL0C51qBBvLmfNvzcULKdR4SQFTBOpvzHwnMu
	hK77S2AZPlA0lhkM58MSkwCFS0K9sFpGgsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdx7j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 12:53:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22410b910b0so15306685ad.2
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 05:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079991; x=1743684791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmXdPQNwlnY89lmzeqzU/0CL6mj1O6uTRJjDbIABUoA=;
        b=FSVzvvrY6HQUUvPKd67KBs4aBXsaFL8WtpaO5FP0l+KVRg4ivmkL2worqSjCmXhTSP
         4xq7KqgQQEk8Urm3T8CbX25UYZj8Q7WM1Xdu1KydJGJnccOOyaHraWdrAmEHdpYU+uxd
         t9G9zgjlNqH18KA+5SBs2ikSz1tYc+IazOsb3OSwtbADiP14B+ERm6FuOslYGl0BCsMv
         pxa7Idq+q3BjEEWXDeAth0M1Ug/A/dXghIUCFIAwA7xMcI+04tHucWyD42Yn5TOhO53H
         gLRBl6/rekF4YUs51t9fp3kd/71k3CKYDM+g7qjV7dV48PgkTolk+PhSUPWifk5cgJXy
         n4oQ==
X-Gm-Message-State: AOJu0Yx1MWtKA7bMjnct7K6YY4GZXqzolvO6TvJlCxCgvYBZqvKxuE6J
	kKTnML9qtcrkvuiwNmFwc1sM6Ddg/zgLkQ5nhfodVPu1EhqEafSaw6l5xnSnKa2ZLJrt5PkAw5J
	+1w3vflsNYPs3BWT/x8mjxaLs4+XCMXJGH0nUrki+WwK4IooD7VMo5FrNQvjDDA==
X-Gm-Gg: ASbGnctrGxZA0GQEnU5khn9ouoDbuprFoPvo/Va+qASdL1sJMhZaPbrMw+jg8Lozp4D
	6IyAi4gFmWewcVLFaMwH7MLrsHUbLdTA2XIrdQjt4sCwCzs3EiofpxEL8QSPsfpXt6rsqRR3Y02
	o9MDpKibViZ/ahTho6hX+XQzaA7GBJHvUANgC+wCybGJHR+3f9h6FfJ+7AZer3yuWJz1PSu4bld
	v4Kg6FZt/syEuGLVFVV5CXlLM99Ik3TpdF43LJB/tjEfzjYkHc6dOYpRJZ8p+TXOTvxH+0uPgBg
	U17uhHewCf7TlfBqo8zxfP7ZLb36fWJdOIPOLjelFEbyk4LfB2Q=
X-Received: by 2002:a17:902:c951:b0:229:1619:ab58 with SMTP id d9443c01a7336-2291628f28bmr20716535ad.43.1743079990649;
        Thu, 27 Mar 2025 05:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzVymH3GRqRHqqQV+fxPEG4HA9j7ZymE7eJ5MzwjhA3P8fnFxCELAO8MhFXETiRhTnij1RSg==
X-Received: by 2002:a17:902:c951:b0:229:1619:ab58 with SMTP id d9443c01a7336-2291628f28bmr20716165ad.43.1743079990117;
        Thu, 27 Mar 2025 05:53:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:7062:5f5a:bf69:400d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45879sm127458025ad.65.2025.03.27.05.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:53:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: venus: Fix probe error handling
Date: Thu, 27 Mar 2025 13:53:04 +0100
Message-Id: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JkmQd4y2aaF7AzMTXHm9kI5_S-1QfB9Q
X-Proofpoint-GUID: JkmQd4y2aaF7AzMTXHm9kI5_S-1QfB9Q
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e54a38 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=TreJGfwvmoV3RPO-XusA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270089

Video device registering has been moved earlier in the probe function,
but the new order has not been propagated to error handling. This means
we can end with unreleased resources on error (e.g dangling video device
on missing firmware probe aborting).

Fixes: 08b1cf474b7f7 ("media: venus: core, venc, vdec: Fix probe dependency error")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c4438e4b2d9b..103afda799ed 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -438,7 +438,7 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		goto err_core_deinit;
+		goto err_hfi_destroy;
 
 	platform_set_drvdata(pdev, core);
 
@@ -476,24 +476,24 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
 	if (ret)
-		goto err_venus_shutdown;
+		goto err_core_deinit;
 
 	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
 	if (ret)
-		goto err_venus_shutdown;
+		goto err_core_deinit;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
-		goto err_dev_unregister;
+		goto err_core_deinit;
 	}
 
 	venus_dbgfs_init(core);
 
 	return 0;
 
-err_dev_unregister:
-	v4l2_device_unregister(&core->v4l2_dev);
+err_core_deinit:
+	hfi_core_deinit(core, false);
 err_venus_shutdown:
 	venus_shutdown(core);
 err_firmware_deinit:
@@ -506,9 +506,9 @@ static int venus_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
+	v4l2_device_unregister(&core->v4l2_dev);
+err_hfi_destroy:
 	hfi_destroy(core);
-err_core_deinit:
-	hfi_core_deinit(core, false);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
-- 
2.34.1


