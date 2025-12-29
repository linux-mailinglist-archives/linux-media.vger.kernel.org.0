Return-Path: <linux-media+bounces-49625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F935CE6082
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1686302C216
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896FB2D062F;
	Mon, 29 Dec 2025 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ3d1yeK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HybyqjO3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694103A1E84
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989916; cv=none; b=jYbnGQe18iqLWWv8gNpsF16s8NcfIBoovPZXD6mIZihZMvIahEwMP+QSdQsddQw+EukF2VZfoZFAnfLB+mKqzicUt+mO1E4rU2VP3rVNSLWIsM7b0L3UjiLnpk+B12E0ub6SDcIOWp86/6GXA2dKL+GyfhoIW50s83GTsUEFRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989916; c=relaxed/simple;
	bh=WnRTSzPX7v2ew+XjFwuVlCLDf6VD9eOAqwv7XC3gI2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM1iYyfTx3wC5h2oVZozQjsk9YkNQ00dmhB+u4lvGtws8S4EMqndXmKab3L584mgghn3Qf8iWaHL1r+NxLPqfbiqE0qB+GA8/kheaQiZE6NCdOVvMdVHeGGp1ZjYnMzQJE3BZPBTeg2bMLS8A0GT0j3nr/4+HeFEPmt/XYU7eKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ3d1yeK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HybyqjO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNujS9003811
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4kGK+44l58UGutVX6T4zr6zgIMspksNRCZEaJaRexw=; b=IJ3d1yeKl285Qo5J
	oyksJj2KFOMPOmEbH9hgmWR3yyCb+du7Cz+fgj6Fq/1gmdspMl0evCH1b96GPAJx
	2e3vase/or6OFCw6FuaeP/tKx6cRRZsIza+OzYBFAq3qJ+rqAl+LEMBYapVVjzU+
	L3N2Bl30APRs13PbPZdy9YPQ+pSUTWxmqcW8bpBpasFDMP8PvR/g9YysLq+FdGnk
	RPfjoeMyRSUTtIls/Ie2aU0WWIyBcSd2KxhsQqQn+ij8l+UFuWa/7eM7jMTJG4gt
	nQd1Nki/TfUSan+q8v9W92arGqTFCd71sGuurwvq3HtnMF5Kqto2bxXFCDPHdM5O
	D0Dojg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsbjsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d481452732so17215165b3a.1
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989913; x=1767594713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4kGK+44l58UGutVX6T4zr6zgIMspksNRCZEaJaRexw=;
        b=HybyqjO3LQEZW54fSiS4A2PlYGDDBuYcAIyuPpR4tNqrmKvEfbxwRLp11d9641Ha4D
         irmSYWtCLIoKe67Bo/PDwNpNaNaWemgtmHW3/xeAFNfCxct5Jqn+P/1SrXpPSZ3yk8ax
         k1hcGwyJjl6GUCg8w/F+HGUGdpyih6LkXaj11DFB4PCt4OxvQhtCp4ln7aEEQBQP9Deb
         0LFaL2O+ScoTTNmhpz3OrHepocjy8Kqe7mwIm0R86HbpX46xGsGNGyNGY88bZJpRpbka
         dkDvGkdZ3KoFPg5mWolvNXzOZutnHWokU9JF/Za8KunlKb+i3Q93LbwipSE1riqSCMAB
         HiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989913; x=1767594713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4kGK+44l58UGutVX6T4zr6zgIMspksNRCZEaJaRexw=;
        b=b+IxC+Dk+hBBtxiD1p2xLDoRHgNIhXaWqHrPaC5eVEVjsK2dzjudRQ3KeQFLKws2nz
         SvZuN8iNMlCVMfCZLjnCWzfJyYLWHkr0/awVciQNgxHgudJRHZgdqC/B19Mam5C1m6Hn
         BmQSqAHQegjh6BXaQVHRThN42w4FYYzMnXlChyY6MuBqVC0rKqxBQQs6EJU+bkGTh3KA
         COu9c71yybGYKQUr7hua8eRz977aDWjKJNfIUzKWHDY1v/wT/YPddcS/xxV8vO1oLNCq
         FcXfmxBDToMRh9MvfYRXXh6WjxXWIA90bDgKU1XJbJkJ81jG97/pgBUgh2p3vYDwUzE9
         lC/w==
