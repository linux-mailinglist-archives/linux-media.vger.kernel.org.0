Return-Path: <linux-media+bounces-40304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FDB2CA0A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC11C7ABB0F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0131B2D2481;
	Tue, 19 Aug 2025 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjrqhiJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B902C11FC
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622530; cv=none; b=BVCVeZWSadLajLCMgl7lcszVCwsU8Sv2bMoYM61IzSaRMZr31r1LRrSQ7njNPzuc+v9g1YcBzYXVAAIxVuMSiULbAwmhxPI8YVazcf+bqItt8vlewDL2BoEi1yNQEaX6ShGPNzP+DaknWF1LWQYAXO/ask/Jph7KMfV2PflQkks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622530; c=relaxed/simple;
	bh=2ZRbuPvYC6oRzM87T9GeGlPgKgqCWbckD2/C4WLdouc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hXSx+Ca98g/VBEshj3Ax9J0NkH9DIhJjYWNztfSjoK+ErOBjlasjL6JGWQISR5WZAqjq3u/B3DFYRjAz9Yk9wJwFlLzftNWvcPa9pSrHzDIdBX4toamwYsrXIW7wyBtxm4TZdoenHV3WSOR2FO8qIUYMhGaQaG1BEkny61CDuRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjrqhiJ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J91D77019196
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lxGdvDmpMuyotVw7HhhrfP
	F8xBOSTfUPJO1/oKHwM50=; b=VjrqhiJ1vOc5Ku3qDEw2J5jgIVOOGOqoZvRCds
	0SHJzYc8fyyJmbwhEQh0P45KWT5ZFhE7cjlvHa5l7GrPPJGOr9POwhsdS/C+JE/z
	FfLnCK4g0eRdBufZ+Dy1uEzoRvNDmHMqKulx1URPdMIrLw7bx9GJpAYDXbe8r9Wb
	DBTiFuNbQcY+ZJRmzm44KCpe31Fa+N8AaP9H/wphD0TTeQsXaN2/AlZMu6VO06Wh
	4ZfdfyrAswK+d8BEna4rDUi491PVAG3bZvF7BQ21yMThS8NOd3UlVJZLbek0N/ZF
	tU2N4PF1s9wiaWR3d5Tsrgp6WUyRrL22cqtfJD48q9CBKliQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0798wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f4f3ecso65910885ad.0
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622520; x=1756227320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxGdvDmpMuyotVw7HhhrfPF8xBOSTfUPJO1/oKHwM50=;
        b=gFUnd6IN8xKV7U/C3DcaAsIXTrEcXpeJ8YSuZVP3XzvjEAhvWOC9E1Zhap0gGUnTmG
         62OKjVaujFAjdfbeM2n0qByn5dnorOUrmRsaYdOv8LlEHWoCZL9sLhFnc+WpG2Vc5nr9
         DGEJ5QVzqzC9puvrLkaSyrBlpTVNG0i9+X3jh/eBJU4CvdkrQciTmBI5MgTA4Xtt6eAn
         eE+73GSx1PwXqrBRRs+TMKYc9tB78tu/A5cct7Dz/bDwJMlS6nl8RffsazEug0Mk6C54
         8bXDidu0HDiAy16Kn4KSNYRZD+KsrKknu+JhT1eaw7c6CEGB+0TNHJGrIRor5y6Sn5Bp
         sJww==
X-Forwarded-Encrypted: i=1; AJvYcCWZFdzfuhHA/pbp4HWCAUnDdmTyevIck8kNuEUlkaPAqr/+EulPU4FIUJy3mVrmvn1l2d0GhudfeBTBmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXj6H8Du1poydDxpv0hiFAATlvjMerSFf2aVRtcxtsWr3c1rdU
	Gak/xRBYM8v1LuzgFyFRQJkazFAaX2/7gTKMzpVj6L3fMLdnErKD4rgv7baQfDlU8KTG6gxn8cK
	d2TjeFTeef13CsvR2/D8Iw3uIefNa05wcygX7FqF3xw/Wwz7XGLtFy2PJZrqELgKGow==
X-Gm-Gg: ASbGncvImEkBEmK9dniYJoNr4mZUkCtzScAJdUrQRiN6Zj7MVlzw/uVK1epNyidSrRO
	d8GPraeYXXSEjlCYBaMju1w4Fwyms+HCtH5gl/RYYbXErBpnkD+X9iNQWtHYa3Ategu1AOkiBCl
	vfm7clza9Ow5HP8xGFHgc/1GgjVoWx3J9r4jSCoybZYwBBCKuQxUlSmTJM4MA3N+KqRIGsZFHoq
	q7nn5Vsb88zuKyyORc2KZEPzIiB9+dNDpFxpkls6gJOmrPnDf0Q3xJn7gRJRNfwWvONIHeScIDM
	NPwfdNCp3CsQyLbXsxOkj+Ug4M/Vt0ytbM9MLPJMbBobHXfbb7HBW4X8RqoARE4RTOc=
X-Received: by 2002:a17:902:f682:b0:240:3e73:6df with SMTP id d9443c01a7336-245e045ce13mr36796215ad.14.1755622519751;
        Tue, 19 Aug 2025 09:55:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBqUj+M1IP/W9sLHQS6YdJGjWFVd4K75u/YtqS2UBdv1Sz8Bxe21w4wybcIi+r90GeTOFKAA==
X-Received: by 2002:a17:902:f682:b0:240:3e73:6df with SMTP id d9443c01a7336-245e045ce13mr36795815ad.14.1755622519236;
        Tue, 19 Aug 2025 09:55:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2 
