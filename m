Return-Path: <linux-media+bounces-43892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AA6BC34DE
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 669623C5AB6
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2631629B20D;
	Wed,  8 Oct 2025 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ij/OZpbL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192729AAE3
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897994; cv=none; b=I0nmBDWgI4s5XqVqvp0+SY7qkkdmI7jjH/q95Ttiqy01iqjRlKkwaITW+NRCjq6K7yvD6lWBW/qoNLHGLBR0GfxTNTAUMZ5sG8h9KV3CQW1CbunOWOhfJYkRZV3vBQNvpeMEJ1sEWxOXgWpurTSPOkOa63lCIPyyLukJIdoGOOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897994; c=relaxed/simple;
	bh=fvPWdThtzVXnEcTCBEUKwE9cNmEthjmnIpUjf2Z9U30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hq7Q+Hvq41nRdRrIbWrv5dMg9fOQtX9WzZBXWHXkVx1a2Iyqy1Njn+HXghIlQI92qfOnDBMVE4ncl0NS1g4QHzRcV3H4ci5eu3pTjn8n0+tCUiYNSgKmKUppzqNBKNWleLM8xorfemFptVnOuVgoa7O6MplL3kRN2AGvF0+xdgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ij/OZpbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803XEV028388
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 04:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tV+fAcMEfIF7YDUmtKrzRM
	DSxQ2QEUdhZrGwlyS3Css=; b=Ij/OZpbLMH3dTQ71tWfOELiW4Adrg0UHXbL4Yj
	CCCL8Pq9+r7LXx1xa5VAEKOkkwbSPaonjNkuOgRwZkqSfKjnLom1rrlb1LDZPBML
	OsW9CWlj/Gr75Zqb/OKoCIc5To8mnHkNumDB8Q9X7qPQdyvtUgwNkwSrEQDOXhMv
	H0BtjdFXnNmRLXH/SyOH3hSqxanwiEw6mgxBtpO6lDnQca1BrayHvdiT1W7/cDB8
	T1TFSUS4WGl0YViUjhQnAqnh38ZjSgMlhVWmjZVESHrl3KHoPa6NN+PhJ6+wFCC7
	ys2pxKsdvzGJBYpmb3s5IH1SsRqF5tUIM8dumQTJuZ5Uwy6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hh2eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 04:33:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df80d0d4aaso135935061cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 21:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897991; x=1760502791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV+fAcMEfIF7YDUmtKrzRMDSxQ2QEUdhZrGwlyS3Css=;
        b=pVEObnifNjQxdhZvx4AAJuAva7ZlRGVCDXPhQ6VZMwPydaPvIJs5EYkMld/49hXusC
         H9eI+FDAd7C6RfGOYuU6vwehGB86hEH9dCtfaBG0eFQUokKZmO2aGGrfvlP3j74bEBQi
         qFe+HbbJYWB7DfUEEfXkTUE6sK9IJ+qmXrdbcG07HSgm5WzQDi1N7awIkxD4qnxzMuXA
         WJ3HS2DI4xWXgIx9GtcbZ+mrHCScx28ktBEDPwXHtI1gOqBBS8a+qtfcjKVzXLd9yuRI
         5g64I6IJ6oKwcTOIzgSLHyfXwDL2tjMyTiYQZnMrvbQvNlfgDPJU9wHKaV0PjEkKKlJp
         rVoQ==
X-Gm-Message-State: AOJu0YzjNGiCcbBXRtKBMWXwucmMlTokGDWFMBkhKi2zfuXOon/a4ZTh
	1Ht54ge66/Asphu5eU2pXZrXE/EAn0HrQ6LKUHtewSRzOez+kH3FZf85ZKb4QcrnKTIPHpwWRLV
	qi7MkgiNzVzye3VE4WCukToy819syKRPKdPDgvcWrDU7ACcuTQ44YEoM98MzLTS9o1w==
X-Gm-Gg: ASbGnct2mB4m0mPUrQ/FqEtfi8kWlsxLOxFQIDfXdsL2wfyfsBIokURkwd6WLl8C90x
	+e3KqnNuU3KopsnSc2eZdDUcISD8PL36XlsCyEBJD2Q3qh2xhFPzQwGnGBd8A52u7Nr4PMsRw85
	gnem7WNz/Ahfn4Yey1S03SqDDgXECnjEY/b1N6pEZRCATWBQKpV8sfN1+R+G1R2EBKtD15ROVXF
	4f/+WYp8JAGnT4h+Ca1Vtky0xZmlg3Yn75KGppfsAEZ9ktheMES8kyTnnHmLaPOsLPm1MJPun9P
	NRCUYijhgZRaSmmN+eXZ523VJx8XPXetLdzkVK3nVHRB2tZL9iU79NB6nQo4BR/7eyaxr/dFDjo
	lj+LAWFkDto92n6GS1XHiOv+vZ0KfUjOvcgSzT3jUpjetUPNSQZEfc2ZT7A==
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id d75a77b69052e-4e6eacf551amr32722251cf.31.1759897990511;
        Tue, 07 Oct 2025 21:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5cqPTMIUFXW/ckUwg2o1NmQTEyVte2AvoF3DXTDqNpQo2egjDieyitjMzxfNnimbEIu2bng==
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id d75a77b69052e-4e6eacf551amr32722141cf.31.1759897990051;
        Tue, 07 Oct 2025 21:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] media: iris: port support for Qualcomm SC7280
