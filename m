Return-Path: <linux-media+bounces-24506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F519A0749F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5E9167F71
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2227F216E1D;
	Thu,  9 Jan 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iz9fi8cy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC756216E02;
	Thu,  9 Jan 2025 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422026; cv=none; b=uSOV7HANmajRxMKmNLhsewXnQXzjpjPDVH7RMRKd98h9zXTpkRx8Jtyjaxg1Zj0Pe2IZ5TJCrPsmYFTSnBf+jeSDjvX/zvvLLzEbfSO32WwPvaBe8Ab6/tyaNtIiAmEkYdNE5hz6Xy6UvDae53wTYmQKZIStJ6kzXLrzZk2Pvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422026; c=relaxed/simple;
	bh=ZcSP1j4lkCbZorbN4ZTodorbFyXFCjX3EagyKMdMTAk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VD1l2ZLKz4O6Ih04zi3BvQ+KRK2qK4L69toF/LqxK0yN12Ks3zKELvinL9uvsa6FnAi0UNEX/BUmG35RVQMiF28TcP6O5twZURqKtN74vE7a0yBn81DSfp4XJEP/rorEIDumhL7I6U91oZCbvLhNtQB/TR7K0mZrHPFjOnZ5B3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iz9fi8cy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5095AWv8029722;
	Thu, 9 Jan 2025 11:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UycEyXLXNEG6VjFnAjAN7S
	AGIeHWTQZ4d0OiYmkVoVw=; b=iz9fi8cyC+kElhqaVpp13qzXQLgDNZm/WJ4HlC
	UfuoPU4NPurl/Kz9gTxm+3dCZsN5kW5swoUP7EPpK2Yxpa8VUbTlz6BE12YTEDm0
	EBSiCbAMgTMJC6TVo47IVisjvkNYhXodkjLwnFTdUyJt1aSapEigiAX3ILgu4lMW
	mA0IvVNxQ/0DjS6mHpkkMCjhX2E4EaFXZ9oXdypsGPgispfzy47PM9WGnJAH7qG0
	GoYsDgTIGM5Gr2ktJjcB2CUvHAsUUUTcWhoRPqqeN3S3ioLFR1l4Xak8wtfjBbHB
	ncKj/rg7/dbAA5vE88No+qKWvZxi7CMxUijHzCV/NlaufIqQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44282prvjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:26:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509BQpX3019478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 11:26:51 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 03:26:48 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH 0/2] media: iris: fix memory leak and improve driver
Date: Thu, 9 Jan 2025 16:56:39 +0530
Message-ID: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+yf2cC/yWNS27DMAxEr2JoXQaiLMsfFEXvUWQhUUzKhe1ES
 o0CQe4eJl4+cubN3VQuwtVMzd0U3qTKuijgR2PoNy5nBsnKxlnXWbQDSJEKucjGBU7yzwr9SJa
 J0NpstHcp/H5o7ee4c+Hrn6pv+9HMXGt8q6fmU80eHTq40jrDJpnXfWQbwQIP5Cik7K3Hb5WQL
 HTQ4NdrKcXKoDDLbWrCOKTALYY2xVMOyJj6jG3XO3bk3dj7SEPHZI6PxxM0GVcI9wAAAA==
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Joel Stanley <joel@jms.id.au>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736422008; l=2674;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ZcSP1j4lkCbZorbN4ZTodorbFyXFCjX3EagyKMdMTAk=;
 b=G+bt3qwxhQrtDg50sAzWG99xNZtn/TIEfWws/0N62ewNOH1tNV2f2OYrrB3GTXPFxPrVBRtwb
 v1Ov6LU8h1fC+uK2/iDeW+m+XOK0qudHKgMeJrQg5dvWLK5w86Gk85a
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aJXL2jz-0QwljAxHDBMrlgrO1iuxjXAT
X-Proofpoint-GUID: aJXL2jz-0QwljAxHDBMrlgrO1iuxjXAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=471
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090091

This series fixes a memory leak and improves the representation of 
dma mask to set upper bound of DMA address space.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Dikshita Agarwal (2):
      media: iris: represent dma_mask in more readable form
      media: iris: fix memory leak while freeing queue memory

 drivers/media/platform/qcom/iris/iris_hfi_queue.c       | 8 +++++---
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 3 ++-
 drivers/media/platform/qcom/iris/iris_platform_sm8550.c | 3 ++-
 3 files changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20250108-iris-driver-fixes-d79c0ecc100d
prerequisite-message-id: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
prerequisite-patch-id: bfa9c88ec537e21017d5c9da3ad30d885d2eb132
prerequisite-patch-id: bf37c5c6dc78b857caf6b544f6eb4000dee5dbaa
prerequisite-patch-id: 4d3c8665de2faf0ad912943e3a9c9b4ca76bfd7f
prerequisite-patch-id: 327454576fb8440c8521917a6582e4839b6088c3
prerequisite-patch-id: fc523bc1a4f188e1924ebc18885c4dcd9b375e89
prerequisite-patch-id: 1f837af2ed6c4925884b45e75828ff5b8ff057f0
prerequisite-patch-id: 18c77c70db79b933a13df15f98f681a931156aea
prerequisite-patch-id: 40168197cad291efe92bd5bf78e039475ed10ae8
prerequisite-patch-id: b164fd80f4dcfb46b314377e8a595ce654418578
prerequisite-patch-id: 271bf0ca62c46ff9b14db3c23196112c2f59256d
prerequisite-patch-id: 67b096b9d1362eacfad13470c20e8eca833bf53d
prerequisite-patch-id: 5c433b5a1407fda64de411ccdc723dc664319037
prerequisite-patch-id: 8011d3230e717a0af3c6084b786612ff57bc770a
prerequisite-patch-id: 6d6f8da843afa6d7159730838ab2ac6e800e9246
prerequisite-patch-id: aa428f34e6695451780ff6b1bf8bc2dfb95c7071
prerequisite-patch-id: c95c03b5085eaecafafcabf4d700247b3b00bd87
prerequisite-patch-id: e41b4e7438a3fe56ba75501a417dba49365ed393
prerequisite-patch-id: ff1531525f124cf59596b8ca80a58f31b85763d0
prerequisite-patch-id: f20122e51eeb3691706b7d0f63628a84efc11b34
prerequisite-patch-id: e397711e5044a5e830f7f46d3683b6c234c23dda
prerequisite-patch-id: 99ad3fb3466a939438edf93e1591008a51004540
prerequisite-patch-id: f96d6202f4ba4194b9a185243e0659d2bb8ec6e0
prerequisite-patch-id: 71b8db4f106aa9322575573174c63d8d9eab20a1
prerequisite-patch-id: 532f7998ec08c4cc01c69dcfd050ad854d8bdbad
prerequisite-patch-id: cc80eabbf33df03053869cd47912efbd2c67d19a
prerequisite-patch-id: 837959096e4fb7aa2b9d5afbd847aa0a4399ea87
prerequisite-patch-id: f78814e6508d3439e1d77d82af471b839e03d1ec
prerequisite-patch-id: 5a664eca073472e80da8f257cb030740e009737e

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


