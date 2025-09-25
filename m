Return-Path: <linux-media+bounces-43148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0201B9F047
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 13:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B947C1BC7E9C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 11:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4AC2FCBE9;
	Thu, 25 Sep 2025 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7qW1Q7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8ED2FB995
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801266; cv=none; b=eKQvEHQ969Ux9vozxEtGmgPrMh/Ot4IGEg5Y/WejqBd8gCJJka70XTkymzRz5CMsvfLL9i9ekLRAQIsoafYm9RxuGUElNlJUdC8f52h9k/GkyXI/DncvOynFI3YS6uOeLq2XAeBxS0jvXnjI8H+EM1SZhSB5uD49rKvysY6IH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801266; c=relaxed/simple;
	bh=SyjT/o2z0dyOG2o4BytzIRC4dNs1eO2vwpK24YRaEkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oznGg86R0U+NXfy7Tt13Ui0niYP8Y/uNPAZi3XKIbpRmJmaXx+FsnaL4tLrHpgffjMV10wa4evmvUChWPMhkAvESykneMVOx3q6OktKSxmC/ldUZ6CoeFLOM1G708VGcOgZ+5j+OceoDSrpyqTjoJ4kvvsZjcceMTgTkCBLunrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7qW1Q7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P982xW023856
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnY
	dDBg+Vjw=; b=k7qW1Q7/SptebFxWY3QJgijbjb8kx1guveuj61ZnjJ70SxrHSW+
	f/VugZaQ3HWw2ZT2ZS6sc4FnUoU+GuOzNJRe0M2lsvohTQObbRUjW8lI07u2F0C/
	giMUSgAWEAoaJXSP7lYSJfsS30efuoGi/87V8OuMMiwUoCAy5cB8Z4WBJo0p1TA7
	lNjK0WfXeyg3tQhDO52kp8x2pf0gXnnQyFS0UhkRQ+ajz4eLDv0ellFi7io2DmCx
	R1Uu5DVRCGHJqcH1pZFekAlEJGpJjhpq/F7rD7aFrklQOvryXADtEu0LhOuUENxu
	xf9Z6s33PlONOK7lZPF1n6gp4+zj/Zi2nfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0f01q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 11:54:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27c36902f42so6760135ad.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 04:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801261; x=1759406061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnYdDBg+Vjw=;
        b=qZaBlfDHNu7U71VK2ahcXwvFh/p2xd8FVkTQxjhtDNnlO5bue5vKcqqYyNIFkekAau
         xLd9WJPBkJR26cqnEAN5DYfeqB76Sgs4cUGh5uWCMNFC/0vLurkvkS/eD433WGMAxB8w
         +F5wz4Up3SaMNTiaL3vYPgVx0Pp6lYOwweWTn4Qtm8bBGtVfifnklrkGswGLr0CkpSxl
         l22KYxYITbIk2F4pVwD0SU19oUiG+KISaPUe0p384+3KvFirbUeOzXB4hGoWrETtY1eH
         Ig8su4zegJM7IVVhpAfVxPABf1T70lPeMYqIy9BrKRPDUWbwYCoM6OJLMMdh2baIZdil
         NO0A==
X-Forwarded-Encrypted: i=1; AJvYcCWqq/okz/xt537IUTAmoV7wVLOp88lB2zcDOhuwcvm41gtY0iPq4kLtMfdSKh7K5ouYrxlcS35fZgF/7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzXVsGmHqqI8+XHng7mEnb+VcFryZnSDImbwwgr1dJcBY2ath
	JDLeODf0VXxDgJPvRDKhsorhmAAtCiNSQZ7XH/iD1vKrbE9+IdmPFNUoiPkCdijQC+IKVOGeZO3
	NifTzw7uRPyG/FsulanDWl00JBi/VR+JTHf7+VdwCzrHugjAn2CvoEHecDrKvLWDhYw==
X-Gm-Gg: ASbGncsbzT/r4+oNdwYY1XG6JOuRn7NSxcpAaESQLOn/1WNVgbohZeBOpsol6g7EPYT
	w1/iyFYgfA1S7go1CsR3xUhFSXuweVxy2NkgfbAS9ohVzFsOUnChTzAEKlFhyAmadgjtAqOr3cR
	BGkSryxuGh5TRaAfENPjidz6J+3syMjzVXszv4KsBFTqalRmUyIvQJG27lxJSFAhKLTds+mGjW8
	jvJYpYiYinB5q4FeL7+P8UuhI517gBmvgg5FrqRLl/k4KtNrAP4QzKhPN5bpYjy1SxKEcxcSA37
	6zhnfx/TuDoMkqc5apXdN8UGEHPmRasSnm8ZpUduKoW4C5p4wBBoXBtHFWvzO71zmLWZ4XQnB+0
	=