Date: Wed, 08 Oct 2025 07:32:58 +0300
Message-Id: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrp5WgC/x3MQQqAIBBA0avIrBPUKK2rRIvSsWZj4UAE4t2Tl
 m/xfwHGTMgwiwIZH2K6UoPuBPhzSwdKCs1glBm0UqOkTCzZW+OUjGG3k42md8FBK+6Mkd7/tqy
 1fmIDNK1dAAAA
X-Change-ID: 20251006-iris-sc7280-fdb797f238d8
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fvPWdThtzVXnEcTCBEUKwE9cNmEthjmnIpUjf2Z9U30=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emCaMIPwoiG8mOozyw2v5/0eCFjb0PfXeUuA
 60Wt1Nv5ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpggAKCRCLPIo+Aiko
 1QGFB/48mauTY+lGnxyqQqV5UMiXhh7qTJUDdJANarZRtbV7cDX10TnZ/iYydFNIaacTe+jls2w
 bU7KeUhn7ReOeyjqAvf3nGY3KBCcy0QiOI9W5gYWYKh9kh0qYGZQkFlg+JWzb+jYY2HvDhHdYJl
 KRlEoZVCybMnHNIPp3cMNWPQZCCq35/VHxA+TiY3jRF+GUOa5mKvHVj/3sdQXZUjcmK/OCIPQs2
 IDL0uIh7p6UsJUp0hvDwD8v/G2hY2nXKu2kcgUU/cGXl3iEogGNXLcWXAt6P5/IsBjnousQGov2
 jeLdRYbivufCLN4tBEhl6TDLt5NH74yy4Wn8r+ZVU/UvorM/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX+i5pNkFIGYGK
 GqGBJSGQ3Ihcf+WzgBbomJGNZ16iLo4Wg91Wx97oVkeSRZJsTzGV7WvSyimYKk8A+7A8tIU/hj7
 G9Rau933z4jpB4nvzpBtzA03Fy5AuAB4RtYdLZtVQv6kCBeJv2MdMXA56iW5Z9DlyOg2QTqDhM4
 /ErYWhbUQ/udqBMGUk8yNt71AZwxEIdtUOoFsP+3TnC/IkDnGQbli9oEQHTr60wf+8YeJLsj6G5
 8KDskBw+A3m+MuN+cTp5bLs381z7prCCTdk9t9ey+Tyms6N5a8Xze/CMGGletg7yUHnxVy0ib+x
 3WKb5tHcZ49KYNzvBMjkH3p6S8tJXB91WynsLyMoiv1ritC5t12r8OM5Q8GTLi8qEy1Lzz03eTy
 3ZFLDNZ6ktImxv/BdiyfROBi2ZexEA==
X-Proofpoint-ORIG-GUID: upvCVSXUfWEs1x65D-qzaQxyAL3-PJeD
X-Proofpoint-GUID: upvCVSXUfWEs1x65D-qzaQxyAL3-PJeD
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e5e988 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=-0qgCpxBxD2pDo7pzZoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146

Port Support for the Qualcomm SC7280 aka QCM6490 aka QCS6490 platform
from the existing venus driver to the newer Iris driver. The firmware on
this platform uses the older, gen1 HFI, which puts it close to SM8250
from both the hardware and interface point of view.

Test results:

$ ./fluster.py r -d GStreamer-H.264-V4L2-Gst1.0 -ts JVT-AVC_V1
...
Ran 77/135 tests successfully               in 17.010 secs

$ ./fluster.py r -d GStreamer-H.265-V4L2-Gst1.0 -ts JCT-VC-HEVC_V1 -j 1

Only WPP_E_ericsson_MAIN_2 succeeds, this needs to be investigated later

After removing several test vectors and running single-threaded:
$ ./fluster.py r -d GStreamer-VP9-V4L2-Gst1.0 -ts VP9-TEST-VECTORS -j 1
Ran 219/292 tests successfully               in 134.749 secs

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
Dmitry Baryshkov (8):
      media: iris: turn platform caps into constants
      media: iris: turn platform data into constants
      media: iris: stop copying r/o data
      media: iris: stop encoding PIPE value into fw_caps
      media: iris: remove duplicateion between generic gen2 data and qcs8300
      media: iris: rename sm8250 platform file to gen1
      media: iris: move common register definitions to the header
      media: iris: enable support for SC7280 platform

 drivers/media/platform/qcom/iris/Makefile          |   2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 246 ++++-----
 drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
 .../platform/qcom/iris/iris_platform_common.h      |  25 +-
 ...iris_platform_sm8250.c => iris_platform_gen1.c} |  76 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  44 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 550 ---------------------
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 130 +++++
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  35 --
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  43 --
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  56 +++
 16 files changed, 440 insertions(+), 789 deletions(-)
---
base-commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
change-id: 20251006-iris-sc7280-fdb797f238d8

Best regards,
-- 
With best wishes
Dmitry


