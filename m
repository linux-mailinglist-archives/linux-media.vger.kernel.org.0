Return-Path: <linux-media+bounces-20895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB009BC862
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 286B41F2215F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A2E1CF7DD;
	Tue,  5 Nov 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AtI0hVUC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFE51C4A18;
	Tue,  5 Nov 2024 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796944; cv=none; b=TCthl7wRUIMdkk4RzgsXyj//9LeeNXYE6vgFQmMUs/fCDGMTkAbZMvl8bXjvK8Pzh+1MPgBC6x71yWaPum93tbCNgBLktnApjUuxuSIu5/eWi2AJzmqxaeMH65YW+H4fkjQRwxqxpyWlfm5jlGQ0GlWHN5iS+6waArB6PtIBsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796944; c=relaxed/simple;
	bh=ua8pvqcIN/bZl62wHhay/Xzk9366GkXwCpzGSn0Di1s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CV9e/LNEDj8rt7Y7oEHNIOqUq1JPq92swFxEjIlfkiPxKLRBwEPR7gP/YpEwagG3SrPTA9UiXtGzHlYHdODXZvHOS9pty6bmbFOkeSwwve2ktyNF5AEF9NvqePPJLAqKaGa/yXe198pef/9hP6ZFWV0Lal8A/bVVqAFEGqCUB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AtI0hVUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIiqX012116;
	Tue, 5 Nov 2024 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d18rLM6XakzduzpK2VtK7F
	xAuIzXZYiwAnmo1UiY4WY=; b=AtI0hVUCECfxrcoCCWLxbZVN9rsBcgUggJYdK0
	HCJQqim/0SZB6oDh1HhkXksqwYO/g480I01mLniVvPcrEdy+JHdlT1aHKli0TE9O
	d6fJMWTKn1IwJ2pBqXXEp5jF6pxe21tWTuBHjveIBWlplnxUxNfH9h8bUqsMCTMw
	v3fCJB9+0h5Bh1C2HO21Wr4ox0UiXMVLEA/DSTwqCBR7KPz/2nogc7lz5o1Eo+c9
	VWZHQTB5Hi/D/rnFEJQD2V0bm+3tMTl2CmvyQQa6Dh1sPsyx3fI3lWmO1XR0rXst
	UjM4c2APW8732Jn5e98bPM5cdRTlR4I0it2iVOZ38g7ov2zA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11y07x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:55:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A58tbIi010038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:55:37 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 00:55:34 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 0/4] Venus driver fixes to avoid possible OOB accesses
Date: Tue, 5 Nov 2024 14:24:53 +0530
Message-ID: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3dKWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwMT3bLUvNLi+Pz8JF0DYxPjJEMT4xQzwxQloPqCotS0zAqwWdGxtbU
 AqmBmL1sAAAA=
X-Change-ID: 20241104-venus_oob-0343b143d61d
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730796934; l=973;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=ua8pvqcIN/bZl62wHhay/Xzk9366GkXwCpzGSn0Di1s=;
 b=ykZVRd6+TLXIenHdx/GITCSeeq9scmh0cZBtVBnBlSkSZiWJHJz5TsVJn0v3Oz1afqW6ktfJk
 QMKZTQqsikcC/fmJtPbIyJUujWxjhOTlM+PZTR7u9bLMc294q0NIN9K
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0hRzKNNXwILgoHQwPxSDvg4QMVmqHC9-
X-Proofpoint-ORIG-GUID: 0hRzKNNXwILgoHQwPxSDvg4QMVmqHC9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=682
 mlxscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050063

This series primarily adds check at relevant places in venus driver where there
are possible OOB accesses due to unexpected payload from venus firmware. The
patches describes the specific OOB possibility.

Please review and share your feedback.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (4):
      media: venus: hfi_parser: add check to avoid out of bound access
      media: venus: hfi_parser: avoid OOB access beyond payload word count
      media: venus: hfi: add check to handle incorrect queue size
      media: venus: hfi: add a check to handle OOB in sfr region

 drivers/media/platform/qcom/venus/hfi_parser.c |  6 +++++-
 drivers/media/platform/qcom/venus/hfi_venus.c  | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241104-venus_oob-0343b143d61d

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


