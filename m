Return-Path: <linux-media+bounces-45649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3DC0D84F
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1AC61892B88
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 12:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75AB302CD5;
	Mon, 27 Oct 2025 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnBE/8qM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F37302174
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568028; cv=none; b=UOJp2tk49o1/nVJFIEWJiq/nNSmx5trfrX97xT7m0UDxz6D2qG+0fVHriX8AduuTEoal25g4yl8z4a9C2GFU7IsjMCXEqja0Y5cVMwey0r0TZRPFGxCWnnArLcEJPEkZ4r0BM13cUZw/nXRtdbslGMzVNMoTIh/O9khofCI28NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568028; c=relaxed/simple;
	bh=p4aWbdd50eAVtJKt/uKdmS5uIMnunOHZbwNtVYNRiI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dx2pr7ewyTZcRuL70zmYgRj98MoE0ySMlxZCJUW8AFLC8ZuTV71Q9h9ITSJgxGPaE0tiEsI8nqiHi+yYIwfiR99NUo2WcaG82gSIUayFRdkUv6x2an9NLJR3R0/mU8d8lfP+MsL1hqJl8vYhI+gBFOyAuKsfcH1wHvqH3B3nIvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnBE/8qM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8Wij2946650
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vI1iYCC4ve0sLABc7uHyTN
	dTtnKBM3f3GEMDPZMlmD0=; b=XnBE/8qMZs2Tfqd5yF+7dO/dPr9vGz5bNTWTZ4
	lNDsFH7XcfMOZT/7dDsS8eXPUXRWI3W/zxQjDWovbBoX6xCkNVVXcstAAmAdOFgK
	y4/XO52pHf+N8zs5oi8U0+BLf8QPrtXIiHoC1bJVoKJeurWQVugaYXbxTjgAvedj
	whVFfZ/Cr0r9ZrlCVK1oQLWqXACwz9e82mni6dkBXIlhElZd7x2CbtJLHhbO4Ibn
	HrmvLzK1Jih+q/FbNu5s+FdP9+raya6YtoCeGGxbSSvl2uxiTqQVVPn6Vb0zf3kS
	Z8dSU5d8OUNhEtqIW3zExPXuEiJp4VOgksv9Jxx4IUtSvq3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14ftg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e88c912928so137443241cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568024; x=1762172824;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vI1iYCC4ve0sLABc7uHyTNdTtnKBM3f3GEMDPZMlmD0=;
        b=MqZ59utSy+tbbbnQlakDHtqZgOsiARJeK39H8KpBJLQDMmAFYxialPwcVncDIeXUer
         PgTq9OCN4M9G4h0wR+OEs4bmbwzdNqtYTH3g+QG4DAEyyMFb684HMid7+fPPloRK+CpM
         ne0yFqQmwE68BzZG2MfKjzSavSLo2ul6AfC1y9/oi9Xy6bOpieYRQnB1nIyaHxoVrEiy
         w5BjgwIgO1mClJV06ZrGLv56kZEm0O+ozdPegWczEeXkpWflV5mQvtKYyKxOdI+pjYgj
         XClX8uVCESpFatXtTUXJIgH7GNoLjnEahSAss6qEK9077sbId/WfWeWy5awrJP4+C1ZT
         0KUQ==
X-Gm-Message-State: AOJu0Yxh5Ov/Rh4WyK2pNICGl0fqDBlPo6kSkmS/cqJ8hGBil/qoWt1c
	SqtNnXU3h/kqYTqoEQflS9CriPVufftbJ4vqw49eSvROeljM68iDsC8txFyzQ7Dl7gFAebnaUJB
	cV0sXuzCzsphRK+fbI6yor/8eVNw2Wa/jaXA0BZWJWzUYAF4TNzqaG8zpp8tI00vimQ==
X-Gm-Gg: ASbGncuFGHfR+q+7r3YDvzeSuEasxwbOepsONamGtcW8INWsz8O4fcx0Taw5fX2WR8q
	Id4mwrcn2cp6e+5a8vWZb9BaI8oK5C1/5mJy2111+QE1F1sbd/DL6GKsziW2nfNnZlRTuWLxUOI
	w1/DNdFVJm6BgeQatYNhJameLAS9yPsM+lmkS7zVkkGif+2fuxzoAJ9ToZJ0UwU8JYF9Dwq3Cy3
	u+x71pyvZEC8+gzRxmzEnUlLK/CRwK3Pm4pac/66bAYuk85OrCL8iJ0DHF+Q9N+7yqr5CqRnFMg
	T8E1DPqHO5jrw3MY3KiyPmG9xqu/LrDGckoMukrPYKfwG4DelUhxWrbTRmP31UsTr/SRgn4fHR4
	GCuyM8jUozRhgPPfnLv+alLcONOGJ88zhFDVE3lC119lBzcb3EMrc9ZVfc1A0BhNT3ii4vUgP/0
	ool/8T3IjcXf3P
