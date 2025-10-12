Return-Path: <linux-media+bounces-44212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14764BD07B5
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 18:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 62E984F3B31
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 16:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859572EF664;
	Sun, 12 Oct 2025 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9m59G7q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD072EDD7C
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286242; cv=none; b=IbEMuI1PJWULnxO9BIyniC94tdZt6bKn+YPA93GcEuN+yjZMrjun9O2LAFZyLgnZBtrYHZSqwHGKGk29hCW8f57oQbDAG+XJ/cC1jxCRGLXrIlIkquxySAa3bMj79fdZz843xzqx3Cm+D694+yu4MQCVYcBkfOH4Z+8cuKkBpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286242; c=relaxed/simple;
	bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftpqizx5nggTOwqe/VmGekvW6cycOehTFOYfCBgrpGp+0ctrrFd3d2/9/blam5Nf/IkAf11Gk/9U3g88fC76HSkfohel/J5NTTyfe+XHHebt0IwnQN5zzHE5CjMkLsAAeFUowHYvWxjFzzgko5GjOh8RSEbZx18IwxoYq3Fwxfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9m59G7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59C8mdJ2016076
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=; b=Z9m59G7qzaJ8io8K
	vVPeHct/cnIkybqd/zhMZTGNQTv3Z9lAEL8nsZf2k17KRFzeKrWAMJKOSFdLkWg4
	tGcDNwhWd5/4EjRCWY1yuNOHMXG8OjxRQLbmfLIr7bDAtyIzLwhGEw7kWUzCaI2U
	3VnPVn0pPlMNyu+0WmzYqKJPd+LLtzf30rfrtKllCpi6+HOv7JzdhSfUr/LklHDb
	mW4oV0ITFS5cRCLq/yLkgjbZQ8UFNHZyqXY7w909HpZO8API1utDEujOHfiL6xn+
	niiOnu6buW5u6COrRpIyZLNsPv/xze/qTHU7i0bGqvvddzak60M80s7iUH+j3Lte
	xv0QDw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bt73u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-879e66b788bso400671816d6.2
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286227; x=1760891027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=;
        b=pwjgT3NDVw5tkGOaB1X4KAruK1vofZxeFoG0wJITcbi3F4xHJq2kyxzi64Wai2H9Gs
         WWqbpQ8Zj23vrXSWjpCija5pIk2lYy2eEgKKfekp42c/rNVj0XORSw8p68pg56q/orMh
         JoRvXW4kuS1uDBYjjctFIW2IbmQ/QBTuyem9Q1AvY50o1ZBJEZ9ASHoN9wn2a0kwOiqC
         vjnHIfBanun60c/Hr5F8dA5sEjxx+/7lD/IvNnQMT3Rc+N3uNYH9JPanxfD7zkJFlsEC
         G1TeM/u8rilJdUXD/XcUxhwXxZQzBDXuxRQ2j83f4gK81kkNdAZwtH0yVyo9wyySW19X
         6nog==
X-Gm-Message-State: AOJu0YxL1PHXAzdxq+StCrjYls3m11BfP8upY6mTQMORCMHfoFDY2BKb
	NITnMdoxjJPwowXsmpzqnOJN5XyE8uW8cxJlF2nuuGAuzJA6IxSwa3GCUCfhIqOFURfaiHEQ/FS
	gyW+wBp3T+HEe8+N5zO0Ihh+RBR30ENnFvutClFJK9QP3m8bwzIQRrVMl9xgWoo/UKA==
X-Gm-Gg: ASbGncvWGuLtqV6dlwrVbSlUumiATI5/X2+rHXjuEuL4sZvjH9bxyNeaG49lAhdpsOJ
	U1aEBfLQS7pvPFOfS9j4Qk28nrLpbAn0IKBisWA7OxxNsK6i15z12UggMAbiS/Y2G8KLifBaSco
	hPIX40CxHuNI8qWM8ZqjwgPTpSnwLitBa/Vl5jciG0pehC2x9wzzIMiNVtO2pCSkF5rElcgRSlK
	ZXezFQ/s69auPxy6zajhB52lOkyGQ1zGy4qIf6KTLsRUE2bhxHSxwDdoZqQOirkCczCpu03iyAw
	GK04DgUzvAOiYJUQRn6MHQehIBHC6NPN3Qdf8jnrHLZcUcMKgwGLIVOuYWNGz9gb4Rq//DrgQay
	Md3Jib6NaiO7DXBOi6sFDoTBcffqdt9IOGq0ibKiA0Czfv7oV0SiT
X-Received: by 2002:a05:622a:1341:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4e6ead76899mr269865081cf.46.1760286226966;
        Sun, 12 Oct 2025 09:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZGDGwXcAJdBLHhlMucpkDABkvYlwnDKAhf0zQvF8JrxPpKUF6XtsrKMmZucxWkSK6izIzcg==
X-Received: by 2002:a05:622a:1341:b0:4b7:a308:b5b9 with SMTP id d75a77b69052e-4e6ead76899mr269864691cf.46.1760286226358;
        Sun, 12 Oct 2025 09:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:33 +0300
Subject: [PATCH v2 6/8] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-6-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YErcPp7M+PY9ZwW4nUC3BdbqrQ9iiCVFAnY
 HcOOnZUQhCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWBAAKCRCLPIo+Aiko
 1dPhB/9ZLwZkjd610uZ3E3iD6QYmbp4taWwj+TpZX3g/a+mSgumXyMxTTJH3Kd4Zp+9o/66M9ps
 wwaPD7r9Vd7672fTlakmq1t5JeTpr8dfDF56ofVS9dYox4ZFFN/06JwinHG8poGDtcT+Q9AZ6xg
 DusCgJv2UoXrfzwjqvlU3HhyQgtTwdbxZVeIFAyOgEAYNOGf+IGJDf+3f5XdtrdZxCE7r00v74q
 JrMKLuy/tDewGGya6gfGlmYiHB5q8v8ER1aBEFWg2MJmBFyPzb4AZ87+BQixUhEREy2d6UvIEEo
 IyiH7aD7mWRb7kvL3T4JSmo/rc7ozDxALpxcznCwq27hfARZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: R8kfMfB0mPdn2mz5dz3JVxddfpCpKHLf
X-Proofpoint-ORIG-GUID: R8kfMfB0mPdn2mz5dz3JVxddfpCpKHLf
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ebd614 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX5gP3L5eIJAnd
 GVNbKw7bQxjEi1Deay8GRB7gQzZF70UyJ3zR9vgf1NTpLGaMB+9t/sQpmGpITvm5f+Lm43O1zwy
 2J+eqYD2k6YT6r+wk9po3lnXBYXw4cMhcHP0SAsc+OTmAWPvFgD+W94aKrIVhpLzc1zTQMijYtW
 Petg27E2hcZIKs16YeQN5h4R2S7ID8982zDoKQJ1w9lHWXbpHB65K4sn0nriuAh28xo80YkziY3
 9IG8nktUeGxftDLlQzxnIp15P9QEflbN9JOHD0HNZ1mHBQpJtrt/YTQJr+AKu79daBkWA7pyZ/y
 NcGn45GCGVduQuuYgwXHgGG2GmNLVoU8/KOPqgEtQffNAV/ZzKIjJkZUHMK1DrZRl6ayYYyAPa1
 CuHKadou/YgzmMtb7CYO4o0RH1JZFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3