X-Gm-Message-State: AOJu0YyW4upJhIgP8bRSDQqT4lhIspV8ca7DqC3IT7t3aNbVfaWO0y23
	Eb+nYX07xBSLANFjOECmcuaodxHkteubrkn/WquYyiH/YCIErN/imQXUjWaOlBi7ohrUnmm6ma/
	dFPk9D8mipezMtuFZVEFRHx/WClOii7DTTVdesa7F2S6ha+TwWFQn8Q9nMN3L2F9WnA==
X-Gm-Gg: AY/fxX5IYWdgz2sb6aAuinfnohkKkTF8EzoAq54ncdbp9in1i1A9yfnYVUxgEtRfFxp
	qdTuJTduEqaX2SblcDkG4gu2F73uH4Cvqy9aj00dNmrCoh012817EdOnKprnPVtBy8Fc0x//d0s
	/4/tbdoG5EhuVxw+kwkZTGAHwc5/+GCMHRwUL81ILzsmrvxVyS3zgOhLHeUJOudUjYvdk/TsYFu
	uLZXGWN0C9apw3ckYqvvbubCdL8tS3YKKBDtbpfyj/Fg6hnoSKkFVKLhUvkyq8FNV7y2aCKICjp
	FTo1Lo/P5kM0HZwl5WmzvSMOsFuU8scgdkmyNNLugbv4RwJF/ftwn39JNX2NR0Qk5/0NIc9uDK1
	n/VhnHU2d6kcXu/LCigW8PY33jnQgiZKbH7plsS4zsPiQVGI=
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr28312814b3a.27.1766989913306;
        Sun, 28 Dec 2025 22:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHJRw93o1Mu/bxzeZ0T78s/9VVpmIWJ/3GzW8Pdfcb1wUzPtC/9Fcpocb48Dd0PHZQGwaUHw==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr28312788b3a.27.1766989912821;
        Sun, 28 Dec 2025 22:31:52 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:52 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:23 +0530
Subject: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1786;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=WnRTSzPX7v2ew+XjFwuVlCLDf6VD9eOAqwv7XC3gI2U=;
 b=VOCuOT+DWm3oykxxHTdN0yd/G4XMeijEfhGx3Pd7X/pmo6NApRAA5OTa8XluOJAmVDCMAhj9v
 LoMGDeklgmUBg0mjpvV7Y4TOEGpu2WDhYGUvk+ofPNDkmMo1+06H2dC
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: _aF8T9_fk6U1ICiCCR0MpuoNoMHFYhU2
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=6952205a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=miAyyWkRVIhBFoa6HtIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: _aF8T9_fk6U1ICiCCR0MpuoNoMHFYhU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX0p3jbK1gHpJ4
 LejvPegg/fs7U5dxLp2LnT2sH6h1wDBVZWjIArSeJdadSkLwlo4LB3vS1CLoZuSUrX0GKBmI7FR
 NBT+EHMkeYjBwAtAxs7wu6357XMGrZ98aW6GY3XEaqLJPM0xdDCFg1ejcNiZFyimJNePo6j35eV
 5zTla/CkKtVbuLafsn4B2Mj/d9VJKJcQnirj9YY8TeLjtm7DC8QHv1VlX/G3xKD3bzIGwTGKgd9
 mtANb1LI9GGrsrGdcmk/XvNO/DZsG/uF02e3j9kpLuNI8bGSXfLuwBbvaRwAa+2/qtAmxSpfGBC
 Fz4IWRVcartSLH9r7BOLTqv3jNjqxnyV79db5CY+cxyO9lf7QiteKVweQtLTrWOD94qpWIHRE7v
 aVnZaBpxsAmu5m3MQ0k2x2FAtiyBjQZe3WHTccMx5z6Od2CfTzvrJ+mmmv1fonGrWwEv8m1pR5o
 63UpjEJ8SrIvg5fT5eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290057

Revert the check that skipped stop_streaming when the instance was in
IRIS_INST_ERROR, as it caused multiple regressions:

1. Buffers were not returned to vb2 when the instance was already in
   error state, triggering warnings in the vb2 core because buffer
   completion was skipped.

2. If a session failed early (e.g. unsupported configuration), the
   instance transitioned to IRIS_INST_ERROR. When userspace attempted
   to stop streaming for cleanup, stop_streaming was skipped due to the
   added check, preventing proper teardown and leaving the firmware
   in an inconsistent state.

Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
-	if (inst->state == IRIS_INST_ERROR)
-		goto exit;
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
@@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		goto exit;
 
 exit:
-	if (ret) {
-		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (ret)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
-	}
+
 	mutex_unlock(&inst->lock);
 }
 

-- 
2.34.1