Date: Tue, 19 Aug 2025 22:24:35 +0530
Message-ID: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PfzdWUEyRSsXEbIUuMZvwFYzXeNl0OPA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX6kJz4egcMWhU
 ctjRjiTb7x2fqJRrlj6oDLI1xDLdIoIGkEN21ObkPxmBLqC4terXzb67BgyYrSNok7wxMov106M
 laBoz21OsF8WFaGtBnTWrr/QNW3ZmZAcvfwITLlXV8oNmfjX3IE7kLSDQOhn2NmyD2kp5nyz56b
 v5fCFI6VhfdwNS8zfGpbvxb1GnWcX6RersTjQ2t4Ffm5DMasIv9o471CEKoKHL9wIC3bpi5Pqsc
 IbP1DyHdmdYJMs/NLZ/7Wy2KLSzyRt8XucBZuLmFKujdYrcpmpA/xQx6eZgS4Q4LEIRrDqXl77t
 F+ou1y5H+6DplS2LDQCUSfVUrWEbemuLHnCHDAMyRdKtrD3qCP/VicVwKy1qLJgt+8ezAf/CeG/
 Qzbjr8T9
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4ac79 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R_P8mzuY8g6UZThHr3UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PfzdWUEyRSsXEbIUuMZvwFYzXeNl0OPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

This is a further continuation with a new approach to the topic
discussed in [1] regarding the enablement of Secure Peripheral Image
Loader support on Qualcomm SoCs when Linux runs at EL2.

A few months ago, we also discussed the challenges at Linaro Connect
2025 [2] related to enabling remoteproc when Linux is running at EL2.

[1]
https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/

[2]
https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa

Below, is the summary of the discussion.

Qualcomm is working to enable remote processors on the SA8775p SoC with
a Linux host running at EL2. In doing so, it has encountered several
challenges related to how the remoteproc framework is handled when Linux
runs at EL1.

One of the main challenges arises from differences in how IOMMU
translation is currently managed on SoCs running the Qualcomm EL2
hypervisor (QHEE), where IOMMU translation for any device is entirely
owned by the hypervisor. Additionally, the firmware for remote
processors does not contain a resource table, which would typically
include the necessary IOMMU configuration settings.

Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
Authentication Service (PAS) from TrustZone (TZ) firmware to securely
authenticate and reset remote processors via a single SMC call,
_auth_and_reset_. This call is first trapped by QHEE, which then invokes
TZ for authentication. Once authentication is complete, the call returns
to QHEE, which sets up the IOMMU translation scheme for the remote
processors and subsequently brings them out of reset. The design of the
Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
is not permitted to configure IOMMU translation for remote processors,
and only a single-stage translation is configured.

To make the remote processor bring-up (PAS) sequence
hypervisor-independent, the auth_and_reset SMC call is now handled
entirely by TZ. However, the issue of IOMMU configuration remains
unresolved, for example a scenario, when KVM host at EL2 has no
knowledge of the remote processors’ IOMMU settings.  This is being
addressed by overlaying the IOMMU properties when the SoC runs a Linux
host at EL2. SMC call is being provided from the TrustZone firmware to
retrieve the resource table for a given subsystem.

There are also remote processors—such as those for video, camera, and
graphics—that do not use the remoteproc framework to manage their
lifecycle. Instead, they rely on the Qualcomm PAS service to
authenticate their firmware. These processors also need to be brought
out of reset when Linux is running at EL2. The client drivers for these
processors use the MDT loader function to load and authenticate
firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
to retrieve the resource table, create a shared memory bridge
(shmbridge), and map the resources before bringing the processors out of
reset.

This series has dependency on below patch for creating SHMbridge over
carveout memory.
https://lore.kernel.org/lkml/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com/

Series is tested on SA8775p which is now called Lemans IOT platform and
the series does not addresses DMA problem discussed at [2] which is future
scope of the series.

Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
 - A lot has changed from the V1 and a fresh look would be preferred.
 - Removed approach where device tree contain devmem resources in
   remoteproc node.
 - SHMbridge need to created for both carveout and metadata memory
   shared to TZ in a new way.
 - Now, resource table would be given by SMC call which need to mapped
   along with carveout before triggering _auth_and_reset_.
 - IOMMU properties need to be added to firmware devices tree node when Linux
   control IOMMU.

Mukesh Ojha (11):
  firmware: qcom_scm: Introduce PAS context initialization helper
  soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
  firmware: qcom_scm: Add a prep version of auth_and_reset function
  firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
  firmware: qcom_scm: Add shmbridge support to pas_init/release function
  remoteproc: Move resource table data structure to its own header
  firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource
    table
  soc: qcom: mdt_loader: Add helper functions to map and unmap resources
  remoteproc: pas: Extend parse_fw callback to parse resource table
  remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by
    Linux
  media: iris: Enable Secure PAS support with IOMMU managed by Linux

 drivers/firmware/qcom/qcom_scm.c              | 360 ++++++++++++++++--
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/media/platform/qcom/iris/iris_core.c  |   9 +-
 drivers/media/platform/qcom/iris/iris_core.h  |   6 +
 .../media/platform/qcom/iris/iris_firmware.c  | 156 +++++++-
 .../media/platform/qcom/iris/iris_firmware.h  |   2 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 147 +++++--
 drivers/soc/qcom/mdt_loader.c                 | 199 +++++++++-
 include/linux/firmware/qcom/qcom_scm.h        |  27 +-
 include/linux/remoteproc.h                    | 269 +------------
 include/linux/rsc_table.h                     | 306 +++++++++++++++
 include/linux/soc/qcom/mdt_loader.h           |  41 +-
 12 files changed, 1144 insertions(+), 379 deletions(-)
 create mode 100644 include/linux/rsc_table.h

-- 
2.50.1


