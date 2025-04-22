Return-Path: <linux-media+bounces-30683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56105A960BA
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8323C178E28
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 08:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598A8248864;
	Tue, 22 Apr 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfhG0rVY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5002417C3
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309684; cv=none; b=CO+o6ICkdpgmOaNRYcHCLcpgHH9CHOeP+t0u7Ueh0ZY9O5Vna20JStwSBkDxtHW8z3WFYpnB7BEq+eJbFbpjntU1ffiT9HJFJqk/cV/4uroIv0V0ngzq9j575zs0Z+rtu429mqLvTsKGIY/SjU2dZDBG69KC6YylQlDKk/S0Avs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309684; c=relaxed/simple;
	bh=XNz5Kl5uVluGdR/+MRV/yhIrq/AJ26wsTNvCx8dfzTs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QprOh1Mk1kR6aj33IS3SfX5NJEShFFpwxvnLdCG8FG4V4ufd2gT3EaKc/m6PmHch7AsO24UC0uyiAkqKNbCTnOKuusm7tmXDEQUPljdH71D8yixhaDT/00QKzy7vpl5EaEVJNJAroIyb6pPuznMDx+nM7midqZYtJbk9maPKfuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfhG0rVY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OZkJ025905
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y+BmZqp+BmocGCY8fdjm0nrXEhRxWp5sv8l
	5dSkmpQA=; b=WfhG0rVYQlvlUN5y25edgfBr/aNZqnwSinxSnGpci4tbfkeSWj6
	1+1KjRPPvDaVG2FqODjE9MH3Mb+RlinpSguedUy6ZoxMWMOLBwdY/k418OxA6GDH
	JOBzZ2u04FznGZBOqnZ9kvd98BUaVJSE12YYydrfKcdv//jigRMnZs52c31nAPrj
	HEJboWjbxqMI+8NlOXAfqL69BqLJ3L2X6hW5Y0Bx7WyDpMoZn752KUSbxRK/0EFI
	q3dXYdZdEwBlYiUHQAyAczlgk8Q5WmsRld4jc4K7XHRy3jdMR5IUlJxioHuLFKJS
	nXVYIfRl7LV+L6XyQQMBlCUWtnlfzEbdTjA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjegq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:14:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c089909aso87920506d6.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 01:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309679; x=1745914479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+BmZqp+BmocGCY8fdjm0nrXEhRxWp5sv8l5dSkmpQA=;
        b=bdZcLI9iaiVzDWWzteMNyqF9xLwVLLQDRRaSP3VXuxb+r4ebdk2pgDXkWML/FiHxx+
         SzxKjonQG93Huz6m/FUz/JKLFttc+8CVWWVn2v+/yKdH/m7+vOPwcSbbKEWLcDsTdWcx
         sZwpPOQoeZF63ODoStafmj61EhP01bsW2d2I2MFpa+XRnDX86wnZCoKKXZKjSLI94SDd
         +q3sPHsQsZG9G+T5sz1uBf1fgyAjK58CCMJD67Zn4Dd6Wni2o3OVbS8ukejGuamdMnF3
         TL4SLBPQJ5Hmqib4CyHjy15GfohWaFs7m3wXIaXI0/x5TT1q/MLf6UPq9HCiQSX9PTS0
         Nq4A==
X-Gm-Message-State: AOJu0YzTnmzqSyTL9olFThHXt4wcKBa1px8ZgWPC2vFV9fEeEaeh1/wS
	yTHKyzSOee5sCyFWWjXRPyaeFy3JOzD438avS5bfrgriBMQtbcCCrQMg+3yikOwrlw0fYbkQbLU
	c95kHnbuopAiW25qcwNj3pzN2JBi8+P3nAWawCudsAlPvxWAoWKO88pxwc8RkwA==
X-Gm-Gg: ASbGncuZ81sDGaFTi3EBPg2zAUkwqXGvFAIbAYZAwD93URLNo2bGAasFd5cXoKDlGjF
	TMW17SurloA3CAUDBs/J2gE7nlhPn6arH0U/66OwZQuLifR+Sb4OXnw/Hngnc/txnhPD8DZbXHm
	pnmZF5Wso99t0wdWD4Ea9UUvj7qiGsdBE/YmQWt1CP2Gx9IHE6bUt4N6VYmhOZSMWfJLlrktw/A
	HK+e7ceQHQcTi9t2c2bwUGiiwLakUDvhKG3xo/UaN2EhrBRh2Wk+a128Iy50/fNo8cK86xhy4I7
	f2v3gZUOoGSrHuqsaYIUj37AgEw5jZmCkZ5fUcUyffngBFE=
X-Received: by 2002:a05:6214:2389:b0:6e8:9dc9:1c03 with SMTP id 6a1803df08f44-6f2c455f647mr266864926d6.21.1745309679568;
        Tue, 22 Apr 2025 01:14:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh7mV0lu7cSmrkggZa5z2iEZSt0bCAgogcfBDnHn42XGA3T2tFvXOd7XWyXffZ1hypZoufgQ==
X-Received: by 2002:a05:6214:2389:b0:6e8:9dc9:1c03 with SMTP id 6a1803df08f44-6f2c455f647mr266864516d6.21.1745309679075;
        Tue, 22 Apr 2025 01:14:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433354sm14580547f8f.32.2025.04.22.01.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:14:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: vfe: Avoid unnecessary RUP command
Date: Tue, 22 Apr 2025 10:14:36 +0200
Message-Id: <20250422081436.6535-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KMvInYL-wZrrqtht9CVLC-dn5OnIi1HS
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=68074ff0 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: KMvInYL-wZrrqtht9CVLC-dn5OnIi1HS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=916 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220061

Today, we submit a RUP command (reg_update) after queuing a new frame
buffer using vfe_wm_update. However, vfe_wm_update writes the buffer
address to a FIFO register which does not require a subsequent RUP
command, as this register is not double-buffered like other config
or control shadow registers.

This results in the capture process generating twice the expected number
of interrupts, with one RUP done and one BUF done interrupt for each frame.

We can relax the interrupt pressure and VFE load by removing this extra
RUP command, which is only necessary when initializing or reconfiguring
the VFE.

Note: this has only been tested with vfe-340/qcm2290, the assumption is
that the other VFEs behave similarly.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c575c9767492..32de1d104fe7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -481,7 +481,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -546,9 +545,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
 	}
 
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -582,7 +582,6 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}
-- 
2.34.1


