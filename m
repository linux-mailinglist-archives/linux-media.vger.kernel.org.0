Return-Path: <linux-media+bounces-24241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E1A01297
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 06:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B74227A1E3A
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 05:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85EE14B965;
	Sat,  4 Jan 2025 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DNivNb62"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24517C69;
	Sat,  4 Jan 2025 05:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735969324; cv=none; b=iKR5k6EUD4vRdCyQUatUvYB8JOJcTbScOOOuY/47EVRqhi7ONpM6GhffUrsRpBjSPTpgH2NPZ1vxnXCd7Shr26c+DoBzq2YYTyw8TnA0Lt2c6sNrhtH9PxAeEfu+xb2hi1Yf1sN+sAc+nK0wug/nyXpE5uWGiawjuSn9lQcdxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735969324; c=relaxed/simple;
	bh=0rpW147ExNkqh3cPmgcWxrbDXwzM+JtC0t0ZCo9Gb+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZmvoLXnJUpXPUWVmbxVPixW/ppONKuq7F9OJOoj8md3tpxi2jvYSgAuG0/pnURSiLTunA1qiG6ihWnOSfq/Rwy/RXmfTe+6ij0GEDJ01epqeFz0xrTDWyFWi1s+d5Nr1Qy+ma47OhttgWZcb7okw3tmxs4qCf/Ie0xud8fKFLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DNivNb62; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50446iDd006091;
	Sat, 4 Jan 2025 05:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bx2nBaRMDMCxvJqlBwdkzoEpvjyrTB6xzop8ORn9mLE=; b=DNivNb62Gmn3rz+B
	6US6wqUnE9hZ+9ql6Xr4syhHsAMbqg2H5vnvqWM2nsdNclJQqg4RXCQaGFgfuT+w
	sBqjLo/EB0dH5T0rYX4c1dAoQyZ0S+7BMEurQs8jTjkIgJPI5XAYXW1AgZyWwX4E
	iiGQrd9kCHqOtkh2qPk0xrieqBLBWzcNniPTVCxBixofvIIp1LK8Su5t8WKWJpVI
	np0Hrl0MKASD2RtgX+ETQ4ht/vMydwubuuC2bWQelTLZmqI43Y7Z3XOaMIHnKS8p
	dALbBXOU9iE7Ss62dTxnteml404Rv5l9JwdjoA0nmBZIjTIx8xfkhjOTjCDIgn6X
	tafzog==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xvjwg780-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 05:41:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5045fuTI015127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 Jan 2025 05:41:56 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 21:41:53 -0800
From: Vedang Nagar <quic_vnagar@quicinc.com>
Date: Sat, 4 Jan 2025 11:11:36 +0530
Subject: [PATCH 1/2] media: venus: fix OOB read issue due to double read
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
In-Reply-To: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735969311; l=1239;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=0rpW147ExNkqh3cPmgcWxrbDXwzM+JtC0t0ZCo9Gb+U=;
 b=/xUuxY8tbnq0k3oUuUNkGSWYun54cgAZBZA0ZLnkV7h6tRXmONzrCfdwA4NmVz0Fn5lNxuxl4
 2Vjh9rIfJIqCaK4MLYpKjOzN91rbjnptW7GdPHwTkKNFBZv52cb54r7
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1FRlYnrz5SJGHau5Z4iuiwvts-5ItW7z
X-Proofpoint-ORIG-GUID: 1FRlYnrz5SJGHau5Z4iuiwvts-5ItW7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=697
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040046

During message queue read, the address is being read twice
from the shared memory. The first read is validated against
the size of the packet, however the second read is not
being validated. Therefore, it's possible for firmware to
modify the value to a bigger invalid value which can lead
to OOB read access issue while reading the packet.
Added fix to reupdate the size of the packet which was
read for the first time.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b91c2483670a2b11f4fd43f3206404..64cc9e916f53e5a9c82b1ff25c4475d622ebc321 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
 			memcpy(pkt, rd_ptr, len);
 			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
 		}
+		memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));
 	} else {
 		/* bad packet received, dropping */
 		new_rd_idx = qhdr->write_idx;

-- 
2.34.1