X-Received: by 2002:a05:622a:1827:b0:4ec:f153:356b with SMTP id d75a77b69052e-4ecf15346f8mr61419181cf.11.1761568023457;
        Mon, 27 Oct 2025 05:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjpGGobHSfTTedlviPN3oKKeNzeDOmc9TtNO2F2aeHe6VH7S51q/EPz1AmSgCF8HJOz98cA==
X-Received: by 2002:a05:622a:1827:b0:4ec:f153:356b with SMTP id d75a77b69052e-4ecf15346f8mr61418701cf.11.1761568022969;
        Mon, 27 Oct 2025 05:27:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/6] media: iris: port support for Qualcomm SC7280
Date: Mon, 27 Oct 2025 14:26:58 +0200
Message-Id: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJl/2gC/3XM0QrCIBTG8VcZXuc46pxbV71HdOH0WEJlaY1i7
 N1zg2CDuvngf+D8BpIwekxkWwwkYu+TD9ccclMQc9LXI1JvcxMOXDKAmvroE01G8Qaos51qleO
 isQ3JH7eIzr9mbX/IffLpEeJ7xns2Xb9Os3J6RoFadCCh0xKZ24WUyvtTn024XMo8ZOJ6viAYX
 xN8IqTQTFcgayP+EGJJiDUhMuFEZ7BTSnMJf4hqSbRrosoEYm1NHlQV+0GM4/gB3LuYUHYBAAA
 =
X-Change-ID: 20251006-iris-sc7280-fdb797f238d8
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4523;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p4aWbdd50eAVtJKt/uKdmS5uIMnunOHZbwNtVYNRiI0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo/2UUxaQhREj34mGUSLxLWizps8NuGhM6hNRow
 0hmb4yqBSKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaP9lFAAKCRCLPIo+Aiko
 1cmJB/9uirBCm7GcZ+2bg5PQt+Odwe7DFmEqOETisEGeLZ6TxKU5wMsKzF8d7TOyaJjlHo4qElP
 IimSbQ1+tGvAC1Fkgd7yLFAeGgVFOi/BcZDXTCjQ4o5vZ9qO5CvdzT657tb5uZpf8fo2+E7RfmG
 0wqgioASJyjPFC5Wlv3rouGE4lXFShlgb2MdYXN6eunfxW7J1C6OYuA1Lj9JlpzfbpKqM22R9Vg
 DJuz7+OD1iXAiixZE5yeXnC+oMAUNNg/XdH/3ahdZwP2rxEvCbwbFnewiAaffe9myLGyZTintJF
 bSlDaYor3I1C8FLhVAa7pE+Ktv3tIJVw90I03RcRjT+J3DGU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff6518 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pcU2kZSltczg-j7lHUUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0mrxWYpcyWrMWgCI9VRANUVUY6z2j0K8
X-Proofpoint-GUID: 0mrxWYpcyWrMWgCI9VRANUVUY6z2j0K8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfX85mqZHdqrpVD
 lxNzltk3SVUk67Z30flNPNFSalZzpzdDvUtQe26Jk8QO2jpSLuwCXl+drxTdPaKOQqvg+Zk4rfE
 H5wRcEbvV0DwLQ1f5tCRqrIkd6UcEDiQ5b7ua2wf0bvSMlr18taeBCC30teC6Nzc/y0kZhwn7mY
 6KnBgUos79qXp172+D4rU4Bzkd3nBCQwIqIcPhTOn5e7qf5+igi68SEGV27sKtHIUqLLBz3e+8d
 wxWBF1k8a1WEl5dB3thFMo3Sk/bsYwA90L+/9exz5yu8L/I0A6UwsvJFuhpVeVb6tE8imOaexZz
 s3VNXfa1ljJtoSqsTED9vcBxy5WvZJ2i8nH8mcXGHxrPYk37Qb8vZ3c/W0jUmC8pd50IW+HJD5u
 zTQUJBIPqhmXtZfsT1NLwJ8dgZt/Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