X-Received: by 2002:a17:903:2c06:b0:269:ed31:6c50 with SMTP id d9443c01a7336-27ed4a091e8mr37880555ad.10.1758801260821;
        Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuENIT7uqE/PhFHkktSwABTjczamPHUaUnB2zTV5WRthAd1QMusVFWwc0an+6Xwk23xxnGrw==
X-Received: by 2002:a17:903:2c06:b0:269:ed31:6c50 with SMTP id d9443c01a7336-27ed4a091e8mr37880135ad.10.1758801260297;
        Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bb502sm22087935ad.118.2025.09.25.04.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: [PATCH v8] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Thu, 25 Sep 2025 17:24:10 +0530
Message-Id: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d52d6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=AcHsLZsjNhMhd8_3HEgA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jO4bFtukXVE6OBmZ11qJ6ek6ferUND1-
X-Proofpoint-ORIG-GUID: jO4bFtukXVE6OBmZ11qJ6ek6ferUND1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX6LTql3xLOZPn
 2Dl8Bw//Zwcx0GgJBC9isAbqA/xMUoQuxMmoaOOZOyLGeWvXkIOn1pLOJM1aHyBdUl90/FJ1BKB
 xiQTVBvcOzbqJwSXXS5Ll25MmVZ0Xko4iusmj9oQU+B/6jqLjcgvwZholNF59QxVRzAaQ5j2oV2
 L/c70TdKo24xlriJs1j8REeCKqPJsCCrZAYqTPFQsr6RMxHqWqBZ5VR5KNxvbz996LjnAHzReVu
 AnM7sd2w4y27QgZnuaIkiAMe2U1M2IDV34HDMYROm7txHVoSrYKbBNbT2Dr6/ZbbwfRtokZl+2L
 k61urRNFcELBwwzmi42YXgJuUITOLc+YxsxB50OpfTno9k8N6vD8EKYLu1zo1AvfK0ISpFqTG2V
 qtPFG4YX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

The I2C driver gets an interrupt upon transfer completion.
When handling multiple messages in a single transfer, this
results in N interrupts for N messages, leading to significant
software interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI)
mechanism. Enabling BEI instructs the hardware to prevent interrupt
generation and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v7 -> v8:
   - Removed duplicate sentence in patch1 commit description
   - Updated with proper types when calling geni_i2c_gpi_unmap() inside
     geni_i2c_gpi_multi_desc_unmap().

v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - dma_buf and dma_addr for multi descriptor support is changed from
     static allocation to dynmic allocation.
   - In i2c_gpi_cb_result function, for multi descriptor case, instead of invoking
     complete for everry 8 messages completions, changed the logic to Invoke 'complete'
     for every I2C callback (for submitted I2C messages).
   - For I2C multi descriptor case, updated 'gi2c_gpi_xfer->dma_buf' and
     'gi2c_gpi_xfer->dma_addr' for unmappping in geni_i2c_gpi_multi_desc_unmap.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function and
     so avoided using external variables for DMA_PREP_INTERRUPT status.
   - Updated documentation removed for "struct geni_i2c_dev" as per the review comments.

v5 -> v6:
   - Instead of using bei_flag, moved the logic to use with DMA
     supported flags like DMA_PREP_INTERRUPT.
   - Additional parameter comments removed from geni_i2c_gpi_multi_desc_unmap
     function documentation.

v4 -> v5:
   -  BEI flag naming changed from flags to bei_flag.
   -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
      file, and Block event support is checked with bei_flag.
   -  Documentation added for "struct geni_i2c_dev".

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support is
    moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.
  - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
    struct geni_i2c_dev.
  - Removed the changes of making I2C driver is dependent on GPI driver.

v2 -> v3:
  - Updated commit description
  - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
    "!is_tx_multi_xfer" to else part.
  - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
  - Changes of I2C GENI driver to depend on the GPI driver moved
    to patch3.
  - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
  - Added description for newly added changes in "qcom-gpi-dma.h" file.

v1 -> v2:
  - DT changes are reverted for adding dma channel size as a new arg of
    dma-cells property.
  - DT binding change reveted for dma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues.

Jyothi Kumar Seerapu (2):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |  11 +-
 drivers/i2c/busses/i2c-qcom-geni.c | 248 ++++++++++++++++++++++++++---
 2 files changed, 233 insertions(+), 26 deletions(-)

-- 
2.34.1