Port Support for the Qualcomm SC7280 aka QCM6490 aka QCS6490 platform
from the existing venus driver to the newer Iris driver. The firmware on
this platform uses the older, gen1 HFI, which puts it close to SM8250
from both the hardware and interface point of view.

Test results:

$ ./fluster.py r -d GStreamer-H.264-V4L2-Gst1.0 -ts JVT-AVC_V1
...
Ran 76/135 tests successfully               in 16.903 secs

$ ./fluster.py r -d GStreamer-H.265-V4L2-Gst1.0 -ts JCT-VC-HEVC_V1 -j 1

Only WPP_E_ericsson_MAIN_2 succeeds, this needs to be investigated
later. For other tests I'm getting:

qcom-iris aa00000.video-codec: session error for command: db800000, event id:1009, session id:4bd48000

After removing several test vectors and running single-threaded:
$ ./fluster.py r -d GStreamer-VP9-V4L2-Gst1.0 -ts VP9-TEST-VECTORS -j 1
Ran 217/292 tests successfully               in 136.210 secs

Disabled tests:

            "name": "vp90-2-18-resize.ivf",
            "name": "vp90-2-21-resize_inter_1920x1080_5_1-2.webm",
            "name": "vp90-2-21-resize_inter_1920x1080_5_3-4.webm",
            "name": "vp90-2-21-resize_inter_1920x1080_7_1-2.webm",
            "name": "vp90-2-21-resize_inter_1920x1080_7_3-4.webm",
            "name": "vp90-2-21-resize_inter_320x180_5_1-2.webm",
            "name": "vp90-2-21-resize_inter_320x180_5_3-4.webm",
            "name": "vp90-2-21-resize_inter_320x180_7_1-2.webm",
            "name": "vp90-2-21-resize_inter_320x180_7_3-4.webm",
            "name": "vp90-2-21-resize_inter_640x360_5_1-2.webm",
            "name": "vp90-2-21-resize_inter_640x360_5_3-4.webm",
            "name": "vp90-2-21-resize_inter_640x360_7_1-2.webm",
            "name": "vp90-2-21-resize_inter_640x360_7_3-4.webm",

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fix typo in the commit message (Dikshita)
- Dropped .min field for PIPE capability (Dikshita)
- Corrected max_core_mbps for SC7280 (Dikshita)
- Link to v4: https://lore.kernel.org/r/20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com

Changes in v4:
- Dropped the inst_fw_caps rework, it will be sent later after rework.
- Dropped .min value for PIPE capability, set it in the same code path
  (Vikash)
- Adjusted clock index names, clock names and num_vpp_pipes for SC7280
  (Dikshita)
- Squashed the SC7280-specific codepaths into the iris_vpu2_ops
  (Konrad)
- Dropped the register moving patch, it is now unused.
- Link to v3: https://lore.kernel.org/r/20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com

Changes in v3:
- Included the header file for the SC7280 platform (LKP)
- Link to v2: https://lore.kernel.org/r/20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com

Changes in v2:
- Expanded commit messages to explain some of the changes (Konrad).
- Moved platform_inst_cap_qcs8300 back to the header (Dikshita) and
  added guarding ifdefs to the haders.
- Merged SC7280-specific ops into the common implementations (Konrad).
- Split SC7280-specific config bits to a separate header (following the
  Gen2 split).
- Link to v1: https://lore.kernel.org/r/20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com

---
Dmitry Baryshkov (6):
      media: iris: turn platform caps into constants
      media: iris: turn platform data into constants
      media: iris: stop encoding PIPE value into fw_caps
      media: iris: remove duplication between generic gen2 data and qcs8300
      media: iris: rename sm8250 platform file to gen1
      media: iris: enable support for SC7280 platform

 drivers/media/platform/qcom/iris/Makefile          |   2 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  18 +-
 .../platform/qcom/iris/iris_platform_common.h      |  18 +-
 ...iris_platform_sm8250.c => iris_platform_gen1.c} |  63 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  25 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 534 +--------------------
 .../platform/qcom/iris/iris_platform_sc7280.h      |  27 ++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_resources.c  |   2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   6 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  34 +-
 11 files changed, 161 insertions(+), 572 deletions(-)
---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251006-iris-sc7280-fdb797f238d8

Best regards,
-- 
With best wishes
Dmitry


